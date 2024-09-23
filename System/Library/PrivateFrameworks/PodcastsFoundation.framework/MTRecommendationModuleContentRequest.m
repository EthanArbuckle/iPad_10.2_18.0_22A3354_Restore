@implementation MTRecommendationModuleContentRequest

- (MTRecommendationModuleContentRequest)initWithModuleID:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  objc_super v8;

  v4 = sub_1A93F8040();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MTRecommendationModuleContentRequest_moduleID);
  *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RecommendationModuleContentRequest();
  return -[MTBaseMAPIRequest init](&v8, sel_init);
}

- (void)performWithCompletion:(id)a3
{
  void *v4;
  MTRecommendationModuleContentRequest *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A917DB54((char *)v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (MTRecommendationModuleContentRequest)init
{
  MTRecommendationModuleContentRequest *result;

  result = (MTRecommendationModuleContentRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
