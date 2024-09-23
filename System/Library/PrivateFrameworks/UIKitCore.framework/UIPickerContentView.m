@implementation UIPickerContentView

+ (double)_checkmarkOffset
{
  return 15.0;
}

- (BOOL)isChecked
{
  return *(_BYTE *)&self->_pickerContentViewFlags & 1;
}

- (void)setChecked:(BOOL)a3
{
  UIImageView *checkView;
  UIImageView *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  *(_BYTE *)&self->_pickerContentViewFlags = *(_BYTE *)&self->_pickerContentViewFlags & 0xFE | a3;
  checkView = self->_checkView;
  if (a3)
  {
    if (!checkView)
    {
      v5 = [UIImageView alloc];
      v6 = -[UIImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v7 = self->_checkView;
      self->_checkView = v6;

      _UIImageWithName(CFSTR("UIPreferencesBlueCheck.png"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView tintColor](self, "tintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_flatImageWithColor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView setImage:](self->_checkView, "setImage:", v10);
      +[UIColor clearColor](UIColor, "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](self->_checkView, "setBackgroundColor:", v11);

      -[UIView addSubview:](self, "addSubview:", self->_checkView);
      -[UIView setNeedsLayout](self, "setNeedsLayout");

      checkView = self->_checkView;
    }
    -[UIImageView setHidden:](checkView, "setHidden:", 0);
    -[UIPickerContentView checkedColor](self, "checkedColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIImageView setHidden:](checkView, "setHidden:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (id)v12;
  -[UIPickerContentView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UILabel *v14;
  CGFloat v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGRect v24;
  CGRect v25;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = [UILabel alloc];
    v24.origin.x = v7;
    v24.origin.y = v9;
    v24.size.width = v11;
    v24.size.height = v13;
    v15 = CGRectGetMaxX(v24) + -43.0;
    v25.origin.x = v7;
    v25.origin.y = v9;
    v25.size.width = v11;
    v25.size.height = v13;
    v16 = -[UILabel initWithFrame:](v14, "initWithFrame:", 43.0, 0.0, v15, CGRectGetHeight(v25));
    v17 = self->_titleLabel;
    self->_titleLabel = v16;

    if ((*(_BYTE *)&self->_pickerContentViewFlags & 1) != 0)
      -[UIPickerContentView checkedColor](self, "checkedColor");
    else
      +[UIColor labelColor](UIColor, "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v18);

    +[UIColor clearColor](UIColor, "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v19);

    -[UIView traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nonCenterCellFontWithTraitCollection:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v21);

    -[UILabel setHighlighted:](self->_titleLabel, "setHighlighted:", (*(_BYTE *)&self->_pickerContentViewFlags >> 1) & 1);
    +[UIColor clearColor](UIColor, "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v22);

    -[UILabel setBaselineAdjustment:](self->_titleLabel, "setBaselineAdjustment:", 1);
    -[UIView addSubview:](self, "addSubview:", self->_titleLabel);
    -[UIView setNeedsLayout](self, "setNeedsLayout");

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)layoutSubviews
{
  UIImageView *checkView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  CGRect v16;
  CGRect v17;

  checkView = self->_checkView;
  if (checkView)
  {
    -[UIImageView image](checkView, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;

    -[UIView bounds](self, "bounds");
    -[UIImageView setFrame:](self->_checkView, "setFrame:", 15.0, round(v10 + (v9 - v8) * 0.5), v6, v8);
  }
  if (self->_titleLabel)
  {
    -[UIView bounds](self, "bounds");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v15 = CGRectGetMaxX(v16) + -43.0;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 43.0, 0.0, v15, CGRectGetHeight(v17));
  }
}

- (BOOL)isHighlighted
{
  return (*(_BYTE *)&self->_pickerContentViewFlags >> 1) & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_pickerContentViewFlags = *(_BYTE *)&self->_pickerContentViewFlags & 0xFD | v3;
}

- (double)labelWidthForBounds:(CGRect)a3
{
  return CGRectGetWidth(a3) + -43.0;
}

- (BOOL)_isSelectable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
