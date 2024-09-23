@implementation PXGDisplayAssetBlurAdjustment

- (PXGDisplayAssetBlurAdjustment)initWithBlurRadius:(double)a3 darkeningOverlayOpacity:(double)a4
{
  PXGDisplayAssetBlurAdjustment *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGDisplayAssetBlurAdjustment;
  result = -[PXGDisplayAssetBlurAdjustment init](&v7, sel_init);
  if (result)
  {
    result->_blurRadius = a3;
    result->_darkeningOverlayOpacity = a4;
  }
  return result;
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "imageByClampingToExtent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIGaussianBlur"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x1E0C9E1F8]);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PXGDisplayAssetBlurAdjustment blurRadius](self, "blurRadius");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, *MEMORY[0x1E0C9E258]);

  objc_msgSend(v7, "outputImage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGDisplayAssetBlurAdjustment darkeningOverlayOpacity](self, "darkeningOverlayOpacity");
  v12 = v11;
  if (v13 > 0.0)
  {
    v14 = (void *)MEMORY[0x1E0DC3658];
    -[PXGDisplayAssetBlurAdjustment darkeningOverlayOpacity](self, "darkeningOverlayOpacity");
    objc_msgSend(v14, "colorWithWhite:alpha:", 0.0, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithColor:", v26);
    v17 = (void *)MEMORY[0x1E0C9DDB8];
    v29 = *MEMORY[0x1E0C9E1C0];
    v30[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filterWithName:withInputParameters:", CFSTR("CIConstantColorGenerator"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "outputImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C9DDB8];
    v27[0] = *MEMORY[0x1E0C9E190];
    v27[1] = v8;
    v28[0] = v11;
    v28[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filterWithName:withInputParameters:", CFSTR("CISourceOverCompositing"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "outputImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "extent", v26);
  objc_msgSend(v12, "imageByCroppingToRect:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "blurRadius");
    v6 = v5;
    -[PXGDisplayAssetBlurAdjustment blurRadius](self, "blurRadius");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 1;
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 1;
}

- (CGSize)requestSizeForProposedTargetSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  PXSizeMin();
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 1;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)darkeningOverlayOpacity
{
  return self->_darkeningOverlayOpacity;
}

@end
