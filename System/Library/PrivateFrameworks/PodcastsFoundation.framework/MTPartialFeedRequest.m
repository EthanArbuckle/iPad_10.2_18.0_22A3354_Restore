@implementation MTPartialFeedRequest

- (int64_t)limit
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___MTPartialFeedRequest_limit);
  swift_beginAccess();
  return *v2;
}

- (void)setLimit:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___MTPartialFeedRequest_limit);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)sections
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSections:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_1A93F8310();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MTPartialFeedRequest_sections);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)showTypeIsSerial
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial;
  swift_beginAccess();
  return *v2;
}

- (void)setShowTypeIsSerial:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial;
  swift_beginAccess();
  *v4 = a3;
}

- (MTPartialFeedRequest)initWithStoreID:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_limit) = (Class)25;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_sections) = (Class)MEMORY[0x1E0DEE9D8];
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return -[MTBaseFeedRequest init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
