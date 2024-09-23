@implementation ActivityChartDataCache

- (_TtC10FitnessApp22ActivityChartDataCache)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC10FitnessApp22ActivityChartDataCache *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v2 = OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_calendar;
  v3 = qword_10081D548;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_10081D548, sub_100005A80);
  v5 = type metadata accessor for Calendar(0);
  v6 = sub_10003CE9C(v5, (uint64_t)qword_100869D10);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);
  v7 = OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_cache;
  *(Class *)((char *)&v4->super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone((Class)NSCache), "init");
  v8 = OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_basalEnergyCache;
  *(Class *)((char *)&v4->super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)NSCache), "init");

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ActivityChartDataCache(0);
  return -[ActivityChartDataCache init](&v10, "init");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_calendar;
  v4 = type metadata accessor for Calendar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
