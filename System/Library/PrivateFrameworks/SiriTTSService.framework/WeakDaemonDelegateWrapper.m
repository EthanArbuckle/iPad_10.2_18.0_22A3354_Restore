@implementation WeakDaemonDelegateWrapper

- (void)didStartSpeakingWithRequestId:(unint64_t)a3
{
  swift_retain();
  sub_19AE10730();
}

- (void)didReportInstrumentWithRequestId:(unint64_t)a3 instrumentationMetrics:(id)a4
{
  sub_19AE1083C((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, id))sub_19AE107A4);
}

- (void)didGenerateAudioWithRequestId:(unint64_t)a3 audio:(id)a4
{
  sub_19AE1083C((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, id))sub_19AE107BC);
}

- (void)didGenerateWordTimingsWithRequestId:(unint64_t)a3 wordTimingInfo:(id)a4
{
  type metadata accessor for WordTimingInfo();
  sub_19AE5567C();
  swift_retain();
  sub_19AE10890();
}

- (void)pingWithReply:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v3;
  swift_retain();
  sub_19AE10974();
}

@end
