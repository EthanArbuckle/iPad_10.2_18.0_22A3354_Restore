@implementation UIKeyboardDictationMenu

+ (id)activeInstance
{
  return (id)gSharedDictationMenu;
}

- (UIKeyboardDictationMenu)initWithFrame:(CGRect)a3
{
  UIKeyboardDictationMenu *v3;
  UIKeyboardDictationMenu *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIKeyboardDictationMenu *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardDictationMenu;
  v3 = -[UIKeyboardMenuView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (void *)MEMORY[0x1E0C99D20];
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.999, 0.999, 0.999, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.999, 0.999, 0.999, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputSwitcherShadowView setGradientColors:](v4->super.m_shadowView, "setGradientColors:", v8);

    +[UIDictationView sharedInstance](UIDictationPopUpView, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v9);

    v10 = v4;
  }

  return v4;
}

+ (id)sharedInstance
{
  void *v2;
  UIKeyboardDictationMenu *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)gSharedDictationMenu;
  if (!gSharedDictationMenu)
  {
    v3 = [UIKeyboardDictationMenu alloc];
    v4 = -[UIKeyboardDictationMenu initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = (void *)gSharedDictationMenu;
    gSharedDictationMenu = v4;

    v2 = (void *)gSharedDictationMenu;
  }
  return v2;
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  +[UIDictationView viewSize](UIDictationView, "viewSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)usesTable
{
  return 0;
}

- (BOOL)centerPopUpOverKey
{
  return 1;
}

- (void)performShowAnimation
{
  CGRect *p_m_referenceRect;
  double MidY;
  double v5;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  _QWORD v15[6];
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;

  p_m_referenceRect = &self->super.m_referenceRect;
  MidY = CGRectGetMidY(self->super.m_referenceRect);
  -[UIView frame](self, "frame");
  v5 = MidY - CGRectGetMidY(v18);
  width = p_m_referenceRect->size.width;
  -[UIView bounds](self, "bounds");
  height = p_m_referenceRect->size.height;
  v9 = width / v8;
  -[UIView bounds](self, "bounds");
  if (v9 >= height / v10)
    v9 = height / v10;
  -[UIView center](self, "center");
  v12 = v11;
  -[UIView center](self, "center");
  -[UIView setCenter:](self, "setCenter:", v12, v5 + v13);
  CGAffineTransformMakeScale(&v17, v9, v9);
  v16 = v17;
  -[UIView setTransform:](self, "setTransform:", &v16);
  -[UIView setAlpha:](self, "setAlpha:", 0.0);
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke;
  v15[3] = &unk_1E16B1888;
  v15[4] = self;
  *(double *)&v15[5] = v5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_2;
  v14[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50397184, v15, v14, 0.16, 0.0);
}

uint64_t __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  CGAffineTransformMakeScale(&v8, 1.02, 1.02);
  v2 = *(void **)(a1 + 32);
  v7 = v8;
  objc_msgSend(v2, "setTransform:", &v7);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "center");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "center");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v4, v5 - *(double *)(a1 + 40));
}

uint64_t __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_3;
  v3[3] = &unk_1E16B1B28;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_4;
  v2[3] = &unk_1E16B3FD8;
  v2[4] = v4;
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50462720, v3, v2, 0.1, 0.0);
}

uint64_t __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.99, 0.99);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_4(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_5;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50397184, v2, 0, 0.08, 0.0);
}

uint64_t __47__UIKeyboardDictationMenu_performShowAnimation__block_invoke_5(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)willShow
{
  void *v3;
  void *v4;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDictation");

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disableInterfaceAutorotation:", 1);

  -[UIKeyboardMenuView setKeyboardDimmed:](self, "setKeyboardDimmed:", 1);
}

- (void)cleanupForFadeOrHide
{
  void *v3;
  void *v4;

  if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
  {
    if (!+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stopDictation");

    }
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableInterfaceAutorotation:", 0);

    -[UIKeyboardMenuView setKeyboardDimmed:](self, "setKeyboardDimmed:", 0);
  }
}

- (void)fade
{
  objc_super v3;

  -[UIKeyboardDictationMenu cleanupForFadeOrHide](self, "cleanupForFadeOrHide");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardDictationMenu;
  -[UIKeyboardMenuView fade](&v3, sel_fade);
}

- (void)fadeWithDelay:(double)a3
{
  objc_super v5;

  -[UIKeyboardDictationMenu cleanupForFadeOrHide](self, "cleanupForFadeOrHide");
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardDictationMenu;
  -[UIKeyboardMenuView fadeWithDelay:](&v5, sel_fadeWithDelay_, a3);
}

- (void)hide
{
  objc_super v3;

  -[UIKeyboardDictationMenu cleanupForFadeOrHide](self, "cleanupForFadeOrHide");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardDictationMenu;
  -[UIKeyboardMenuView hide](&v3, sel_hide);
}

- (BOOL)usesDimmingView
{
  return 1;
}

@end
