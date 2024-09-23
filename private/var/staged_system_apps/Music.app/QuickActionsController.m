@implementation QuickActionsController

- (_TtC5Music22QuickActionsController)init
{
  return (_TtC5Music22QuickActionsController *)sub_100346278();
}

- (void).cxx_destruct
{

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music22QuickActionsController_nowPlayingSubscription, (uint64_t *)&unk_1011A3850);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music22QuickActionsController_bindings));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music22QuickActionsController_playMyStationShortcutItem));
}

@end
