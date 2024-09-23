@implementation AEAudiobookAnalyticsRecorder

- (AEAudiobookAnalyticsRecorderTrackerHosting)trackerHost
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_trackerHost;
  swift_beginAccess((char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_trackerHost, v4, 0, 0);
  return (AEAudiobookAnalyticsRecorderTrackerHosting *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setTrackerHost:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_trackerHost;
  swift_beginAccess((char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_trackerHost, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

+ (AEAudiobookAnalyticsRecorder)sharedRecorder
{
  if (qword_20EA60 != -1)
    swift_once(&qword_20EA60, sub_FED64);
  return (AEAudiobookAnalyticsRecorder *)(id)qword_20EA68;
}

- (void)routeChanged:(id)a3
{
  id v4;
  AEAudiobookAnalyticsRecorder *v5;

  v4 = a3;
  v5 = self;
  sub_FF170(v4);

}

- (void)networkChanged:(id)a3
{
  uint64_t v5;
  AEAudiobookAnalyticsRecorder *v6;
  id v7;

  sub_1093C0(0, &qword_20EA88, OS_dispatch_queue_ptr);
  v5 = swift_allocObject(&unk_1C2418, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v6 = self;
  v7 = a3;
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_109054, v5);

  swift_release(v5);
}

- (void)startRecordingAnalyticsWithSessionHost:(id)a3
{
  uint64_t v5;
  AEAudiobookAnalyticsRecorder *v6;

  sub_1093C0(0, &qword_20EA88, OS_dispatch_queue_ptr);
  v5 = swift_allocObject(&unk_1C23F0, 32, 7);
  *(_QWORD *)(v5 + 16) = self;
  *(_QWORD *)(v5 + 24) = a3;
  swift_unknownObjectRetain_n(a3, 2);
  v6 = self;
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_10AAD8, v5);
  swift_unknownObjectRelease(a3);

  swift_release(v5);
}

- (void)forceEndPlaySession
{
  uint64_t v3;
  AEAudiobookAnalyticsRecorder *v4;

  sub_1093C0(0, &qword_20EA88, OS_dispatch_queue_ptr);
  v3 = swift_allocObject(&unk_1C23C8, 24, 7);
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_FFA98, v3);

  swift_release(v3);
}

- (AEAudiobookAnalyticsRecorder)init
{
  AEAudiobookAnalyticsRecorder *result;

  result = (AEAudiobookAnalyticsRecorder *)_swift_stdlib_reportUnimplementedInitializer("AEBookPlugins.AudiobookAnalyticsRecorder", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_109184((uint64_t)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_trackerHost);
  sub_109184((uint64_t)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_dataSource);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AEAudiobookAnalyticsRecorder_analyticsSessionHost));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AEAudiobookAnalyticsRecorder_analyticsSessionAssertion));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionAudiobook));
  swift_bridgeObjectRelease(*(_QWORD *)&self->trackerHost[OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionAssetID]);
  sub_10988C((uint64_t)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionStartDate, &qword_20EDE8);

  v3 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_doNotDisturbStatusAtStart;
  v4 = type metadata accessor for DoNotDisturbStatus(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_currentRoute;
  v6 = type metadata accessor for ListeningRoutedTo(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___AEAudiobookAnalyticsRecorder_previousCellularAccessTechnology;
  v8 = type metadata accessor for CellularRadioAccessTechnology(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

}

- (void)skipController:(id)a3 willBeginSkippingInDirection:(unint64_t)a4
{
  void *v5;
  id v6;
  objc_class *v7;
  AEAudiobookAnalyticsRecorder *v8;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_player);
  v6 = a3;
  v8 = self;
  objc_msgSend(v5, "positionInCurrentAudiobook");
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_skipStartMediaTime) = v7;

}

- (void)skipControllerDidEndSkipping:(id)a3 actionSource:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned int *v11;
  id v12;
  AEAudiobookAnalyticsRecorder *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  AEAudiobookAnalyticsRecorder *v17;
  uint64_t v18;
  unint64_t v19;

  v7 = type metadata accessor for SkipActionType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    v11 = (unsigned int *)&enum case for SkipActionType.unknown(_:);
LABEL_5:
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *v11, v7);
    v12 = a3;
    v13 = self;
    sub_1002F4((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    return;
  }
  if (a4 == 1)
  {
    v11 = (unsigned int *)&enum case for SkipActionType.buttonTap(_:);
    goto LABEL_5;
  }
  type metadata accessor for BKAudiobookActionSource(0);
  v15 = v14;
  v19 = a4;
  v16 = a3;
  v17 = self;
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v15, &v19, v15, &type metadata for UInt);
  __break(1u);
}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
  AEAudiobookAnalyticsRecorder *v7;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_analyticsSessionAssertion))
  {
    swift_unknownObjectRetain(a3);
    swift_unknownObjectRetain(a4);
    v7 = self;
    sub_FFA9C();
    swift_unknownObjectRelease(a3);
    swift_unknownObjectRelease(a4);

  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  AEAudiobookAnalyticsRecorder *v8;

  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_108A0C(a3, a5);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  uint64_t v4;
  float v5;
  AEAudiobookAnalyticsRecorder *v9;

  v4 = OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionPlaybackRate;
  v5 = *(float *)((char *)&self->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_playSessionPlaybackRate);
  if (v5 != a4)
  {
    swift_unknownObjectRetain(a3);
    v9 = self;
    sub_1017A0(a4, v5);
    *(float *)((char *)&self->super.isa + v4) = a4;
    swift_unknownObjectRelease(a3);

  }
}

- (void)player:(id)a3 isScrubbing:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  AEAudiobookAnalyticsRecorder *v12;
  uint64_t v13;
  AEAudiobookAnalyticsRecorder *v14;

  v4 = a4;
  v7 = type metadata accessor for SkipActionType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4)
  {
    swift_unknownObjectRetain(a3);
    v14 = self;
    objc_msgSend(a3, "positionInCurrentAudiobook");
    *(Class *)((char *)&v14->super.isa + OBJC_IVAR___AEAudiobookAnalyticsRecorder_skipStartMediaTime) = v11;
    swift_unknownObjectRelease(a3);

  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for SkipActionType.scrubbing(_:), v7);
    swift_unknownObjectRetain(a3);
    v12 = self;
    sub_1002F4((uint64_t)v10);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_unknownObjectRelease(a3);

  }
}

- (void)player:(id)a3 bitRateChangedFrom:(float)a4 to:(float)a5
{
  uint64_t v9;
  AEAudiobookAnalyticsRecorder *v10;

  sub_1093C0(0, &qword_20EA88, OS_dispatch_queue_ptr);
  v9 = swift_allocObject(&unk_1C23A0, 32, 7);
  *(_QWORD *)(v9 + 16) = self;
  *(float *)(v9 + 24) = a5;
  *(float *)(v9 + 28) = a4;
  v10 = self;
  swift_unknownObjectRetain(a3);
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_10AB0C, v9);
  swift_unknownObjectRelease(a3);

  swift_release(v9);
}

@end
