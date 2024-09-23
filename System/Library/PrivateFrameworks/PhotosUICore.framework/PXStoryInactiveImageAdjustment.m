@implementation PXStoryInactiveImageAdjustment

- (PXStoryInactiveImageAdjustment)init
{
  return (PXStoryInactiveImageAdjustment *)StoryInactiveImageAdjustment.init()();
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  id v5;
  PXStoryInactiveImageAdjustment *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1A6C7E1C4(v5);

  return v7;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  PXStoryInactiveImageAdjustment *v4;
  char v5;

  type metadata accessor for StoryInactiveImageAdjustment();
  if (swift_dynamicCastClass())
  {
    sub_1A6856488(0, (unint64_t *)&qword_1EE8D9440);
    swift_unknownObjectRetain();
    v4 = self;
    v5 = sub_1A7AE4364();
    swift_unknownObjectRelease();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 1;
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 0;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 1;
}

- (void).cxx_destruct
{

}

@end
