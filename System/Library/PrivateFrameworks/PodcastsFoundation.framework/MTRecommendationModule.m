@implementation MTRecommendationModule

- (NSString)id
{
  return (NSString *)sub_1A921F95C();
}

- (void)setId:(id)a3
{
  sub_1A921FA28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MTRecommendationModule_id);
}

- (NSString)type
{
  return (NSString *)sub_1A921F95C();
}

- (void)setType:(id)a3
{
  sub_1A921FA28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MTRecommendationModule_type);
}

- (MTRecommendationModuleAttributes)attributes
{
  return (MTRecommendationModuleAttributes *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___MTRecommendationModule_attributes));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
