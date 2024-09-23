@implementation WatchSportsEventIntentHandler

- (_TtC16SiriVideoIntents29WatchSportsEventIntentHandler)init
{
  return (_TtC16SiriVideoIntents29WatchSportsEventIntentHandler *)WatchSportsEventIntentHandler.init()();
}

- (void)confirmWatchSportsEvent:(WatchSportsEventIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E309770, (uint64_t)&unk_255447B60);
}

- (void)handleWatchSportsEvent:(WatchSportsEventIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E309748, (uint64_t)&unk_255447B50);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents29WatchSportsEventIntentHandler_utsProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents29WatchSportsEventIntentHandler_siriRemembersProvider);
}

@end
