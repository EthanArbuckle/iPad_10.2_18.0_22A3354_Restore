@implementation VKKeyboardCameraGuidanceView

- (VKKeyboardCameraGuidanceView)initWithFrame:(CGRect)a3
{
  VKKeyboardCameraGuidanceView *v3;
  VKKeyboardCameraGuidanceView *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIVisualEffectView *blurView;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *label;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VKKeyboardCameraGuidanceView;
  v3 = -[VKKeyboardCameraGuidanceView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VKKeyboardCameraGuidanceView setAlpha:](v3, "setAlpha:", 0.0);
    v5 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithEffect:", v6);
    blurView = v4->_blurView;
    v4->_blurView = (UIVisualEffectView *)v7;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView layer](v4->_blurView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 1);

    -[UIVisualEffectView setUserInteractionEnabled:](v4->_blurView, "setUserInteractionEnabled:", 0);
    -[UIVisualEffectView layer](v4->_blurView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 2.5);

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    label = v4->_label;
    v4->_label = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel layer](v4->_label, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v14);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setUserInteractionEnabled:](v4->_label, "setUserInteractionEnabled:", 0);
    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v15);

    -[VKKeyboardCameraGuidanceView addSubview:](v4, "addSubview:", v4->_blurView);
    -[VKKeyboardCameraGuidanceView addSubview:](v4, "addSubview:", v4->_label);
    *(_OWORD *)&v4->_contentEdgeInsets.top = xmmword_1D2ED0B70;
    *(_OWORD *)&v4->_contentEdgeInsets.bottom = xmmword_1D2ED0B70;
  }
  return v4;
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[10];

  v30[8] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)VKKeyboardCameraGuidanceView;
  -[VKKeyboardCameraGuidanceView didMoveToSuperview](&v29, sel_didMoveToSuperview);
  if (!self->_didAddConstraints)
  {
    -[VKKeyboardCameraGuidanceView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_blurView, 0);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView leftAnchor](self->_blurView, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraGuidanceView leftAnchor](self, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    -[UIVisualEffectView rightAnchor](self->_blurView, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraGuidanceView rightAnchor](self, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v23;
    -[UIVisualEffectView topAnchor](self->_blurView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraGuidanceView topAnchor](self, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v20;
    -[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraGuidanceView bottomAnchor](self, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v16;
    -[UILabel topAnchor](self->_label, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraGuidanceView topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, self->_contentEdgeInsets.top);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v13;
    -[UILabel leftAnchor](self->_label, "leftAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraGuidanceView leftAnchor](self, "leftAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v3, self->_contentEdgeInsets.left);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[5] = v4;
    -[VKKeyboardCameraGuidanceView bottomAnchor](self, "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_label, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, self->_contentEdgeInsets.bottom);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[6] = v7;
    -[VKKeyboardCameraGuidanceView rightAnchor](self, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel rightAnchor](self->_label, "rightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, self->_contentEdgeInsets.right);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[7] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v11);

    self->_didAddConstraints = 1;
  }
}

- (void)showGuidanceWithText:(id)a3
{
  id v5;
  CFAbsoluteTime Current;
  double lastVisibleTime;
  double v8;
  id v10;

  v5 = a3;
  v10 = v5;
  switch(self->_state)
  {
    case 0uLL:
      objc_storeStrong((id *)&self->_text, a3);
      Current = CFAbsoluteTimeGetCurrent();
      lastVisibleTime = self->_lastVisibleTime;
      v8 = Current - lastVisibleTime;
      if (lastVisibleTime != 0.0 && v8 <= 1.5)
      {
        self->_state = 1;
        -[VKKeyboardCameraGuidanceView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reallyShowGuidance, 0, 1.5 - v8);
      }
      else
      {
        -[VKKeyboardCameraGuidanceView _reallyShowGuidance](self, "_reallyShowGuidance", v8);
      }
      goto LABEL_11;
    case 1uLL:
    case 2uLL:
      objc_storeStrong((id *)&self->_text, a3);
      goto LABEL_11;
    case 3uLL:
      objc_storeStrong((id *)&self->_text, a3);
      -[UILabel setText:](self->_label, "setText:", v10);
LABEL_11:
      v5 = v10;
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyHideGuidance, 0);
      v5 = v10;
      self->_state = 3;
      break;
    default:
      break;
  }

}

- (void)hideGuidance
{
  unint64_t state;
  double v4;

  state = self->_state;
  if (state == 3)
  {
    v4 = CFAbsoluteTimeGetCurrent() - self->_visibleStartTime;
    if (self->_lastVisibleTime != 0.0 && v4 <= 3.5)
    {
      self->_state = 4;
      -[VKKeyboardCameraGuidanceView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reallyHideGuidance, 0, 3.5 - v4);
    }
    else
    {
      -[VKKeyboardCameraGuidanceView _reallyHideGuidance](self, "_reallyHideGuidance", v4);
    }
  }
  else if (state == 1)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyShowGuidance, 0);
    self->_state = 0;
  }
}

- (void)_reallyShowGuidance
{
  _QWORD v3[5];
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyShowGuidance, 0);
  self->_state = 2;
  -[UILabel setText:](self->_label, "setText:", self->_text);
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VKKeyboardCameraGuidanceView__reallyShowGuidance__block_invoke;
  v4[3] = &unk_1E94625B8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VKKeyboardCameraGuidanceView__reallyShowGuidance__block_invoke_2;
  v3[3] = &unk_1E9462658;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateWithDuration:delay:options:animations:start:completion:", 0x10000, v4, 0, v3, 0.5, 0.0);
}

uint64_t __51__VKKeyboardCameraGuidanceView__reallyShowGuidance__block_invoke(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 472) = CFAbsoluteTimeGetCurrent();
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __51__VKKeyboardCameraGuidanceView__reallyShowGuidance__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 488) = 3;
  return result;
}

- (void)_reallyHideGuidance
{
  _QWORD v3[5];
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyHideGuidance, 0);
  self->_state = 5;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VKKeyboardCameraGuidanceView__reallyHideGuidance__block_invoke;
  v4[3] = &unk_1E94625B8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VKKeyboardCameraGuidanceView__reallyHideGuidance__block_invoke_2;
  v3[3] = &unk_1E9462658;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateWithDuration:delay:options:animations:start:completion:", 0x20000, v4, 0, v3, 0.5, 0.0);
}

uint64_t __51__VKKeyboardCameraGuidanceView__reallyHideGuidance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __51__VKKeyboardCameraGuidanceView__reallyHideGuidance__block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 480) = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488) = 0;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
