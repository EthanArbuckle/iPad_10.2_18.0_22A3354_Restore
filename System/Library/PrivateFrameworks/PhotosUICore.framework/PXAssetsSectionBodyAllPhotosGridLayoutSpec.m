@implementation PXAssetsSectionBodyAllPhotosGridLayoutSpec

- (PXAssetsSectionBodyAllPhotosGridLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXAssetsSectionBodyAllPhotosGridLayoutSpec *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXAssetsSectionBodyAllPhotosGridLayoutSpec;
  v4 = -[PXDayAssetsSectionBodyLayoutSpec initWithExtendedTraitCollection:options:](&v8, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (v4)
  {
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interitemSpacing");
    v4->super._interitemSpacing = v6;

  }
  return v4;
}

@end
