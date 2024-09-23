@implementation SceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC6Health13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000BECC();

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC6Health13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001292C(0xD000000000000018, 0x80000001000BC530);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void **v8;
  id v9;
  id v10;
  _TtC6Health13SceneDelegate *v11;

  v8 = (void **)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000115B4(v8, v9, v10);

}

- (_TtC6Health13SceneDelegate)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate____lazy_storage___introFlowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_deepLinkHandler) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_window) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC6Health13SceneDelegate_rootViewController;
  v4 = (objc_class *)type metadata accessor for SceneDelegate();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[SceneDelegate init](&v6, "init");
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6Health13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC6Health13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001292C(0xD000000000000019, 0x80000001000BC510);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC6Health13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001292C(0xD00000000000001BLL, 0x80000001000BC4D0);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6Health13SceneDelegate *v11;

  v7 = sub_100006D10(0, &qword_1000EF0F0, UIOpenURLContext_ptr);
  v8 = sub_1000127B0(&qword_1000EF0F8, &qword_1000EF0F0, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100007808(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC6Health13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10006B784(v7);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  _TtC6Health13SceneDelegate *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10006A9D8(v4);

  return v6;
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void (**v8)(void *, _QWORD);
  id v9;
  id v10;
  char v11;
  _TtC6Health13SceneDelegate *v12;

  v8 = (void (**)(void *, _QWORD))_Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v12 = self;
  v11 = sub_10006A5B8(v10);
  v8[2](v8, v11 & 1);
  _Block_release(v8);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC6Health13SceneDelegate____lazy_storage___introFlowManager));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_deepLinkHandler));

}

@end
