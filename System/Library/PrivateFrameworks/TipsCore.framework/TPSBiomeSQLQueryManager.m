@implementation TPSBiomeSQLQueryManager

+ (unint64_t)countsForEvent:(id)a3 interval:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  v7 = _s8TipsCore0A20BiomeSQLQueryManagerC14countsForEvent_8intervalSuSo013TPSContextualcH0C_So14NSDateIntervalCtFZ_0(v5, v6);

  return v7;
}

- (TPSBiomeSQLQueryManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipsBiomeSQLQueryManager();
  return -[TPSBiomeSQLQueryManager init](&v3, sel_init);
}

@end
