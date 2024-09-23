@implementation SceneDelegate

- (void)scene:(id)a3 restoreInteractionStateWithUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC8Podcasts13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v6, "setUserActivity:", v7);
  sub_10001CB30(v7);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8Podcasts13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000242E4(v8, v10);

}

- (_TtC8Podcasts13SceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_1000209FC(self, (uint64_t)a2, a3, (SEL *)&selRef_applicationWillEnterForeground_);
}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_1000209FC(self, (uint64_t)a2, a3, (SEL *)&selRef_applicationDidBecomeActive_);
}

- (void)sceneWillResignActive:(id)a3
{
  sub_1000209FC(self, (uint64_t)a2, a3, (SEL *)&selRef_applicationWillResignActive_);
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_1000209FC(self, (uint64_t)a2, a3, (SEL *)&selRef_applicationDidEnterBackground_);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8Podcasts13SceneDelegate *v11;

  v7 = sub_100005EC8(0, &qword_10055B978, UIOpenURLContext_ptr);
  v8 = sub_100024C10((unint64_t *)&unk_10055B980, &qword_10055B978, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10023D05C(v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC8Podcasts13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10001CB30(v7);

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Podcasts13SceneDelegate *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_10023D954(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8Podcasts13SceneDelegate *v12;
  id v13;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = a3;
  v13 = a5;
  v12 = self;
  sub_10023DB18(v8, v10, (uint64_t)v13);

  swift_bridgeObjectRelease(v10);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8Podcasts13SceneDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_10023DD10(v10, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  void *v5;
  id v6;
  _TtC8Podcasts13SceneDelegate *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self(UIApplication);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "sharedApplication");
  objc_msgSend(v8, "ignoreSnapshotOnNextApplicationLaunch");

  v9 = objc_msgSend(v6, "userActivity");
  return v9;
}

@end
