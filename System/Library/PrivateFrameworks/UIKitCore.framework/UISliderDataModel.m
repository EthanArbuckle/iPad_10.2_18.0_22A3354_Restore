@implementation UISliderDataModel

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIImage)maximumValueImage
{
  return self->_maximumValueImage;
}

- (void)setMaximumValueImage:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValueImage, a3);
}

- (void)setMinimumTrackImage:(id)a3 forState:(unint64_t)a4
{
  _UISliderControlStateContent *v6;
  id v7;

  v7 = a3;
  -[UISliderDataModel _contentForState:](self, "_contentForState:", a4);
  v6 = (_UISliderControlStateContent *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(_UISliderControlStateContent);
    -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", v6, a4);
  }
  -[_UISliderControlStateContent setMinTrack:](v6, "setMinTrack:", v7);
  if (!v7 && -[_UISliderControlStateContent isEmpty](v6, "isEmpty"))
    -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", 0, a4);

}

- (void)setMaximumTrackImage:(id)a3 forState:(unint64_t)a4
{
  _UISliderControlStateContent *v6;
  id v7;

  v7 = a3;
  -[UISliderDataModel _contentForState:](self, "_contentForState:", a4);
  v6 = (_UISliderControlStateContent *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(_UISliderControlStateContent);
    -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", v6, a4);
  }
  -[_UISliderControlStateContent setMaxTrack:](v6, "setMaxTrack:", v7);
  if (!v7 && -[_UISliderControlStateContent isEmpty](v6, "isEmpty"))
    -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", 0, a4);

}

- (void)setMaximumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  void *v6;
  _UISliderControlStateContent *v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x186DC9484]();
  do
  {
    -[UISliderDataModel _contentForState:](self, "_contentForState:", a4 & -(uint64_t)a4);
    v7 = (_UISliderControlStateContent *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(_UISliderControlStateContent);
      -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", v7, a4 & -(uint64_t)a4);
    }
    -[_UISliderControlStateContent setMaxTrack:](v7, "setMaxTrack:", v8);
    if (!v8 && -[_UISliderControlStateContent isEmpty](v7, "isEmpty"))
      -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", 0, a4 & -(uint64_t)a4);

    a4 &= a4 - 1;
  }
  while (a4);
  objc_autoreleasePoolPop(v6);

}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  id v6;
  __CFDictionary *contentLookup;
  void *value;

  v6 = a3;
  contentLookup = self->_contentLookup;
  value = v6;
  if (!contentLookup)
  {
    contentLookup = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    v6 = value;
    self->_contentLookup = contentLookup;
  }
  if (v6)
    CFDictionarySetValue(contentLookup, (const void *)a4, v6);
  else
    CFDictionaryRemoveValue(contentLookup, (const void *)a4);

}

- (BOOL)setMaximumValue:(float)a3
{
  double v3;

  if (self->_maxValue == a3)
    return 0;
  *(float *)&v3 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", v3);
}

- (UISliderDataModel)init
{
  UISliderDataModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISliderDataModel;
  result = -[UISliderDataModel init](&v3, sel_init);
  if (result)
  {
    result->_continuous = 1;
    *(_WORD *)&result->_thumbEnabled = 1;
    result->_minimumTrackVisible = 1;
    *(_DWORD *)&result->_userInteractionEnabled = 257;
    *(_OWORD *)&result->_value = xmmword_186685C10;
    *(_WORD *)&result->_overrideMinimumEnabledValue = 0;
    *(_QWORD *)&result->_maxEnabledValue = 0x3F8000007F800000;
  }
  return result;
}

- (void)setEdgeFeedbackGenerator:(id)a3
{
  _UIEdgeFeedbackGenerator *v5;
  _UIEdgeFeedbackGenerator *edgeFeedbackGenerator;
  void *v7;

  v5 = (_UIEdgeFeedbackGenerator *)a3;
  if (-[UIFeedbackGenerator isActive](self->_edgeFeedbackGenerator, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISliderDataModel.m"), 342, CFSTR("Edge feedback behavior should not be changed while active."));

  }
  edgeFeedbackGenerator = self->_edgeFeedbackGenerator;
  self->_edgeFeedbackGenerator = v5;

}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (float)minimumValue
{
  return self->_minValue;
}

- (float)maximumValue
{
  return self->_maxValue;
}

- (BOOL)showValue
{
  return self->_showValue;
}

- (float)value
{
  return self->_value;
}

- (_UIEdgeFeedbackGenerator)edgeFeedbackGenerator
{
  return self->_edgeFeedbackGenerator;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isThumbEnabled
{
  return self->_thumbEnabled;
}

- (BOOL)isMinimumTrackVisible
{
  return self->_minimumTrackVisible;
}

- (id)thumbImageForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UISliderDataModel _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumb");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UISliderDataModel _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumb");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)minimumTrackImageForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UISliderDataModel _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minTrack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UISliderDataModel _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minTrack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)maximumTrackImageForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UISliderDataModel _contentForState:](self, "_contentForState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxTrack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UISliderDataModel _contentForState:](self, "_contentForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maxTrack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_contentForState:(unint64_t)a3
{
  const __CFDictionary *contentLookup;

  contentLookup = self->_contentLookup;
  if (contentLookup)
  {
    CFDictionaryGetValue(contentLookup, (const void *)a3);
    contentLookup = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return contentLookup;
}

- (BOOL)_setValue:(float)a3 minValue:(float)a4 maxValue:(float)a5 minEnabledUsed:(BOOL)a6 minEnabledValue:(float)a7 maxEnabledUsed:(BOOL)a8 maxEnabledValue:(float)a9
{
  _BOOL4 v10;
  _BOOL4 v12;
  float v20;
  float v21;
  void *v23;
  void *v24;

  v10 = a8;
  v12 = a6;
  if (a4 > a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISliderDataModel.m"), 83, CFSTR("Attempting to set a slider's minimumValue (%f) to be larger than the maximumValue (%f)"), a4, a5);

  }
  if (a7 > a9 && v10 && v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISliderDataModel.m"), 86, CFSTR("Attempting to set a slider's minimumEnabledValue (%f) to be larger than the maximumEnabledValue (%f)"), a4, a5);

  }
  if (v10)
    v20 = a9;
  else
    v20 = a5;
  if (v12)
    v21 = a7;
  else
    v21 = a4;
  if (v21 < a3)
    v21 = a3;
  if (v20 > v21)
    v20 = v21;
  if (v20 == self->_value && self->_minValue == a4 && self->_maxValue == a5)
  {
    if (v12 && self->_minEnabledValue != a7)
    {
      self->_value = v20;
      self->_minValue = a4;
      self->_maxValue = a5;
      goto LABEL_25;
    }
    if (!v10 || self->_maxEnabledValue == a9)
      return 0;
  }
  self->_value = v20;
  self->_minValue = a4;
  self->_maxValue = a5;
  if (v12)
LABEL_25:
    self->_minEnabledValue = a7;
  if (v10)
    self->_maxEnabledValue = a9;
  return 1;
}

- (UIColor)maximumTrackTintColor
{
  return self->_maxTintColor;
}

- (BOOL)setValue:(float)a3
{
  return self->_value != a3
      && -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", self->_overrideMinimumEnabledValue, self->_overrideMaximumEnabledValue);
}

- (UIColor)minimumTrackTintColor
{
  return self->_minTintColor;
}

- (void)setThumbTintColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[UISliderDataModel thumbTintColor](self, "thumbTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v5 != v11)
  {
    objc_storeStrong((id *)&self->_thumbTintColor, a3);
    _UIImageWithName(CFSTR("UISliderKnob"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(CFSTR("UISliderKnob"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "_flatImageWithColor:", v11);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_flatImageWithColor:", v11);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
      v8 = (void *)v10;
    }
    -[UISliderDataModel setThumbImage:forState:](self, "setThumbImage:forState:", v7, 0);
    -[UISliderDataModel setThumbImage:forState:](self, "setThumbImage:forState:", v8, 1);

    v6 = v11;
  }

}

- (UIColor)thumbTintColor
{
  return self->_thumbTintColor;
}

- (BOOL)setMinimumValue:(float)minEnabledValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  *(float *)&v3 = minEnabledValue;
  if (self->_minValue == minEnabledValue)
    return 0;
  *(float *)&v5 = self->_minEnabledValue;
  if (self->_maxValue >= minEnabledValue)
    *(float *)&v4 = self->_maxValue;
  else
    *(float *)&v4 = minEnabledValue;
  if (*(float *)&v5 > minEnabledValue)
    minEnabledValue = self->_minEnabledValue;
  if (*(float *)&v4 <= minEnabledValue)
    minEnabledValue = *(float *)&v4;
  if (self->_overrideMinimumEnabledValue)
    *(float *)&v5 = minEnabledValue;
  if (self->_maxEnabledValue <= *(float *)&v3)
    *(float *)&v6 = *(float *)&v3;
  else
    *(float *)&v6 = self->_maxEnabledValue;
  if (*(float *)&v4 <= *(float *)&v6)
    *(float *)&v6 = *(float *)&v4;
  if (!self->_overrideMaximumEnabledValue)
    *(float *)&v6 = self->_maxEnabledValue;
  *(float *)&v7 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", v7, v3, v4, v5, v6);
}

- (UIImage)minimumValueImage
{
  return self->_minimumValueImage;
}

- (void)setThumbImage:(id)a3 forState:(unint64_t)a4
{
  _UISliderControlStateContent *v6;
  id v7;

  v7 = a3;
  -[UISliderDataModel _contentForState:](self, "_contentForState:", a4);
  v6 = (_UISliderControlStateContent *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(_UISliderControlStateContent);
    -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", v6, a4);
  }
  -[_UISliderControlStateContent setThumb:](v6, "setThumb:", v7);
  if (!v7 && -[_UISliderControlStateContent isEmpty](v6, "isEmpty"))
    -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", 0, a4);

}

- (void)dealloc
{
  __CFDictionary *contentLookup;
  objc_super v4;

  contentLookup = self->_contentLookup;
  if (contentLookup)
    CFRelease(contentLookup);
  v4.receiver = self;
  v4.super_class = (Class)UISliderDataModel;
  -[UISliderDataModel dealloc](&v4, sel_dealloc);
}

- (float)minimumEnabledValue
{
  uint64_t v2;

  v2 = 60;
  if (!self->_overrideMinimumEnabledValue)
    v2 = 52;
  return *(float *)((char *)&self->super.isa + v2);
}

- (BOOL)setMinimumEnabledValue:(float)a3
{
  double v4;

  if (self->_minEnabledValue == a3 || self->_minValue > a3 || self->_maxValue < a3)
    return 0;
  self->_overrideMinimumEnabledValue = 1;
  *(float *)&v4 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", 1, v4);
}

- (float)maximumEnabledValue
{
  uint64_t v2;

  v2 = 64;
  if (!self->_overrideMaximumEnabledValue)
    v2 = 56;
  return *(float *)((char *)&self->super.isa + v2);
}

- (BOOL)setMaximumEnabledValue:(float)a3
{
  double v4;

  if (self->_maxEnabledValue == a3 || self->_minValue > a3 || self->_maxValue < a3)
    return 0;
  self->_overrideMaximumEnabledValue = 1;
  *(float *)&v4 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", v4);
}

- (void)setThumbImage:(id)a3 forStates:(unint64_t)a4
{
  void *v6;
  _UISliderControlStateContent *v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x186DC9484]();
  do
  {
    -[UISliderDataModel _contentForState:](self, "_contentForState:", a4 & -(uint64_t)a4);
    v7 = (_UISliderControlStateContent *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(_UISliderControlStateContent);
      -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", v7, a4 & -(uint64_t)a4);
    }
    -[_UISliderControlStateContent setThumb:](v7, "setThumb:", v8);
    if (!v8 && -[_UISliderControlStateContent isEmpty](v7, "isEmpty"))
      -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", 0, a4 & -(uint64_t)a4);

    a4 &= a4 - 1;
  }
  while (a4);
  objc_autoreleasePoolPop(v6);

}

- (void)setMinimumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  void *v6;
  _UISliderControlStateContent *v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x186DC9484]();
  do
  {
    -[UISliderDataModel _contentForState:](self, "_contentForState:", a4 & -(uint64_t)a4);
    v7 = (_UISliderControlStateContent *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(_UISliderControlStateContent);
      -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", v7, a4 & -(uint64_t)a4);
    }
    -[_UISliderControlStateContent setMinTrack:](v7, "setMinTrack:", v8);
    if (!v8 && -[_UISliderControlStateContent isEmpty](v7, "isEmpty"))
      -[UISliderDataModel _setContent:forState:](self, "_setContent:forState:", 0, a4 & -(uint64_t)a4);

    a4 &= a4 - 1;
  }
  while (a4);
  objc_autoreleasePoolPop(v6);

}

- (void)setModulationFeedbackGenerator:(id)a3
{
  _UIModulationFeedbackGenerator *v5;
  _UIModulationFeedbackGenerator *modulationFeedbackGenerator;
  void *v7;

  v5 = (_UIModulationFeedbackGenerator *)a3;
  if (-[UIFeedbackGenerator isActive](self->_modulationFeedbackGenerator, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISliderDataModel.m"), 353, CFSTR("Modulation feedback behavior should not be changed while active."));

  }
  modulationFeedbackGenerator = self->_modulationFeedbackGenerator;
  self->_modulationFeedbackGenerator = v5;

}

- (_UIModulationFeedbackGenerator)modulationFeedbackGenerator
{
  return self->_modulationFeedbackGenerator;
}

- (void)setMinimumValueImage:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValueImage, a3);
}

- (void)setMinimumTrackTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_minTintColor, a3);
}

- (void)setMaximumTrackTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_maxTintColor, a3);
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (void)setShowValue:(BOOL)a3
{
  self->_showValue = a3;
}

- (void)setThumbEnabled:(BOOL)a3
{
  self->_thumbEnabled = a3;
}

- (BOOL)isTrackEnabled
{
  return self->_trackEnabled;
}

- (void)setTrackEnabled:(BOOL)a3
{
  self->_trackEnabled = a3;
}

- (void)setMinimumTrackVisible:(BOOL)a3
{
  self->_minimumTrackVisible = a3;
}

- (BOOL)isFluidTrackHidden
{
  return self->_fluidTrackHidden;
}

- (void)setFluidTrackHidden:(BOOL)a3
{
  self->_fluidTrackHidden = a3;
}

- (float)sliderSpeedMultiplier
{
  return self->_sliderSpeedMultiplier;
}

- (void)setSliderSpeedMultiplier:(float)a3
{
  self->_sliderSpeedMultiplier = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbTintColor, 0);
  objc_storeStrong((id *)&self->_maxTintColor, 0);
  objc_storeStrong((id *)&self->_minTintColor, 0);
  objc_storeStrong((id *)&self->_maximumValueImage, 0);
  objc_storeStrong((id *)&self->_minimumValueImage, 0);
  objc_storeStrong((id *)&self->_modulationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_edgeFeedbackGenerator, 0);
}

@end
