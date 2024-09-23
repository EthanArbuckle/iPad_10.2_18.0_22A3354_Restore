@implementation _UIDatePickerCalendarView

- (_UIDatePickerCalendarView)initWithFrame:(CGRect)a3
{
  _UIDatePickerCalendarView *v3;
  _UIDatePickerCalendarView *v4;
  void *v5;
  uint64_t v6;
  _UIDatePickerStyle *visualStyle;
  UICalendarView *v8;
  UICalendarSelectionSingleDate *v9;
  UICalendarView *calendarView;
  UICalendarView *v11;
  UICalendarSelectionSingleDate *selection;
  UICalendarSelectionSingleDate *v13;
  _UIDatePickerCalendarTimeView *v14;
  _UIDatePickerCalendarTimeView *timeView;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIDatePickerCalendarView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = objc_claimAutoreleasedReturnValue();
    visualStyle = v4->_visualStyle;
    v4->_visualStyle = (_UIDatePickerStyle *)v6;

    v8 = (UICalendarView *)objc_opt_new();
    v9 = -[UICalendarSelectionSingleDate initWithDelegate:]([UICalendarSelectionSingleDate alloc], "initWithDelegate:", v4);
    -[UICalendarSelectionSingleDate set_selectionFollowsMonthSelection:](v9, "set_selectionFollowsMonthSelection:", 1);
    -[UIView setClipsToBounds:](v8, "setClipsToBounds:", 0);
    -[UICalendarView setSelectionBehavior:](v8, "setSelectionBehavior:", v9);
    calendarView = v4->_calendarView;
    v4->_calendarView = v8;
    v11 = v8;

    selection = v4->_selection;
    v4->_selection = v9;
    v13 = v9;

    v14 = (_UIDatePickerCalendarTimeView *)objc_opt_new();
    -[UIView setAutoresizingMask:](v14, "setAutoresizingMask:", 50);
    -[_UIDatePickerCalendarTimeView setDelegate:](v14, "setDelegate:", v4);
    timeView = v4->_timeView;
    v4->_timeView = v14;

    -[_UIDatePickerCalendarView _updateLayoutMargins](v4, "_updateLayoutMargins");
    -[_UIDatePickerCalendarView _updateContentSizeLimitations](v4, "_updateContentSizeLimitations");
  }
  return v4;
}

- (void)_workaround66574039_datePickerDidUpdateLayoutMargins
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setLayoutMargins:](self->_calendarView, "setLayoutMargins:", v5, v7, v9, v11);
  -[UIView setLayoutMargins:](self->_timeView, "setLayoutMargins:", v5, v7, v9, v11);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;

  -[UIView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[_UIDatePickerStyle inlineDatePickerMinimumMargin](self->_visualStyle, "inlineDatePickerMinimumMargin");
  v8 = v7;
  v9 = -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
  v10 = 0.0;
  if (v9 != 1)
  {
    -[_UIDatePickerStyle inlineDatePickerMinimumMargin](self->_visualStyle, "inlineDatePickerMinimumMargin");
    v10 = v11 * 0.5;
  }
  -[UIView setLayoutMargins:](self, "setLayoutMargins:", v8, v4, v10, v6);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerCalendarView;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[_UIDatePickerCalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
}

- (void)layoutSubviews
{
  UICalendarView *v3;
  _UIDatePickerCalendarTimeView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  _UIDatePickerStyle *visualStyle;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  double x;
  CGFloat v34;
  double y;
  CGFloat v36;
  double width;
  CGFloat v38;
  double height;
  CGSize v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  double v46;
  CGRect slice;
  CGRect remainder;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49.receiver = self;
  v49.super_class = (Class)_UIDatePickerCalendarView;
  -[UIView layoutSubviews](&v49, sel_layoutSubviews);
  v3 = self->_calendarView;
  v4 = self->_timeView;
  if (-[_UIDatePickerCalendarView _shouldDisplayTimeView](self, "_shouldDisplayTimeView"))
    -[_UIDatePickerCalendarView _shouldDisplayCalendarView](self, "_shouldDisplayCalendarView");
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  visualStyle = self->_visualStyle;
  -[_UIDatePickerCalendarView datePicker](self, "datePicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  -[_UIDatePickerStyle maximumWidthOverhangForProposedLayoutMargins:](visualStyle, "maximumWidthOverhangForProposedLayoutMargins:");
  v16 = v15;
  v18 = v17;

  -[_UIDatePickerStyle inlineDatePickerMaximumWidth](self->_visualStyle, "inlineDatePickerMaximumWidth");
  v20 = v18 + v16 + v19;
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  v21 = fmin(v20, CGRectGetWidth(v50));
  -[UIView bounds](self, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[UIView traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayScale");
  UIRectCenteredXInRectScale(v6, v8, v21, v12, v23, v25, v27, v29, v31);
  x = v32;
  y = v34;
  width = v36;
  height = v38;
  remainder.origin.x = v32;
  remainder.origin.y = v34;
  remainder.size.width = v36;
  remainder.size.height = v38;

  v40 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v40;
  -[UICalendarView sizeThatFits:](v3, "sizeThatFits:", width, height);
  v42 = v41;
  -[UIView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", width, height);
  v44 = v43;
  -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
  v45 = (uint64_t)v3;
  switch((unint64_t)v3)
  {
    case 0uLL:
    case 3uLL:
      v45 = (uint64_t)v4;
      goto LABEL_9;
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      CGRectDivide(v52, &slice, &remainder, v42, CGRectMinYEdge);
      -[UICalendarView setFrame:](v3, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      remainder.origin.y = remainder.origin.y + -4.0;
      remainder.size.height = remainder.size.height + 4.0;
      CGRectDivide(remainder, &slice, &remainder, v44, CGRectMinYEdge);
      x = slice.origin.x;
      y = slice.origin.y;
      v45 = (uint64_t)v4;
      goto LABEL_8;
    default:
      if (v3 != (UICalendarView *)4272)
        goto LABEL_10;
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      CGRectDivide(v51, &slice, &remainder, v44, CGRectMinYEdge);
      -[UIView setFrame:](v4, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      -[_UIDatePickerStyle inlineTimeAndDateSpacing](self->_visualStyle, "inlineTimeAndDateSpacing");
      remainder.origin.y = v46 + remainder.origin.y;
      remainder.size.height = remainder.size.height - v46;
      CGRectDivide(remainder, &slice, &remainder, v42, CGRectMinYEdge);
      x = slice.origin.x;
      y = slice.origin.y;
      v45 = 4272;
LABEL_8:
      width = slice.size.width;
      height = slice.size.height;
LABEL_9:
      objc_msgSend((id)v45, "setFrame:", x, y, width, height);
LABEL_10:
      -[_UIDatePickerCalendarView _updateDateIfNeeded](self, "_updateDateIfNeeded");

      return;
  }
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 v6;
  _BOOL4 v7;
  _UIDatePickerStyle *visualStyle;
  double v9;
  double v10;
  _UIDatePickerStyle *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[_UIDatePickerCalendarView _shouldDisplayCalendarView](self, "_shouldDisplayCalendarView");
  v7 = -[_UIDatePickerCalendarView _shouldDisplayTimeView](self, "_shouldDisplayTimeView");
  visualStyle = self->_visualStyle;
  if (v6)
    -[_UIDatePickerStyle inlineDateViewMinimumWidth](visualStyle, "inlineDateViewMinimumWidth");
  else
    -[_UIDatePickerStyle inlineTimeViewMinimumWidth](visualStyle, "inlineTimeViewMinimumWidth");
  v10 = v9;
  v11 = self->_visualStyle;
  -[_UIDatePickerCalendarView datePicker](self, "datePicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMargins");
  -[_UIDatePickerStyle maximumWidthOverhangForProposedLayoutMargins:](v11, "maximumWidthOverhangForProposedLayoutMargins:");
  v14 = v13;
  v16 = v15;

  -[_UIDatePickerStyle inlineDatePickerMaximumWidth](self->_visualStyle, "inlineDatePickerMaximumWidth");
  v18 = v16 + v14 + v17;
  v19 = fmin(v18, width);
  if (width == 3.40282347e38)
    v20 = 320.0;
  else
    v20 = v19;
  if (!v6)
  {
    if (v7)
    {
      -[UIView systemLayoutSizeFittingSize:](self->_timeView, "systemLayoutSizeFittingSize:", v20, height);
      v20 = v29;
      height = v30;
    }
    goto LABEL_13;
  }
  -[UICalendarView sizeThatFits:](self->_calendarView, "sizeThatFits:", v20, height);
  v23 = v21;
  v24 = v22;
  if (!v7)
  {
    height = v22;
    v20 = v21;
LABEL_13:
    v27 = fmax(v10, fmin(v20, v18));
    goto LABEL_14;
  }
  -[UIView systemLayoutSizeFittingSize:](self->_timeView, "systemLayoutSizeFittingSize:", v20, height);
  v26 = v24 + v25 + -4.0;
  v27 = fmax(v10, fmin(v23, v18));
  -[UIView layoutMargins](self, "layoutMargins");
  height = v26 + v28;
LABEL_14:
  v31 = v27;
  v32 = height;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarView;
  -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y);
  _alertForMinimumWidthErrorIfNecessary(self, width);
  if (self->_lastSize.width != width || self->_lastSize.height != height)
  {
    self->_lastSize.width = width;
    self->_lastSize.height = height;
    -[_UIDatePickerCalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarView;
  -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y);
  _alertForMinimumWidthErrorIfNecessary(self, width);
  if (self->_lastSize.width != width || self->_lastSize.height != height)
  {
    self->_lastSize.width = width;
    self->_lastSize.height = height;
    -[_UIDatePickerCalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  }
}

- (void)_updateContentSizeLimitations
{
  double Width;
  id *v4;
  id v5;
  CGRect v6;

  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  if (Width < 330.0
    && -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode")
    && -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode") != 3)
  {
    v4 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
    if (Width < 280.0)
      v4 = (id *)&UIContentSizeCategoryExtraExtraLarge;
  }
  else
  {
    v4 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  }
  v5 = *v4;
  -[UIView setMaximumContentSizeCategory:](self->_timeView, "setMaximumContentSizeCategory:", v5);
  -[_UIDatePickerCalendarView _workaround66574039_datePickerDidUpdateLayoutMargins](self, "_workaround66574039_datePickerDidUpdateLayoutMargins");

}

- (void)_setNeedsUpdateDateAnimated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 3;
  else
    v3 = 1;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | v3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateDateIfNeeded
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    -[_UIDatePickerCalendarView _updateDate](self, "_updateDate");
}

- (void)_updateDate
{
  void *v3;
  id v4;
  _UIDatePickerCalendarDay *v5;
  void *v6;
  _UIDatePickerCalendarDay *v7;
  _UIDatePickerCalendarTime *v8;
  void *v9;
  _UIDatePickerCalendarTime *v10;
  id v11;

  *(_BYTE *)&self->_flags &= ~1u;
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel dateRange](self->_data, "dateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInRangeForDate:", v11);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [_UIDatePickerCalendarDay alloc];
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v5, "initWithDate:calendar:", v4, v6);

  v8 = [_UIDatePickerCalendarTime alloc];
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v8, "initWithDate:calendar:", v4, v9);

  -[_UIDatePickerCalendarView _updateSelectedDay:time:animated:notify:](self, "_updateSelectedDay:time:animated:notify:", v7, v10, (*(_BYTE *)&self->_flags >> 1) & 1, v11 != v4);
}

- (void)_reloadDateRange
{
  void *v3;
  void *v4;
  char v5;

  -[_UIDatePickerDataModel dateRange](self->_data, "dateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsDate:", v4);

  if ((v5 & 1) == 0)
    -[_UIDatePickerCalendarView _setNeedsUpdateDateAnimated:](self, "_setNeedsUpdateDateAnimated:", 0);
}

- (void)_reloadTimeView
{
  _UIDatePickerCalendarTimeView *timeView;
  void *v4;
  void *v5;
  id v6;

  timeView = self->_timeView;
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarTimeView reloadWithCalendar:locale:selectedDate:followsSystemHourCycle:](timeView, "reloadWithCalendar:locale:selectedDate:followsSystemHourCycle:", v6, v4, v5, -[_UIDatePickerDataModel followsSystemHourCycle](self->_data, "followsSystemHourCycle"));

}

- (void)_reloadCalendarView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel dateRange](self->_data, "dateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[_UIDatePickerDataModel dateRange](self->_data, "dateRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[UICalendarView setCalendar:](self->_calendarView, "setCalendar:", v22);
  -[_UIDatePickerDataModel effectiveLocale](self->_data, "effectiveLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarView setLocale:](self->_calendarView, "setLocale:", v13);

  -[_UIDatePickerDataModel timeZone](self->_data, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarView setTimeZone:](self->_calendarView, "setTimeZone:", v14);

  -[_UIDatePickerDataModel customFontDesign](self->_data, "customFontDesign");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = v15;
  else
    v17 = *(_QWORD *)off_1E167DBF8;
  -[UICalendarView setFontDesign:](self->_calendarView, "setFontDesign:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v12);
  -[UICalendarView setAvailableDateRange:](self->_calendarView, "setAvailableDateRange:", v18);

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "components:fromDate:", 1048606, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelectionSingleDate setSelectedDate:](self->_selection, "setSelectedDate:", v21);

}

- (void)_reload
{
  _UIDatePickerCalendarDay *v3;
  void *v4;
  void *v5;
  _UIDatePickerCalendarTime *v6;
  void *v7;
  void *v8;
  _UIDatePickerCalendarTime *v9;
  _UIDatePickerCalendarDay *v10;

  -[_UIDatePickerCalendarView _reloadDateRange](self, "_reloadDateRange");
  -[_UIDatePickerCalendarView _updateDateIfNeeded](self, "_updateDateIfNeeded");
  -[_UIDatePickerCalendarView _reloadCalendarView](self, "_reloadCalendarView");
  -[_UIDatePickerCalendarView _reloadTimeView](self, "_reloadTimeView");
  -[_UIDatePickerCalendarView _updateLayoutMargins](self, "_updateLayoutMargins");
  -[_UIDatePickerCalendarView _updateModuleVisibility](self, "_updateModuleVisibility");
  -[_UIDatePickerCalendarView _updateCustomFonts](self, "_updateCustomFonts");
  -[_UIDatePickerCalendarView _updateEnabledStyling](self, "_updateEnabledStyling");
  v3 = [_UIDatePickerCalendarDay alloc];
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v3, "initWithDate:calendar:", v4, v5);

  v6 = [_UIDatePickerCalendarTime alloc];
  -[_UIDatePickerDataModel effectiveDate](self->_data, "effectiveDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v6, "initWithDate:calendar:", v7, v8);

  -[_UIDatePickerCalendarView _updateSelectedDay:time:animated:notify:](self, "_updateSelectedDay:time:animated:notify:", v10, v9, 0, 0);
}

- (void)_updateEnabledStyling
{
  $0F83C0DF395938ED1DDB4892095D3BA2 flags;
  double v4;
  void *v5;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    -[UIView setTintColor:](self, "setTintColor:", 0);
    v4 = 1.0;
  }
  else
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self, "setTintColor:", v5);

    v4 = 0.3;
  }
  -[UIView setAlpha:](self, "setAlpha:", v4);
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", (*(unsigned int *)&flags >> 2) & 1);
}

- (BOOL)_shouldDisplayCalendarView
{
  int64_t v2;

  v2 = -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
  return (unint64_t)(v2 - 1) < 2 || v2 == 4272;
}

- (BOOL)_shouldDisplayTimeView
{
  unint64_t v2;

  v2 = -[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode");
  return v2 <= 3 && v2 != 1 || v2 == 4272;
}

- (void)_updateModuleVisibility
{
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[_UIDatePickerCalendarView _shouldDisplayCalendarView](self, "_shouldDisplayCalendarView");
  v5 = -[_UIDatePickerCalendarView _shouldDisplayTimeView](self, "_shouldDisplayTimeView");
  v6 = v5;
  if (!v4 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarView.m"), 390, CFSTR("Unsupported configuration"));

  }
  -[UIView superview](self->_calendarView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!v7)
      -[UIView addSubview:](self, "addSubview:", self->_calendarView);
  }
  else if (v7)
  {
    -[UIView removeFromSuperview](self->_calendarView, "removeFromSuperview");
  }
  -[UIView superview](self->_timeView, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v8)
      -[UIView addSubview:](self, "addSubview:", self->_timeView);
  }
  else
  {
    if (v8)
      -[UIView removeFromSuperview](self->_timeView, "removeFromSuperview");
    v4 = 0;
  }
  -[_UIDatePickerCalendarTimeView setShouldShowTimeLabel:](self->_timeView, "setShouldShowTimeLabel:", v4);
}

- (void)_updateCustomFonts
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[_UIDatePickerDataModel customFontDesign](self->_data, "customFontDesign");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = v3;
  else
    v4 = *(_QWORD *)off_1E167DBF8;
  -[UICalendarView setFontDesign:](self->_calendarView, "setFontDesign:", v4);
  -[_UIDatePickerCalendarTimeView setCustomFontDesign:](self->_timeView, "setCustomFontDesign:", v5);

}

- (BOOL)_shouldUpdateDataForComponents:(id)a3 date:(id)a4
{
  _UIDatePickerDataModel *data;
  id v5;
  void *v6;
  char v7;

  data = self->_data;
  v5 = a4;
  -[_UIDatePickerDataModel effectiveDate](data, "effectiveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToDate:", v5);

  return v7 ^ 1;
}

- (void)_updateDataForComponents:(id)a3
{
  _UIDatePickerDataModel *data;
  id v5;

  data = self->_data;
  v5 = a3;
  -[_UIDatePickerDataModel setDate:](data, "setDate:", 0);
  -[_UIDatePickerDataModel setLastSelectedDateComponents:](self->_data, "setLastSelectedDateComponents:", v5);

}

- (BOOL)_shouldUpdateTimeViewForSelectedTime:(id)a3
{
  _UIDatePickerCalendarTimeView *timeView;
  id v4;
  void *v5;
  char v6;

  timeView = self->_timeView;
  v4 = a3;
  -[_UIDatePickerCalendarTimeView selectedTime](timeView, "selectedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6 ^ 1;
}

- (void)_updateTimeViewForSelectedDate:(id)a3 animated:(BOOL)a4
{
  -[_UIDatePickerCalendarTimeView setSelectedDate:](self->_timeView, "setSelectedDate:", a3, a4);
}

- (void)_updateSelectedDay:(id)a3 time:(id)a4 animated:(BOOL)a5 notify:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  _UIDatePickerCalendarDay *v19;
  void *v20;
  _UIDatePickerCalendarDay *v21;
  _UIDatePickerCalendarTime *v22;
  void *v23;
  _UIDatePickerCalendarTime *v24;
  _BOOL4 v25;
  UICalendarSelectionSingleDate *selection;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  id v33;

  v31 = a5;
  v32 = a6;
  v8 = a4;
  v33 = (id)objc_msgSend(a3, "copyWithAssignedMonth:", 0);
  objc_msgSend(v33, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = (void *)objc_opt_new();
  for (i = 1; i != 64; ++i)
  {
    v14 = objc_msgSend(v11, "valueForComponent:", 1 << i);
    v15 = objc_msgSend(v10, "valueForComponent:", 1 << i);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDateComponents * _Nonnull _UIDatePickerCombinedDateComponents(NSDateComponents * _Nonnull __strong, NSDateComponents * _Nonnull __strong)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("_UIDatePickerCalendarDateComponent.h"), 68, CFSTR("Error combining %@ and %@. Both components contain values for NSCalendarUnit %lu"), v11, v10, 1 << i);

LABEL_9:
      objc_msgSend(v12, "setValue:forComponent:", v14, 1 << i);
      continue;
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
    v14 = v15;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }

  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCalendar:", v17);

  objc_msgSend(v12, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [_UIDatePickerCalendarDay alloc];
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v19, "initWithDate:calendar:", v18, v20);

  v22 = [_UIDatePickerCalendarTime alloc];
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:](v22, "initWithDate:calendar:", v18, v23);

  v25 = -[_UIDatePickerCalendarView _shouldUpdateDataForComponents:date:](self, "_shouldUpdateDataForComponents:date:", v12, v18);
  if (v25)
    -[_UIDatePickerCalendarView _updateDataForComponents:](self, "_updateDataForComponents:", v12);
  selection = self->_selection;
  objc_msgSend(v33, "components");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelectionSingleDate setSelectedDate:animated:](selection, "setSelectedDate:animated:", v27, v31);

  if (-[_UIDatePickerCalendarView _shouldUpdateTimeViewForSelectedTime:](self, "_shouldUpdateTimeViewForSelectedTime:", v24))
  {
    -[_UIDatePickerCalendarView _updateTimeViewForSelectedDate:animated:](self, "_updateTimeViewForSelectedDate:animated:", v18, v31);
  }
  if (v25 && v32)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    objc_msgSend(WeakRetained, "_emitValueChanged");

  }
}

- (void)_updateSelectedDay:(id)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _UIDatePickerCalendarTimeView *timeView;
  id v9;
  id v10;

  v5 = a5;
  v6 = a4;
  timeView = self->_timeView;
  v9 = a3;
  -[_UIDatePickerCalendarTimeView selectedTime](timeView, "selectedTime");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerCalendarView _updateSelectedDay:time:animated:notify:](self, "_updateSelectedDay:time:animated:notify:", v9, v10, v6, v5);

}

- (void)_updateSelectedTime:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UIDatePickerCalendarDay *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIDatePickerCalendarDay *v11;

  v4 = a4;
  v6 = a3;
  v7 = [_UIDatePickerCalendarDay alloc];
  -[UICalendarSelectionSingleDate selectedDate](self->_selection, "selectedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v7, "initWithDate:calendar:", v9, v10);

  -[_UIDatePickerCalendarView _updateSelectedDay:time:animated:notify:](self, "_updateSelectedDay:time:animated:notify:", v11, v6, 0, v4);
}

- (void)dateSelection:(id)a3 didSelectDate:(id)a4
{
  void *v6;
  void *v7;
  _UIDatePickerCalendarDay *v8;
  void *v9;
  _UIDatePickerCalendarDay *v10;
  void *v11;
  id v12;

  v12 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarView.m"), 493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedDate"));

  }
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [_UIDatePickerCalendarDay alloc];
  -[_UIDatePickerDataModel effectiveCalendar](self->_data, "effectiveCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDatePickerCalendarDay initWithDate:calendar:](v8, "initWithDate:calendar:", v7, v9);

  -[_UIDatePickerCalendarView _updateSelectedDay:animated:notify:](self, "_updateSelectedDay:animated:notify:", v10, 0, 1);
}

- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4
{
  return a4 != 0;
}

- (void)timeView:(id)a3 didSelectTime:(id)a4
{
  -[_UIDatePickerCalendarView _updateSelectedTime:notify:](self, "_updateSelectedTime:notify:", a4, 1);
}

- (void)timeViewDidBeginEditing:(id)a3
{
  id v3;

  -[_UIDatePickerCalendarView datePicker](self, "datePicker", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_emitBeginEditing");

}

- (void)timeViewDidEndEditing:(id)a3
{
  id v4;

  -[_UIDatePickerCalendarView _reloadTimeView](self, "_reloadTimeView", a3);
  -[_UIDatePickerCalendarView datePicker](self, "datePicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_emitEndEditing");

}

- (id)createDatePickerForTimeView:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[_UIDatePickerDataModel createDatePickerRepresentingDataModelForMode:style:](self->_data, "createDatePickerRepresentingDataModelForMode:style:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  objc_msgSend(WeakRetained, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v6);

  return v4;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
  -[_UIDatePickerCalendarView didChangeMinuteInterval](self, "didChangeMinuteInterval");
  -[_UIDatePickerCalendarView didChangeRoundsToMinuteInterval](self, "didChangeRoundsToMinuteInterval");
  -[_UIDatePickerCalendarView _reload](self, "_reload");
}

- (int64_t)datePickerStyle
{
  return 3;
}

- (void)didChangeMode
{
  id v3;

  -[_UIDatePickerCalendarView _updateLayoutMargins](self, "_updateLayoutMargins");
  -[_UIDatePickerCalendarView _updateModuleVisibility](self, "_updateModuleVisibility");
  -[_UIDatePickerCalendarView _updateContentSizeLimitations](self, "_updateContentSizeLimitations");
  -[_UIDatePickerCalendarView datePicker](self, "datePicker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateIntrinsicContentSize");

}

- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4
{
  -[_UIDatePickerCalendarView _setNeedsUpdateDateAnimated:](self, "_setNeedsUpdateDateAnimated:", a4);
}

- (void)displaySelectedDateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UICalendarView *calendarView;
  id v5;

  v3 = a3;
  calendarView = self->_calendarView;
  -[UICalendarSelectionSingleDate selectedDate](self->_selection, "selectedDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UICalendarView setVisibleDateComponents:animated:](calendarView, "setVisibleDateComponents:animated:", v5, v3);

}

- (void)didChangeMinuteInterval
{
  -[_UIDatePickerCalendarTimeView setMinuteInterval:](self->_timeView, "setMinuteInterval:", -[_UIDatePickerDataModel minuteInterval](self->_data, "minuteInterval"));
}

- (void)didChangeRoundsToMinuteInterval
{
  -[_UIDatePickerCalendarTimeView setRoundsToMinuteInterval:](self->_timeView, "setRoundsToMinuteInterval:", -[_UIDatePickerDataModel roundsToMinuteInterval](self->_data, "roundsToMinuteInterval"));
}

- (UIEdgeInsets)appliedInsetsToEdgeOfContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIDatePicker **p_datePicker;
  id WeakRetained;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  if (-[_UIDatePickerDataModel datePickerMode](self->_data, "datePickerMode") == 1)
  {
    -[_UIDatePickerStyle inlineDatePickerMinimumMargin](self->_visualStyle, "inlineDatePickerMinimumMargin");
    v4 = v3;
  }
  else
  {
    -[UIView layoutMargins](self, "layoutMargins");
    v4 = v5;
  }
  -[UIView layoutMargins](self, "layoutMargins");
  v7 = v6;
  p_datePicker = &self->_datePicker;
  WeakRetained = objc_loadWeakRetained((id *)p_datePicker);
  objc_msgSend(WeakRetained, "layoutMargins");
  v11 = v10;
  v12 = objc_loadWeakRetained((id *)p_datePicker);
  objc_msgSend(v12, "layoutMargins");
  v14 = v13;

  v15 = v7;
  v16 = v11;
  v17 = v4;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)usesAutoLayout
{
  return 1;
}

- (CGSize)_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hasDefaultSize
{
  return 0;
}

- (void)_setEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
  -[_UIDatePickerCalendarView _updateEnabledStyling](self, "_updateEnabledStyling");
}

- (id)primaryFirstResponder
{
  void *timeView;
  void *v4;
  double v5;
  BOOL v6;

  timeView = self->_timeView;
  if (timeView)
  {
    objc_msgSend(timeView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (-[UIView alpha](self->_timeView, "alpha"), v5 == 1.0))
    {
      v6 = -[UIView isHidden](self->_timeView, "isHidden");

      if (!v6)
      {
        -[_UIDatePickerCalendarTimeView primaryFirstResponder](self->_timeView, "primaryFirstResponder");
        timeView = (void *)objc_claimAutoreleasedReturnValue();
        return timeView;
      }
    }
    else
    {

    }
    timeView = 0;
  }
  return timeView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_datePicker);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_calendarView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end
