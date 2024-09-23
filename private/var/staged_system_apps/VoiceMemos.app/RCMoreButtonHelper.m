@implementation RCMoreButtonHelper

- (NSString)recordingUUID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->recordingUUID[OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_recordingUUID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setRecordingUUID:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_recordingUUID);
  v6 = *(_QWORD *)&self->recordingUUID[OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_recordingUUID];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC10VoiceMemos18RCMoreButtonHelper)initWithRecordingUUID:(id)a3 actionDelegate:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_recordingUUID);
  *v7 = v6;
  v7[1] = v8;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_controller, a4);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RCMoreButtonHelper();
  return -[RCMoreButtonHelper init](&v10, "init");
}

- (id)createMenuWithDisplayShowTranscriptAction:(BOOL)a3 displayCopyTranscriptAction:(BOOL)a4
{
  _TtC10VoiceMemos18RCMoreButtonHelper *v5;
  Class v6;

  v5 = self;
  v6 = sub_100100120(a4);

  return v6;
}

- (_TtC10VoiceMemos18RCMoreButtonHelper)init
{
  _TtC10VoiceMemos18RCMoreButtonHelper *result;

  result = (_TtC10VoiceMemos18RCMoreButtonHelper *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.RCMoreButtonHelper", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->recordingUUID[OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_recordingUUID]);
  sub_1000FFFE8((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos18RCMoreButtonHelper_controller);
}

@end
