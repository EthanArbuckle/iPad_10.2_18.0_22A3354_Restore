@implementation UISlider

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

+ (BOOL)_allowActionsToQueue
{
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIControl isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    -[UIControl setEnabled:](&v5, sel_setEnabled_, v3);
    -[UISliderDataModel setEnabled:](self->_data, "setEnabled:", v3);
    -[_UISliderVisualElement didSetEnabled](self->_visualElement, "didSetEnabled");
  }
}

- (id)_minTrackView
{
  return (id)-[_UISliderVisualElement minTrackView](self->_visualElement, "minTrackView");
}

- (void)setMaximumValueImage:(UIImage *)maximumValueImage
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;

  v6 = maximumValueImage;
  -[UISliderDataModel maximumValueImage](self->_data, "maximumValueImage");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UISliderDataModel setMaximumValueImage:](self->_data, "setMaximumValueImage:", v6);
    -[_UISliderVisualElement didSetMaximumValueImage](self->_visualElement, "didSetMaximumValueImage");
    v5 = v6;
  }

}

- (void)setMaximumTrackImage:(UIImage *)image forState:(UIControlState)state
{
  -[UISliderDataModel setMaximumTrackImage:forState:](self->_data, "setMaximumTrackImage:forState:", image);
  -[_UISliderVisualElement didSetMaximumTrackImageForState:](self->_visualElement, "didSetMaximumTrackImageForState:", state);
}

- (void)setMinimumTrackImage:(UIImage *)image forState:(UIControlState)state
{
  -[UISliderDataModel setMinimumTrackImage:forState:](self->_data, "setMinimumTrackImage:forState:", image);
  -[_UISliderVisualElement didSetMinimumTrackImageForState:](self->_visualElement, "didSetMinimumTrackImageForState:", state);
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  _UISliderVisualElement *v4;
  objc_super v5;

  v4 = (_UISliderVisualElement *)a3;
  if (self->_visualElement == v4)
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v5.receiver = self;
  v5.super_class = (Class)UISlider;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v5, sel__intrinsicContentSizeInvalidatedForChildView_, v4);

}

- (void)setMaximumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  -[UISliderDataModel setMaximumTrackImage:forStates:](self->_data, "setMaximumTrackImage:forStates:", a3, a4);
  -[_UISliderVisualElement didSetMaximumTrackImageForStates](self->_visualElement, "didSetMaximumTrackImageForStates");
}

- (id)_maxTrackView
{
  return (id)-[_UISliderVisualElement maxTrackView](self->_visualElement, "maxTrackView");
}

- (void)setMaximumValue:(float)maximumValue
{
  if (-[UISliderDataModel setMaximumValue:](self->_data, "setMaximumValue:"))
    -[_UISliderVisualElement didSetValues](self->_visualElement, "didSetValues");
}

- (UISlider)initWithFrame:(CGRect)a3
{
  UISlider *v3;
  UISlider *v4;
  uint64_t v5;
  UISliderDataModel *data;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISlider;
  v3 = -[UIControl initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    v5 = objc_opt_new();
    data = v4->_data;
    v4->_data = (UISliderDataModel *)v5;

    -[UISlider _installVisualElement](v4, "_installVisualElement");
    -[UIControl setSymbolAnimationEnabled:](v4, "setSymbolAnimationEnabled:", 1);
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      -[UIView bounds](v4, "bounds");
      LODWORD(v8) = 0;
      -[UISlider thumbRectForBounds:trackRect:value:](v4, "thumbRectForBounds:trackRect:value:", v8);
    }
    -[UISlider _registerForTraitChanges](v4, "_registerForTraitChanges");
  }
  return v4;
}

- (void)_installVisualElement
{
  int64_t sliderStyle;
  uint64_t v4;
  id v5;
  id v6;

  sliderStyle = self->_sliderStyle;
  if (sliderStyle <= 109)
  {
    if (sliderStyle != 100)
      goto LABEL_5;
LABEL_6:
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setChangeWithVolumeButtons:", 0);
    v4 = (uint64_t)v5;
    goto LABEL_7;
  }
  if (sliderStyle == 110)
    goto LABEL_6;
LABEL_5:
  v4 = objc_opt_new();
LABEL_7:
  v6 = (id)v4;
  -[UISlider _installVisualElement:](self, "_installVisualElement:", v4);

}

- (void)_installVisualElement:(id)a3
{
  id v6;
  _UISliderVisualElement **p_visualElement;
  char v8;
  char v9;
  char v10;
  char v11;
  _UISliderVisualElement *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *dummyViews;
  NSArray *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_visualElement = &self->_visualElement;
  -[_UISliderVisualElement setSlider:](self->_visualElement, "setSlider:", 0);
  -[_UISliderVisualElement removeFromSuperview](self->_visualElement, "removeFromSuperview");
  objc_storeStrong((id *)&self->_visualElement, a3);
  *(_BYTE *)&self->_visualElementFlags = *(_BYTE *)&self->_visualElementFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 2;
  else
    v8 = 0;
  *(_BYTE *)&self->_visualElementFlags = *(_BYTE *)&self->_visualElementFlags & 0xFD | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 4;
  else
    v9 = 0;
  *(_BYTE *)&self->_visualElementFlags = *(_BYTE *)&self->_visualElementFlags & 0xFB | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 8;
  else
    v10 = 0;
  *(_BYTE *)&self->_visualElementFlags = *(_BYTE *)&self->_visualElementFlags & 0xF7 | v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 16;
  else
    v11 = 0;
  *(_BYTE *)&self->_visualElementFlags = *(_BYTE *)&self->_visualElementFlags & 0xEF | v11;
  -[_UISliderVisualElement setSlider:](*p_visualElement, "setSlider:", self);
  -[_UISliderVisualElement setSemanticContentAttribute:](*p_visualElement, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
  if (!self->_data)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISlider.m"), 225, CFSTR("Installing visual element before data model has been created"));

  }
  -[_UISliderVisualElement setData:](*p_visualElement, "setData:");
  v12 = *p_visualElement;
  -[UIView bounds](self, "bounds");
  -[_UISliderVisualElement setFrame:](v12, "setFrame:");
  -[_UISliderVisualElement setAutoresizingMask:](*p_visualElement, "setAutoresizingMask:", 18);
  if ((dyld_program_sdk_at_least() & 1) == 0 && !self->_dummyViews)
  {
    v13 = (void *)objc_opt_new();
    v20[0] = v13;
    v14 = (void *)objc_opt_new();
    v20[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dummyViews = self->_dummyViews;
    self->_dummyViews = v15;

    v17 = self->_dummyViews;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __34__UISlider__installVisualElement___block_invoke;
    v19[3] = &unk_1E16B24A0;
    v19[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v19);
  }
  -[UIView addSubview:](self, "addSubview:", *p_visualElement);

}

- (float)minimumValue
{
  float result;

  -[UISliderDataModel minimumValue](self->_data, "minimumValue");
  return result;
}

- (BOOL)isTracking
{
  if ((*(_BYTE *)&self->_visualElementFlags & 8) != 0)
    return -[_UISliderVisualElement overriddenTrackingState](self->_visualElement, "overriddenTrackingState");
  else
    return -[UISliderDataModel isTracking](self->_data, "isTracking");
}

- (float)maximumValue
{
  float result;

  -[UISliderDataModel maximumValue](self->_data, "maximumValue");
  return result;
}

- (UIImage)thumbImageForState:(UIControlState)state
{
  return (UIImage *)-[UISliderDataModel thumbImageForState:](self->_data, "thumbImageForState:", state);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISlider;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UISliderVisualElement didPerformLayout](self->_visualElement, "didPerformLayout");
}

- (UIImage)minimumTrackImageForState:(UIControlState)state
{
  return (UIImage *)-[UISliderDataModel minimumTrackImageForState:](self->_data, "minimumTrackImageForState:", state);
}

- (float)value
{
  float result;

  -[UISliderDataModel value](self->_data, "value");
  return result;
}

- (_UIEdgeFeedbackGenerator)_edgeFeedbackGenerator
{
  return -[UISliderDataModel edgeFeedbackGenerator](self->_data, "edgeFeedbackGenerator");
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UISliderVisualElement maximumValueImageRectForBounds:](self->_visualElement, "maximumValueImageRectForBounds:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIImage)maximumTrackImageForState:(UIControlState)state
{
  return (UIImage *)-[UISliderDataModel maximumTrackImageForState:](self->_data, "maximumTrackImageForState:", state);
}

- (BOOL)_isThumbEnabled
{
  return -[UISliderDataModel isThumbEnabled](self->_data, "isThumbEnabled");
}

- (UIImage)currentMinimumTrackImage
{
  return (UIImage *)-[_UISliderVisualElement currentMinimumTrackImage](self->_visualElement, "currentMinimumTrackImage");
}

- (UIImage)currentMaximumTrackImage
{
  return (UIImage *)-[_UISliderVisualElement currentMaximumTrackImage](self->_visualElement, "currentMaximumTrackImage");
}

- (CGRect)trackRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UISliderVisualElement trackRectForBounds:](self->_visualElement, "trackRectForBounds:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UISliderVisualElement minimumValueImageRectForBounds:](self->_visualElement, "minimumValueImageRectForBounds:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[_UISliderVisualElement thumbRectForBounds:trackRect:value:](self->_visualElement, "thumbRectForBounds:trackRect:value:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)createThumbView
{
  -[_UISliderVisualElement createThumbView](self->_visualElement, "createThumbView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)maximumTrackTintColor
{
  return -[UISliderDataModel maximumTrackTintColor](self->_data, "maximumTrackTintColor");
}

- (UIColor)minimumTrackTintColor
{
  return -[UISliderDataModel minimumTrackTintColor](self->_data, "minimumTrackTintColor");
}

- (void)setValue:(float)value animated:(BOOL)animated
{
  -[_UISliderVisualElement setValue:animated:](self->_visualElement, "setValue:animated:", animated);
}

- (void)setValue:(float)value
{
  -[UISlider setValue:animated:](self, "setValue:animated:", 0);
}

- (UISlider)init
{
  return -[UISlider initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 34.0);
}

- (void)setMinimumValue:(float)minimumValue
{
  if (-[UISliderDataModel setMinimumValue:](self->_data, "setMinimumValue:"))
    -[_UISliderVisualElement didSetValues](self->_visualElement, "didSetValues");
}

- (void)setMinimumValueImage:(UIImage *)minimumValueImage
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;

  v6 = minimumValueImage;
  -[UISliderDataModel minimumValueImage](self->_data, "minimumValueImage");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UISliderDataModel setMinimumValueImage:](self->_data, "setMinimumValueImage:", v6);
    -[_UISliderVisualElement didSetMinimumValueImage](self->_visualElement, "didSetMinimumValueImage");
    v5 = v6;
  }

}

- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state
{
  UISliderDataModel *data;
  UIImage *v7;

  data = self->_data;
  v7 = image;
  -[UISliderDataModel setThumbTintColor:](data, "setThumbTintColor:", 0);
  -[UISliderDataModel setThumbImage:forState:](self->_data, "setThumbImage:forState:", v7, state);

  -[_UISliderVisualElement didSetThumbImageForState:](self->_visualElement, "didSetThumbImageForState:", state);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISlider;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[_UISliderVisualElement setSemanticContentAttribute:](self->_visualElement, "setSemanticContentAttribute:", a3);
}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (UISlider)initWithCoder:(id)a3
{
  id v4;
  UISlider *v5;
  uint64_t v6;
  UISliderDataModel *data;
  uint64_t v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  UISliderDataModel *v13;
  void *v14;
  UISliderDataModel *v15;
  void *v16;
  UISliderDataModel *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UISlider;
  v5 = -[UIControl initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    data = v5->_data;
    v5->_data = (UISliderDataModel *)v6;

    -[UISlider _installVisualElement](v5, "_installVisualElement");
    -[UIControl setSymbolAnimationEnabled:](v5, "setSymbolAnimationEnabled:", 1);
    -[UISlider _registerForTraitChanges](v5, "_registerForTraitChanges");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBehavioralStyle")))
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBehavioralStyle"));
    else
      v8 = 0;
    -[UISlider setPreferredBehavioralStyle:](v5, "setPreferredBehavioralStyle:", v8);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMinValue"));
    -[UISliderDataModel setMinimumValue:](v5->_data, "setMinimumValue:");
    v9 = objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMaxValue"));
    LODWORD(v10) = 1.0;
    if (v9)
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMaxValue"), v10);
    -[UISliderDataModel setMaximumValue:](v5->_data, "setMaximumValue:", v10);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIValue"));
    -[UISliderDataModel setValue:](v5->_data, "setValue:");
    -[_UISliderVisualElement didSetValues](v5->_visualElement, "didSetValues");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIContinuous")))
    {
      -[UISliderDataModel setContinuous:](v5->_data, "setContinuous:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIContinuous")));
      -[_UISliderVisualElement didSetContinuous](v5->_visualElement, "didSetContinuous");
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMinimumValueImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UISliderDataModel setMinimumValueImage:](v5->_data, "setMinimumValueImage:", v11);
      -[_UISliderVisualElement didSetMinimumValueImage](v5->_visualElement, "didSetMinimumValueImage");
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMaximumValueImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[UISliderDataModel setMaximumValueImage:](v5->_data, "setMaximumValueImage:", v12);
      -[_UISliderVisualElement didSetMaximumValueImage](v5->_visualElement, "didSetMaximumValueImage");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMinimumTintColor")))
    {
      v13 = v5->_data;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMinimumTintColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISliderDataModel setMinimumTrackTintColor:](v13, "setMinimumTrackTintColor:", v14);

      -[_UISliderVisualElement didSetMinimumTrackTintColor](v5->_visualElement, "didSetMinimumTrackTintColor");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMaximumTintColor")))
    {
      v15 = v5->_data;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMaximumTintColor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISliderDataModel setMaximumTrackTintColor:](v15, "setMaximumTrackTintColor:", v16);

      -[_UISliderVisualElement didSetMaximumTrackTintColor](v5->_visualElement, "didSetMaximumTrackTintColor");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIThumbTintColor")))
    {
      v17 = v5->_data;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIThumbTintColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISliderDataModel setThumbTintColor:](v17, "setThumbTintColor:", v18);

      -[UISlider setThumbImage:forStates:](v5, "setThumbImage:forStates:", 0, 7);
      -[_UISliderVisualElement didSetThumbTintColor](v5->_visualElement, "didSetThumbTintColor");
    }

  }
  return v5;
}

void __34__UISlider__installVisualElement___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);

}

- (void)_setEdgeFeedbackGenerator:(id)a3
{
  -[UISliderDataModel setEdgeFeedbackGenerator:](self->_data, "setEdgeFeedbackGenerator:", a3);
}

- (void)_setModulationFeedbackGenerator:(id)a3
{
  -[UISliderDataModel setModulationFeedbackGenerator:](self->_data, "setModulationFeedbackGenerator:", a3);
}

- (_UIModulationFeedbackGenerator)_modulationFeedbackGenerator
{
  return -[UISliderDataModel modulationFeedbackGenerator](self->_data, "modulationFeedbackGenerator");
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  NSArray *dummyViews;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISlider;
  -[UIView _populateArchivedSubviews:](&v9, sel__populateArchivedSubviews_, v4);
  objc_msgSend(v4, "removeObject:", self->_visualElement);
  objc_msgSend(v4, "removeObject:", self->_visualElement);
  dummyViews = self->_dummyViews;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__UISlider__populateArchivedSubviews___block_invoke;
  v7[3] = &unk_1E16B24A0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](dummyViews, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __38__UISlider__populateArchivedSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISlider;
  -[UIControl encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  -[UISliderDataModel value](self->_data, "value");
  if (v5 != 0.0)
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIValue"));
  -[UISliderDataModel minimumValue](self->_data, "minimumValue");
  if (v6 != 0.0)
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMinValue"));
  -[UISliderDataModel maximumValue](self->_data, "maximumValue");
  if (v7 != 1.0)
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMaxValue"));
  if (!-[UISliderDataModel isContinuous](self->_data, "isContinuous"))
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIContinuous"));
  -[UISlider minimumValueImage](self, "minimumValueImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UISlider minimumValueImage](self, "minimumValueImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("UIMinimumValueImage"));

  }
  -[UISlider maximumValueImage](self, "maximumValueImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UISlider maximumValueImage](self, "maximumValueImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("UIMaximumValueImage"));

  }
  -[UISliderDataModel minimumTrackTintColor](self->_data, "minimumTrackTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UIMinimumTintColor"));
  -[UISliderDataModel maximumTrackTintColor](self->_data, "maximumTrackTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("UIMaximumTintColor"));
  -[UISliderDataModel thumbTintColor](self->_data, "thumbTintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("UIThumbTintColor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UISlider preferredBehavioralStyle](self, "preferredBehavioralStyle"), CFSTR("UIBehavioralStyle"));

}

- (id)description
{
  void *v3;
  void *v4;
  float v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISlider;
  -[UIView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  -[UISlider value](self, "value");
  objc_msgSend(v4, "appendFormat:", CFSTR("; value: %f>"), v5);
  return v4;
}

- (UIColor)thumbTintColor
{
  return -[UISliderDataModel thumbTintColor](self->_data, "thumbTintColor");
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;

  v6 = thumbTintColor;
  -[UISliderDataModel thumbTintColor](self->_data, "thumbTintColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UISliderDataModel setThumbTintColor:](self->_data, "setThumbTintColor:", v6);
    -[UISlider setThumbImage:forStates:](self, "setThumbImage:forStates:", 0, 7);
    -[_UISliderVisualElement didSetThumbTintColor](self->_visualElement, "didSetThumbTintColor");
    v5 = v6;
  }

}

- (void)setMinimumTrackTintColor:(UIColor *)minimumTrackTintColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;

  v6 = minimumTrackTintColor;
  -[UISliderDataModel minimumTrackTintColor](self->_data, "minimumTrackTintColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UISliderDataModel setMinimumTrackTintColor:](self->_data, "setMinimumTrackTintColor:", v6);
    -[_UISliderVisualElement didSetMinimumTrackTintColor](self->_visualElement, "didSetMinimumTrackTintColor");
    v5 = v6;
  }

}

- (void)setMaximumTrackTintColor:(UIColor *)maximumTrackTintColor
{
  -[UISliderDataModel setMaximumTrackTintColor:](self->_data, "setMaximumTrackTintColor:", maximumTrackTintColor);
  -[_UISliderVisualElement didSetMaximumTrackTintColor](self->_visualElement, "didSetMaximumTrackTintColor");
}

- (UIImage)currentThumbImage
{
  return (UIImage *)-[_UISliderVisualElement currentThumbImage](self->_visualElement, "currentThumbImage");
}

- (UIImage)minimumValueImage
{
  return -[UISliderDataModel minimumValueImage](self->_data, "minimumValueImage");
}

- (UIImage)maximumValueImage
{
  return -[UISliderDataModel maximumValueImage](self->_data, "maximumValueImage");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return -[_UISliderVisualElement gestureRecognizerShouldBegin:](self->_visualElement, "gestureRecognizerShouldBegin:", a3);
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UISliderVisualElement _intrinsicSizeWithinSize:](self->_visualElement, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UISliderVisualElement alignmentRectInsets](self->_visualElement, "alignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    -[UIView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, v3);
    -[UISliderDataModel setUserInteractionEnabled:](self->_data, "setUserInteractionEnabled:", v3);
    if ((*(_BYTE *)&self->_visualElementFlags & 4) != 0)
      -[_UISliderVisualElement didSetUserInteractionEnabled](self->_visualElement, "didSetUserInteractionEnabled");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIControl isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    -[UIControl setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[UISliderDataModel setHighlighted:](self->_data, "setHighlighted:", v3);
    -[_UISliderVisualElement didSetHighlighted](self->_visualElement, "didSetHighlighted");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIControl isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    -[UIControl setSelected:](&v5, sel_setSelected_, v3);
    -[UISliderDataModel setSelected:](self->_data, "setSelected:", v3);
    -[_UISliderVisualElement didSetSelected](self->_visualElement, "didSetSelected");
  }
}

- (void)setContinuous:(BOOL)continuous
{
  -[UISliderDataModel setContinuous:](self->_data, "setContinuous:", continuous);
  -[_UISliderVisualElement didSetContinuous](self->_visualElement, "didSetContinuous");
}

- (BOOL)isContinuous
{
  return -[UISliderDataModel isContinuous](self->_data, "isContinuous");
}

- (void)_setMaxValue:(float)a3
{
  -[UISliderDataModel setMaximumValue:](self->_data, "setMaximumValue:");
}

- (void)_setMinValue:(float)a3
{
  -[UISliderDataModel setMinimumValue:](self->_data, "setMinimumValue:");
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (BOOL)cancelMouseTracking
{
  return -[_UISliderVisualElement cancelMouseTracking](self->_visualElement, "cancelMouseTracking");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return -[_UISliderVisualElement beginTrackingWithTouch:withEvent:](self->_visualElement, "beginTrackingWithTouch:withEvent:", a3, a4);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return -[_UISliderVisualElement continueTrackingWithTouch:withEvent:](self->_visualElement, "continueTrackingWithTouch:withEvent:", a3, a4);
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[_UISliderVisualElement endTrackingWithTouch:withEvent:](self->_visualElement, "endTrackingWithTouch:withEvent:", a3, a4);
}

- (void)_controlTouchBegan:(id)a3 withEvent:(id)a4
{
  -[_UISliderVisualElement _controlTouchBegan:withEvent:](self->_visualElement, "_controlTouchBegan:withEvent:", a3, a4);
}

- (void)_controlTouchMoved:(id)a3 withEvent:(id)a4
{
  -[_UISliderVisualElement _controlTouchMoved:withEvent:](self->_visualElement, "_controlTouchMoved:withEvent:", a3, a4);
}

- (void)_controlTouchEnded:(id)a3 withEvent:(id)a4
{
  -[_UISliderVisualElement _controlTouchEnded:withEvent:](self->_visualElement, "_controlTouchEnded:withEvent:", a3, a4);
}

- (BOOL)cancelTouchTracking
{
  return -[_UISliderVisualElement cancelTouchTracking](self->_visualElement, "cancelTouchTracking");
}

- (void)setTracking:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISlider;
  -[UIControl setTracking:](&v5, sel_setTracking_);
  -[UISliderDataModel setTracking:](self->_data, "setTracking:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderConfiguration, 0);
  objc_storeStrong((id *)&self->_dummyViews, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_visualElement, 0);
}

- (BOOL)isAnimatingValueChange
{
  return -[_UISliderVisualElement isAnimatingValueChange](self->_visualElement, "isAnimatingValueChange");
}

- (void)setShowValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UISliderDataModel showValue](self->_data, "showValue") != a3)
  {
    -[UISliderDataModel setShowValue:](self->_data, "setShowValue:", v3);
    -[_UISliderVisualElement didSetShowValue](self->_visualElement, "didSetShowValue");
  }
}

- (CGRect)valueTextRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UISliderVisualElement valueTextRectForBounds:](self->_visualElement, "valueTextRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setThumbImage:(id)a3 forStates:(unint64_t)a4
{
  -[UISliderDataModel setThumbImage:forStates:](self->_data, "setThumbImage:forStates:", a3, a4);
  -[_UISliderVisualElement didSetThumbImageForStates](self->_visualElement, "didSetThumbImageForStates");
}

- (void)setMinimumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  -[UISliderDataModel setMinimumTrackImage:forStates:](self->_data, "setMinimumTrackImage:forStates:", a3, a4);
  -[_UISliderVisualElement didSetMinimumTrackImageForStates](self->_visualElement, "didSetMinimumTrackImageForStates");
}

- (void)_setTrackEnabled:(BOOL)a3
{
  -[UISliderDataModel setTrackEnabled:](self->_data, "setTrackEnabled:", a3);
}

- (BOOL)_trackEnabled
{
  return -[UISliderDataModel isTrackEnabled](self->_data, "isTrackEnabled");
}

- (void)_setThumbEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UISliderDataModel isThumbEnabled](self->_data, "isThumbEnabled") != a3)
  {
    -[UISliderDataModel setThumbEnabled:](self->_data, "setThumbEnabled:", v3);
    -[_UISliderVisualElement didSetThumbEnabled](self->_visualElement, "didSetThumbEnabled");
  }
}

- (void)_setMinimumTrackVisible:(BOOL)a3 withDuration:(double)a4
{
  _BOOL8 v5;

  v5 = a3;
  if (-[UISliderDataModel isMinimumTrackVisible](self->_data, "isMinimumTrackVisible") != a3)
  {
    -[UISliderDataModel setMinimumTrackVisible:](self->_data, "setMinimumTrackVisible:", v5);
    -[_UISliderVisualElement didChangeMinimumTrackVisibleWithDuration:](self->_visualElement, "didChangeMinimumTrackVisibleWithDuration:", a4);
  }
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UISliderVisualElement thumbHitEdgeInsets](self->_visualElement, "thumbHitEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_minValueView
{
  return (id)-[_UISliderVisualElement minValueImageView](self->_visualElement, "minValueImageView");
}

- (id)_maxValueView
{
  return (id)-[_UISliderVisualElement maxValueImageView](self->_visualElement, "maxValueImageView");
}

- (id)_thumbView
{
  return (id)-[_UISliderVisualElement thumbView](self->_visualElement, "thumbView");
}

- (id)_thumbViewNeue
{
  return (id)-[_UISliderVisualElement thumbViewNeue](self->_visualElement, "thumbViewNeue");
}

- (_UISliderConfiguration)_sliderConfiguration
{
  return (_UISliderConfiguration *)(id)-[_UISliderConfiguration copyWithZone:](self->_sliderConfiguration, "copyWithZone:", 0);
}

- (void)_setSliderConfiguration:(id)a3
{
  _UISliderConfiguration *v4;
  _UISliderConfiguration *sliderConfiguration;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_sliderConfiguration) & 1) == 0)
  {
    v4 = (_UISliderConfiguration *)objc_msgSend(v6, "copyWithZone:", 0);
    sliderConfiguration = self->_sliderConfiguration;
    self->_sliderConfiguration = v4;

    if ((*(_BYTE *)&self->_visualElementFlags & 2) != 0)
      -[_UISliderVisualElement didUpdateConfiguration](self->_visualElement, "didUpdateConfiguration");
  }

}

- (unint64_t)_sliderStyle
{
  return self->_sliderStyle;
}

- (void)_setSliderStyle:(unint64_t)a3
{
  if (self->_sliderStyle != a3)
  {
    self->_sliderStyle = a3;
    -[UISlider _installVisualElement](self, "_installVisualElement");
  }
}

- (unint64_t)_fluidUpdateSource
{
  if ((*(_BYTE *)&self->_visualElementFlags & 1) != 0)
    return -[_UISliderVisualElement fluidUpdateSource](self->_visualElement, "fluidUpdateSource");
  else
    return 0;
}

- (void)_setFluidTrackHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;

  v3 = a3;
  if ((*(_BYTE *)&self->_visualElementFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISlider.m"), 1005, CFSTR("Using fluid slider methods on non-fluid slider."));

  }
  -[UISliderDataModel setFluidTrackHidden:](self->_data, "setFluidTrackHidden:", v3);
  -[_UISliderVisualElement didSetFluidTrackHidden](self->_visualElement, "didSetFluidTrackHidden");
}

- (BOOL)_fluidTrackHidden
{
  void *v5;

  if ((*(_BYTE *)&self->_visualElementFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISlider.m"), 1012, CFSTR("Using fluid slider methods on non-fluid slider."));

  }
  return -[UISliderDataModel isFluidTrackHidden](self->_data, "isFluidTrackHidden");
}

- (float)_minimumEnabledValue
{
  float result;

  -[UISliderDataModel minimumEnabledValue](self->_data, "minimumEnabledValue");
  return result;
}

- (void)_setMinimumEnabledValue:(float)a3
{
  if (-[UISliderDataModel setMinimumEnabledValue:](self->_data, "setMinimumEnabledValue:"))
    -[_UISliderVisualElement didSetValues](self->_visualElement, "didSetValues");
}

- (float)_maximumEnabledValue
{
  float result;

  -[UISliderDataModel maximumEnabledValue](self->_data, "maximumEnabledValue");
  return result;
}

- (void)_setMaximumEnabledValue:(float)a3
{
  if (-[UISliderDataModel setMaximumEnabledValue:](self->_data, "setMaximumEnabledValue:"))
    -[_UISliderVisualElement didSetValues](self->_visualElement, "didSetValues");
}

- (float)_sliderSpeedMultiplier
{
  float result;

  -[UISliderDataModel sliderSpeedMultiplier](self->_data, "sliderSpeedMultiplier");
  return result;
}

- (void)_setSliderSpeedMultiplier:(float)a3
{
  double v5;

  -[UISliderDataModel sliderSpeedMultiplier](self->_data, "sliderSpeedMultiplier");
  if (vabds_f32(*(float *)&v5, a3) >= 0.00000011921)
  {
    *(float *)&v5 = a3;
    -[UISliderDataModel setSliderSpeedMultiplier:](self->_data, "setSliderSpeedMultiplier:", v5);
    if ((*(_BYTE *)&self->_visualElementFlags & 0x10) != 0)
      -[_UISliderVisualElement didSetSpeedMultiplier](self->_visualElement, "didSetSpeedMultiplier");
  }
}

- (UIBehavioralStyle)behavioralStyle
{
  return 1;
}

- (UIBehavioralStyle)preferredBehavioralStyle
{
  return self->_preferredBehavioralStyle;
}

- (void)setPreferredBehavioralStyle:(UIBehavioralStyle)preferredBehavioralStyle
{
  UIBehavioralStyle v5;

  v5 = -[UISlider behavioralStyle](self, "behavioralStyle");
  self->_preferredBehavioralStyle = preferredBehavioralStyle;
  if (!self->_visualElement || v5 != -[UISlider behavioralStyle](self, "behavioralStyle"))
    -[UISlider _installVisualElement](self, "_installVisualElement");
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xFE | a3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return _UnsupportedFlags_0 & 1;
}

@end
