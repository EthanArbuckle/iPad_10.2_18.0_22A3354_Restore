@implementation SBCoverSheetBlurView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBCoverSheetBlurView)initWithFrame:(CGRect)a3 scaleAdjustment:(id)a4 alphaAdjustment:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  SBCoverSheetBlurView *v13;
  const char *v14;
  SBCoverSheetBlurView *v15;
  SEL v16;
  void *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBCoverSheetBlurView;
  v13 = -[SBCoverSheetBlurView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v15 = v13;
  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v14, v11, 440);
    objc_setProperty_nonatomic_copy(v15, v16, v12, 448);
    -[SBCoverSheetBlurView setBlurRadius:](v15, "setBlurRadius:", 20.0);
    v15->_variantToTrack = 1;
    -[SBCoverSheetBlurView setDimmingColor:](v15, "setDimmingColor:", 0);
    -[SBCoverSheetBlurView _configureForCurrentReduceTransparencySetting](v15, "_configureForCurrentReduceTransparencySetting");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v15, sel__reduceTransparencyEnabledStateDidChange_, *MEMORY[0x1E0CEB098], 0);

    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:forVariant:", v15, v15->_variantToTrack);

  }
  return v15;
}

- (void)setScaleAdjustment:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 440);
}

- (void)setAlphaAdjustment:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 448);
}

- (uint64_t)setVariantToTrack:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 464) = a2;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forVariant:", self, self->_variantToTrack);

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetBlurView;
  -[SBCoverSheetBlurView dealloc](&v5, sel_dealloc);
}

- (void)layoutSubviews
{
  UIView *reduceTransparencyView;
  UIView *v4;

  if (self)
    reduceTransparencyView = self->_reduceTransparencyView;
  else
    reduceTransparencyView = 0;
  v4 = reduceTransparencyView;
  -[SBCoverSheetBlurView bounds](self, "bounds");
  -[UIView setFrame:](v4, "setFrame:");

}

- (uint64_t)reduceTransparencyView
{
  if (result)
    return *(_QWORD *)(result + 456);
  return result;
}

- (void)setBlurRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_blurRadius = a3;
    -[SBCoverSheetBlurView _updateForBlurRadius:weighting:forPresentationValue:](self, "_updateForBlurRadius:weighting:forPresentationValue:", 0, a3, self->_weighting);
  }
}

- (void)setDimmingColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dimmingColor, a3);
    -[SBCoverSheetBlurView _updateForBlurRadius:weighting:forPresentationValue:](self, "_updateForBlurRadius:weighting:forPresentationValue:", 0, self->_blurRadius, self->_weighting);
  }

}

- (void)setWeighting:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_weighting = a3;
    -[SBCoverSheetBlurView _updateForBlurRadius:weighting:forPresentationValue:](self, "_updateForBlurRadius:weighting:forPresentationValue:", 0, self->_blurRadius, a3);
  }
}

- (void)setWeighting:(double)a3 forPresentationValue:(BOOL)a4
{
  if (a4)
    -[SBCoverSheetBlurView _updateForBlurRadius:weighting:forPresentationValue:](self, "_updateForBlurRadius:weighting:forPresentationValue:", 1, self->_blurRadius, a3);
  else
    -[SBCoverSheetBlurView setWeighting:](self, "setWeighting:", a3);
}

- (void)_updateForBlurRadius:(double)a3 weighting:(double)a4 forPresentationValue:(BOOL)a5
{
  _BOOL4 v5;
  UIView *reduceTransparencyView;
  void *v10;
  SBCoverSheetBlurView *v11;
  uint64_t v12;
  SBCoverSheetBlurView *v13;
  double (**scaleAdjustment)(double);
  double v15;
  double (**alphaAdjustment)(double);
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *v32;
  id v33;

  v5 = a5;
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    if (self)
    {
      reduceTransparencyView = self->_reduceTransparencyView;
      if (v5)
      {
LABEL_4:
        v10 = (void *)MEMORY[0x1E0CB37E8];
        v11 = reduceTransparencyView;
        objc_msgSend(v10, "numberWithDouble:", a4);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v33 = (id)v12;
LABEL_12:
        -[SBCoverSheetBlurView _setPresentationValue:forKey:](v13, "_setPresentationValue:forKey:", v12, CFSTR("opacity"));
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      reduceTransparencyView = 0;
      if (v5)
        goto LABEL_4;
    }
    v32 = reduceTransparencyView;
    -[UIView layer](v32, "layer");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (SBCoverSheetBlurView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setValue:forKey:", v11, CFSTR("opacity"));
    goto LABEL_17;
  }
  scaleAdjustment = (double (**)(double))self->_scaleAdjustment;
  v15 = 1.0;
  if (scaleAdjustment)
    v15 = scaleAdjustment[2](a4);
  alphaAdjustment = (double (**)(double))self->_alphaAdjustment;
  v17 = 1.0;
  if (alphaAdjustment)
    v17 = alphaAdjustment[2](a4);
  v18 = a4 * 0.4 + 1.0;
  v19 = a3 * a4;
  -[UIColor colorWithAlphaComponent:](self->_dimmingColor, "colorWithAlphaComponent:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetBlurView _setPresentationValue:forKey:](self, "_setPresentationValue:forKey:", v21, CFSTR("filters.colorSaturate.inputAmount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetBlurView _setPresentationValue:forKey:](self, "_setPresentationValue:forKey:", v22, CFSTR("filters.gaussianBlur.inputRadius"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetBlurView _setPresentationValue:forKey:](self, "_setPresentationValue:forKey:", v23, CFSTR("scale"));

    v33 = objc_retainAutorelease(v20);
    -[SBCoverSheetBlurView _setPresentationValue:forKey:](self, "_setPresentationValue:forKey:", objc_msgSend(v33, "CGColor"), CFSTR("backgroundColor"));
    if (self->_alphaAdjustment)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
      v11 = (SBCoverSheetBlurView *)objc_claimAutoreleasedReturnValue();
      v13 = self;
      v12 = (uint64_t)v11;
      goto LABEL_12;
    }
  }
  else
  {
    -[SBCoverSheetBlurView layer](self, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKeyPath:", v25, CFSTR("filters.colorSaturate.inputAmount"));

    -[SBCoverSheetBlurView layer](self, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKeyPath:", v27, CFSTR("filters.gaussianBlur.inputRadius"));

    -[SBCoverSheetBlurView layer](self, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setValue:forKeyPath:", v29, CFSTR("scale"));

    -[SBCoverSheetBlurView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_retainAutorelease(v20);
    objc_msgSend(v30, "setValue:forKey:", objc_msgSend(v33, "CGColor"), CFSTR("backgroundColor"));

    if (self->_alphaAdjustment)
    {
      -[SBCoverSheetBlurView layer](self, "layer");
      v11 = (SBCoverSheetBlurView *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBCoverSheetBlurView setValue:forKeyPath:](v11, "setValue:forKeyPath:", v31, CFSTR("opacity"));

      goto LABEL_17;
    }
  }
LABEL_18:

}

- (void)_configureForCurrentReduceTransparencySetting
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[SBCoverSheetBlurView _createReduceTransparencyView](self, "_createReduceTransparencyView");
    -[SBCoverSheetBlurView _removeFilters](self, "_removeFilters");
  }
  else
  {
    -[SBCoverSheetBlurView _removeReduceTransparencyView](self, "_removeReduceTransparencyView");
    -[SBCoverSheetBlurView _createFilters](self, "_createFilters");
  }
}

- (void)_createFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", CFSTR("gaussianBlur"));
  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SBCoverSheetBlurView blurRadius](self, "blurRadius");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKeyPath:", v5, CFSTR("inputRadius"));

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", &unk_1E91CF7C8, CFSTR("inputAmount"));
  -[SBCoverSheetBlurView backdropLayer](self, "backdropLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIgnoresScreenClip:", 1);

  -[SBCoverSheetBlurView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", v9);

}

- (void)_removeFilters
{
  void *v3;
  id v4;

  -[SBCoverSheetBlurView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[SBCoverSheetBlurView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E91CF7D8, CFSTR("scale"));

}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  UIView *reduceTransparencyView;
  UIView *v5;
  id v6;

  if (self)
    reduceTransparencyView = self->_reduceTransparencyView;
  else
    reduceTransparencyView = 0;
  v5 = reduceTransparencyView;
  -[SBCoverSheetBlurView _averageWallpaperColor](self, "_averageWallpaperColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

}

- (void)_createReduceTransparencyView
{
  void *v3;
  id v4;

  if (!self || !self->_reduceTransparencyView)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[SBCoverSheetBlurView _averageWallpaperColor](self, "_averageWallpaperColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    -[SBCoverSheetBlurView setReduceTransparencyView:]((uint64_t)self, v4);
    -[SBCoverSheetBlurView insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);

  }
}

- (void)setReduceTransparencyView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 456), a2);
}

- (void)_removeReduceTransparencyView
{
  SBCoverSheetBlurView *v2;

  v2 = self;
  if (self)
    self = (SBCoverSheetBlurView *)self->_reduceTransparencyView;
  -[SBCoverSheetBlurView removeFromSuperview](self, "removeFromSuperview");
  -[SBCoverSheetBlurView setReduceTransparencyView:]((uint64_t)v2, 0);
}

- (id)_averageWallpaperColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageColorForVariant:", self->_variantToTrack);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)weighting
{
  return self->_weighting;
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (uint64_t)scaleAdjustment
{
  if (result)
    return *(_QWORD *)(result + 440);
  return result;
}

- (uint64_t)alphaAdjustment
{
  if (result)
    return *(_QWORD *)(result + 448);
  return result;
}

- (uint64_t)variantToTrack
{
  if (result)
    return *(_QWORD *)(result + 464);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyView, 0);
  objc_storeStrong(&self->_alphaAdjustment, 0);
  objc_storeStrong(&self->_scaleAdjustment, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
}

@end
