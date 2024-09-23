@implementation MTSeasonFeedRequest

- (NSArray)seasons
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSeasons:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_1A93F8310();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MTSeasonFeedRequest_seasons);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MTSeasonFeedRequest)initWithStoreID:(int64_t)a3 seasons:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTSeasonFeedRequest_seasons) = (Class)sub_1A93F8310();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_limit) = (Class)25;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_sections) = (Class)MEMORY[0x1E0DEE9D8];
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return -[MTBaseFeedRequest init](&v7, sel_init);
}

- (MTSeasonFeedRequest)initWithStoreID:(int64_t)a3
{
  MTSeasonFeedRequest *result;

  result = (MTSeasonFeedRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
