@implementation AppSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication16AppSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_51DC8(v8, v9, v10);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicApplication16AppSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_532C8(v6, v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication16AppSceneDelegate *v12;

  v7 = sub_4E684(0, &qword_14AD318, UIOpenURLContext_ptr);
  v8 = sub_55D8C((unint64_t *)&unk_14AD320, &qword_14AD318, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_53AC0(v10, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC16MusicApplication16AppSceneDelegate *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  id v17;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_13418E0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for LaunchOptions(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = a3;
  v17 = a4;
  v12 = self;
  swift_retain(v9);
  v13 = sub_B3664C(v17, v11, (uint64_t)sub_562C8, v9);
  if (v13)
  {
    v14 = v13;
    sub_B2C48C();
    v16 = v15;
    swift_release(v14);
    if ((v16 & 1) != 0)
      *((_BYTE *)&v12->super.isa
      + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_scriptedApplicationActivationMethod) = 1;
  }

  swift_release(v9);
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v9;
  id v10;
  _TtC16MusicApplication16AppSceneDelegate *v11;
  id v12;

  v9 = a3;
  swift_unknownObjectRetain(a4);
  v10 = a6;
  v11 = self;
  v12 = objc_msgSend(v9, "traitCollection");
  sub_5518C(v12, v10);

  swift_unknownObjectRelease(a4);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC16MusicApplication16AppSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_542D8(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC16MusicApplication16AppSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_560C4(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16MusicApplication16AppSceneDelegate *v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  void (*v10)(void (*)(id *), uint64_t);
  _QWORD *v11;
  void *v12;
  void (*v13)(void (*)(id *), _QWORD);
  id v14;

  v4 = qword_14AB000;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_14AB000, sub_399F54);
  v7 = JSBridge.shared.unsafeMutableAddressor();
  v8 = (_QWORD *)*v7;
  v9 = swift_allocObject(&unk_1341868, 17, 7);
  *(_BYTE *)(v9 + 16) = 2;
  v10 = *(void (**)(void (*)(id *), uint64_t))&stru_B8.segname[(swift_isaMask & *v8) + 16];
  v11 = v8;
  v10(sub_560BC, v9);

  swift_release(v9);
  v12 = (void *)*v7;
  v13 = *(void (**)(void (*)(id *), _QWORD))&stru_B8.segname[(swift_isaMask & *(_QWORD *)*v7) + 16];
  v14 = v12;
  v13(sub_545AC, 0);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC16MusicApplication16AppSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_54700(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC16MusicApplication16AppSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_549D8(v4);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  return objc_msgSend(a3, "userActivity");
}

- (_TtC16MusicApplication16AppSceneDelegate)init
{
  return (_TtC16MusicApplication16AppSceneDelegate *)sub_55730();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_keyboardShortcutsManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_interfaceContext));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_snapshotter));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate____lazy_storage___tabBarController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate____lazy_storage___splitViewController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication16AppSceneDelegate_privacyAcknowledgementObserver));
}

@end
