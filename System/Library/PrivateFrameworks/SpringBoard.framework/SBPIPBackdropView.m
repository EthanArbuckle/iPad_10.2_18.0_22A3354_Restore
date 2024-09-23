@implementation SBPIPBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBPIPBackdropView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  SBPIPBackdropView *v9;
  SBPIPBackdropView *v10;
  NSArray *animatedLayerProperties;
  void *v12;
  uint64_t v13;
  CAFilter *gaussianBlurFilter;
  id v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  SBLogPIP();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBPIPBackdropView initWithFrame:].cold.1();

  v18.receiver = self;
  v18.super_class = (Class)SBPIPBackdropView;
  v9 = -[SBPIPBackdropView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    animatedLayerProperties = v9->_animatedLayerProperties;
    v9->_animatedLayerProperties = (NSArray *)&unk_1E91CE368;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v12, "setValue:forKey:", &unk_1E91CF648, CFSTR("inputRadius"));
    v13 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v12, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("inputHardEdges"));
    gaussianBlurFilter = v10->_gaussianBlurFilter;
    v10->_gaussianBlurFilter = (CAFilter *)v12;
    v15 = v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v10, sel__updateFilters, *MEMORY[0x1E0CEB098], 0);

    -[SBPIPBackdropView _updateFilters](v10, "_updateFilters");
  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;

  SBLogPIP();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBPIPBackdropView initWithFrame:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SBPIPBackdropView;
  -[SBPIPBackdropView dealloc](&v5, sel_dealloc);
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
  -[SBPIPBackdropView gaussianBlurRadius](self, "gaussianBlurRadius");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFilter setValue:forKey:](gaussianBlurFilter, "setValue:forKey:", v8, CFSTR("inputRadius"));

  -[SBPIPBackdropView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v10);

}

- (NSString)groupName
{
  void *v2;
  void *v3;

  -[SBPIPBackdropView layer](self, "layer");
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
  -[SBPIPBackdropView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupName:", v4);

}

- (double)gaussianBlurRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBPIPBackdropView layer](self, "layer");
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

  -[SBPIPBackdropView layer](self, "layer");
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

  -[SBPIPBackdropView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (void)setBackdropScale:(double)a3
{
  id v4;

  -[SBPIPBackdropView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScale:", a3);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[NSArray containsObject:](self->_animatedLayerProperties, "containsObject:", v4))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBPIPBackdropView;
    v5 = -[SBPIPBackdropView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedLayerProperties, 0);
  objc_storeStrong((id *)&self->_averageColorFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
}

- (void)initWithFrame:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
