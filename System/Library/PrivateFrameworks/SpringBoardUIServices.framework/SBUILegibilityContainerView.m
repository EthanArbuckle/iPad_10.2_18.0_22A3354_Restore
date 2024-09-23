@implementation SBUILegibilityContainerView

- (void)setImage:(id)a3
{
  UIImage *processedImage;
  UIImage *strengthenedImage;
  id v7;

  v7 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    -[SBUILegibilityContainerView _resetImages](self, "_resetImages");
    objc_storeStrong((id *)&self->_image, a3);
    processedImage = self->_processedImage;
    self->_processedImage = 0;

    strengthenedImage = self->_strengthenedImage;
    self->_strengthenedImage = 0;

    self->_strength = 0.0;
    self->_dirty = 1;
    -[SBUILegibilityContainerView _applyStrength](self, "_applyStrength");
    -[SBUILegibilityContainerView _updateFilters](self, "_updateFilters");
  }

}

- (void)setImage:(id)a3 strengthenedImage:(id)a4 strength:(double)a5
{
  id v9;
  UIImage *processedImage;
  id v11;

  v11 = a3;
  v9 = a4;
  if (!-[UIImage isEqual:](self->_image, "isEqual:", v11)
    || !-[UIImage isEqual:](self->_strengthenedImage, "isEqual:", v9)
    || self->_strength != a5)
  {
    -[SBUILegibilityContainerView _resetImages](self, "_resetImages");
    objc_storeStrong((id *)&self->_image, a3);
    processedImage = self->_processedImage;
    self->_processedImage = 0;

    objc_storeStrong((id *)&self->_strengthenedImage, a4);
    self->_strength = a5;
    -[SBUILegibilityContainerView _setDrawImage:](self, "_setDrawImage:", v9);
    -[SBUILegibilityContainerView _updateFilters](self, "_updateFilters");
    self->_dirty = 0;
  }

}

- (void)_resetImages
{
  UIImage *image;
  UIImage *strengthenedImage;
  UIImage *processedImage;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  UIImage *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  UIImage *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  UIImage *v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = self->_image;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = self->_strengthenedImage;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = self->_processedImage;
  image = self->_image;
  self->_image = 0;

  strengthenedImage = self->_strengthenedImage;
  self->_strengthenedImage = 0;

  processedImage = self->_processedImage;
  self->_processedImage = 0;

  if (v21[5] || v15[5] || v9[5])
  {
    objc_msgSend((id)objc_opt_class(), "legibilityImageDisposalQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SBUILegibilityContainerView__resetImages__block_invoke;
    block[3] = &unk_1E4C3ECC8;
    block[4] = &v20;
    block[5] = &v14;
    block[6] = &v8;
    dispatch_async(v6, block);

  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

}

+ (id)legibilityImageDisposalQueue
{
  if (legibilityImageDisposalQueue_onceToken != -1)
    dispatch_once(&legibilityImageDisposalQueue_onceToken, &__block_literal_global_5);
  return (id)legibilityImageDisposalQueue_disposalQueue;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBUILegibilityContainerView;
  -[SBUILegibilityContainerView layoutSubviews](&v12, sel_layoutSubviews);
  -[SBUILegibilityContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUILegibilityContainerView _drawView](self, "_drawView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_setDrawImage:(id)a3
{
  void *v4;
  UIImage *v5;
  UIImage *processedImage;
  UIImage *v7;
  void *v8;
  UIImage *v9;

  v9 = (UIImage *)a3;
  if (!-[SBUILegibilityContainerView _usesColorFilters](self, "_usesColorFilters")
    && -[SBUILegibilityContainerView _usesSecondaryColor](self, "_usesSecondaryColor"))
  {
    -[SBUILegibilityContainerView _contentColor](self, "_contentColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage imageWithTintColor:](v9, "imageWithTintColor:", v4);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    processedImage = self->_processedImage;
    self->_processedImage = v5;

    v7 = v5;
    v9 = v7;
  }
  -[SBUILegibilityContainerView _drawView](self, "_drawView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);
  -[SBUILegibilityContainerView bounds](self, "bounds");
  objc_msgSend(v8, "setFrame:");

}

- (id)_drawView
{
  _SBUILegibilityContainerContentView *drawView;
  _SBUILegibilityContainerContentView *v4;
  _SBUILegibilityContainerContentView *v5;

  drawView = self->_drawView;
  if (!drawView)
  {
    -[SBUILegibilityContainerView buildDrawView](self, "buildDrawView");
    v4 = (_SBUILegibilityContainerContentView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_drawView;
    self->_drawView = v4;

    -[SBUILegibilityContainerView addSubview:](self, "addSubview:", self->_drawView);
    drawView = self->_drawView;
  }
  return drawView;
}

- (BOOL)_updateFilters
{
  SBUILegibilityContainerView *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_legibilitySettings)
  {
    v2 = self;
    -[SBUILegibilityContainerView _contentColor](self, "_contentColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[SBUILegibilityContainerView layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = -[SBUILegibilityContainerView _usesColorFilters](v2, "_usesColorFilters");
    objc_msgSend(v5, "filters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((_DWORD)v2)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__SBUILegibilityContainerView__updateFilters__block_invoke;
      v13[3] = &__block_descriptor_40_e18_B16__0__CAFilter_8l;
      v13[4] = v4;
      objc_msgSend(v6, "bs_firstObjectPassingTest:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v9) = v8 == 0;
      if (!v8)
      {
        v10 = *MEMORY[0x1E0CD2E60];
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setName:", v10);
        objc_msgSend(v8, "setValue:forKey:", v4, CFSTR("inputColor"));
        v14[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setFilters:", v11);

      }
    }
    else
    {
      v9 = objc_msgSend(v6, "count") != 0;

      objc_msgSend(v5, "setFilters:", 0);
    }
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_usesColorFilters
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((SBUILegibilitySettingsAreEqual(v5, self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    self->_dirty = 1;
    -[SBUILegibilityContainerView _updateFilters](self, "_updateFilters");
    -[SBUILegibilityContainerView _applyStrength](self, "_applyStrength");
  }

}

- (void)setLegibilityEngine:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_legibilityEngine);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_legibilityEngine, obj);
    self->_dirty = 1;
    -[SBUILegibilityContainerView _applyStrength](self, "_applyStrength");
    v5 = obj;
  }

}

- (SBUILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)_applyStrength
{
  void *v3;
  double strength;
  UIImage *image;
  UIImage *v6;
  UIImage *strengthenedImage;
  UIImage *v8;
  void *v9;
  id v10;

  if (self->_dirty && self->_image)
  {
    -[SBUILegibilityContainerView legibilityEngine](self, "legibilityEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    strength = self->_strength;
    v10 = v3;
    if (v3 || strength != 0.0)
    {
      image = self->_image;
      if (strength > 0.0)
      {
        objc_msgSend(v3, "applyStrength:toImage:settings:", image, self->_legibilitySettings);
        v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
        strengthenedImage = self->_strengthenedImage;
        self->_strengthenedImage = v6;
        v8 = v6;

        -[SBUILegibilityContainerView _setDrawImage:](self, "_setDrawImage:", v8);
        v9 = v10;
        self->_dirty = 0;
LABEL_10:

        return;
      }
    }
    else
    {
      image = self->_image;
    }
    -[SBUILegibilityContainerView _setDrawImage:](self, "_setDrawImage:", image);
    v9 = v10;
    goto LABEL_10;
  }
}

- (id)_contentColor
{
  _BOOL4 v3;
  SBUILegibilitySettings *legibilitySettings;

  v3 = -[SBUILegibilityContainerView _usesSecondaryColor](self, "_usesSecondaryColor");
  legibilitySettings = self->_legibilitySettings;
  if (v3)
    -[SBUILegibilitySettings secondaryColor](legibilitySettings, "secondaryColor");
  else
    -[SBUILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_usesSecondaryColor
{
  return self->_options & 1;
}

- (BOOL)updateOptions:(int64_t)a3
{
  int64_t options;

  options = self->_options;
  if (options != a3)
  {
    self->_options = a3;
    -[SBUILegibilityContainerView _updateFilters](self, "_updateFilters");
    self->_dirty = 1;
    -[SBUILegibilityContainerView _applyStrength](self, "_applyStrength");
  }
  return options != a3;
}

- (double)strength
{
  return self->_strength;
}

- (SBUILegibilityEngine)legibilityEngine
{
  return (SBUILegibilityEngine *)objc_loadWeakRetained((id *)&self->_legibilityEngine);
}

- (id)buildDrawView
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContentMode:", 0);
  return v2;
}

- (void)setStrength:(double)a3
{
  if (self->_strength != a3)
  {
    self->_strength = a3;
    self->_dirty = 1;
    -[SBUILegibilityContainerView _applyStrength](self, "_applyStrength");
  }
}

BOOL __45__SBUILegibilityContainerView__updateFilters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CGColor *v5;
  CGColor *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CD2E60]))
  {
    v5 = *(CGColor **)(a1 + 32);
    objc_msgSend(v3, "valueForKey:", CFSTR("inputColor"));
    v6 = (CGColor *)objc_claimAutoreleasedReturnValue();
    v7 = CGColorEqualToColor(v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __43__SBUILegibilityContainerView__resetImages__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  v4 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  *(_QWORD *)(v2 + 40) = 0;
  v12 = v5;
  v6 = v4;
  v7 = v3;

  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __59__SBUILegibilityContainerView_legibilityImageDisposalQueue__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = BSDispatchQueueCreateWithQualityOfService();
  v1 = (void *)legibilityImageDisposalQueue_disposalQueue;
  legibilityImageDisposalQueue_disposalQueue = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[SBUILegibilityContainerView _resetImages](self, "_resetImages");
  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityContainerView;
  -[SBUILegibilityContainerView dealloc](&v3, sel_dealloc);
}

- (void)applySettingsForLegibilityStyle:(int64_t)a3
{
  id v4;

  +[SBUILegibilitySettings sharedInstanceForStyle:](SBUILegibilitySettings, "sharedInstanceForStyle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityContainerView setLegibilitySettings:](self, "setLegibilitySettings:", v4);

}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[SBUILegibilityContainerView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UIImage size](self->_image, "size");
  -[SBUILegibilityContainerView setFrame:](self, "setFrame:", v4, v6, v7, v8);
  -[SBUILegibilityContainerView _drawView](self, "_drawView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityContainerView bounds](self, "bounds");
  objc_msgSend(v9, "setFrame:");

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorMatrix.inputColorMatrix")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILegibilityContainerView;
    v5 = -[SBUILegibilityContainerView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (UIImage)strengthenedImage
{
  return self->_strengthenedImage;
}

- (UIImage)processedImage
{
  return self->_processedImage;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_legibilityEngine);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_drawView, 0);
  objc_storeStrong((id *)&self->_processedImage, 0);
  objc_storeStrong((id *)&self->_strengthenedImage, 0);
}

@end
