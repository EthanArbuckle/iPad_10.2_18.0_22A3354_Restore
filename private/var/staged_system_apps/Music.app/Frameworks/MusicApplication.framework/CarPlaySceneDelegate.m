@implementation CarPlaySceneDelegate

- (_TtC16MusicApplication20CarPlaySceneDelegate)init
{
  return (_TtC16MusicApplication20CarPlaySceneDelegate *)sub_6058D4();
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication20CarPlaySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_6068FC(v8);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication20CarPlaySceneDelegate *v12;

  v7 = sub_4E684(0, &qword_14AD318, UIOpenURLContext_ptr);
  v8 = sub_950D0((unint64_t *)&unk_14AD320, &qword_14AD318, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_606DB8(v9);

  swift_bridgeObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC16MusicApplication20CarPlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_6076F4();

}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v5;
  id v6;
  _TtC16MusicApplication20CarPlaySceneDelegate *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self(MPCloudController);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "sharedCloudController");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "becomeActive");

  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_accountSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_tabsSubscription));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_remoteRadioController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_allowsRadioContentNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_userSubscriptionStateNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication20CarPlaySceneDelegate_subscriptionCapabilitiesNotificationObserver));
}

- (void)sceneDidEnterBackground:
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v0 = *BackgroundRefreshController.shared.unsafeMutableAddressor();
  swift_retain(v0);
  BackgroundRefreshController.scheduleAllTasks()();
  swift_release(v0);
  v1 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v2 = objc_msgSend(v1, "connectedScenes");
  v3 = sub_4E684(0, (unint64_t *)&qword_14C5D80, UIScene_ptr);
  v4 = sub_950D0((unint64_t *)&qword_14AD310, (unint64_t *)&qword_14C5D80, UIScene_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v2, v3, v4);

  sub_6054A0(v5);
  v7 = v6;

  swift_bridgeObjectRelease();
  if (!v7)
  {
    v8 = objc_msgSend((id)objc_opt_self(MPCloudController), "sharedCloudController");
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "resignActive");

    }
    else
    {
      __break(1u);
    }
  }
}

@end
