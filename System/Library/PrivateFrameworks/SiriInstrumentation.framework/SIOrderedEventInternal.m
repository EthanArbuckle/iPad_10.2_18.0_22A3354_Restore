@implementation SIOrderedEventInternal

- (SILogicalTimestampInternal)logicalTimestamp
{
  id v2;

  sub_1A9D76834();
  return (SILogicalTimestampInternal *)v2;
}

- (void)setLogicalTimestamp:(id)a3
{
  id v5;
  SIOrderedEventInternal *v6;

  v5 = a3;
  v6 = self;
  sub_1A9D768B4((uint64_t)a3);

}

- (SISchemaTopLevelUnionType)tluEvent
{
  id v2;

  sub_1A9D7690C();
  return (SISchemaTopLevelUnionType *)v2;
}

- (void)setTluEvent:(id)a3
{
  id v5;
  SIOrderedEventInternal *v6;

  v5 = a3;
  v6 = self;
  sub_1A9D7698C((uint64_t)a3);

}

- (NSUUID)messageUUID
{
  return (NSUUID *)sub_1A9D76B44((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1A9D769D0);
}

- (void)setMessageUUID:(id)a3
{
  sub_1A9D76C44(self, (uint64_t)a2, (uint64_t)a3, sub_1A9D769E8);
}

- (SIComponentIdentifier)clusterId
{
  id v2;

  sub_1A9D76A14();
  return (SIComponentIdentifier *)v2;
}

- (void)setClusterId:(id)a3
{
  id v5;
  SIOrderedEventInternal *v6;

  v5 = a3;
  v6 = self;
  sub_1A9D76A94((uint64_t)a3);

}

- (NSUUID)testFingerprint
{
  return (NSUUID *)sub_1A9D76B44((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1A9D76BF0);
}

- (void)setTestFingerprint:(id)a3
{
  sub_1A9D76C44(self, (uint64_t)a2, (uint64_t)a3, sub_1A9D76CD4);
}

- (SIOrderedEventInternal)initWithData:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    sub_1AA530D34();

  }
  return (SIOrderedEventInternal *)OrderedEvent.init(data:)();
}

- (SIOrderedEventInternal)initWithLogicalTimestamp:(id)a3 messageUUID:(id)a4 tluEvent:(id)a5
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED09CAC0);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1AA530D7C();
    v10 = sub_1AA530DA0();
    v11 = 0;
  }
  else
  {
    v10 = sub_1AA530DA0();
    v11 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v11, 1, v10);
  return (SIOrderedEventInternal *)OrderedEvent.init(logicalTimestamp:messageUUID:tluEvent:)(a3, (uint64_t)v9, a5);
}

- (SIOrderedEventInternal)initWithLogicalTimestamp:(id)a3 tluEvent:(id)a4
{
  id v5;
  id v6;
  SIOrderedEventInternal *result;

  v5 = a3;
  v6 = a4;
  OrderedEvent.init(logicalTimestamp:tluEvent:)();
  return result;
}

- (SIOrderedEventInternal)initWithCoder:(id)a3
{
  SIOrderedEventInternal *result;

  sub_1A9D77A40(a3);
  return result;
}

- (void)writeTo:(id)a3
{
  id v4;
  SIOrderedEventInternal *v5;

  v4 = a3;
  v5 = self;
  sub_1A9D786A8(v4);

}

- (BOOL)readFrom:(id)a3
{
  id v3;
  id v5;
  SIOrderedEventInternal *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_1A9D78BB4((_BOOL8)v3);

  return v3 & 1;
}

+ (id)deserializeFrom:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = sub_1AA530D34();
  v6 = v5;

  swift_getObjCClassMetadata();
  static OrderedEvent.deserialize(from:)();
  v8 = v7;
  sub_1A9D72F68(v4, v6);
  return v8;
}

- (SIOrderedEventInternal)init
{
  OrderedEvent.init()();
}

- (void).cxx_destruct
{

  sub_1A9D72D9C((uint64_t)self + OBJC_IVAR___SIOrderedEventInternal_messageUUID);
  sub_1A9D72D9C((uint64_t)self + OBJC_IVAR___SIOrderedEventInternal_testFingerprint);
}

- (id)copyWithZone:(void *)a3
{
  SIOrderedEventInternal *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  OrderedEvent.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1AA53122C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

@end
