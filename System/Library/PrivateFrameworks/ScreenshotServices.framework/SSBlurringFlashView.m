@implementation SSBlurringFlashView

- (SSBlurringFlashView)initWithFrame:(CGRect)a3
{
  SSBlurringFlashView *v3;
  SSBlurView *v4;
  SSBlurView *blurView;
  _SSSFlashSuperColorView *v6;
  _SSSFlashSuperColorView *superColorView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSBlurringFlashView;
  v3 = -[SSFlashView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(SSBlurView);
  blurView = v3->_blurView;
  v3->_blurView = v4;

  -[SSBlurView setBlurRadius:](v3->_blurView, "setBlurRadius:", 120.0);
  -[SSBlurView setScale:](v3->_blurView, "setScale:", 0.125);
  -[SSBlurringFlashView addSubview:](v3, "addSubview:", v3->_blurView);
  v6 = objc_alloc_init(_SSSFlashSuperColorView);
  superColorView = v3->_superColorView;
  v3->_superColorView = v6;

  -[SSBlurringFlashView addSubview:](v3, "addSubview:", v3->_superColorView);
  -[SSBlurView setHidden:](v3->_blurView, "setHidden:", 1);
  -[_SSSFlashSuperColorView setHidden:](v3->_superColorView, "setHidden:", 1);
  -[SSBlurringFlashView setNeedsLayout](v3, "setNeedsLayout");
  return v3;
}

- (void)layoutSubviews
{
  SSBlurView *blurView;
  _SSSFlashSuperColorView *superColorView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSBlurringFlashView;
  -[SSBlurringFlashView layoutSubviews](&v5, sel_layoutSubviews);
  blurView = self->_blurView;
  -[SSBlurringFlashView bounds](self, "bounds");
  -[SSBlurView setFrame:](blurView, "setFrame:");
  superColorView = self->_superColorView;
  -[SSBlurringFlashView bounds](self, "bounds");
  -[_SSSFlashSuperColorView setFrame:](superColorView, "setFrame:");
  -[_SSSFlashSuperColorView setStyle:](self->_superColorView, "setStyle:", -[SSFlashView style](self, "style"));
}

+ (double)expectedAnimationDurationForStyle:(unint64_t)a3
{
  return dbl_2138AB070[a3 == 2];
}

- (void)flashWithCompletion:(id)a3
{
  id v4;
  void (**completionBlock)(void);
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  SSBlurringFlashView *v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  UIViewPropertyAnimator *superColorViewOpacityAnimator;
  UIViewPropertyAnimator *v21;
  uint64_t v22;
  uint64_t v23;
  UIViewPropertyAnimator *blurViewRadiusAnimator;
  UIViewPropertyAnimator *v25;
  UIViewPropertyAnimator *v26;
  UIViewPropertyAnimator *v27;
  UIViewPropertyAnimator *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[6];

  v4 = a3;
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    v6 = self->_completionBlock;
    self->_completionBlock = 0;

  }
  self->_superColorViewBackgroundColorAnimatorCompleted = 0;
  self->_blurViewRadiusAnimatorCompleted = 0;
  v7 = (void *)objc_msgSend(v4, "copy", v4);
  v8 = self->_completionBlock;
  self->_completionBlock = v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69A0]), "initWithControlPoint1:controlPoint2:", 0.25, 0.100000001, 0.25, 1.0);
  objc_msgSend(v9, "controlPoint1");
  v11 = v10;
  objc_msgSend(v9, "controlPoint2");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69A0]), "initWithControlPoint1:controlPoint2:", 0.1, v11, 0.0, v12);
  v14 = self;
  -[SSBlurView setHidden:](v14->_blurView, "setHidden:", 0);
  -[_SSSFlashSuperColorView setHidden:](v14->_superColorView, "setHidden:", 0);
  v15 = -[SSFlashView style](v14, "style");
  v16 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v17 = 2.0;
  if (v15 == 2)
  {
    v17 = 1.5;
    v18 = 0.5;
  }
  else
  {
    v18 = 1.6;
  }
  v19 = objc_msgSend(v16, "initWithDuration:timingParameters:", v13, v17);
  superColorViewOpacityAnimator = v14->_superColorViewOpacityAnimator;
  v14->_superColorViewOpacityAnimator = (UIViewPropertyAnimator *)v19;

  v21 = v14->_superColorViewOpacityAnimator;
  v22 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke;
  v37[3] = &unk_24D06BE08;
  v37[4] = v14;
  -[UIViewPropertyAnimator addAnimations:](v21, "addAnimations:", v37);
  v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:timingParameters:", v9, v18);
  blurViewRadiusAnimator = v14->_blurViewRadiusAnimator;
  v14->_blurViewRadiusAnimator = (UIViewPropertyAnimator *)v23;

  v25 = v14->_blurViewRadiusAnimator;
  v36[0] = v22;
  v36[1] = 3221225472;
  v36[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_2;
  v36[3] = &unk_24D06BE08;
  v36[4] = v14;
  -[UIViewPropertyAnimator addAnimations:](v25, "addAnimations:", v36);
  v26 = v14->_blurViewRadiusAnimator;
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_3;
  v35[3] = &unk_24D06BE08;
  v35[4] = v14;
  -[UIViewPropertyAnimator addAnimations:](v26, "addAnimations:", v35);
  objc_initWeak(&location, v14);
  v27 = v14->_blurViewRadiusAnimator;
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_4;
  v32[3] = &unk_24D06C070;
  objc_copyWeak(&v33, &location);
  -[UIViewPropertyAnimator addCompletion:](v27, "addCompletion:", v32);
  v28 = v14->_superColorViewOpacityAnimator;
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_5;
  v30[3] = &unk_24D06C070;
  objc_copyWeak(&v31, &location);
  -[UIViewPropertyAnimator addCompletion:](v28, "addCompletion:", v30);
  -[UIViewPropertyAnimator startAnimationAfterDelay:](v14->_superColorViewOpacityAnimator, "startAnimationAfterDelay:", 0.1);
  -[UIViewPropertyAnimator startAnimationAfterDelay:](v14->_blurViewRadiusAnimator, "startAnimationAfterDelay:", 0.0);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

uint64_t __43__SSBlurringFlashView_flashWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

uint64_t __43__SSBlurringFlashView_flashWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setBlurRadius:", 0.0);
}

uint64_t __43__SSBlurringFlashView_flashWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setScale:", 1.0);
}

void __43__SSBlurringFlashView_flashWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_blurViewRadiusAnimatorCompleted");

}

void __43__SSBlurringFlashView_flashWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_superColorViewBackgroundColorAnimatorCompleted");

}

- (void)_blurViewRadiusAnimatorCompleted
{
  self->_blurViewRadiusAnimatorCompleted = 1;
  -[SSBlurringFlashView _runCompletionBlockIfAppropriate](self, "_runCompletionBlockIfAppropriate");
}

- (void)_superColorViewBackgroundColorAnimatorCompleted
{
  self->_superColorViewBackgroundColorAnimatorCompleted = 1;
  -[SSBlurringFlashView _runCompletionBlockIfAppropriate](self, "_runCompletionBlockIfAppropriate");
}

- (void)_runCompletionBlockIfAppropriate
{
  void (**completionBlock)(id, SEL);
  id v4;

  if (self->_superColorViewBackgroundColorAnimatorCompleted && self->_blurViewRadiusAnimatorCompleted)
  {
    completionBlock = (void (**)(id, SEL))self->_completionBlock;
    if (completionBlock)
    {
      completionBlock[2](completionBlock, a2);
      v4 = self->_completionBlock;
      self->_completionBlock = 0;

    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  -[SSBlurView _setCornerRadius:](self->_blurView, "_setCornerRadius:");
  -[_SSSFlashSuperColorView _setCornerRadius:](self->_superColorView, "_setCornerRadius:", a3);
}

- (double)_cornerRadius
{
  double result;

  -[SSBlurView _cornerRadius](self->_blurView, "_cornerRadius");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurViewRadiusAnimator, 0);
  objc_storeStrong((id *)&self->_superColorViewOpacityAnimator, 0);
  objc_storeStrong((id *)&self->_superColorView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
