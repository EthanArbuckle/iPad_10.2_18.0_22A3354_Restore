@implementation PXStoryColorNormalizationAdjustment

- (PXStoryColorNormalizationAdjustment)initWithNormalization:(id)a3
{
  id v5;
  id v6;
  PXStoryColorNormalizationAdjustment *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryColorNormalizationAdjustment.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("normalization != nil"));

  }
  v6 = objc_alloc_init((Class)getPIColorNormalizationFilterClass());
  objc_msgSend(v6, "setInputNormalization:", v5);
  v7 = -[PXStoryColorNormalizationAdjustment initWithNormalizationFilter:](self, "initWithNormalizationFilter:", v6);

  return v7;
}

- (PXStoryColorNormalizationAdjustment)initWithNormalizationFilter:(id)a3
{
  id v6;
  PXStoryColorNormalizationAdjustment *v7;
  PXStoryColorNormalizationAdjustment *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryColorNormalizationAdjustment.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PXStoryColorNormalizationAdjustment;
  v7 = -[PXStoryColorNormalizationAdjustment init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_filter, a3);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_useFalseColor = objc_msgSend(v9, "enableFalseColorNormalization");

    v8->_intensity = 1.0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryColorNormalizationAdjustment filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  PXStoryColorNormalizationAdjustment *v4;
  PXStoryColorNormalizationAdjustment *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXStoryColorNormalizationAdjustment *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryColorNormalizationAdjustment filter](self, "filter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryColorNormalizationAdjustment filter](v5, "filter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 1;
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 0;
}

- (PFStoryRecipeDisplayAssetNormalization)normalization
{
  return (PFStoryRecipeDisplayAssetNormalization *)-[PIColorNormalizationFilter inputNormalization](self->_filter, "inputNormalization");
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  id v5;
  CGColorSpace *v6;
  NSData *colorCubeData;
  void *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[3];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[PXStoryColorNormalizationAdjustment useColorCube](self, "useColorCube"))
  {
    v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    colorCubeData = self->_colorCubeData;
    if (!colorCubeData)
    {
      -[PIColorNormalizationFilter inputNormalization](self->_filter, "inputNormalization");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXStoryColorNormalizationAdjustment colorCubeForNormalization:targetColorSpace:](PXStoryColorNormalizationAdjustment, "colorCubeForNormalization:targetColorSpace:", v8, v6);
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      v10 = self->_colorCubeData;
      self->_colorCubeData = v9;

      colorCubeData = self->_colorCubeData;
    }
    v29[0] = CFSTR("inputCubeData");
    v29[1] = CFSTR("inputColorSpace");
    v30[0] = colorCubeData;
    v30[1] = v6;
    v29[2] = CFSTR("inputCubeDimension");
    v30[2] = &unk_1E53EBCD0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorCubeWithColorSpace"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    CGColorSpaceRelease(v6);
  }
  else
  {
    -[PIColorNormalizationFilter setInputImage:](self->_filter, "setInputImage:", v5);
    -[PIColorNormalizationFilter outputImage](self->_filter, "outputImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIColorNormalizationFilter setInputImage:](self->_filter, "setInputImage:", 0);
  }
  if (-[PXStoryColorNormalizationAdjustment useFalseColor](self, "useFalseColor"))
  {
    v27[0] = CFSTR("inputRVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    v27[1] = CFSTR("inputGVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    v27[2] = CFSTR("inputBVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    v27[3] = CFSTR("inputBiasVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
  }
  -[PXStoryColorNormalizationAdjustment intensity](self, "intensity");
  if (v19 < 1.0)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[PXStoryColorNormalizationAdjustment intensity](self, "intensity", CFSTR("inputTargetImage"), CFSTR("inputTime"), v12);
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDissolveTransition"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v23;
  }

  return v12;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 1;
}

- (NSString)adjustmentSummary
{
  return (NSString *)CFSTR("precomputed");
}

- (NSString)adjustmentDetails
{
  void *v2;
  void *v3;

  -[PXStoryColorNormalizationAdjustment normalization](self, "normalization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)useFalseColor
{
  return self->_useFalseColor;
}

- (void)setUseFalseColor:(BOOL)a3
{
  self->_useFalseColor = a3;
}

- (BOOL)useColorCube
{
  return self->_useColorCube;
}

- (void)setUseColorCube:(BOOL)a3
{
  self->_useColorCube = a3;
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (PIColorNormalizationFilter)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_colorCubeData, 0);
}

+ (id)dummyAdjustment
{
  return objc_alloc_init(PXStoryColorNormalizationFakeAdjustment);
}

+ (id)dummyNormalization
{
  return +[PXStoryColorNormalizationFakeAdjustment fakeNormalization](PXStoryColorNormalizationFakeAdjustment, "fakeNormalization");
}

+ (id)autoAdjustmentForAsset:(id)a3
{
  id v3;
  id v4;
  PXStoryColorNormalizationAutoAdjustment *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)getPIColorNormalizationFilterClass());
  v5 = -[PXStoryColorNormalizationAdjustment initWithNormalizationFilter:]([PXStoryColorNormalizationAutoAdjustment alloc], "initWithNormalizationFilter:", v4);
  -[PXStoryColorNormalizationAutoAdjustment setAsset:](v5, "setAsset:", v3);

  return v5;
}

+ (id)_falseColorMatrixParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("inputRVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("inputGVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("inputBVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("inputBiasVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)colorCubeForNormalization:(id)a3 targetColorSpace:(CGColorSpace *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(getPIColorNormalizationFilterClass(), "colorCubeForNormalization:dimension:targetColorSpace:", v5, 32, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
