@implementation QuickLookSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Files22QuickLookSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1003B2438(v8, v9, v10);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC5Files22QuickLookSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1003B49B0(v4);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC5Files22QuickLookSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003B693C(v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Files22QuickLookSceneDelegate *v11;

  v7 = sub_10004F2F0(0, &qword_100651EE0, UIOpenURLContext_ptr);
  v8 = sub_1000835B4(&qword_100647C80, &qword_100651EE0, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_1003B6B84(v9);

  swift_bridgeObjectRelease(v9);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  _TtC5Files22QuickLookSceneDelegate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1003B601C();

  return v6;
}

- (_TtC5Files22QuickLookSceneDelegate)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_viewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_documentManager) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookPreviewItemObserver) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_isSharedScene) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for QuickLookSceneDelegate(0);
  return -[QuickLookSceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookPreviewItemObserver));
  sub_100157D6C((uint64_t)self + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookURL);
}

@end
