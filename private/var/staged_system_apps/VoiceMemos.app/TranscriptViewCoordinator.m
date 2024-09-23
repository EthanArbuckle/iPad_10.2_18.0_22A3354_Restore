@implementation TranscriptViewCoordinator

- (RCTimeController)timeController
{
  return (RCTimeController *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_timeController)));
}

- (void)setTimeController:(id)a3
{
  void *v5;
  _TtC10VoiceMemos25TranscriptViewCoordinator *v6;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_timeController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_timeController) = (Class)a3;
  swift_unknownObjectRetain_n(a3, 2);
  v6 = self;
  sub_1000FD038(v5);

  swift_unknownObjectRelease(v5);
  swift_unknownObjectRelease(a3);
}

- (_TtP10VoiceMemos18TranscriptViewHost_)transcriptViewHost
{
  return (_TtP10VoiceMemos18TranscriptViewHost_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_transcriptViewHost);
}

- (void)setTranscriptViewHost:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;

  v4 = swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_transcriptViewHost, a3);
  v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_interactionDelegate);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  swift_unknownObjectWeakAssign(v5 + 64, Strong);
  swift_unknownObjectRelease(Strong);
}

- (UIView)transcriptView
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v2;
  id v3;

  v2 = self;
  v3 = sub_1000FD1F0();

  return (UIView *)v3;
}

- (void)setTranscriptView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator____lazy_storage___transcriptView);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator____lazy_storage___transcriptView) = (Class)a3;
  v3 = a3;

}

- (_TtC10VoiceMemos25TranscriptViewCoordinator)init
{
  return (_TtC10VoiceMemos25TranscriptViewCoordinator *)sub_1000FD29C();
}

- (void)beginFileTranscriptionForRecordingUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10VoiceMemos25TranscriptViewCoordinator *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  v8 = self;
  swift_retain(v7);
  sub_1000F8278(v4, v6, 1);

  swift_bridgeObjectRelease(v6);
  swift_release(v7);
}

- (void)beginLiveTranscription:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC10VoiceMemos25TranscriptViewCoordinator *v7;

  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  v6 = a3;
  v7 = self;
  swift_retain(v5);
  sub_1000F87B0(a3);

  swift_release(v5);
}

- (void)clearData
{
  uint64_t v2;
  _TtC10VoiceMemos25TranscriptViewCoordinator *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  v3 = self;
  swift_retain(v2);
  sub_1000F81B8();

  swift_release(v2);
}

- (BOOL)isPerformingLiveTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  v5 = *(unsigned __int8 *)(v2 + 48);
  return v3 == 2 && v4 == 0 && v5 == 128;
}

- (BOOL)isProcessingOrDisplayingFileTranscriptionForUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  v8 = *(_QWORD *)(v7 + 32);
  v9 = *(_QWORD *)(v7 + 40);
  LODWORD(v7) = *(unsigned __int8 *)(v7 + 48);
  if (v7 >> 5 >= 3)
  {
    v11 = 0;
  }
  else if (v4 == v8 && v9 == v5)
  {
    v11 = 1;
  }
  else
  {
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v8, v9, 0);
  }
  swift_bridgeObjectRelease(v6);
  return v11 & 1;
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v6;

  swift_unknownObjectRetain(a3);
  v6 = self;
  sub_1000FE698();
  swift_unknownObjectRelease(a3);

}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v7;

  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_1000FE698();
  swift_unknownObjectRelease(a3);

}

- (void)didUpdateTranscriptViewData
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v2;

  v2 = self;
  sub_1000FD9D4();

}

- (void)didUpdateTranscriptionState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _TtC10VoiceMemos25TranscriptViewCoordinator *v7;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_contextProvider);
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider);
  v4 = *(_QWORD *)(v3 + 32);
  v5 = *(_QWORD *)(v3 + 40);
  v6 = *(_BYTE *)(v3 + 48);
  v7 = self;
  swift_retain(v2);
  sub_1000FA180(v4, v5, v6);
  sub_1000C3590(v4, v5, v6);
  sub_1000FA1A8(v4, v5, v6);

  swift_release(v2);
}

- (void)windowSceneWillEnterForeground
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v2;

  v2 = self;
  sub_1000FDB38();

}

- (void)windowSceneDidEnterBackground
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_isWindowSceneInForeground) = 0;
}

- (void)willDisplayTranscriptView
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v2;

  v2 = self;
  sub_1000FDBFC();

}

- (void)didDismissTranscriptView
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_isDisplayingTranscriptView) = 0;
}

- (void)willExpandTranscriptView
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v2;

  v2 = self;
  sub_1000FDCC0();

}

- (void)willCollapseTranscriptView
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v2;

  v2 = self;
  sub_1000FDE10();

}

- (void)didChangeHostViewWidth:(double)a3
{
  _TtC10VoiceMemos25TranscriptViewCoordinator *v4;

  v4 = self;
  sub_1000FDF5C(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_timeController));
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_transcriptViewHost);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator____lazy_storage___transcriptView));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_contextProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_dataProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_configurationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_configurationMediator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_interactionDelegate));
  sub_10001B498((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC10VoiceMemos25TranscriptViewCoordinator_transcriptViewPresenter));
}

@end
