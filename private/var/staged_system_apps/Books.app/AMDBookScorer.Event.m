@implementation AMDBookScorer.Event

- (NSDictionary)engagementData
{
  uint64_t v2;
  NSDictionary v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData));
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSDictionary *)v3.super.isa;
}

- (void)setEngagementData:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  if (a3)
    v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v4 = 0;
  v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData) = v4;
  swift_bridgeObjectRelease(v5);
}

- (_TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event)init
{
  _TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event *result;

  result = (_TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event *)_swift_stdlib_reportUnimplementedInitializer("Books.Event", 11, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_data));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData));
}

@end
