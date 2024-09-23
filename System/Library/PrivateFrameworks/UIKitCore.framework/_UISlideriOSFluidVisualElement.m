@implementation _UISlideriOSFluidVisualElement

- (_UISlideriOSFluidVisualElement)initWithFrame:(CGRect)a3
{
  _UISlideriOSFluidVisualElement *result;
  uint64_t v4;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISlideriOSFluidVisualElement;
  result = -[_UISlideriOSVisualElement initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_trackTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_trackTransform.c = v5;
    *(_OWORD *)&result->_trackTransform.tx = *(_OWORD *)(v4 + 32);
    result->_changeWithVolumeButtons = 1;
  }
  return result;
}

- (void)setSlider:(id)a3
{
  id v4;
  void *v5;
  _UIFluidSliderInteraction *fluidInteraction;
  objc_super v7;

  v4 = a3;
  if (self->_fluidInteraction)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeInteraction:", self->_fluidInteraction);

    fluidInteraction = self->_fluidInteraction;
    self->_fluidInteraction = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)_UISlideriOSFluidVisualElement;
  -[_UISlideriOSVisualElement setSlider:](&v7, sel_setSlider_, v4);
  if (v4)
    -[_UISlideriOSFluidVisualElement _setupInteraction](self, "_setupInteraction");

}

- (id)_updatedConfigurationForTrackSize:(CGSize)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;

  +[_UIFluidSliderInteractionConfiguration configurationWithTrackSize:](_UIFluidSliderInteractionConfiguration, "configurationWithTrackSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_changeWithVolumeButtons)
    v6 = 3;
  else
    v6 = 1;
  objc_msgSend(v4, "setPreferredInputMethods:", v6);
  -[_UISlideriOSVisualElement data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sliderSpeedMultiplier");
  objc_msgSend(v5, "setVelocityMultiplier:", v8);

  return v5;
}

- (void)_setupInteraction
{
  void *v3;
  _UIFluidSliderInteraction *fluidInteraction;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _UIFluidSliderInteraction *v11;
  _UIFluidSliderInteraction *v12;
  _UIFluidSliderInteraction *v13;
  void *v14;
  _QWORD v15[5];

  if (self->_fluidInteraction)
  {
    -[_UISlideriOSVisualElement slider](self, "slider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeInteraction:", self->_fluidInteraction);

    fluidInteraction = self->_fluidInteraction;
    self->_fluidInteraction = 0;

  }
  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v5, "trackRectForBounds:");
  v7 = v6;
  v9 = v8;

  -[_UISlideriOSFluidVisualElement _updatedConfigurationForTrackSize:](self, "_updatedConfigurationForTrackSize:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [_UIFluidSliderInteraction alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51___UISlideriOSFluidVisualElement__setupInteraction__block_invoke;
  v15[3] = &unk_1E16D8CD8;
  v15[4] = self;
  v12 = -[_UIFluidSliderInteraction initWithConfiguration:handler:](v11, "initWithConfiguration:handler:", v10, v15);
  v13 = self->_fluidInteraction;
  self->_fluidInteraction = v12;

  -[_UIFluidSliderInteraction _setDirectDrivingDelegate:](self->_fluidInteraction, "_setDirectDrivingDelegate:", self);
  -[_UISlideriOSVisualElement slider](self, "slider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addInteraction:", self->_fluidInteraction);

}

- (CGRect)_modifiedTrackRect:(CGRect)a3
{
  CGFloat v3;
  CGFloat v4;
  __int128 v5;
  CGAffineTransform v6;
  CGRect v7;

  v3 = self->_trackBounds.size.width - a3.size.width;
  v4 = self->_trackBounds.size.height - a3.size.height;
  v7.origin.x = a3.origin.x - v3 * 0.5;
  v7.size.width = a3.size.width + v3;
  v7.origin.y = a3.origin.y - v4 * 0.5;
  v7.size.height = a3.size.height + v4;
  v5 = *(_OWORD *)&self->_trackTransform.c;
  *(_OWORD *)&v6.a = *(_OWORD *)&self->_trackTransform.a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&self->_trackTransform.tx;
  return CGRectApplyAffineTransform(v7, &v6);
}

- (void)_updateConfigurationForFrameChange:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  -[_UISlideriOSVisualElement slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v5, "trackRectForBounds:");
  v7 = v6;
  v9 = v8;

  -[_UIFluidSliderInteraction configuration](self->_fluidInteraction, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackSize");
  v12 = v11;
  v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    -[_UISlideriOSFluidVisualElement _updatedConfigurationForTrackSize:](self, "_updatedConfigurationForTrackSize:", v7, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a3)
    {
      -[_UIFluidSliderInteraction setConfiguration:](self->_fluidInteraction, "setConfiguration:", v16);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __69___UISlideriOSFluidVisualElement__updateConfigurationForFrameChange___block_invoke;
      v18[3] = &unk_1E16B1B50;
      v18[4] = self;
      v19 = v16;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);

    }
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISlideriOSFluidVisualElement;
  -[_UISlideriOSVisualElement setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UISlideriOSFluidVisualElement _updateConfigurationForFrameChange:](self, "_updateConfigurationForFrameChange:", +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISlideriOSFluidVisualElement;
  -[_UISlideriOSVisualElement setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UISlideriOSFluidVisualElement _updateConfigurationForFrameChange:](self, "_updateConfigurationForFrameChange:", +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));
}

- (void)setChangeWithVolumeButtons:(BOOL)a3
{
  if (self->_changeWithVolumeButtons != a3)
  {
    self->_changeWithVolumeButtons = a3;
    -[_UISlideriOSFluidVisualElement _setupInteraction](self, "_setupInteraction");
  }
}

- (void)didSetEnabled
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISlideriOSFluidVisualElement;
  -[_UISlideriOSVisualElement didSetEnabled](&v5, sel_didSetEnabled);
  -[_UISlideriOSVisualElement data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEnabled") & 1) != 0)
  {
    -[_UISlideriOSVisualElement data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_fluidInteraction, "setUserInteractionEnabled:", objc_msgSend(v4, "isUserInteractionEnabled"));

  }
  else
  {
    -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_fluidInteraction, "setUserInteractionEnabled:", 0);
  }

}

- (void)didSetUserInteractionEnabled
{
  void *v3;
  id v4;

  -[_UISlideriOSVisualElement data](self, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
  {
    -[_UISlideriOSVisualElement data](self, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_fluidInteraction, "setUserInteractionEnabled:", objc_msgSend(v3, "isUserInteractionEnabled"));

  }
  else
  {
    -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_fluidInteraction, "setUserInteractionEnabled:", 0);
  }

}

- (unint64_t)fluidUpdateSource
{
  return self->_fluidUpdateSource;
}

- (BOOL)driver:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double x;
  void *v6;
  int v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGRect v18;
  CGRect v19;

  x = a4.x;
  -[_UISlideriOSVisualElement data](self, "data", a3, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFluidTrackHidden");

  if (!v7)
    return 1;
  -[_UISlideriOSVisualElement slider](self, "slider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v8, "trackRectForBounds:");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v18.origin.x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  if (x < CGRectGetMinX(v18))
    return 1;
  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  return x < CGRectGetMinX(v19);
}

- (BOOL)driver:(id)a3 shouldAdjustValueForProposedValue:(double)a4 adjustedValue:(double *)a5 startValue:(double *)a6 endValue:(double *)a7
{
  int v7;
  void *v12;
  void *v13;
  double v14;
  float v16;
  uint64_t v17;

  if (self && (*(_BYTE *)&self->super._sliderFlags & 8) != 0)
  {
    -[_UISlideriOSVisualElement slider](self, "slider", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_sliderConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    *(float *)&v14 = a4;
    v16 = 0.0;
    v7 = objc_msgSend(v13, "adjustPositionForTargetPosition:adjustedPosition:startPosition:endPosition:", (char *)&v17 + 4, &v17, &v16, v14);
    if (v7)
    {
      if (a5)
        *a5 = *((float *)&v17 + 1);
      if (a6)
        *a6 = *(float *)&v17;
      if (a7)
        *a7 = v16;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)didSetFluidTrackHidden
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  id v15;

  -[_UISlideriOSVisualElement data](self, "data");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[_UISlideriOSVisualElement data](self, "data"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isFluidTrackHidden"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = 0;
    v8 = 0.0;
  }
  else
  {
    v8 = 1.0;
    v7 = 1;
  }
  -[_UISlideriOSVisualElement _minTrackClipView](self, "_minTrackClipView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  -[_UISlideriOSVisualElement _maxTrackClipView](self, "_maxTrackClipView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v8);

  -[_UISlideriOSVisualElement slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "_isThumbEnabled"))
  {
    -[_UISlideriOSVisualElement data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isMinimumTrackVisible");

  }
  else
  {
    v13 = 0;
  }

  if ((v7 & v13) != 0)
    v14 = 1.0;
  else
    v14 = 0.0;
  -[_UISlideriOSVisualElement thumbView](self, "thumbView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", v14);

}

- (void)didSetSpeedMultiplier
{
  void *v3;
  float v4;
  void *v5;
  id v6;

  -[_UIFluidSliderInteraction configuration](self->_fluidInteraction, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISlideriOSVisualElement data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sliderSpeedMultiplier");
  v5 = (void *)objc_msgSend(v6, "copyWithVelocityMultiplier:", v4);
  -[_UIFluidSliderInteraction setConfiguration:](self->_fluidInteraction, "setConfiguration:", v5);

}

- (void)_setValue:(float)a3 minimum:(float)a4 maximum:(float)a5 animated:(BOOL)a6
{
  double v6;
  _QWORD v7[6];

  v6 = (float)((float)(a3 - a4) / (float)(a5 - a4));
  if (a6)
  {
    -[_UIFluidSliderInteraction setValue:](self->_fluidInteraction, "setValue:", v6);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69___UISlideriOSFluidVisualElement__setValue_minimum_maximum_animated___block_invoke;
    v7[3] = &unk_1E16B1888;
    v7[4] = self;
    *(double *)&v7[5] = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
  }
}

- (void)_updateModelValue:(double)a3 sendAction:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  double v18;
  id v19;

  v4 = a4;
  -[_UISlideriOSVisualElement data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumValue");
  v9 = v8;

  -[_UISlideriOSVisualElement data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maximumValue");
  v12 = v11 - v9;

  v13 = v12 * a3 + v9;
  -[_UISlideriOSVisualElement data](self, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v16 = v15;

  if (v16 != v13)
  {
    -[_UISlideriOSVisualElement data](self, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v18 = v13;
    objc_msgSend(v17, "setValue:", v18);

    if ((self->_fluidUpdateSource & 7) != 0)
      -[_UISlideriOSVisualElement _bounceMinMaxValueImageViewsIfNeeded](self, "_bounceMinMaxValueImageViewsIfNeeded");
    if (v4)
    {
      -[_UISlideriOSVisualElement slider](self, "slider");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendActionsForControlEvents:", 4096);

    }
  }
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  int v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v4 = a4;
  -[_UISlideriOSVisualElement data](self, "data");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumValue");
  v8 = v7;
  -[_UISlideriOSVisualElement data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximumValue");
  LODWORD(v11) = v10;
  *(float *)&v12 = a3;
  LODWORD(v13) = v8;
  -[_UISlideriOSFluidVisualElement _setValue:minimum:maximum:animated:](self, "_setValue:minimum:maximum:animated:", v4, v12, v13, v11);

}

- (void)didSetValues
{
  int v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[_UISlideriOSVisualElement data](self, "data");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v4 = v3;
  -[_UISlideriOSVisualElement data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = v6;
  -[_UISlideriOSVisualElement data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  LODWORD(v10) = v9;
  LODWORD(v11) = v4;
  LODWORD(v12) = v7;
  -[_UISlideriOSFluidVisualElement _setValue:minimum:maximum:animated:](self, "_setValue:minimum:maximum:animated:", 0, v11, v12, v10);

}

- (BOOL)overriddenTrackingState
{
  return self->_overriddenTrackingState;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)cancelMouseTracking
{
  return 0;
}

- (BOOL)cancelTouchTracking
{
  return 0;
}

- (BOOL)changeWithVolumeButtons
{
  return self->_changeWithVolumeButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fluidInteraction, 0);
}

@end
