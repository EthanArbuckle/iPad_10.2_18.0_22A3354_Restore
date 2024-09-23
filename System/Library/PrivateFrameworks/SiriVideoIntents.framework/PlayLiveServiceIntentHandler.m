@implementation PlayLiveServiceIntentHandler

- (_TtC16SiriVideoIntents28PlayLiveServiceIntentHandler)init
{
  return (_TtC16SiriVideoIntents28PlayLiveServiceIntentHandler *)PlayLiveServiceIntentHandler.init()();
}

- (void)resolveLiveServiceForPlayLiveService:(PlayLiveServiceIntent *)a3 withCompletion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E30CF20, (uint64_t)&unk_25544A5B0);
}

- (void)confirmPlayLiveService:(PlayLiveServiceIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E30CEF8, (uint64_t)&unk_25544A5A0);
}

- (void)handlePlayLiveService:(PlayLiveServiceIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E30CED0, (uint64_t)&unk_25544A590);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents28PlayLiveServiceIntentHandler_liveServiceResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents28PlayLiveServiceIntentHandler_analyticsService);
}

@end
