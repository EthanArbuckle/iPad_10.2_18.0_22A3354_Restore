@implementation AddToWatchListIntentHandler

- (_TtC16SiriVideoIntents27AddToWatchListIntentHandler)init
{
  return (_TtC16SiriVideoIntents27AddToWatchListIntentHandler *)sub_21E9C1EC0();
}

- (void)resolveContentForAddToWatchList:(AddToWatchListIntent *)a3 withCompletion:(id)a4
{
  sub_21E9C3EF8(self, (int)a2, a3, a4);
}

- (void)confirmAddToWatchList:(AddToWatchListIntent *)a3 completion:(id)a4
{
  sub_21E9C3EF8(self, (int)a2, a3, a4);
}

- (void)handleAddToWatchList:(AddToWatchListIntent *)a3 completion:(id)a4
{
  sub_21E9C3EF8(self, (int)a2, a3, a4);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_contentResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_watchListService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents27AddToWatchListIntentHandler_featureFlagService);
}

@end
