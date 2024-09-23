@implementation UIDatePickerContentView

- (UIDatePickerContentView)initWithMode:(id)a3
{
  id v4;
  UIDatePickerContentView *v5;
  UIDatePickerContentView *v6;
  UIDatePickerContentView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDatePickerContentView;
  v5 = -[UIView init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIDatePickerContentView setMode:](v5, "setMode:", v4);
    v7 = v6;
  }

  return v6;
}

- (UIDatePickerContentView)initWithFrame:(CGRect)a3
{
  UIDatePickerContentView *v3;
  void *v4;
  UILabel *v5;
  uint64_t v6;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  UIDatePickerContentView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIDatePickerContentView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_titleLabelMaxX = -1.0;
    v5 = [UILabel alloc];
    v6 = -[UILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    +[UIColor whiteColor](UIColor, "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v3->_titleLabel, "setShadowColor:", v8);

    -[UILabel setShadowOffset:](v3->_titleLabel, "setShadowOffset:", 0.0, 1.0);
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", v9);

    -[UIView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v10 = v3;
  }

  return v3;
}

- (BOOL)_canBeReusedInPickerView
{
  return 1;
}

- (BOOL)isAmPm
{
  return *(_BYTE *)&self->_datePickerContentViewFlags & 1;
}

- (void)setIsAmPm:(BOOL)a3
{
  *(_BYTE *)&self->_datePickerContentViewFlags = *(_BYTE *)&self->_datePickerContentViewFlags & 0xFE | a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)useDigitFont
{
  return (*(_BYTE *)&self->_datePickerContentViewFlags >> 1) & 1;
}

- (void)setUseDigitFont:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_datePickerContentViewFlags = *(_BYTE *)&self->_datePickerContentViewFlags & 0xFD | v3;
}

- (void)setTitleLabelMaxX:(double)a3
{
  self->_titleLabelMaxX = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleAlignment:(int64_t)a3
{
  self->_titleAlignment = a3;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t titleAlignment;
  double titleLabelMaxX;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD v35[2];
  CGRect v36;
  CGRect v37;

  v35[1] = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_titleLabel, "textRectForBounds:limitedToNumberOfLines:", 1);
  v12 = v11;
  v14 = v13;
  titleAlignment = self->_titleAlignment;
  if (titleAlignment == 2)
  {
    v34 = *(_QWORD *)off_1E1678D90;
    -[UILabel font](self->_titleLabel, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("00"), "sizeWithAttributes:", v19);
    v21 = v20;

    -[UILabel text](self->_titleLabel, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v21 > v12 && v23 < 3)
      v12 = v21;
    v17 = 0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
    {
      -[UIDatePickerContentView mode](self, "mode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isTimeIntervalMode");

      if (v26)
        v17 = v8 - v12 + 0.0;
      else
        v17 = 0.0;
    }
  }
  else if (titleAlignment)
  {
    v17 = round(v4 + (v8 - v11) * 0.5);
  }
  else
  {
    titleLabelMaxX = self->_titleLabelMaxX;
    if (titleLabelMaxX == -1.0)
    {
      v36.origin.x = v4;
      v36.origin.y = v6;
      v36.size.width = v8;
      v36.size.height = v10;
      titleLabelMaxX = CGRectGetMaxX(v36);
    }
    v17 = 9.0;
    if (titleLabelMaxX <= 9.0)
      v12 = 0.0;
    else
      v12 = titleLabelMaxX + -9.0;
  }
  -[UILabel font](self->_titleLabel, "font");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "capHeight");
  v29 = v28;

  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  v30 = v29 * 0.5 + CGRectGetMidY(v37);
  -[UILabel _baselineOffsetFromBottom](self->_titleLabel, "_baselineOffsetFromBottom");
  v32 = v30 + v31 - v14;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", UIRectIntegralWithScale(v17, v32, v12, v14, v33));
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (double)titleLabelMaxX
{
  return self->_titleLabelMaxX;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (_UIDatePickerMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
