@implementation INPlayMediaIntentHandler

- (_TtC17SiriAudioInternal24INPlayMediaIntentHandler)init
{
  return (_TtC17SiriAudioInternal24INPlayMediaIntentHandler *)INPlayMediaIntentHandler.init()();
}

- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4
{
  sub_22725830C(self, (int)a2, a3, a4, (uint64_t)&unk_24EF8AE00, (uint64_t)sub_22727AB64, (void (*)(id, uint64_t, uint64_t))INPlayMediaIntentHandler.resolveMediaItems(for:with:));
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  sub_22725830C(self, (int)a2, a3, a4, (uint64_t)&unk_24EF8ADD8, (uint64_t)sub_227246928, (void (*)(id, uint64_t, uint64_t))INPlayMediaIntentHandler.handle(intent:completion:));
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_featureFlagProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nearDeviceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_accountProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_onscreenEntityProvider);
}

@end
