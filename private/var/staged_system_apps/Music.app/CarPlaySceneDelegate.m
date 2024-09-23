@implementation CarPlaySceneDelegate

- (_TtC5Music20CarPlaySceneDelegate)init
{
  return (_TtC5Music20CarPlaySceneDelegate *)sub_1007AD508();
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Music20CarPlaySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1007AE520(v8);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music20CarPlaySceneDelegate *v11;

  v7 = sub_10004A07C(0, &qword_1011B4DE0, UIOpenURLContext_ptr);
  v8 = sub_1000EA1BC(&qword_1011C8A70, &qword_1011B4DE0, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_1007AE710(v9);

  swift_bridgeObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC5Music20CarPlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1007AF020();

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC5Music20CarPlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1007AF0C8(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC5Music20CarPlaySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1007AF2C8(v4);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_accountSubscription));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_tabsSubscription));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_allowsRadioContentNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_userSubscriptionStateNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_subscriptionCapabilitiesNotificationObserver));
}

@end
