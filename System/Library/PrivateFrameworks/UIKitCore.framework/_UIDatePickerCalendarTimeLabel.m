@implementation _UIDatePickerCalendarTimeLabel

- (_UIDatePickerCalendarTimeLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  _UIDatePickerCalendarTimeLabel *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDatePickerCalendarTimeFormat formatWithCalendar:locale:followsSystemHourCycle:](_UIDatePickerCalendarTimeFormat, "formatWithCalendar:locale:followsSystemHourCycle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIDatePickerCalendarTimeLabel initWithTimeFormat:minuteInterval:](self, "initWithTimeFormat:minuteInterval:", v10, 1);

  if (v11)
    -[UIView setFrame:](v11, "setFrame:", x, y, width, height);
  return v11;
}

- (_UIDatePickerCalendarTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  id v7;
  _UIDatePickerCalendarTimeLabel *v8;
  _UIDatePickerCalendarTimeLabel *v9;
  _UIDatePickerCalendarTimeLabelStateMachineContext *v10;
  uint64_t v11;
  _UIDatePickerCalendarTimeLabelStateMachineContext *stateContext;
  _UIDatePickerCalendarTimeValueStore *v13;
  uint64_t v14;
  _UIDatePickerCalendarTimeValueStore *inputValue;
  void *v16;
  UIIndirectScribbleInteraction *v17;
  UIIndirectScribbleInteraction *scribbleInteraction;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  v8 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[UIView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 1);
    -[UIView setFocusEffect:](v9, "setFocusEffect:", 0);
    objc_initWeak(&location, v9);
    v10 = [_UIDatePickerCalendarTimeLabelStateMachineContext alloc];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __68___UIDatePickerCalendarTimeLabel_initWithTimeFormat_minuteInterval___block_invoke;
    v23 = &unk_1E16B3E50;
    objc_copyWeak(&v24, &location);
    v11 = -[_UIDatePickerCalendarTimeLabelStateMachineContext initWithUpdateHandler:](v10, "initWithUpdateHandler:", &v20);
    stateContext = v9->_stateContext;
    v9->_stateContext = (_UIDatePickerCalendarTimeLabelStateMachineContext *)v11;

    objc_storeStrong((id *)&v9->_timeFormat, a3);
    v13 = [_UIDatePickerCalendarTimeValueStore alloc];
    v14 = -[_UIDatePickerCalendarTimeValueStore initWithTimeFormat:minuteInterval:decrementBehaviour:](v13, "initWithTimeFormat:minuteInterval:decrementBehaviour:", v7, a4, -[_UIDatePickerCalendarTimeLabel decrementBehaviour](v9, "decrementBehaviour", v20, v21, v22, v23));
    inputValue = v9->_inputValue;
    v9->_inputValue = (_UIDatePickerCalendarTimeValueStore *)v14;

    v9->_roundsToMinuteInterval = 1;
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setNumberStyle:", 1);
    objc_storeStrong((id *)&v9->_inputFormatter, v16);
    if (objc_msgSend((id)objc_opt_class(), "supportsScribbleInteraction"))
    {
      v17 = -[UIIndirectScribbleInteraction initWithDelegate:]([UIIndirectScribbleInteraction alloc], "initWithDelegate:", v9);
      -[UIView addInteraction:](v9, "addInteraction:", v17);
      scribbleInteraction = v9->_scribbleInteraction;
      v9->_scribbleInteraction = v17;

    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  -[UIView layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  if (v4 != self->_lastSize.width || v3 != self->_lastSize.height)
  {
    -[UIView bounds](self, "bounds");
    self->_lastSize.width = v6;
    self->_lastSize.height = v7;
    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;

  -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "timeLabelCanBecomeFirstResponder:", self);

  return v5;
}

- (int64_t)editingInteractionConfiguration
{
  return 0;
}

- (void)_uiTest_becomeFirstResponder
{
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 11);
}

- (void)_uiTest_resignFirstResponder
{
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 12);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  objc_super v7;

  -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeLabelWillBecomeFirstResponder:", self);
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  if (-[UIView becomeFirstResponder](&v7, sel_becomeFirstResponder))
    -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 11);
  v4 = -[UIView isFirstResponder](self, "isFirstResponder");
  if (v4)
  {
    -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsFirstResponder:", 1);

    objc_msgSend(v3, "timeLabelDidBecomeFirstResponder:", self);
  }
  else
  {
    objc_msgSend(v3, "timeLabelDidFailToBecomeFirstResponder:", self);
  }

  return v4;
}

- (BOOL)resignFirstResponder
{
  BOOL v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  -[UIResponder resignFirstResponder](&v7, sel_resignFirstResponder);
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 12);
  v3 = -[UIView isFirstResponder](self, "isFirstResponder");
  if (!v3)
  {
    -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsFirstResponder:", 0);

    -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeLabelDidResignFirstResponder:", self);

  }
  return !v3;
}

- (CGRect)hourRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)minuteRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
}

- (BOOL)_pointIsInsideHourSide:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double MaxX;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  x = a3.x;
  -[_UIDatePickerCalendarTimeLabel hourRect](self, "hourRect", a3.x, a3.y);
  v6 = v5;
  -[_UIDatePickerCalendarTimeLabel minuteRect](self, "minuteRect");
  if (v6 >= v7)
  {
    -[_UIDatePickerCalendarTimeLabel minuteRect](self, "minuteRect");
    MaxX = CGRectGetMaxX(v13);
    -[_UIDatePickerCalendarTimeLabel hourRect](self, "hourRect");
    return x >= (MaxX + CGRectGetMinX(v14)) * 0.5;
  }
  else
  {
    -[_UIDatePickerCalendarTimeLabel hourRect](self, "hourRect");
    v8 = CGRectGetMaxX(v11);
    -[_UIDatePickerCalendarTimeLabel minuteRect](self, "minuteRect");
    return x < (v8 + CGRectGetMinX(v12)) * 0.5;
  }
}

- (void)didTapInputLabelAtLocation:(CGPoint)a3
{
  double y;
  double x;
  _UIDatePickerCalendarTimeLabel *v6;
  uint64_t v7;
  CGPoint v8;
  CGPoint v9;
  CGPoint v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    if (!-[_UIDatePickerCalendarTimeLabel _pointIsInsideHourSide:](self, "_pointIsInsideHourSide:", x, y))
      goto LABEL_8;
LABEL_7:
    v6 = self;
    v7 = 2;
    goto LABEL_9;
  }
  -[_UIDatePickerCalendarTimeLabel hourRect](self, "hourRect");
  v8.x = x;
  v8.y = y;
  if (CGRectContainsPoint(v11, v8))
    goto LABEL_7;
  -[_UIDatePickerCalendarTimeLabel minuteRect](self, "minuteRect");
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v12, v9))
  {
LABEL_8:
    v6 = self;
    v7 = 3;
    goto LABEL_9;
  }
  -[_UIDatePickerCalendarTimeLabel timeOfDayRect](self, "timeOfDayRect");
  v10.x = x;
  v10.y = y;
  if (CGRectContainsPoint(v13, v10))
  {
    v6 = self;
    v7 = 4;
LABEL_9:
    -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](v6, "_stateMachineSendEvent:", v7);
    return;
  }
  -[_UIDatePickerCalendarTimeLabel processTapOutside](self, "processTapOutside");
}

- (UIFont)font
{
  return 0;
}

- (NSString)text
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hourValue");
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "minuteValue");
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTimeStringWithHours:minutes:isPM:", v5, v7, objc_msgSend(v8, "isPM"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)applyTextAttributesForState:(unint64_t)a3 inputScope:(int64_t)a4 updater:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  uint64_t v14;
  _QWORD *v15;

  v15 = a5;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 9)
  {
    objc_msgSend(v9, "compactLabelTextColorForEditingState:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void (*)(void))v15[2];
LABEL_3:
    v12();

  }
  else
  {
    switch(-[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"))
    {
      case 0:
        v13 = v9;
        v14 = 0;
        goto LABEL_8;
      case 1:
        v13 = v9;
        v14 = 1;
LABEL_8:
        objc_msgSend(v13, "compactLabelTextColorForEditingState:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(_QWORD *, void *, _QWORD, _QWORD, _QWORD))v15[2])(v15, v10, 0, 0, 0);
        break;
      case 2:
      case 3:
        objc_msgSend(v9, "compactLabelTextColorForEditingState:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "compactLabelTextColorForEditingState:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void (*)(void))v15[2];
        goto LABEL_3;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarTimeLabel.m"), 290, CFSTR("Unknown case."));
        break;
    }
  }

}

- (id)attributedTextWithRanges:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, uint64_t, NSUInteger, NSUInteger);
  NSUInteger location;
  NSUInteger length;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  _NSRange v31;
  _NSRange v32;
  id v33;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t v38;
  _NSRange v39;
  _NSRange v40;
  _NSRange v41;
  _NSRange v42;
  _QWORD aBlock[4];
  id v44;
  id v45;
  _NSRange v46;
  _NSRange v47;
  _NSRange v48;
  _NSRange v49;

  v48 = (_NSRange)0;
  v49 = (_NSRange)0;
  v46 = (_NSRange)0;
  v47 = (_NSRange)0;
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hourValue");
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "minuteValue");
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTimeStringWithHours:minutes:isPM:ranges:", v7, v9, objc_msgSend(v10, "isPM"), &v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  v13 = -[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke;
  aBlock[3] = &unk_1E16B3E78;
  v44 = v11;
  v16 = v14;
  v45 = v16;
  v17 = v11;
  v18 = _Block_copy(aBlock);
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke_2;
  v35[3] = &unk_1E16B3EA0;
  v19 = v16;
  v36 = v19;
  v37 = 0;
  v38 = v12;
  v39 = v46;
  v40 = v47;
  v41 = v48;
  v42 = v49;
  v20 = _Block_copy(v35);
  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel applyTextAttributesForState:inputScope:updater:](self, "applyTextAttributesForState:inputScope:updater:", objc_msgSend(v21, "currentState"), -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"), v20);

  if (v13 < 1)
    goto LABEL_12;
  v22 = -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope");
  switch(v22)
  {
    case 3:
      v24 = (void (*)(_QWORD *, uint64_t, NSUInteger, NSUInteger))v18[2];
      length = v47.length;
      location = v47.location;
      goto LABEL_11;
    case 2:
      v24 = (void (*)(_QWORD *, uint64_t, NSUInteger, NSUInteger))v18[2];
      length = v46.length;
      location = v46.location;
LABEL_11:
      v24(v18, v13, location, length);
      break;
    case 1:
      ((void (*)(_QWORD *, uint64_t, NSUInteger, NSUInteger))v18[2])(v18, v13, v47.location, v47.length);
      if ((unint64_t)v13 >= 2)
        v23 = v13 - 2;
      else
        v23 = 0;
      ((void (*)(_QWORD *, uint64_t, NSUInteger, NSUInteger))v18[2])(v18, v23, v46.location, v46.length);
      break;
  }
LABEL_12:
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "wantsDoubleDigitHours"))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "forceDoubleDigitHours") & 1) == 0)
  {

    goto LABEL_17;
  }
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hourValue");

  if (v30 <= 9)
    ((void (*)(_QWORD *, uint64_t, NSUInteger, NSUInteger))v18[2])(v18, 1, v46.location, v46.length);
LABEL_18:
  if (a3)
  {
    v31 = v47;
    a3->var0 = v46;
    a3->var1 = v31;
    v32 = v49;
    a3->var2 = v48;
    a3->var3 = v32;
  }
  v33 = v19;

  return v33;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[_UIDatePickerCalendarTimeLabel attributedTextWithRanges:](self, "attributedTextWithRanges:", 0);
}

- (void)setTimeFormat:(id)a3
{
  unint64_t v5;
  _UIDatePickerCalendarTimeValueStore *v6;
  _UIDatePickerCalendarTimeValueStore *inputValue;
  _UIDatePickerCalendarTimeFormat *v8;

  v8 = (_UIDatePickerCalendarTimeFormat *)a3;
  if (self->_timeFormat != v8)
  {
    objc_storeStrong((id *)&self->_timeFormat, a3);
    v5 = -[_UIDatePickerCalendarTimeValueStore digitsInScope:](self->_inputValue, "digitsInScope:", 1);
    v6 = -[_UIDatePickerCalendarTimeValueStore initWithTimeFormat:minuteInterval:decrementBehaviour:]([_UIDatePickerCalendarTimeValueStore alloc], "initWithTimeFormat:minuteInterval:decrementBehaviour:", v8, -[_UIDatePickerCalendarTimeLabel minuteInterval](self, "minuteInterval"), -[_UIDatePickerCalendarTimeLabel decrementBehaviour](self, "decrementBehaviour"));
    -[_UIDatePickerCalendarTimeValueStore setDigits:count:inScope:append:](v6, "setDigits:count:inScope:append:", v5, 0, 1, 0);
    -[_UIDatePickerCalendarTimeValueStore setIsPM:](v6, "setIsPM:", -[_UIDatePickerCalendarTimeValueStore isPM](self->_inputValue, "isPM"));
    inputValue = self->_inputValue;
    self->_inputValue = v6;

    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (int64_t)minuteInterval
{
  void *v2;
  int64_t v3;

  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minuteInterval");

  return v3;
}

- (void)setMinuteInterval:(int64_t)a3
{
  void *v5;

  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinuteInterval:", a3);

  -[_UIDatePickerCalendarTimeLabel _roundInputToClosestIntervalIfNeeded](self, "_roundInputToClosestIntervalIfNeeded");
}

- (int64_t)decrementBehaviour
{
  return 0;
}

- (void)setInputScope:(int64_t)a3
{
  if (self->_inputScope != a3)
  {
    self->_inputScope = a3;
    -[_UIDatePickerCalendarTimeLabel _resetTextInput](self, "_resetTextInput");
    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
  }
}

- (void)setAllowsTextInput:(BOOL)a3
{
  if (self->_allowsTextInput != a3)
  {
    self->_allowsTextInput = a3;
    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
  }
}

- (void)setInsertedDigitCount:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  int v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  int v14;

  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "digitsInScope:", -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"));

  v7 = 0;
  do
  {
    ++v7;
    v8 = v6 > 9;
    v6 /= 0xAuLL;
  }
  while (v8);
  switch(-[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"))
  {
    case 0:
    case 1:
      -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "wantsDoubleDigitHours");

      v11 = v10 == 0;
      v12 = 3;
      goto LABEL_7;
    case 2:
      -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "wantsDoubleDigitHours");

      v11 = v14 == 0;
      v12 = 1;
LABEL_7:
      if (!v11)
        ++v12;
      break;
    case 3:
      v12 = 2;
      break;
    case 4:
      v12 = 1;
      break;
    default:
      v12 = 0;
      break;
  }
  if (v7 > v12)
    v12 = v7;
  if (v12 >= a3)
    v12 = a3;
  self->_insertedDigitCount = v12;
}

- (BOOL)processTapOutside
{
  void *v3;
  void *v4;
  char v5;

  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "currentSateCanTransitionWithEvents:", v4);

  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 0);
  return v5;
}

- (void)_stateMachineSendEvent:(unint64_t)a3
{
  uint64_t *v5;
  id v6;

  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t *)objc_msgSend(v6, "currentStateRef");
  handleEvent(_UIDatePickerCalendarTimeLabelStateMachineSpec, *v5, a3, (uint64_t)-[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext"), v5);

}

- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  _BOOL4 v7;
  _UIDatePickerCalendarTimeLabel *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = -[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:");
  switch(a4)
  {
    case 1uLL:
      v8 = self;
      v9 = 0;
      goto LABEL_7;
    case 2uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
      v8 = self;
      v9 = 1;
      goto LABEL_7;
    case 3uLL:
    case 7uLL:
      v8 = self;
      v9 = 2;
      goto LABEL_7;
    case 4uLL:
    case 8uLL:
      v8 = self;
      v9 = 3;
      goto LABEL_7;
    case 5uLL:
      v8 = self;
      v9 = 4;
LABEL_7:
      -[_UIDatePickerCalendarTimeLabel setInputScope:](v8, "setInputScope:", v9);
      break;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("_UIDatePickerCalendarTimeLabelStateCount should never be reached. This is a UIKit bug."));
      break;
    default:
      break;
  }
  if (a3 != a4)
  {
    -[_UIDatePickerCalendarTimeLabel _resetTextInput](self, "_resetTextInput");
    v10 = a4 == 1 && v7;
    if (v10
      && !-[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:", 1))
    {
      -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "minuteValue");
      -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHourValue:", v12);

      -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMinuteValue:", 0);

    }
    v15 = a4 - 2;
    if (a3 - 2 >= 8)
    {
      if (v15 <= 7)
      {
        -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeLabelDidBeginEditing:", self);
        goto LABEL_20;
      }
    }
    else if (v15 >= 8)
    {
      -[_UIDatePickerCalendarTimeLabel _roundInputToClosestIntervalIfNeeded](self, "_roundInputToClosestIntervalIfNeeded");
      -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeLabelDidEndEditing:", self);
LABEL_20:

    }
  }
  v19 = (id)objc_opt_new();
  objc_msgSend(v19, "addIndex:", 8);
  objc_msgSend(v19, "addIndex:", 1);
  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "currentSateCanTransitionWithEvents:", v19);

  -[_UIDatePickerCalendarTimeLabel setAllowsTextInput:](self, "setAllowsTextInput:", v18);
  if ((_DWORD)v18 && !-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    -[_UIDatePickerCalendarTimeLabel becomeFirstResponder](self, "becomeFirstResponder");
  }
  else if (a4 == 10 || a4 == 1)
  {
    if (-[UIView isFirstResponder](self, "isFirstResponder"))
      -[_UIDatePickerCalendarTimeLabel resignFirstResponder](self, "resignFirstResponder");
  }
  -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");

}

- (void)setRoundsToMinuteInterval:(BOOL)a3
{
  if (self->_roundsToMinuteInterval != a3)
  {
    self->_roundsToMinuteInterval = a3;
    -[_UIDatePickerCalendarTimeLabel _roundInputToClosestIntervalIfNeeded](self, "_roundInputToClosestIntervalIfNeeded");
  }
}

- (void)_roundInputToClosestIntervalIfNeeded
{
  void *v3;
  int v4;
  void *v5;

  if (-[_UIDatePickerCalendarTimeLabel roundsToMinuteInterval](self, "roundsToMinuteInterval"))
  {
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "roundToMinuteInterval");

    if (v4)
    {
      -[UIView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUIAndNotify](self, "pushCurrentStateIntoUIAndNotify");
      else
        -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
    }
  }
}

- (void)beginEditingWheels
{
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 5);
}

- (void)wheelChanged
{
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 6);
}

- (void)endEditingWheels
{
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 7);
}

- (BOOL)_digits:(unint64_t *)a3 fromText:(id)a4 count:(int64_t *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  objc_msgSend(v9, "invertedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v11);
  v14 = v10;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v12;
    v16 = v10;
    do
    {
      objc_msgSend(v16, "stringByReplacingCharactersInRange:withString:", v15, v13, &stru_1E16EDF20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v11);
      v16 = v14;
    }
    while (v15 != 0x7FFFFFFFFFFFFFFFLL);
  }

  if (a5)
  {
    v17 = v14;
    v18 = 0;
    if (objc_msgSend(v17, "length"))
    {
      v19 = 0;
      do
      {
        ++v18;
        v20 = objc_msgSend(v17, "rangeOfComposedCharacterSequenceAtIndex:", v19);
        v19 = v20 + v21;
      }
      while (v20 + v21 < (unint64_t)objc_msgSend(v17, "length"));
    }

    *a5 = v18;
  }
  v22 = objc_msgSend(v14, "length");
  if (v22)
  {
    -[_UIDatePickerCalendarTimeLabel inputFormatter](self, "inputFormatter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberFromString:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v24, "unsignedIntegerValue");

  }
  return v22 != 0;
}

- (BOOL)_treatMinutesAsHoursForState:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  char v8;

  if ((a3 == 9 || a3 == 6)
    && -[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount") <= 2
    && -[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount"))
  {
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "minuteValue");

    -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "clock");

    v8 = v5 < 0xD;
    if (v7 > 1)
      v8 = v7 - 2;
    if (v7 - 2 >= 2)
      return v8;
    else
      return v5 < 0x19;
  }
  else
  {
    return 0;
  }
}

- (void)setHourText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[16];
  uint8_t v12[16];

  v4 = a3;
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Externally modifying the hourText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", v12, 2u);
      }

    }
    else
    {
      v7 = setHourText____s_category;
      if (!setHourText____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&setHourText____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Externally modifying the hourText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", buf, 2u);
      }
    }
  }
  v10 = 0;
  if (-[_UIDatePickerCalendarTimeLabel _digits:fromText:count:](self, "_digits:fromText:count:", &v10, v4, 0))
  {
    v5 = v10;
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHourValue:", v5);

    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
  }

}

- (NSString)hourText
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:", objc_msgSend(v3, "currentState"));
  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "minuteValue");
  else
    v7 = objc_msgSend(v5, "hourValue");
  v8 = v7;

  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hourFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)setMinuteText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[16];
  uint8_t v12[16];

  v4 = a3;
  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Externally modifying the minuteText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", v12, 2u);
      }

    }
    else
    {
      v7 = setMinuteText____s_category;
      if (!setMinuteText____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&setMinuteText____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Externally modifying the minuteText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", buf, 2u);
      }
    }
  }
  v10 = 0;
  if (-[_UIDatePickerCalendarTimeLabel _digits:fromText:count:](self, "_digits:fromText:count:", &v10, v4, 0))
  {
    v5 = v10;
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinuteValue:", v5);

    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
  }

}

- (NSString)minuteText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:", objc_msgSend(v3, "currentState")))
  {
    v4 = 0;
  }
  else
  {
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "minuteValue");

  }
  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minuteFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)timeOfDayText
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clockLayout");

  if (v4)
  {
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPM");
    -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 1) != 0)
      objc_msgSend(v7, "PMSymbol");
    else
      objc_msgSend(v7, "AMSymbol");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E16EDF20;
  }
  return (NSString *)v9;
}

- (void)pushCurrentStateIntoUIAndNotify
{
  void *v3;
  id v4;

  -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUI](self, "pushCurrentStateIntoUI");
  -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeLabel:didUpdateText:", self, v3);

}

- (void)_resetTextInput
{
  -[_UIDatePickerCalendarTimeLabel setInsertedDigitCount:](self, "setInsertedDigitCount:", 0);
}

- (BOOL)displaysTimeOfDayLabel
{
  return 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputUpArrow"), 0, sel_didReceiveUpArrowKey_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputDownArrow"), 0, sel_didReceiveDownArrowKey_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputLeftArrow"), 0, sel_didReceiveLeftArrowKey_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputRightArrow"), 0, sel_didReceiveRightArrowKey_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setWantsPriorityOverSystemBehavior:", 1, (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v8;
  objc_super v11;

  v6 = a4;
  if (sel_didReceiveLeftArrowKey_ == a3 || sel_didReceiveRightArrowKey_ == a3)
  {
    v8 = 1;
  }
  else if (sel_didReceiveUpArrowKey_ == a3 || sel_didReceiveDownArrowKey_ == a3)
  {
    v8 = (unint64_t)-[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope") > 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIDatePickerCalendarTimeLabel;
    v8 = -[UIView canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
  }

  return v8;
}

- (void)didReceiveUpArrowKey:(id)a3
{
  void *v4;

  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementDigitForScope:", -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"));

  -[_UIDatePickerCalendarTimeLabel _resetTextInput](self, "_resetTextInput");
  -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUIAndNotify](self, "pushCurrentStateIntoUIAndNotify");
}

- (void)didReceiveDownArrowKey:(id)a3
{
  void *v4;

  -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decrementDigitForScope:", -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"));

  -[_UIDatePickerCalendarTimeLabel _resetTextInput](self, "_resetTextInput");
  -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUIAndNotify](self, "pushCurrentStateIntoUIAndNotify");
}

- (void)didReceiveRightArrowKey:(id)a3
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope", a3);
  if ((unint64_t)(v4 - 1) < 2)
    goto LABEL_6;
  if (v4 == 4)
  {
    if (-[_UIDatePickerCalendarTimeLabel displaysTimeOfDayLabel](self, "displaysTimeOfDayLabel"))
    {
      -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "clockLayout");

      if (v9 == 2)
      {
        v7 = 2;
        goto LABEL_12;
      }
    }
    goto LABEL_11;
  }
  if (v4 == 3)
  {
    if (!-[_UIDatePickerCalendarTimeLabel displaysTimeOfDayLabel](self, "displaysTimeOfDayLabel")
      || (-[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "clockLayout"),
          v5,
          v6 != 1))
    {
LABEL_6:
      v7 = 3;
LABEL_12:
      -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", v7);
      return;
    }
LABEL_11:
    v7 = 4;
    goto LABEL_12;
  }
}

- (void)didReceiveLeftArrowKey:(id)a3
{
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope", a3);
  v5 = 2;
  switch(v4)
  {
    case 1:
    case 3:
      goto LABEL_9;
    case 2:
      if (-[_UIDatePickerCalendarTimeLabel displaysTimeOfDayLabel](self, "displaysTimeOfDayLabel", 2))
      {
        -[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "clockLayout");

        if (v7 == 2)
          goto LABEL_8;
      }
      v5 = 2;
      goto LABEL_9;
    case 4:
      if (-[_UIDatePickerCalendarTimeLabel displaysTimeOfDayLabel](self, "displaysTimeOfDayLabel", 2)
        && (-[_UIDatePickerCalendarTimeLabel timeFormat](self, "timeFormat"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "clockLayout"),
            v8,
            v9 == 1))
      {
        v5 = 3;
      }
      else
      {
LABEL_8:
        v5 = 4;
      }
LABEL_9:
      -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", v5);
      break;
    default:
      return;
  }
}

- (int64_t)keyboardType
{
  void *v3;
  int64_t v4;

  -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardTypeForTimeLabel:", self);

  return v4;
}

- (BOOL)_suppressSoftwareKeyboard
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "timeLabelShouldSuppressSoftwareKeyboard:", self) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIDatePickerCalendarTimeLabel;
    v4 = -[UIResponder _suppressSoftwareKeyboard](&v6, sel__suppressSoftwareKeyboard);
  }

  return v4;
}

- (id)inputView
{
  UIView *inputView;
  UIView *v4;
  UIView *v5;
  objc_super v7;

  if (-[_UIDatePickerCalendarTimeLabel _suppressSoftwareKeyboard](self, "_suppressSoftwareKeyboard"))
  {
    inputView = self->_inputView;
    if (!inputView)
    {
      v4 = (UIView *)objc_opt_new();
      v5 = self->_inputView;
      self->_inputView = v4;

      -[UIView setFrame:](self->_inputView, "setFrame:", 0.0, 0.0, 1.0, 1.0);
      inputView = self->_inputView;
    }
    return inputView;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIDatePickerCalendarTimeLabel;
    -[UIResponder inputView](&v7, sel_inputView);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)hasText
{
  return 1;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentState");

  if (-[_UIDatePickerCalendarTimeLabel allowsTextInput](self, "allowsTextInput") || v6 == 9)
  {
    -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[_UIDatePickerCalendarTimeLabel delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "timeLabel:didReceiveText:", self, v4);

      if ((v9 & 1) != 0)
        goto LABEL_16;
    }
    if (objc_msgSend(v4, "length") == 1)
    {
      v10 = objc_msgSend(v4, "characterAtIndex:", 0);
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "characterIsMember:", v10))
      {
        -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 1);

LABEL_16:
        goto LABEL_17;
      }

    }
    v16 = 0;
    v17 = 0;
    if (-[_UIDatePickerCalendarTimeLabel _digits:fromText:count:](self, "_digits:fromText:count:", &v17, v4, &v16))
    {
      if (v6 == 9)
        v12 = 9;
      else
        v12 = 8;
      -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", v12);
      if (-[_UIDatePickerCalendarTimeLabel allowsTextInput](self, "allowsTextInput") || v6 == 9)
      {
        v13 = -[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount") != 0;
        -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDigits:count:inScope:append:", v17, v16, -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"), v13);

        v15 = -[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount");
        -[_UIDatePickerCalendarTimeLabel setInsertedDigitCount:](self, "setInsertedDigitCount:", v16 + v15);
        -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUIAndNotify](self, "pushCurrentStateIntoUIAndNotify");
      }
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)deleteBackward
{
  int64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 8);
  if (-[_UIDatePickerCalendarTimeLabel allowsTextInput](self, "allowsTextInput"))
  {
    v3 = -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope");
    if (!-[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount"))
    {
      -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "digitsInScope:", v3);

      v6 = 0;
      do
      {
        ++v6;
        v7 = v5 > 9;
        v5 /= 0xAuLL;
      }
      while (v7);
      -[_UIDatePickerCalendarTimeLabel setInsertedDigitCount:](self, "setInsertedDigitCount:", v6);
    }
    -[_UIDatePickerCalendarTimeLabel inputValue](self, "inputValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastDigitInScope:", v3);

    if (-[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount"))
      -[_UIDatePickerCalendarTimeLabel setInsertedDigitCount:](self, "setInsertedDigitCount:", -[_UIDatePickerCalendarTimeLabel insertedDigitCount](self, "insertedDigitCount") - 1);
    -[_UIDatePickerCalendarTimeLabel pushCurrentStateIntoUIAndNotify](self, "pushCurrentStateIntoUIAndNotify");
  }
}

- (BOOL)isSingleLineDocument
{
  return 1;
}

+ (BOOL)supportsScribbleInteraction
{
  return 1;
}

- (BOOL)scribbleInteractionIsActive
{
  return -[UIIndirectScribbleInteraction isHandlingWriting](self->_scribbleInteraction, "isHandlingWriting");
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a5;
  -[_UIDatePickerCalendarTimeLabel stateContext](self, "stateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentState");

  v7[2]();
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  return -[UIView isFirstResponder](self->_hiddenField, "isFirstResponder", a3, a4);
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, UITextField *);
  UITextField *hiddenField;
  UITextField *v12;
  UITextField *v13;
  UITextField *v14;
  UITextField *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, UITextField *))a6;
  hiddenField = self->_hiddenField;
  if (!hiddenField)
  {
    v12 = [UITextField alloc];
    -[UIView bounds](self, "bounds");
    v13 = -[UITextField initWithFrame:](v12, "initWithFrame:");
    v14 = self->_hiddenField;
    self->_hiddenField = v13;

    -[UITextField setKeyboardType:](self->_hiddenField, "setKeyboardType:", -[_UIDatePickerCalendarTimeLabel keyboardType](self, "keyboardType"));
    -[UIView setHidden:](self->_hiddenField, "setHidden:", 1);
    -[UIView addSubview:](self, "addSubview:", self->_hiddenField);
    hiddenField = self->_hiddenField;
  }
  if (-[UITextField becomeFirstResponder](hiddenField, "becomeFirstResponder"))
    v15 = self->_hiddenField;
  else
    v15 = 0;
  v10[2](v10, v15);

}

- (BOOL)indirectScribbleInteraction:(id)a3 shouldDelayFocusForElement:(id)a4
{
  return 1;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  -[UITextField setAttributedText:](self->_hiddenField, "setAttributedText:", 0, a4);
  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 9);
  -[_UIDatePickerCalendarTimeLabel willBeginWritingInScribbleInteraction](self, "willBeginWritingInScribbleInteraction");
}

- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  uint64_t v5;
  unsigned int v6;
  void *v7;
  UITextField *hiddenField;
  id v10;

  -[UITextField text](self->_hiddenField, "text", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(v10, "substringWithRange:", v5, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerCalendarTimeLabel insertText:](self, "insertText:", v7);

      v5 = v6;
    }
    while (objc_msgSend(v10, "length") > (unint64_t)v6++);
  }
  -[UITextField resignFirstResponder](self->_hiddenField, "resignFirstResponder");
  -[UITextField removeFromSuperview](self->_hiddenField, "removeFromSuperview");
  hiddenField = self->_hiddenField;
  self->_hiddenField = 0;

  -[_UIDatePickerCalendarTimeLabel _stateMachineSendEvent:](self, "_stateMachineSendEvent:", 10);
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  return a4 != self || self->_hiddenField != a3;
}

- (_UIDatePickerCalendarTimeFormat)timeFormat
{
  return self->_timeFormat;
}

- (BOOL)roundsToMinuteInterval
{
  return self->_roundsToMinuteInterval;
}

- (_UIDatePickerCalendarTimeLabelDelegate)delegate
{
  return (_UIDatePickerCalendarTimeLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIDatePickerCalendarTimeValueStore)inputValue
{
  return self->_inputValue;
}

- (BOOL)allowsTextInput
{
  return self->_allowsTextInput;
}

- (unint64_t)insertedDigitCount
{
  return self->_insertedDigitCount;
}

- (_UIDatePickerCalendarTimeLabelStateMachineContext)stateContext
{
  return self->_stateContext;
}

- (int64_t)inputScope
{
  return self->_inputScope;
}

- (NSNumberFormatter)inputFormatter
{
  return self->_inputFormatter;
}

- (void)setInputFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_inputFormatter, a3);
}

- (CGRect)timeOfDayRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeOfDayRect.origin.x;
  y = self->_timeOfDayRect.origin.y;
  width = self->_timeOfDayRect.size.width;
  height = self->_timeOfDayRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFormatter, 0);
  objc_storeStrong((id *)&self->_stateContext, 0);
  objc_storeStrong((id *)&self->_inputValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeFormat, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_hiddenField, 0);
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
}

@end
