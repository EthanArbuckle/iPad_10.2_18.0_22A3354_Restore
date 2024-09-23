@implementation PUPhotoEditAdjustmentControl

- (PUPhotoEditAdjustmentControl)initWithFrame:(CGRect)a3
{
  PUPhotoEditAdjustmentControl *v3;
  PUPhotoEditAdjustmentControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAdjustmentControl;
  v3 = -[PUPhotoEditAdjustmentControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_minValue = -1.0;
    v3->_maxValue = 1.0;
    v3->_value = 0.0;
    v3->_defaultValue = 0.0;
    v3->_identityValue = 0.0;
    -[PUPhotoEditAdjustmentControl _setup](v3, "_setup");
    -[PUPhotoEditAdjustmentControl setContentMode:](v4, "setContentMode:", 3);
  }
  return v4;
}

- (void)_setup
{
  UIColor *v3;
  UIColor *defaultColor;
  UIColor *v5;
  UIColor *alternateColor;
  PUPhotoEditCircularIndicatorView *v7;
  PUPhotoEditCircularIndicatorView *v8;
  PUPhotoEditCircularIndicatorView *circularIndicatorView;
  id v10;
  UILabel *v11;
  UILabel *valueLabel;
  void *v13;
  void *v14;
  NSNumberFormatter *v15;
  NSNumberFormatter *formatter;
  NSNumberFormatter *v17;
  void *v18;
  void *v19;
  id v20;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "photoEditingAdjustmentControlDefaultColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  defaultColor = self->_defaultColor;
  self->_defaultColor = v3;

  objc_msgSend(v20, "photoEditingAdjustmentControlAlternateColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  alternateColor = self->_alternateColor;
  self->_alternateColor = v5;

  v7 = [PUPhotoEditCircularIndicatorView alloc];
  -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
  v8 = -[PUPhotoEditCircularIndicatorView initWithFrame:](v7, "initWithFrame:");
  circularIndicatorView = self->_circularIndicatorView;
  self->_circularIndicatorView = v8;

  -[PUPhotoEditCircularIndicatorView setRingColor:](self->_circularIndicatorView, "setRingColor:", self->_defaultColor);
  -[PUPhotoEditCircularIndicatorView setUserInteractionEnabled:](self->_circularIndicatorView, "setUserInteractionEnabled:", 0);
  -[PUPhotoEditAdjustmentControl addSubview:](self, "addSubview:", self->_circularIndicatorView);
  v10 = objc_alloc(MEMORY[0x1E0DC3990]);
  -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
  v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:");
  valueLabel = self->_valueLabel;
  self->_valueLabel = v11;

  PXMonospacedNumberFontWithSizeAndWeight();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_valueLabel, "setFont:", v13);
  -[UILabel setTextAlignment:](self->_valueLabel, "setTextAlignment:", 1);
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", self->_defaultColor);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  formatter = self->_formatter;
  self->_formatter = v15;

  -[NSNumberFormatter setLocale:](self->_formatter, "setLocale:", v14);
  -[NSNumberFormatter setMultiplier:](self->_formatter, "setMultiplier:", &unk_1E59BC2D0);
  -[NSNumberFormatter setRoundingMode:](self->_formatter, "setRoundingMode:", 4);
  v17 = self->_formatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_value);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v17, "stringFromNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_valueLabel, "setText:", v19);

  -[UILabel setAlpha:](self->_valueLabel, "setAlpha:", 0.0);
  -[PUPhotoEditAdjustmentControl addSubview:](self, "addSubview:", self->_valueLabel);
  self->_shouldShowCircularRing = 1;
  self->_shouldScaleDownImage = 1;
  self->_displayMappedValue = 1;

}

- (void)_resetAllValues
{
  UIColor *defaultColor;
  id v4;

  -[PUPhotoEditAdjustmentControl setValue:](self, "setValue:", 0.0);
  self->_minValue = -1.0;
  self->_maxValue = 1.0;
  self->_defaultValue = 0.0;
  self->_identityValue = 0.0;
  defaultColor = self->_defaultColor;
  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRingColor:", defaultColor);

}

- (void)resetToDefaults
{
  void *v3;

  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetToDefaults");

  -[PUPhotoEditAdjustmentControl _resetAllValues](self, "_resetAllValues");
}

- (void)_setupImageView
{
  double v3;
  double v4;
  double v5;
  UIImageView *v6;
  UIImageView *imageView;

  if (!self->_imageView)
  {
    -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
    v4 = v3;
    -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
    v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, v4, v5);
    imageView = self->_imageView;
    self->_imageView = v6;

    -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
    -[PUPhotoEditAdjustmentControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_imageView, self->_valueLabel);
  }
}

- (void)_layoutImageView
{
  UIImageView *imageView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  imageView = self->_imageView;
  if (imageView)
  {
    if ((-[UIImageView isHidden](imageView, "isHidden") & 1) == 0)
    {
      -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
      v5 = v4;
      -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
      -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v5);
      -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
      PXRectGetCenter();
      v7 = v6;
      v9 = v8;
      -[PUPhotoEditAdjustmentControl imageView](self, "imageView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCenter:", v7, v9);

    }
  }
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PUPhotoEditAdjustmentControl;
  -[PUPhotoEditAdjustmentControl layoutSubviews](&v21, sel_layoutSubviews);
  -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PUPhotoEditAdjustmentControl bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PUPhotoEditAdjustmentControl valueLabel](self, "valueLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[PUPhotoEditAdjustmentControl _updateImageView](self, "_updateImageView");
  -[PUPhotoEditAdjustmentControl _layoutImageView](self, "_layoutImageView");
  -[PUPhotoEditAdjustmentControl _updateRingVisibility](self, "_updateRingVisibility");
}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  NSMapTable *v6;
  NSMapTable *stateToContentMap;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!self->_stateToContentMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    stateToContentMap = self->_stateToContentMap;
    self->_stateToContentMap = v6;

  }
  -[PUPhotoEditAdjustmentControl stateToContentMap](self, "stateToContentMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, v9);
  else
    objc_msgSend(v8, "removeObjectForKey:", v9);

}

- (id)_contentForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_stateToContentMap)
  {
    -[PUPhotoEditAdjustmentControl stateToContentMap](self, "stateToContentMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_setContentPropertyKey:(id)a3 withValue:(id)a4 forState:(unint64_t)a5
{
  id v8;
  id v9;
  PUPhotoEditAdjustmentControlContent *v10;
  id v11;
  int v12;

  v8 = a3;
  v9 = a4;
  -[PUPhotoEditAdjustmentControl _contentForState:](self, "_contentForState:", a5);
  v10 = (PUPhotoEditAdjustmentControlContent *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(PUPhotoEditAdjustmentControlContent);
    -[PUPhotoEditAdjustmentControl _setContent:forState:](self, "_setContent:forState:", v10, a5);
  }
  -[PUPhotoEditAdjustmentControlContent valueForKey:](v10, "valueForKey:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v9)
    LOBYTE(v12) = 0;
  else
    v12 = objc_msgSend(v9, "isEqual:", v11) ^ 1;
  -[PUPhotoEditAdjustmentControlContent setValue:forKey:](v10, "setValue:forKey:", v9, v8);

  return v12;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  if (-[PUPhotoEditAdjustmentControl _setContentPropertyKey:withValue:forState:](self, "_setContentPropertyKey:withValue:forState:", CFSTR("image"), a3, a4))
  {
    -[PUPhotoEditAdjustmentControl _updateImageView](self, "_updateImageView");
  }
}

- (id)imageForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PUPhotoEditAdjustmentControl _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUPhotoEditAdjustmentControl _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setColor:(id)a3 forState:(unint64_t)a4
{
  -[PUPhotoEditAdjustmentControl _setContentPropertyKey:withValue:forState:](self, "_setContentPropertyKey:withValue:forState:", CFSTR("color"), a3, a4);
}

- (id)colorForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PUPhotoEditAdjustmentControl _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUPhotoEditAdjustmentControl _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_currentImage
{
  return -[PUPhotoEditAdjustmentControl imageForState:](self, "imageForState:", -[PUPhotoEditAdjustmentControl state](self, "state"));
}

- (void)setDefaultColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_defaultColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_defaultColor, a3);
    -[PUPhotoEditAdjustmentControl _updateSubviewColors](self, "_updateSubviewColors");
    v5 = v6;
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PUPhotoEditAdjustmentControl isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotoEditAdjustmentControl;
    -[PUPhotoEditAdjustmentControl setSelected:](&v5, sel_setSelected_, v3);
    -[PUPhotoEditAdjustmentControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PUPhotoEditAdjustmentControl isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotoEditAdjustmentControl;
    -[PUPhotoEditAdjustmentControl setEnabled:](&v5, sel_setEnabled_, v3);
    -[PUPhotoEditAdjustmentControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setValue:(double)a3
{
  double v4;

  if (self->_value != a3)
  {
    -[PUPhotoEditAdjustmentControl minValue](self, "minValue");
    -[PUPhotoEditAdjustmentControl maxValue](self, "maxValue");
    PXClamp();
    self->_value = v4;
    -[PUPhotoEditAdjustmentControl _updateSubviews](self, "_updateSubviews");
  }
}

- (void)setShouldShowValueLabel:(BOOL)a3
{
  if (self->_shouldShowValueLabel != a3)
  {
    self->_shouldShowValueLabel = a3;
    -[PUPhotoEditAdjustmentControl _updateSubviewVisibility](self, "_updateSubviewVisibility");
  }
}

- (void)setDisplayMappedValue:(BOOL)a3
{
  if (self->_displayMappedValue != a3)
  {
    self->_displayMappedValue = a3;
    -[PUPhotoEditAdjustmentControl _updateFormatter](self, "_updateFormatter");
  }
}

- (void)setShouldShowCircularRing:(BOOL)a3
{
  if (self->_shouldShowCircularRing != a3)
  {
    self->_shouldShowCircularRing = a3;
    -[PUPhotoEditAdjustmentControl _updateRingVisibility](self, "_updateRingVisibility");
  }
}

- (void)_updateImageView
{
  uint64_t v3;
  UIImageView **p_imageView;
  id v5;

  -[PUPhotoEditAdjustmentControl imageForState:](self, "imageForState:", -[PUPhotoEditAdjustmentControl state](self, "state"));
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    -[PUPhotoEditAdjustmentControl _setupImageView](self, "_setupImageView");
    p_imageView = &self->_imageView;
    -[UIImageView setImage:](*p_imageView, "setImage:", v5);
    v3 = (uint64_t)v5;
  }
  else
  {
    p_imageView = &self->_imageView;
  }
  -[UIImageView setHidden:](*p_imageView, "setHidden:", v3 == 0);

}

- (void)_updateRingVisibility
{
  double v3;
  id v4;

  if (-[PUPhotoEditAdjustmentControl shouldShowCircularRing](self, "shouldShowCircularRing"))
    v3 = 1.0;
  else
    v3 = 0.0;
  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)_updateSubviewVisibility
{
  double v3;
  void *v4;
  double v5;
  id v6;

  if (-[PUPhotoEditAdjustmentControl shouldShowValueLabel](self, "shouldShowValueLabel"))
    v3 = 0.0;
  else
    v3 = 1.0;
  -[PUPhotoEditAdjustmentControl imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (-[PUPhotoEditAdjustmentControl shouldShowValueLabel](self, "shouldShowValueLabel"))
    v5 = 1.0;
  else
    v5 = 0.0;
  -[PUPhotoEditAdjustmentControl valueLabel](self, "valueLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

- (void)_updateSubviews
{
  -[PUPhotoEditAdjustmentControl _updateSubviewValues](self, "_updateSubviewValues");
  -[PUPhotoEditAdjustmentControl _updateSubviewColors](self, "_updateSubviewColors");
}

- (void)_updateSubviewColors
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentValue");
  v5 = v4;

  if (v5 <= 0.0)
    v6 = 512;
  else
    v6 = 520;
  v7 = *(Class *)((char *)&self->super.super.super.super.isa + v6);
  -[PUPhotoEditAdjustmentControl traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRingColor:", v9);

  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ringColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditAdjustmentControl valueLabel](self, "valueLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

}

- (void)_updateFormatter
{
  void *v3;
  id v4;

  if (-[PUPhotoEditAdjustmentControl displayMappedValue](self, "displayMappedValue"))
    v3 = &unk_1E59BC2D0;
  else
    v3 = &unk_1E59BC2E8;
  -[PUPhotoEditAdjustmentControl formatter](self, "formatter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMultiplier:", v3);

}

- (void)_updateSubviewValues
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  NSNumberFormatter *formatter;
  void *v23;
  void *v24;
  id v25;

  -[PUPhotoEditAdjustmentControl minValue](self, "minValue");
  v4 = v3;
  -[PUPhotoEditAdjustmentControl identityValue](self, "identityValue");
  v5 = 0.0;
  if (v4 < v6)
  {
    -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minValue");
    v5 = v8;

  }
  -[PUPhotoEditAdjustmentControl value](self, "value");
  v10 = v9;
  -[PUPhotoEditAdjustmentControl minValue](self, "minValue");
  v12 = v11;
  -[PUPhotoEditAdjustmentControl identityValue](self, "identityValue");
  v14 = v13;
  -[PUPhotoEditAdjustmentControl maxValue](self, "maxValue");
  v16 = v15;
  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "maxValue");
  if (v16 > v12)
  {
    if (v10 >= v14)
    {
      if (v16 > v14)
      {
        v19 = (v10 - v14) * v18 / (v16 - v14) + 0.0;
        goto LABEL_10;
      }
    }
    else if (v14 > v12)
    {
      v19 = v5 + (0.0 - v5) * (v10 - v12) / (v14 - v12);
      goto LABEL_10;
    }
  }
  v19 = 2.22507386e-308;
LABEL_10:

  if (round(v19 * 100.0) / 100.0 == 0.0)
    v19 = 0.0;
  -[PUPhotoEditAdjustmentControl circularIndicatorView](self, "circularIndicatorView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCurrentValue:", v19);

  if (!-[PUPhotoEditAdjustmentControl displayMappedValue](self, "displayMappedValue"))
  {
    -[PUPhotoEditAdjustmentControl value](self, "value");
    v19 = v21;
  }
  formatter = self->_formatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](formatter, "stringFromNumber:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditAdjustmentControl valueLabel](self, "valueLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

}

- (double)value
{
  return self->_value;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(double)a3
{
  self->_defaultValue = a3;
}

- (double)identityValue
{
  return self->_identityValue;
}

- (void)setIdentityValue:(double)a3
{
  self->_identityValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (BOOL)shouldShowValueLabel
{
  return self->_shouldShowValueLabel;
}

- (BOOL)displayMappedValue
{
  return self->_displayMappedValue;
}

- (BOOL)shouldShowCircularRing
{
  return self->_shouldShowCircularRing;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (UIColor)alternateColor
{
  return self->_alternateColor;
}

- (void)setAlternateColor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateColor, a3);
}

- (BOOL)shouldScaleDownImage
{
  return self->_shouldScaleDownImage;
}

- (void)setShouldScaleDownImage:(BOOL)a3
{
  self->_shouldScaleDownImage = a3;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (PUPhotoEditCircularIndicatorView)circularIndicatorView
{
  return self->_circularIndicatorView;
}

- (void)setCircularIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_circularIndicatorView, a3);
}

- (NSMapTable)stateToContentMap
{
  return self->_stateToContentMap;
}

- (void)setStateToContentMap:(id)a3
{
  objc_storeStrong((id *)&self->_stateToContentMap, a3);
}

- (BOOL)valueChanged
{
  return self->_valueChanged;
}

- (void)setValueChanged:(BOOL)a3
{
  self->_valueChanged = a3;
}

- (NSNumberFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_stateToContentMap, 0);
  objc_storeStrong((id *)&self->_circularIndicatorView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_alternateColor, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
}

@end
