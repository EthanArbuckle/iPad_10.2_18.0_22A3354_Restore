@implementation SiriTTSServiceSession

- (SiriTTSServiceSession)init
{
  SiriTTSServiceSession *result;

  ServiceSession.init()();
  return result;
}

- (SiriTTSServiceSession)initWithAccessoryId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  SiriTTSServiceSession *result;
  uint64_t v7;

  v3 = sub_19AE550AC();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19AE55088();
  ServiceSession.init(accessoryId:)((uint64_t)v5);
  return result;
}

- (void)dealloc
{
  SiriTTSServiceSession *v2;

  v2 = self;
  ServiceSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19AD567C8((uint64_t)self + OBJC_IVAR___SiriTTSServiceSession_accessoryId, &qword_1ED05A930);

  swift_bridgeObjectRelease();
}

- (void)speakWithPreviewRequest:(id)a3 didFinish:(id)a4
{
  sub_19ADF31A0(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_19ADEF254);
}

- (void)speakWithAudioHintRequest:(id)a3 didFinish:(id)a4
{
  sub_19ADF31A0(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_19ADF1984);
}

- (void)cancelWithRequest:(id)a3
{
  id v4;
  SiriTTSServiceSession *v5;

  v4 = a3;
  v5 = self;
  sub_19ADF3214(v4);

}

- (void)getAudioPower:(id)a3
{
  void *v4;
  SiriTTSServiceSession *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_19ADF3414((uint64_t)v5, (void (**)(_QWORD, float, float))v4);
  _Block_release(v4);

}

- (void)didStartSpeakingWithRequestId:(unint64_t)a3
{
  SiriTTSServiceSession *v4;

  v4 = self;
  ServiceSession.didStartSpeaking(requestId:)(a3);

}

- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4
{
  type metadata accessor for WordTimingInfo();
  sub_19AE5567C();
  swift_bridgeObjectRelease();
}

@end
