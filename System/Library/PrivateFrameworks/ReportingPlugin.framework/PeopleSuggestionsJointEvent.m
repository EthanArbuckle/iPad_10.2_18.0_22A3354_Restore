@implementation PeopleSuggestionsJointEvent

- (NSString)description
{
  _TtC15ReportingPlugin27PeopleSuggestionsJointEvent *v2;
  void *v3;

  v2 = self;
  sub_245490B2C();

  v3 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15ReportingPlugin27PeopleSuggestionsJointEvent)init
{
  _TtC15ReportingPlugin27PeopleSuggestionsJointEvent *result;

  result = (_TtC15ReportingPlugin27PeopleSuggestionsJointEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp;
  v3 = sub_245499FB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
