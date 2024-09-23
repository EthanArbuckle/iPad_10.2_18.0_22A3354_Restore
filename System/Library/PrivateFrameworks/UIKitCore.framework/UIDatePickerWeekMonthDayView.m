@implementation UIDatePickerWeekMonthDayView

- (UIDatePickerWeekMonthDayView)initWithFrame:(CGRect)a3
{
  UIDatePickerWeekMonthDayView *v3;
  void *v4;
  UILabel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *dateLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  UILabel *weekdayLabel;
  UILabel *v18;
  void *v19;
  UIColor *v20;
  void *v21;
  UIColor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  UIDatePickerWeekMonthDayView *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)UIDatePickerWeekMonthDayView;
  v3 = -[UIView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = [UILabel alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[UILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v10;

    v12 = v3->_dateLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = v3->_dateLabel;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v14, "setShadowColor:", v15);

    -[UILabel setShadowOffset:](v3->_dateLabel, "setShadowOffset:", 0.0, 1.0);
    v16 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    weekdayLabel = v3->_weekdayLabel;
    v3->_weekdayLabel = v16;

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_weekdayLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v18 = v3->_weekdayLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    if (!_MergedGlobals_15_3)
    {
      v20 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.45);
      v21 = (void *)_MergedGlobals_15_3;
      _MergedGlobals_15_3 = (uint64_t)v20;

    }
    -[UILabel setTextColor:](v3->_weekdayLabel, "setTextColor:");
    if (!qword_1ECD7C660)
    {
      v22 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5);
      v23 = (void *)qword_1ECD7C660;
      qword_1ECD7C660 = (uint64_t)v22;

    }
    -[UILabel setShadowColor:](v3->_weekdayLabel, "setShadowColor:");
    -[UILabel setShadowOffset:](v3->_weekdayLabel, "setShadowOffset:", 0.0, 1.0);
    if (!qword_1ECD7C668)
    {
      -[UIView traitCollection](v3, "traitCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v24, "userInterfaceIdiom"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView traitCollection](v3, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "centerCellFontWithTraitCollection:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)qword_1ECD7C668;
      qword_1ECD7C668 = v27;

    }
    -[UILabel setFont:](v3->_weekdayLabel, "setFont:");
    -[UILabel setTextAlignment:](v3->_weekdayLabel, "setTextAlignment:", 2);
    -[UIView addSubview:](v3, "addSubview:", v3->_dateLabel);
    -[UIView addSubview:](v3, "addSubview:", v3->_weekdayLabel);
    v29 = v3;
  }

  return v3;
}

- (BOOL)_canBeReusedInPickerView
{
  return 1;
}

- (void)setWeekdayWidth:(double)a3
{
  self->_weekdayWidth = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSString *formattedDateString;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double x;
  double MaxX;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double rect;
  double v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v59.size.height = *(CGFloat *)MEMORY[0x1E0C80C00];
  v3 = *((_DWORD *)&self->super._viewFlags + 4);
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1E0C9D538];
  v59.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_dateLabel, "textRectForBounds:limitedToNumberOfLines:", 1, v4);
  rect = v13;
  v15 = v14;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_weekdayLabel, "textRectForBounds:limitedToNumberOfLines:", 1, v5, v7, v9, v11);
  v56 = v16;
  v58 = v17;
  v18 = 4.0;
  if ((v3 & 0x80000) == 0)
  {
    if ((*(_BYTE *)&self->_datePickerWeekMonthDayViewFlags & 1) != 0)
    {
      v19 = *(double *)(v12 + 8);
      v60.origin.x = v5;
      v60.origin.y = v7;
      v60.size.width = v9;
      v60.size.height = v11;
      v20 = CGRectGetWidth(v60) - (self->_weekdayWidth + 2.0 + 5.0);
      v61.origin.x = v59.origin.x;
      v61.origin.y = v19;
      v61.size.width = rect;
      v61.size.height = v15;
      v18 = v20 - CGRectGetWidth(v61);
    }
    else
    {
      v18 = self->_weekdayWidth + 2.0 + 5.0;
    }
  }
  -[UILabel font](self->_dateLabel, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "capHeight");
  v23 = v22;

  v62.origin.x = v5;
  v62.origin.y = v7;
  v62.size.width = v9;
  v62.size.height = v11;
  v24 = v23 * 0.5 + CGRectGetMidY(v62);
  -[UILabel _baselineOffsetFromBottom](self->_dateLabel, "_baselineOffsetFromBottom");
  v55 = v24 + v25 - v15;
  -[UILabel _baselineOffsetFromBottom](self->_weekdayLabel, "_baselineOffsetFromBottom");
  v54 = v24 + v26 - v58;
  -[UILabel text](self->_weekdayLabel, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    if ((v3 & 0x80000) != 0)
    {
      v28 = v15;
      v18 = 4.0;
    }
    else
    {
      formattedDateString = self->_formattedDateString;
      v59.origin.y = *(CGFloat *)off_1E1678D90;
      -[UILabel font](self->_dateLabel, "font");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v59.size.width = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59.size, &v59.origin.y, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString sizeWithAttributes:](formattedDateString, "sizeWithAttributes:", v33);
      v35 = v34;

      v36 = v35 + self->_weekdayWidth + 2.0 + 5.0;
      v64.origin.x = v18;
      v64.origin.y = v55;
      v64.size.width = rect;
      v64.size.height = v15;
      v37 = v36 - CGRectGetWidth(v64);
      v65.origin.x = v37;
      v65.origin.y = v55;
      v65.size.width = rect;
      v28 = v15;
      v65.size.height = v15;
      if (CGRectGetMinX(v65) >= 7.0)
        v18 = v37;
      else
        v18 = 7.0;
    }
LABEL_17:
    v39 = v18;
    v41 = v55;
    v43 = rect;
    v45 = v28;
    x = v59.origin.x;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_datePickerWeekMonthDayViewFlags & 1) != 0)
  {
    v28 = v15;
    v66.origin.x = v5;
    v66.origin.y = v7;
    v66.size.width = v9;
    v66.size.height = v11;
    v30 = CGRectGetWidth(v66) - (self->_weekdayWidth + 2.0);
  }
  else if ((v3 & 0x80000) != 0)
  {
    v67.origin.x = v18;
    v67.origin.y = v55;
    v67.size.width = rect;
    v28 = v15;
    v67.size.height = v15;
    v30 = CGRectGetWidth(v67) + 2.0 + 5.0;
  }
  else
  {
    v28 = v15;
    v29 = self->_weekdayWidth + 2.0;
    v63.origin.x = v59.origin.x;
    v63.origin.y = v54;
    v63.size.width = v56;
    v63.size.height = v58;
    v30 = v29 - CGRectGetWidth(v63);
  }
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v39 = UIRectIntegralWithScale(v30, v54, v56, v58, v38);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v58 = v44;
  v59.origin.x = v39;
  v54 = v40;
  v56 = v42;
  x = v18;
  if ((*(_BYTE *)&self->_datePickerWeekMonthDayViewFlags & 1) == 0)
    goto LABEL_17;
LABEL_18:
  v68.origin.x = v39;
  v68.origin.y = v41;
  v68.size.width = v43;
  v68.size.height = v45;
  MaxX = CGRectGetMaxX(v68);
  -[UIView bounds](self, "bounds");
  if (MaxX > v48)
  {
    v69.origin.x = v39;
    v69.origin.y = v41;
    v69.size.width = v43;
    v69.size.height = v45;
    v49 = CGRectGetMaxX(v69);
    -[UIView bounds](self, "bounds");
    v51 = v49 - v50;
    if (x - (v49 - v50) < 0.0)
      v51 = x;
    v52 = 0.0;
    if (v27)
      v52 = v51;
    v59.origin.x = v59.origin.x - v52;
    v18 = v18 - v51;
  }
  if (v27)
    -[UILabel setFrame:](self->_weekdayLabel, "setFrame:", v59.origin.x, v54, v56, v58);
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  -[UILabel setFrame:](self->_dateLabel, "setFrame:", UIRectIntegralWithScale(v18, v55, rect, v28, v53));
}

- (BOOL)weekdayLast
{
  return *(_BYTE *)&self->_datePickerWeekMonthDayViewFlags & 1;
}

- (void)setWeekdayLast:(BOOL)a3
{
  *(_BYTE *)&self->_datePickerWeekMonthDayViewFlags = *(_BYTE *)&self->_datePickerWeekMonthDayViewFlags & 0xFE | a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (NSString)formattedDateString
{
  return self->_formattedDateString;
}

- (void)setFormattedDateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (double)weekdayWidth
{
  return self->_weekdayWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDateString, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
