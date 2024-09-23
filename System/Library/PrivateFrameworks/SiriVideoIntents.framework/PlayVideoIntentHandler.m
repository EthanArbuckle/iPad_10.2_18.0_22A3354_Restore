@implementation PlayVideoIntentHandler

- (_TtC16SiriVideoIntents22PlayVideoIntentHandler)init
{
  _TtC16SiriVideoIntents22PlayVideoIntentHandler *result;

  PlayVideoIntentHandler.init()();
  return result;
}

- (void)resolveContentForPlayVideo:(PlayVideoIntent *)a3 withCompletion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E3071E0, (uint64_t)&unk_2554458E8);
}

- (void)confirmPlayVideo:(PlayVideoIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E3071B8, (uint64_t)&unk_2554458D8);
}

- (void)handlePlayVideo:(PlayVideoIntent *)a3 completion:(id)a4
{
  sub_21E86E590(self, (int)a2, a3, a4, (uint64_t)&unk_24E307190, (uint64_t)&unk_2554458C8);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_contentResolver);
  OUTLINED_FUNCTION_105_0(OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_analyticsService);
  swift_release();
  OUTLINED_FUNCTION_105_0(OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_signalRecorder);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_105_0(OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_contentWith3pAppsProviding);
  OUTLINED_FUNCTION_105_0(OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_deviceState);
  OUTLINED_FUNCTION_105_0(OBJC_IVAR____TtC16SiriVideoIntents22PlayVideoIntentHandler_tipService);
}

@end
