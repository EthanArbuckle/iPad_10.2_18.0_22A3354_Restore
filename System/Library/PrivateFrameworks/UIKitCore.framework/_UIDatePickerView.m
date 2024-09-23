@implementation _UIDatePickerView

- (_UIDatePickerView)initWithFrame:(CGRect)a3
{
  _UIDatePickerView *v3;
  _UIDatePickerView *v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  _UIDatePickerMode *mode;
  void *v9;
  uint64_t v10;
  void *v11;
  _UIDatePickerView *v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIDatePickerView;
  v3 = -[UIPickerView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->super._pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v3->super._pickerViewFlags & 0xFFFFF5FF | 0x200);
    *(_WORD *)&v3->_datePickerFlags |= 4u;
    WeakRetained = objc_loadWeakRetained((id *)&v3->_datePicker);
    if (objc_msgSend(WeakRetained, "_selectionBarIgnoresInset"))
      v6 = 0x20000;
    else
      v6 = 0;
    v4->super._pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v4->super._pickerViewFlags & 0xFFFDFFFF | v6);

    +[_UIDatePickerMode _datePickerModeWithMode:datePickerView:](_UIDatePickerMode, "_datePickerModeWithMode:datePickerView:", 2, v4);
    v7 = objc_claimAutoreleasedReturnValue();
    mode = v4->_mode;
    v4->_mode = (_UIDatePickerMode *)v7;

    v4->_expectedAMPM = -1;
    v15.receiver = v4;
    v15.super_class = (Class)_UIDatePickerView;
    -[UIPickerView setDelegate:](&v15, sel_setDelegate_, v4);
    v14.receiver = v4;
    v14.super_class = (Class)_UIDatePickerView;
    -[UIPickerView setDataSource:](&v14, sel_setDataSource_, v4);
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__hardwareKeyboardAvailabilityChanged_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

    }
    -[_UIDatePickerView _updateTimeInputLabelConfiguration](v4, "_updateTimeInputLabelConfiguration");
    v12 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerView;
  -[UIPickerView dealloc](&v4, sel_dealloc);
}

- (void)willMoveToWindow:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerView;
  -[UIView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (!a3)
  {
    -[_UIDatePickerView _disableCustomKeyboardIfNecessary](self, "_disableCustomKeyboardIfNecessary");
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (void)willMoveToSuperview:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerView;
  -[UIView willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (!a3)
  {
    -[_UIDatePickerView _disableCustomKeyboardIfNecessary](self, "_disableCustomKeyboardIfNecessary");
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (void)_enableCustomKeyboardIfNecessary
{
  __int16 datePickerFlags;
  void *v3;
  void *v4;
  id v5;

  datePickerFlags = (__int16)self->_datePickerFlags;
  if ((datePickerFlags & 0x40) == 0)
  {
    *(_WORD *)&self->_datePickerFlags = datePickerFlags | 0x40;
    -[UIView _window](self, "_window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutomaticAppearanceEnabled:", 0);

  }
}

- (void)_disableCustomKeyboardIfNecessary
{
  __int16 datePickerFlags;
  void *v3;
  void *v4;
  id v5;

  datePickerFlags = (__int16)self->_datePickerFlags;
  if ((datePickerFlags & 0x40) != 0)
  {
    *(_WORD *)&self->_datePickerFlags = datePickerFlags & 0xFFBF;
    -[UIView _window](self, "_window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutomaticAppearanceEnabled:", 1);

  }
}

- (void)didChangeToday
{
  -[_UIDatePickerMode setTodayDateComponents:](self->_mode, "setTodayDateComponents:", 0);
  -[UIPickerView reloadAllPickerPieces](self, "reloadAllPickerPieces");
  -[_UIDatePickerView _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:](self, "_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:", 0x7FFFFFFFFFFFFFFFLL);
}

- (double)_tableRowHeight
{
  double result;

  -[_UIDatePickerMode rowHeight](self->_mode, "rowHeight");
  return result;
}

- (void)_doneLoadingDateOrTime
{
  *(_WORD *)&self->_datePickerFlags &= ~2u;
  -[_UIDatePickerView _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:](self, "_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:", 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)_showingDate
{
  return -[_UIDatePickerMode datePickerMode](self->_mode, "datePickerMode") == 2
      || -[_UIDatePickerMode datePickerMode](self->_mode, "datePickerMode") == 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (int64_t)datePickerStyle
{
  return 1;
}

- (void)setData:(id)a3
{
  _UIDatePickerDataModel *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  int64_t v46;
  _UIDatePickerWheelsTimeLabel *timeInputLabel;
  _BOOL4 v48;
  char v49;
  id v50;

  v50 = a3;
  v5 = self->_data;
  objc_storeStrong((id *)&self->_data, a3);
  v6 = -[_UIDatePickerMode datePickerMode](self->_mode, "datePickerMode");
  if (v6 != objc_msgSend(v50, "datePickerMode"))
    -[_UIDatePickerView didChangeMode](self, "didChangeMode");
  -[_UIDatePickerDataModel effectiveLocale](v5, "effectiveLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "effectiveLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    v13 = v10;
    v14 = v9;
    if (v12)
      goto LABEL_27;
    v15 = objc_msgSend(v9, "isEqual:", v10);

    if (!v15)
      goto LABEL_28;
  }
  -[_UIDatePickerDataModel timeZone](v5, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;
  v18 = v17;
  v13 = v18;
  if (v14 == v18)
  {

  }
  else
  {
    if (v14)
      v19 = v18 == 0;
    else
      v19 = 1;
    v20 = v18;
    v21 = v14;
    if (v19)
      goto LABEL_26;
    v22 = objc_msgSend(v14, "isEqual:", v18);

    if (!v22)
      goto LABEL_27;
  }
  -[_UIDatePickerDataModel effectiveCalendar](v5, "effectiveCalendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "effectiveCalendar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v23;
  v25 = v24;
  if (v21 == v25)
  {

    goto LABEL_30;
  }
  v20 = v25;
  if (!v21 || !v25)
  {

LABEL_26:
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v49 = objc_msgSend(v21, "isEqual:", v25);

  if ((v49 & 1) == 0)
LABEL_29:
    -[_UIDatePickerView _updateLocaleTimeZoneOrCalendar](self, "_updateLocaleTimeZoneOrCalendar");
LABEL_30:
  -[_UIDatePickerDataModel date](v5, "date");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_40;
  v27 = (void *)v26;
  -[_UIDatePickerDataModel date](v5, "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  v31 = v29;
  if (v30 == v31)
  {

LABEL_39:
    goto LABEL_40;
  }
  v32 = v31;
  if (!v30 || !v31)
  {

    goto LABEL_38;
  }
  v33 = objc_msgSend(v30, "isEqual:", v31);

  if ((v33 & 1) == 0)
  {
LABEL_38:
    -[_UIDatePickerDataModel date](v5, "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerView didChangeDateFrom:animated:](self, "didChangeDateFrom:animated:", v27, 0);
    goto LABEL_39;
  }
LABEL_40:
  -[_UIDatePickerDataModel minimumDate](v5, "minimumDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "minimumDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  v37 = v35;
  v38 = v37;
  if (v36 == v37)
  {

  }
  else
  {
    v39 = v37;
    v40 = v36;
    if (!v36)
      goto LABEL_53;
    v39 = v37;
    v40 = v36;
    if (!v37)
      goto LABEL_53;
    v41 = objc_msgSend(v36, "isEqual:", v37);

    if (!v41)
      goto LABEL_54;
  }
  -[_UIDatePickerDataModel maximumDate](v5, "maximumDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "maximumDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v42;
  v44 = v43;
  if (v40 == v44)
  {

    goto LABEL_56;
  }
  v39 = v44;
  if (!v40 || !v44)
  {

LABEL_53:
LABEL_54:

    goto LABEL_55;
  }
  v45 = objc_msgSend(v40, "isEqual:", v44);

  if ((v45 & 1) == 0)
LABEL_55:
    -[_UIDatePickerView _updateDateForNewDateRange](self, "_updateDateForNewDateRange");
LABEL_56:
  v46 = -[_UIDatePickerMode minuteInterval](self->_mode, "minuteInterval");
  if (v46 != objc_msgSend(v50, "minuteInterval"))
    -[_UIDatePickerView didChangeMinuteInterval](self, "didChangeMinuteInterval");
  timeInputLabel = self->_timeInputLabel;
  if (timeInputLabel)
  {
    v48 = -[_UIDatePickerCalendarTimeLabel roundsToMinuteInterval](timeInputLabel, "roundsToMinuteInterval");
    if (v48 != -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval"))
      -[_UIDatePickerView didChangeRoundsToMinuteInterval](self, "didChangeRoundsToMinuteInterval");
  }

}

- (void)_updateLocaleTimeZoneOrCalendar
{
  void *v3;
  void *v4;
  id v5;

  -[_UIDatePickerMode noteCalendarChanged](self->_mode, "noteCalendarChanged");
  -[_UIDatePickerMode updateDateForNewDateRange](self->_mode, "updateDateForNewDateRange");
  -[_UIDatePickerView _removeUnitLabels](self, "_removeUnitLabels");
  -[UIPickerView reloadAllPickerPieces](self, "reloadAllPickerPieces");
  -[_UIDatePickerView didChangeDateFrom:animated:](self, "didChangeDateFrom:animated:", 0, 0);
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDatePickerView _currentTimeFormat](self, "_currentTimeFormat");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeFormat:", v5);

  }
}

- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  id v15;

  v4 = a4;
  v6 = a3;
  self->_expectedAMPM = -1;
  v15 = v6;
  if ((*(_BYTE *)&self->_datePickerFlags & 2) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__doneLoadingDateOrTime, 0);
    v6 = v15;
  }
  if (v6 && -[_UIDatePickerMode datePickerMode](self->_mode, "datePickerMode") == 2)
  {
    -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v15, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "day");
    if (v10 >= 0)
      v11 = v10;
    else
      v11 = -v10;

    if (v4)
      v12 = 2;
    else
      v12 = 0;
    v13 = *(_WORD *)&self->_datePickerFlags & 0xFFFD;
    *(_WORD *)&self->_datePickerFlags = v13 | v12;
    if (v11 >= 0x78)
    {
      *(_WORD *)&self->_datePickerFlags = v13;
      -[UIPickerView reloadAllComponents](self, "reloadAllComponents");
    }
  }
  else
  {
    if (v4)
      v14 = 2;
    else
      v14 = 0;
    *(_WORD *)&self->_datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFD | v14;
  }
  -[_UIDatePickerView _loadDateAnimated:](self, "_loadDateAnimated:", v4);
  if ((*(_WORD *)&self->_datePickerFlags & 2) != 0)
  {
    -[UIPickerView scrollAnimationDuration](self, "scrollAnimationDuration");
    -[_UIDatePickerView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__doneLoadingDateOrTime, 0);
    -[_UIDatePickerView _updateEnabledCellsIncludingWMDCells:](self, "_updateEnabledCellsIncludingWMDCells:", 0);
  }
  else
  {
    -[_UIDatePickerView _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:](self, "_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:", 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)_updateDateForNewDateRange
{
  -[_UIDatePickerMode updateDateForNewDateRange](self->_mode, "updateDateForNewDateRange");
  -[_UIDatePickerView _updateEnabledCellsIncludingWMDCells:](self, "_updateEnabledCellsIncludingWMDCells:", 1);
  -[_UIDatePickerView _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:](self, "_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:", 0x7FFFFFFFFFFFFFFFLL);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return -[_UIDatePickerMode numberOfComponents](self->_mode, "numberOfComponents", a3);
}

- (BOOL)_isTimeIntervalMode
{
  return -[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode");
}

- (void)_setMode:(id)a3
{
  void *v5;
  _UIDatePickerMode **p_mode;
  int64_t v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_mode = &self->_mode;
  v7 = -[_UIDatePickerMode displayedCalendarUnits](self->_mode, "displayedCalendarUnits");
  if ((v7 & objc_msgSend(v10, "displayedCalendarUnits") & 0xFFFFFFFFFFFEFFFFLL) == 0)
  {

    v5 = 0;
  }
  v8 = 0.0;
  if (-[_UIDatePickerMode isTimeIntervalMode](*p_mode, "isTimeIntervalMode"))
  {

    -[_UIDatePickerView timeInterval](self, "timeInterval");
    v8 = v9;
    v5 = 0;
  }
  objc_storeStrong((id *)p_mode, a3);
  -[_UIDatePickerMode setMinuteInterval:](*p_mode, "setMinuteInterval:", -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval"));
  *(_WORD *)&self->_datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFE | (-[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval") > 1);
  -[_UIDatePickerCalendarTimeLabel setMinuteInterval:](self->_timeInputLabel, "setMinuteInterval:", -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval"));
  -[_UIDatePickerMode updateDateForNewDateRange](*p_mode, "updateDateForNewDateRange");
  -[UIPickerView reloadAllPickerPieces](self, "reloadAllPickerPieces");
  if (-[_UIDatePickerMode isTimeIntervalMode](*p_mode, "isTimeIntervalMode"))
  {
    -[_UIDatePickerView setTimeInterval:](self, "setTimeInterval:", v8);
  }
  else
  {
    -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", v5);
    -[_UIDatePickerView didChangeDateFrom:animated:](self, "didChangeDateFrom:animated:", 0, 0);
  }
  -[_UIDatePickerView _updateTimeInputLabelConfiguration](self, "_updateTimeInputLabelConfiguration");

}

- (void)didChangeMode
{
  int64_t v3;
  id v4;

  v3 = -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
  if (v3 != -[_UIDatePickerMode datePickerMode](self->_mode, "datePickerMode"))
  {
    if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
      -[_UIDatePickerView _removeUnitLabels](self, "_removeUnitLabels");
    +[_UIDatePickerMode _datePickerModeWithMode:datePickerView:](_UIDatePickerMode, "_datePickerModeWithMode:datePickerView:", -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode"), self);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerDataModel setDatePickerMode:](self->_data, "setDatePickerMode:", objc_msgSend(v4, "datePickerMode"));
    -[_UIDatePickerView _setMode:](self, "_setMode:", v4);

  }
}

- (void)didChangeMinuteInterval
{
  int64_t v3;

  v3 = -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval");
  -[_UIDatePickerMode setMinuteInterval:](self->_mode, "setMinuteInterval:", v3);
  *(_WORD *)&self->_datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFE | (v3 > 1);
  -[_UIDatePickerCalendarTimeLabel setMinuteInterval:](self->_timeInputLabel, "setMinuteInterval:", v3);
  if ((*(_BYTE *)&self->super._pickerViewFlags & 1) == 0)
    -[UIPickerView reloadAllComponents](self, "reloadAllComponents");
  -[_UIDatePickerView _loadDateAnimated:](self, "_loadDateAnimated:", 0);
  -[_UIDatePickerView _updateWheelsLabelForCurrentDateComponents](self, "_updateWheelsLabelForCurrentDateComponents");
}

- (void)didChangeRoundsToMinuteInterval
{
  -[_UIDatePickerCalendarTimeLabel setRoundsToMinuteInterval:](self->_timeInputLabel, "setRoundsToMinuteInterval:", -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval"));
  -[_UIDatePickerView _loadDateAnimated:](self, "_loadDateAnimated:", 0);
  -[_UIDatePickerView _updateWheelsLabelForCurrentDateComponents](self, "_updateWheelsLabelForCurrentDateComponents");
}

- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5
{
  int64_t v8;
  _BOOL4 v9;
  id v11;
  int64_t v12;
  int64_t v13;
  BOOL v14;
  BOOL v15;
  int64_t v16;
  void *v17;
  _UIDatePickerView *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  id v26;
  id v27;

  v27 = a3;
  v8 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 32);
  if (!-[_UIDatePickerMode is24Hour](self->_mode, "is24Hour"))
  {
    v9 = -[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode");
    if (a5 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && !v9 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v27)
      {
        v12 = -[_UIDatePickerMode hourForRow:](self->_mode, "hourForRow:", a4);
        v13 = -[_UIDatePickerMode hourForRow:](self->_mode, "hourForRow:", a5);
        v14 = v12 == 11 && v13 == 12;
        if (v14 || (v12 == 12 ? (v15 = v13 == 11) : (v15 = 0), v15))
        {
          self->_expectedAMPM = -[_UIDatePickerView _amPmValue](self, "_amPmValue") == 0;
          v16 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 0x10000);
          -[_UIDatePickerView _selectRow:inComponent:animated:notify:](self, "_selectRow:inComponent:animated:notify:", self->_expectedAMPM, v16, 1, 0);
          -[_UIDatePickerMode updateSelectedDateComponentsWithNewValueInComponent:](self->_mode, "updateSelectedDateComponentsWithNewValueInComponent:", v16);
        }
      }
    }
  }
  if (self->_timeInputLabel && (*(_WORD *)&self->_datePickerFlags & 0x10) == 0)
  {
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "wheelsActive") & 1) == 0)
    {
      v18 = self;
      v19 = -[UIPickerView numberOfComponents](v18, "numberOfComponents");
      if (v19 >= 1)
      {
        v20 = v19;
        -[UIPickerView tableViewForColumn:](v18, "tableViewForColumn:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isDragging") & 1) != 0 || (objc_msgSend(v21, "isDecelerating") & 1) != 0)
        {

LABEL_26:
          -[_UIDatePickerWheelsTimeLabel beginEditingWheels](self->_timeInputLabel, "beginEditingWheels");
          goto LABEL_35;
        }
        v22 = 1;
        while (1)
        {
          v23 = v22;

          if (v20 == v23)
            break;
          -[UIPickerView tableViewForColumn:](v18, "tableViewForColumn:", v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isDragging") & 1) == 0)
          {
            v24 = objc_msgSend(v21, "isDecelerating");
            v22 = v23 + 1;
            if ((v24 & 1) == 0)
              continue;
          }

          if (v20 > v23)
            goto LABEL_26;
          goto LABEL_35;
        }
      }

    }
LABEL_35:
    if (-[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 32) != 0x7FFFFFFFFFFFFFFFLL
      && (-[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 32)), v25 = (id)objc_claimAutoreleasedReturnValue(), v25, v25 == v27))
    {
      -[_UIDatePickerWheelsTimeLabel updateHoursFromDatePicker:wheelsChanged:](self->_timeInputLabel, "updateHoursFromDatePicker:wheelsChanged:", -[_UIDatePickerMode valueForRow:inCalendarUnit:](self->_mode, "valueForRow:inCalendarUnit:", a5, 32), 1);
    }
    else if (-[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 64) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 64));
      v26 = (id)objc_claimAutoreleasedReturnValue();

      if (v26 == v27)
        -[_UIDatePickerWheelsTimeLabel updateMinutesFromDatePicker:wheelsChanged:](self->_timeInputLabel, "updateMinutesFromDatePicker:wheelsChanged:", -[_UIDatePickerMode valueForRow:inCalendarUnit:](self->_mode, "valueForRow:inCalendarUnit:", a5, 64), 1);
    }
  }

}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[_UIDatePickerMode numberOfRowsInComponent:](self->_mode, "numberOfRowsInComponent:", a4);
}

- (void)_loadDateAnimated:(BOOL)a3
{
  int64_t loadingDate;
  _BOOL8 v4;
  _UIDatePickerMode *mode;
  void *v7;

  loadingDate = self->_loadingDate;
  if (loadingDate <= 0)
  {
    v4 = a3;
    self->_loadingDate = loadingDate + 1;
    mode = self->_mode;
    -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerMode loadDate:animated:](mode, "loadDate:animated:", v7, v4);

    --self->_loadingDate;
  }
}

- (void)_selectRow:(int64_t)a3 inComponent:(int64_t)a4 animated:(BOOL)a5 notify:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerView;
  -[UIPickerView _selectRow:inComponent:animated:notify:](&v7, sel__selectRow_inComponent_animated_notify_, a3, a4, a5, a6);
  if (!self->_loadingDate)
    -[_UIDatePickerView _updateEnabledCellsIncludingWMDCells:](self, "_updateEnabledCellsIncludingWMDCells:", 1);
}

- (int)_selectedHourForColumn:(int)a3
{
  return -[_UIDatePickerMode hourForRow:](self->_mode, "hourForRow:", -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", a3));
}

- (int)_selectedMinuteForColumn:(int)a3
{
  return -[_UIDatePickerMode minuteForRow:](self->_mode, "minuteForRow:", -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", a3));
}

- (id)_componentsSelectedAfterEnforcingValidityOfComponents:(id)a3 withLastManipulatedComponent:(int64_t)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = -[_UIDatePickerMode areValidDateComponents:comparingUnits:](self->_mode, "areValidDateComponents:comparingUnits:", v6, -[_UIDatePickerMode displayedCalendarUnits](self->_mode, "displayedCalendarUnits"));
  v8 = v6;
  v9 = v8;
  if (!v7)
  {
    -[_UIDatePickerMode dateComponentsByRestrictingSelectedComponents:withLastManipulatedColumn:](self->_mode, "dateComponentsByRestrictingSelectedComponents:withLastManipulatedColumn:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  int64_t v13;

  if ((*(_WORD *)&self->_datePickerFlags & 2) != 0)
    return 0;
  -[_UIDatePickerMode selectedDateComponents](self->_mode, "selectedDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerView _componentsSelectedAfterEnforcingValidityOfComponents:withLastManipulatedComponent:](self, "_componentsSelectedAfterEnforcingValidityOfComponents:withLastManipulatedComponent:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel lastSelectedDateComponents](self->_data, "lastSelectedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "era");

  v9 = _UIDatePickerCompareDateComponents(v5, v6, -[_UIDatePickerMode displayedCalendarUnits](self->_mode, "displayedCalendarUnits"));
  v10 = v9 != 0;
  if (v9)
  {
    -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", 0);
    v11 = (void *)objc_msgSend(v6, "copy");
    -[_UIDatePickerDataModel setLastSelectedDateComponents:](self->_data, "setLastSelectedDateComponents:", v11);

    -[_UIDatePickerView _loadDateAnimated:](self, "_loadDateAnimated:", 1);
  }
  else
  {
    v12 = (void *)objc_msgSend(v6, "copy");
    -[_UIDatePickerDataModel setLastSelectedDateComponents:](self->_data, "setLastSelectedDateComponents:", v12);

  }
  -[_UIDatePickerView _updateEnabledCellsIncludingWMDCells:](self, "_updateEnabledCellsIncludingWMDCells:", 1);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 != objc_msgSend(v6, "era"))
  {
    v13 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 4);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      -[UIPickerView reloadComponent:](self, "reloadComponent:", v13);
  }

  return v10;
}

- (void)_updateLabels:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    v5 = -[_UIDatePickerView _selectedHourForColumn:](self, "_selectedHourForColumn:", 0);
    -[_UIDatePickerView _hoursStringForHour:](self, "_hoursStringForHour:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerView _fadeLabelForCalendarUnit:toText:animated:](self, "_fadeLabelForCalendarUnit:toText:animated:", 32, v7, v3);
    -[_UIDatePickerView _minutesStringForHour:minutes:](self, "_minutesStringForHour:minutes:", v5, -[_UIDatePickerView _selectedMinuteForColumn:](self, "_selectedMinuteForColumn:", 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerView _fadeLabelForCalendarUnit:toText:animated:](self, "_fadeLabelForCalendarUnit:toText:animated:", 64, v6, v3);

  }
}

- (void)_updateLabelColors
{
  void *v3;
  void *v4;

  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    -[_UIDatePickerView _labelForCalendarUnit:createIfNecessary:](self, "_labelForCalendarUnit:createIfNecessary:", 32, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerView _updateTextColorForCalendarUnitLabel:](self, "_updateTextColorForCalendarUnitLabel:", v3);

    -[_UIDatePickerView _labelForCalendarUnit:createIfNecessary:](self, "_labelForCalendarUnit:createIfNecessary:", 64, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerView _updateTextColorForCalendarUnitLabel:](self, "_updateTextColorForCalendarUnitLabel:", v4);

  }
  -[_UIDatePickerMode invalidateTodayTextColor](self->_mode, "invalidateTodayTextColor");
}

- (void)_removeUnitLabels
{
  UILabel *hourLabel;
  UILabel *minuteLabel;

  -[UIView removeFromSuperview](self->_hourLabel, "removeFromSuperview");
  hourLabel = self->_hourLabel;
  self->_hourLabel = 0;

  -[UIView removeFromSuperview](self->_minuteLabel, "removeFromSuperview");
  minuteLabel = self->_minuteLabel;
  self->_minuteLabel = 0;

}

- (void)_setTextColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerView;
  -[UIPickerView _setTextColor:](&v4, sel__setTextColor_, a3);
  -[_UIDatePickerView _updateLabelColors](self, "_updateLabelColors");
}

- (id)_labelForCalendarUnit:(unint64_t)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  UILabel **p_minuteLabel;
  UILabel *minuteLabel;
  BOOL v9;
  void *v10;
  _UIDatePickerView *v11;
  uint64_t v12;
  UILabel *v13;
  BOOL v14;

  v4 = a4;
  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    if (a3 == 64)
    {
      p_minuteLabel = &self->_minuteLabel;
      minuteLabel = self->_minuteLabel;
      if (minuteLabel)
        v14 = 1;
      else
        v14 = !v4;
      if (v14)
        goto LABEL_16;
      -[_UIDatePickerView _minutesStringForHour:minutes:](self, "_minutesStringForHour:minutes:", 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = 64;
      goto LABEL_15;
    }
    if (a3 == 32)
    {
      p_minuteLabel = &self->_hourLabel;
      minuteLabel = self->_hourLabel;
      if (minuteLabel)
        v9 = 1;
      else
        v9 = !v4;
      if (v9)
        goto LABEL_16;
      -[_UIDatePickerView _hoursStringForHour:](self, "_hoursStringForHour:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = 32;
LABEL_15:
      -[_UIDatePickerView _fadeLabelForCalendarUnit:toText:animated:](v11, "_fadeLabelForCalendarUnit:toText:animated:", v12, v10, 0);

      minuteLabel = *p_minuteLabel;
LABEL_16:
      v13 = minuteLabel;
      return v13;
    }
  }
  v13 = 0;
  return v13;
}

- (void)_setLabel:(id)a3 forCalendarUnit:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v9;
  id *v10;
  id v11;

  v11 = a3;
  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    if (a4 == 64)
    {
      v9 = 584;
    }
    else
    {
      if (a4 != 32)
        goto LABEL_10;
      v9 = 576;
    }
    v10 = (id *)((char *)&self->super.super.super.super.isa + v9);
    if (*v10 != v11)
    {
      if (!a5)
        objc_msgSend(*v10, "removeFromSuperview");
      objc_storeStrong(v10, a3);
    }
  }
LABEL_10:

}

- (void)_positionLabel:(id)a3 forCalendarUnit:(unint64_t)a4 relativeTo:(id)a5 order:(int64_t)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(v10, "frame");
  v13 = v12;
  v15 = v14;
  if (v11)
  {
    objc_msgSend(v11, "frame");
    v17 = v16;
    v19 = v18;
    if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      objc_msgSend(v11, "frame");
      v17 = v17 + v20 - v13;
    }
    if (v10 != v11)
      -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", v10, a6, v11);
  }
  else
  {
    v21 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", a4);
    -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerView _effectiveTableViewFrameForColumn:](self, "_effectiveTableViewFrameForColumn:", v21);
    v23 = objc_alloc_init((Class)off_1E1679CC0);
    objc_msgSend(v23, "setWantsBaselineOffset:", 1);
    v24 = objc_alloc(MEMORY[0x1E0CB3498]);
    v38 = *(_QWORD *)off_1E1678D90;
    -[_UIDatePickerMode fontForCalendarUnit:](self->_mode, "fontForCalendarUnit:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithString:attributes:", CFSTR("00"), v26);

    objc_msgSend(v27, "boundingRectWithSize:options:context:", 1, v23, 1.79769313e308, 1.79769313e308);
    -[_UIDatePickerView _contentViewForSizingLabelForPositioningInComponent:](self, "_contentViewForSizingLabelForPositioningInComponent:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", a4));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    v31 = v30;
    objc_msgSend(v22, "rowHeight");
    v33 = v32;
    -[UIView bounds](self, "bounds");
    objc_msgSend(v28, "setFrame:", 0.0, round(v35 + (v34 - v33) * 0.5), v31, v33);
    objc_msgSend(v28, "layoutIfNeeded");
    objc_msgSend(v29, "size");
    objc_msgSend(v29, "_baselineOffsetFromBottom");
    objc_msgSend(v10, "_baselineOffsetFromBottom");
    -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    UIRoundToViewScale(v10);
    v17 = v36;
    UIRoundToViewScale(v10);
    v19 = v37;
    -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", v10, a6, v22);

  }
  objc_msgSend(v10, "setFrame:", v17, v19, v13, v15);

}

- (id)_contentViewForSizingLabelForPositioningInComponent:(int64_t)a3
{
  return -[_UIDatePickerMode viewForRow:inComponent:reusingView:](self->_mode, "viewForRow:inComponent:reusingView:", 0, a3, 0);
}

- (id)_makeNewCalendarUnitLabel
{
  UILabel *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = [UILabel alloc];
  v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UIDatePickerView _hrMinFont](self, "_hrMinFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v4, "setFont:", v5);

  -[_UIDatePickerView _updateTextColorForCalendarUnitLabel:](self, "_updateTextColorForCalendarUnitLabel:", v4);
  -[_UIDatePickerView shadowColor](self, "shadowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setShadowColor:](v4, "setShadowColor:", v6);

  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", 0);
  -[UIView setOpaque:](v4, "setOpaque:", 0);
  -[_UIDatePickerView shadowColor](self, "shadowColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setShadowColor:](v4, "setShadowColor:", v7);

  -[UILabel setShadowOffset:](v4, "setShadowOffset:", 0.0, 1.0);
  return v4;
}

- (void)_updateTextColorForCalendarUnitLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPickerView _textColor](self, "_textColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)_fadeLabelForCalendarUnit:(unint64_t)a3 toText:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a5;
  v8 = a4;
  -[_UIDatePickerView _labelForCalendarUnit:createIfNecessary:](self, "_labelForCalendarUnit:createIfNecessary:", a3, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  v12 = v9;
  if ((v11 & 1) == 0)
  {
    if (v5)
    {
      -[_UIDatePickerView _makeNewCalendarUnitLabel](self, "_makeNewCalendarUnitLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setText:", v8);
      -[_UIDatePickerView _positionLabel:forCalendarUnit:relativeTo:order:](self, "_positionLabel:forCalendarUnit:relativeTo:order:", v13, a3, v9, -3);
      -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", v13, -3, v9);
      objc_msgSend(v13, "setAlpha:", 0.0);
      v14 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke;
      v20[3] = &unk_1E16B1B28;
      v21 = v9;
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke_2;
      v18[3] = &unk_1E16B3FD8;
      v19 = v21;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v20, v18, 0.2, 0.0);
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke_3;
      v16[3] = &unk_1E16B1B28;
      v12 = v13;
      v17 = v12;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v16, 0, 0.2, 0.0);

    }
    else
    {
      v12 = v9;
      if (!v9)
      {
        -[_UIDatePickerView _makeNewCalendarUnitLabel](self, "_makeNewCalendarUnitLabel");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "setText:", v8);
      -[_UIDatePickerView _positionLabel:forCalendarUnit:relativeTo:order:](self, "_positionLabel:forCalendarUnit:relativeTo:order:", v12, a3, v9, -3);
    }
  }
  -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _addSubview:positioned:relativeTo:](self, "_addSubview:positioned:relativeTo:", v12, -2, v15);
  -[_UIDatePickerView _setLabel:forCalendarUnit:animated:](self, "_setLabel:forCalendarUnit:animated:", v12, a3, v5);

}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  _BOOL4 v7;
  void *v8;
  int v9;
  _UIDatePickerView *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  id WeakRetained;
  void *v19;
  int v20;
  id v21;

  -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", 0, a4);
  v7 = -[_UIDatePickerMode hasSelectedDateComponents](self->_mode, "hasSelectedDateComponents");
  -[_UIDatePickerMode selectedDateComponents](self->_mode, "selectedDateComponents");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode updateSelectedDateComponentsWithNewValueInComponent:](self->_mode, "updateSelectedDateComponentsWithNewValueInComponent:", a5);
  if (v7)
  {
    -[_UIDatePickerMode selectedDateComponents](self->_mode, "selectedDateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v21, "isEqual:", v8) ^ 1;

  }
  else
  {
    v9 = 1;
  }
  v10 = self;
  v11 = -[UIPickerView numberOfComponents](v10, "numberOfComponents");
  if (v11 >= 1)
  {
    v12 = v11;
    -[UIPickerView tableViewForColumn:](v10, "tableViewForColumn:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isDragging") & 1) != 0 || (objc_msgSend(v13, "isDecelerating") & 1) != 0)
    {

      goto LABEL_19;
    }
    v14 = 1;
    while (1)
    {
      v15 = v14;

      if (v12 == v15)
        break;
      -[UIPickerView tableViewForColumn:](v10, "tableViewForColumn:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isDragging") & 1) == 0)
      {
        v16 = objc_msgSend(v13, "isDecelerating");
        v14 = v15 + 1;
        if ((v16 & 1) == 0)
          continue;
      }

      if (v12 <= v15)
        goto LABEL_15;
      goto LABEL_21;
    }
  }

LABEL_15:
  v17 = -[_UIDatePickerView _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:](v10, "_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:", a5) | v9;
  -[_UIDatePickerView _updateLabels:](v10, "_updateLabels:", 1);
  if (v17 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v10->_datePicker);
    objc_msgSend(WeakRetained, "_emitValueChanged");

  }
  -[_UIDatePickerView timeInputLabel](v10, "timeInputLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "wheelsActive");

  if (!v20)
  {
    -[_UIDatePickerView _updateWheelsLabelForCurrentDateComponents](v10, "_updateWheelsLabelForCurrentDateComponents");
    goto LABEL_21;
  }
  -[_UIDatePickerView timeInputLabel](v10, "timeInputLabel");
  v10 = (_UIDatePickerView *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerView endEditingWheels](v10, "endEditingWheels");
LABEL_19:

LABEL_21:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[_UIDatePickerView _updateEnabledCellsIncludingWMDCells:](self, "_updateEnabledCellsIncludingWMDCells:", 0);
}

- (void)_updateEnabledCellsIncludingWMDCells:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v15;

  v3 = a3;
  v5 = -[UIPickerView numberOfComponents](self, "numberOfComponents");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = v5;
    do
    {
      v8 = -[_UIDatePickerMode calendarUnitForComponent:](self->_mode, "calendarUnitForComponent:", v6);
      v9 = -[UIPickerView visibleRowsForColumn:](self, "visibleRowsForColumn:", v6);
      if (v10)
      {
        v11 = v9 + v10;
        if (v9 + v10 > (unint64_t)(int)v9)
        {
          v12 = (int)v9;
          v13 = v8 != 536 || v3;
          do
          {
            -[UIPickerView viewForRow:forComponent:](self, "viewForRow:forComponent:", v12, v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              v15 = v13;
            else
              v15 = 0;
            if (v15 == 1)
              -[_UIDatePickerMode updateEnabledStateOfViewForRow:inComponent:](self->_mode, "updateEnabledStateOfViewForRow:inComponent:", v12, v6);

            ++v12;
          }
          while (v11 != v12);
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }
}

- (void)setTimeInterval:(double)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = vcvtmd_s64_f64(fmin(fmax(a3, 0.0), 86400.0));
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHour:", v4 / 0xE10);
  objc_msgSend(v9, "setMinute:", v4 % 0xE10 / 0x3C);
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", v8);

  -[_UIDatePickerView didChangeDateFrom:animated:](self, "didChangeDateFrom:animated:", 0, 0);
}

- (double)timeInterval
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;

  -[_UIDatePickerDataModel lastSelectedDateComponents](self->_data, "lastSelectedDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 60 * objc_msgSend(v2, "minute");
  v4 = v3 + 3600 * objc_msgSend(v2, "hour");
  v5 = (double)(unint64_t)(v4 + objc_msgSend(v2, "second"));

  return v5;
}

- (double)contentWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerMode totalComponentWidth](self->_mode, "totalComponentWidth");
  v6 = v5;
  objc_msgSend(v4, "pickerHorizontalEdgeInset");
  v8 = v6 + v7 + v7;
  -[UIView bounds](self, "bounds");
  if (v8 >= v9)
    v8 = v9;

  return v8;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  double result;

  -[_UIDatePickerMode rowHeight](self->_mode, "rowHeight", a3, a4);
  return result;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[UIView traitCollection](self, "traitCollection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pickerHorizontalEdgeInset");
  v9 = v8;
  -[UIPickerView _selectionBarSideInset](self, "_selectionBarSideInset");
  v11 = v9 + v10;
  -[UIView bounds](self, "bounds");
  v13 = v12 - (v11 + v11);
  if (v13 < 0.0)
    v13 = 1.79769313e308;
  -[_UIDatePickerMode widthForComponent:maxWidth:](self->_mode, "widthForComponent:maxWidth:", a4, v13);
  v15 = v14;

  return v15;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  -[_UIDatePickerMode viewForRow:inComponent:reusingView:](self->_mode, "viewForRow:inComponent:reusingView:", a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    v9 = -[_UIDatePickerMode calendarUnitForComponent:](self->_mode, "calendarUnitForComponent:", a5);
    if (v9 == 64 || v9 == 32)
    {
      -[_UIDatePickerView _labelForCalendarUnit:createIfNecessary:](self, "_labelForCalendarUnit:createIfNecessary:", v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertRect:toView:](self, "convertRect:toView:", v19, v12, v14, v16, v18);
      v21 = v20;

      objc_msgSend(v8, "setTitleLabelMaxX:", fabs(v21 + -3.0));
    }
  }
  return v8;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIDatePickerView;
    -[UIPickerView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[_UIDatePickerView _removeUnitLabels](self, "_removeUnitLabels");
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
    -[_UIDatePickerMode resetComponentWidths](self->_mode, "resetComponentWidths");
    -[_UIDatePickerView _updateTimeInputLabelPosition](self, "_updateTimeInputLabelPosition");
  }
}

- (void)layoutSubviews
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  objc_super v9;

  pickerViewFlags = self->super._pickerViewFlags;
  v9.receiver = self;
  v9.super_class = (Class)_UIDatePickerView;
  -[UIPickerView layoutSubviews](&v9, sel_layoutSubviews);
  if ((*(_BYTE *)&pickerViewFlags & 1) != 0 && !self->_loadingDate)
    -[_UIDatePickerView _loadDateAnimated:](self, "_loadDateAnimated:", 0);
  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    v4 = -[UIPickerView numberOfComponents](self, "numberOfComponents");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((*(_BYTE *)&pickerViewFlags & 1) != 0)
          objc_msgSend(v7, "reloadData");

      }
    }
  }
  -[_UIDatePickerView _updateLabels:](self, "_updateLabels:", 0);
  -[_UIDatePickerView _updateTimeInputLabelPosition](self, "_updateTimeInputLabelPosition");
}

- (void)_setHidesLabels:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = -[UIPickerView numberOfComponents](self, "numberOfComponents");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = v5;
    do
    {
      -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", v3);

      ++v6;
    }
    while (v7 != v6);
  }
  -[UIView setHidden:](self->_hourLabel, "setHidden:", v3);
  -[UIView setHidden:](self->_minuteLabel, "setHidden:", v3);
}

- (void)_setUsesBlackChrome:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFF7 | v3;
  -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_usesBlackChrome
{
  return (*(_WORD *)&self->_datePickerFlags >> 3) & 1;
}

- (void)_setAllowsZeroTimeInterval:(BOOL)a3
{
  self->_allowsZeroTimeInterval = a3;
  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
    -[UIPickerView reloadAllComponents](self, "reloadAllComponents");
}

- (BOOL)_allowsZeroTimeInterval
{
  return self->_allowsZeroTimeInterval;
}

- (id)_viewForSelectedRowInComponent:(int64_t)a3
{
  NSInteger v5;
  NSInteger v6;
  void *v7;

  v5 = -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:");
  if (v5 < 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = v5;
    -[UIPickerView viewForRow:forComponent:](self, "viewForRow:forComponent:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[_UIDatePickerView didChangeDateFrom:animated:](self, "didChangeDateFrom:animated:", 0, 0);
      -[UIPickerView viewForRow:forComponent:](self, "viewForRow:forComponent:", v6, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7;
}

- (void)_updateTimeInputLabelPosition
{
  int64_t v3;
  int64_t v4;
  double v5;
  BOOL v6;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  _UIDatePickerWheelsTimeLabel *timeInputLabel;
  _QWORD v20[3];
  _QWORD v21[3];

  v3 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 32);
  v4 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 64);
  -[UIPickerView _selectionBarSideInset](self, "_selectionBarSideInset");
  if (self->_timeInputLabel)
    v6 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 1;
  if (!v6 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v5;
    -[UIPickerView _effectiveTableViewFrameForColumn:](self, "_effectiveTableViewFrameForColumn:", v3);
    v10 = v9 - v8;
    -[_UIDatePickerView pickerView:widthForComponent:](self, "pickerView:widthForComponent:", self, v3);
    v12 = v11;
    v13 = -[_UIDatePickerMode titleAlignmentForCalendarUnit:](self->_mode, "titleAlignmentForCalendarUnit:", 32);
    -[UIPickerView _effectiveTableViewFrameForColumn:](self, "_effectiveTableViewFrameForColumn:", v4);
    v15 = v14 - v8;
    -[_UIDatePickerView pickerView:widthForComponent:](self, "pickerView:widthForComponent:", self, v4);
    v17 = v16;
    v18 = -[_UIDatePickerMode titleAlignmentForCalendarUnit:](self->_mode, "titleAlignmentForCalendarUnit:", 64);
    -[UIView addSubview:](self, "addSubview:", self->_timeInputLabel);
    -[_UIDatePickerView _currentTimeInputLabelFrame](self, "_currentTimeInputLabelFrame");
    -[UIView setFrame:](self->_timeInputLabel, "setFrame:");
    -[UIView center](self, "center");
    -[UIView setCenter:](self->_timeInputLabel, "setCenter:");
    timeInputLabel = self->_timeInputLabel;
    *(double *)v21 = v10;
    v21[1] = v12;
    v21[2] = v13;
    *(double *)v20 = v15;
    v20[1] = v17;
    v20[2] = v18;
    -[_UIDatePickerWheelsTimeLabel configureLabelsForHour:minute:](timeInputLabel, "configureLabelsForHour:minute:", v21, v20);
    -[_UIDatePickerView _hidePickerViewSelectionBarForTimeInputLabel:](self, "_hidePickerViewSelectionBarForTimeInputLabel:", -[UIView isFirstResponder](self->_timeInputLabel, "isFirstResponder"));
  }
}

- (void)_hidePickerViewSelectionBarForTimeInputLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  __int16 v7;

  v3 = a3;
  if (-[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

  }
  if (-[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 64) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

  }
  if (v3)
    v7 = 128;
  else
    v7 = 0;
  *(_WORD *)&self->_datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFF7F | v7;
}

- (void)_updateTimeInputLabelConfiguration
{
  if (-[_UIDatePickerView _shouldInstallTimeInputLabelForDatePickerMode:](self, "_shouldInstallTimeInputLabelForDatePickerMode:", -[_UIDatePickerMode datePickerMode](self->_mode, "datePickerMode")))
  {
    -[_UIDatePickerView _installTimeInputLabelIfNeeded](self, "_installTimeInputLabelIfNeeded");
  }
  else
  {
    -[_UIDatePickerView _uninstallTimeInputLabelIfNeeded](self, "_uninstallTimeInputLabelIfNeeded");
  }
}

- (BOOL)_shouldInstallTimeInputLabelForDatePickerMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)_currentTimeFormat
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIDatePickerDataModel formattingCalendar](self->_data, "formattingCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDatePickerCalendarTimeFormat formatWithCalendar:locale:followsSystemHourCycle:](_UIDatePickerCalendarTimeFormat, "formatWithCalendar:locale:followsSystemHourCycle:", v3, v4, -[_UIDatePickerDataModel followsSystemHourCycle](self->_data, "followsSystemHourCycle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)_currentTimeInputLabelFrame
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v9);
  -[UIPickerView _selectionBarSideInset](self, "_selectionBarSideInset");
  v5 = Width - (v4 + v4);
  v6 = 32.0;
  v7 = 0.0;
  v8 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)_installTimeInputLabelIfNeeded
{
  _UIDatePickerWheelsTimeLabel *v3;
  void *v4;
  _UIDatePickerWheelsTimeLabel *v5;
  _UIDatePickerDataModel *data;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIControlEventsGestureRecognizer *v12;
  _UIControlEventsGestureRecognizer *controlEventsGestureRecognizer;
  _UIControlEventsGestureRecognizer *v14;
  _UIDatePickerWheelsTimeLabel *timeInputLabel;
  id v16;

  if (self->_timeInputLabel)
  {
    -[_UIDatePickerView _updateTimeInputLabelPosition](self, "_updateTimeInputLabelPosition");
  }
  else
  {
    v3 = [_UIDatePickerWheelsTimeLabel alloc];
    -[_UIDatePickerView _currentTimeFormat](self, "_currentTimeFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UIDatePickerWheelsTimeLabel initWithTimeFormat:minuteInterval:](v3, "initWithTimeFormat:minuteInterval:", v4, -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval"));

    -[_UIDatePickerWheelsTimeLabel setWheelsDelegate:](v5, "setWheelsDelegate:", self);
    data = self->_data;
    if (data)
      -[_UIDatePickerCalendarTimeLabel setRoundsToMinuteInterval:](v5, "setRoundsToMinuteInterval:", -[_UIDatePickerDataModel roundsToMinuteInterval](data, "roundsToMinuteInterval"));
    -[UIPickerView _style](self, "_style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerCellDigitFontWithTraitCollection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerWheelsTimeLabel setFont:](v5, "setFont:", v9);

    -[_UIDatePickerCalendarTimeLabel setDelegate:](v5, "setDelegate:", self);
    -[_UIDatePickerView _currentTimeInputLabelFrame](self, "_currentTimeInputLabelFrame");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 42);
    -[UIView center](self, "center");
    -[UIView setCenter:](v5, "setCenter:");
    -[_UIDatePickerWheelsTimeLabel controlEventsGestureRecognizer](v5, "controlEventsGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[_UIDatePickerWheelsTimeLabel controlEventsGestureRecognizer](v5, "controlEventsGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", v11);

    v12 = (_UIControlEventsGestureRecognizer *)objc_opt_new();
    -[_UIControlEventsGestureRecognizer setControlEventsDelegate:](v12, "setControlEventsDelegate:", self);
    -[UIGestureRecognizer setDelegate:](v12, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", v12);
    controlEventsGestureRecognizer = self->_controlEventsGestureRecognizer;
    self->_controlEventsGestureRecognizer = v12;
    v14 = v12;

    -[_UIDatePickerMode selectedDateComponents](self->_mode, "selectedDateComponents");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerWheelsTimeLabel updateHoursFromDatePicker:wheelsChanged:](v5, "updateHoursFromDatePicker:wheelsChanged:", objc_msgSend(v16, "hour"), 0);
    -[_UIDatePickerWheelsTimeLabel updateMinutesFromDatePicker:wheelsChanged:](v5, "updateMinutesFromDatePicker:wheelsChanged:", objc_msgSend(v16, "minute"), 0);
    timeInputLabel = self->_timeInputLabel;
    self->_timeInputLabel = v5;

    -[_UIDatePickerView _updateTimeInputLabelPosition](self, "_updateTimeInputLabelPosition");
  }
}

- (void)_uninstallTimeInputLabelIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UIDatePickerWheelsTimeLabel *timeInputLabel;
  void *v8;
  void *v9;
  _UIControlEventsGestureRecognizer *controlEventsGestureRecognizer;

  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controlEventsGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", v5);

    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    timeInputLabel = self->_timeInputLabel;
    self->_timeInputLabel = 0;

  }
  -[_UIDatePickerView controlEventsGestureRecognizer](self, "controlEventsGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIDatePickerView controlEventsGestureRecognizer](self, "controlEventsGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", v9);

    controlEventsGestureRecognizer = self->_controlEventsGestureRecognizer;
    self->_controlEventsGestureRecognizer = 0;

  }
  -[_UIDatePickerView setPassthroughInteractionEnabled:](self, "setPassthroughInteractionEnabled:", 0);
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if ((uint64_t)a4 <= 127)
  {
    if (a4 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
      objc_msgSend(WeakRetained, "_overlayPresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
      goto LABEL_9;
    }
    if (a4 != 64)
      goto LABEL_10;
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    objc_msgSend(WeakRetained, "_overlayPresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0;
LABEL_9:
    objc_msgSend(v10, "setDefersAutomaticKeyboardAvoidanceAdjustments:", v12);

    goto LABEL_10;
  }
  if (a4 == 128 || a4 == 256)
    goto LABEL_7;
LABEL_10:

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[_UIDatePickerView controlEventsGestureRecognizer](self, "controlEventsGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSInteger v11;
  void *v12;
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlEventsGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10 && -[UIPickerView numberOfComponents](self, "numberOfComponents") >= 1)
  {
    v11 = 0;
    do
    {
      -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "panGestureRecognizer");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v14 = v13 == v7;
      if (v13 == v7)
        break;
      ++v11;
    }
    while (-[UIPickerView numberOfComponents](self, "numberOfComponents") > v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  __int16 datePickerFlags;
  unsigned int v10;
  void *v11;
  int v12;

  v5 = a4;
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v7);
  v8 = objc_msgSend(v6, "pointInside:withEvent:", 0);

  datePickerFlags = (__int16)self->_datePickerFlags;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = datePickerFlags & 0x100;
    objc_msgSend(v5, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass() & (v8 | (v10 >> 8));

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _UIDatePickerView *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[UIPickerView numberOfComponents](v8, "numberOfComponents");
  if (v9 >= 1)
  {
    v10 = v9;
    -[UIPickerView tableViewForColumn:](v8, "tableViewForColumn:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDragging") & 1) != 0 || (objc_msgSend(v11, "isDecelerating") & 1) != 0)
    {

      v12 = 0;
      goto LABEL_14;
    }
    v13 = 1;
    while (1)
    {
      v14 = v13;

      if (v10 == v14)
        break;
      -[UIPickerView tableViewForColumn:](v8, "tableViewForColumn:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isDragging") & 1) == 0)
      {
        v15 = objc_msgSend(v11, "isDecelerating");
        v13 = v14 + 1;
        if ((v15 & 1) == 0)
          continue;
      }

      if (v10 <= v14)
        goto LABEL_12;
      v12 = 0;
      goto LABEL_16;
    }
  }

LABEL_12:
  -[_UIDatePickerView timeInputLabel](v8, "timeInputLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "controlEventsGestureRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "isEqual:", v17);

  if (!v18)
  {
    v12 = 1;
    goto LABEL_16;
  }
  -[_UIDatePickerView timeInputLabel](v8, "timeInputLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v19);
  v21 = v20;
  v23 = v22;

  -[_UIDatePickerView timeInputLabel](v8, "timeInputLabel");
  v8 = (_UIDatePickerView *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIView pointInside:withEvent:](v8, "pointInside:withEvent:", 0, v21, v23);
LABEL_14:

LABEL_16:
  return v12;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlEventsGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "controlEventsGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gestureRecognizerFailed");

  }
}

- (void)_updateWheelsForUpdatedTextInputWithForcedUpdate:(BOOL)a3
{
  uint64_t v3;
  _UIDatePickerView *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _UIDatePickerWheelsTimeLabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t Value;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  _UIDatePickerView *WeakRetained;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  _BOOL4 v39;
  _UIDatePickerView *v40;

  v39 = a3;
  v40 = self;
  v3 = -[UIPickerView numberOfComponents](v40, "numberOfComponents");
  v4 = v40;
  if (v3 >= 1)
  {
    v5 = v3;
    -[UIPickerView tableViewForColumn:](v40, "tableViewForColumn:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDragging") & 1) != 0 || (objc_msgSend(v6, "isDecelerating") & 1) != 0)
      goto LABEL_36;
    v7 = 1;
    while (1)
    {
      v8 = v7;

      v4 = v40;
      if (v5 == v8)
        break;
      -[UIPickerView tableViewForColumn:](v40, "tableViewForColumn:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isDragging") & 1) == 0)
      {
        v9 = objc_msgSend(v6, "isDecelerating");
        v7 = v8 + 1;
        if ((v9 & 1) == 0)
          continue;
      }

      if (v5 <= v8)
        goto LABEL_11;
      return;
    }
  }

LABEL_11:
  v10 = v40->_timeInputLabel;
  -[_UIDatePickerCalendarTimeLabel timeFormat](v10, "timeFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hourFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel hourText](v10, "hourText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberFromString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  -[_UIDatePickerCalendarTimeLabel timeFormat](v10, "timeFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minuteFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeLabel minuteText](v10, "minuteText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberFromString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  -[_UIDatePickerDataModel effectiveDate](v40->_data, "effectiveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerMode selectedDateComponents](v40->_mode, "selectedDateComponents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  Value = _UIDateComponentsGetValue(v21, 0x10000);
  v23 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v23, "setHour:", v15);
  if (v39
    || -[_UIDatePickerMode areValidDateComponents:comparingUnits:](v40->_mode, "areValidDateComponents:comparingUnits:", v23, -193))
  {
    objc_msgSend(v21, "setHour:", v15);
  }
  if (v39 || (unint64_t)v20 <= 0x3B)
  {
    if (-[_UIDatePickerDataModel roundsToMinuteInterval](v40->_data, "roundsToMinuteInterval"))
    {
      v24 = (double)-[_UIDatePickerDataModel minuteInterval](v40->_data, "minuteInterval");
      v20 = (uint64_t)(floor((double)v20 / v24) * v24);
    }
    objc_msgSend(v21, "setMinute:", v20);
  }
  if (!-[_UIDatePickerMode is24Hour](v40->_mode, "is24Hour"))
    _UIDateComponentsSetValue(v21, 0x10000, Value);
  -[_UIDatePickerDataModel effectiveCalendar](v40->_data, "effectiveCalendar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dateFromComponents:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel setDate:](v40->_data, "setDate:", v26);

  WeakRetained = v40;
  v28 = -[UIPickerView numberOfComponents](WeakRetained, "numberOfComponents");
  if (v28 >= 1)
  {
    v29 = v28;
    -[UIPickerView tableViewForColumn:](WeakRetained, "tableViewForColumn:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "panGestureRecognizer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "state");
    if (v32)
    {
LABEL_34:

      goto LABEL_35;
    }
    v33 = 1;
    while (v29 != v33)
    {
      -[UIPickerView tableViewForColumn:](WeakRetained, "tableViewForColumn:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "panGestureRecognizer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_msgSend(v35, "state");
      ++v33;
      if (v36)
      {

        if (v29 <= v33 - 1)
          goto LABEL_29;
        goto LABEL_35;
      }
    }
  }

LABEL_29:
  -[_UIDatePickerDataModel effectiveDate](v40->_data, "effectiveDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqual:", v6);

  if (v39)
  {
    if ((v38 & 1) == 0)
    {
      -[_UIDatePickerView didChangeDateFrom:animated:](WeakRetained, "didChangeDateFrom:animated:", v6, 1);
LABEL_33:
      WeakRetained = (_UIDatePickerView *)objc_loadWeakRetained((id *)&WeakRetained->_datePicker);
      -[_UIDatePickerView _emitValueChanged](WeakRetained, "_emitValueChanged");
      goto LABEL_34;
    }
  }
  else
  {
    *(_WORD *)&WeakRetained->_datePickerFlags |= 0x110u;
    -[_UIDatePickerView didChangeDateFrom:animated:](WeakRetained, "didChangeDateFrom:animated:", v6, 1);
    *(_WORD *)&WeakRetained->_datePickerFlags &= ~0x10u;
    if ((v38 & 1) == 0)
      goto LABEL_33;
  }
LABEL_35:

  v40 = (_UIDatePickerView *)v10;
LABEL_36:

}

- (BOOL)timeLabel:(id)a3 didReceiveText:(id)a4
{
  return 0;
}

- (void)timeLabel:(id)a3 didUpdateText:(id)a4
{
  -[_UIDatePickerView _updateWheelsForUpdatedTextInputWithForcedUpdate:](self, "_updateWheelsForUpdatedTextInputWithForcedUpdate:", 0, a4);
}

- (int64_t)keyboardTypeForTimeLabel:(id)a3
{
  void *v3;
  uint64_t v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 127;
  else
    return 4;
}

- (BOOL)timeLabelShouldSuppressSoftwareKeyboard:(id)a3
{
  void *v3;
  uint64_t v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)timeLabelCanBecomeFirstResponder:(id)a3
{
  return (*(_WORD *)&self->_datePickerFlags & 0x200) == 0;
}

- (void)timeLabelWillBecomeFirstResponder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "_isHardwareKeyboardAvailable") & 1) == 0)
    {
      if ((objc_msgSend(v8, "isFirstResponder") & 1) != 0)
      {
        -[UIViewController presentingViewController](self->_numericKeyboardViewController, "presentingViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_9;
      }
      else
      {

      }
      -[_UIDatePickerView _enableCustomKeyboardIfNecessary](self, "_enableCustomKeyboardIfNecessary");
      *(_WORD *)&self->_datePickerFlags |= 0x20u;
      goto LABEL_9;
    }

  }
LABEL_9:

}

- (unint64_t)_permittedArrowDirectionForKeyboardPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MinX;
  double MaxX;
  unint64_t v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedTextRectFromLabels");
  objc_msgSend(v5, "convertRect:toView:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  MinX = CGRectGetMinX(v20);
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  MaxX = CGRectGetMaxX(v21);
  objc_msgSend(v4, "bounds");
  if (MaxX >= CGRectGetMaxX(v22) + -320.0 && MinX <= 320.0)
    v18 = 15;
  else
    v18 = 12;

  return v18;
}

- (void)timeLabelDidBecomeFirstResponder:(id)a3
{
  id v4;
  _UIDatePickerNumericKeyboardViewController *numericKeyboardViewController;
  void *v6;
  _UIDatePickerNumericKeyboardViewController *v7;
  _UIDatePickerNumericKeyboardViewController *v8;
  void *v9;
  void *v10;
  _UIDatePickerNumericKeyboardViewController *v11;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_WORD *)&self->_datePickerFlags & 0x20) != 0)
  {
    numericKeyboardViewController = self->_numericKeyboardViewController;
    if (numericKeyboardViewController)
    {
      -[UIViewController popoverPresentationController](numericKeyboardViewController, "popoverPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSourceView:", v4);
      objc_msgSend(v4, "combinedTextRectFromLabels");
      objc_msgSend(v6, "setSourceRect:");
      objc_msgSend(v6, "setPermittedArrowDirections:", -[_UIDatePickerView _permittedArrowDirectionForKeyboardPopover](self, "_permittedArrowDirectionForKeyboardPopover"));
    }
    else
    {
      v7 = (_UIDatePickerNumericKeyboardViewController *)objc_opt_new();
      v8 = self->_numericKeyboardViewController;
      self->_numericKeyboardViewController = v7;

      -[UIViewController popoverPresentationController](self->_numericKeyboardViewController, "popoverPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSourceView:", v4);
      objc_msgSend(v4, "combinedTextRectFromLabels");
      objc_msgSend(v6, "setSourceRect:");
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPassthroughViews:", v9);

      objc_msgSend(v6, "_setShouldPreserveFirstResponder:", 0);
      objc_msgSend(v6, "_setAdaptivityEnabled:", 0);
      objc_msgSend(v6, "setPopoverLayoutMargins:", 2.22044605e-16, 2.22044605e-16, 2.22044605e-16, 2.22044605e-16);
      objc_msgSend(v6, "setPermittedArrowDirections:", -[_UIDatePickerView _permittedArrowDirectionForKeyboardPopover](self, "_permittedArrowDirectionForKeyboardPopover"));
      objc_msgSend(v6, "setDelegate:", self);
      -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)&self->_datePickerFlags |= 0x200u;
      v11 = self->_numericKeyboardViewController;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54___UIDatePickerView_timeLabelDidBecomeFirstResponder___block_invoke;
      v12[3] = &unk_1E16B1B28;
      v12[4] = self;
      objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, v12);

    }
    *(_WORD *)&self->_datePickerFlags &= ~0x20u;
  }

}

- (void)timeLabelDidFailToBecomeFirstResponder:(id)a3
{
  -[_UIDatePickerView _disableCustomKeyboardIfNecessary](self, "_disableCustomKeyboardIfNecessary", a3);
  *(_WORD *)&self->_datePickerFlags &= ~0x20u;
}

- (void)timeLabelDidResignFirstResponder:(id)a3
{
  if ((*(_WORD *)&self->_datePickerFlags & 0x20) == 0)
    -[_UIDatePickerView _dismissManualKeyboard](self, "_dismissManualKeyboard", a3);
}

- (void)timeLabelDidBeginEditing:(id)a3
{
  id WeakRetained;

  -[_UIDatePickerView setPassthroughInteractionEnabled:](self, "setPassthroughInteractionEnabled:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitBeginEditing");

}

- (void)timeLabelDidEndEditing:(id)a3
{
  id WeakRetained;

  -[_UIDatePickerView setPassthroughInteractionEnabled:](self, "setPassthroughInteractionEnabled:", 0);
  -[_UIDatePickerView _updateWheelsForUpdatedTextInputWithForcedUpdate:](self, "_updateWheelsForUpdatedTextInputWithForcedUpdate:", 1);
  *(_WORD *)&self->_datePickerFlags &= ~0x100u;
  -[_UIDatePickerView _updateWheelsLabelForCurrentDateComponents](self, "_updateWheelsLabelForCurrentDateComponents");
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "_emitEndEditing");

}

- (void)_updateWheelsLabelForCurrentDateComponents
{
  _UIDatePickerWheelsTimeLabel *timeInputLabel;
  void *v4;
  _UIDatePickerWheelsTimeLabel *v5;
  id v6;

  timeInputLabel = self->_timeInputLabel;
  -[_UIDatePickerMode selectedDateComponents](self->_mode, "selectedDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerWheelsTimeLabel updateHoursFromDatePicker:wheelsChanged:](timeInputLabel, "updateHoursFromDatePicker:wheelsChanged:", objc_msgSend(v4, "hour"), 0);

  v5 = self->_timeInputLabel;
  -[_UIDatePickerMode selectedDateComponents](self->_mode, "selectedDateComponents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerWheelsTimeLabel updateMinutesFromDatePicker:wheelsChanged:](v5, "updateMinutesFromDatePicker:wheelsChanged:", objc_msgSend(v6, "minute"), 0);

}

- (BOOL)wheelsTimeLabelShouldReceiveInteraction:(id)a3
{
  _UIDatePickerView *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = self;
  v4 = -[UIPickerView numberOfComponents](v3, "numberOfComponents");
  if (v4 >= 1)
  {
    v5 = v4;
    -[UIPickerView tableViewForColumn:](v3, "tableViewForColumn:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isDragging") & 1) != 0 || (objc_msgSend(v6, "isDecelerating") & 1) != 0)
    {

      return 0;
    }
    v8 = 1;
    while (1)
    {
      v9 = v8;

      if (v5 == v9)
        break;
      -[UIPickerView tableViewForColumn:](v3, "tableViewForColumn:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isDragging") & 1) == 0)
      {
        v10 = objc_msgSend(v6, "isDecelerating");
        v8 = v9 + 1;
        if ((v10 & 1) == 0)
          continue;
      }

      if (v5 > v9)
        return 0;
      return (*(_WORD *)&v3->_datePickerFlags & 0x200) == 0;
    }
  }

  return (*(_WORD *)&v3->_datePickerFlags & 0x200) == 0;
}

- (void)wheelsTimeLabel:(id)a3 didChangeVisibility:(BOOL)a4
{
  -[_UIDatePickerView _hidePickerViewSelectionBarForTimeInputLabel:](self, "_hidePickerViewSelectionBarForTimeInputLabel:", a4);
}

- (BOOL)passthroughInteractionEnabled
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
      if (-[UIView _isInAWindow](self, "_isInAWindow"))
      {
        v6 = (_UIPassthroughScrollInteraction *)objc_opt_new();
        v7 = self->_passthroughInteraction;
        self->_passthroughInteraction = v6;

        -[_UIPassthroughScrollInteraction setDelegate:](self->_passthroughInteraction, "setDelegate:", self);
        -[_UIPassthroughScrollInteraction setEatsTouches:](self->_passthroughInteraction, "setEatsTouches:", 0);
        -[UIView addInteraction:](self, "addInteraction:", self->_passthroughInteraction);
      }
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
  id v8;
  void *v9;
  BOOL v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[UIViewController presentingViewController](self->_numericKeyboardViewController, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    objc_msgSend(WeakRetained, "_overlayPresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10 = 0;
    }
    else
    {
      -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
      objc_msgSend(v13, "hitTest:withEvent:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15 == 0;

    }
  }

  return v10;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  void *v3;
  char v4;

  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "processTapOutside");

  return v4;
}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isHardwareKeyboardAvailable");

  if (v7)
    -[_UIDatePickerView _dismissManualKeyboard](self, "_dismissManualKeyboard");
  if (v5)
  {
    -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "becomeFirstResponder");

  }
}

- (void)_dismissManualKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIDatePickerNumericKeyboardViewController *numericKeyboardViewController;
  _QWORD v9[5];

  -[_UIDatePickerView numericKeyboardViewController](self, "numericKeyboardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_WORD *)&self->_datePickerFlags |= 0x200u;
    -[_UIDatePickerView numericKeyboardViewController](self, "numericKeyboardViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43___UIDatePickerView__dismissManualKeyboard__block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v9);

    -[_UIDatePickerView numericKeyboardViewController](self, "numericKeyboardViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isFirstResponder"))
      objc_msgSend(v7, "resignFirstResponder");
    -[_UIDatePickerView _disableCustomKeyboardIfNecessary](self, "_disableCustomKeyboardIfNecessary");
    numericKeyboardViewController = self->_numericKeyboardViewController;
    self->_numericKeyboardViewController = 0;

  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;

  v12 = a3;
  -[_UIDatePickerView timeInputLabel](self, "timeInputLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combinedTextRectFromLabels");
  a4->origin.x = v8;
  a4->origin.y = v9;
  a4->size.width = v10;
  a4->size.height = v11;

  objc_msgSend(v12, "setPermittedArrowDirections:", -[_UIDatePickerView _permittedArrowDirectionForKeyboardPopover](self, "_permittedArrowDirectionForKeyboardPopover"));
}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;

  objc_msgSend(a3, "sourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  *(_WORD *)&self->_datePickerFlags |= 0x200u;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  *(_WORD *)&self->_datePickerFlags &= ~0x200u;
}

- (BOOL)staggerTimeIntervals
{
  return *(_WORD *)&self->_datePickerFlags & 1;
}

- (BOOL)highlightsToday
{
  return (*(_WORD *)&self->_datePickerFlags >> 2) & 1;
}

- (void)setHighlightsToday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFB | v3;
}

- (id)_selectedTextForCalendarUnit:(unint64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[_UIDatePickerView _viewForSelectedRowInComponent:](self, "_viewForSelectedRowInComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_labelTextForCalendarUnit:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
  {
    -[_UIDatePickerView _labelForCalendarUnit:createIfNecessary:](self, "_labelForCalendarUnit:createIfNecessary:", a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_existingLabelForCalendarUnit:(unint64_t)a3
{
  return -[_UIDatePickerView _labelForCalendarUnit:createIfNecessary:](self, "_labelForCalendarUnit:createIfNecessary:", a3, 0);
}

- (int64_t)_amPmValue
{
  int64_t result;

  if (-[_UIDatePickerMode isTimeIntervalMode](self->_mode, "isTimeIntervalMode"))
    return 0;
  result = self->_expectedAMPM;
  if ((_DWORD)result == -1)
    return -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", -[_UIDatePickerMode componentForCalendarUnit:](self->_mode, "componentForCalendarUnit:", 0x10000));
  return result;
}

- (BOOL)_updateDateOrTime
{
  -[_UIDatePickerMode resetSelectedDateComponentsWithValuesUnderSelectionBars](self->_mode, "resetSelectedDateComponentsWithValuesUnderSelectionBars");
  return -[_UIDatePickerView _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:](self, "_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:", 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)hasDefaultSize
{
  return 1;
}

- (UIEdgeInsets)appliedInsetsToEdgeOfContent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[UIPickerView _style](self, "_style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paddingAroundWheels");
  v5 = v4;

  -[UIPickerView _selectionBarSideInset](self, "_selectionBarSideInset");
  v7 = v5 + v6;
  -[UIPickerView _selectionBarSideInset](self, "_selectionBarSideInset");
  v9 = v8;
  v10 = 0.0;
  v11 = 0.0;
  v12 = v7;
  result.right = v9;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (int64_t)_selectionBarRowInComponent:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectionBarRow");

  return v4;
}

- (id)_minutesStringForHour:(int64_t)a3 minutes:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("min[plural]");
  if (a4 == 1)
    v7 = CFSTR("min[singular]");
  if (a4)
    v8 = (__CFString *)v7;
  else
    v8 = CFSTR("min[zero]");
  _UILocalizedStringWithDefaultValueInLanguage(v8, v6, CFSTR("min"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_hoursStringForHour:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    v6 = CFSTR("hour[singular]");
    v7 = CFSTR("hour");
  }
  else
  {
    if (a3)
      v6 = CFSTR("hour[plural]");
    else
      v6 = CFSTR("hour[zero]");
    v7 = CFSTR("hours");
  }
  _UILocalizedStringWithDefaultValueInLanguage(v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIFont)_hrMinFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_hrMinFont___defaultHrMinFont;
  if (!_hrMinFont___defaultHrMinFont)
  {
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 17.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_hrMinFont___defaultHrMinFont;
    _hrMinFont___defaultHrMinFont = v3;

    v2 = (void *)_hrMinFont___defaultHrMinFont;
  }
  return (UIFont *)v2;
}

- (int64_t)datePickerMode
{
  return -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_loadWeakRetained((id *)&self->_datePicker);
}

- (void)setDatePicker:(id)a3
{
  objc_storeWeak((id *)&self->_datePicker, a3);
}

- (_UIDatePickerDataModel)data
{
  return self->_data;
}

- (_UIDatePickerNumericKeyboardViewController)numericKeyboardViewController
{
  return self->_numericKeyboardViewController;
}

- (_UIDatePickerWheelsTimeLabel)timeInputLabel
{
  return self->_timeInputLabel;
}

- (_UIControlEventsGestureRecognizer)controlEventsGestureRecognizer
{
  return self->_controlEventsGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlEventsGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_timeInputLabel, 0);
  objc_storeStrong((id *)&self->_numericKeyboardViewController, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_datePicker);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
