@implementation RCLiveTranscription

- (_TtC10VoiceMemos19RCLiveTranscription)initWith:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  _TtC10VoiceMemos19RCLiveTranscription *v7;

  v3 = a3;
  if (a3)
  {
    v4 = a3;
    v3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  v7 = (_TtC10VoiceMemos19RCLiveTranscription *)sub_1000CB5A8((uint64_t)v3, v6);
  sub_1000CBE94((uint64_t)v3, v6);
  return v7;
}

- (void)prepareToProcessWithFormat:(id)a3 audioTime:(id)a4 punchInTime:(double)a5
{
  id v8;
  id v9;
  _TtC10VoiceMemos19RCLiveTranscription *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1000CBA70(v8, a5);

}

- (void)processAudioBuffer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  _TtC10VoiceMemos19RCLiveTranscription *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = sub_100014E10(&qword_1001EB058);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos19RCLiveTranscription_liveTranscription);
  if (v9)
  {
    v14 = a3;
    v10 = a3;
    v11 = self;
    swift_retain(v9);
    v12 = sub_100014E10(&qword_1001E9BC0);
    AsyncStream.Continuation.yield(_:)(&v14, v12);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    swift_release(v9);
  }
}

- (void)finalizeAndReturnTranscriptionDataWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10VoiceMemos19RCLiveTranscription *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001AFC40, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001AFC68, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001EB050;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001AFC90, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001EA788;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10010485C((uint64_t)v7, (uint64_t)&unk_1001EA790, (uint64_t)v12);
  swift_release(v14);
}

- (void)refreshWithComposition:(id)a3
{
  id v4;
  _TtC10VoiceMemos19RCLiveTranscription *v5;

  v4 = a3;
  v5 = self;
  sub_1000C8088(v4);

}

- (_TtC10VoiceMemos19RCLiveTranscription)init
{
  _TtC10VoiceMemos19RCLiveTranscription *result;

  result = (_TtC10VoiceMemos19RCLiveTranscription *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.RCLiveTranscription", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos19RCLiveTranscription_liveTranscription));
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos19RCLiveTranscription_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos19RCLiveTranscription_compiler));
}

@end
