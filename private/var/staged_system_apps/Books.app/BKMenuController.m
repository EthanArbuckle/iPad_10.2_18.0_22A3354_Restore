@implementation BKMenuController

- (void)updateKeyWindow
{
  BKMenuController *v2;

  v2 = self;
  sub_100009804();

}

- (BKMenuController)initWithAppLaunchCoordinator:(id)a3 sceneManager:(id)a4
{
  swift_unknownObjectRetain(a3);
  return (BKMenuController *)sub_100015760(a3, a4);
}

- (void)buildWithBuilder:(id)a3
{
  BKMenuController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100525EA0(a3);

  swift_unknownObjectRelease(a3);
}

- (void)buildInternalWithBuilder:(id)a3
{
  BKMenuController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1005267E4(a3);
  swift_unknownObjectRelease(a3);

}

- (BKMenuController)init
{
  BKMenuController *result;

  result = (BKMenuController *)_swift_stdlib_reportUnimplementedInitializer("Books.MenuController", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR___BKMenuController_appLaunchCoordinator));

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_observeSelectedItemTask));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_observeKeyWindowTask));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_observeRecentBooksProviderTask));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_observeUserCollectionsTask));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_retryKeyWindowTypeTask));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKMenuController_keyWindow);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_recentlyOpenedAssets));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKMenuController_userCollections));
}

@end
