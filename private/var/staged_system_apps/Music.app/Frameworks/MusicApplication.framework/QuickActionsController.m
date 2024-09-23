@implementation QuickActionsController

- (_TtC16MusicApplication22QuickActionsController)init
{
  return (_TtC16MusicApplication22QuickActionsController *)sub_1BCFA8();
}

- (void).cxx_destruct
{

  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication22QuickActionsController_nowPlayingSubscription, (uint64_t *)&unk_14C06B0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22QuickActionsController_bindings));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication22QuickActionsController_searchShortcutItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication22QuickActionsController_playMyStationShortcutItem));
}

@end
