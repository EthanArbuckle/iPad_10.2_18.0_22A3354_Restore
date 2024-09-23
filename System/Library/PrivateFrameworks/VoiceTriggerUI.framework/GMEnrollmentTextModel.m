@implementation GMEnrollmentTextModel

- (_TtC14VoiceTriggerUI21GMEnrollmentTextModel)initWithFont:(id)a3 label:(id)a4 hidden:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  _TtC14VoiceTriggerUI21GMEnrollmentTextModel *v12;
  uint64_t *v13;
  objc_class *v14;
  _TtC14VoiceTriggerUI21GMEnrollmentTextModel *v15;
  objc_super v17;

  v8 = sub_229F4B7CC();
  v10 = v9;
  v11 = (objc_class *)a3;
  v12 = self;
  sub_229F4B238();
  *(Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel__font) = v11;
  v13 = (uint64_t *)((char *)v12 + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel__label);
  *v13 = v8;
  v13[1] = v10;
  *((_BYTE *)&v12->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel__hidden) = a5;
  v14 = v11;

  v17.receiver = v12;
  v17.super_class = (Class)type metadata accessor for GMEnrollmentTextModel(0);
  v15 = -[GMEnrollmentTextModel init](&v17, sel_init);

  return v15;
}

- (_TtC14VoiceTriggerUI21GMEnrollmentTextModel)init
{
  _TtC14VoiceTriggerUI21GMEnrollmentTextModel *result;

  result = (_TtC14VoiceTriggerUI21GMEnrollmentTextModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel___observationRegistrar;
  v4 = sub_229F4B244();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
