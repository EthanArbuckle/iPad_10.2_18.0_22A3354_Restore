@implementation ResumeMediaIntentHandler

- (void)resolveDevicesForResumeMedia:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224827570);
}

- (void)confirmResumeMedia:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224828104);
}

- (void)handleResumeMedia:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_224828474((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (_TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler)init
{
  return (_TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler *)ResumeMediaIntentHandler.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_playbackController);
  swift_release();
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_analyticsService);
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_deviceState);
  swift_release();
  OUTLINED_FUNCTION_75_1(OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_aceService);
  v3 = (char *)self
     + OBJC_IVAR____TtC26SiriPlaybackControlIntents24ResumeMediaIntentHandler_aceBlockClearAudioQueueForResume;
  v4 = sub_2249ECC84();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
