@implementation UIDatePicker

- (UIDatePicker)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIDatePickerView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  _UIDatePickerView *v17;
  UIDatePicker *v18;
  uint64_t v19;
  _UIDatePickerDataModel *data;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (dyld_program_sdk_at_least())
  {
    v8 = (_UIDatePickerView *)objc_msgSend(objc_alloc((Class)_UIDatePickerClassForStyleAndMode(0, 2)), "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    -[UIView frame](v8, "frame");
    v10 = v9;
    v12 = v11;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      +[UIPickerView sizeForMainScreenTraitsThatFits:](_UIDatePickerView, "sizeForMainScreenTraitsThatFits:", width, height);
    else
      +[UIPickerView defaultSizeForMainScreenTraits](_UIDatePickerView, "defaultSizeForMainScreenTraits");
    v10 = v15;
    v12 = v16;
    v17 = [_UIDatePickerView alloc];
    -[UIView bounds](self, "bounds");
    v8 = -[_UIDatePickerView initWithFrame:](v17, "initWithFrame:");
  }
  v22.receiver = self;
  v22.super_class = (Class)UIDatePicker;
  v18 = -[UIControl initWithFrame:](&v22, sel_initWithFrame_, x, y, v10, v12);
  if (v18)
  {
    v19 = objc_opt_new();
    data = v18->_data;
    v18->_data = (_UIDatePickerDataModel *)v19;

    -[UIDatePicker _installPickerView:updatingSize:](v18, "_installPickerView:updatingSize:", v8, 1);
    -[UIDatePicker _setUpInitialValues](v18, "_setUpInitialValues");
    -[UIDatePicker _commonInit](v18, "_commonInit");
  }

  return v18;
}

- (UIDatePicker)initWithCoder:(id)a3
{
  id v4;
  UIDatePicker *v5;
  uint64_t v6;
  _UIDatePickerDataModel *data;
  int64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  UIDatePicker *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIDatePicker;
  v5 = -[UIControl initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    data = v5->_data;
    v5->_data = (_UIDatePickerDataModel *)v6;

    v5->_preferredDatePickerStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPickerStyle"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDatePickerMode")))
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDatePickerMode"));
    else
      v8 = 2;
    v9 = objc_alloc((Class)_UIDatePickerClassForStyleAndMode(v5->_preferredDatePickerStyle, v8));
    -[UIView bounds](v5, "bounds");
    v10 = (void *)objc_msgSend(v9, "initWithFrame:");
    -[UIDatePicker _installPickerView:updatingSize:](v5, "_installPickerView:updatingSize:", v10, 0);
    -[UIDatePicker setDatePickerMode:](v5, "setDatePickerMode:", v8);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILocale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setLocale:](v5, "setLocale:", v11);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITimeZone"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setTimeZone:](v5, "setTimeZone:", v12);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UICalendar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setCalendar:](v5, "setCalendar:", v13);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMinuteInterval")))
      v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIMinuteInterval"));
    else
      v14 = 1;
    -[UIDatePicker setMinuteInterval:](v5, "setMinuteInterval:", v14);
    if (-[UIDatePicker _isTimeIntervalMode](v5, "_isTimeIntervalMode"))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UICountDownDuration"));
      -[UIDatePicker setTimeInterval:](v5, "setTimeInterval:", v15);
    }
    else
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMinimumDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDatePicker setMinimumDate:](v5, "setMinimumDate:", v16);

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMaximumDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDatePicker setMaximumDate:](v5, "setMaximumDate:", v17);

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDatePicker setDate:](v5, "setDate:", v18);

    }
    -[UIDatePicker _setUpInitialValues](v5, "_setUpInitialValues");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDatePickerUseCurrentDateDuringDecoding")))
      -[UIDatePicker _setUseCurrentDateDuringDecoding:](v5, "_setUseCurrentDateDuringDecoding:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDatePickerUseCurrentDateDuringDecoding")));
    -[UIDatePicker _commonInit](v5, "_commonInit");
    v19 = v5;

  }
  return v5;
}

- (void)_commonInit
{
  void *v3;
  id v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  -[UIDatePicker _registerObservers](self, "_registerObservers");
  if (dyld_program_sdk_at_least())
  {
    v5[0] = 0x1E1A99498;
    v5[1] = 0x1E1A994F8;
    v5[2] = 0x1E1A99510;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v3, self, sel_invalidateIntrinsicContentSize);

  }
}

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDatePicker;
  -[NSObject awakeFromNib](&v4, sel_awakeFromNib);
  if (-[UIDatePicker _useCurrentDateDuringDecoding](self, "_useCurrentDateDuringDecoding"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setDate:](self, "setDate:", v3);

  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIDatePicker;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_pickerView)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t preferredDatePickerStyle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIDatePicker;
  -[UIControl encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  preferredDatePickerStyle = self->_preferredDatePickerStyle;
  if (preferredDatePickerStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", preferredDatePickerStyle, CFSTR("UIPickerStyle"));
  if (-[UIDatePicker datePickerMode](self, "datePickerMode") != UIDatePickerModeDateAndTime)
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIDatePicker datePickerMode](self, "datePickerMode"), CFSTR("UIDatePickerMode"));
  -[_UIDatePickerDataModel locale](self->_data, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIDatePickerDataModel locale](self->_data, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UILocale"));

  }
  -[UIDatePicker timeZone](self, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIDatePicker timeZone](self, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("UITimeZone"));

  }
  -[_UIDatePickerDataModel calendar](self->_data, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UIDatePickerDataModel calendar](self->_data, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("UICalendar"));

  }
  if (-[UIDatePicker _isTimeIntervalMode](self, "_isTimeIntervalMode"))
  {
    -[UIDatePicker timeInterval](self, "timeInterval");
    if (v12 != 0.0)
    {
      -[UIDatePicker timeInterval](self, "timeInterval");
      *(float *)&v13 = v13;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UICountDownDuration"), v13);
    }
  }
  else
  {
    -[UIDatePicker date](self, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[UIDatePicker date](self, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("UIDate"));

    }
    -[UIDatePicker minimumDate](self, "minimumDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[UIDatePicker minimumDate](self, "minimumDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("UIMinimumDate"));

    }
    -[UIDatePicker maximumDate](self, "maximumDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[UIDatePicker maximumDate](self, "maximumDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("UIMaximumDate"));

    }
  }
  if (-[UIDatePicker minuteInterval](self, "minuteInterval") != 1)
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIDatePicker minuteInterval](self, "minuteInterval"), CFSTR("UIMinuteInterval"));
  if (!-[UIDatePicker _useCurrentDateDuringDecoding](self, "_useCurrentDateDuringDecoding"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UIDatePicker _useCurrentDateDuringDecoding](self, "_useCurrentDateDuringDecoding"), CFSTR("UIDatePickerUseCurrentDateDuringDecoding"));

}

- (void)_setUpInitialValues
{
  void *v3;
  void *v4;
  void *v5;
  _UIDatePickerStyle *v6;
  _UIDatePickerStyle *style;

  -[UIDatePicker date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setDate:](self, "setDate:", v4);

  }
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (_UIDatePickerStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  self->_style = v6;

  self->_ignoresEmitValueChanged = 0;
  -[UIDatePicker _setUseCurrentDateDuringDecoding:](self, "_setUseCurrentDateDuringDecoding:", 1);
  if (dyld_program_sdk_at_least())
    -[UIView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
}

- (void)_registerObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__datePickerReset_, 0x1E175D120, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__todayChanged_, 0x1E1761B60, UIApp);

}

- (void)_datePickerReset:(id)a3
{
  _QWORD block[5];

  -[_UIDatePickerDataModel resetForCurrentLocaleOrCalendarChange](self->_data, "resetForCurrentLocaleOrCalendarChange", a3);
  -[_UIDatePickerViewComponent didReset](self->_pickerView, "didReset");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__UIDatePicker__datePickerReset___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __33__UIDatePicker__datePickerReset___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "didChangeCalendar");
}

- (void)_todayChanged:(id)a3
{
  -[_UIDatePickerViewComponent didChangeToday](self->_pickerView, "didChangeToday", a3);
}

- (void)_updatePickerViewIfNecessary
{
  id v3;
  id v4;

  v3 = _UIDatePickerClassForStyleAndMode(self->_preferredDatePickerStyle, -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode"));
  if (v3 != (id)objc_opt_class())
  {
    -[_UIDatePickerViewComponent removeFromSuperview](self->_pickerView, "removeFromSuperview");
    v4 = (id)objc_opt_new();
    -[UIDatePicker _installPickerView:updatingSize:](self, "_installPickerView:updatingSize:", v4, 1);
    -[UIDatePicker _setUpInitialValues](self, "_setUpInitialValues");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIDatePicker invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

  }
}

- (void)_installPickerView:(id)a3 updatingSize:(BOOL)a4
{
  _BOOL4 v4;
  id v8;
  _UIDatePickerViewComponent **p_pickerView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _UIDatePickerViewComponent *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  objc_super v27;
  _QWORD v28[5];

  v4 = a4;
  v28[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  p_pickerView = &self->_pickerView;
  objc_storeStrong((id *)&self->_pickerView, a3);
  -[_UIDatePickerViewComponent setDatePicker:](self->_pickerView, "setDatePicker:", self);
  if (!self->_data)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDatePicker.m"), 391, CFSTR("Installing picker view before data model has been created"));

  }
  -[_UIDatePickerDataModel setDatePickerStyle:](self->_data, "setDatePickerStyle:", objc_msgSend(v8, "datePickerStyle"));
  -[_UIDatePickerViewComponent setData:](*p_pickerView, "setData:", self->_data);
  -[_UIDatePickerViewComponent _setEnabled:](*p_pickerView, "_setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
  -[UIDatePicker _workaround66574039_updateLayoutMargins](self, "_workaround66574039_updateLayoutMargins");
  -[UIView addSubview:](self, "addSubview:", *p_pickerView);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[_UIDatePickerViewComponent usesAutoLayout](*p_pickerView, "usesAutoLayout") & 1) != 0)
  {
    -[_UIDatePickerViewComponent setTranslatesAutoresizingMaskIntoConstraints:](*p_pickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)MEMORY[0x1E0D156E0];
    -[_UIDatePickerViewComponent leadingAnchor](*p_pickerView, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v23;
    -[_UIDatePickerViewComponent trailingAnchor](*p_pickerView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v10;
    -[_UIDatePickerViewComponent topAnchor](*p_pickerView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v26 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v13;
    -[_UIDatePickerViewComponent bottomAnchor](*p_pickerView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v17);

    v4 = v26;
  }
  else
  {
    v18 = *p_pickerView;
    -[UIView bounds](self, "bounds");
    -[_UIDatePickerViewComponent setFrame:](v18, "setFrame:");
    -[_UIDatePickerViewComponent setAutoresizingMask:](*p_pickerView, "setAutoresizingMask:", 18);
  }
  v27.receiver = self;
  v27.super_class = (Class)UIDatePicker;
  -[UIView invalidateIntrinsicContentSize](&v27, sel_invalidateIntrinsicContentSize);
  if (v4)
    -[UIView sizeToFit](self, "sizeToFit");

}

- (UIDatePickerMode)datePickerMode
{
  return -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
}

- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode
{
  if (-[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode") != datePickerMode)
  {
    -[_UIDatePickerDataModel setDatePickerMode:](self->_data, "setDatePickerMode:", datePickerMode);
    -[UIDatePicker _updatePickerViewIfNecessary](self, "_updatePickerViewIfNecessary");
    -[_UIDatePickerViewComponent didChangeMode](self->_pickerView, "didChangeMode");
    if (dyld_program_sdk_at_least())
      -[UIDatePicker invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (NSLocale)locale
{
  void *v2;
  void *v3;

  -[_UIDatePickerDataModel locale](self->_data, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDatePickerUserLocaleForLocale(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v3;
}

- (void)setLocale:(NSLocale *)locale
{
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  _UIDatePickerStoredLocaleForLocale(locale);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel locale](self->_data, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v8 == v6)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIDatePickerDataModel setLocale:](self->_data, "setLocale:", v8);
    -[_UIDatePickerViewComponent didChangeLocale](self->_pickerView, "didChangeLocale");
  }
LABEL_9:

}

- (NSCalendar)calendar
{
  void *v2;
  void *v3;

  -[_UIDatePickerDataModel calendar](self->_data, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDatePickerUserCalendarForCalendar(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCalendar *)v3;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  void *v4;
  id v5;
  id v6;
  char v7;
  id v8;

  _UIDatePickerStoredCalendarForCalendar(calendar);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel calendar](self->_data, "calendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIDatePickerDataModel setCalendar:](self->_data, "setCalendar:", v8);
    -[_UIDatePickerViewComponent didChangeCalendar](self->_pickerView, "didChangeCalendar");
  }
LABEL_9:

}

- (NSTimeZone)timeZone
{
  return -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v4;
  NSTimeZone *v5;
  NSTimeZone *v6;
  char v7;
  NSTimeZone *v8;

  v4 = timeZone;
  -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
  v5 = (NSTimeZone *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSTimeZone isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIDatePickerDataModel setTimeZone:](self->_data, "setTimeZone:", v8);
    -[_UIDatePickerViewComponent didChangeTimeZone](self->_pickerView, "didChangeTimeZone");
  }
LABEL_9:

}

- (NSDate)date
{
  return -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
}

- (void)setDate:(NSDate *)date
{
  void *v4;
  _BOOL8 v5;
  NSDate *v6;

  v6 = date;
  -[UIView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  -[UIDatePicker setDate:animated:](self, "setDate:animated:", v6, v5);
}

- (NSDate)minimumDate
{
  return -[_UIDatePickerDataModel minimumDate](self->_data, "minimumDate");
}

- (void)setMinimumDate:(NSDate *)minimumDate
{
  NSDate *v4;
  NSDate *v5;
  NSDate *v6;
  char v7;
  NSDate *v8;
  void *v9;
  void *v10;
  char v11;
  NSDate *v12;

  v4 = minimumDate;
  -[_UIDatePickerDataModel minimumDate](self->_data, "minimumDate");
  v5 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

    v9 = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSDate isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerDataModel setMinimumDate:](self->_data, "setMinimumDate:", v12);
    -[_UIDatePickerViewComponent didChangeMinimumDate](self->_pickerView, "didChangeMinimumDate");
    -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToDate:", v10);

    if ((v11 & 1) == 0)
      -[UIDatePicker _updatePickerDateFromOldDate:animated:](self, "_updatePickerDateFromOldDate:animated:", v9, 0);
  }

  v8 = v12;
LABEL_11:

}

- (NSDate)maximumDate
{
  return -[_UIDatePickerDataModel maximumDate](self->_data, "maximumDate");
}

- (void)setMaximumDate:(NSDate *)maximumDate
{
  NSDate *v4;
  NSDate *v5;
  NSDate *v6;
  char v7;
  NSDate *v8;
  void *v9;
  void *v10;
  char v11;
  NSDate *v12;

  v4 = maximumDate;
  -[_UIDatePickerDataModel maximumDate](self->_data, "maximumDate");
  v5 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

    v9 = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSDate isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerDataModel setMaximumDate:](self->_data, "setMaximumDate:", v12);
    -[_UIDatePickerViewComponent didChangeMaximumDate](self->_pickerView, "didChangeMaximumDate");
    -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToDate:", v10);

    if ((v11 & 1) == 0)
      -[UIDatePicker _updatePickerDateFromOldDate:animated:](self, "_updatePickerDateFromOldDate:animated:", v9, 0);
  }

  v8 = v12;
LABEL_11:

}

- (NSInteger)minuteInterval
{
  return -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval");
}

- (void)setMinuteInterval:(NSInteger)minuteInterval
{
  if (-[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval") != minuteInterval)
  {
    -[_UIDatePickerDataModel setMinuteInterval:](self->_data, "setMinuteInterval:", minuteInterval);
    -[_UIDatePickerViewComponent didChangeMinuteInterval](self->_pickerView, "didChangeMinuteInterval");
  }
}

- (void)setDate:(NSDate *)date animated:(BOOL)animated
{
  _BOOL8 v4;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  NSDate *v13;

  v4 = animated;
  v6 = date;
  -[_UIDatePickerDataModel date](self->_data, "date");
  v7 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v13 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  if (v8 && v7)
  {
    v9 = -[NSDate isEqual:](v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    -[_UIDatePickerViewComponent displaySelectedDateAnimated:](self->_pickerView, "displaySelectedDateAnimated:", v4);
    goto LABEL_13;
  }

LABEL_9:
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", v13);
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToDate:", v11);

  if ((v12 & 1) != 0)
    -[_UIDatePickerViewComponent displaySelectedDateAnimated:](self->_pickerView, "displaySelectedDateAnimated:", v4);
  else
    -[UIDatePicker _updatePickerDateFromOldDate:animated:](self, "_updatePickerDateFromOldDate:animated:", v10, v4);

LABEL_13:
}

- (void)setPreferredDatePickerStyle:(UIDatePickerStyle)preferredDatePickerStyle
{
  if (self->_preferredDatePickerStyle != preferredDatePickerStyle)
  {
    self->_preferredDatePickerStyle = preferredDatePickerStyle;
    -[UIDatePicker _updatePickerViewIfNecessary](self, "_updatePickerViewIfNecessary");
  }
}

- (UIDatePickerStyle)datePickerStyle
{
  return -[_UIDatePickerDataModel datePickerStyle](self->_data, "datePickerStyle");
}

- (BOOL)roundsToMinuteInterval
{
  return -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval");
}

- (void)setRoundsToMinuteInterval:(BOOL)roundsToMinuteInterval
{
  _BOOL8 v3;

  v3 = roundsToMinuteInterval;
  if (-[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval") != roundsToMinuteInterval)
  {
    -[_UIDatePickerDataModel setRoundsToMinuteInterval:](self->_data, "setRoundsToMinuteInterval:", v3);
    -[_UIDatePickerViewComponent didChangeRoundsToMinuteInterval](self->_pickerView, "didChangeRoundsToMinuteInterval");
  }
}

- (BOOL)_selectionBarIgnoresInset
{
  return self->_datePickerViewFlags.selectionBarIgnoresInset != 0;
}

- (void)_setSelectionBarIgnoresInset:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_datePickerViewFlags.selectionBarIgnoresInset != a3)
  {
    v3 = a3;
    self->_datePickerViewFlags.selectionBarIgnoresInset = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_UIDatePickerViewComponent _setSelectionBarIgnoresInset:](self->_pickerView, "_setSelectionBarIgnoresInset:", v3);
  }
}

- (NSString)_customFontDesign
{
  return -[_UIDatePickerDataModel customFontDesign](self->_data, "customFontDesign");
}

- (void)_setCustomFontDesign:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[_UIDatePickerDataModel customFontDesign](self->_data, "customFontDesign");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v8 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UIDatePickerDataModel setCustomFontDesign:](self->_data, "setCustomFontDesign:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UIDatePickerViewComponent didChangeCustomFontDesign](self->_pickerView, "didChangeCustomFontDesign");
  }
LABEL_10:

}

- (UIEdgeInsets)_appliedInsetsToEdgeOfContent
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UIDatePickerViewComponent appliedInsetsToEdgeOfContent](self->_pickerView, "appliedInsetsToEdgeOfContent");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_useCurrentDateDuringDecoding
{
  return self->_useCurrentDateDuringDecoding;
}

- (void)_setUseCurrentDateDuringDecoding:(BOOL)a3
{
  self->_useCurrentDateDuringDecoding = a3;
}

- (double)_contentWidth
{
  double result;
  double v4;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[_UIDatePickerViewComponent usesAutoLayout](self->_pickerView, "usesAutoLayout") & 1) != 0
    || !-[_UIDatePickerViewComponent hasDefaultSize](self->_pickerView, "hasDefaultSize"))
  {
    -[UIView bounds](self, "bounds");
    return v4;
  }
  else
  {
    -[_UIDatePickerViewComponent contentWidth](self->_pickerView, "contentWidth");
  }
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return -[_UIDatePickerViewComponent _contentHuggingDefault_isUsuallyFixedHeight](self->_pickerView, "_contentHuggingDefault_isUsuallyFixedHeight");
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return -[_UIDatePickerViewComponent _contentHuggingDefault_isUsuallyFixedWidth](self->_pickerView, "_contentHuggingDefault_isUsuallyFixedWidth");
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  int v8;
  _UIDatePickerViewComponent *pickerView;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[_UIDatePickerViewComponent usesAutoLayout](self->_pickerView, "usesAutoLayout") & 1) != 0)
  {
    v6 = -1.0;
    v7 = -1.0;
  }
  else
  {
    v8 = -[_UIDatePickerViewComponent hasDefaultSize](self->_pickerView, "hasDefaultSize");
    pickerView = self->_pickerView;
    if (v8)
      -[_UIDatePickerViewComponent defaultSize](pickerView, "defaultSize");
    else
      -[_UIDatePickerViewComponent _sizeThatFits:](pickerView, "_sizeThatFits:", width, height);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[_UIDatePickerViewComponent usesAutoLayout](self->_pickerView, "usesAutoLayout"))
  {
    -[_UIDatePickerViewComponent systemLayoutSizeFittingSize:](self->_pickerView, "systemLayoutSizeFittingSize:", width, height);
  }
  else
  {
    -[UIDatePicker _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", width, height);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  objc_super v3;

  -[_UIDatePickerViewComponent invalidateIntrinsicContentSize](self->_pickerView, "invalidateIntrinsicContentSize");
  v3.receiver = self;
  v3.super_class = (Class)UIDatePicker;
  -[UIView invalidateIntrinsicContentSize](&v3, sel_invalidateIntrinsicContentSize);
}

- (void)traitCollectionDidChange:(id)a3
{
  if (dyld_program_sdk_at_least())
    -[UIDatePicker invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((UIViewIgnoresTouchEvents(self) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[_UIDatePickerViewComponent hitTest:withEvent:](self->_pickerView, "hitTest:withEvent:", v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDatePicker;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[UIDatePicker _workaround66574039_updateLayoutMargins](self, "_workaround66574039_updateLayoutMargins");
}

- (void)_workaround66574039_updateLayoutMargins
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDatePickerViewComponent _workaround66574039_datePickerDidUpdateLayoutMargins](self->_pickerView, "_workaround66574039_datePickerDidUpdateLayoutMargins");
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  void *v5;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDatePicker;
  -[UIControl setContentHorizontalAlignment:](&v7, sel_setContentHorizontalAlignment_);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[_UIDatePickerViewComponent setContentHorizontalAlignment:](self->_pickerView, "setContentHorizontalAlignment:", a3);
}

- (void)setBackgroundColor:(id)a3
{
  -[_UIDatePickerViewComponent setBackgroundColor:](self->_pickerView, "setBackgroundColor:", a3);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) == 0
    && self->_pickerView
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (-[_UIDatePickerViewComponent usesAutoLayout](self->_pickerView, "usesAutoLayout") & 1) == 0))
  {
    -[_UIDatePickerViewComponent _sizeThatFits:](self->_pickerView, "_sizeThatFits:", width, height);
    width = v8;
    height = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIDatePicker;
  -[UIView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) == 0
    && self->_pickerView
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (-[_UIDatePickerViewComponent usesAutoLayout](self->_pickerView, "usesAutoLayout") & 1) == 0))
  {
    -[_UIDatePickerViewComponent _sizeThatFits:](self->_pickerView, "_sizeThatFits:", width, height);
    width = v8;
    height = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIDatePicker;
  -[UIView setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIDatePicker;
  -[UIControl setEnabled:](&v5, sel_setEnabled_);
  -[_UIDatePickerViewComponent _setEnabled:](self->_pickerView, "_setEnabled:", v3);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)_emitBeginEditing
{
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x10000);
}

- (void)_emitValueChanged
{
  if (!self->_ignoresEmitValueChanged)
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_emitEndEditing
{
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x40000);
}

- (void)_updatePickerDateFromOldDate:(id)a3 animated:(BOOL)a4
{
  self->_ignoresEmitValueChanged = 1;
  -[_UIDatePickerViewComponent didChangeDateFrom:animated:](self->_pickerView, "didChangeDateFrom:animated:", a3, a4);
  self->_ignoresEmitValueChanged = 0;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x10) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDatePicker;
    -[UIControl _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[_UIDatePickerViewComponent primaryFirstResponder](self->_pickerView, "primaryFirstResponder"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "becomeFirstResponder");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDatePicker;
    return -[UIView becomeFirstResponder](&v7, sel_becomeFirstResponder);
  }
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[_UIDatePickerViewComponent primaryFirstResponder](self->_pickerView, "primaryFirstResponder"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "resignFirstResponder");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDatePicker;
    return -[UIResponder resignFirstResponder](&v7, sel_resignFirstResponder);
  }
}

+ (void)_prepareStyleStorageIfNecessary
{
  if (_prepareStyleStorageIfNecessary_once != -1)
    dispatch_once(&_prepareStyleStorageIfNecessary_once, &__block_literal_global_429);
}

void __47__UIDatePicker__prepareStyleStorageIfNecessary__block_invoke()
{
  uint64_t v0;
  void *v1;
  _UIDatePickerStyle_iOS *v2;

  v2 = objc_alloc_init(_UIDatePickerStyle_iOS);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__datePickerIdiomsToStyles;
  __datePickerIdiomsToStyles = v0;

}

+ (void)_registerStyle:(id)a3 forIdiom:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a1, "_prepareStyleStorageIfNecessary");
  v7 = (void *)__datePickerIdiomsToStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

}

+ (id)_styleForIdiom:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _UIDatePickerStyle_iOS *v6;
  _UIDatePickerStyle_iOS *v7;

  v3 = (void *)__datePickerIdiomsToStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = objc_alloc_init(_UIDatePickerStyle_iOS);
  v7 = v6;

  return v7;
}

- (void)_setCompactStyleDelegate:(id)a3
{
  void *v4;
  char isKindOfClass;
  _UIDatePickerViewComponent *v6;

  objc_storeWeak((id *)&self->__compactStyleDelegate, a3);
  v6 = self->_pickerView;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[_UIDatePickerViewComponent didChangeCompactStyleDelegate](v6, "didChangeCompactStyleDelegate");

}

- (_UIDatePickerCompactStyleDelegate)_compactStyleDelegate
{
  return (_UIDatePickerCompactStyleDelegate *)objc_loadWeakRetained((id *)&self->__compactStyleDelegate);
}

- (void)_compactStyleSetActiveComponent:(int64_t)a3
{
  void *v4;
  char isKindOfClass;
  _UIDatePickerViewComponent *v6;

  v6 = self->_pickerView;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[_UIDatePickerViewComponent setActiveComponent:](v6, "setActiveComponent:", a3);

}

- (NSDictionary)_overrideCompactTextAttributes
{
  _UIDatePickerViewComponent *v2;
  void *v3;
  char isKindOfClass;
  void *v5;

  v2 = self->_pickerView;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UIDatePickerViewComponent overrideAttributes](v2, "overrideAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)_setOverrideCompactTextAttributes:(id)a3
{
  _UIDatePickerViewComponent *v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v7 = a3;
  v4 = self->_pickerView;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[_UIDatePickerViewComponent setOverrideAttributes:](v4, "setOverrideAttributes:", v7);

}

- (void)_setDisplaysTimeZone:(BOOL)a3
{
  void *v3;
  char isKindOfClass;
  _UIDatePickerViewComponent *v5;

  if (self->__displaysTimeZone != a3)
  {
    self->__displaysTimeZone = a3;
    v5 = self->_pickerView;
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      -[_UIDatePickerViewComponent updateTimeZoneDisplay](v5, "updateTimeZoneDisplay");

  }
}

- (void)_setHidesLabels:(BOOL)a3
{
  _BOOL8 v3;
  _UIDatePickerViewComponent *pickerView;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setHidesLabels:](pickerView, "_setHidesLabels:", v3);
}

- (NSDate)_dateUnderSelectionBar
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _updateDateOrTime](pickerView, "_updateDateOrTime");
  return -[UIDatePicker date](self, "date");
}

- (BOOL)_isTimeIntervalMode
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return -[_UIDatePickerViewComponent _isTimeIntervalMode](pickerView, "_isTimeIntervalMode");
}

- (void)_setHighlightsToday:(BOOL)a3
{
  _BOOL8 v3;
  _UIDatePickerViewComponent *pickerView;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent setHighlightsToday:](pickerView, "setHighlightsToday:", v3);
}

- (BOOL)_allowsZeroCountDownDuration
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return -[_UIDatePickerViewComponent _allowsZeroCountDownDuration](pickerView, "_allowsZeroCountDownDuration");
}

- (void)_setAllowsZeroCountDownDuration:(BOOL)a3
{
  _BOOL8 v3;
  _UIDatePickerViewComponent *pickerView;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setAllowsZeroCountDownDuration:](pickerView, "_setAllowsZeroCountDownDuration:", v3);
}

- (BOOL)_allowsZeroTimeInterval
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return -[_UIDatePickerViewComponent _allowsZeroTimeInterval](pickerView, "_allowsZeroTimeInterval");
}

- (void)_setAllowsZeroTimeInterval:(BOOL)a3
{
  _BOOL8 v3;
  _UIDatePickerViewComponent *pickerView;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setAllowsZeroTimeInterval:](pickerView, "_setAllowsZeroTimeInterval:", v3);
}

- (UIColor)_highlightColor
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return (UIColor *)-[_UIDatePickerViewComponent _highlightColor](pickerView, "_highlightColor");
}

- (void)_setHighlightColor:(id)a3
{
  _UIDatePickerViewComponent *pickerView;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setHighlightColor:](pickerView, "_setHighlightColor:", v5);

}

- (UIColor)_textColor
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return (UIColor *)-[_UIDatePickerViewComponent _textColor](pickerView, "_textColor");
}

- (void)_setTextColor:(id)a3
{
  id v4;
  _UIDatePickerViewComponent *pickerView;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setTextColor:](pickerView, "_setTextColor:", v4);
  -[_UIDatePickerDataModel setCustomTextColor:](self->_data, "setCustomTextColor:", v4);

  -[_UIDatePickerViewComponent didReset](self->_pickerView, "didReset");
}

- (UIColor)_textShadowColor
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return (UIColor *)-[_UIDatePickerViewComponent _textShadowColor](pickerView, "_textShadowColor");
}

- (void)_setTextShadowColor:(id)a3
{
  _UIDatePickerViewComponent *pickerView;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setTextShadowColor:](pickerView, "_setTextShadowColor:", v5);

}

- (UIColor)_magnifierLineColor
{
  _UIDatePickerViewComponent *pickerView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  return (UIColor *)-[_UIDatePickerViewComponent _magnifierLineColor](pickerView, "_magnifierLineColor");
}

- (void)_setMagnifierLineColor:(id)a3
{
  _UIDatePickerViewComponent *pickerView;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    pickerView = self->_pickerView;
  else
    pickerView = 0;
  -[_UIDatePickerViewComponent _setMagnifierLineColor:](pickerView, "_setMagnifierLineColor:", v5);

}

- (double)timeInterval
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  -[_UIDatePickerViewComponent timeInterval](self->_pickerView, "timeInterval");
  return result;
}

- (void)setTimeInterval:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UIDatePickerViewComponent setTimeInterval:](self->_pickerView, "setTimeInterval:", a3);
}

- (id)_selectedTextForCalendarUnit:(unint64_t)a3
{
  return 0;
}

- (id)_labelTextForCalendarUnit:(unint64_t)a3
{
  return 0;
}

- (id)_lastSelectedDateComponents
{
  return -[_UIDatePickerDataModel lastSelectedDateComponents](self->_data, "lastSelectedDateComponents");
}

- (BOOL)_usesBlackChrome
{
  return 0;
}

- (BOOL)_drawsBackground
{
  return 1;
}

- (id)dateComponents
{
  void *v2;
  void *v3;

  -[_UIDatePickerDataModel lastSelectedDateComponents](self->_data, "lastSelectedDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (int)hour
{
  return 0;
}

- (int)minute
{
  return 0;
}

- (int)second
{
  return 0;
}

- (_UIDatePickerStyle)_style
{
  return self->_style;
}

- (UIDatePickerStyle)preferredDatePickerStyle
{
  return self->_preferredDatePickerStyle;
}

- (_UIDatePickerOverlayPresentation)_overlayPresentation
{
  return (_UIDatePickerOverlayPresentation *)objc_loadWeakRetained((id *)&self->__overlayPresentation);
}

- (void)set_overlayPresentation:(id)a3
{
  objc_storeWeak((id *)&self->__overlayPresentation, a3);
}

- (BOOL)_displaysTimeZone
{
  return self->__displaysTimeZone;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__overlayPresentation);
  objc_destroyWeak((id *)&self->__compactStyleDelegate);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
}

- (void)_performScrollTest:(id)a3 withIterations:(int64_t)a4 rowsToScroll:(int64_t)a5 inComponent:(int64_t)a6
{
  id v10;

  v10 = a3;
  if (-[_UIDatePickerViewComponent conformsToProtocol:](self->_pickerView, "conformsToProtocol:", &unk_1EDF32960))-[_UIDatePickerViewComponent _performScrollTest:withIterations:rowsToScroll:inComponent:](self->_pickerView, "_performScrollTest:withIterations:rowsToScroll:inComponent:", v10, a4, a5, a6);

}

@end
