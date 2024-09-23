@implementation GMEnrollmentViewModel

- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)initWithPrelude:(id)a3 instruction:(id)a4 continuation:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC14VoiceTriggerUI21GMEnrollmentViewModel *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (_TtC14VoiceTriggerUI21GMEnrollmentViewModel *)sub_229F4A7C4(v7, v8, v9);

  return v10;
}

- (void)setIntructionLabel:(id)a3
{
  sub_229F4A194(self);
}

- (void)setPreludeLabel:(id)a3
{
  sub_229F4A194(self);
}

- (void)setContinuationLabel:(id)a3
{
  sub_229F4A194(self);
}

- (void)setIntructionLabelHidden:(BOOL)a3
{
  sub_229F4A64C(self);
}

- (void)setPreludeLabelHidden:(BOOL)a3
{
  sub_229F4A64C(self);
}

- (void)setContinuationLabelHidden:(BOOL)a3
{
  sub_229F4A64C(self);
}

- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)init
{
  _TtC14VoiceTriggerUI21GMEnrollmentViewModel *result;

  result = (_TtC14VoiceTriggerUI21GMEnrollmentViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentViewModel___observationRegistrar;
  v4 = sub_229F4B244();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
