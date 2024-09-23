@implementation TranscriptWaitingViewTextAttachment

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)init
{
  char *v3;
  NSString v4;
  _TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC10VoiceMemos35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider) = 0;
  v3 = off_1001EA8F8;
  swift_bridgeObjectRetain(off_1001EA8F8);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TranscriptWaitingViewTextAttachment();
  v5 = -[TranscriptWaitingViewTextAttachment initWithData:ofType:](&v7, "initWithData:ofType:", 0, v4);

  -[TranscriptWaitingViewTextAttachment setAllowsTextAttachmentView:](v5, "setAllowsTextAttachmentView:", 1);
  return v5;
}

- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000BDCC0();
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v9;
  id v10;
  _TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *v11;
  void *v12;

  v9 = a3;
  swift_unknownObjectRetain(a4);
  v10 = a5;
  v11 = self;
  v12 = sub_1000BDD48(a3, (uint64_t)a4, a5);

  swift_unknownObjectRelease(a4);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *v5;
  uint64_t v6;
  _TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1000BD964((uint64_t)v10);

  sub_1000BDC38((uint64_t)v10);
  return v8;
}

- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  _TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *result;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);

  }
  result = (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.TranscriptWaitingViewTextAttachment", 46, "init(data:ofType:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider));
}

@end
