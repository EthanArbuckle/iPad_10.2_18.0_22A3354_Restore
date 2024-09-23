@implementation UIRecentInputTableCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIRecentInputTableCell;
  -[UITableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRecentInputTableCell floatingContentView](self, "floatingContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)setInputText:(id)a3 withBlurStyle:(int64_t)a4
{
  id v6;
  void *v7;
  _UIFloatingContentView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UIFloatingContentView *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [_UIFloatingContentView alloc];
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = -[_UIFloatingContentView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v13, "setContentMotionRotation:translation:", 0.0, 0.0698131701, 0.0, 4.0);
    -[UITableViewCell setBackgroundView:](self, "setBackgroundView:", v13);
    -[UIRecentInputTableCell setBlurEffectStyle:](self, "setBlurEffectStyle:", a4);
    v14 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v9, v10, v11, v12);
    -[UIRecentInputTableCell setFloatingLabel:](self, "setFloatingLabel:", v14);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextAlignment:", 1);

    -[_UIFloatingContentView contentView](v13, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

  }
  -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v6);

  -[UIRecentInputTableCell _updateAppearance](self, "_updateAppearance");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(uint64_t);
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIRecentInputTableCell;
  v6 = a4;
  v7 = a3;
  -[UITableViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v17, sel_didUpdateFocusInContext_withAnimationCoordinator_, v7, v6);
  v8 = -[UIRecentInputTableCell _tvIsDarkMode](self, "_tvIsDarkMode");
  objc_msgSend(v7, "nextFocusedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "isDescendantOfView:", self);
  -[UIRecentInputTableCell floatingContentView](self, "floatingContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v7)
  {
    objc_msgSend(v10, "setControlState:animated:", 8, 1);

    v16 = MEMORY[0x1E0C809B0];
    v12 = __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    v13 = &v16;
  }
  else
  {
    objc_msgSend(v10, "setControlState:animated:", 0, 1);

    v15 = MEMORY[0x1E0C809B0];
    v12 = __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
    v13 = &v15;
  }
  v14 = 1;
  if (v8)
    v14 = 2;
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_1E16B1888;
  v13[4] = (uint64_t)self;
  v13[5] = v14;
  objc_msgSend(v6, "addCoordinatedAnimations:completion:", v15);

}

void __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "focusedTextColorForBlurEffectStyle:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "floatingLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

}

void __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "unfocusedTextColorForBlurEffectStyle:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "floatingLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

}

- (void)_updateAppearance
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[UIRecentInputTableCell blurEffectStyle](self, "blurEffectStyle");
  -[UITableViewCell backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "backgroundColorForBlurEffectStyle:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:forState:", v5, 0);

  }
  -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[UIView isFocused](self, "isFocused");
    v9 = (void *)objc_opt_class();
    if (v8)
      objc_msgSend(v9, "focusedTextColorForBlurEffectStyle:", v3);
    else
      objc_msgSend(v9, "unfocusedTextColorForBlurEffectStyle:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UIRecentInputTableCell floatingLabel](self, "floatingLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIRecentInputTableCell;
  -[UITableViewCell setHighlighted:animated:](&v8, sel_setHighlighted_animated_, a3, a4);
  if (v4)
    v6 = 9;
  else
    v6 = 0;
  -[UIRecentInputTableCell floatingContentView](self, "floatingContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControlState:animated:", v6, 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIRecentInputTableCell;
  v4 = a3;
  -[UITableViewCell traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

}

+ (id)unfocusedTextColorForBlurEffectStyle:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 < 2 || a3 == 4002)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)focusedTextColorForBlurEffectStyle:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 < 2 || a3 == 4002)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)backgroundColorForBlurEffectStyle:(int64_t)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 1.0;
  if (a3 == 4002)
    v4 = 0.0;
  if ((unint64_t)a3 >= 2)
    v3 = v4;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3, 0.1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_tvIsDarkMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[UIRecentInputTableCell textInputTraits](self, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardAppearance");

  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  return v4 == 1 || v6 == 2 || v6 == 1000;
}

- (UILabel)floatingLabel
{
  return self->_floatingLabel;
}

- (void)setFloatingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_floatingLabel, a3);
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
}

- (UITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setTextInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_floatingLabel, 0);
}

@end
