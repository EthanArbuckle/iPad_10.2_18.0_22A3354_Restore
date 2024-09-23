@implementation SIComponentIdentifier

- (SIComponentIdentifier)initWithName:(int)a3 uuid:(id)a4
{
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1AA530DA0();
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AA530D7C();
  return (SIComponentIdentifier *)ComponentIdentifier.init(name:uuid:)(a3, (uint64_t)v6);
}

- (SIComponentIdentifier)initWithName:(int)a3 schemaUUID:(id)a4
{
  return (SIComponentIdentifier *)ComponentIdentifier.init(name:schemaUUID:)(a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  SIComponentIdentifier *v4;
  SIComponentIdentifier *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AA53101C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A9D743E0((uint64_t)v8);

  sub_1A9D749DC((uint64_t)v8, &qword_1ED09C980);
  return v6 & 1;
}

- (int64_t)hash
{
  SIComponentIdentifier *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1A9D74528();

  return v3;
}

- (SIComponentIdentifier)init
{
  ComponentIdentifier.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___SIComponentIdentifier__uuid;
  v4 = OUTLINED_FUNCTION_0_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1A9D749DC((uint64_t)self + OBJC_IVAR___SIComponentIdentifier____lazy_storage___uuid, &qword_1ED09CAC0);
  OUTLINED_FUNCTION_5_0();
}

@end
