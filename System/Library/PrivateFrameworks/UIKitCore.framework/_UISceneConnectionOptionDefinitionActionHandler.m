@implementation _UISceneConnectionOptionDefinitionActionHandler

- (_UISceneConnectionOptionDefinitionActionHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISceneConnectionOptionDefinitionActionHandler;
  return -[_UISceneConnectionOptionDefinitionActionHandler init](&v3, sel_init);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _UISceneConnectionOptionDefinitionActionHandler *v14;
  void *v15;

  sub_1851F9080(0, &qword_1ECD74F20);
  sub_18567E80C();
  v10 = sub_1865077EC();
  v11 = a5;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_185766B00(v10, v11);

  swift_bridgeObjectRelease();
  v15 = (void *)sub_1865077E0();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _UISceneConnectionOptionDefinitionActionHandler *v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  sub_1851F9080(0, &qword_1ECD74F20);
  sub_18567E80C();
  v10 = sub_1865077EC();
  v11 = objc_allocWithZone((Class)_UISceneConnectionOptionsContext);
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self;
  v16 = objc_msgSend(v11, sel_init);
  v17 = v13;
  v18 = v16;
  sub_185767130(v10, (uint64_t)v17, (uint64_t)v18);

  v19 = (void *)sub_1865077E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setUnprocessedActions_, v19);

  swift_bridgeObjectRelease();
  return v18;
}

@end
