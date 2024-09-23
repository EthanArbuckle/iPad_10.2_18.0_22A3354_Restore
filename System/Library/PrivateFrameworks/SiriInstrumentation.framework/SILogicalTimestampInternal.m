@implementation SILogicalTimestampInternal

- (NSUUID)clockIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1AA530DA0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  LogicalTimestamp.clockIdentifier.getter((uint64_t)v5);
  v6 = (void *)sub_1AA530D64();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSUUID *)v6;
}

- (unint64_t)nanosecondsSinceBoot
{
  return LogicalTimestamp.nanosecondsSinceBoot.getter();
}

- (SILogicalTimestampInternal)initWithClockIdentifier:(id)a3 nanosecondsSinceBoot:(unint64_t)a4
{
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1AA530DA0();
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AA530D7C();
  return (SILogicalTimestampInternal *)LogicalTimestamp.init(clockIdentifier:nanosecondsSinceBoot:)((uint64_t)v6, a4);
}

- (BOOL)isEqual:(id)a3
{
  SILogicalTimestampInternal *v4;
  SILogicalTimestampInternal *v5;
  BOOL v6;
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
  v6 = sub_1A9D7560C((uint64_t)v8);

  sub_1A9D761B0((uint64_t)v8, &qword_1ED09C980);
  return v6;
}

- (SILogicalTimestampInternal)init
{
  LogicalTimestamp.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SILogicalTimestampInternal_clockIdentifier;
  v3 = OUTLINED_FUNCTION_0_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
