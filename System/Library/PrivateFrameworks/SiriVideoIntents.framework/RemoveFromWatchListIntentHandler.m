@implementation RemoveFromWatchListIntentHandler

- (_TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler)init
{
  return (_TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler *)sub_21E86CED4();
}

- (void)resolveContentForRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 withCompletion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E3063A0, (uint64_t)&unk_255444A38);
}

- (void)confirmRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E306378, (uint64_t)&unk_255444A28);
}

- (void)handleRemoveFromWatchList:(RemoveFromWatchListIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E306350, (uint64_t)&unk_255444A18);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_contentResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_watchListService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents32RemoveFromWatchListIntentHandler_featureFlagService);
}

@end
