@implementation PUReviewScreenTopBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PUReviewScreenTopBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUReviewScreenTopBar;
  -[PUReviewScreenTopBar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PUReviewScreenTopBar *)objc_claimAutoreleasedReturnValue();
  if (-[PUReviewScreenTopBar backgroundStyle](self, "backgroundStyle") <= 1 && v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (PUReviewScreenTopBar)initWithFrame:(CGRect)a3
{
  PUReviewScreenTopBar *v3;
  uint64_t v4;
  PUReviewScreenDoneButton *doneButton;
  uint64_t v6;
  UIButton *retakeButton;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  uint64_t v14;
  NSSet *availableButtons;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUReviewScreenTopBar;
  v3 = -[PUReviewScreenTopBar initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PUReviewScreenDoneButton doneButton](PUReviewScreenDoneButton, "doneButton");
    v4 = objc_claimAutoreleasedReturnValue();
    doneButton = v3->_doneButton;
    v3->_doneButton = (PUReviewScreenDoneButton *)v4;

    -[PUReviewScreenTopBar addSubview:](v3, "addSubview:", v3->_doneButton);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    retakeButton = v3->_retakeButton;
    v3->_retakeButton = (UIButton *)v6;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v3->_retakeButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    v10 = v3->_retakeButton;
    PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_RETAKE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v10, "setTitle:forState:", v11, 0);

    v12 = v3->_retakeButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

    -[PUReviewScreenTopBar addSubview:](v3, "addSubview:", v3->_retakeButton);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    availableButtons = v3->_availableButtons;
    v3->_availableButtons = (NSSet *)v14;

    -[PUReviewScreenTopBar _updateButtonVisibility](v3, "_updateButtonVisibility");
    -[PUReviewScreenTopBar _updateBackgroundColor](v3, "_updateBackgroundColor");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
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
  void *v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  objc_super v45;
  CGRect v46;

  v45.receiver = self;
  v45.super_class = (Class)PUReviewScreenTopBar;
  -[PUReviewScreenTopBar layoutSubviews](&v45, sel_layoutSubviews);
  -[PUReviewScreenTopBar bounds](self, "bounds");
  v43 = v4;
  v44 = v3;
  v6 = v5;
  v8 = v7;
  -[PUReviewScreenTopBar doneButton](self, "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenTopBar window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v9, "setPreferredStyle:", +[PUReviewScreenUtilities doneButtonStyleForReferenceBounds:](PUReviewScreenUtilities, "doneButtonStyleForReferenceBounds:", v12, v14, v16, v18));
  -[PUReviewScreenTopBar retakeButton](self, "retakeButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicContentSize");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v19, "intrinsicContentSize");
  v42 = v24;
  v26 = v25;
  objc_msgSend(v9, "setTappableEdgeInsets:", 10.0, 10.0, 10.0, 10.0);
  -[PUReviewScreenTopBar doneButtonCenterAlignmentPoint](self, "doneButtonCenterAlignmentPoint");
  v29 = v28;
  v30 = v27;
  if (v28 == *MEMORY[0x1E0C9D538] && v27 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v35 = 15.0;
    v37 = v43;
    v36 = v44;
  }
  else
  {
    -[PUReviewScreenTopBar window](self, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewScreenTopBar convertPoint:fromView:](self, "convertPoint:fromView:", v32, v29, v30);
    v34 = v33;

    v46.origin.x = v44;
    v46.origin.y = v6;
    v46.size.width = v43;
    v46.size.height = v8;
    v35 = CGRectGetMaxX(v46) - (v21 * 0.5 + v34);
    v36 = v44;
    v37 = v43;
  }
  v38 = v6;
  v39 = v8;
  v40 = v8 * 0.5;
  objc_msgSend(v9, "frameForAlignmentRect:", CGRectGetMaxX(*(CGRect *)&v36) - v21 - v35, v8 * 0.5 - v23 * 0.5, v21, v23);
  v41 = fmax(v26, 40.0);
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v19, "setFrame:", v35, v40 - v41 * 0.5, fmax(v42, 60.0), v41);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUReviewScreenTopBar;
  -[PUReviewScreenTopBar didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PUReviewScreenTopBar window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PUReviewScreenTopBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAvailableButtons:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  char v6;
  NSSet *v7;
  NSSet *availableButtons;
  NSSet *v9;

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_availableButtons != v4)
  {
    v9 = v4;
    v6 = -[NSSet isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSSet *)-[NSSet copy](v9, "copy");
      availableButtons = self->_availableButtons;
      self->_availableButtons = v7;

      -[PUReviewScreenTopBar _updateButtonVisibility](self, "_updateButtonVisibility");
      v5 = v9;
    }
  }

}

- (void)setEnabledButtons:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  char v6;
  NSSet *v7;
  NSSet *enabledButtons;
  NSSet *v9;

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_enabledButtons != v4)
  {
    v9 = v4;
    v6 = -[NSSet isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSSet *)-[NSSet copy](v9, "copy");
      enabledButtons = self->_enabledButtons;
      self->_enabledButtons = v7;

      -[PUReviewScreenTopBar _updateButtonVisibility](self, "_updateButtonVisibility");
      v5 = v9;
    }
  }

}

- (void)setDoneButtonCenterAlignmentPoint:(CGPoint)a3
{
  if (a3.x != self->_doneButtonCenterAlignmentPoint.x || a3.y != self->_doneButtonCenterAlignmentPoint.y)
  {
    self->_doneButtonCenterAlignmentPoint = a3;
    -[PUReviewScreenTopBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    -[PUReviewScreenTopBar _updateBackgroundColor](self, "_updateBackgroundColor");
  }
}

- (BOOL)_isButtonAvailable:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PUReviewScreenTopBar availableButtons](self, "availableButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)_isButtonEnabled:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PUReviewScreenTopBar enabledButtons](self, "enabledButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (id)_buttonForButtonType:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[PUReviewScreenTopBar retakeButton](self, "retakeButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[PUReviewScreenTopBar doneButton](self, "doneButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_updateButtonVisibility
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  _BOOL8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "supportedButtons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "integerValue");
        -[PUReviewScreenTopBar _buttonForButtonType:](self, "_buttonForButtonType:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PUReviewScreenTopBar _isButtonAvailable:](self, "_isButtonAvailable:", v8);
        v11 = -[PUReviewScreenTopBar _isButtonEnabled:](self, "_isButtonEnabled:", v8);
        objc_msgSend(v9, "setHidden:", !v10);
        objc_msgSend(v9, "setEnabled:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_updateBackgroundColor
{
  unint64_t v3;
  double v4;
  id v5;

  v3 = -[PUReviewScreenTopBar backgroundStyle](self, "backgroundStyle");
  if (v3)
  {
    if (v3 != 1)
      return;
    v4 = 0.3;
  }
  else
  {
    v4 = 0.1;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenTopBar setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (NSSet)availableButtons
{
  return self->_availableButtons;
}

- (NSSet)enabledButtons
{
  return self->_enabledButtons;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CGPoint)doneButtonCenterAlignmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_doneButtonCenterAlignmentPoint.x;
  y = self->_doneButtonCenterAlignmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (UIButton)retakeButton
{
  return self->_retakeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retakeButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_enabledButtons, 0);
  objc_storeStrong((id *)&self->_availableButtons, 0);
}

+ (id)supportedButtons
{
  if (supportedButtons_onceToken_80603 != -1)
    dispatch_once(&supportedButtons_onceToken_80603, &__block_literal_global_80604);
  return (id)supportedButtons_supportedButtons_80605;
}

void __40__PUReviewScreenTopBar_supportedButtons__block_invoke()
{
  void *v0;

  v0 = (void *)supportedButtons_supportedButtons_80605;
  supportedButtons_supportedButtons_80605 = (uint64_t)&unk_1E59BA750;

}

@end
