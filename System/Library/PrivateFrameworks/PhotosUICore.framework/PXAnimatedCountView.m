@implementation PXAnimatedCountView

- (void)commonInit
{
  CAGradientLayer *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIFont *v10;
  UIFont *font;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v13;
  void *v14;
  PXAnimatedLabel *v15;
  PXAnimatedLabel *currentLabel;
  PXAnimatedLabel *v17;
  PXAnimatedLabel *v18;
  PXAnimatedLabel *sizingLabel;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v3 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v5;
  v20[1] = v7;
  v20[2] = v7;
  v20[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](v3, "setColors:", v8);
  -[CAGradientLayer setLocations:](v3, "setLocations:", &unk_1E53E9E10);
  -[PXAnimatedCountView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[CAGradientLayer setFrame:](v3, "setFrame:");

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v10 = (UIFont *)objc_claimAutoreleasedReturnValue();
  font = self->_font;
  self->_font = v10;

  gradientLayer = self->_gradientLayer;
  self->_gradientLayer = v3;
  v13 = v3;

  -[PXAnimatedCountView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMask:", v13);

  v15 = objc_alloc_init(PXAnimatedLabel);
  -[PXAnimatedLabel setText:](v15, "setText:", &stru_1E5149688);
  -[PXAnimatedLabel setFont:](v15, "setFont:", self->_font);
  -[PXAnimatedLabel sizeToFit](v15, "sizeToFit");
  currentLabel = self->_currentLabel;
  self->_currentLabel = v15;
  v17 = v15;

  -[PXAnimatedCountView addSubview:](self, "addSubview:", v17);
  v18 = objc_alloc_init(PXAnimatedLabel);
  -[PXAnimatedLabel setText:](v18, "setText:", &stru_1E5149688);
  -[PXAnimatedLabel setFont:](v18, "setFont:", self->_font);
  -[PXAnimatedLabel sizeToFit](v18, "sizeToFit");
  sizingLabel = self->_sizingLabel;
  self->_sizingLabel = v18;

}

- (PXAnimatedCountView)initWithFrame:(CGRect)a3
{
  PXAnimatedCountView *v3;
  PXAnimatedCountView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCountView;
  v3 = -[PXAnimatedCountView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXAnimatedCountView commonInit](v3, "commonInit");
  return v4;
}

- (PXAnimatedCountView)initWithCoder:(id)a3
{
  PXAnimatedCountView *v3;
  PXAnimatedCountView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedCountView;
  v3 = -[PXAnimatedCountView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXAnimatedCountView commonInit](v3, "commonInit");
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXAnimatedCountView sizingLabel](self, "sizingLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v6 + 8.0;
  v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)PXAnimatedCountView;
  -[PXAnimatedCountView layoutSubviews](&v13, sel_layoutSubviews);
  -[PXAnimatedCountView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXAnimatedCountView gradientLayer](self, "gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v15 = CGRectInset(v14, 0.0, 4.0);
  objc_msgSend(v11, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

  -[PXAnimatedCountView currentLabel](self, "currentLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (void)setText:(id)a3
{
  -[PXAnimatedCountView setText:withAnimationStyle:](self, "setText:withAnimationStyle:", a3, 0);
}

- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4
{
  -[PXAnimatedCountView setText:withAnimationStyle:spinDigits:](self, "setText:withAnimationStyle:spinDigits:", a3, a4, 1);
}

- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4 spinDigits:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  int v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  dispatch_time_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  uint64_t v41;
  _QWORD block[5];
  id v43;
  id v44;
  int64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;

  v5 = a5;
  v9 = a3;
  if (a4)
  {
    v10 = 1;
    if (a4 != 1)
      v10 = 2;
    v41 = v10;
    -[PXAnimatedCountView currentLabel](self, "currentLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_text;
    v13 = -[PXAnimatedCountView _requiresLabelSwitchForNewText:](self, "_requiresLabelSwitchForNewText:", v9);
    v14 = -[PXAnimatedCountView _requiresDigitAnimationForNewText:](self, "_requiresDigitAnimationForNewText:", v9)
       && v5;
    objc_storeStrong((id *)&self->_text, a3);
    if (v13 && v14)
    {
      v37 = v11;
      v15 = v9;
      v16 = objc_msgSend(v15, "rangeOfDigits");
      v18 = v17;
      v40 = v12;
      v19 = -[NSString digits](v12, "digits");
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        v20 = 0;
      else
        v20 = v19;
      v21 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20, v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringFromNumber:numberStyle:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = v16;
      if (objc_msgSend(v23, "length") >= v18)
      {
        v25 = v23;
      }
      else
      {
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E53EE3E8, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringByAppendingString:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v25;
        }
        while (objc_msgSend(v25, "length") < v18);
      }
      objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v39, v18, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSString rangeOfDigits](v40, "rangeOfDigits");
      v30 = v29;
      objc_msgSend(v15, "rangeOfDigits");
      if (v31 >= v30)
      {
        -[PXAnimatedCountView _labelWithText:](self, "_labelWithText:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAnimatedCountView _updateSizingWithText:](self, "_updateSizingWithText:", v15);
        v11 = v38;
        -[PXAnimatedCountView _animateLabelSwitchFromLabel:toLabel:andAnimationStyle:completionBlock:](self, "_animateLabelSwitchFromLabel:toLabel:andAnimationStyle:completionBlock:", v38, v34, a4, 0);
        v35 = dispatch_time(0, 240000003);
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke;
        v46[3] = &unk_1E5145560;
        v47 = v34;
        v48 = v15;
        v49 = v41;
        v36 = v34;
        dispatch_after(v35, MEMORY[0x1E0C80D38], v46);

      }
      else
      {
        -[PXAnimatedCountView currentLabel](self, "currentLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:withAnimationStyle:completionBlock:", v15, v41, &__block_literal_global_165085);

        v33 = dispatch_time(0, 330000013);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_3;
        block[3] = &unk_1E5146098;
        block[4] = self;
        v43 = v15;
        v11 = v38;
        v44 = v38;
        v45 = a4;
        dispatch_after(v33, MEMORY[0x1E0C80D38], block);

      }
      v12 = v40;
    }
    else if (v13)
    {
      -[PXAnimatedCountView _labelWithText:](self, "_labelWithText:", v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAnimatedCountView _updateSizingWithText:](self, "_updateSizingWithText:", v9);
      -[PXAnimatedCountView _animateLabelSwitchFromLabel:toLabel:andAnimationStyle:completionBlock:](self, "_animateLabelSwitchFromLabel:toLabel:andAnimationStyle:completionBlock:", v11, v27, a4, 0);

    }
    else if (v14)
    {
      objc_msgSend(v11, "setText:withAnimationStyle:completionBlock:", v9, v41, 0);
      -[PXAnimatedCountView _updateSizingWithText:](self, "_updateSizingWithText:", v9);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[PXAnimatedCountView currentLabel](self, "currentLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v9);

    -[PXAnimatedCountView _updateSizingWithText:](self, "_updateSizingWithText:", v9);
  }

}

- (void)setFont:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[PXAnimatedCountView currentLabel](self, "currentLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[PXAnimatedCountView sizingLabel](self, "sizingLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

}

- (BOOL)_requiresLabelSwitchForNewText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  char v15;
  BOOL v16;

  v4 = a3;
  -[PXAnimatedCountView text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByRemovingDigits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingDigits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "rangeOfDigits");
  v10 = v9;
  objc_msgSend(v5, "rangeOfDigits");
  v12 = v11;
  if (v8)
    LOBYTE(v13) = 1;
  else
    v13 = objc_msgSend(v4, "containsDigits") ^ 1;
  v14 = objc_msgSend(v6, "isEqualToString:", v7);
  if (v12 == v10)
    v15 = v13;
  else
    v15 = 1;
  if (v14)
    v16 = v15;
  else
    v16 = 1;

  return v16;
}

- (BOOL)_requiresDigitAnimationForNewText:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "rangeOfDigits"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "containsDigits");

  return v4;
}

- (id)_labelWithText:(id)a3
{
  __CFString *v4;
  PXAnimatedLabel *v5;
  PXAnimatedLabel *v6;
  const __CFString *v7;
  void *v8;

  v4 = (__CFString *)a3;
  v5 = objc_alloc_init(PXAnimatedLabel);
  v6 = v5;
  if (v4)
    v7 = v4;
  else
    v7 = &stru_1E5149688;
  -[PXAnimatedLabel setText:](v5, "setText:", v7);

  -[PXAnimatedLabel setAlpha:](v6, "setAlpha:", 0.0);
  -[PXAnimatedCountView font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[PXAnimatedLabel setFont:](v6, "setFont:", v8);

  return v6;
}

- (void)_updateSizingWithText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXAnimatedCountView sizingLabel](self, "sizingLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[PXAnimatedCountView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
}

- (void)_animateLabelSwitchFromLabel:(id)a3 toLabel:(id)a4 andAnimationStyle:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  CGFloat v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CGAffineTransform v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v10;
  v14 = v11;
  -[PXAnimatedCountView bounds](self, "bounds");
  objc_msgSend(v14, "setFrame:");
  -[PXAnimatedCountView addSubview:](self, "addSubview:", v14);
  -[PXAnimatedCountView setCurrentLabel:](self, "setCurrentLabel:", v14);
  -[PXAnimatedCountView currentLabel](self, "currentLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = CGRectGetHeight(v36) + 1.0;

  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, 0.0, 0.0 - v16);
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, 0.0, v16);
  if (a5 == 2)
  {
    v33 = v35;
    v30 = *(_OWORD *)&v34.a;
    v31 = *(_OWORD *)&v34.c;
    v17 = *(_OWORD *)&v34.tx;
  }
  else
  {
    v33 = v34;
    v30 = *(_OWORD *)&v35.a;
    v31 = *(_OWORD *)&v35.c;
    v17 = *(_OWORD *)&v35.tx;
  }
  v32 = v17;
  objc_msgSend(v14, "setTransform:", &v30);
  v18 = MEMORY[0x1E0C809B0];
  v19 = (void *)MEMORY[0x1E0DC3F10];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke;
  v26[3] = &unk_1E513CEF0;
  v27 = v14;
  v20 = v13;
  v28 = v20;
  v29 = v33;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke_2;
  v23[3] = &unk_1E5140638;
  v24 = v20;
  v25 = v12;
  v21 = v12;
  v22 = v14;
  objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 0x10000, v26, v23, 0.400000006, 0.0);

}

- (UIFont)font
{
  return self->_font;
}

- (NSString)text
{
  return self->_text;
}

- (PXAnimatedLabel)currentLabel
{
  return (PXAnimatedLabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCurrentLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (PXAnimatedLabel)sizingLabel
{
  return (PXAnimatedLabel *)objc_getProperty(self, a2, 440, 1);
}

- (void)setSizingLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (CAGradientLayer)gradientLayer
{
  return (CAGradientLayer *)objc_getProperty(self, a2, 448, 1);
}

- (void)setGradientLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
  objc_storeStrong((id *)&self->_currentLabel, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

uint64_t __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7 = *MEMORY[0x1E0C9BAA8];
  v8 = v3;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", &v7);
  v4 = *(void **)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v4, "setTransform:", &v7);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __94__PXAnimatedCountView__animateLabelSwitchFromLabel_toLabel_andAnimationStyle_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setText:withAnimationStyle:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_labelWithText:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_4;
  v6[3] = &unk_1E5144558;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  objc_msgSend(v7, "_animateLabelSwitchFromLabel:toLabel:andAnimationStyle:completionBlock:", v3, v2, v4, v6);

}

uint64_t __61__PXAnimatedCountView_setText_withAnimationStyle_spinDigits___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSizingWithText:", *(_QWORD *)(a1 + 40));
}

@end
