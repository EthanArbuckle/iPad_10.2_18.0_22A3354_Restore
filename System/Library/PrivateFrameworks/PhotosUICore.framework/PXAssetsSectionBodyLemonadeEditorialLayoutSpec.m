@implementation PXAssetsSectionBodyLemonadeEditorialLayoutSpec

- (PXAssetsSectionBodyLemonadeEditorialLayoutSpec)initWithExtendedTraitCollection:(id)a3 bodyCornerRadius:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  id v13;
  PXAssetsSectionBodyLemonadeEditorialLayoutSpec *v14;
  PXAssetsSectionBodyLemonadeEditorialLayoutSpec *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  double v22;
  objc_super v24;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXAssetsSectionBodyLemonadeEditorialLayoutSpec;
  v14 = -[PXFeatureSpec initWithExtendedTraitCollection:](&v24, sel_initWithExtendedTraitCollection_, v13);
  v15 = v14;
  if (v14)
  {
    v14->super._bodyCornerRadius.var0.var0.topLeft = v11;
    v14->super._bodyCornerRadius.var0.var0.topRight = v10;
    v14->super._bodyCornerRadius.var0.var0.bottomLeft = v9;
    v14->super._bodyCornerRadius.var0.var0.bottomRight = v8;
    v16 = objc_msgSend(v13, "userInterfaceIdiom");
    if (v16 == 5)
    {
      v17 = 240;
      v18 = 0x4010000000000000;
      goto LABEL_6;
    }
    if (v16 == 4)
    {
      v17 = 248;
      v18 = 0x402A000000000000;
LABEL_6:
      *(Class *)((char *)&v15->super.super.super.isa + v17) = (Class)v18;
      goto LABEL_12;
    }
    if (objc_msgSend(v13, "userInterfaceStyle") == 2
      || (+[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "forceDarkDetailsView"),
          v19,
          (v20 & 1) != 0))
    {
      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "darkModeInteritemSpacing");
    }
    else
    {
      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "interitemSpacing");
    }
    v15->super._interitemSpacing = v22;

  }
LABEL_12:

  return v15;
}

@end
