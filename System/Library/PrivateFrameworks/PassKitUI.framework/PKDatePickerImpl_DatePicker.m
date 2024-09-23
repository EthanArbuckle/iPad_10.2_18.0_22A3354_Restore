@implementation PKDatePickerImpl_DatePicker

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  PKDatePickerImpl_DatePicker *v16;
  PKDatePickerImpl_DatePicker *v17;
  void *v18;
  void *v19;
  int v20;
  PKDatePickerImpl_DatePicker *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  objc_super v28;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v14 = a7;
  v15 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKDatePickerImpl_DatePicker;
  v16 = -[PKDatePickerImpl_DatePicker init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    -[PKDatePickerImpl_DatePicker setLocale:](v16, "setLocale:", v14);
    -[PKDatePickerImpl_DatePicker setCalendar:](v17, "setCalendar:", v15);
    -[PKDatePickerImpl_DatePicker setPreferredDatePickerStyle:](v17, "setPreferredDatePickerStyle:", 1);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.366, 0.366, 0.366, 1.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDatePickerImpl_DatePicker setBackgroundColor:](v17, "setBackgroundColor:", v18);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDatePickerImpl_DatePicker _setTextColor:](v17, "_setTextColor:", v19);

    }
    v20 = !v10;
    if (a3 && v11 && (v20 & 1) == 0)
    {
      v21 = v17;
      v22 = 1;
LABEL_12:
      -[PKDatePickerImpl_DatePicker setDatePickerMode:](v21, "setDatePickerMode:", v22);
      goto LABEL_13;
    }
    if (((!v11 | v20) & 1) == 0)
    {
      v21 = v17;
      v22 = 4;
      goto LABEL_12;
    }
    if (a3 && v11)
    {
      v21 = v17;
      v22 = 4270;
      goto LABEL_12;
    }
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99768];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "raise:format:", v24, CFSTR("%@ does not support the specified flags."), v26);

  }
LABEL_13:

  return v17;
}

- (NSDate)date
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDatePickerImpl_DatePicker;
  -[PKDatePickerImpl_DatePicker date](&v3, sel_date);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDatePickerImpl_DatePicker;
  -[PKDatePickerImpl_DatePicker setDate:](&v3, sel_setDate_, a3);
}

- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[PKDatePickerImpl_DatePicker removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", 0, 0, 4096);
  v6 = v7;
  if (v7 && a4)
  {
    -[PKDatePickerImpl_DatePicker addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v7, a4, 4096);
    v6 = v7;
  }

}

- (void)prepareToDie
{
  -[PKDatePickerImpl_DatePicker setDateValueChangedTarget:action:](self, "setDateValueChangedTarget:action:", 0, 0);
}

@end
