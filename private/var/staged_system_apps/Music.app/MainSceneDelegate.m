@implementation MainSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Music17MainSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Music17MainSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10045C954((unint64_t)v8, v9, v10);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC5Music17MainSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1004623A4(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC5Music17MainSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100462CF8(v4);

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v9;
  uint64_t v10;
  id v11;
  _TtC5Music17MainSceneDelegate *v12;
  id v13;

  v9 = a3;
  swift_unknownObjectRetain(a4, v10);
  v11 = a6;
  v12 = self;
  v13 = objc_msgSend(v9, "traitCollection");
  sub_1004618D4(v13, v11);

  swift_unknownObjectRelease(a4);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC5Music17MainSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10045FF08(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC5Music17MainSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100460164(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC5Music17MainSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1004630AC(v4);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC5Music17MainSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100460A70(v6, v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music17MainSceneDelegate *v11;

  v7 = sub_10004A07C(0, &qword_1011B4DE0, UIOpenURLContext_ptr);
  v8 = sub_1000EA1BC(&qword_1011C8A70, &qword_1011B4DE0, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100461224(v10, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC5Music17MainSceneDelegate *v13;
  char v14;
  char v15;
  id v16;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1010C6A88, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for LaunchOptions(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = a3;
  v16 = a4;
  v12 = v11;
  v13 = self;
  swift_retain();
  if (sub_1002743BC(v16, v12, (uint64_t)sub_1001483E4, v9))
  {
    sub_100275D54();
    v15 = v14;
    swift_release();
    if ((v15 & 1) != 0)
      *((_BYTE *)&v13->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_scriptedApplicationActivationMethod) = 1;
  }

  swift_release();
}

- (_TtC5Music17MainSceneDelegate)init
{
  return (_TtC5Music17MainSceneDelegate *)sub_100461EA4();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_environmentManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_snapshotter));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_interfaceContext));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_observers));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music17MainSceneDelegate_signpostLoadSceneIntervalState));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music17MainSceneDelegate_signpostDidBecomeActiveIntervalState));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music17MainSceneDelegate____lazy_storage___tabBarController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music17MainSceneDelegate____lazy_storage___splitViewController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music17MainSceneDelegate_privacyAcknowledgementObserver));
}

@end
