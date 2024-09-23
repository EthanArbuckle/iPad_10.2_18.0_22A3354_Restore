@implementation _UIDatePickerCalendarTimeView

- (_UIDatePickerCalendarTimeView)initWithFrame:(CGRect)a3
{
  _UIDatePickerCalendarTimeView *v3;
  uint64_t v4;
  NSCalendar *calendar;
  uint64_t v6;
  NSLocale *locale;
  _UIDatePickerCalendarTime *v8;
  void *v9;
  uint64_t v10;
  _UIDatePickerCalendarTime *selectedTime;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerCalendarTimeView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = objc_claimAutoreleasedReturnValue();
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v4;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v3->_locale;
    v3->_locale = (NSLocale *)v6;

    v3->_followsSystemHourCycle = 1;
    v3->_minuteInterval = 1;
    v8 = [_UIDatePickerCalendarTime alloc];
    v9 = (void *)objc_opt_new();
    v10 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v8, "initWithDate:calendar:", v9, v3->_calendar);
    selectedTime = v3->_selectedTime;
    v3->_selectedTime = (_UIDatePickerCalendarTime *)v10;

    -[_UIDatePickerCalendarTimeView _setupViewHierarchy](v3, "_setupViewHierarchy");
    -[_UIDatePickerCalendarTimeView _reloadDateFormatters](v3, "_reloadDateFormatters");
    -[_UIDatePickerCalendarTimeView _updateTextFieldsFromSelectedDateComponents](v3, "_updateTextFieldsFromSelectedDateComponents");
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerCalendarTimeView;
  -[UIView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (!a3)
  {
    -[_UIDatePickerCalendarTimeView timeLabel](self, "timeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    -[_UIDatePickerOverlayPresentation dismissPresentationAnimated:](self->_presentation, "dismissPresentationAnimated:", 0);
  }
}

- (void)willMoveToSuperview:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerCalendarTimeView;
  -[UIView willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (!a3)
  {
    -[_UIDatePickerCalendarTimeView timeLabel](self, "timeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    -[_UIDatePickerOverlayPresentation dismissPresentationAnimated:](self->_presentation, "dismissPresentationAnimated:", 0);
  }
}

- (void)_setupViewHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  _UIDatePickerCompactTimeLabel *v6;
  _UIDatePickerOverlayPresentation *v7;
  double v8;
  double v9;
  _UIDatePickerOverlayPresentation *presentation;
  _UIDatePickerOverlayPresentation *v11;
  void *v12;
  double v13;
  id v14;
  _UIDatePickerCompactTimeLabel *v15;
  void *v16;
  void *v17;
  id v18;
  id v19[7];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[_UIDatePickerCalendarTimeView calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDatePickerCalendarTimeFormat formatWithCalendar:locale:followsSystemHourCycle:](_UIDatePickerCalendarTimeFormat, "formatWithCalendar:locale:followsSystemHourCycle:", v3, v4, self->_followsSystemHourCycle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_UIDatePickerCompactTimeLabel initWithTimeFormat:minuteInterval:]([_UIDatePickerCompactTimeLabel alloc], "initWithTimeFormat:minuteInterval:", v5, -[_UIDatePickerCalendarTimeView minuteInterval](self, "minuteInterval"));
  v7 = -[_UIDatePickerOverlayPresentation initWithSourceView:]([_UIDatePickerOverlayPresentation alloc], "initWithSourceView:", self);
  -[_UIDatePickerOverlayPresentation setAlignment:](v7, "setAlignment:", 5);
  -[_UIDatePickerOverlayPresentation setOverlayAnchor:](v7, "setOverlayAnchor:", 1);
  -[_UIDatePickerCompactTimeLabel setOverlayPresentation:](v6, "setOverlayPresentation:", v7);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIDatePickerCompactTimeLabel setSelectionDelegate:](v6, "setSelectionDelegate:", self);
  LODWORD(v8) = 1148682240;
  -[UIView setContentHuggingPriority:forAxis:](v6, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1148682240;
  -[UIView setContentCompressionResistancePriority:forAxis:](v6, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  -[UIView addSubview:](self, "addSubview:", v6);
  objc_storeStrong((id *)&self->_timeTextField, v6);
  presentation = self->_presentation;
  self->_presentation = v7;
  v11 = v7;

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1144750080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v13);
  -[UIView addSubview:](self, "addSubview:", v12);
  objc_storeStrong((id *)&self->_timeLabel, v12);
  -[_UIDatePickerCalendarTimeView _updateTimeLabelTitleIfNeeded](self, "_updateTimeLabelTitleIfNeeded");
  -[_UIDatePickerCalendarTimeView _updateFonts](self, "_updateFonts");
  v19[0] = (id)MEMORY[0x1E0C809B0];
  v19[1] = (id)3221225472;
  v19[2] = __52___UIDatePickerCalendarTimeView__setupViewHierarchy__block_invoke;
  v19[3] = &unk_1E16C2A78;
  v19[4] = v6;
  v19[5] = self;
  v19[6] = v12;
  v14 = v12;
  v15 = v6;
  v16 = (void *)objc_opt_new();
  __52___UIDatePickerCalendarTimeView__setupViewHierarchy__block_invoke(v19, v16);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v16);

  -[_UIDatePickerCalendarTimeView _updateClockLayout](self, "_updateClockLayout");
  v20[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v17, sel__updateFonts);

}

- (void)setShouldShowTimeLabel:(BOOL)a3
{
  self->_shouldShowTimeLabel = a3;
  -[_UIDatePickerCalendarTimeView _updateClockLayout](self, "_updateClockLayout");
}

- (void)_updateClockLayout
{
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void (**v8)(void *, uint64_t);
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *clockLayoutConstraints;
  NSArray *v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  _UIDatePickerCalendarTimeView *v22;
  char v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_UIDatePickerCalendarTimeView shouldShowTimeLabel](self, "shouldShowTimeLabel");
  -[_UIDatePickerCalendarTimeView timeLabel](self, "timeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if (v3 == v5)
  {
    -[_UIDatePickerCalendarTimeView timeTextField](self, "timeTextField");
    v6 = objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarTimeView timeLabel](self, "timeLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3 ^ 1u);
    self->_showsTimeLabel = v3;
    if (self->_clockLayoutConstraints)
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51___UIDatePickerCalendarTimeView__updateClockLayout__block_invoke;
    aBlock[3] = &unk_1E16C2AA0;
    v23 = v3;
    v21 = v7;
    v22 = self;
    v19 = v7;
    v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v9 = (NSArray *)objc_opt_new();
    v8[2](v8, v6);
    v10 = (void *)v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v9, "addObjectsFromArray:", v11);

    objc_msgSend(v10, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v9, "addObjectsFromArray:", v16);

    clockLayoutConstraints = self->_clockLayoutConstraints;
    self->_clockLayoutConstraints = v9;
    v18 = v9;

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_clockLayoutConstraints);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _UIDatePickerCalendarTimeView *v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v12.receiver = self;
  v12.super_class = (Class)_UIDatePickerCalendarTimeView;
  v7 = a4;
  v8 = -[UIView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  -[_UIDatePickerCalendarTimeView timeTextField](v6, "timeTextField", v12.receiver, v12.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView timeTextField](v6, "timeTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](v6, "convertPoint:toView:", v10, x, y);
  LOBYTE(v6) = objc_msgSend(v9, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerCalendarTimeView;
  -[UIView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)setMinuteInterval:(int64_t)a3
{
  id v5;

  self->_minuteInterval = a3;
  -[_UIDatePickerCalendarTimeLabel setMinuteInterval:](self->_timeTextField, "setMinuteInterval:");
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinuteInterval:", a3);

}

- (void)setRoundsToMinuteInterval:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_roundsToMinuteInterval = a3;
  -[_UIDatePickerCalendarTimeLabel setRoundsToMinuteInterval:](self->_timeTextField, "setRoundsToMinuteInterval:");
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoundsToMinuteInterval:", v3);

}

- (void)_reloadDateFormatters
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIDatePickerCalendarTimeView timeTextField](self, "timeTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadWithCalendar:locale:followsSystemHourCycle:displaysTimeZone:", v4, v5, self->_followsSystemHourCycle, 0);

  -[_UIDatePickerCalendarTimeView _updateClockLayout](self, "_updateClockLayout");
}

- (void)_reload
{
  void *v3;
  _UIDatePickerCalendarTime *v4;
  _UIDatePickerCalendarTime *selectedTime;

  -[_UIDatePickerCalendarTimeView _updateClockLayout](self, "_updateClockLayout");
  -[_UIDatePickerCalendarTimeView timeTextField](self, "timeTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTime");
  v4 = (_UIDatePickerCalendarTime *)objc_claimAutoreleasedReturnValue();
  selectedTime = self->_selectedTime;
  self->_selectedTime = v4;

  -[_UIDatePickerCalendarTimeView _updateTextFieldsFromSelectedDateComponents](self, "_updateTextFieldsFromSelectedDateComponents");
}

- (void)reloadWithCalendar:(id)a3 locale:(id)a4 selectedDate:(id)a5
{
  -[_UIDatePickerCalendarTimeView reloadWithCalendar:locale:selectedDate:followsSystemHourCycle:](self, "reloadWithCalendar:locale:selectedDate:followsSystemHourCycle:", a3, a4, a5, 0);
}

- (void)reloadWithCalendar:(id)a3 locale:(id)a4 selectedDate:(id)a5 followsSystemHourCycle:(BOOL)a6
{
  id v12;
  id v13;
  NSCalendar **p_calendar;
  void *v15;
  NSLocale **p_locale;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarTimeView.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

  }
  p_calendar = &self->_calendar;
  objc_storeStrong((id *)&self->_calendar, a3);
  v15 = v12;
  if (!v12)
  {
    objc_msgSend(v19, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  p_locale = &self->_locale;
  objc_storeStrong((id *)&self->_locale, v15);
  if (!v12)

  self->_followsSystemHourCycle = a6;
  -[_UIDatePickerCalendarTimeView _updateTimeLabelTitleIfNeeded](self, "_updateTimeLabelTitleIfNeeded");
  -[_UIDatePickerCalendarTimeView _reloadDateFormatters](self, "_reloadDateFormatters");
  -[_UIDatePickerCalendarTimeView setSelectedDate:](self, "setSelectedDate:", v13);
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCalendar:", *p_calendar);
  objc_msgSend(v17, "setLocale:", *p_locale);

}

- (void)_updateTextFieldsFromSelectedDateComponents
{
  void *v3;
  void *v4;
  id v5;

  -[_UIDatePickerCalendarTimeView timeTextField](self, "timeTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView selectedTime](self, "selectedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadWithDate:", v4);

}

- (void)_updateTimeLabelTitleIfNeeded
{
  NSString *timeLocaleIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  char v9;
  NSString *v10;
  NSString *v11;
  id v12;

  timeLocaleIdentifier = self->_timeLocaleIdentifier;
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = timeLocaleIdentifier;
  v6 = v4;
  if (v5 == v6)
  {

    v12 = v5;
LABEL_11:

    return;
  }
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {

LABEL_10:
    -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_timeLocaleIdentifier;
    self->_timeLocaleIdentifier = v10;

    _UILocalizedStringWithDefaultValueInLanguage(CFSTR("ui.datepicker.time"), self->_timeLocaleIdentifier, CFSTR("Time"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarTimeView timeLabel](self, "timeLabel");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString setText:](v5, "setText:", v12);
    goto LABEL_11;
  }
  v9 = -[NSString isEqual:](v5, "isEqual:", v6);

  if ((v9 & 1) == 0)
    goto LABEL_10;
}

- (void)setSelectedDate:(id)a3
{
  id v4;
  _UIDatePickerCalendarTime *v5;
  _UIDatePickerCalendarTime *selectedTime;
  _UIDatePickerCalendarTime *v7;
  id v8;

  v4 = a3;
  v5 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:]([_UIDatePickerCalendarTime alloc], "initWithDate:calendar:", v4, self->_calendar);
  selectedTime = self->_selectedTime;
  self->_selectedTime = v5;
  v7 = v5;

  -[_UIDatePickerCalendarTimeView _updateTextFieldsFromSelectedDateComponents](self, "_updateTextFieldsFromSelectedDateComponents");
  -[_UIDatePickerOverlayPresentation activeDatePicker](self->_presentation, "activeDatePicker");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDate:", v4);
}

- (void)setCustomFontDesign:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_customFontDesign;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_customFontDesign, a3);
    -[_UIDatePickerCalendarTimeView _updateFonts](self, "_updateFonts");
  }
LABEL_9:

}

- (void)_updateFonts
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_customFontDesign;
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleBody"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "fontDescriptorWithDesign:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = *(_QWORD *)off_1E167DC18;
  v26[0] = *(_QWORD *)off_1E167DC20;
  v26[1] = v8;
  v27[0] = &unk_1E1A97530;
  v27[1] = &unk_1E1A97548;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)off_1E167DBE8;
  v23 = v9;
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerCalendarTimeView timeTextField](self, "timeTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  v16 = self->_customFontDesign;
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleBody"), v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    objc_msgSend(v17, "fontDescriptorWithDesign:", v16);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_msgSend(v18, "fontDescriptorWithSymbolicTraits:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v20, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerCalendarTimeView timeLabel](self, "timeLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

}

- (void)compactTimeLabel:(id)a3 didSelectTime:(id)a4
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_selectedTime, a4);
  -[_UIDatePickerCalendarTimeView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView selectedTime](self, "selectedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeView:didSelectTime:", self, v5);

}

- (void)compactTimeLabelWillBecomeFirstResponder:(id)a3
{
  id v4;

  -[_UIDatePickerCalendarTimeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeViewWillBecomeFirstResponder:", self);

}

- (void)compactTimeLabelDidBeginEditing:(id)a3
{
  id v4;

  -[_UIDatePickerCalendarTimeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeViewDidBeginEditing:", self);

}

- (void)compactTimeLabelDidEndEditing:(id)a3
{
  id v4;

  -[_UIDatePickerCalendarTimeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeViewDidEndEditing:", self);

}

- (BOOL)compactTimeLabel:(id)a3 shouldDismissForInteractionAtLocation:(CGPoint)a4
{
  return 1;
}

- (id)createDatePickerForCompactTimeLabel:(id)a3
{
  void *v4;
  void *v5;

  -[_UIDatePickerCalendarTimeView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDatePickerForTimeView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_UIDatePickerCalendarTimeViewDelegate)delegate
{
  return (_UIDatePickerCalendarTimeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)customFontDesign
{
  return self->_customFontDesign;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (BOOL)roundsToMinuteInterval
{
  return self->_roundsToMinuteInterval;
}

- (_UIDatePickerCalendarTime)selectedTime
{
  return self->_selectedTime;
}

- (BOOL)shouldShowTimeLabel
{
  return self->_shouldShowTimeLabel;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (_UIDatePickerCompactTimeLabel)timeTextField
{
  return self->_timeTextField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTextField, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_selectedTime, 0);
  objc_storeStrong((id *)&self->_customFontDesign, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_clockLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_timeLocaleIdentifier, 0);
}

@end
