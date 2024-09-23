@implementation _PXStoryFallbackStyleDescriptor

- (NSString)originalColorGradeCategory
{
  return 0;
}

- (int64_t)customColorGradeKind
{
  return 1;
}

- (PXStorySongResource)songResource
{
  return 0;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return 0;
}

- (BOOL)isCustomized
{
  return 0;
}

+ (_PXStoryFallbackStyleDescriptor)defaultFallbackStyleDescriptor
{
  if (defaultFallbackStyleDescriptor_onceToken != -1)
    dispatch_once(&defaultFallbackStyleDescriptor_onceToken, &__block_literal_global_444);
  return (_PXStoryFallbackStyleDescriptor *)(id)defaultFallbackStyleDescriptor_defaultFallbackStyleDescriptor;
}

@end
