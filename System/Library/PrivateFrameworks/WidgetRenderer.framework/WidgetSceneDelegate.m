@implementation WidgetSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)dealloc
{
  _QWORD *v3;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v4;
  uint64_t v5;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_confirmationActionSubscribers);
  swift_beginAccess();
  v4 = self;
  v5 = swift_bridgeObjectRetain();
  sub_24A4FD5F8(v5);
  swift_bridgeObjectRelease();
  *v3 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRelease();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for WidgetSceneDelegate();
  -[WidgetSceneDelegate dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_foregroundScene));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer19WidgetSceneDelegate_sceneSettingsDiffInspector));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_24A50CEF8(v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_24A5041D0(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_24A504230(v4);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_24A504518(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_24A5048D4(v4);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_24A505158(v4);

}

- (void)applicationDidReceiveMemoryWarning
{
  _TtC14WidgetRenderer19WidgetSceneDelegate *v2;

  v2 = self;
  sub_24A50584C();

}

- (NSString)description
{
  _TtC14WidgetRenderer19WidgetSceneDelegate *v2;
  void *v3;

  v2 = self;
  sub_24A505EC4();

  v3 = (void *)sub_24A559310();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  sub_24A50EAE0(a4, a5, a6, a7);

}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC14WidgetRenderer19WidgetSceneDelegate *v14;
  void *v15;

  sub_24A50F674(0, (unint64_t *)&unk_2544D46D0);
  sub_24A50F22C((unint64_t *)&unk_2544D46E0, (unint64_t *)&unk_2544D46D0, 0x24BE0BD80, MEMORY[0x24BEE5BD8]);
  v10 = sub_24A559418();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_24A50ED50(v10, v12);

  swift_bridgeObjectRelease();
  v15 = (void *)sub_24A55940C();
  swift_bridgeObjectRelease();
  return v15;
}

- (_TtC14WidgetRenderer19WidgetSceneDelegate)init
{
  return (_TtC14WidgetRenderer19WidgetSceneDelegate *)sub_24A50C488();
}

@end
