@implementation PKDatePicker

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:(id)a3
{
  -[PKDatePicker setUsesDarkAppearance:](self, "setUsesDarkAppearance:", 1);
}

- (PKDatePicker)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PKDatePicker *v7;
  void *v8;
  void *v9;
  objc_super v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PKDatePicker;
  v7 = -[PKDatePicker initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDatePicker reconfigureToShowDay:month:year:style:locale:calendar:](v7, "reconfigureToShowDay:month:year:style:locale:calendar:", 1, 1, 1, 0, v8, v9);

    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    if (CGRectEqualToRect(v12, *MEMORY[0x1E0C9D648]))
      -[PKDatePicker sizeToFit](v7, "sizeToFit");
  }
  return v7;
}

- (PKDatePicker)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  PKDatePicker *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = a3;
  objc_msgSend(v4, "raise:format:", v5, CFSTR("This class is not NSCoding compliant."));
  v9.receiver = self;
  v9.super_class = (Class)PKDatePicker;
  v7 = -[PKDatePicker initWithCoder:](&v9, sel_initWithCoder_, v6);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[PKDatePickerInternalImplementationProtocol prepareToDie](self->_internalPicker, "prepareToDie");
  v3.receiver = self;
  v3.super_class = (Class)PKDatePicker;
  -[PKDatePicker dealloc](&v3, sel_dealloc);
}

- (void)reconfigureToShowDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 style:(unint64_t)a6 locale:(id)a7 calendar:(id)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  PKDatePickerInternalImplementationProtocol *internalPicker;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  PKDatePickerInternalImplementationProtocol *v22;
  PKDatePickerInternalImplementationProtocol *v23;
  void *v24;
  NSDate *v25;
  NSDate *date;
  id v27;
  id v28;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v28 = a7;
  v27 = a8;
  internalPicker = self->_internalPicker;
  if (!internalPicker
    || self->_showsDay != v13
    || self->_showsMonth != v12
    || self->_showsYear != v11
    || self->_style != a6)
  {
    -[PKDatePickerInternalImplementationProtocol date](internalPicker, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v20 = -[PKDatePicker _classForDay:month:year:style:](self, "_classForDay:month:year:style:", v13, v12, v11, a6);
    if (!v20)
    {
      v13 = 1;
      v21 = -[PKDatePicker _classForDay:month:year:style:](self, "_classForDay:month:year:style:", 1, 1, 1, 0);
      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to find an required PKDatePicker_Impl class."));
        goto LABEL_13;
      }
      v20 = v21;
      v12 = 1;
      v11 = 1;
    }
    -[PKDatePickerInternalImplementationProtocol removeFromSuperview](self->_internalPicker, "removeFromSuperview");
    -[PKDatePickerInternalImplementationProtocol prepareToDie](self->_internalPicker, "prepareToDie");
    v22 = (PKDatePickerInternalImplementationProtocol *)objc_msgSend([v20 alloc], "initShowingDay:month:year:useDarkAppearance:locale:calendar:", v13, v12, v11, self->_usesDarkAppearance, v28, v27);
    v23 = self->_internalPicker;
    self->_internalPicker = v22;

    -[PKDatePickerInternalImplementationProtocol setDateValueChangedTarget:action:](self->_internalPicker, "setDateValueChangedTarget:action:", self, sel__dateValueChanged_);
    -[PKDatePickerInternalImplementationProtocol setDate:](self->_internalPicker, "setDate:", v19);
    -[PKDatePicker addSubview:](self, "addSubview:", self->_internalPicker);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDatePicker setBackgroundColor:](self, "setBackgroundColor:", v24);

    -[PKDatePicker setNeedsDisplay](self, "setNeedsDisplay");
    -[PKDatePicker setNeedsLayout](self, "setNeedsLayout");
    self->_showsDay = v13;
    self->_showsMonth = v12;
    self->_showsYear = v11;
    self->_style = a6;
    objc_storeStrong((id *)&self->_locale, a7);
    objc_storeStrong((id *)&self->_calendar, a8);
    -[PKDatePickerInternalImplementationProtocol date](self->_internalPicker, "date");
    v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v25;

LABEL_13:
  }

}

- (void)setDate:(id)a3
{
  NSDate **p_date;
  id v6;

  p_date = &self->_date;
  objc_storeStrong((id *)&self->_date, a3);
  v6 = a3;
  -[PKDatePickerInternalImplementationProtocol setDate:](self->_internalPicker, "setDate:", *p_date);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDatePicker;
  v4 = a3;
  -[PKDatePicker setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[PKDatePickerInternalImplementationProtocol setBackgroundColor:](self->_internalPicker, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)setUsesDarkAppearance:(BOOL)a3
{
  if (self->_usesDarkAppearance != a3)
  {
    self->_usesDarkAppearance = a3;
    -[PKDatePicker _forceReloadInternalPicker](self, "_forceReloadInternalPicker");
  }
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
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKDatePicker;
  -[PKDatePicker layoutSubviews](&v14, sel_layoutSubviews);
  -[PKDatePicker bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaInsets");
    v10 = v10 - v13;

  }
  -[PKDatePickerInternalImplementationProtocol setFrame:](self->_internalPicker, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PKDatePickerInternalImplementationProtocol sizeThatFits:](self->_internalPicker, "sizeThatFits:", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v6 = v6 + v9;

  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PKDatePickerInternalImplementationProtocol intrinsicContentSize](self->_internalPicker, "intrinsicContentSize");
  v3 = v2;
  v5 = v4;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaInsets");
    v5 = v5 + v8;

  }
  v9 = v3;
  v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (Class)_classForDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 style:(unint64_t)a6
{
  _BOOL4 v6;
  _BOOL4 v7;

  v6 = a3 && a4;
  if (a6)
    v7 = 0;
  else
    v7 = a5;
  if (v6 && v7 || a6 == 2 && a3 && a4 && a5 || a6 == 1 && a4 && a5)
    return (Class)(id)objc_opt_class();
  if (!v6)
  {
    if (a6 || !a4 || !a5)
    {
      if ((a3 ^ a4) != 1 || a5)
      {
        if (!v7 || a3 || a4)
          return (Class)0;
      }
      else if (a6)
      {
        return (Class)0;
      }
    }
    return (Class)(id)objc_opt_class();
  }
  if (!a6)
    return (Class)(id)objc_opt_class();
  return (Class)0;
}

- (void)_dateValueChanged:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id WeakRetained;
  char v7;
  id v8;

  objc_msgSend(a3, "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "datePicker:didChangeDate:", self, self->_date);

  }
}

- (void)_forceReloadInternalPicker
{
  void *v3;
  void *v4;
  id v5;
  PKDatePickerInternalImplementationProtocol *internalPicker;
  id v7;

  -[PKDatePickerInternalImplementationProtocol date](self->_internalPicker, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  -[PKDatePickerInternalImplementationProtocol removeFromSuperview](self->_internalPicker, "removeFromSuperview");
  -[PKDatePickerInternalImplementationProtocol prepareToDie](self->_internalPicker, "prepareToDie");
  internalPicker = self->_internalPicker;
  self->_internalPicker = 0;

  -[PKDatePicker reconfigureToShowDay:month:year:style:locale:calendar:](self, "reconfigureToShowDay:month:year:style:locale:calendar:", self->_showsDay, self->_showsMonth, self->_showsYear, self->_style, self->_locale, self->_calendar);
  -[PKDatePicker setDate:](self, "setDate:", v7);

}

- (BOOL)showsDay
{
  return self->_showsDay;
}

- (BOOL)showsMonth
{
  return self->_showsMonth;
}

- (BOOL)showsYear
{
  return self->_showsYear;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)date
{
  return self->_date;
}

- (PKDatePickerDelegate)delegate
{
  return (PKDatePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)usesDarkAppearance
{
  return self->_usesDarkAppearance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_internalPicker, 0);
}

@end
