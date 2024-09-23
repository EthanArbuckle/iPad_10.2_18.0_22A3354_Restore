@implementation BMBasePropertyConfiguration

- (NSString)eventName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->eventName[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  swift_bridgeObjectRetain(v2, a2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (int64_t)recordType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_recordType);
}

- (int64_t)ageToExpire
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire);
}

- (int64_t)countLimit
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_countLimit);
}

- (NSString)identifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->eventName[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->eventName[OBJC_IVAR___BMBasePropertyConfiguration_identifier], a2);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)shouldBeSynced
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced);
}

- (BOOL)isEqual:(id)a3
{
  BMBasePropertyConfiguration *v5;
  uint64_t v6;
  BMBasePropertyConfiguration *v7;
  char v8;
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
  v8 = sub_4344((uint64_t)v10);

  sub_4530((uint64_t)v10);
  return v8 & 1;
}

- (BMBasePropertyConfiguration)init
{
  BMBasePropertyConfiguration *result;

  result = (BMBasePropertyConfiguration *)_swift_stdlib_reportUnimplementedInitializer("EngagementCollector.BasePropertyConfiguration", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->eventName[OBJC_IVAR___BMBasePropertyConfiguration_eventName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->eventName[OBJC_IVAR___BMBasePropertyConfiguration_identifier]);
}

@end
