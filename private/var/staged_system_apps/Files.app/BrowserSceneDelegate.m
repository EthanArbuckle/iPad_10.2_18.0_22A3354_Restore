@implementation BrowserSceneDelegate

- (_TtC5Files20BrowserSceneDelegate)init
{
  return (_TtC5Files20BrowserSceneDelegate *)sub_1000AEFA0();
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Files20BrowserSceneDelegate_window));
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Files20BrowserSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100024B28(v8, v9, v10);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC5Files20BrowserSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100204D9C(v4);

}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files20BrowserSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files20BrowserSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC5Files20BrowserSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100204514(v4);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC5Files20BrowserSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002190B8(v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Files20BrowserSceneDelegate *v11;

  v7 = sub_10004F2F0(0, &qword_100651EE0, UIOpenURLContext_ptr);
  v8 = sub_1000835B4(&qword_100647C80, &qword_100651EE0, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100219F84(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC5Files20BrowserSceneDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_10021A214(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC5Files20BrowserSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10021A49C();

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  _TtC5Files20BrowserSceneDelegate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1002172B8();

  return v6;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->window[OBJC_IVAR____TtC5Files20BrowserSceneDelegate_newWindowActivityIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->window[OBJC_IVAR____TtC5Files20BrowserSceneDelegate_stateRestorationActivityIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->window[OBJC_IVAR____TtC5Files20BrowserSceneDelegate_stateRestorationURLKey]);
}

@end
