@implementation PaceFormatter

- (id)stringForObjectValue:(id)a3
{
  _TtC10FitnessApp13PaceFormatter *v5;
  uint64_t v6;
  _TtC10FitnessApp13PaceFormatter *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v7 = self;
  }
  sub_100265DE8((uint64_t)v12);
  v9 = v8;

  sub_10001BE90((uint64_t)v12, (uint64_t *)&unk_100828420);
  if (!v9)
    return 0;
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (_TtC10FitnessApp13PaceFormatter)init
{
  return (_TtC10FitnessApp13PaceFormatter *)sub_100266350();
}

- (_TtC10FitnessApp13PaceFormatter)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp13PaceFormatter *)sub_1002664B0(a3);
}

- (void).cxx_destruct
{

}

@end
