@implementation _UIDatePickerCompactTimeLabel

- (_UIDatePickerCompactTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  _UIDatePickerCompactTimeLabel *v4;
  _UIDatePickerCompactTimeLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIPointerInteraction *v24;
  UIPointerInteraction *pointerInteraction;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSDateFormatter *formatter;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  NSTextContentStorage *textContentStorage;
  _UITextKit2LayoutController *v53;
  _UITextLayoutController *textLayoutController;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  objc_super v81;
  _QWORD v82[10];

  v82[8] = *MEMORY[0x1E0C80C00];
  v81.receiver = self;
  v81.super_class = (Class)_UIDatePickerCompactTimeLabel;
  v4 = -[_UIDatePickerCalendarTimeLabel initWithTimeFormat:minuteInterval:](&v81, sel_initWithTimeFormat_minuteInterval_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    -[UIView traitCollection](v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerFontWithMonospacedNumbers((uint64_t)CFSTR("UICTFontTextStyleBody"), (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v8);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v9);

    LODWORD(v10) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    objc_storeStrong((id *)&v5->_label, v6);
    -[UIView traitCollection](v5, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v12, "userInterfaceIdiom"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "compactLabelCornerRadius");
    -[UIView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
    objc_msgSend(v80, "compactLabelBackgroundButtonConfiguration");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setConfigurationUpdateHandler:", &__block_literal_global_14_6);
    objc_msgSend(v13, "setPreferredBehavioralStyle:", 1);
    -[UIView addSubview:](v5, "addSubview:", v13);
    objc_storeStrong((id *)&v5->_backgroundView, v13);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "_setContinuousCornerRadius:", 4.0);
    objc_msgSend(v14, "setUserInteractionEnabled:", 0);
    objc_storeStrong((id *)&v5->_inputBackgroundView, v14);
    v76 = v14;
    objc_msgSend(v13, "addSubview:", v14);
    objc_msgSend(v13, "addSubview:", v6);
    v15 = (void *)objc_opt_new();
    -[UIView traitCollection](v5, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerFontWithMonospacedNumbers((uint64_t)CFSTR("UICTFontTextStyleBody"), (uint64_t)v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v17);

    objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v15, "setHidden:", 1);
    objc_storeStrong((id *)&v5->_hourLabel, v15);
    v18 = (void *)objc_opt_new();
    -[UIView traitCollection](v5, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerFontWithMonospacedNumbers((uint64_t)CFSTR("UICTFontTextStyleBody"), (uint64_t)v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v20);

    objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v18, "setHidden:", 1);
    objc_storeStrong((id *)&v5->_minuteLabel, v18);
    v21 = (void *)objc_opt_new();
    -[UIView traitCollection](v5, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDatePickerFontWithMonospacedNumbers((uint64_t)CFSTR("UICTFontTextStyleBody"), (uint64_t)v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v23);

    objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v21, "setHidden:", 1);
    objc_storeStrong((id *)&v5->_timeOfDayLabel, v21);
    v75 = v15;
    objc_msgSend(v13, "addSubview:", v15);
    v74 = v18;
    objc_msgSend(v13, "addSubview:", v18);
    v73 = v21;
    objc_msgSend(v13, "addSubview:", v21);
    v24 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v5);
    pointerInteraction = v5->_pointerInteraction;
    v5->_pointerInteraction = v24;

    -[UIView addInteraction:](v5, "addInteraction:", v5->_pointerInteraction);
    -[_UIDatePickerCompactTimeLabel _updateEnabledStyling](v5, "_updateEnabledStyling");
    objc_msgSend(v80, "compactLabelBackgroundPadding");
    v27 = v26;
    v29 = v28;
    v63 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](v5, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -v29);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v70;
    -[UIView leadingAnchor](v5, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, -v27);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v67;
    -[UIView bottomAnchor](v5, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, v29);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v64;
    -[UIView trailingAnchor](v5, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v6;
    objc_msgSend(v6, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, v27);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v82[3] = v60;
    objc_msgSend(v13, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v5, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v82[4] = v57;
    objc_msgSend(v13, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v5, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v82[5] = v31;
    objc_msgSend(v13, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v5, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v82[6] = v34;
    v77 = v13;
    objc_msgSend(v13, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v5, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v82[7] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "activateConstraints:", v38);

    -[_UIDatePickerCalendarTimeLabel setDelegate:](v5, "setDelegate:", v5);
    v39 = (void *)objc_opt_new();
    objc_msgSend(v39, "setControlEventsDelegate:", v5);
    objc_msgSend(v39, "setDelegate:", v5);
    -[UIView addGestureRecognizer:](v5, "addGestureRecognizer:", v39);
    v40 = objc_opt_new();
    formatter = v5->_formatter;
    v5->_formatter = (NSDateFormatter *)v40;

    -[NSDateFormatter setLenient:](v5->_formatter, "setLenient:", 1);
    v42 = (void *)MEMORY[0x1E0CB3940];
    -[_UIDatePickerCalendarTimeLabel timeFormat](v5, "timeFormat");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hourFormat");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR("%@~~mm"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerCalendarTimeLabel timeFormat](v5, "timeFormat");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "clockLayout");

    if (v47)
    {
      objc_msgSend(v45, "stringByAppendingString:", CFSTR("~~a"));
      v48 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v48;
    }
    -[NSDateFormatter setDateFormat:](v5->_formatter, "setDateFormat:", v45);
    v49 = objc_alloc((Class)off_1E1679D30);
    v50 = (void *)objc_msgSend(v49, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v50, "setLineFragmentPadding:", 0.0);
    v51 = objc_opt_new();
    textContentStorage = v5->_textContentStorage;
    v5->_textContentStorage = (NSTextContentStorage *)v51;

    v53 = -[_UITextKit2LayoutController initWithTextView:textContentStorage:textContainer:]([_UITextKit2LayoutController alloc], "initWithTextView:textContentStorage:textContainer:", 0, v5->_textContentStorage, v50);
    textLayoutController = v5->_textLayoutController;
    v5->_textLayoutController = (_UITextLayoutController *)v53;

  }
  return v5;
}

- (CGRect)hourRect
{
  CGRect *p_hourRect;
  CGFloat x;
  CGFloat width;
  double Height;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  p_hourRect = &self->_hourRect;
  -[UIView bounds](self, "bounds");
  x = p_hourRect->origin.x;
  width = p_hourRect->size.width;
  Height = CGRectGetHeight(v9);
  v6 = 0.0;
  v7 = x;
  v8 = width;
  result.size.height = Height;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (CGRect)minuteRect
{
  CGRect *p_minuteRect;
  CGFloat x;
  CGFloat width;
  double Height;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  p_minuteRect = &self->_minuteRect;
  -[UIView bounds](self, "bounds");
  x = p_minuteRect->origin.x;
  width = p_minuteRect->size.width;
  Height = CGRectGetHeight(v9);
  v6 = 0.0;
  v7 = x;
  v8 = width;
  result.size.height = Height;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (CGRect)timeOfDayRect
{
  CGRect *p_timeOfDayRect;
  CGFloat x;
  CGFloat width;
  double Height;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  p_timeOfDayRect = &self->_timeOfDayRect;
  -[UIView bounds](self, "bounds");
  x = p_timeOfDayRect->origin.x;
  width = p_timeOfDayRect->size.width;
  Height = CGRectGetHeight(v9);
  v6 = 0.0;
  v7 = x;
  v8 = width;
  result.size.height = Height;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[_UIDatePickerCompactTimeLabel _updateTextContentStorage](self, "_updateTextContentStorage");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)font
{
  void *v2;
  void *v3;

  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[_UIDatePickerCompactTimeLabel _updateEnabledStyling](self, "_updateEnabledStyling");
}

- (void)_updateEnabledStyling
{
  _BOOL8 v3;
  void *v4;

  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[_UIDatePickerCompactTimeLabel isEnabled](self, "isEnabled"));
  v3 = -[_UIDatePickerCompactTimeLabel isEnabled](self, "isEnabled");
  -[_UIDatePickerCompactTimeLabel backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
}

- (BOOL)adjustsFontSizeToFitWidth
{
  void *v2;
  char v3;

  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adjustsFontSizeToFitWidth");

  return v3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", v3);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (double)minimumScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumScaleFactor");
  v4 = v3;

  return v4;
}

- (void)setMinimumScaleFactor:(double)a3
{
  void *v5;

  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumScaleFactor:", a3);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setOverrideAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overrideAttributes, a3);
  -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
}

- (void)applyTextAttributesForState:(unint64_t)a3 inputScope:(int64_t)a4 updater:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void (*v11)(id, void *, void *, void *, void *);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  objc_super v18;

  v8 = a5;
  if (a3 <= 0xA && ((1 << a3) & 0x602) != 0)
  {
    -[_UIDatePickerCalendarTimeLabel applyTextAttributesForState:inputScope:updater:](&v18, sel_applyTextAttributesForState_inputScope_updater_, a3, a4, v8, v17.receiver, v17.super_class, self, _UIDatePickerCompactTimeLabel);
  }
  else
  {
    switch(a4)
    {
      case 0:
        -[_UIDatePickerCalendarTimeLabel applyTextAttributesForState:inputScope:updater:](&v17, sel_applyTextAttributesForState_inputScope_updater_, a3, 0, v8, self, _UIDatePickerCompactTimeLabel, v18.receiver, v18.super_class);
        break;
      case 1:
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, v9, 0, 0, 0);
        goto LABEL_13;
      case 2:
        +[UIColor labelColor](UIColor, "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void (*)(id, void *, void *, void *, void *))*((_QWORD *)v8 + 2);
        v12 = v8;
        v13 = v9;
        v14 = v10;
        v15 = 0;
        goto LABEL_10;
      case 3:
        +[UIColor labelColor](UIColor, "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void (*)(id, void *, void *, void *, void *))*((_QWORD *)v8 + 2);
        v12 = v8;
        v13 = v9;
        v14 = 0;
        v15 = v10;
LABEL_10:
        v16 = 0;
        goto LABEL_12;
      case 4:
        +[UIColor labelColor](UIColor, "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void (*)(id, void *, void *, void *, void *))*((_QWORD *)v8 + 2);
        v12 = v8;
        v13 = v9;
        v14 = 0;
        v15 = 0;
        v16 = v10;
LABEL_12:
        v11(v12, v13, v14, v15, v16);

LABEL_13:
        break;
      default:
        break;
    }
  }

}

- (void)_gestureRecognizerFailed:(id)a3
{
  objc_msgSend(a3, "gestureRecognizerFailed");
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  double v7;
  double v8;
  _UIDatePickerCompactTimeLabel *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "locationInView:", self);
  if ((uint64_t)a4 > 63)
  {
    if (a4 == 64)
    {
      -[_UIDatePickerCompactTimeLabel _activateCompactLabelForGestureRecognizer:](self, "_activateCompactLabelForGestureRecognizer:", v16);
    }
    else if (a4 != 128 && a4 != 256)
    {
      goto LABEL_18;
    }
    -[_UIDatePickerCompactTimeLabel setHighlightedForTouch:](self, "setHighlightedForTouch:", 0);
    objc_storeWeak((id *)&self->_touchHighlightedView, 0);
    goto LABEL_18;
  }
  switch(a4)
  {
    case 1uLL:
      v11 = v7;
      v12 = v8;
      objc_msgSend(v16, "activeTouch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_isPointerTouch");

      if ((v14 & 1) != 0)
        -[_UIDatePickerCompactTimeLabel _viewForInputScope:](self, "_viewForInputScope:", -[_UIDatePickerCompactTimeLabel _inputScopeForPointerLocation:](self, "_inputScopeForPointerLocation:", v11, v12));
      else
        -[_UIDatePickerCompactTimeLabel label](self, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_touchHighlightedView, v15);

      goto LABEL_16;
    case 0x10uLL:
LABEL_16:
      v9 = self;
      v10 = 1;
      goto LABEL_17;
    case 0x20uLL:
      v9 = self;
      v10 = 0;
LABEL_17:
      -[_UIDatePickerCompactTimeLabel setHighlightedForTouch:](v9, "setHighlightedForTouch:", v10);
      break;
  }
LABEL_18:

}

- (void)setHighlightedForTouch:(BOOL)a3
{
  char flags;
  _BOOL4 v4;
  char v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;

  flags = (char)self->_flags;
  if (((((flags & 4) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)&self->_flags = flags & 0xFB | v5;
    v6 = objc_loadWeakRetained((id *)&self->_touchHighlightedView);
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle") == 2;
    if (v4)
      v9 = dbl_186679260[v8];
    else
      v9 = 1.0;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___UIDateLabelAnimateHighlight_block_invoke_0;
    v11[3] = &unk_1E16B1888;
    v12 = v6;
    v13 = v9;
    v10 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v11, 0, 0.47, 0.0);

  }
}

- (void)_updateHoverStateLabelsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  switch(self->_highlightedScope)
  {
    case 0:
    case 1:
      -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 1;
      goto LABEL_4;
    case 2:
      -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 0;
LABEL_4:
      objc_msgSend(v3, "setHidden:", v5);

      -[_UIDatePickerCompactTimeLabel minuteLabel](self, "minuteLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 1;
      goto LABEL_6;
    case 3:
      -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[_UIDatePickerCompactTimeLabel minuteLabel](self, "minuteLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 0;
LABEL_6:
      objc_msgSend(v6, "setHidden:", v8);

      -[_UIDatePickerCompactTimeLabel timeOfDayLabel](self, "timeOfDayLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      v11 = 1;
      goto LABEL_8;
    case 4:
      -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 1);

      -[_UIDatePickerCompactTimeLabel minuteLabel](self, "minuteLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      -[_UIDatePickerCompactTimeLabel timeOfDayLabel](self, "timeOfDayLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      v11 = 0;
LABEL_8:
      objc_msgSend(v10, "setHidden:", v11);

      break;
    default:
      return;
  }
}

- (id)updateHoverLabelForAttributedString:(id)a3 ranges:(id *)a4
{
  void *v6;
  int64_t highlightedScope;
  NSUInteger *p_length;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t *v14;
  NSUInteger location;
  void *v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  -[_UIDatePickerCompactTimeLabel _updateHoverStateLabelsIfNeeded](self, "_updateHoverStateLabelsIfNeeded");
  highlightedScope = self->_highlightedScope;
  switch(highlightedScope)
  {
    case 4:
      location = a4->var2.location;
      a4 = ($DC75B83A38D1E5958721062B283D6977 *)((char *)a4 + 32);
      p_length = &a4->var0.length;
      objc_msgSend(v6, "attributedSubstringFromRange:", location, a4->var0.length);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerCompactTimeLabel timeOfDayLabel](self, "timeOfDayLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributedText:", v16);

      v23 = *(_QWORD *)off_1E1678D98;
      +[UIColor clearColor](UIColor, "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v11;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v24;
      v14 = &v23;
      goto LABEL_7;
    case 3:
      v18 = a4->var1.location;
      a4 = ($DC75B83A38D1E5958721062B283D6977 *)((char *)a4 + 16);
      p_length = &a4->var0.length;
      objc_msgSend(v6, "attributedSubstringFromRange:", v18, a4->var0.length);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerCompactTimeLabel minuteLabel](self, "minuteLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAttributedText:", v19);

      v25 = *(_QWORD *)off_1E1678D98;
      +[UIColor clearColor](UIColor, "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v26;
      v14 = &v25;
      goto LABEL_7;
    case 2:
      p_length = &a4->var0.length;
      objc_msgSend(v6, "attributedSubstringFromRange:", a4->var0.location, a4->var0.length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributedText:", v9);

      v27 = *(_QWORD *)off_1E1678D98;
      +[UIColor clearColor](UIColor, "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v11;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (void **)v28;
      v14 = &v27;
LABEL_7:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAttributes:range:", v21, a4->var0.location, *p_length);

      break;
  }
  return v6;
}

- (void)pushCurrentStateIntoUI
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIDatePickerCalendarTimeLabel attributedTextWithRanges:](self, "attributedTextWithRanges:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIDatePickerCompactTimeLabel overrideAttributes](self, "overrideAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_msgSend(v4, "length");
    -[_UIDatePickerCompactTimeLabel overrideAttributes](self, "overrideAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAttributes:range:", v8, 0, v7);

  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v11 = v15;
    v12 = v16;
    v13 = v17;
    v14 = v18;
    -[_UIDatePickerCompactTimeLabel updateHoverLabelForAttributedString:ranges:](self, "updateHoverLabelForAttributedString:ranges:", v4, &v11);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v4);

  v11 = v15;
  v12 = v16;
  v13 = v17;
  v14 = v18;
  -[_UIDatePickerCompactTimeLabel _updateLayoutRectsForRanges:](self, "_updateLayoutRectsForRanges:", &v11);
  -[_UIDatePickerCompactTimeLabel _updateInputFieldLayoutForCurrentState](self, "_updateInputFieldLayoutForCurrentState");

}

- (void)pushCurrentStateIntoUIAndNotify
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerCompactTimeLabel;
  -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUIAndNotify](&v4, sel_pushCurrentStateIntoUIAndNotify);
  -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compactTimeLabel:didSelectTime:", self, self->_selectedTime);

}

- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  objc_super v5;

  self->_currentState = a4;
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerCompactTimeLabel;
  -[_UIDatePickerCalendarTimeLabel stateMachineUpdateFromState:toState:](&v5, sel_stateMachineUpdateFromState_toState_, a3);
  -[_UIDatePickerCompactTimeLabel _updateTimeFormatIfNeeded](self, "_updateTimeFormatIfNeeded");
  -[_UIDatePickerCompactTimeLabel _updateInputFieldLayoutForCurrentState](self, "_updateInputFieldLayoutForCurrentState");
}

- (void)_updateTimeFormatIfNeeded
{
  unint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  v3 = self->_currentState - 2;
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "forceDoubleDigitHours");

  if (v3 < 7 != v5)
  {
    *(_BYTE *)&self->_flags |= 2u;
    -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "withForceDoubleDigitHours:", v3 < 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke;
    v10[3] = &unk_1E16B1B50;
    v10[4] = self;
    v11 = v7;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke_2;
    v9[3] = &unk_1E16B3FD8;
    v8 = v7;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v9, 0.25);

  }
}

- (void)_updateInputFieldLayoutForCurrentState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  id v21;
  _QWORD v22[9];

  switch(-[_UIDatePickerCompactTimeLabel currentState](self, "currentState"))
  {
    case 2uLL:
    case 6uLL:
      -[_UIDatePickerCompactTimeLabel label](self, "label");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;

      goto LABEL_8;
    case 3uLL:
    case 7uLL:
      v12 = 560;
      goto LABEL_7;
    case 4uLL:
    case 8uLL:
      v12 = 592;
      goto LABEL_7;
    case 5uLL:
      v12 = 624;
LABEL_7:
      v19 = (uint64_t *)((char *)self + v12);
      v5 = *v19;
      v7 = v19[1];
      v9 = v19[2];
      v11 = v19[3];
LABEL_8:
      -[UIView tintColor](self, "tintColor");
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[_UIDatePickerCompactTimeLabel label](self, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v5 = v14;
      v7 = v15;
      v9 = v16;
      v11 = v17;

      +[UIColor clearColor](UIColor, "clearColor");
      v18 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71___UIDatePickerCompactTimeLabel__updateInputFieldLayoutForCurrentState__block_invoke;
  v22[3] = &unk_1E16B20D8;
  v22[4] = self;
  v22[5] = v5;
  v22[6] = v7;
  v22[7] = v9;
  v22[8] = v11;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22, v18);
  -[_UIDatePickerCompactTimeLabel inputBackgroundView](self, "inputBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v21);

}

- (void)_updateTextContentStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_stringDrawingOptions");

  v15 = *(_QWORD *)off_1E1678D90;
  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[_UIDatePickerCompactTimeLabel overrideAttributes](self, "overrideAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[_UIDatePickerCompactTimeLabel overrideAttributes](self, "overrideAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v13);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v10);
  -[NSTextContentStorage setAttributedString:](self->_textContentStorage, "setAttributedString:", v14);

}

- (void)_updateLayoutRectsForRanges:(id *)a3
{
  uint64_t v5;
  double (**v6)(void *, NSUInteger, NSUInteger);
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _QWORD v16[5];
  _QWORD aBlock[5];

  -[_UIDatePickerCompactTimeLabel _updateTextContentStorage](self, "_updateTextContentStorage");
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke;
  aBlock[3] = &unk_1E16DE938;
  aBlock[4] = self;
  v6 = (double (**)(void *, NSUInteger, NSUInteger))_Block_copy(aBlock);
  self->_hourRect.origin.x = v6[2](v6, a3->var0.location, a3->var0.length);
  self->_hourRect.origin.y = v7;
  self->_hourRect.size.width = v8;
  self->_hourRect.size.height = v9;
  self->_minuteRect.origin.x = v6[2](v6, a3->var1.location, a3->var1.length);
  self->_minuteRect.origin.y = v10;
  self->_minuteRect.size.width = v11;
  self->_minuteRect.size.height = v12;
  self->_timeOfDayRect.origin.x = v6[2](v6, a3->var2.location, a3->var2.length);
  self->_timeOfDayRect.origin.y = v13;
  self->_timeOfDayRect.size.width = v14;
  self->_timeOfDayRect.size.height = v15;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v16[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);

}

- (id)_currentDateForInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_UIDatePickerCalendarTimeLabel hourText](self, "hourText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel minuteText](self, "minuteText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@~~%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clockLayout");

  if (v8)
  {
    -[_UIDatePickerCalendarTimeLabel timeOfDayText](self, "timeOfDayText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("~~%@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  -[NSDateFormatter dateFromString:](self->_formatter, "dateFromString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_activateCompactLabelForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  -[_UIDatePickerCompactTimeLabel overlayPresentation](self, "overlayPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "activeMode") == 1)
    v6 = !-[UIView isFirstResponder](self, "isFirstResponder");
  else
    v6 = 0;
  objc_msgSend(v4, "activeTouch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_isPointerTouch") & 1) != 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isHardwareKeyboardAvailable");

    if (v9)
    {
      if (v6)
        objc_msgSend(v5, "dismissPresentationAnimated:", 1);
      objc_msgSend(v4, "locationInView:", self);
      -[_UIDatePickerCalendarTimeLabel didTapInputLabelAtLocation:](self, "didTapInputLabelAtLocation:");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __75___UIDatePickerCompactTimeLabel__activateCompactLabelForGestureRecognizer___block_invoke;
      v11[3] = &unk_1E16B3FD8;
      v11[4] = self;
      objc_msgSend(v5, "activateEmptyPresentationWithMode:onDismiss:", 1, v11);
      -[_UIDatePickerCompactTimeLabel backgroundView](self, "backgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelected:", 1);

      goto LABEL_14;
    }
  }
  else
  {

  }
  if (v6)
  {
    objc_msgSend(v5, "dismissPresentationAnimated:", 1);
  }
  else if (!-[_UIDatePickerCalendarTimeLabel scribbleInteractionIsActive](self, "scribbleInteractionIsActive"))
  {
    -[_UIDatePickerCompactTimeLabel activateLabel](self, "activateLabel");
  }
LABEL_14:

}

- (void)activateLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  -[_UIDatePickerCompactTimeLabel overlayPresentation](self, "overlayPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
    -[_UIDatePickerCalendarTimeLabel resignFirstResponder](self, "resignFirstResponder");
  -[_UIDatePickerCalendarTimeLabel beginEditingWheels](self, "beginEditingWheels");
  if (-[_UIDatePickerCompactTimeLabel tapInteractionControlledExternally](self, "tapInteractionControlledExternally"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke;
    v13[3] = &unk_1E16B3FD8;
    v13[4] = self;
    objc_msgSend(v3, "activateEmptyPresentationWithMode:onDismiss:", 1, v13);
  }
  else
  {
    -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compactTimeLabelDidBeginEditing:", self);

    -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDatePickerForCompactTimeLabel:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_2;
    v12[3] = &unk_1E16B2C10;
    v12[4] = self;
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:forControlEvents:", v8, 0x2000);

    objc_msgSend(v3, "sourceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v9, "convertRect:fromView:", self);
    objc_msgSend(v3, "setSourceRect:");

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_3;
    v11[3] = &unk_1E16B3FD8;
    v11[4] = self;
    objc_msgSend(v3, "presentDatePicker:onDismiss:", v6, v11);
    -[_UIDatePickerCompactTimeLabel backgroundView](self, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelected:", 1);

  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[_UIDatePickerCompactTimeLabel sizeThatFits:](self, "sizeThatFits:", INFINITY, INFINITY);
  -[UIView alignmentRectInsets](self, "alignmentRectInsets");
  UICeilToViewScale(self);
  v4 = v3;
  UICeilToViewScale(self);
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UIView traitCollection](self, "traitCollection", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "compactLabelBackgroundPadding");
  -[NSTextContentStorage attributedString](self->_textContentStorage, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  -[_UITextLayoutController boundingRectForCharacterRange:](self->_textLayoutController, "boundingRectForCharacterRange:", 0, v7);
  UICeilToViewScale(self);
  v9 = v8;
  UICeilToViewScale(self);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)reloadWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 displaysTimeZone:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t v12;
  _UIDatePickerCalendarTimeFormat *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v6 = a6;
  v7 = a5;
  v23 = a3;
  v10 = a4;
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[_UIDatePickerCalendarTimeLabel resignFirstResponder](self, "resignFirstResponder");
  }
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "forceDoubleDigitHours");

  v13 = -[_UIDatePickerCalendarTimeFormat initWithCalendar:locale:followsSystemHourCycle:forceDoubleDigitHours:displaysTimeZone:]([_UIDatePickerCalendarTimeFormat alloc], "initWithCalendar:locale:followsSystemHourCycle:forceDoubleDigitHours:displaysTimeZone:", v23, v10, v7, v12, v6);
  -[_UIDatePickerCalendarTimeLabel setTimeFormat:](self, "setTimeFormat:", v13);

  -[NSDateFormatter setCalendar:](self->_formatter, "setCalendar:", v23);
  if (v10)
  {
    -[NSDateFormatter setLocale:](self->_formatter, "setLocale:", v10);
  }
  else
  {
    objc_msgSend(v23, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_formatter, "setLocale:", v14);

  }
  objc_msgSend(v23, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](self->_formatter, "setTimeZone:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hourFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@~~mm"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "clockLayout");

  if (v21)
  {
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("~~a"));
    v22 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v22;
  }
  -[NSDateFormatter setDateFormat:](self->_formatter, "setDateFormat:", v19);
  -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");

}

- (void)reloadWithDate:(id)a3
{
  -[_UIDatePickerCompactTimeLabel _reloadWithDate:notify:](self, "_reloadWithDate:notify:", a3, 0);
}

- (void)_reloadWithDate:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _UIDatePickerCalendarTime *v8;
  void *v9;
  _UIDatePickerCalendarTime *v10;
  _UIDatePickerCalendarTime *selectedTime;

  v4 = a4;
  v6 = a3;
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZoneReferenceDate:", v6);

  v8 = [_UIDatePickerCalendarTime alloc];
  -[NSDateFormatter calendar](self->_formatter, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v8, "initWithDate:calendar:", v6, v9);

  selectedTime = self->_selectedTime;
  self->_selectedTime = v10;

  -[_UIDatePickerCompactTimeLabel _updateInputFieldFromSelectedDateComponents](self, "_updateInputFieldFromSelectedDateComponents");
  if (v4)
    -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUIAndNotify](self, "pushCurrentStateIntoUIAndNotify");
}

- (void)willBeginWritingInScribbleInteraction
{
  id v2;

  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttributedText:", 0);

}

- (void)_updateInputFieldFromSelectedDateComponents
{
  NSDateFormatter *formatter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  formatter = self->_formatter;
  -[_UIDatePickerCalendarDateComponent date](self->_selectedTime, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](formatter, "stringFromDate:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("~~"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIView isFirstResponder](self, "isFirstResponder")
    || -[_UIDatePickerCompactTimeLabel currentState](self, "currentState") == 9)
  {
    *(_BYTE *)&self->_flags |= 1u;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarTimeLabel setHourText:](self, "setHourText:", v6);

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarTimeLabel setMinuteText:](self, "setMinuteText:", v7);

    -[_UIDatePickerCalendarTimeLabel _roundInputToClosestIntervalIfNeeded](self, "_roundInputToClosestIntervalIfNeeded");
  }
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clockLayout");

  if (v9)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PMSymbol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "compare:options:", v12, 1) == 0;

    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsPM:", v13);

  }
  -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");

}

- (void)_updateSelectedDateComponentsFromInput
{
  _UIDatePickerCalendarTime *v3;
  void *v4;
  _UIDatePickerCalendarTime *v5;
  void *v6;
  id v7;

  -[_UIDatePickerCompactTimeLabel _currentDateForInput](self, "_currentDateForInput");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [_UIDatePickerCalendarTime alloc];
  -[NSDateFormatter calendar](self->_formatter, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v3, "initWithDate:calendar:", v7, v4);

  if (-[_UIDatePickerCalendarDateComponent isEqual:](v5, "isEqual:", self->_selectedTime))
  {
    -[_UIDatePickerCompactTimeLabel _updateInputFieldFromSelectedDateComponents](self, "_updateInputFieldFromSelectedDateComponents");
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedTime, v5);
    -[_UIDatePickerCompactTimeLabel _updateInputFieldFromSelectedDateComponents](self, "_updateInputFieldFromSelectedDateComponents");
    -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compactTimeLabel:didSelectTime:", self, v5);

  }
}

- (BOOL)isPassthroughInteractionEnabled
{
  return self->_passthroughInteraction != 0;
}

- (void)setPassthroughInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _UIPassthroughScrollInteraction *passthroughInteraction;
  _UIPassthroughScrollInteraction *v6;
  _UIPassthroughScrollInteraction *v7;
  _UIPassthroughScrollInteraction *v8;

  v3 = a3;
  passthroughInteraction = self->_passthroughInteraction;
  if (v3)
  {
    if (!passthroughInteraction)
    {
      v6 = (_UIPassthroughScrollInteraction *)objc_opt_new();
      v7 = self->_passthroughInteraction;
      self->_passthroughInteraction = v6;

      -[_UIPassthroughScrollInteraction setDelegate:](self->_passthroughInteraction, "setDelegate:", self);
      -[_UIPassthroughScrollInteraction setEatsTouches:](self->_passthroughInteraction, "setEatsTouches:", 0);
      -[UIView addInteraction:](self, "addInteraction:", self->_passthroughInteraction);
    }
  }
  else if (passthroughInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    v8 = self->_passthroughInteraction;
    self->_passthroughInteraction = 0;

  }
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  void *v8;
  void *v10;
  char v11;

  y = a4.y;
  x = a4.x;
  -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return 0;
  -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "compactTimeLabel:shouldDismissForInteractionAtLocation:", self, x, y);

  return v11;
}

- (BOOL)timeLabel:(id)a3 didReceiveText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int16 v32;
  unsigned __int16 v33;

  v5 = a4;
  if (objc_msgSend(v5, "length") == 1)
  {
    -[NSDateFormatter AMSymbol](self->_formatter, "AMSymbol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter PMSymbol](self->_formatter, "PMSymbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "length");
    v9 = objc_msgSend(v7, "length");
    if (v8 >= v9)
      v10 = v9;
    else
      v10 = v8;
    if (v10)
    {
      v11 = 0;
      while (1)
      {
        v12 = objc_msgSend(v6, "characterAtIndex:", v11);
        v13 = objc_msgSend(v7, "characterAtIndex:", v11);
        if (v12 != v13)
          break;
        ++v11;
        v14 = objc_msgSend(v6, "length");
        v15 = objc_msgSend(v7, "length");
        if (v14 >= v15)
          v16 = v15;
        else
          v16 = v14;
        v17 = v12;
        if (v11 >= v16)
          goto LABEL_16;
      }
      v17 = v13;
    }
    else
    {
      v17 = 0;
      v12 = 0;
    }
LABEL_16:
    v33 = v12;
    v32 = v17;
    v19 = (void *)objc_opt_new();
    if (v12 != v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v33, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedLowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addCharactersInString:", v21);

      objc_msgSend(v20, "localizedUppercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addCharactersInString:", v22);

    }
    v23 = (void *)objc_opt_new();
    if (v33 != v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedLowercaseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addCharactersInString:", v25);

      objc_msgSend(v24, "localizedUppercaseString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addCharactersInString:", v26);

    }
    v27 = objc_msgSend(v5, "characterAtIndex:", 0);
    if (objc_msgSend(v19, "characterIsMember:", v27))
    {
      -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 0;
    }
    else
    {
      if (!objc_msgSend(v23, "characterIsMember:", v27))
      {
        v18 = 0;
        goto LABEL_26;
      }
      -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 1;
    }
    objc_msgSend(v28, "setIsPM:", v30);

    -[_UIDatePickerCompactTimeLabel _updateSelectedDateComponentsFromInput](self, "_updateSelectedDateComponentsFromInput");
    v18 = 1;
LABEL_26:

    goto LABEL_27;
  }
  v18 = 0;
LABEL_27:

  return v18;
}

- (int64_t)keyboardTypeForTimeLabel:(id)a3
{
  return 4;
}

- (BOOL)timeLabelShouldSuppressSoftwareKeyboard:(id)a3
{
  return 1;
}

- (BOOL)timeLabelCanBecomeFirstResponder:(id)a3
{
  return 1;
}

- (void)timeLabelWillBecomeFirstResponder:(id)a3
{
  id v4;

  -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactTimeLabelWillBecomeFirstResponder:", self);

}

- (void)timeLabelDidBecomeFirstResponder:(id)a3
{
  -[_UIDatePickerCompactTimeLabel setPassthroughInteractionEnabled:](self, "setPassthroughInteractionEnabled:", 1);
}

- (void)timeLabelDidFailToBecomeFirstResponder:(id)a3
{
  -[_UIDatePickerCompactTimeLabel setPassthroughInteractionEnabled:](self, "setPassthroughInteractionEnabled:", 0);
}

- (void)timeLabelDidResignFirstResponder:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[_UIDatePickerCompactTimeLabel overlayPresentation](self, "overlayPresentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresentingOverlay");

  if ((v5 & 1) == 0)
  {
    -[_UIDatePickerCompactTimeLabel overlayPresentation](self, "overlayPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPresentationAnimated:", 1);

  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[_UIDatePickerCompactTimeLabel _updateInputFieldFromSelectedDateComponents](self, "_updateInputFieldFromSelectedDateComponents");
  }
  -[_UIDatePickerCompactTimeLabel _updateHoverStateLabelsIfNeeded](self, "_updateHoverStateLabelsIfNeeded");
  -[_UIDatePickerCompactTimeLabel setPassthroughInteractionEnabled:](self, "setPassthroughInteractionEnabled:", 0);
}

- (void)timeLabelDidBeginEditing:(id)a3
{
  id v4;

  -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactTimeLabelDidBeginEditing:", self);

}

- (void)timeLabelDidEndEditing:(id)a3
{
  id v4;

  -[_UIDatePickerCompactTimeLabel selectionDelegate](self, "selectionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactTimeLabelDidEndEditing:", self);

}

- (void)_expandedComponentRectForHours:(CGRect *)a3 minuteRect:(CGRect *)a4 timeOfDayRect:(CGRect *)a5
{
  void *v9;
  uint64_t v10;
  double MinX;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGRect *p_slice;
  CGRect *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGSize v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGSize size;
  CGSize v80;
  CGSize v81;
  CGRect v82;
  CGRect slice;
  CGRect remainder;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  memset(&v82, 0, sizeof(v82));
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "clockLayout");

  if (v10)
  {
    MinX = CGRectGetMinX(self->_timeOfDayRect);
    if (MinX >= CGRectGetMinX(self->_hourRect))
    {
      -[_UIDatePickerCompactTimeLabel hourRect](self, "hourRect");
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v65 = v64;
      -[_UIDatePickerCompactTimeLabel minuteRect](self, "minuteRect");
      v100.origin.x = v66;
      v100.origin.y = v67;
      v100.size.width = v68;
      v100.size.height = v69;
      v92.origin.x = v59;
      v92.origin.y = v61;
      v92.size.width = v63;
      v92.size.height = v65;
      v93 = CGRectUnion(v92, v100);
      x = v93.origin.x;
      y = v93.origin.y;
      width = v93.size.width;
      height = v93.size.height;
      v74 = CGRectGetWidth(v93) * 0.5;
      v94.origin.x = x;
      v94.origin.y = y;
      v94.size.width = width;
      v94.size.height = height;
      CGRectDivide(v94, &remainder, &slice, v74, CGRectMinXEdge);
      -[_UIDatePickerCompactTimeLabel timeOfDayRect](self, "timeOfDayRect");
      v101.origin.x = v75;
      v101.origin.y = v76;
      v101.size.width = v77;
      v101.size.height = v78;
      v95 = CGRectUnion(slice, v101);
      v33 = v95.origin.x;
      v34 = v95.origin.y;
      v35 = v95.size.width;
      v36 = v95.size.height;
      v37 = CGRectGetWidth(v95) * 0.5;
      p_slice = &slice;
      v39 = &v82;
    }
    else
    {
      -[_UIDatePickerCompactTimeLabel timeOfDayRect](self, "timeOfDayRect");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[_UIDatePickerCompactTimeLabel hourRect](self, "hourRect");
      v97.origin.x = v20;
      v97.origin.y = v21;
      v97.size.width = v22;
      v97.size.height = v23;
      v85.origin.x = v13;
      v85.origin.y = v15;
      v85.size.width = v17;
      v85.size.height = v19;
      v86 = CGRectUnion(v85, v97);
      v24 = v86.origin.x;
      v25 = v86.origin.y;
      v26 = v86.size.width;
      v27 = v86.size.height;
      v28 = CGRectGetWidth(v86) * 0.5;
      v87.origin.x = v24;
      v87.origin.y = v25;
      v87.size.width = v26;
      v87.size.height = v27;
      CGRectDivide(v87, &v82, &remainder, v28, CGRectMinXEdge);
      -[_UIDatePickerCompactTimeLabel minuteRect](self, "minuteRect");
      v98.origin.x = v29;
      v98.origin.y = v30;
      v98.size.width = v31;
      v98.size.height = v32;
      v88 = CGRectUnion(remainder, v98);
      v33 = v88.origin.x;
      v34 = v88.origin.y;
      v35 = v88.size.width;
      v36 = v88.size.height;
      v37 = CGRectGetWidth(v88) * 0.5;
      p_slice = &remainder;
      v39 = &slice;
    }
    v96.origin.x = v33;
    v96.origin.y = v34;
    v96.size.width = v35;
    v96.size.height = v36;
    CGRectDivide(v96, p_slice, v39, v37, CGRectMinXEdge);
    if (a3)
      goto LABEL_8;
  }
  else
  {
    -[_UIDatePickerCompactTimeLabel hourRect](self, "hourRect");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[_UIDatePickerCompactTimeLabel minuteRect](self, "minuteRect");
    v99.origin.x = v48;
    v99.origin.y = v49;
    v99.size.width = v50;
    v99.size.height = v51;
    v89.origin.x = v41;
    v89.origin.y = v43;
    v89.size.width = v45;
    v89.size.height = v47;
    v90 = CGRectUnion(v89, v99);
    v52 = v90.origin.x;
    v53 = v90.origin.y;
    v54 = v90.size.width;
    v55 = v90.size.height;
    v56 = CGRectGetWidth(v90) * 0.5;
    v91.origin.x = v52;
    v91.origin.y = v53;
    v91.size.width = v54;
    v91.size.height = v55;
    CGRectDivide(v91, &remainder, &slice, v56, CGRectMinXEdge);
    v57 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v82.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v82.size = v57;
    if (a3)
    {
LABEL_8:
      size = remainder.size;
      a3->origin = remainder.origin;
      a3->size = size;
    }
  }
  if (a4)
  {
    v80 = slice.size;
    a4->origin = slice.origin;
    a4->size = v80;
  }
  if (a5)
  {
    v81 = v82.size;
    a5->origin = v82.origin;
    a5->size = v81;
  }
}

- (int64_t)_inputScopeForPointerLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGRect v6;
  CGRect v7;
  CGRect v8;
  CGPoint v9;
  CGPoint v10;
  CGPoint v11;

  if (self->_currentState - 2 > 7)
    return 1;
  y = a3.y;
  x = a3.x;
  memset(&v8, 0, sizeof(v8));
  memset(&v7, 0, sizeof(v7));
  memset(&v6, 0, sizeof(v6));
  -[_UIDatePickerCompactTimeLabel _expandedComponentRectForHours:minuteRect:timeOfDayRect:](self, "_expandedComponentRectForHours:minuteRect:timeOfDayRect:", &v8, &v7, &v6);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v8, v9))
    return 2;
  v10.x = x;
  v10.y = y;
  if (CGRectContainsPoint(v7, v10))
    return 3;
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(v6, v11))
    return 4;
  else
    return 0;
}

- (id)_viewForInputScope:(int64_t)a3
{
  void *v3;

  if (a3 == 4)
  {
    -[_UIDatePickerCompactTimeLabel timeOfDayLabel](self, "timeOfDayLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 3)
  {
    -[_UIDatePickerCompactTimeLabel minuteLabel](self, "minuteLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 2)
      -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
    else
      -[_UIDatePickerCompactTimeLabel label](self, "label");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const __CFString *v16;
  int64_t v17;
  __int128 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  __int128 v30;
  __int128 v31;

  v6 = a4;
  if (objc_msgSend(v6, "_pointerType") != 1)
  {
    if (self->_currentState - 2 >= 8)
    {
      -[_UIDatePickerCompactTimeLabel label](self, "label");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v9 = v20;
      v11 = v21;
      v13 = v22;
      v15 = v23;

      v16 = CFSTR("UIDatePicker.time.all");
      goto LABEL_10;
    }
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      objc_msgSend(v6, "location");
      v17 = -[_UIDatePickerCompactTimeLabel _inputScopeForPointerLocation:](self, "_inputScopeForPointerLocation:");
      v18 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v30 = *MEMORY[0x1E0C9D648];
      v31 = v18;
      switch(v17)
      {
        case 4:
          -[_UIDatePickerCompactTimeLabel _expandedComponentRectForHours:minuteRect:timeOfDayRect:](self, "_expandedComponentRectForHours:minuteRect:timeOfDayRect:", 0, 0, &v30);
          v16 = CFSTR("UIDatePicker.time.timeOfDay");
          goto LABEL_16;
        case 3:
          -[_UIDatePickerCompactTimeLabel _expandedComponentRectForHours:minuteRect:timeOfDayRect:](self, "_expandedComponentRectForHours:minuteRect:timeOfDayRect:", 0, &v30, 0);
          v16 = CFSTR("UIDatePicker.time.minute");
          goto LABEL_16;
        case 2:
          -[_UIDatePickerCompactTimeLabel _expandedComponentRectForHours:minuteRect:timeOfDayRect:](self, "_expandedComponentRectForHours:minuteRect:timeOfDayRect:", &v30, 0, 0);
          v16 = CFSTR("UIDatePicker.time.hour");
LABEL_16:
          v25 = *((double *)&v30 + 1);
          v24 = *(double *)&v30;
          v27 = *((double *)&v31 + 1);
          v26 = *(double *)&v31;
          goto LABEL_11;
      }
    }
    v28 = 0;
    goto LABEL_12;
  }
  -[_UIDatePickerCompactTimeLabel label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = CFSTR("UIDatePicker.time.all.pencil");
LABEL_10:
  v24 = v9;
  v25 = v11;
  v26 = v13;
  v27 = v15;
LABEL_11:
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v16, v24, v25, v26, v27, v30, v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v28;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  _UIDatePickerCompactTimeLabel *v15;
  UITargetedPreview *v16;
  void *v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  void *v23;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  UITargetedPreview *v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("UIDatePicker.time.all"));

  if (v7)
  {
    -[_UIDatePickerCompactTimeLabel label](self, "label");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (_UIDatePickerCompactTimeLabel *)v8;
    v16 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v8);
    +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](v15, "frame");
    v40 = CGRectInset(v39, -4.0, -4.0);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    goto LABEL_10;
  }
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("UIDatePicker.time.hour"));

  if (v10)
  {
    -[_UIDatePickerCompactTimeLabel hourLabel](self, "hourLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("UIDatePicker.time.minute"));

  if (v12)
  {
    -[_UIDatePickerCompactTimeLabel minuteLabel](self, "minuteLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("UIDatePicker.time.timeOfDay"));

  if (v14)
  {
    -[_UIDatePickerCompactTimeLabel timeOfDayLabel](self, "timeOfDayLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqual:", CFSTR("UIDatePicker.time.all.pencil"));

  if (!v26)
  {
    v23 = 0;
    goto LABEL_11;
  }
  v15 = self;
  v16 = (UITargetedPreview *)objc_opt_new();
  -[UIView bounds](v15, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[UIView layer](v15, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "cornerRadius");
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v28, v30, v32, v34, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview setShadowPath:](v16, "setShadowPath:", v37);

  v38 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", v15, v16);
  +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](v15, "frame");
  v42 = CGRectInset(v41, 5.0, 5.0);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;

LABEL_10:
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, 4.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v17, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v23;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  id v15;

  v15 = a4;
  objc_msgSend(v15, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("UIDatePicker.time.all"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
LABEL_9:
    self->_highlightedScope = v8;
    goto LABEL_10;
  }
  objc_msgSend(v15, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("UIDatePicker.time.hour"));

  if ((v10 & 1) != 0)
  {
    v8 = 2;
    goto LABEL_9;
  }
  objc_msgSend(v15, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("UIDatePicker.time.minute"));

  if ((v12 & 1) != 0)
  {
    v8 = 3;
    goto LABEL_9;
  }
  objc_msgSend(v15, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("UIDatePicker.time.timeOfDay"));

  if (v14)
  {
    v8 = 4;
    goto LABEL_9;
  }
LABEL_10:
  -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  self->_highlightedScope = 1;
  -[_UIDatePickerCompactTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI", a3, a4, a5);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (_UIDatePickerCompactTimeLabelDelegate)selectionDelegate
{
  return (_UIDatePickerCompactTimeLabelDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (_UIDatePickerOverlayPresentation)overlayPresentation
{
  return self->_overlayPresentation;
}

- (void)setOverlayPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_overlayPresentation, a3);
}

- (_UIDatePickerCalendarTime)selectedTime
{
  return self->_selectedTime;
}

- (BOOL)tapInteractionControlledExternally
{
  return self->_tapInteractionControlledExternally;
}

- (void)setTapInteractionControlledExternally:(BOOL)a3
{
  self->_tapInteractionControlledExternally = a3;
}

- (NSDictionary)overrideAttributes
{
  return self->_overrideAttributes;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (UILabel)label
{
  return self->_label;
}

- (UILabel)hourLabel
{
  return self->_hourLabel;
}

- (UILabel)minuteLabel
{
  return self->_minuteLabel;
}

- (UILabel)timeOfDayLabel
{
  return self->_timeOfDayLabel;
}

- (UIButton)backgroundView
{
  return self->_backgroundView;
}

- (UIView)inputBackgroundView
{
  return self->_inputBackgroundView;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (_UIPassthroughScrollInteraction)passthroughInteraction
{
  return self->_passthroughInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_inputBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeOfDayLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_overrideAttributes, 0);
  objc_storeStrong((id *)&self->_selectedTime, 0);
  objc_storeStrong((id *)&self->_overlayPresentation, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_touchHighlightedView);
  objc_storeStrong((id *)&self->_textContentStorage, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
