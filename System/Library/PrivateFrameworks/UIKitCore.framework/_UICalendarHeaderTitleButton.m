@implementation _UICalendarHeaderTitleButton

- (_UICalendarHeaderTitleButton)initWithFrame:(CGRect)a3
{
  _UICalendarHeaderTitleButton *v3;
  _UIDatePickerLinkedLabel *v4;
  void *v5;
  _UIDatePickerLinkedLabel *monthYearLabel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICalendarHeaderTitleButton;
  v3 = -[UIButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (_UIDatePickerLinkedLabel *)objc_opt_new();
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[_UIDatePickerLinkedLabel setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerLinkedLabel setTextColor:](v4, "setTextColor:", v5);

    -[UIView addSubview:](v3, "addSubview:", v4);
    monthYearLabel = v3->_monthYearLabel;
    v3->_monthYearLabel = v4;

    -[_UICalendarHeaderTitleButton _updateChevron](v3, "_updateChevron");
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICalendarHeaderTitleButton;
  -[UIButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[_UICalendarHeaderTitleButton _updateChevron](self, "_updateChevron");
}

- (CGAffineTransform)chevronTransform
{
  CGAffineTransform *result;
  uint64_t v4;
  __int128 v5;

  result = (CGAffineTransform *)self->_chevron;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return result;
}

- (void)setChevronTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[UIView setTransform:](self->_chevron, "setTransform:", v4);
}

- (void)setFontDesign:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_fontDesign != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fontDesign, a3);
    -[_UICalendarHeaderTitleButton _updateFont](self, "_updateFont");
    v5 = v6;
  }

}

- (void)updateTitles:(id)a3 isExpanded:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerLinkedLabel setTitles:](self->_monthYearLabel, "setTitles:", v6);
  if (a4)
  {
    objc_msgSend(v11, "expandedMonthYearLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerLinkedLabel setTextColor:](self->_monthYearLabel, "setTextColor:", v8);

    objc_msgSend(v11, "expandedMonthYearChevronColor");
  }
  else
  {
    objc_msgSend(v11, "monthYearLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerLinkedLabel setTextColor:](self->_monthYearLabel, "setTextColor:", v9);

    objc_msgSend(v11, "monthYearChevronColor");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_chevron, "setTintColor:", v10);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICalendarHeaderTitleButton;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView sizeThatFits:](self->_chevron, "sizeThatFits:", width, height);
  v10 = v9;
  if (self->_chevron)
    v11 = v8 + 4.0;
  else
    v11 = v8;
  -[_UIDatePickerLinkedLabel sizeThatFits:](self->_monthYearLabel, "sizeThatFits:", width, height);
  v13 = v11 + v12;
  v15 = fmax(v10, v14);
  objc_msgSend(v7, "monthYearContainerEdgeInsets");
  v18 = v13 - (v16 + v17);
  v21 = v15 - (v19 + v20);

  v22 = v18;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIImageView *chevron;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _UIDatePickerLinkedLabel *monthYearLabel;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CGFloat v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t rect;
  double v47;
  double v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49.receiver = self;
  v49.super_class = (Class)_UICalendarHeaderTitleButton;
  -[UIButton layoutSubviews](&v49, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v11 = v5;
  v12 = v6;
  chevron = self->_chevron;
  if (chevron)
  {
    -[UIImageView sizeThatFits:](chevron, "sizeThatFits:", v5, v6);
    v15 = v14;
    v48 = v16;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v48 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[_UIDatePickerLinkedLabel sizeThatFits:](self->_monthYearLabel, "sizeThatFits:", v11 - v15 + -4.0, v12);
  v18 = v17;
  v19 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(v4, "monthYearContainerEdgeInsets");
  v23 = v8 - v22;
  v25 = v10 - v24;
  v26 = v11 - (-v21 - v22);
  v27 = v12 - (-v20 - v24);
  v28 = v23;
  if (v19)
  {
    v50.origin.x = v23;
    v50.origin.y = v25;
    v50.size.width = v26;
    v50.size.height = v27;
    v28 = CGRectGetMaxX(v50) - v18;
  }
  -[_UIDatePickerLinkedLabel setFrame:](self->_monthYearLabel, "setFrame:", v28, v25, v18, v27);
  if (self->_chevron)
  {
    v47 = v15;
    -[UIView layoutBelowIfNeeded](self->_monthYearLabel, "layoutBelowIfNeeded");
    monthYearLabel = self->_monthYearLabel;
    -[_UIDatePickerLinkedLabel contentLayoutGuide](monthYearLabel, "contentLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layoutFrame");
    -[UIView convertRect:toView:](monthYearLabel, "convertRect:toView:", self);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    rect = v37;

    v51.origin.x = v23;
    v51.origin.y = v25;
    v51.size.width = v26;
    v51.size.height = v27;
    v38 = (CGRectGetHeight(v51) - v48) * 0.5;
    v52.origin.x = v23;
    v52.origin.y = v25;
    v52.size.width = v26;
    v52.size.height = v27;
    v39 = CGRectGetMinY(v52) + v38;
    v40 = v32;
    v41 = v34;
    v42 = v36;
    v43 = rect;
    if (v19)
    {
      v44 = v47;
      v45 = CGRectGetMinX(*(CGRect *)&v40) + -4.0 - v47;
    }
    else
    {
      v45 = CGRectGetMaxX(*(CGRect *)&v40) + 4.0;
      v44 = v47;
    }
    -[UIImageView setBounds:](self->_chevron, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v44, v48);
    -[UIImageView setCenter:](self->_chevron, "setCenter:", v44 * 0.5 + v45, v48 * 0.5 + v39);
  }

}

- (void)_updateChevron
{
  UIImageView *v3;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;
  UIImageView *chevron;

  if (-[UIControl isEnabled](self, "isEnabled") || (v3 = self->_chevron) == 0)
  {
    if (-[UIControl isEnabled](self, "isEnabled"))
    {
      if (!self->_chevron)
      {
        v5 = (UIImageView *)objc_opt_new();
        -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
        -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v5, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
        +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](v5, "setImage:", v6);

        -[UIView addSubview:](self, "addSubview:", v5);
        chevron = self->_chevron;
        self->_chevron = v5;

        -[_UICalendarHeaderTitleButton _updateFont](self, "_updateFont");
      }
    }
  }
  else
  {
    -[UIView removeFromSuperview](v3, "removeFromSuperview");
    v4 = self->_chevron;
    self->_chevron = 0;

  }
}

- (void)_updateFont
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "monthYearLabelFontProvider");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_UICalendarHeaderTitleButton fontDesign](self, "fontDesign");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v4)[2](v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerLinkedLabel setFont:](self->_monthYearLabel, "setFont:", v7);

  objc_msgSend(v11, "monthYearChevronSymbolConfiguration");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_chevron, "setPreferredSymbolConfiguration:", v10);

}

- (NSString)fontDesign
{
  return self->_fontDesign;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDesign, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_monthYearLabel, 0);
}

@end
