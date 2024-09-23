@implementation UIStepperHorizontalVisualElement

- (UIStepperHorizontalVisualElement)initWithFrame:(CGRect)a3
{
  UIStepperHorizontalVisualElement *v3;
  UIStepperHorizontalVisualElement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStepperHorizontalVisualElement;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIStepperHorizontalVisualElement _commonStepperInit](v3, "_commonStepperInit");
    -[UIStepperHorizontalVisualElement _updateButtonEnabled](v4, "_updateButtonEnabled");
  }
  return v4;
}

- (void)setValue:(double)minimumValue
{
  id v4;

  if (self->_minimumValue > minimumValue)
    minimumValue = self->_minimumValue;
  if (minimumValue >= self->_maximumValue)
    minimumValue = self->_maximumValue;
  if (minimumValue != self->_value)
  {
    self->_value = minimumValue;
    -[UIStepperHorizontalVisualElement _updateButtonEnabled](self, "_updateButtonEnabled");
    -[UIStepperHorizontalVisualElement stepperControl](self, "stepperControl");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualElementDidSetValue:", self);

  }
}

- (void)setMinimumValue:(double)a3
{
  double value;

  if (self->_minimumValue != a3)
  {
    if (self->_maximumValue < a3)
      -[UIStepperHorizontalVisualElement setMaximumValue:](self, "setMaximumValue:", a3);
    self->_minimumValue = a3;
    value = self->_value;
    if (value < a3)
      value = a3;
    -[UIStepperHorizontalVisualElement setValue:](self, "setValue:", value);
    -[UIStepperHorizontalVisualElement _updateButtonEnabled](self, "_updateButtonEnabled");
  }
}

- (void)setMaximumValue:(double)a3
{
  double value;

  if (self->_maximumValue != a3)
  {
    if (self->_minimumValue > a3)
      -[UIStepperHorizontalVisualElement setMinimumValue:](self, "setMinimumValue:", a3);
    self->_maximumValue = a3;
    value = self->_value;
    if (value >= a3)
      value = a3;
    -[UIStepperHorizontalVisualElement setValue:](self, "setValue:", value);
    -[UIStepperHorizontalVisualElement _updateButtonEnabled](self, "_updateButtonEnabled");
  }
}

- (void)setStepValue:(double)a3
{
  if (self->_stepValue != a3)
  {
    if (a3 <= 0.0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("stepValue must be greater than 0"));
    self->_stepValue = a3;
  }
}

- (void)setEnabled:(BOOL)a3
{
  double v5;
  double v6;
  double v7;

  if (-[UIStepperHorizontalVisualElement isEnabled](self, "isEnabled") != a3)
  {
    self->_enabled = a3;
    -[UIStepperHorizontalVisualElement _updateButtonEnabled](self, "_updateButtonEnabled");
    v5 = 1.0;
    if (a3 || (-[UIView alpha](self, "alpha", 1.0), v7 = v6, v5 = 0.5, v7 > 0.5))
      -[UIView setAlpha:](self, "setAlpha:", v5);
  }
}

+ (CGSize)initialSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
  v3 = v2;
  v4 = 94.0;
  result.height = v3;
  result.width = v4;
  return result;
}

+ (UIEdgeInsets)initialAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[UIButton backgroundImageForState:](self->_plusButton, "backgroundImageForState:", 0, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  -[UIButton backgroundImageForState:](self->_minusButton, "backgroundImageForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;

  v12 = fmax(v6 + v11, 94.0);
  +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
  if (v13 >= v8)
    v14 = v13;
  else
    v14 = v8;
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)setWraps:(BOOL)a3
{
  self->_wraps = a3;
  -[UIStepperHorizontalVisualElement _updateButtonEnabled](self, "_updateButtonEnabled");
}

- (void)_commonStepperInit
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *dividerImages;
  UIImageView *v6;
  UIImageView *middleView;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *minusButton;
  id v13;

  if (dyld_program_sdk_at_least())
  {
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _cornerRadiusForTraitCollection:size:](UISegmentedControl, "_cornerRadiusForTraitCollection:size:", v3, 0);
    -[UIView _setCornerRadius:](self, "_setCornerRadius:");

  }
  self->_isRtoL = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  dividerImages = self->_dividerImages;
  self->_dividerImages = v4;

  v6 = objc_alloc_init(UIImageView);
  middleView = self->_middleView;
  self->_middleView = v6;

  -[UIView addSubview:](self, "addSubview:", self->_middleView);
  +[UIButton buttonWithType:](_UIStepperButton, "buttonWithType:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeft:", 1);
  objc_msgSend(v13, "setAdjustsImageWhenHighlighted:", 0);
  -[UIView addSubview:](self, "addSubview:", v13);
  +[UIButton buttonWithType:](_UIStepperButton, "buttonWithType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeft:", 0);
  objc_msgSend(v8, "setAdjustsImageWhenHighlighted:", 0);
  -[UIView addSubview:](self, "addSubview:", v8);
  if (self->_isRtoL)
    v9 = v13;
  else
    v9 = v8;
  if (self->_isRtoL)
    v10 = v8;
  else
    v10 = v13;
  objc_storeStrong((id *)&self->_plusButton, v9);
  v11 = v10;
  minusButton = self->_minusButton;
  self->_minusButton = v11;

  -[UIStepperHorizontalVisualElement setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 0);
  -[UIStepperHorizontalVisualElement setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 2);
  -[UIStepperHorizontalVisualElement setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 3);
  -[UIStepperHorizontalVisualElement setBackgroundImage:forState:](self, "setBackgroundImage:forState:", 0, 1);
  -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  -[UIStepperHorizontalVisualElement setDividerImage:forLeftSegmentState:rightSegmentState:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:", 0, 0, 0);
  -[UIStepperHorizontalVisualElement setDividerImage:forLeftSegmentState:rightSegmentState:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:", 0, 1, 0);
  -[UIStepperHorizontalVisualElement setDividerImage:forLeftSegmentState:rightSegmentState:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:", 0, 0, 1);
  -[UIStepperHorizontalVisualElement setIncrementImage:forState:](self, "setIncrementImage:forState:", 0, 0);
  -[UIStepperHorizontalVisualElement setDecrementImage:forState:](self, "setDecrementImage:forState:", 0, 0);

}

- (void)_updateButtonEnabled
{
  UIButton *plusButton;
  _BOOL8 v4;
  _BOOL8 v5;

  plusButton = self->_plusButton;
  v4 = self->_wraps || self->_value < self->_maximumValue;
  -[UIButton setEnabled:](plusButton, "setEnabled:", v4);
  v5 = self->_wraps || self->_value > self->_minimumValue;
  -[UIButton setEnabled:](self->_minusButton, "setEnabled:", v5);
  if (!-[UIControl isEnabled](self->_plusButton, "isEnabled"))
    -[UIButton setHighlighted:](self->_plusButton, "setHighlighted:", 0);
  if (!-[UIControl isEnabled](self->_minusButton, "isEnabled"))
    -[UIButton setHighlighted:](self->_minusButton, "setHighlighted:", 0);
  -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
}

- (void)_updateHighlightingAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double x;
  double MidX;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  UIButton *minusButton;
  _BOOL8 v11;
  CGRect v12;

  x = a3.x;
  if (-[UIStepperHorizontalVisualElement pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", a4, a3.x, a3.y))
  {
    -[UIView bounds](self, "bounds");
    MidX = CGRectGetMidX(v12);
    v7 = x < MidX;
    v8 = x >= MidX;
    if (self->_isRtoL)
      v9 = x < MidX;
    else
      v9 = x >= MidX;
    -[UIButton setHighlighted:](self->_plusButton, "setHighlighted:", v9);
    minusButton = self->_minusButton;
    if (self->_isRtoL)
      v11 = v8;
    else
      v11 = v7;
  }
  else
  {
    -[UIButton setHighlighted:](self->_minusButton, "setHighlighted:", 0);
    minusButton = self->_plusButton;
    v11 = 0;
  }
  -[UIButton setHighlighted:](minusButton, "setHighlighted:", v11);
  -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStepperHorizontalVisualElement;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  if (dyld_program_sdk_at_least())
  {
    -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
    -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
  }
}

+ (id)_highlightSizeAnimation
{
  UISpringTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UISpringTimingParameters initWithDampingRatio:response:]([UISpringTimingParameters alloc], "initWithDampingRatio:response:", 1.0, 0.28);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.0);

  return v3;
}

+ (id)_highlightOpacityAnimation
{
  UISpringTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UISpringTimingParameters initWithDampingRatio:response:]([UISpringTimingParameters alloc], "initWithDampingRatio:response:", 2.0, 0.12);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.0);
  -[UIViewPropertyAnimator setInterruptible:](v3, "setInterruptible:", 0);

  return v3;
}

- (CGRect)_leftHighlightFrame
{
  uint64_t v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = 4;
  if (!self->_isRtoL)
    v2 = 5;
  v3 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v2]));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10 + 1.0;

  v12 = v5;
  v13 = v7;
  v14 = v11;
  v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_leftHighlightInsetFrame
{
  CGRect v2;

  -[UIStepperHorizontalVisualElement _leftHighlightFrame](self, "_leftHighlightFrame");
  return CGRectInset(v2, 4.0, 4.0);
}

- (CGRect)_rightHighlightFrame
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v2 = 4;
  if (self->_isRtoL)
    v3 = 4;
  else
    v3 = 5;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v3]);
  if (self->_isRtoL)
    v2 = 5;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v2]);
  v6 = v4;
  objc_msgSend(v5, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11 + -1.0;
  v14 = v13 + 1.0;

  v15 = v12;
  v16 = v8;
  v17 = v14;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_rightHighlightInsetFrame
{
  CGRect v2;

  -[UIStepperHorizontalVisualElement _rightHighlightFrame](self, "_rightHighlightFrame");
  return CGRectInset(v2, 4.0, 4.0);
}

- (id)_alphaAnimator:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v5 = 11;
  if (a3)
    v5 = 10;
  v6 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v5]));
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "isRunning"))
      objc_msgSend(v7, "stopAnimation:", 1);
  }
  else
  {
    +[UIStepperHorizontalVisualElement _highlightOpacityAnimation](UIStepperHorizontalVisualElement, "_highlightOpacityAnimation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v8 = 512;
    else
      v8 = 504;
    objc_storeStrong((id *)((char *)&self->super.super.super.isa + v8), v7);
  }
  return v7;
}

- (void)_updateHighlight:(id)a3 button:(id)a4 onRight:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;

  v5 = a5;
  v8 = a3;
  v9 = objc_msgSend(a4, "state");
  objc_msgSend(v8, "alpha");
  if (v9 == 1)
  {
    if (v10 != 1.0)
    {
      -[UIStepperHorizontalVisualElement _alphaAnimator:](self, "_alphaAnimator:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 13;
      if (v5)
        v12 = 12;
      v13 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                              + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v12]));
      if (v13)
      {
        v14 = v13;
        if (!v5)
          goto LABEL_14;
      }
      else
      {
        +[UIStepperHorizontalVisualElement _highlightSizeAnimation](UIStepperHorizontalVisualElement, "_highlightSizeAnimation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          objc_storeStrong((id *)&self->_leftFrameAnimator, v14);
LABEL_14:
          -[UIStepperHorizontalVisualElement _leftHighlightFrame](self, "_leftHighlightFrame");
          goto LABEL_15;
        }
        objc_storeStrong((id *)&self->_rightFrameAnimator, v14);
      }
      -[UIStepperHorizontalVisualElement _rightHighlightFrame](self, "_rightHighlightFrame");
LABEL_15:
      v21 = v17;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_3;
      v36[3] = &unk_1E16B1B28;
      v26 = v8;
      v37 = v26;
      objc_msgSend(v11, "addAnimations:", v36);
      v27 = v25;
      v28 = 3221225472;
      v29 = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_4;
      v30 = &unk_1E16B20D8;
      v31 = v26;
      v32 = v21;
      v33 = v22;
      v34 = v23;
      v35 = v24;
      objc_msgSend(v14, "addAnimations:", &v27);
      objc_msgSend(v11, "startAnimation", v27, v28, v29, v30);
      objc_msgSend(v14, "startAnimation");

      goto LABEL_16;
    }
  }
  else if (v10 != 0.0)
  {
    -[UIStepperHorizontalVisualElement _alphaAnimator:](self, "_alphaAnimator:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke;
    v41[3] = &unk_1E16B1B28;
    v16 = v8;
    v42 = v16;
    objc_msgSend(v11, "addAnimations:delayFactor:", v41, 0.566969897);
    v38[0] = v15;
    v38[1] = 3221225472;
    v38[2] = __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_2;
    v38[3] = &unk_1E16C2A08;
    v40 = v5;
    v38[4] = self;
    v39 = v16;
    objc_msgSend(v11, "addCompletion:", v38);
    objc_msgSend(v11, "startAnimation");

    v14 = v42;
LABEL_16:

  }
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  CGRect v9;

  if (!a2)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 48);
    v4 = *(void **)(result + 32);
    if (v3)
      objc_msgSend(v4, "_rightHighlightFrame");
    else
      objc_msgSend(v4, "_leftHighlightFrame");
    v9 = CGRectInset(*(CGRect *)&v5, 4.0, 4.0);
    return objc_msgSend(*(id *)(v2 + 40), "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  }
  return result;
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __68__UIStepperHorizontalVisualElement__updateHighlight_button_onRight___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateButton:(id)a3 backgroundView:(id)a4 highlightView:(id)a5 backgroundImage:(id)a6 highlightImage:(id)a7 onRight:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  UIImageView *v14;
  UIImageView *v15;
  id v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  UIStepperHorizontalVisualElement *v30;
  UIImageView *v31;
  UIImageView *v32;
  UIImageView *v33;
  int *v34;
  uint64_t v35;
  _QWORD v37[4];
  id v38;
  BOOL v39;

  v8 = a8;
  v13 = a3;
  v14 = (UIImageView *)a4;
  v15 = (UIImageView *)a5;
  v16 = a6;
  if (v8)
    v17 = CFSTR("right");
  else
    v17 = CFSTR("left");
  v18 = a7;
  __UIImageCacheKeyWithSentinel(v16, v19, v20, v21, v22, v23, v24, v25, v17, (uint64_t)CFSTR("__UIImageCacheKeySentinel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __118__UIStepperHorizontalVisualElement__updateButton_backgroundView_highlightView_backgroundImage_highlightImage_onRight___block_invoke;
  v37[3] = &unk_1E16E8430;
  v27 = v16;
  v38 = v27;
  v39 = v8;
  +[UIImage _cachedImageForKey:fromBlock:](UIImage, "_cachedImageForKey:fromBlock:", v26, v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIImageView setImage:](v14, "setImage:", v28);
    -[UIImageView setImage:](v15, "setImage:", v18);
    v29 = v13;
    v30 = self;
  }
  else
  {
    v31 = [UIImageView alloc];
    v29 = v13;
    objc_msgSend(v13, "frame");
    v14 = -[UIImageView initWithFrame:](v31, "initWithFrame:");
    -[UIImageView setImage:](v14, "setImage:", v28);
    v32 = [UIImageView alloc];
    objc_msgSend(v13, "frame");
    v33 = -[UIImageView initWithFrame:](v32, "initWithFrame:");

    -[UIImageView setImage:](v33, "setImage:", v18);
    -[UIView setAlpha:](v33, "setAlpha:", 0.0);
    v30 = self;
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v14, 0);
    -[UIView insertSubview:aboveSubview:](v30, "insertSubview:aboveSubview:", v33, v30->_middleView);
    if (v8)
      v34 = &OBJC_IVAR___UIStepperHorizontalVisualElement__rightBackground;
    else
      v34 = &OBJC_IVAR___UIStepperHorizontalVisualElement__leftBackground;
    objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v34), v14);
    v35 = v34[1];
    v15 = v33;
    v18 = *(Class *)((char *)&self->super.super.super.isa + v35);
    *(Class *)((char *)&self->super.super.super.isa + v35) = (Class)v15;
  }

  -[UIStepperHorizontalVisualElement _updateHighlight:button:onRight:](v30, "_updateHighlight:button:onRight:", v15, v29, v8);
}

id __118__UIStepperHorizontalVisualElement__updateButton_backgroundView_highlightView_backgroundImage_highlightImage_onRight___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    v3 = 14;
  else
    v3 = 11;
  objc_msgSend(v2, "_resizableImageWithCapMask:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", objc_msgSend(*(id *)(a1 + 32), "renderingMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateBackgroundForButtonState
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  if (dyld_program_sdk_at_least())
  {
    if (self->_isRtoL)
      v3 = 4;
    else
      v3 = 5;
    v17 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v3]));
    if (self->_isRtoL)
      v4 = 5;
    else
      v4 = 4;
    v5 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v4]));
    objc_msgSend(v17, "backgroundImageForState:", objc_msgSend(v17, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "backgroundImageForState:", objc_msgSend(v5, "state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      -[UIView removeFromSuperview](self->_leftBackground, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_leftHighlight, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_rightBackground, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_rightHighlight, "removeFromSuperview");
    }
    +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
    v10 = v9;
    -[UIView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](UISegmentedControl, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, 0, v11, 0, 0, 94.0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
    v14 = v13;
    -[UIView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](UISegmentedControl, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, 1, v15, 0, 0, 94.0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIView removeFromSuperview](self->_leftBackground, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_leftHighlight, "removeFromSuperview");
    }
    else
    {
      -[UIStepperHorizontalVisualElement _updateButton:backgroundView:highlightView:backgroundImage:highlightImage:onRight:](self, "_updateButton:backgroundView:highlightView:backgroundImage:highlightImage:onRight:", v17, self->_leftBackground, self->_leftHighlight, v12, v16, 0);
    }
    if (v7)
    {
      -[UIView removeFromSuperview](self->_rightBackground, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_rightHighlight, "removeFromSuperview");
    }
    else
    {
      -[UIStepperHorizontalVisualElement _updateButton:backgroundView:highlightView:backgroundImage:highlightImage:onRight:](self, "_updateButton:backgroundView:highlightView:backgroundImage:highlightImage:onRight:", v5, self->_rightBackground, self->_rightHighlight, v12, v16, 1);
    }

  }
}

- (void)_updateDividerImageForButtonState
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  id v14;

  if (self->_isRtoL)
    v3 = 4;
  else
    v3 = 5;
  v14 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v3]));
  if (self->_isRtoL)
    v4 = 5;
  else
    v4 = 4;
  v5 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v4]));
  -[UIView subviews](self->_middleView, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();

  -[UIStepperHorizontalVisualElement dividerImageForLeftSegmentState:rightSegmentState:](self, "dividerImageForLeftSegmentState:rightSegmentState:", objc_msgSend(v14, "state"), objc_msgSend(v5, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v7)
      -[UIView removeFromSuperview](v7, "removeFromSuperview");
    -[UIImageView setImage:](self->_middleView, "setImage:", v8);
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _modernDividerImageBackground:traitCollection:tintColor:size:](UISegmentedControl, "_modernDividerImageBackground:traitCollection:tintColor:size:", 1, v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _modernDividerImageBackground:traitCollection:tintColor:size:](UISegmentedControl, "_modernDividerImageBackground:traitCollection:tintColor:size:", 0, v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_middleView, "setImage:", v10);
    if (v7)
    {
      -[UIImageView setImage:](v7, "setImage:", v12);
    }
    else
    {
      v13 = [UIImageView alloc];
      -[UIView bounds](self->_middleView, "bounds");
      v7 = -[UIImageView initWithFrame:](v13, "initWithFrame:");
      -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
      -[UIImageView setImage:](v7, "setImage:", v12);
      -[UIView insertSubview:atIndex:](self->_middleView, "insertSubview:atIndex:", v7, 0);
    }

  }
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  BOOL v30;
  CGPoint v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIView _touchInsets](self, "_touchInsets");
  v17 = v9 + v16;
  v19 = v11 + v18;
  v21 = v13 - (v16 + v20);
  v23 = v15 - (v18 + v22);
  v24 = _UIControlMostlyInsideEdgeInsets();
  v25 = v19 + v24;
  v28 = v21 - (v26 + v27);
  v33.size.height = v23 - (v24 + v29);
  v33.origin.x = v17 + v26;
  v33.origin.y = v25;
  v33.size.width = v28;
  v32.x = x;
  v32.y = y;
  v30 = CGRectContainsPoint(v33, v32) || -[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y);

  return v30;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIStepperHorizontalVisualElement *v4;
  uint64_t v5;
  void *v6;
  UIStepperHorizontalVisualElement *v7;
  objc_super v9;

  v4 = self;
  v9.receiver = self;
  v9.super_class = (Class)UIStepperHorizontalVisualElement;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((UIButton *)v5 != v4->_plusButton && (UIButton *)v5 != v4->_minusButton)
    v4 = (UIStepperHorizontalVisualElement *)v5;
  v7 = v4;

  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a4;
  v7 = a3;
  -[UIStepperHorizontalVisualElement _startTimer](self, "_startTimer");
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;

  -[UIStepperHorizontalVisualElement _updateHighlightingAtPoint:withEvent:](self, "_updateHighlightingAtPoint:withEvent:", v6, v9, v11);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  -[UIStepperHorizontalVisualElement _updateHighlightingAtPoint:withEvent:](self, "_updateHighlightingAtPoint:withEvent:", v6);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[UIStepperHorizontalVisualElement _updateCount:](self, "_updateCount:", self, a4);
  -[UIButton setHighlighted:](self->_plusButton, "setHighlighted:", 0);
  -[UIButton setHighlighted:](self->_minusButton, "setHighlighted:", 0);
  -[UIStepperHorizontalVisualElement _stopTimer](self, "_stopTimer");
  -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
}

- (void)cancelTrackingWithEvent:(id)a3
{
  -[UIButton setHighlighted:](self->_plusButton, "setHighlighted:", 0);
  -[UIButton setHighlighted:](self->_minusButton, "setHighlighted:", 0);
  -[UIStepperHorizontalVisualElement _stopTimer](self, "_stopTimer");
  -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
}

- (UIEdgeInsets)alignmentRectInsetsForControl:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  v7.receiver = self;
  v7.super_class = (Class)UIStepperHorizontalVisualElement;
  -[UIView alignmentRectInsets](&v7, sel_alignmentRectInsets, a3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_startTimer
{
  NSTimer *v3;
  NSTimer *repeatTimer;

  if (self->_autorepeat)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateCount_, 0, 1, 0.5);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    repeatTimer = self->_repeatTimer;
    self->_repeatTimer = v3;

  }
  self->_repeatCount = 0;
}

- (void)_stopTimer
{
  NSTimer *repeatTimer;

  -[NSTimer invalidate](self->_repeatTimer, "invalidate");
  repeatTimer = self->_repeatTimer;
  self->_repeatTimer = 0;

}

- (void)_updateCount:(id)a3
{
  NSTimer *repeatTimer;
  _BOOL4 v6;
  _BOOL4 v7;
  int64_t repeatCount;
  int v9;
  double stepValue;
  double maximumValue;
  void *v12;
  int64_t v13;
  double v14;
  NSTimer *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  id v19;

  repeatTimer = self->_repeatTimer;
  if (-[UIControl isHighlighted](self->_plusButton, "isHighlighted"))
    v6 = -[UIControl isEnabled](self->_plusButton, "isEnabled");
  else
    v6 = 0;
  if (-[UIControl isHighlighted](self->_minusButton, "isHighlighted"))
    v7 = -[UIControl isEnabled](self->_minusButton, "isEnabled");
  else
    v7 = 0;
  if (repeatTimer == a3)
  {
    if (!v6 && !v7)
      goto LABEL_29;
  }
  else
  {
    repeatCount = self->_repeatCount;
    v9 = v6 || v7;
    if (repeatCount || (v9 & 1) == 0)
    {
      if (v9)
      {
        self->_repeatCount = repeatCount + 1;
LABEL_28:
        v17 = 1;
        goto LABEL_31;
      }
      goto LABEL_29;
    }
  }
  stepValue = self->_stepValue;
  if (!v6)
    stepValue = -stepValue;
  maximumValue = self->_value + stepValue;
  if (self->_wraps)
  {
    if (maximumValue <= self->_maximumValue)
    {
      if (maximumValue < self->_minimumValue)
        maximumValue = self->_maximumValue;
    }
    else
    {
      maximumValue = self->_minimumValue;
    }
  }
  -[UIStepperHorizontalVisualElement setValue:](self, "setValue:", maximumValue);
  if (self->_continuous)
  {
    -[UIStepperHorizontalVisualElement stepperControl](self, "stepperControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visualElementSendValueChangedEvent:", self);

  }
  if (v6 || v7)
  {
    v13 = self->_repeatCount;
    self->_repeatCount = v13 + 1;
    if (repeatTimer == a3)
    {
      v14 = dbl_186684C50[v13 > 18];
      if (v13 <= 3)
        v14 = 0.5;
      v15 = self->_repeatTimer;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTimer setFireDate:](v15, "setFireDate:", v16);

    }
    goto LABEL_28;
  }
LABEL_29:
  v17 = 0;
  if (self->_repeatCount >= 1)
    self->_repeatCount = 1;
LABEL_31:
  v18 = -[UIStepperHorizontalVisualElement isContinuous](self, "isContinuous");
  if (v17 && !v18 && repeatTimer != a3)
  {
    -[UIStepperHorizontalVisualElement stepperControl](self, "stepperControl");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "visualElementSendValueChangedEvent:", self);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  CGPoint v26;
  CGRect v27;

  v6 = a4;
  if (dyld_program_sdk_at_least())
  {
    if (self->_isRtoL)
      v7 = 4;
    else
      v7 = 5;
    v8 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v7]));
    if (self->_isRtoL)
      v9 = 5;
    else
      v9 = 4;
    v10 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v9]));
    objc_msgSend(v8, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v6, "location");
    v26.x = v19;
    v26.y = v20;
    v27.origin.x = v12;
    v27.origin.y = v14;
    v27.size.width = v16;
    v27.size.height = v18;
    if (CGRectContainsPoint(v27, v26))
    {
      objc_msgSend(v8, "backgroundImageForState:", objc_msgSend(v8, "state"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21 && objc_msgSend(v8, "isEnabled"))
      {
        objc_msgSend(v8, "frame");
        v22 = CFSTR("UIStepperLeftPointerRegion");
LABEL_16:
        +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(v10, "backgroundImageForState:", objc_msgSend(v10, "state"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24 && objc_msgSend(v10, "isEnabled"))
      {
        objc_msgSend(v10, "frame");
        v22 = CFSTR("UIStepperRightPointerRegion");
        goto LABEL_16;
      }
    }
    v23 = 0;
    goto LABEL_18;
  }
  v23 = 0;
LABEL_19:

  return v23;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  UITargetedPreview *v16;
  void *v17;
  void *v18;

  if (self->_isRtoL)
    v6 = 4;
  else
    v6 = 5;
  v7 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v6]));
  if (self->_isRtoL)
    v8 = 5;
  else
    v8 = 4;
  v9 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v8]));
  objc_msgSend(a4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("UIStepperLeftPointerRegion"));

  if (v11)
    v12 = v7;
  else
    v12 = v9;
  v13 = v12;
  -[UIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UISegmentedControl _cornerRadiusForTraitCollection:size:](UISegmentedControl, "_cornerRadiusForTraitCollection:size:", v14, 0);

  objc_msgSend(v13, "frame");
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v13);
  +[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  -[UIView subviews](self->_middleView, "subviews", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__UIStepperHorizontalVisualElement_pointerInteraction_willEnterRegion_animator___block_invoke;
    v7[3] = &unk_1E16B1B28;
    v8 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327716, v7, 0, 0.41, 0.0);

  }
}

uint64_t __80__UIStepperHorizontalVisualElement_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  -[UIView subviews](self->_middleView, "subviews", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__UIStepperHorizontalVisualElement_pointerInteraction_willExitRegion_animator___block_invoke;
    v7[3] = &unk_1E16B1B28;
    v8 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327716, v7, 0, 0.41, 0.0);

  }
}

uint64_t __79__UIStepperHorizontalVisualElement_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)layoutSubviews
{
  _BOOL4 isRtoL;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSMutableDictionary *dividerImages;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  isRtoL = self->_isRtoL;
  if (isRtoL != -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v4 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    self->_isRtoL = v4;
    if (v4)
      v5 = 4;
    else
      v5 = 5;
    if (v4)
      v6 = 5;
    else
      v6 = 4;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v5]), "setLeft:", 1);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v6]), "setLeft:", 0);
  }
  if (self->_isRtoL)
    v7 = 4;
  else
    v7 = 5;
  v40 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v7]));
  if (self->_isRtoL)
    v8 = 5;
  else
    v8 = 4;
  v9 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v8]));
  dividerImages = self->_dividerImages;
  _UIStepperDividerKey(0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dividerImages, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "size");
    v14 = v13;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _dividerWidthForTraitCollection:size:](UISegmentedControl, "_dividerWidthForTraitCollection:size:", v15, 0);
    v14 = v16;

  }
  -[UIView size](self, "size");
  -[UIStepperHorizontalVisualElement sizeThatFits:](self, "sizeThatFits:");
  v18 = v17;
  v20 = v19;
  v21 = (v17 - v14) * 0.5;
  objc_msgSend(v40, "setFrame:", 0.0, 0.0, v21, v19);
  objc_msgSend(v9, "setFrame:", v14 + v21, 0.0, v18 - v21 - v14, v20);
  if (dyld_program_sdk_at_least())
  {
    -[UIImageView setFrame:](self->_leftBackground, "setFrame:", 0.0, 0.0, v21, v20);
    -[UIView alpha](self->_leftHighlight, "alpha");
    if (v22 == 0.0)
      -[UIStepperHorizontalVisualElement _leftHighlightInsetFrame](self, "_leftHighlightInsetFrame");
    else
      -[UIStepperHorizontalVisualElement _leftHighlightFrame](self, "_leftHighlightFrame");
    v38 = v24;
    v39 = v23;
    v27 = v25;
    v28 = v26;
    if (-[UIViewPropertyAnimator state](self->_leftAlphaAnimator, "state") != 1)
    {
      -[UIView frame](self->_leftHighlight, "frame");
      v43.origin.y = v38;
      v43.origin.x = v39;
      v43.size.width = v27;
      v43.size.height = v28;
      if (!CGRectEqualToRect(v41, v43))
        -[UIImageView setFrame:](self->_leftHighlight, "setFrame:", v39, v38, v27, v28);
    }
    -[UIImageView setFrame:](self->_rightBackground, "setFrame:", v14 + v21, 0.0, v18 - v21 - v14, v20);
    -[UIView alpha](self->_rightHighlight, "alpha");
    if (v29 == 0.0)
      -[UIStepperHorizontalVisualElement _rightHighlightInsetFrame](self, "_rightHighlightInsetFrame");
    else
      -[UIStepperHorizontalVisualElement _rightHighlightFrame](self, "_rightHighlightFrame");
    v34 = v30;
    v35 = v31;
    v36 = v32;
    v37 = v33;
    if (-[UIViewPropertyAnimator state](self->_rightAlphaAnimator, "state") != 1)
    {
      -[UIView frame](self->_rightHighlight, "frame");
      v44.origin.x = v34;
      v44.origin.y = v35;
      v44.size.width = v36;
      v44.size.height = v37;
      if (!CGRectEqualToRect(v42, v44))
        -[UIImageView setFrame:](self->_rightHighlight, "setFrame:", v34, v35, v36, v37);
    }
  }
  -[UIImageView setFrame:](self->_middleView, "setFrame:", v21, 0.0, v14, v20);
  -[UIView setSize:](self, "setSize:", v18, v20);

}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v6 = a3;
  if (v6)
    goto LABEL_10;
  if ((dyld_program_sdk_at_least() & 1) != 0)
    goto LABEL_3;
  if (a4 - 2 >= 2)
  {
    if (a4 == 1)
    {
      +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
      v13 = v12;
      -[UIView traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v11 = 1;
      goto LABEL_9;
    }
    if (a4)
    {
LABEL_3:
      v6 = 0;
      goto LABEL_10;
    }
  }
  +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
  v8 = v7;
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = 0;
LABEL_9:
  +[UISegmentedControl _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](UISegmentedControl, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, v11, v9, 0, 0, 94.0, v10);
  v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (self->_isRtoL)
    v14 = 4;
  else
    v14 = 5;
  v36 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v14]));
  if (self->_isRtoL)
    v15 = 5;
  else
    v15 = 4;
  v16 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                          + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v15]));
  if (v6)
  {
    if ((objc_msgSend(v6, "_isResizable") & 1) == 0)
    {
      objc_msgSend(v6, "size");
      v18 = v17 * 0.5;
      objc_msgSend(v6, "size");
      v20 = (double)(uint64_t)v18;
      v21 = (double)(uint64_t)(v19 * 0.5 + -1.0);
      objc_msgSend(v6, "size");
      v23 = v22 - v20 + -1.0;
      objc_msgSend(v6, "size");
      objc_msgSend(v6, "resizableImageWithCapInsets:", v20, v21, v23, v24 - v21 + -1.0);
      v25 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v25;
    }
    +[UISegmentedControl _defaultHeight](UISegmentedControl, "_defaultHeight");
    v27 = v26;
    objc_msgSend(v6, "size");
    v29 = v28;
    objc_msgSend(v6, "size");
    if (v27 < v30)
      v27 = v30;
    if (v29 <= 94.0)
      v31 = 47.0;
    else
      v31 = v29 * 0.5;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v31, v27, 0.0);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v31 + v31, v27);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setBackgroundImage:forState:", v33, a4);
    UIGraphicsEndImageContext();
    _UIGraphicsBeginImageContextWithOptions(0, 0, v31, v27, 0.0);
    objc_msgSend(v6, "drawInRect:", -v31, 0.0, v31 + v31, v27);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setBackgroundImage:forState:", v35, a4);
    UIGraphicsEndImageContext();

  }
  else
  {
    objc_msgSend(v36, "setBackgroundImage:forState:", 0, a4);
    objc_msgSend(v16, "setBackgroundImage:forState:", 0, a4);
  }
  if (dyld_program_sdk_at_least())
    -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  if (!a4)
    -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (id)backgroundImageForState:(unint64_t)a3
{
  return -[UIButton backgroundImageForState:](self->_plusButton, "backgroundImageForState:", a3);
}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5
{
  void *v8;
  NSMutableDictionary *dividerImages;
  void *v10;
  id v11;

  v11 = a3;
  if (!v11)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[UIView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UISegmentedControl _modernDividerImageBackground:traitCollection:tintColor:size:](UISegmentedControl, "_modernDividerImageBackground:traitCollection:tintColor:size:", 1, v8, 0, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  dividerImages = self->_dividerImages;
  _UIStepperDividerKey(a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](dividerImages, "setObject:forKeyedSubscript:", v11, v10);

  -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
  if (!(a5 | a4))
    -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4
{
  NSMutableDictionary *dividerImages;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSMutableDictionary *v12;
  void *v13;

  dividerImages = self->_dividerImages;
  _UIStepperDividerKey(a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dividerImages, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if ((a3 & 2) != 0)
      v10 = 0;
    else
      v10 = a3;
    if ((a4 & 2) != 0)
      v11 = 0;
    else
      v11 = a4;
    v12 = self->_dividerImages;
    _UIStepperDividerKey(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)setIncrementImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  UIButton *plusButton;
  void *v8;
  id v9;

  v6 = a3;
  if (v6 || a4)
  {
    v9 = v6;
    if (dyld_program_sdk_at_least())
      -[UIButton setTintColor:](self->_plusButton, "setTintColor:", 0);
  }
  else
  {
    +[UIImage _systemImageNamed:fallback:](UIImage, "_systemImageNamed:fallback:", CFSTR("plus"), CFSTR("UIStepperPlus"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {
      plusButton = self->_plusButton;
      +[UIColor labelColor](UIColor, "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](plusButton, "setTintColor:", v8);

    }
  }
  -[UIButton setImage:forState:](self->_plusButton, "setImage:forState:", v9, a4);

}

- (id)incrementImageForState:(unint64_t)a3
{
  uint64_t v4;
  UIButton *plusButton;
  id v6;
  void *v7;

  v4 = 4;
  if (!self->_isRtoL)
    v4 = 5;
  plusButton = self->_plusButton;
  v6 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___UIStepperHorizontalVisualElement__minimumValue[v4]));
  -[UIButton imageForState:](plusButton, "imageForState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDecrementImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  UIButton *minusButton;
  void *v8;
  id v9;

  v6 = a3;
  if (v6 || a4)
  {
    v9 = v6;
    if (dyld_program_sdk_at_least())
      -[UIButton setTintColor:](self->_minusButton, "setTintColor:", 0);
  }
  else
  {
    +[UIImage _systemImageNamed:fallback:](UIImage, "_systemImageNamed:fallback:", CFSTR("minus"), CFSTR("UIStepperMinus"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {
      minusButton = self->_minusButton;
      +[UIColor labelColor](UIColor, "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](minusButton, "setTintColor:", v8);

    }
  }
  -[UIButton setImage:forState:](self->_minusButton, "setImage:forState:", v9, a4);

}

- (id)decrementImageForState:(unint64_t)a3
{
  return -[UIButton imageForState:](self->_minusButton, "imageForState:", a3);
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStepperHorizontalVisualElement;
  -[UIView setTintColor:](&v4, sel_setTintColor_, a3);
  -[UIStepperHorizontalVisualElement _updateBackgroundForButtonState](self, "_updateBackgroundForButtonState");
  -[UIStepperHorizontalVisualElement _updateDividerImageForButtonState](self, "_updateDividerImageForButtonState");
}

- (double)value
{
  return self->_value;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (BOOL)autorepeat
{
  return self->_autorepeat;
}

- (void)setAutorepeat:(BOOL)a3
{
  self->_autorepeat = a3;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIStepperControl)stepperControl
{
  return (UIStepperControl *)objc_loadWeakRetained((id *)&self->_stepperControl);
}

- (void)setStepperControl:(id)a3
{
  objc_storeWeak((id *)&self->_stepperControl, a3);
}

- (double)stepValue
{
  return self->_stepValue;
}

- (BOOL)wraps
{
  return self->_wraps;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepperControl);
  objc_storeStrong((id *)&self->_rightFrameAnimator, 0);
  objc_storeStrong((id *)&self->_leftFrameAnimator, 0);
  objc_storeStrong((id *)&self->_rightAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_leftAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_dividerImages, 0);
  objc_storeStrong((id *)&self->_repeatTimer, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_middleView, 0);
  objc_storeStrong((id *)&self->_rightHighlight, 0);
  objc_storeStrong((id *)&self->_leftHighlight, 0);
  objc_storeStrong((id *)&self->_rightBackground, 0);
  objc_storeStrong((id *)&self->_leftBackground, 0);
}

@end
