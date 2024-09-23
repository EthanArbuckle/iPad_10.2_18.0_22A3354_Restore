@implementation PKDatePickerImpl_DateOfBirthDatePicker

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKDatePickerImpl_DateOfBirthDatePicker;
  v8 = -[PKDatePickerImpl_DatePicker initShowingDay:month:year:useDarkAppearance:locale:calendar:](&v15, sel_initShowingDay_month_year_useDarkAppearance_locale_calendar_, a3, a4, a5, a6, a7, a8);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v10, "setYear:", -150);
    objc_msgSend(v8, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v10, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setMinimumDate:", v12);
    PKEndOfYear();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaximumDate:", v13);

  }
  return v8;
}

@end
