@implementation PGBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (PGBackdropView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  PGBackdropView *v9;
  PGBackdropView *v10;
  void *v11;
  uint64_t v12;
  CAFilter *gaussianBlurFilter;
  id v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v17.receiver = self;
  v17.super_class = (Class)PGBackdropView;
  v9 = -[PGBackdropView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    -[__PGView setAnimatedLayerProperties:](v9, "setAnimatedLayerProperties:", &unk_1E6242AA0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v11, "setValue:forKey:", &unk_1E6242A08, CFSTR("inputRadius"));
    v12 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v11, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("inputHardEdges"));
    gaussianBlurFilter = v10->_gaussianBlurFilter;
    v10->_gaussianBlurFilter = (CAFilter *)v11;
    v14 = v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__updateFilters, *MEMORY[0x1E0CEB098], 0);

    -[PGBackdropView _updateFilters](v10, "_updateFilters");
  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PGBackdropView;
  -[PGBackdropView dealloc](&v5, sel_dealloc);
}

- (void)_updateFilters
{
  CAFilter *averageColorFilter;
  CAFilter *v4;
  CAFilter *v5;
  CAFilter *gaussianBlurFilter;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_gaussianBlurFilter);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    averageColorFilter = self->_averageColorFilter;
    if (!averageColorFilter)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2B88]);
      v4 = (CAFilter *)objc_claimAutoreleasedReturnValue();
      v5 = self->_averageColorFilter;
      self->_averageColorFilter = v4;

      averageColorFilter = self->_averageColorFilter;
    }
    objc_msgSend(v10, "addObject:", averageColorFilter);
  }
  gaussianBlurFilter = self->_gaussianBlurFilter;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PGBackdropView gaussianBlurRadius](self, "gaussianBlurRadius");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFilter setValue:forKey:](gaussianBlurFilter, "setValue:forKey:", v8, CFSTR("inputRadius"));

  -[PGBackdropView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v10);

}

- (NSString)groupName
{
  void *v2;
  void *v3;

  -[PGBackdropView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PGBackdropView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupName:", v4);

}

- (double)gaussianBlurRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PGBackdropView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setGaussianBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[PGBackdropView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (double)backdropScale
{
  void *v2;
  double v3;
  double v4;

  -[PGBackdropView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (void)setBackdropScale:(double)a3
{
  id v4;

  -[PGBackdropView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScale:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColorFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
}

@end
