@implementation FeedPersonalizerFactory

- (id)newFeedPersonalizerWithAggregateStore:(id)a3 appConfigurationManager:(id)a4 todayPrivateData:(id)a5
{
  id v8;
  _TtC10NewsToday223FeedPersonalizerFactory *v9;
  void *v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v9 = self;
  v10 = (void *)sub_100081C90(v8, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);

  return v10;
}

- (_TtC10NewsToday223FeedPersonalizerFactory)init
{
  _TtC10NewsToday223FeedPersonalizerFactory *result;

  result = (_TtC10NewsToday223FeedPersonalizerFactory *)_swift_stdlib_reportUnimplementedInitializer("NewsToday2.FeedPersonalizerFactory", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10NewsToday223FeedPersonalizerFactory_translationProvider));
}

@end
