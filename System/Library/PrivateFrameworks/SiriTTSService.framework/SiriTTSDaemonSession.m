@implementation SiriTTSDaemonSession

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_196_0(OBJC_IVAR___SiriTTSDaemonSession__connectionLock);
  OUTLINED_FUNCTION_196_0(OBJC_IVAR___SiriTTSDaemonSession_requestsLock);
  swift_bridgeObjectRelease();
  sub_19AD567C8((uint64_t)self + OBJC_IVAR___SiriTTSDaemonSession_accessoryId, &qword_1ED05A930);
  OUTLINED_FUNCTION_224_0(OBJC_IVAR___SiriTTSDaemonSession__clientId);
  OUTLINED_FUNCTION_41_1();
}

- (BOOL)keepActive
{
  return sub_19AE1642C() & 1;
}

- (SiriTTSDaemonSession)initWithAccessoryId:(id)a3
{
  uint64_t v3;
  SiriTTSDaemonSession *result;

  v3 = sub_19AE550AC();
  MEMORY[0x1E0C80A78](v3);
  sub_19AE55088();
  DaemonSession.init(accessoryId:)();
  return result;
}

- (void)prewarmWithRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE16CBC);
}

- (void)synthesizeWithRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE17A7C);
}

- (void)speakWithSpeechRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE186A0);
}

- (void)speakWithAudioRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE196B4);
}

- (void)speakWithPreviewRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE1A464);
}

- (void)cancelWithRequest:(id)a3
{
  id v4;
  SiriTTSDaemonSession *v5;

  v4 = a3;
  v5 = self;
  sub_19AE1C4D0();

}

- (void)signalWithInlineStreaming:(id)a3
{
  id v4;
  SiriTTSDaemonSession *v5;

  v4 = a3;
  v5 = self;
  sub_19AE1C538();

}

- (void)forwardWithStreamObject:(id)a3
{
  id v4;
  SiriTTSDaemonSession *v5;

  v4 = a3;
  v5 = self;
  sub_19AE1C5A0();

}

- (void)isSpeaking:(id)a3
{
  sub_19AE1CA2C(self, (int)a2, a3, (uint64_t)&unk_1E3A159F8, (uint64_t)sub_19AE227E4, (void (*)(uint64_t))sub_19AE1C770);
}

- (void)getAudioPower:(id)a3
{
  sub_19AE1CA2C(self, (int)a2, a3, (uint64_t)&unk_1E3A159D0, (uint64_t)sub_19AD77E14, (void (*)(uint64_t))sub_19AE1C888);
}

- (void)adjustVolume:(float)a3 rampTime:(double)a4 didFinish:(id)a5
{
  void *v6;
  SiriTTSDaemonSession *v7;

  v6 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = self;
  sub_19AE1CA94();

  swift_release();
}

- (void)estimateDurationWithRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE1CD5C);
}

- (void)textToPhonemeWithRequest:(id)a3 didFinish:(id)a4
{
  sub_19AE1DC08(self, (int)a2, a3, a4, (void (*)(uint64_t))sub_19AE1D4A4);
}

- (void)subscribeWithVoices:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  SiriTTSDaemonSession *v7;

  v5 = _Block_copy(a4);
  type metadata accessor for SynthesisVoice();
  v6 = sub_19AE5567C();
  _Block_copy(v5);
  v7 = self;
  sub_19AE1DD88(v6, (uint64_t)v7, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)subscribedVoicesWithReply:(id)a3
{
  sub_19AE20540(self, (int)a2, a3, (void (*)(void))&sub_19AE1E92C);
}

- (void)subscribedVoicesWithClientId:(id)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  SiriTTSDaemonSession *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = sub_19AE55448();
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_19AE1EB78(v7, a3, v9, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)getSynthesisVoiceMatching:(id)a3 reply:(id)a4
{
  sub_19AE1F7C0(self, (int)a2, a3, a4, (uint64_t)&unk_1E3A15818, (uint64_t)sub_19AE22024, (void (*)(id, uint64_t, uint64_t))sub_19AE1F394);
}

- (void)queryPhaticCapabilityWithVoice:(id)a3 reply:(id)a4
{
  sub_19AE1F7C0(self, (int)a2, a3, a4, (uint64_t)&unk_1E3A157F0, (uint64_t)sub_19AE22010, (void (*)(id, uint64_t, uint64_t))sub_19AE1F610);
}

- (void)killDaemon
{
  SiriTTSDaemonSession *v2;

  v2 = self;
  sub_19AE1F840();

}

- (void)isANEModelCompiledMatching:(id)a3 reply:(id)a4
{
  sub_19AE1F7C0(self, (int)a2, a3, a4, (uint64_t)&unk_1E3A157C8, (uint64_t)sub_19AE22008, (void (*)(id, uint64_t, uint64_t))sub_19AE1F8BC);
}

- (void)clearDeviceCache
{
  SiriTTSDaemonSession *v2;

  v2 = self;
  sub_19AE1FAC4();

}

- (void)didStartSpeakingWithRequestId:(unint64_t)a3
{
  SiriTTSDaemonSession *v4;

  v4 = self;
  DaemonSession.didStartSpeaking(requestId:)(a3);

}

- (void)didReportInstrumentWithRequestId:(unint64_t)a3 instrumentationMetrics:(id)a4
{
  id v6;
  SiriTTSDaemonSession *v7;

  v6 = a4;
  v7 = self;
  DaemonSession.didReportInstrument(requestId:instrumentationMetrics:)(a3, (uint64_t)v6);

}

- (void)didGenerateAudioWithRequestId:(unint64_t)a3 audio:(id)a4
{
  id v6;
  SiriTTSDaemonSession *v7;

  v6 = a4;
  v7 = self;
  DaemonSession.didGenerateAudio(requestId:audio:)((void *)a3, (uint64_t)v6);

}

- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4
{
  uint64_t v6;
  SiriTTSDaemonSession *v7;

  type metadata accessor for WordTimingInfo();
  v6 = sub_19AE5567C();
  v7 = self;
  DaemonSession.didGenerateWordTimings(requestId:wordTimingInfo:)(a3, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)pingWithReply:(id)a3
{
  sub_19AE20540(self, (int)a2, a3, (void (*)(void))sub_19AE204EC);
}

@end
