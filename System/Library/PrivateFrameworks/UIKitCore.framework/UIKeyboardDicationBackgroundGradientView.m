@implementation UIKeyboardDicationBackgroundGradientView

- (UIKeyboardDicationBackgroundGradientView)initWithFrame:(CGRect)a3
{
  UIKeyboardDicationBackgroundGradientView *v3;
  void *v4;
  UIKeyboardDicationBackgroundGradientView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardDicationBackgroundGradientView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = v3;
  }

  return v3;
}

- (id)backgroundColorForCurrentRenderConfig
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.447058824, 0.482352941, 0.529411765, 0.48);
}

- (void)startColorTransitionIn
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[UIKeyboardDicationBackgroundGradientView renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lightKeyboard");

  if (v4)
  {
    v5 = UIKBGetNamedColor(CFSTR("UIKBColorLightBackdropTint"));
    -[UIView layer](self, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsDisplay");

  +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorTransitionInDuration");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__UIKeyboardDicationBackgroundGradientView_startColorTransitionIn__block_invoke;
  v11[3] = &unk_1E16B1B28;
  v11[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v11, &__block_literal_global_335);

}

void __66__UIKeyboardDicationBackgroundGradientView_startColorTransitionIn__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = UIKBGetNamedColor(CFSTR("UIKBColoriPhoneDictationBackboard"));
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

- (void)startColorTransitionOut
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[5];
  char v13;
  _QWORD v14[6];

  v3 = UIKBGetNamedColor(CFSTR("UIKBColoriPhoneDictationBackboard"));
  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsDisplay");

  -[UIKeyboardDicationBackgroundGradientView renderConfig](self, "renderConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "lightKeyboard");

  if ((_DWORD)v4)
  {
    v7 = UIKBGetNamedColor(CFSTR("UIKBColorLightBackdropTint"));
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (void *)objc_msgSend(v8, "CGColor");

  }
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "usingTypeAndTalk") ^ 1;

  +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorTransitionOutDuration");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke;
  v14[3] = &unk_1E16B1888;
  v14[4] = self;
  v14[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke_2;
  v12[3] = &unk_1E16B7F38;
  v13 = v10;
  v12[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v14, v12);

}

void __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

}

void __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke_2(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "dictationView");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "finishReturnToKeyboard");

  }
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimation
{
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
}

- (CGRect)_backgroundFillFrame
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  -[UIView bounds](self, "bounds");
  if (v3 == 1)
  {
    v4 = v4 + 12.0;
    v5 = v5 + 17.0;
    v6 = v6 + -24.0;
    v7 = v7 + -34.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardDicationBackgroundGradientView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setBounds:](self, "setBounds:");

  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setRenderConfig:(id)a3
{
  UIKBRenderConfig *v5;
  UIKBRenderConfig *v6;

  v5 = (UIKBRenderConfig *)a3;
  if (self->_renderConfig != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_renderConfig, a3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIDictationView)dictationView
{
  return self->_dictationView;
}

- (void)setDictationView:(id)a3
{
  self->_dictationView = (UIDictationView *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

@end
