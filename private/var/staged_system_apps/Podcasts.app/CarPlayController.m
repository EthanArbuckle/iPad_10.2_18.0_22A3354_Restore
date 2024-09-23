@implementation CarPlayController

- (CarPlayController)init
{
  return (CarPlayController *)CarPlayController.init()();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CarPlayController_graph));

  sub_100007A28((uint64_t)self + OBJC_IVAR___CarPlayController_nowPlayingController, &qword_1005562B8);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CarPlayController_syncController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CarPlayController_subscriptions));
  sub_100007A28((uint64_t)self + OBJC_IVAR___CarPlayController_activeTemplateProvider, &qword_100556418);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CarPlayController_activeTemplateItemsSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___CarPlayController_activeTemplateDidSelectItemSubscription));

}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  CarPlayController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001A4A24(v7);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  CarPlayController *v5;

  v4 = a3;
  v5 = self;
  _s8Podcasts17CarPlayControllerC20sceneDidBecomeActiveyySo7UISceneCF_0();

}

- (void)templateWillAppear:(id)a3 animated:(BOOL)a4
{
  id v5;
  CarPlayController *v6;

  v5 = a3;
  v6 = self;
  _s8Podcasts17CarPlayControllerC18templateWillAppear_8animatedySo10CPTemplateC_SbtF_0(v5);

}

- (void)proxyShouldShowDialogForReason:(int64_t)a3 podcastTitle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  CarPlayController *v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = self;
  CarPlayController.proxyShouldShowDialog(for:podcastTitle:)(a3);

  swift_bridgeObjectRelease(v7);
}

@end
