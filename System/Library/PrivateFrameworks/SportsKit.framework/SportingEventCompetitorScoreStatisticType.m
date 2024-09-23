@implementation SportingEventCompetitorScoreStatisticType

- (BOOL)isEqual:(id)a3
{
  _TtC9SportsKit41SportingEventCompetitorScoreStatisticType *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC9SportsKit41SportingEventCompetitorScoreStatisticType *v7;
  char v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23037AA9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v7 = self;
  }
  sub_23032ABD8((uint64_t)v11, v5, v6);
  v9 = v8;

  sub_2303292FC((uint64_t)v11);
  return v9 & 1;
}

- (_TtC9SportsKit41SportingEventCompetitorScoreStatisticType)init
{
  SportingEventCompetitorScoreStatisticType.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_4_10();
}

@end
