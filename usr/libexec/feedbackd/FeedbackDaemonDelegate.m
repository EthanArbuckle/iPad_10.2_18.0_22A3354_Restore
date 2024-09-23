@implementation FeedbackDaemonDelegate

- (void)collectFeedbackWithFormData:(id)a3 launchConfigurationData:(id)a4 completion:(id)a5
{
  void (*v8)(void);
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v8 = (void (*)(void))_Block_copy(a5);
  v9 = a3;
  v10 = a4;
  swift_retain(self);
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v16 = v15;

  if (v8)
  {
    v17 = swift_allocObject(&unk_10006A848, 24, 7);
    *(_QWORD *)(v17 + 16) = v8;
    v8 = (void (*)(void))sub_100042A38;
  }
  else
  {
    v17 = 0;
  }
  sub_10003BD0C(v11, v13, v14, v16, v8, v17);
  sub_1000429E4((uint64_t)v8, v17);
  sub_100012720(v14, (unint64_t)v16);
  sub_100012720(v11, v13);
  swift_release(self);
}

- (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  swift_retain(self);
  sub_100041928(v7, v9, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
}

- (void)reportFailureToLaunchFormWithFormIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  swift_retain(self);
  sub_100041D68(v7, v9, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
}

- (void)didFinishSubmissionWithFormIdentifier:(id)a3 feedbackId:(id)a4 isSurvey:(BOOL)a5 error:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;

  v8 = a5;
  v12 = _Block_copy(a7);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  _Block_copy(v12);
  v16 = a4;
  v17 = a6;
  swift_retain(self);
  sub_10004201C(v13, v15, a4, v8, a6, (uint64_t)v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_release(self);
  swift_bridgeObjectRelease(v15);
}

- (void)resetDaemonWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10006A758, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_retain(self);
  sub_100042450((uint64_t)sub_100042A38, v5, 0xD000000000000018, 0x800000010005C070, (uint64_t)&unk_10006A780, (uint64_t)&unk_100070168);
  swift_release(self);
  swift_release(v5);
}

- (void)clearCachedUserSessionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10006A708, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_retain(self);
  sub_100042450((uint64_t)sub_100041920, v5, 0xD000000000000023, 0x800000010005C040, (uint64_t)&unk_10006A730, (uint64_t)&unk_100070158);
  swift_release(self);
  swift_release(v5);
}

@end
