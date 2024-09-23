@implementation MTRecommendationModulesRequest

- (MTRecommendationModulesRequest)initWithModuleIDs:(id)a3
{
  uint64_t v3;

  v3 = sub_1A93F8310();
  return (MTRecommendationModulesRequest *)RecommendationModulesRequest.init(with:)(v3);
}

- (void)performWithCompletion:(id)a3
{
  void *v4;
  MTRecommendationModulesRequest *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A911FBF8((char *)v5, (void (**)(const void *, uint64_t, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (MTRecommendationModulesRequest)init
{
  MTRecommendationModulesRequest *result;

  result = (MTRecommendationModulesRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
