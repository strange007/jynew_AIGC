if InTeam(11) == true then goto label0 end;
    Talk(60, "闲杂人等请回避！");
    do return end;
::label0::
    Talk(60, "少侠，是否查到莫掌门的死因了？");
    Talk(0, "王远王大将军！你藏得好深！");
    Talk(60, "此话怎讲？");
    Talk(0, "现在莫穿林已死，刘灯剑、萨擎苍武功已废，寿眉大师隐退，四大掌门都清除掉了，你的目的达到了。");
    Talk(60, "大胆！你在胡说什么！");
    Talk(0, "这些年来，渡城抵御蓝隼国的侵袭全靠四大门派的弟子们，你作为一个将军，只知道给门派发一些微博赏赐，不敢问朝廷一兵一卒，百姓们议论纷纷。");
    Talk(60, "我这次选盟主，不就是要加赏赐吗！");
    Talk(0, "选盟主这事儿根本就是个幌子，你怕四大门派喧宾夺主，抢了你这个将军的风头，你害得四大门派自相残杀，你才是害死莫掌门的罪魁祸首！");
    Talk(60, "笑话！我王远会是这种格局吗，我怎么会害莫穿林。");
    Talk(0, "这个十字针是你的吧？那天晚上你趁莫穿林喝了酒，偷偷跟到野狼谷，用这个暗算了他！");
    Talk(60, "来人！给我剐了这个口吐狂言的毛贼！");
    if TryBattle(60) == true then goto label1 end;
        Dead();
        do return end;
::label::
        LightScence();
        Talk(60, "外患未除，内忧又扰，这是天要亡我也！");
        Talk(0, "这都是你自己一手造成的！");
        Talk(60, "一手造成，所以你就砍断我一只手？");
        Talk(0, "不杀你已经是最大的客气了！");
        Talk(60, "我这个将军，确实做得不到位，为了证明自己的能力，没有如实向朝廷反馈渡城形势的严峻，也没有妥善处理好与门派的关系。");
        Talk(0, "大仇已报！你好自为之。");
        Talk(60, "大仇？我们的仇敌，是蓝隼国啊！");
        AddItem(168, 1);
        AddItem(169, 1);
        ModifyEvent(-2, -2, -2, 67, -1, -1, -1, -2, -2, -2, -2, -2, -2);--将军府，王远，E
        ModifyEvent(-2, 1, -2, 63, -1, -1, -1, -2, -2, -2, -2, -2, -2);--将军府，守门弟子，C
        ModifyEvent(5, 5, -2, -2, 59, -1, -1, -2, -2, -2, -2, -2, -2);--怡麟楼，万霜霜，C
        ModifyEvent(8, 6, -2, -2, 0, -1, -1, -2, -2, -2, -2, -2, -2);--鸽子楼蓝色门开条件之一
        -- ModifyEvent(8, 1, -2, -2, -1, -1, -1, -2, -2, -2, -2, -2, -2);--
        -- jyx2_ReplaceSceneObject("8", "NPC/岳不群", "");--鸽子楼，徐谦，J
        ModifyEvent(10, 2, -2, -2, 0, -1, -1, -2, -2, -2, -2, -2, -2);--滨湖茅庐，秦婆婆，C
do return end;
