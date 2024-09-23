@implementation MTBaseFeedRequest

- (MTBaseFeedRequest)initWithStoreID:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return -[MTBaseMAPIRequest init](&v4, sel_init);
}

- (void)performWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  MTBaseFeedRequest *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A92FAD2C((uint64_t)sub_1A90CAB4C, v5);

  swift_release();
}

- (MTBaseFeedRequest)init
{
  MTBaseFeedRequest *result;

  result = (MTBaseFeedRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
