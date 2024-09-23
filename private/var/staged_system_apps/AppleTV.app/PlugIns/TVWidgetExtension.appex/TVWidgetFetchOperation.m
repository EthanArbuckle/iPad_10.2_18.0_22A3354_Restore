@implementation TVWidgetFetchOperation

- (void)dealloc
{
  _TtC17TVWidgetExtension22TVWidgetFetchOperation *v2;

  v2 = self;
  sub_100087334();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation_context;
  v4 = type metadata accessor for TimelineProviderContext(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000135A0((uint64_t)self + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation__widgetEntry, &qword_100109460);
  sub_1000135A0((uint64_t)self + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation__suggestedRefreshDate, &qword_100105F48);
  swift_errorRelease(*(Class *)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation__error));
}

- (_TtC17TVWidgetExtension22TVWidgetFetchOperation)init
{
  _TtC17TVWidgetExtension22TVWidgetFetchOperation *result;

  result = (_TtC17TVWidgetExtension22TVWidgetFetchOperation *)_swift_stdlib_reportUnimplementedInitializer("TVWidgetExtension.TVWidgetFetchOperation", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
