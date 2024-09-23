@implementation PKCalendarIconView

- (PKCalendarIconView)initWithDate:(id)a3 isDisabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PKCalendarIconView *v7;
  void *v8;
  UILabel *v9;
  UILabel *monthLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  UILabel *v14;
  NSString *v15;
  void *v16;
  UILabel *v17;
  UILabel *dayLabel;
  void *v19;
  uint64_t v20;
  UILabel *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a4;
  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKCalendarIconView;
  v7 = -[PKCalendarIconView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v7)
  {
    if (_MergedGlobals_3_2 != -1)
      dispatch_once(&_MergedGlobals_3_2, &__block_literal_global_13);
    objc_msgSend((id)qword_1EE4F8FE8, "stringFromDate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uppercaseString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)qword_1EE4F8FE0, "stringFromDate:", v6);
    v28 = objc_claimAutoreleasedReturnValue();
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    monthLabel = v7->_monthLabel;
    v7->_monthLabel = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v4)
    {
      objc_msgSend(v11, "colorWithAlphaComponent:", 0.5);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    -[UILabel setTextColor:](v7->_monthLabel, "setTextColor:", v12, v28);
    -[UILabel setTextAlignment:](v7->_monthLabel, "setTextAlignment:", 1);
    v14 = v7->_monthLabel;
    v15 = (NSString *)*MEMORY[0x1E0DC48D8];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC48D8], *MEMORY[0x1E0DC1430]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v16);

    -[UILabel setText:](v7->_monthLabel, "setText:", v30);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->_monthLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKCalendarIconView addSubview:](v7, "addSubview:", v7->_monthLabel);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dayLabel = v7->_dayLabel;
    v7->_dayLabel = v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v19, "colorWithAlphaComponent:", 0.5);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    -[UILabel setTextColor:](v7->_dayLabel, "setTextColor:", v19);
    -[UILabel setTextAlignment:](v7->_dayLabel, "setTextAlignment:", 1);
    v21 = v7->_dayLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B60], v15, *MEMORY[0x1E0DC1448]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    -[UILabel setText:](v7->_dayLabel, "setText:", v29);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->_dayLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKCalendarIconView addSubview:](v7, "addSubview:", v7->_dayLabel);
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UILabel text](v7->_monthLabel, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safelyAddObject:", v24);

    -[UILabel text](v7->_dayLabel, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safelyAddObject:", v25);

    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCalendarIconView setAccessibilityLabel:](v7, "setAccessibilityLabel:", v26);
    -[PKCalendarIconView setIsAccessibilityElement:](v7, "setIsAccessibilityElement:", 1);

  }
  return v7;
}

uint64_t __46__PKCalendarIconView_initWithDate_isDisabled___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1EE4F8FE0;
  qword_1EE4F8FE0 = (uint64_t)v0;

  v2 = (void *)qword_1EE4F8FE0;
  v3 = *MEMORY[0x1E0C996C8];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v4);

  objc_msgSend((id)qword_1EE4F8FE0, "setLocalizedDateFormatFromTemplate:", CFSTR("d"));
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v6 = (void *)qword_1EE4F8FE8;
  qword_1EE4F8FE8 = (uint64_t)v5;

  v7 = (void *)qword_1EE4F8FE8;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCalendar:", v8);

  return objc_msgSend((id)qword_1EE4F8FE8, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM"));
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCalendarIconView;
  -[PKCalendarIconView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCalendarIconView bounds](self, "bounds");
  -[PKCalendarIconView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCalendarIconView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MaxY;
  double v23;
  double v24;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v28;
  CGRect v29;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  remainder = a3;
  memset(&slice, 0, sizeof(slice));
  -[UILabel sizeThatFits:](self->_monthLabel, "sizeThatFits:", a3.size.width, 3.40282347e38);
  v11 = v10;
  -[UILabel sizeThatFits:](self->_dayLabel, "sizeThatFits:", width, 3.40282347e38);
  v13 = v12;
  v14 = fmax(height - (v11 + v12), 0.0) * 0.5;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGRectDivide(v28, &slice, &remainder, v14, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v11, CGRectMinYEdge);
  PKRectCenteredXInRect();
  v24 = v15;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinYEdge);
  PKRectCenteredXInRect();
  if (!v4)
  {
    -[UILabel setFrame:](self->_dayLabel, "setFrame:");
    -[UILabel setFrame:](self->_monthLabel, "setFrame:", v24, v17 + 2.0, v19, v21);
  }
  v29.origin.x = v24;
  v29.origin.y = v17 + 2.0;
  v29.size.width = v19;
  v29.size.height = v21;
  MaxY = CGRectGetMaxY(v29);
  v23 = width;
  result.height = MaxY;
  result.width = v23;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
}

@end
