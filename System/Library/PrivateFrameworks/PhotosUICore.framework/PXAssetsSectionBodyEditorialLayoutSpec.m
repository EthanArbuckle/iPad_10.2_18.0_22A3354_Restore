@implementation PXAssetsSectionBodyEditorialLayoutSpec

- (PXAssetsSectionBodyEditorialLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXAssetsSectionBodyEditorialLayoutSpec *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXAssetsSectionBodyEditorialLayoutSpec;
  v4 = -[PXDayAssetsSectionBodyLayoutSpec initWithExtendedTraitCollection:options:](&v8, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (v4)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerRadiusForDays");
    *(float *)&v6 = v6;
    v4->super._bodyCornerRadius = ($1A92715FA36BAB2AB993A583878CDF5D)vdupq_lane_s32(*(int32x2_t *)&v6, 0);

  }
  return v4;
}

@end
