@implementation INAddMediaIntentHandler

- (_TtC17SiriAudioInternal23INAddMediaIntentHandler)init
{
  return (_TtC17SiriAudioInternal23INAddMediaIntentHandler *)INAddMediaIntentHandler.init()();
}

- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4
{
  sub_22725830C(self, (int)a2, a3, a4, (uint64_t)&unk_24EF8A4D8, (uint64_t)sub_227263160, (void (*)(id, uint64_t, uint64_t))INAddMediaIntentHandler.resolveMediaItems(for:with:));
}

- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4
{
  sub_22725830C(self, (int)a2, a3, a4, (uint64_t)&unk_24EF8A4B0, (uint64_t)sub_227246928, (void (*)(id, uint64_t, uint64_t))INAddMediaIntentHandler.resolveMediaDestination(for:with:));
}

- (void)handleAddMedia:(id)a3 completion:(id)a4
{
  sub_22725830C(self, (int)a2, a3, a4, (uint64_t)&unk_24EF8A488, (uint64_t)sub_2272636B4, (void (*)(id, uint64_t, uint64_t))INAddMediaIntentHandler.handle(intent:completion:));
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_aceServiceInvoker);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_provider);
  swift_release();
  sub_227246BC0((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t *)&unk_2558CBD70);
}

@end
