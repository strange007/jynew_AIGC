﻿using Jyx2;
using Jyx2.InputCore.UI;
using Jyx2.Util;
using Rewired;
using Sirenix.OdinInspector;
using System;
using System.Collections.Generic;
using UnityEngine;

namespace Jyx2.InputCore
{
    public class InputContextManager : Singleton<InputContextManager>
    {
        private List<IJyx2_InputContext> m_Contexts = new List<IJyx2_InputContext>();
        

        public IJyx2_InputContext CurrentContext
        {
            get
            {
                if (m_Contexts.Count > 0)
                    return m_Contexts[m_Contexts.Count - 1];
                return null;
            }
        }

        private bool IsLoading => Jyx2_UIManager.Instance.IsUIOpen(nameof(LoadingPanel));

        public override void Init()
        {
            base.Init();
            Jyx2_Input.OnControllerChange += OnControllerChange;
        }

        public override void DeInit()
        {
            base.DeInit();
            m_Contexts.Clear();
            Jyx2_Input.OnControllerChange -= OnControllerChange;
        }

        private void OnControllerChange(Controller lastActiveController)
        {
            if (lastActiveController == null)
                return;
            if(lastActiveController.type != ControllerType.Keyboard
                && lastActiveController.type == ControllerType.Joystick)
            {
                return;
            }
            if (CurrentContext is Jyx2Input_UIContext uiContext && uiContext.NoValidSelect)
            {
                uiContext.TrySelectMyUIObject();
            }
        }


        public void AddInputContext(IJyx2_InputContext newContext)
        {
            if (newContext == null)
                return;
            if (m_Contexts.Contains(newContext))
            {
                Debug.LogError("Try add duplicate context:" + newContext);
                return;
            }

            TryStoreLastSelectObject(CurrentContext);

            m_Contexts.Add(newContext);
            
            if (newContext is Jyx2Input_UIContext uiContext)
            {
                uiContext.TrySelectMyUIObject();
            }
        }

        public void RemoveInputContext(IJyx2_InputContext inputContext)
        {
            if (inputContext == null)
                return;

            TryStoreLastSelectObject(inputContext);

            m_Contexts.Remove(inputContext);

            TrySelectCurrentContextUIObject();
        }
        
        private void TryStoreLastSelectObject(IJyx2_InputContext contextToStore)
        {
            if (CurrentContext == contextToStore && contextToStore is Jyx2Input_UIContext uiContext)
            {
                uiContext.TryStoreLastSelect();
            }
        }
        

        private void TrySelectCurrentContextUIObject()
        {
            if (m_Contexts.Count > 0 && CurrentContext is Jyx2Input_UIContext newUIContext)
            {
                newUIContext.TrySelectMyUIObject();
            }
        }


        public void Update()
        {
            if (IsLoading)
                return;
            Jyx2_Input.OnUpdate();
            if (CurrentContext != null && CurrentContext.CanUpdate)
            {
                CurrentContext.OnUpdate();
            }
        }
    }
}
