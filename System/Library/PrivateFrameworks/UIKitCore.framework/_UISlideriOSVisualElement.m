@implementation _UISlideriOSVisualElement

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
}

- (void)_traitCollectionDidChangeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  unint64_t v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView _traitCollectionDidChangeInternal:](&v7, sel__traitCollectionDidChangeInternal_);
  if (dyld_program_sdk_at_least())
  {
    if ((objc_msgSend(a3->var1, "hasDifferentColorAppearanceComparedToTraitCollection:", a3->var0) & 1) != 0
      || (v5 = _UIGetTraitTokenValue((const __CFNumber *)&unk_1E1A996A8),
          _UITraitTokenSetContains((uint16x8_t **)&a3->var2, v5)))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __63___UISlideriOSVisualElement__traitCollectionDidChangeInternal___block_invoke;
      v6[3] = &unk_1E16B1B28;
      v6[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
    }
  }
}

- (void)didSetEnabled
{
  void *v3;
  id v4;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setEnabled:](self, "setEnabled:", objc_msgSend(v3, "isEnabled"));

  -[_UISlideriOSVisualElement slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISlideriOSVisualElement _updateAppearanceForEnabled:](self, "_updateAppearanceForEnabled:", objc_msgSend(v4, "isEnabled"));

}

- (id)minTrackView
{
  return self->_minTrackView;
}

+ (id)_modernThumbImageWithTraitCollection:(id)a3 tintColor:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _UICGColorCacheKey *v9;
  _UICGColorCacheKey *v10;
  void *v11;
  UIGraphicsImageRenderer *v12;
  UIGraphicsImageRenderer *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a3;
  v6 = a4;
  if (qword_1ECD7B4F8 != -1)
    dispatch_once(&qword_1ECD7B4F8, &__block_literal_global_387);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_2;
  v22[3] = &unk_1E16C3488;
  v24 = &v30;
  v8 = v6;
  v23 = v8;
  v25 = &v26;
  +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)v5, (uint64_t)v22);
  v9 = [_UICGColorCacheKey alloc];
  v10 = -[_UICGColorCacheKey initWithColors:](v9, "initWithColors:", v31[3], v27[3], 0);
  objc_msgSend((id)_MergedGlobals_19_3, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = [UIGraphicsImageRenderer alloc];
    +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform");
    v13 = -[UIGraphicsImageRenderer initWithSize:](v12, "initWithSize:", v20, v21);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_3;
    v16[3] = &unk_1E16D8CB0;
    v17 = v5;
    v18 = &v26;
    v19 = &v30;
    -[UIGraphicsImageRenderer imageWithActions:](v13, "imageWithActions:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resizableImageWithCapInsets:", 0.0, 28.0, 0.0, 28.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend((id)_MergedGlobals_19_3, "setObject:forKey:", v11, v10);

  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v11;
}

- (void)didSetMaximumValueImage
{
  uint64_t v3;
  UIImageView *maxValueImageView;
  UIImageView *v5;
  UIImageView *v6;
  UIImageView *v7;
  id v8;

  -[UISliderDataModel maximumValueImage](self->_data, "maximumValueImage");
  v3 = objc_claimAutoreleasedReturnValue();
  maxValueImageView = self->_maxValueImageView;
  v8 = (id)v3;
  if (v3)
  {
    if (maxValueImageView)
    {
      -[UIImageView setImage:](maxValueImageView, "setImage:", v3);
      -[UIView sizeToFit](self->_maxValueImageView, "sizeToFit");
    }
    else
    {
      v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v3);
      v7 = self->_maxValueImageView;
      self->_maxValueImageView = v6;

      -[UIView addSubview:](self, "addSubview:", self->_maxValueImageView);
    }
  }
  else
  {
    -[UIView removeFromSuperview](maxValueImageView, "removeFromSuperview");
    v5 = self->_maxValueImageView;
    self->_maxValueImageView = 0;

  }
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)didSetMinimumTrackImageForState:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v9;

  -[UISliderDataModel minimumTrackImageForState:](self->_data, "minimumTrackImageForState:");
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v5;
  if (a3 || v5)
  {
    if (!a3)
    {
      -[_UISlideriOSVisualElement slider](self, "slider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "maximumTrackImageForState:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_trackIsArtworkBased && v7 != 0)
      {
        self->_trackIsArtworkBased = 1;
        -[_UISlideriOSVisualElement _rebuildControlThumb:track:](self, "_rebuildControlThumb:track:", 0, 1);
      }

    }
  }
  else if (self->_trackIsArtworkBased)
  {
    self->_trackIsArtworkBased = 0;
    -[_UISlideriOSVisualElement _rebuildControlThumb:track:](self, "_rebuildControlThumb:track:", 0, 1);
  }
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)didSetMaximumTrackImageForState:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v9;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumTrackImageForState:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (a3 || v9)
  {
    if (!a3)
    {
      -[UISliderDataModel minimumTrackImageForState:](self->_data, "minimumTrackImageForState:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (!self->_trackIsArtworkBased && v6 != 0)
      {
        self->_trackIsArtworkBased = 1;
        -[_UISlideriOSVisualElement _rebuildControlThumb:track:](self, "_rebuildControlThumb:track:", 0, 1);
      }

    }
  }
  else if (self->_trackIsArtworkBased)
  {
    self->_trackIsArtworkBased = 0;
    -[_UISlideriOSVisualElement _rebuildControlThumb:track:](self, "_rebuildControlThumb:track:", 0, 1);
  }
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (id)maxTrackView
{
  return self->_maxTrackView;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  float v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id WeakRetained;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  float v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  _QWORD v47[5];
  _QWORD v48[5];
  float v49;

  v4 = a4;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;

  if (v9 != a3)
  {
    if (v4)
    {
      -[_UISlideriOSVisualElement slider](self, "slider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "maximumValue");
      v13 = v12;
      -[_UISlideriOSVisualElement slider](self, "slider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "minimumValue");
      v16 = v15;

      if (v16 >= a3)
        a3 = v16;

      if (v13 <= a3)
        v17 = v13;
      else
        v17 = a3;
      *(_BYTE *)&self->_sliderFlags |= 2u;
      -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
      -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
      -[UIView bounds](self, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
      objc_msgSend(WeakRetained, "trackRectForBounds:", v19, v21, v23, v25);
      v45 = v28;
      v46 = v27;
      v30 = v29;
      v32 = v31;

      -[UIView layer](self->_thumbView, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "presentationLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "frame");
      v36 = v35;

      v37 = objc_loadWeakRetained((id *)&self->_slider);
      *(float *)&v44 = v17;
      objc_msgSend(v37, "thumbRectForBounds:trackRect:value:", v19, v21, v23, v25, v46, v45, v30, v32, v44);
      v39 = v38;

      v40 = vabdd_f64(v36, v39) / v30;
      v41 = v40 * 0.25;
      if (v41 >= 0.1)
        v42 = v41;
      else
        v42 = 0.1;
      -[_UISlideriOSVisualElement _sliderAnimationWillStart](self, "_sliderAnimationWillStart");
      v43 = 4 * (*(_BYTE *)&self->_sliderFlags & 1);
      v47[4] = self;
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __47___UISlideriOSVisualElement_setValue_animated___block_invoke;
      v48[3] = &unk_1E16BFE10;
      v48[4] = self;
      v49 = v17;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __47___UISlideriOSVisualElement_setValue_animated___block_invoke_2;
      v47[3] = &unk_1E16B3FD8;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v43, v48, v47, v42, 0.0);
    }
    else
    {
      *(float *)&v10 = a3;
      -[_UISlideriOSVisualElement _setValue:andSendAction:](self, "_setValue:andSendAction:", 0, v10);
    }
  }
}

- (void)setSlider:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[UISliderDataModel edgeFeedbackGenerator](self->_data, "edgeFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UISlideriOSVisualElement slider](self, "slider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISliderDataModel edgeFeedbackGenerator](self->_data, "edgeFeedbackGenerator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeInteraction:", v8);

      if (obj)
      {
        -[UISliderDataModel edgeFeedbackGenerator](self->_data, "edgeFeedbackGenerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "addInteraction:", v9);

      }
    }
    -[_UISlideriOSVisualElement didUpdateConfiguration](self, "didUpdateConfiguration");
    objc_storeWeak((id *)&self->_slider, obj);
    v5 = obj;
  }

}

- (void)setData:(id)a3
{
  UISliderDataModel **p_data;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_data = &self->_data;
  objc_storeStrong((id *)&self->_data, a3);
  -[_UISlideriOSVisualElement _setupFeedback](self, "_setupFeedback");
  self->_trackIsArtworkBased = 0;
  self->_thumbIsArtworkBased = 0;
  -[UISliderDataModel minimumTrackImageForState:](self->_data, "minimumTrackImageForState:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[UISliderDataModel maximumTrackImageForState:](*p_data, "maximumTrackImageForState:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      self->_trackIsArtworkBased = 1;
  }
  -[UISliderDataModel thumbImageForState:](*p_data, "thumbImageForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    self->_thumbIsArtworkBased = 1;

}

- (void)didUpdateConfiguration
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  uint64_t v7;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sliderConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v7;
  if (v7 && (v5 = objc_opt_respondsToSelector(), v4 = (void *)v7, (v5 & 1) != 0))
    v6 = *(_BYTE *)&self->_sliderFlags | 8;
  else
    v6 = *(_BYTE *)&self->_sliderFlags & 0xF7;
  *(_BYTE *)&self->_sliderFlags = v6;

}

- (void)_setupFeedback
{
  void *v3;
  void *v4;
  _UIEdgeFeedbackGenerator *v5;
  void *v6;
  _UIEdgeFeedbackGenerator *v7;
  id v8;

  -[UISliderDataModel edgeFeedbackGenerator](self->_data, "edgeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[_UIEdgeFeedbackGeneratorConfiguration sliderConfiguration](_UIEdgeFeedbackGeneratorConfiguration, "sliderConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("edgeImpact"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = [_UIEdgeFeedbackGenerator alloc];
    -[_UISlideriOSVisualElement slider](self, "slider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UIEdgeFeedbackGenerator initWithConfiguration:view:](v5, "initWithConfiguration:view:", v8, v6);
    -[UISliderDataModel setEdgeFeedbackGenerator:](self->_data, "setEdgeFeedbackGenerator:", v7);

  }
}

- (_UISlideriOSVisualElement)init
{
  double v4;

  +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform");
  return -[_UISlideriOSVisualElement initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, v4);
}

- (_UISlideriOSVisualElement)initWithFrame:(CGRect)a3
{
  _UISlideriOSVisualElement *v3;
  _UISlideriOSVisualElement *v4;
  void *v5;
  objc_class *v6;
  objc_class *v7;
  IMP MethodImplementation;
  IMP v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UISlideriOSVisualElement;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setAlpha:](v3, "setAlpha:", 1.0);
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

    -[UIView _setTouchInsets:](v4, "_setTouchInsets:", -12.5, -12.5, -12.5, -12.5);
    -[_UISlideriOSVisualElement _listenForContentSizeCategoryChangesIfNecessary](v4, "_listenForContentSizeCategoryChangesIfNecessary");
    v6 = (objc_class *)objc_opt_class();
    v7 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v6, sel__modifiedTrackRect_);
    v9 = class_getMethodImplementation(v7, sel__modifiedTrackRect_);
    if (MethodImplementation)
    {
      if (v9 && MethodImplementation != v9)
        *(_BYTE *)&v4->_sliderFlags |= 4u;
    }
  }
  return v4;
}

- (void)_listenForContentSizeCategoryChangesIfNecessary
{
  id v3;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryChanged_, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  }
}

- (void)_setValue:(float)a3 andSendAction:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  id WeakRetained;

  v4 = a4;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minimumValue");
  v10 = v9;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maximumValue");
  v13 = v12;

  if (v10 > v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISlideriOSVisualElement.m"), 1480, CFSTR("Attempting to set a slider's minimumValue (%f) to be larger than the maximumValue (%f)"), v10, v13);

  }
  if (v10 >= a3)
    v14 = v10;
  else
    v14 = a3;
  if (v13 <= v14)
    v15 = v13;
  else
    v15 = v14;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v18 = v17;

  if (v15 != v18)
  {
    *(float *)&v19 = v15;
    if (-[UISliderDataModel setValue:](self->_data, "setValue:", v19))
      -[_UISlideriOSVisualElement didSetValues](self, "didSetValues");
    if ((*(_BYTE *)&self->_sliderFlags & 1) != 0)
      -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
    else
      -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
    -[_UISlideriOSVisualElement slider](self, "slider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isTracking");

    if (v21)
      -[_UISlideriOSVisualElement _bounceMinMaxValueImageViewsIfNeeded](self, "_bounceMinMaxValueImageViewsIfNeeded");
    if (-[UISliderDataModel showValue](self->_data, "showValue"))
    {
      -[UIView bounds](self, "bounds");
      -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:");
      -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
    }
  }
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(WeakRetained, "_sendActionsForEvents:withEvent:", 4096, 0);

  }
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UISliderDataModel minimumValue](self->_data, "minimumValue", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = v10;
  -[UISliderDataModel maximumValue](self->_data, "maximumValue");
  v13 = 0.0;
  if (v12 != v11)
  {
    v14 = a5;
    if (v11 > a5)
      v14 = v11;
    if (v14 > v12)
      v14 = v12;
    v13 = (float)(v14 - v11) / (float)(v12 - v11);
  }
  if (dyld_program_sdk_at_least())
    v15 = -3.0;
  else
    v15 = -2.0;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectInset(v32, v15, 0.0);
  v16 = v33.origin.x;
  v17 = v33.origin.y;
  v18 = v33.size.width;
  v19 = v33.size.height;
  if (self->_thumbIsArtworkBased)
  {
    -[_UISlideriOSVisualElement currentThumbImage](self, "currentThumbImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;
    v24 = v23;

  }
  else
  {
    -[_UISlideriOSVisualElement thumbDimensionNeue](self, "thumbDimensionNeue");
    v22 = v25;
    -[_UISlideriOSVisualElement thumbDimensionNeue](self, "thumbDimensionNeue");
    v24 = v26;
  }
  v27 = 1.0 - v13;
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
    v27 = v13;
  v28 = v16 + round((v18 - v22) * v27);
  v29 = v17 + round((v19 - v24) * 0.5);
  v30 = v22;
  v31 = v24;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)thumbDimensionNeue
{
  double v3;

  +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform");
  return v3;
}

+ ($8D73A32B3079A4343D49B0A1BE7BFAC4)drawingMetricsForPlatform
{
  CGSize v4;
  __int128 v5;

  if (qword_1ECD7B500 != -1)
    dispatch_once(&qword_1ECD7B500, &__block_literal_global_41_0);
  v4 = *(CGSize *)&qword_1ECD7B520;
  retstr->var0.origin = (CGPoint)xmmword_1ECD7B510;
  retstr->var0.size = v4;
  v5 = unk_1ECD7B540;
  retstr->var1 = (CGSize)xmmword_1ECD7B530;
  *(_OWORD *)&retstr->var2 = v5;
  return result;
}

- (id)currentThumbImage
{
  void *v3;
  void *v4;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbImageForState:", -[_UISlideriOSVisualElement state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  v12 = v11 != height || v9 != width;
  -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", v12);
}

- (void)didPerformLayout
{
  -[_UISlideriOSVisualElement _initImages](self, "_initImages");
  if (!self->_thumbView && !self->_thumbViewNeue)
    -[_UISlideriOSVisualElement _initSubviews](self, "_initSubviews");
  -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
}

- (void)_initImages
{
  void *v3;
  void *v4;
  id WeakRetained;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  _UISlideriOSVisualElement *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumTrackImageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    -[UIView bounds](self, "bounds");
    objc_msgSend(WeakRetained, "trackRectForBounds:");
    v7 = v6;

    if (v7 <= 0.0)
    {
      v12 = 0;
    }
    else
    {
      -[UIView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor blackColor](UIColor, "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIProgressView _tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:](UIProgressView, "_tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:", v8, v10, 5, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageWithRenderingMode:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __40___UISlideriOSVisualElement__initImages__block_invoke;
    v19 = &unk_1E16B1B50;
    v20 = self;
    v21 = v12;
    v13 = v12;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", &v16);

  }
  -[_UISlideriOSVisualElement slider](self, "slider", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maximumTrackImageForState:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[_UISlideriOSVisualElement _updateMaxTrackColorForInitialization:](self, "_updateMaxTrackColorForInitialization:", 1);
}

- (id)currentMinimumTrackImage
{
  void *v3;
  void *v4;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumTrackImageForState:", -[_UISlideriOSVisualElement state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  id WeakRetained;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double x;
  CGRect v44;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maximumTrackImageForState:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  if (!self->_trackIsArtworkBased)
  {
    v11 = dyld_program_sdk_at_least();
    if ((dyld_program_sdk_at_least() & 1) != 0)
      goto LABEL_6;
    v10 = 2.0;
    if (dyld_program_sdk_at_least())
    {
      if (_AXSEnhanceTextLegibilityEnabled()
        || (-[UIView traitCollection](self, "traitCollection"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "preferredContentSizeCategory"),
            v13 = (NSString *)objc_claimAutoreleasedReturnValue(),
            IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13),
            v13,
            v12,
            IsAccessibilityCategory))
      {
LABEL_6:
        v10 = 3.0;
      }
    }
    if (v11)
      v10 = 4.0;
  }
  if (self->_minValueImageView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(WeakRetained, "minimumValueImageRectForBounds:", x, y, width, height);
    v17 = v16 + 11.0;

    v18 = v17;
    v19 = -0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v19 = v17;
    v20 = x + v19;
    v21 = width;
    v22 = width - v18;
  }
  else
  {
    v21 = width;
    v22 = width;
    v20 = x;
  }
  v23 = round((height - v10) * 0.5);
  if (self->_maxValueImageView)
  {
    v24 = objc_loadWeakRetained((id *)&self->_slider);
    v25 = y;
    objc_msgSend(v24, "maximumValueImageRectForBounds:", x, y, v21, height);
    v27 = v26 + 11.0;

    v28 = -0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
      v28 = v27;
    v20 = v20 + v28;
    v22 = v22 - v27;
  }
  else
  {
    v25 = y;
  }
  if (dyld_program_sdk_at_least())
    v29 = 3.0;
  else
    v29 = 2.0;
  if (v22 >= v29 + v29)
    v30 = v22;
  else
    v30 = v29 + v29;
  v31 = v20;
  v32 = v23;
  v33 = v10;
  v44 = CGRectInset(*(CGRect *)(&v30 - 2), v29, 0.0);
  v34 = v44.origin.x;
  v35 = v44.origin.y;
  v36 = v44.size.width;
  v37 = v44.size.height;
  if (-[UISliderDataModel showValue](self->_data, "showValue"))
  {
    -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:", x, v25, v21, height);
    v36 = v36 - (v38 + 11.0);
  }
  v39 = v34;
  v40 = v35;
  v41 = v36;
  v42 = v37;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (void)_layoutSubviewsForBoundsChange:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat Width;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  char v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGSize v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double height;
  double x;
  double y;
  int v64;
  CGFloat *p_y;
  CGSize *p_size;
  CGFloat *p_height;
  CGRect *p_slice;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  _BOOL4 v75;
  int *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  id v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double MinX;
  double MaxX;
  UILabel *v98;
  void *v99;
  void *v100;
  float v101;
  float v102;
  void *v103;
  float v104;
  const __CFString *v105;
  void *v106;
  float v107;
  void *v108;
  void *v109;
  UILabel *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  double v114;
  double v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  UISlider **p_slider;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  void *v133;
  CGRect remainder;
  CGRect slice;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;

  v3 = a3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "trackRectForBounds:", v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v116 = v21;
  v117 = v19;
  v118 = v17;
  v119 = v15;
  if ((*(_BYTE *)&self->_sliderFlags & 4) != 0)
  {
    -[_UISlideriOSVisualElement _modifiedTrackRect:](self, "_modifiedTrackRect:", v15, v17, v19, v21);
    v15 = v22;
    v17 = v23;
    v19 = v24;
    v21 = v25;
  }
  v26 = objc_loadWeakRetained((id *)&self->_slider);
  -[_UISlideriOSVisualElement slider](self, "slider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  LODWORD(v113) = v28;
  objc_msgSend(v26, "thumbRectForBounds:trackRect:value:", v6, v8, v10, v12, v15, v17, v19, v21, v113);
  v128 = v29;
  v130 = v30;
  v121 = v31;
  v123 = v32;

  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  -[_UISlideriOSVisualElement slider](self, "slider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "currentMinimumTrackImage");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UISlideriOSVisualElement slider](self, "slider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "currentMaximumTrackImage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UISlideriOSVisualElement slider](self, "slider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_edgeFeedbackGenerator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v132 = v12;
  if (v37 && v3)
  {
    v136.origin.x = v6;
    v136.origin.y = v8;
    v136.size.width = v10;
    v136.size.height = v12;
    Width = CGRectGetWidth(v136);
    -[_UISlideriOSVisualElement slider](self, "slider");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_edgeFeedbackGenerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = Width;
    v12 = v132;
    objc_msgSend(v40, "setDistance:", v41);

  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "_isThumbEnabled");

  v120 = v10;
  p_slider = &self->_slider;
  if ((v43 & 1) != 0)
  {
    v137.origin.x = v15;
    v137.origin.y = v17;
    v137.size.width = v19;
    v137.size.height = v21;
    CGRectDivide(v137, &slice, &remainder, v128 + round(v130 * 0.5) - v15, CGRectMinXEdge);
    v44 = slice.size.width;
    objc_msgSend(v133, "capInsets");
    if (v44 <= v45)
    {
      slice.origin.x = v15;
      slice.origin.y = v17;
      slice.size.height = v21;
      slice.size.width = 0.0;
      remainder.origin.x = v15;
      remainder.origin.y = v17;
      remainder.size.width = v19;
      remainder.size.height = v21;
    }
    else
    {
      v46 = slice.size.width;
      objc_msgSend(v35, "capInsets");
      if (v46 >= v19 - v47)
      {
        slice.origin.x = v15;
        slice.origin.y = v17;
        slice.size.width = v19;
        slice.size.height = v21;
        remainder.origin.x = v15;
        remainder.origin.y = v17;
        remainder.size.width = v19;
        remainder.size.height = v21;
        v138.origin.x = v15;
        v138.origin.y = v17;
        v138.size.width = v19;
        v138.size.height = v21;
        remainder.origin.x = CGRectGetMaxX(v138);
        remainder.size.width = 0.0;
      }
    }
    v12 = v132;
    if ((*(_BYTE *)&self->_sliderFlags & 2) != 0)
    {
      -[_UISlideriOSVisualElement slider](self, "slider");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "currentMinimumTrackImage");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (double)(objc_msgSend(v50, "leftCapWidth") + 1);

      -[_UISlideriOSVisualElement slider](self, "slider");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "currentMaximumTrackImage");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (double)(objc_msgSend(v53, "leftCapWidth") + 1);

      v55 = slice.size.width;
      if (slice.size.width >= v51)
      {
        v57 = remainder.size.width;
      }
      else
      {
        v56 = v51 - slice.size.width;
        slice.size.width = v51;
        v57 = remainder.size.width - v56;
        remainder.origin.x = v56 + remainder.origin.x;
        remainder.size.width = remainder.size.width - v56;
        v55 = v51;
      }
      v12 = v132;
      if (v57 < v54)
      {
        v58 = v54 - v57;
        remainder.origin.x = remainder.origin.x - v58;
        remainder.size.width = v54;
        slice.size.width = v55 - v58;
      }
    }
    v10 = v120;
    if (-[UISliderDataModel isMinimumTrackVisible](self->_data, "isMinimumTrackVisible"))
    {
      v59 = v35;
      v60 = remainder.size.width;
      height = remainder.size.height;
      x = remainder.origin.x;
      y = remainder.origin.y;
      goto LABEL_21;
    }
  }
  else
  {
    v48 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v48;
  }
  v59 = v35;
  remainder.origin.x = v15;
  remainder.origin.y = v17;
  x = v15;
  height = v21;
  v60 = v19;
  y = v17;
  remainder.size.width = v19;
  remainder.size.height = v21;
LABEL_21:
  v64 = *((_DWORD *)&self->super._viewFlags + 4);
  if ((v64 & 0x80000) == 0)
    y = slice.origin.y;
  if ((*(_QWORD *)&v64 & 0x80000) != 0)
  {
    p_y = &slice.origin.y;
  }
  else
  {
    v60 = slice.size.width;
    height = slice.size.height;
    x = slice.origin.x;
    p_y = &remainder.origin.y;
  }
  if ((*(_QWORD *)&v64 & 0x80000) != 0)
    p_size = &slice.size;
  else
    p_size = &remainder.size;
  if ((*(_QWORD *)&v64 & 0x80000) != 0)
    p_height = &slice.size.height;
  else
    p_height = &remainder.size.height;
  if ((*(_QWORD *)&v64 & 0x80000) != 0)
    p_slice = &slice;
  else
    p_slice = &remainder;
  -[UIView setFrame:](self->_minTrackClipView, "setFrame:", x, y, v60, height);
  -[UIImageView setImage:](self->_minTrackView, "setImage:", v133);
  -[UIView convertRect:fromView:](self->_minTrackClipView, "convertRect:fromView:", self, v15, v17, v19, v21);
  -[UIImageView setFrame:](self->_minTrackView, "setFrame:");
  -[UIView setFrame:](self->_maxTrackClipView, "setFrame:", p_slice->origin.x, *p_y, p_size->width, *p_height);
  v69 = v59;
  -[UIImageView setImage:](self->_maxTrackView, "setImage:", v59);
  -[UIView convertRect:fromView:](self->_maxTrackClipView, "convertRect:fromView:", self, v15, v17, v19, v21);
  -[UIImageView setFrame:](self->_maxTrackView, "setFrame:");
  if ((v64 & 0x80000) != 0)
    -[UIView setFrameOrigin:](self->_maxTrackView, "setFrameOrigin:", *MEMORY[0x1E0CB3430], *(double *)(MEMORY[0x1E0CB3430] + 8));
  if (self->_thumbIsArtworkBased)
  {
    -[_UISlideriOSVisualElement currentThumbImage](self, "currentThumbImage");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView image](self->_thumbView, "image");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71 != v70)
    {
      -[UIImageView setImage:](self->_thumbView, "setImage:", v70);
      if (objc_msgSend(v70, "leftCapWidth") || objc_msgSend(v70, "topCapHeight"))
        v72 = 0;
      else
        v72 = 4;
      -[UIImageView setContentMode:](self->_thumbView, "setContentMode:", v72);
    }
    -[UIImageView setFrame:](self->_thumbView, "setFrame:", v128, v121, v130, v123);

  }
  else
  {
    -[UIView setFrame:](self->_thumbViewNeue, "setFrame:", v128, v121, v130, v123);
  }
  if ((*(_BYTE *)&self->_sliderFlags & 4) != 0)
  {
    v77 = 9;
    if ((*(_QWORD *)&v64 & 0x80000) != 0)
      v78 = 9;
    else
      v78 = 8;
    v79 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v78]);
    if ((*(_QWORD *)&v64 & 0x80000) != 0)
      v77 = 8;
    v80 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v77]));
    v74 = v79;
    v81 = objc_loadWeakRetained((id *)p_slider);
    v82 = v81;
    if ((v64 & 0x80000) != 0)
    {
      objc_msgSend(v81, "maximumValueImageRectForBounds:", v6, v8, v10, v12);
      v124 = v93;
      v125 = v92;
      v129 = v95;
      v131 = v94;

      v87 = objc_loadWeakRetained((id *)p_slider);
      objc_msgSend(v87, "minimumValueImageRectForBounds:", v6, v8, v10, v12);
    }
    else
    {
      objc_msgSend(v81, "minimumValueImageRectForBounds:", v6, v8, v10, v12);
      v124 = v84;
      v125 = v83;
      v129 = v86;
      v131 = v85;

      v87 = objc_loadWeakRetained((id *)p_slider);
      objc_msgSend(v87, "maximumValueImageRectForBounds:", v6, v8, v10, v12);
    }
    v114 = v91;
    v115 = v88;
    v127 = v89;
    v122 = v90;
    v75 = v3;
    v76 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;

    v139.origin.x = v15;
    v139.origin.y = v17;
    v139.size.width = v19;
    v139.size.height = v21;
    MinX = CGRectGetMinX(v139);
    v140.origin.x = v119;
    v140.origin.y = v118;
    v140.size.width = v117;
    v140.size.height = v116;
    objc_msgSend(v74, "setFrame:", v125 + MinX - CGRectGetMinX(v140), v131, v129, v124);
    v141.origin.x = v15;
    v141.origin.y = v17;
    v141.size.width = v19;
    v141.size.height = v21;
    MaxX = CGRectGetMaxX(v141);
    v142.origin.x = v119;
    v142.origin.y = v118;
    v142.size.width = v117;
    v142.size.height = v116;
    objc_msgSend(v80, "setFrame:", v115 + MaxX - CGRectGetMaxX(v142), v127, v122, v114);

    v10 = v120;
    v12 = v132;
  }
  else
  {
    v73 = objc_loadWeakRetained((id *)p_slider);
    objc_msgSend(v73, "minimumValueImageRectForBounds:", v6, v8, v10, v12);
    -[UIImageView setFrame:](self->_minValueImageView, "setFrame:");

    v74 = objc_loadWeakRetained((id *)p_slider);
    objc_msgSend(v74, "maximumValueImageRectForBounds:", v6, v8, v10, v12);
    -[UIImageView setFrame:](self->_maxValueImageView, "setFrame:");
    v75 = v3;
    v76 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
  }

  -[UIView viewWithTag:](self, "viewWithTag:", 1986096245);
  v98 = (UILabel *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v76[174]), "showValue"))
  {
    if (v98)
    {
      if (!v75)
      {
LABEL_60:
        v99 = (void *)MEMORY[0x1E0CB3940];
        -[_UISlideriOSVisualElement slider](self, "slider");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "maximumValue");
        v102 = v101;
        -[_UISlideriOSVisualElement slider](self, "slider");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "minimumValue");
        if ((float)(v102 - v104) < 10.0)
          v105 = CFSTR("%.2f");
        else
          v105 = CFSTR("%.1f");
        -[_UISlideriOSVisualElement slider](self, "slider");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "value");
        objc_msgSend(v99, "stringWithFormat:", v105, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v98, "setText:", v108);

        goto LABEL_66;
      }
    }
    else
    {
      v110 = [UILabel alloc];
      -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:", v6, v8, v10, v12);
      v98 = -[UILabel initWithFrame:](v110, "initWithFrame:");
      -[UIView setTag:](v98, "setTag:", 1986096245);
      objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 12.0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v98, "setFont:", v111);

      +[UIColor lightGrayColor](UIColor, "lightGrayColor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v98, "setTextColor:", v112);

      -[UIView setBackgroundColor:](v98, "setBackgroundColor:", 0);
      -[UILabel setLineBreakMode:](v98, "setLineBreakMode:", 2);
      -[UIView setOpaque:](v98, "setOpaque:", 0);
      -[UIView addSubview:](self, "addSubview:", v98);
      if (!v75)
        goto LABEL_60;
    }
    -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:", v6, v8, v10, v12);
    -[UILabel setFrame:](v98, "setFrame:");
    goto LABEL_60;
  }
  if (v98)
  {
    -[UIView removeFromSuperview](v98, "removeFromSuperview");
LABEL_66:

  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISlideriOSVisualElement _updateAppearanceForEnabled:](self, "_updateAppearanceForEnabled:", objc_msgSend(v109, "isEnabled"));

}

- (UISlider)slider
{
  return (UISlider *)objc_loadWeakRetained((id *)&self->_slider);
}

- (void)_updateAppearanceForEnabled:(BOOL)a3
{
  double v3;

  v3 = 0.5;
  if (a3)
    v3 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", v3);
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  UIImageView *maxValueImageView;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  maxValueImageView = self->_maxValueImageView;
  if (maxValueImageView)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[UIImageView image](maxValueImageView, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    v13 = v12;

    v14 = x + width - v11;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
      v14 = x;
    v15 = y + floor((height - v13) * 0.5);
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)currentMaximumTrackImage
{
  void *v3;
  void *v4;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumTrackImageForState:", -[_UISlideriOSVisualElement state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)state
{
  uint64_t v3;
  unint64_t v4;

  if (-[UISliderDataModel isEnabled](self->_data, "isEnabled"))
    v3 = 0;
  else
    v3 = 2;
  v4 = v3 | -[UISliderDataModel isHighlighted](self->_data, "isHighlighted");
  if (-[UISliderDataModel isSelected](self->_data, "isSelected"))
    return v4 | 4;
  else
    return v4;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  UIImageView *minValueImageView;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  minValueImageView = self->_minValueImageView;
  if (minValueImageView)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[UIImageView image](minValueImageView, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    v13 = v12;

    v14 = x + width - v11;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v14 = x;
    v15 = y + floor((height - v13) * 0.5);
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)didSetMaximumTrackImageForStates
{
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_setSliderNeedsLayout
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_initSubviews
{
  _BOOL4 thumbIsArtworkBased;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[_UISlideriOSVisualElement _buildTrackArtwork](self, "_buildTrackArtwork");
  thumbIsArtworkBased = self->_thumbIsArtworkBased;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_msgSend(v4, "createThumbView");
  v6 = 5;
  if (!thumbIsArtworkBased)
    v6 = 6;
  v7 = OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v6];
  v8 = *(Class *)((char *)&self->super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.isa + v7) = v5;

  -[UIView addSubview:](self, "addSubview:", *(Class *)((char *)&self->super.super.super.isa + v7));
}

- (void)_buildTrackArtwork
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView *v20;
  UIView *maxTrackClipView;
  UIView *v22;
  UIView *minTrackClipView;
  UIImageView *thumbView;
  UIImageView *v25;
  UIImageView *v26;
  UIImageView *maxTrackView;
  UIImageView *v28;
  UIImageView *minTrackView;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "trackRectForBounds:", v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, v15, v17, v19);
  maxTrackClipView = self->_maxTrackClipView;
  self->_maxTrackClipView = v20;

  v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, v15, v17, v19);
  minTrackClipView = self->_minTrackClipView;
  self->_minTrackClipView = v22;

  -[UIView setUserInteractionEnabled:](self->_maxTrackClipView, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](self->_maxTrackClipView, "setOpaque:", 0);
  -[UIView setClipsToBounds:](self->_maxTrackClipView, "setClipsToBounds:", 1);
  -[UIView setUserInteractionEnabled:](self->_minTrackClipView, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](self->_minTrackClipView, "setOpaque:", 0);
  -[UIView setClipsToBounds:](self->_minTrackClipView, "setClipsToBounds:", 1);
  if (self->_thumbView || self->_thumbViewNeue)
  {
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_maxTrackClipView);
    thumbView = self->_thumbView;
    if (!thumbView)
      thumbView = (UIImageView *)self->_thumbViewNeue;
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_minTrackClipView, thumbView);
  }
  else
  {
    -[UIView addSubview:](self, "addSubview:", self->_maxTrackClipView);
    -[UIView addSubview:](self, "addSubview:", self->_minTrackClipView);
  }
  v25 = [UIImageView alloc];
  -[UIView bounds](self->_maxTrackClipView, "bounds");
  v26 = -[UIImageView initWithFrame:](v25, "initWithFrame:");
  maxTrackView = self->_maxTrackView;
  self->_maxTrackView = v26;

  -[UIView setUserInteractionEnabled:](self->_maxTrackView, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](self->_maxTrackView, "setOpaque:", 0);
  -[UIView setClipsToBounds:](self->_maxTrackView, "setClipsToBounds:", 1);
  v28 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v13, v15, v17, v19);
  minTrackView = self->_minTrackView;
  self->_minTrackView = v28;

  -[UIView setUserInteractionEnabled:](self->_minTrackView, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](self->_minTrackView, "setOpaque:", 0);
  -[UIView setClipsToBounds:](self->_minTrackView, "setClipsToBounds:", 1);
  -[UIView addSubview:](self->_maxTrackClipView, "addSubview:", self->_maxTrackView);
  -[UIView addSubview:](self->_minTrackClipView, "addSubview:", self->_minTrackView);
}

- (id)createThumbView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UISliderImageView *v24;
  double v25;
  double v26;
  uint64_t v28;

  if (self->_thumbIsArtworkBased)
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(v11, "trackRectForBounds:", v4, v6, v8, v10);
    LODWORD(v28) = 0;
    objc_msgSend(v11, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v13, v14, v15, v28);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = -[UIImageView initWithFrame:]([UISliderImageView alloc], "initWithFrame:", v17, v19, v21, v23);
    -[UIView setUserInteractionEnabled:](v24, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v24, "setOpaque:", 0);
    if (v21 + -44.0 <= 0.0)
      v25 = (v21 + -44.0) * 0.5;
    else
      v25 = 0.0;
    if (v23 + -44.0 <= 0.0)
      v26 = (v23 + -44.0) * 0.5;
    else
      v26 = 0.0;
    -[UIView _setTouchInsets:](v24, "_setTouchInsets:", v26, v25, v26, v25);
  }
  else
  {
    v24 = -[_UISlideriOSVisualElement createThumbViewNeue](self, "createThumbViewNeue");
  }
  return v24;
}

- (void)_updateMaxTrackColorForInitialization:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumTrackTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (dyld_program_sdk_at_least())
      +[UIColor systemFillColor](UIColor, "systemFillColor");
    else
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.72265625, 0.72265625, 0.72265625, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0.0;
  v16 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
      if ((dyld_program_sdk_at_least() & 1) == 0 && v8)
      {
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v16 * 0.978378378, v15 * 0.978378378, v14 * 0.978378378, v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v9;
        v18[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
    }
    else
    {
      dyld_program_sdk_at_least();
    }
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    if ((-[NSArray isEqual:](self->_trackColors, "isEqual:", v7) & 1) != 0)
      goto LABEL_19;
    goto LABEL_15;
  }
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  objc_storeStrong((id *)&self->_trackColors, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67___UISlideriOSVisualElement__updateMaxTrackColorForInitialization___block_invoke;
  v12[3] = &unk_1E16B1B28;
  v12[4] = self;
  v10 = _Block_copy(v12);
  v11 = v10;
  if (v3)
  {
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v10);
  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
    self->_trackIsArtworkBased = 0;
  }

LABEL_19:
}

- (void)didSetThumbImageForState:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  id v7;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbImageForState:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_thumbIsArtworkBased)
  {
    if (!a3 && !v7)
    {
      v6 = 0;
LABEL_7:
      self->_thumbIsArtworkBased = v6;
      -[_UISlideriOSVisualElement _rebuildControlThumb:track:](self, "_rebuildControlThumb:track:", 1, 0);
    }
  }
  else if (v7)
  {
    v6 = 1;
    goto LABEL_7;
  }
  -[UISliderDataModel setThumbTintColor:](self->_data, "setThumbTintColor:", 0);
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)_rebuildControlThumb:(BOOL)a3 track:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *p_thumbView;
  UIImageView *thumbView;
  void *v8;
  UIView *thumbViewNeue;
  _BOOL4 thumbIsArtworkBased;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  UIImageView *minTrackView;
  UIView *minTrackClipView;
  UIImageView *maxTrackView;
  UIView *maxTrackClipView;

  v4 = a4;
  p_thumbView = &self->_thumbView;
  thumbView = self->_thumbView;
  if (thumbView || self->_thumbViewNeue)
  {
    if (a3)
    {
      -[UIView removeFromSuperview](thumbView, "removeFromSuperview");
      v8 = (void *)*p_thumbView;
      *p_thumbView = 0;

      -[UIView removeFromSuperview](self->_thumbViewNeue, "removeFromSuperview");
      thumbViewNeue = self->_thumbViewNeue;
      self->_thumbViewNeue = 0;

      thumbIsArtworkBased = self->_thumbIsArtworkBased;
      WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
      v12 = objc_msgSend(WeakRetained, "createThumbView");
      if (!thumbIsArtworkBased)
        p_thumbView = &self->_thumbViewNeue;
      v13 = (void *)*p_thumbView;
      *p_thumbView = v12;

      -[UIView addSubview:](self, "addSubview:", *p_thumbView);
    }
    if (v4)
    {
      -[UIView removeFromSuperview](self->_minTrackView, "removeFromSuperview");
      minTrackView = self->_minTrackView;
      self->_minTrackView = 0;

      -[UIView removeFromSuperview](self->_minTrackClipView, "removeFromSuperview");
      minTrackClipView = self->_minTrackClipView;
      self->_minTrackClipView = 0;

      -[UIView removeFromSuperview](self->_maxTrackView, "removeFromSuperview");
      maxTrackView = self->_maxTrackView;
      self->_maxTrackView = 0;

      -[UIView removeFromSuperview](self->_maxTrackClipView, "removeFromSuperview");
      maxTrackClipView = self->_maxTrackClipView;
      self->_maxTrackClipView = 0;

      -[_UISlideriOSVisualElement _buildTrackArtwork](self, "_buildTrackArtwork");
    }
    -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  }
}

- (id)createThumbViewNeue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  UIImageView *v30;
  UIImageView *innerThumbView;
  UISliderImageView *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v43;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  -[_UISlideriOSVisualElement trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
  LODWORD(v43) = 0;
  objc_msgSend(WeakRetained, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v13, v14, v15, v43);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[_UISlideriOSVisualElement thumbTintColor](self, "thumbTintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least())
  {
    v25 = (void *)objc_opt_class();
    -[UIView traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_modernThumbImageWithTraitCollection:tintColor:", v26, v24);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UIImageWithName(CFSTR("UISliderKnob"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v28;
    if (!v24)
      goto LABEL_6;
    objc_msgSend(v28, "_flatImageWithColor:", v24);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v27;

  v26 = v29;
LABEL_6:
  v30 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v26);
  innerThumbView = self->_innerThumbView;
  self->_innerThumbView = v30;

  v32 = -[UIImageView initWithFrame:]([UISliderImageView alloc], "initWithFrame:", v17, v19, v21, v23);
  -[UIView setUserInteractionEnabled:](v32, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](v32, "setOpaque:", 0);
  if (v21 + -44.0 <= 0.0)
    v33 = (v21 + -44.0) * 0.5;
  else
    v33 = 0.0;
  if (v23 + -44.0 <= 0.0)
    v34 = (v23 + -44.0) * 0.5;
  else
    v34 = 0.0;
  -[UIView _setTouchInsets:](v32, "_setTouchInsets:", v34, v33, v34, v33);
  -[UIView addSubview:](v32, "addSubview:", self->_innerThumbView);
  -[UIView frame](self->_innerThumbView, "frame");
  v36 = v35;
  v38 = v37;
  UIFloorToViewScale(self);
  v40 = v39;
  UIFloorToViewScale(self);
  -[UIImageView setFrame:](self->_innerThumbView, "setFrame:", v40, v41, v36, v38);

  return v32;
}

- (id)thumbTintColor
{
  return -[UISliderDataModel thumbTintColor](self->_data, "thumbTintColor");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v6;
  const __CFString *v7;
  char v9;

  v9 = 0;
  objc_msgSend(a4, "location", a3);
  -[_UISlideriOSVisualElement _shouldBeginTrackingAtPoint:pointInKnob:inKnob:](self, "_shouldBeginTrackingAtPoint:pointInKnob:inKnob:", 0, &v9);
  if (v9)
  {
    v6 = 5;
    if (!self->_thumbIsArtworkBased)
      v6 = 6;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v6]), "frame");
    v7 = CFSTR("UISliderKnob");
  }
  else
  {
    -[UIView bounds](self, "bounds");
    v7 = CFSTR("UISliderTrack");
  }
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  UITargetedPreview *v9;
  UITargetedPreview *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;

  v5 = a4;
  +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform");
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v16, v17, v18, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("UISliderKnob"));

  if (v8)
  {
    if (self->_thumbIsArtworkBased)
    {
      v9 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", self->_thumbView);
      +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v9);
      v10 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
      +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (UITargetedPreview *)objc_opt_new();
      -[UITargetedPreview setVisiblePath:](v9, "setVisiblePath:", v6);
      v10 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", self->_innerThumbView, v9);
      +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v14, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", CFSTR("UISliderTrack"));

  if (v13)
  {
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = v18;
    v20.size.height = v19;
    +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", 0.0, 0.0, v18, v19, CGRectGetWidth(v20) * 0.5);
    v9 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
    +[UIPointerStyle styleWithShape:constrainedAxes:](UIPointerStyle, "styleWithShape:constrainedAxes:", v9, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (void)_bounceMinMaxValueImageViewsIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  UIImageView *minValueImageView;
  void *v15;
  void *v16;
  float v17;
  float v18;
  UIImageView *maxValueImageView;
  id v20;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_allowsSymbolAnimations");

  if (v4)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumValue");
    v7 = v6;

    -[_UISlideriOSVisualElement slider](self, "slider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minimumValue");
    v10 = v9;

    if (v7 > v10)
    {
      if (self->_minValueImageView)
      {
        -[_UISlideriOSVisualElement slider](self, "slider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v13 = v12;

        if (v13 <= v10)
        {
          minValueImageView = self->_minValueImageView;
          objc_msgSend(MEMORY[0x1E0CE86C8], "effect");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView addSymbolEffect:](minValueImageView, "addSymbolEffect:", v15);

        }
      }
      if (self->_maxValueImageView)
      {
        -[_UISlideriOSVisualElement slider](self, "slider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "value");
        v18 = v17;

        if (v18 >= v7)
        {
          maxValueImageView = self->_maxValueImageView;
          objc_msgSend(MEMORY[0x1E0CE86C8], "effect");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[UIImageView addSymbolEffect:](maxValueImageView, "addSymbolEffect:", v20);

        }
      }
    }
  }
}

- (double)_cornerRadiusForRect:(CGRect)a3
{
  double height;

  if (a3.size.height <= a3.size.width)
    height = a3.size.height;
  else
    height = a3.size.width;
  return height * 0.5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  double v7;
  BOOL v8;
  _UISlideriOSVisualElement *v9;
  _UISlideriOSVisualElement *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;
  double v24;
  double v25;
  BOOL v26;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  v6 = objc_msgSend(WeakRetained, "isTracking");

  if ((v6 & 1) != 0)
  {
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "locationInView:", self);
  if (!-[_UISlideriOSVisualElement _shouldBeginTrackingAtPoint:pointInKnob:inKnob:](self, "_shouldBeginTrackingAtPoint:pointInKnob:inKnob:", 0, 0))goto LABEL_18;
  objc_msgSend(v4, "view");
  v9 = (_UISlideriOSVisualElement *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {

    goto LABEL_18;
  }
  v10 = v9;
  objc_msgSend(v4, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)&self->_slider);

  if (v11 == v12)
  {
LABEL_18:
    v8 = 1;
    goto LABEL_19;
  }
  if (!objc_msgSend(v4, "_isGestureType:", 10) || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {
    if (objc_msgSend(v4, "_isGestureType:", 8)
      && (unint64_t)objc_msgSend(v4, "minimumNumberOfTouches") <= 1)
    {
      objc_msgSend(v4, "translationInView:", self);
      v7 = fabs(v24);
      v8 = v7 <= fabs(v25);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  objc_msgSend(v4, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, 10.0, 10.0);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v18, 20.0, 10.0);
  v20 = v19;
  v22 = v21;

  if ((objc_msgSend(v4, "direction") & 3) == 0 || (v8 = 0, v7 = v15 - v20, v15 - v20 >= 0.0) && v15 - v20 <= 0.0)
  {
    v23 = objc_msgSend(v4, "direction", v7);
    v7 = v17 - v22;
    v8 = (v23 & 0xC) == 0 || v17 - v22 == 0.0;
  }
LABEL_19:
  v26 = v8 & ~objc_msgSend(v4, "_isGestureType:", 16, v7);

  return v26;
}

- (void)didSetThumbTintColor
{
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[_UISlideriOSVisualElement _rebuildControlThumb:track:](self, "_rebuildControlThumb:track:", 1, 0);
}

- (void)_updateMinimumTrackTintColor
{
  id WeakRetained;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[UISliderDataModel setMinimumTrackImage:forStates:](self->_data, "setMinimumTrackImage:forStates:", 0, 0);
  -[UISliderDataModel setMinimumTrackImage:forStates:](self->_data, "setMinimumTrackImage:forStates:", 0, 7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  -[UIView bounds](self, "bounds");
  objc_msgSend(WeakRetained, "trackRectForBounds:");
  v5 = v4;

  -[UISliderDataModel minimumTrackTintColor](self->_data, "minimumTrackTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = 1;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 2;
  }
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIProgressView _tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:](UIProgressView, "_tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:", v10, v11, 5, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISliderDataModel setMinimumTrackImage:forStates:](self->_data, "setMinimumTrackImage:forStates:", v13, 0);
}

- (void)didSetMinimumTrackTintColor
{
  -[_UISlideriOSVisualElement _updateMinimumTrackTintColor](self, "_updateMinimumTrackTintColor");
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
}

- (void)didSetMaximumTrackTintColor
{
  self->_trackIsArtworkBased = 0;
  -[_UISlideriOSVisualElement _updateMaxTrackColorForInitialization:](self, "_updateMaxTrackColorForInitialization:", 0);
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
}

- (void)didSetMinimumValueImage
{
  uint64_t v3;
  UIImageView *minValueImageView;
  UIImageView *v5;
  UIImageView *v6;
  UIImageView *v7;
  id v8;

  -[UISliderDataModel minimumValueImage](self->_data, "minimumValueImage");
  v3 = objc_claimAutoreleasedReturnValue();
  minValueImageView = self->_minValueImageView;
  v8 = (id)v3;
  if (v3)
  {
    if (minValueImageView)
    {
      -[UIImageView setImage:](minValueImageView, "setImage:", v3);
      -[UIView sizeToFit](self->_minValueImageView, "sizeToFit");
    }
    else
    {
      v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v3);
      v7 = self->_minValueImageView;
      self->_minValueImageView = v6;

      -[UIView addSubview:](self, "addSubview:", self->_minValueImageView);
    }
  }
  else
  {
    -[UIView removeFromSuperview](minValueImageView, "removeFromSuperview");
    v5 = self->_minValueImageView;
    self->_minValueImageView = 0;

  }
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (id)maximumValueImage
{
  return -[UISliderDataModel maximumValueImage](self->_data, "maximumValueImage");
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGSize result;

  width = a3.width;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform", a3.width, a3.height);
  -[_UISlideriOSVisualElement slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumTrackImageForState:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(v8, "leftCapWidth") > 0;
    if (v12 > v6)
      v6 = v12;
    if (v10 > v5)
      v5 = v10;
  }
  else
  {
    v13 = 1;
    if (v38 > v6)
      v6 = v38;
  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maximumTrackImageForState:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "size");
    v17 = v16;
    v19 = v18;
    if (v13)
      LOBYTE(v13) = objc_msgSend(v15, "leftCapWidth") > 0;
    if (v19 <= v6)
      v19 = v6;
    if (v17 > v5)
      v5 = v17;
  }
  else if (v38 > v6)
  {
    v19 = v38;
  }
  else
  {
    v19 = v6;
  }
  if (self->_thumbIsArtworkBased)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "thumbImageForState:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "size");
      if (v23 > v19)
        v19 = v23;
      if (v22 > v5)
        v5 = v22;
      v15 = v21;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    -[_UISlideriOSVisualElement thumbDimensionNeue](self, "thumbDimensionNeue");
    v25 = v24;
    -[_UISlideriOSVisualElement thumbDimensionNeue](self, "thumbDimensionNeue");
    if (v26 > v19)
      v19 = v26;
    if (v25 > v5)
      v5 = v25;
  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minimumValueImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v28, "size");
    v5 = v5 + v30 + 11.0;
    if (v29 > v19)
      v19 = v29;
  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "maximumValueImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v32, "size");
    v5 = v5 + v34 + 11.0;
    if (v33 > v19)
      v19 = v33;
  }
  if (!-[UISliderDataModel showValue](self->_data, "showValue") || (v5 = v5 + 34.0, v35 = 15.0, v19 >= 15.0))
    v35 = v19;
  if (v5 > width || !v13)
    width = v5;

  v36 = width;
  v37 = v35;
  result.height = v37;
  result.width = v36;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIEdgeInsets result;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbImageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumTrackImageForState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v4, "alignmentRectInsets"), v10 = v7, v11 = v9, v12 = 1, v13 == 0.0)
    && v8 == 0.0
    && v7 == 0.0
    && v9 == 0.0)
  {
    v12 = 0;
    v11 = 1.0;
    v10 = 0.0;
  }
  v14 = 2.0;
  if (!v6
    || (objc_msgSend(v6, "alignmentRectInsets"), v19 = v18, v20 = v15, v21 = v16, v22 = v17, v18 == 0.0)
    && v16 == 0.0
    && v15 == 0.0
    && v17 == 0.0)
  {
    v23 = 2.0;
  }
  else
  {
    v24 = dyld_program_sdk_at_least();
    v25 = 2.0;
    if (v24)
      v25 = 3.0;
    v23 = v20 + v25;
    v14 = v22 + v25;
    if (!v12)
    {
      v11 = v21;
      v10 = v19;
    }
  }

  v26 = v10;
  v27 = v23;
  v28 = v11;
  v29 = v14;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  v12 = v11 != height || v9 != width;
  -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", v12);
}

- (void)_sliderAnimationWillStart
{
  *(_BYTE *)&self->_sliderFlags = *(_BYTE *)&self->_sliderFlags & 0xFC | 1;
}

- (void)_sliderAnimationDidStop:(BOOL)a3
{
  if (a3)
  {
    *(_BYTE *)&self->_sliderFlags &= 0xFCu;
    -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UISlideriOSVisualElement *v5;
  _UISlideriOSVisualElement *v6;
  _UISlideriOSVisualElement *WeakRetained;
  _UISlideriOSVisualElement *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISlideriOSVisualElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    WeakRetained = (_UISlideriOSVisualElement *)objc_loadWeakRetained((id *)&self->_slider);
  else
    WeakRetained = v5;
  v8 = WeakRetained;

  return v8;
}

- (BOOL)cancelMouseTracking
{
  void *v3;
  int v4;
  void *v5;
  id WeakRetained;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHighlighted");

  if (v4)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "_sendActionsForEvents:withEvent:", 256, 0);

  return 1;
}

- (BOOL)_shouldBeginTrackingAtPoint:(CGPoint)a3 pointInKnob:(CGPoint *)a4 inKnob:(BOOL *)a5
{
  uint64_t v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  BOOL v28;
  CGPoint v30;
  CGRect v31;

  v8 = 5;
  if (!self->_thumbIsArtworkBased)
    v8 = 6;
  v9 = OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "convertPoint:fromView:", self, a3.x, a3.y);
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UISlideriOSVisualElement thumbHitEdgeInsets](self, "thumbHitEdgeInsets");
  v23 = v17 + v22;
  v26 = v19 - (v24 + v25);
  v31.size.height = v21 - (v22 + v27);
  v31.origin.x = v15 + v24;
  v31.origin.y = v23;
  v31.size.width = v26;
  v30.x = v11;
  v30.y = v13;
  v28 = CGRectContainsPoint(v31, v30);
  if (a4)
  {
    a4->x = v11;
    a4->y = v13;
  }
  if (a5)
    *a5 = v28;
  return v28 || -[UISliderDataModel isTrackEnabled](self->_data, "isTrackEnabled");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGPoint *p_beginPoint;
  id v6;
  CGFloat v7;
  CGFloat v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  id WeakRetained;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v33;
  double v34[2];

  p_beginPoint = &self->_beginPoint;
  v6 = a3;
  objc_msgSend(v6, "locationInView:", self);
  p_beginPoint->x = v7;
  p_beginPoint->y = v8;
  v34[0] = 0.0;
  v34[1] = 0.0;
  v33 = 0;
  v9 = -[_UISlideriOSVisualElement _shouldBeginTrackingAtPoint:pointInKnob:inKnob:](self, "_shouldBeginTrackingAtPoint:pointInKnob:inKnob:", v34, &v33);
  v10 = objc_msgSend(v6, "_isPointerTouch");

  if (v33)
  {
    if (self->_thumbIsArtworkBased)
      v11 = 440;
    else
      v11 = 512;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v11), "frame");
    self->_hitOffset = round(v19 * 0.5 - v34[0]);
    -[_UISlideriOSVisualElement slider](self, "slider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "minimumValue");
    v22 = v21;
    -[_UISlideriOSVisualElement slider](self, "slider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "maximumValue");
    v25 = ValueForPoint(self, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1, p_beginPoint->x, p_beginPoint->y, p_beginPoint->x, p_beginPoint->y, v22, v24);

    WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    *(float *)&v27 = v25;
    objc_msgSend(WeakRetained, "setValue:animated:", 0, v27);

    -[_UISlideriOSVisualElement slider](self, "slider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_edgeFeedbackGenerator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userInteractionStarted");

    -[_UISlideriOSVisualElement slider](self, "slider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_modulationFeedbackGenerator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateWithCompletionBlock:", 0);

    return 1;
  }
  else if ((-[UISliderDataModel isTrackEnabled](self->_data, "isTrackEnabled") | v10) == 1)
  {
    v12 = objc_loadWeakRetained((id *)&self->_slider);
    -[_UISlideriOSVisualElement slider](self, "slider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minimumValue");
    v15 = v14;
    -[_UISlideriOSVisualElement slider](self, "slider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maximumValue");
    *(float *)&v18 = ValueForPoint(self, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1, p_beginPoint->x, p_beginPoint->y, p_beginPoint->x, p_beginPoint->y, v15, v17);
    v9 = 1;
    objc_msgSend(v12, "setValue:animated:", 1, v18);

    self->_hitOffset = 0.0;
  }
  return v9;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  id WeakRetained;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maximumValue");
  v13 = v12;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumValue");
  v16 = v15;

  v17 = ValueForPoint(self, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1, self->_beginPoint.x, self->_beginPoint.y, v8, v10, v16, v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  *(float *)&v19 = v17;
  objc_msgSend(WeakRetained, "setValue:animated:", 0, v19);

  if (v13 > v16)
  {
    v20 = (float)((float)(v17 - v16) / (float)(v13 - v16));
    -[_UISlideriOSVisualElement slider](self, "slider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_edgeFeedbackGenerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "distance");
    v24 = v23 * v20;

    -[_UISlideriOSVisualElement slider](self, "slider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_edgeFeedbackGenerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "positionUpdated:atLocation:", v24, v8, v10);

    -[_UISlideriOSVisualElement slider](self, "slider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_modulationFeedbackGenerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueUpdated:", v20);

  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isContinuous");

  if (v30)
  {
    v31 = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(v31, "_sendActionsForEvents:withEvent:", 4096, v6);

  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHighlighted:", 1);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTracking:", 0);

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(WeakRetained, "_sendActionsForEvents:withEvent:", 4096, v13);

  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlighted:", 0);

  -[_UISlideriOSVisualElement slider](self, "slider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_edgeFeedbackGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInteractionEnded");

  -[_UISlideriOSVisualElement slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_modulationFeedbackGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deactivate");

}

- (void)_controlTouchBegan:(id)a3 withEvent:(id)a4
{
  void *WeakRetained;
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  -[_UISlideriOSVisualElement slider](self, "slider");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(WeakRetained, "isTracking"))
    goto LABEL_4;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isContinuous");

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(WeakRetained, "_sendActionsForEvents:withEvent:", 4096, v8);
LABEL_4:

  }
}

- (BOOL)cancelTouchTracking
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  id WeakRetained;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTracking");

  if (v4)
    -[_UISlideriOSVisualElement endTrackingWithTouch:withEvent:](self, "endTrackingWithTouch:withEvent:", 0, 0);
  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHighlighted");

  if (v6)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:", 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "_sendActionsForEvents:withEvent:", 256, 0);

  return 1;
}

- (BOOL)isAnimatingValueChange
{
  return *(_BYTE *)&self->_sliderFlags & 1;
}

- (void)showValueDidChange
{
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGRect)valueTextRectForBounds:(CGRect)a3
{
  double width;
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UISliderDataModel showValue](self->_data, "showValue", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v6 = x + width + -23.0;
    +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform");
    v7 = y + floor((v11 + -15.0) * 0.5);
    v8 = 23.0;
    v9 = 15.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v10 = v6;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v10;
  return result;
}

- (void)didSetThumbImageForStates
{
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)didSetMinimumTrackImageForStates
{
  -[_UISlideriOSVisualElement _setSliderNeedsLayout](self, "_setSliderNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)didSetThumbEnabled
{
  void *v3;
  int v4;
  void *v5;
  id *p_thumbView;
  id v7;
  int v8;
  double v9;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isThumbEnabled");

  if ((v4 & 1) != 0)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    p_thumbView = (id *)&self->_thumbView;
    -[UIImageView setHidden:](self->_thumbView, "setHidden:", objc_msgSend(v5, "isEnabled") ^ 1);

  }
  else
  {
    p_thumbView = (id *)&self->_thumbView;
    -[UIImageView setHidden:](self->_thumbView, "setHidden:", 1);
  }
  -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
  if (v4 != -[UISliderDataModel isMinimumTrackVisible](self->_data, "isMinimumTrackVisible"))
  {
    v7 = *p_thumbView;
    v8 = objc_msgSend(*p_thumbView, "isHidden");
    v9 = 1.0;
    if (v8)
      v9 = 0.0;
    objc_msgSend(v7, "setAlpha:", v9);
  }
}

- (void)didChangeMinimumTrackVisibleWithDuration:(double)a3
{
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];

  -[_UISlideriOSVisualElement _layoutSubviewsForBoundsChange:](self, "_layoutSubviewsForBoundsChange:", 0);
  v5 = -[UISliderDataModel isMinimumTrackVisible](self->_data, "isMinimumTrackVisible");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke;
  v8[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  *(double *)&v8[4] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke_2;
  v6[3] = &unk_1E16B1B78;
  v6[4] = self;
  v7 = v5;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", a3 > 0.0, v8, v6, 0);
}

- (UIEdgeInsets)thumbHitEdgeInsets
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v2 = 5;
  if (!self->_thumbIsArtworkBased)
    v2 = 6;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v2]), "bounds");
  v4 = -fmax((48.0 - v3) * 0.5, 0.0);
  v6 = -fmax((48.0 - v5) * 0.5, 0.0);
  v7 = v6;
  v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v4;
  result.top = v6;
  return result;
}

- (id)_minTrackClipView
{
  return self->_minTrackClipView;
}

- (id)_maxTrackClipView
{
  return self->_maxTrackClipView;
}

- (id)maxValueImageView
{
  return self->_maxValueImageView;
}

- (id)minValueImageView
{
  return self->_minValueImageView;
}

- (id)thumbView
{
  return self->_thumbView;
}

- (id)thumbViewNeue
{
  return self->_thumbViewNeue;
}

- (UISliderDataModel)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_slider);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_trackColors, 0);
  objc_storeStrong((id *)&self->_thumbViewNeue, 0);
  objc_storeStrong((id *)&self->_maxTrackClipView, 0);
  objc_storeStrong((id *)&self->_minTrackClipView, 0);
  objc_storeStrong((id *)&self->_maxTrackView, 0);
  objc_storeStrong((id *)&self->_minTrackView, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_maxValueImageView, 0);
  objc_storeStrong((id *)&self->_minValueImageView, 0);
  objc_storeStrong((id *)&self->_innerThumbView, 0);
}

@end
