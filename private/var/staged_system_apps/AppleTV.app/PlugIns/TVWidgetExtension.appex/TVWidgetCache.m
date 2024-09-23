@implementation TVWidgetCache

- (_TtC17TVWidgetExtension13TVWidgetCache)init
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v3 = (char *)self + OBJC_IVAR____TtC17TVWidgetExtension13TVWidgetCache_lastKnownWidgetEntry;
  v4 = type metadata accessor for TVWidgetEntry(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC17TVWidgetExtension13TVWidgetCache_lastKnownWidgetEntryDate;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVWidgetCache(0);
  return -[TVWidgetCache init](&v8, "init");
}

- (void).cxx_destruct
{
  sub_1000135A0((uint64_t)self + OBJC_IVAR____TtC17TVWidgetExtension13TVWidgetCache_lastKnownWidgetEntry, &qword_100109460);
  sub_1000135A0((uint64_t)self + OBJC_IVAR____TtC17TVWidgetExtension13TVWidgetCache_lastKnownWidgetEntryDate, &qword_100105F48);
}

@end
