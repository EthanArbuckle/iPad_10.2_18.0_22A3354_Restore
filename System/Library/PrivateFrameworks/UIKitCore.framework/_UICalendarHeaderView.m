@implementation _UICalendarHeaderView

- (_UICalendarHeaderView)initWithDataModel:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  _UICalendarHeaderView *v9;
  _UICalendarHeaderView *v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UICalendarHeaderView;
  v9 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_dataModel, a3);
    -[UIView setLayoutMargins:](v10, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    -[UIView setPreservesSuperviewLayoutMargins:](v10, "setPreservesSuperviewLayoutMargins:", 1);
    -[_UICalendarHeaderView _setupDateFormatter](v10, "_setupDateFormatter");
    -[_UICalendarHeaderView _setupViewHierarchy](v10, "_setupViewHierarchy");
    -[_UICalendarHeaderView _updateMonthYearLabel](v10, "_updateMonthYearLabel");
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v11, sel__updateFont);

  }
  return v10;
}

- (void)_setupDateFormatter
{
  void *v3;
  void *v4;
  NSDateFormatter *v5;
  NSDateFormatter *longFormatter;
  NSDateFormatter *v7;
  NSDateFormatter *v8;
  void *v9;
  NSDateFormatter *shortFormatter;
  id v11;

  -[_UICalendarDataModel effectiveCalendar](self->_dataModel, "effectiveCalendar");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel effectiveLocale](self->_dataModel, "effectiveLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel effectiveTimeZone](self->_dataModel, "effectiveTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSDateFormatter *)objc_opt_new();
  -[NSDateFormatter setFormattingContext:](v5, "setFormattingContext:", 2);
  -[NSDateFormatter setCalendar:](v5, "setCalendar:", v11);
  -[NSDateFormatter setLocale:](v5, "setLocale:", v3);
  -[NSDateFormatter setTimeZone:](v5, "setTimeZone:", v4);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v5, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMy"));
  longFormatter = self->_longFormatter;
  self->_longFormatter = v5;
  v7 = v5;

  v8 = (NSDateFormatter *)objc_opt_new();
  -[NSDateFormatter setFormattingContext:](v8, "setFormattingContext:", 2);
  -[NSDateFormatter setCalendar:](v8, "setCalendar:", v11);
  -[NSDateFormatter setLocale:](v8, "setLocale:", v3);
  objc_msgSend(v11, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](v8, "setTimeZone:", v9);

  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v8, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMy"));
  shortFormatter = self->_shortFormatter;
  self->_shortFormatter = v8;

}

- (void)_setupViewHierarchy
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nextPreviousMonthButtonConfiguration");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.backward"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__adjustMonth_, 0x2000);
  -[UIView addSubview:](self, "addSubview:", v9);
  objc_storeStrong((id *)&self->_previousMonthButton, v9);
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v10);

  +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__adjustMonth_, 0x2000);
  -[UIView addSubview:](self, "addSubview:", v11);
  objc_storeStrong((id *)&self->_nextMonthButton, v11);
  objc_msgSend(v4, "monthYearButtonConfiguration");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v12)[2](v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIButton buttonWithConfiguration:primaryAction:](_UICalendarHeaderTitleButton, "buttonWithConfiguration:primaryAction:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", objc_msgSend(v16, "userInterfaceIdiom") != 5);

  -[UIView addSubview:](self, "addSubview:", v15);
  objc_storeStrong((id *)&self->_monthYearButton, v15);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __44___UICalendarHeaderView__setupViewHierarchy__block_invoke;
  v21 = &unk_1E16B58D0;
  objc_copyWeak(&v22, &location);
  +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:forControlEvents:", v17, 0x2000, v18, v19, v20, v21);

  objc_msgSend(v9, "setPreferredBehavioralStyle:", 1);
  objc_msgSend(v11, "setPreferredBehavioralStyle:", 1);
  objc_msgSend(v15, "setPreferredBehavioralStyle:", 1);
  objc_msgSend(v9, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v11, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v15, "setPointerInteractionEnabled:", 1);
  -[_UICalendarHeaderView _updateFont](self, "_updateFont");
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)didUpdateCalendar
{
  -[_UICalendarHeaderView _setupDateFormatter](self, "_setupDateFormatter");
  -[_UICalendarHeaderView _updateMonthYearLabel](self, "_updateMonthYearLabel");
}

- (void)didUpdateLocale
{
  -[_UICalendarHeaderView _setupDateFormatter](self, "_setupDateFormatter");
  -[_UICalendarHeaderView _updateMonthYearLabel](self, "_updateMonthYearLabel");
}

- (void)didUpdateTimeZone
{
  -[_UICalendarHeaderView _setupDateFormatter](self, "_setupDateFormatter");
  -[_UICalendarHeaderView _updateMonthYearLabel](self, "_updateMonthYearLabel");
}

- (void)didUpdateVisibleMonth
{
  -[_UICalendarHeaderView _updateMonthYearLabel](self, "_updateMonthYearLabel");
  -[_UICalendarHeaderView _updateMonthButtonEnablement](self, "_updateMonthButtonEnablement");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICalendarHeaderView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICalendarHeaderView;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  if (self->_expanded)
    -[_UICalendarHeaderView _updateMonthYearLabel](self, "_updateMonthYearLabel");
}

- (void)_updateMonthYearLabel
{
  _UICalendarHeaderTitleButton *monthYearButton;
  NSDateFormatter *longFormatter;
  void *v5;
  void *v6;
  void *v7;
  NSDateFormatter *shortFormatter;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  monthYearButton = self->_monthYearButton;
  longFormatter = self->_longFormatter;
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](longFormatter, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  shortFormatter = self->_shortFormatter;
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](shortFormatter, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarHeaderTitleButton updateTitles:isExpanded:](monthYearButton, "updateTitles:isExpanded:", v12, self->_expanded);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFont
{
  void *v3;

  -[_UICalendarDataModel fontDesign](self->_dataModel, "fontDesign");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarHeaderTitleButton setFontDesign:](self->_monthYearButton, "setFontDesign:", v3);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double (**v7)(_QWORD);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize v15;
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
  CGRectEdge v26;
  UIButton *previousMonthButton;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  UIButton *nextMonthButton;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double x;
  CGRect v45;
  CGRect slice;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v47.receiver = self;
  v47.super_class = (Class)_UICalendarHeaderView;
  -[UIView layoutSubviews](&v47, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  if (v3 != 0.0)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UICalendarViewGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v5, "headerViewInsetsForLayoutMargins");
    v7 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
    v8 = v7[2](v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v15;
    -[UIView bounds](self, "bounds");
    if (v6)
      v20 = v14;
    else
      v20 = v10;
    if (v6)
      v21 = v10;
    else
      v21 = v14;
    v22 = v20 + v16;
    v23 = v8 + v17;
    v24 = v18 - (v20 + v21);
    v25 = v19 - (v8 + v12);
    v45.origin.x = v20 + v16;
    v45.origin.y = v8 + v17;
    v45.size.width = v24;
    v45.size.height = v25;
    if (v6)
      v26 = CGRectMinXEdge;
    else
      v26 = CGRectMaxXEdge;
    previousMonthButton = self->_previousMonthButton;
    -[UIView bounds](self, "bounds", *(_QWORD *)&v45.origin.x);
    -[UIButton sizeThatFits:](previousMonthButton, "sizeThatFits:", v28, v29);
    v31 = v30;
    v33 = v32;
    nextMonthButton = self->_nextMonthButton;
    -[UIView bounds](self, "bounds");
    -[UIButton sizeThatFits:](nextMonthButton, "sizeThatFits:", v35, v36);
    v38 = v37;
    v40 = v39;
    v48.origin.x = v22;
    v48.origin.y = v23;
    v48.size.width = v24;
    v48.size.height = v25;
    CGRectDivide(v48, &slice, &v45, v38, v26);
    v49 = CGRectInset(slice, 0.0, (slice.size.height - v40) * 0.5);
    -[UIButton setFrame:](self->_nextMonthButton, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    objc_msgSend(v5, "headerViewInterMonthButtonSpacing");
    if (v41 > 0.0)
      CGRectDivide(v45, &slice, &v45, v41, v26);
    CGRectDivide(v45, &slice, &v45, v31, v26);
    v50 = CGRectInset(slice, 0.0, (slice.size.height - v33) * 0.5);
    -[UIButton setFrame:](self->_previousMonthButton, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    -[_UICalendarHeaderTitleButton sizeThatFits:](self->_monthYearButton, "sizeThatFits:", v45.size.width, v45.size.height);
    v43 = v42;
    if (v6)
      x = CGRectGetMaxX(v45) - v42;
    else
      x = v45.origin.x;
    -[UIButton setFrame:](self->_monthYearButton, "setFrame:", x, 0.0, v43, v45.size.height);

  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double (**v8)(_QWORD);
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
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
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UICalendarViewGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "headerViewIntrinsicLayoutMarginsForProposedLayoutMargins");
  v8 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView layoutMargins](self, "layoutMargins");
  v9 = v8[2](v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[UIButton configuration](self->_nextMonthButton, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInsets");
  v18 = v11 + v15 - v17;

  v19 = v9 + v13;
  v20 = width - v18;
  -[_UICalendarHeaderTitleButton sizeThatFits:](self->_monthYearButton, "sizeThatFits:", width - v18, height);
  v22 = v21;
  v24 = v23;
  -[UIButton sizeThatFits:](self->_previousMonthButton, "sizeThatFits:", v20, height);
  v26 = v25;
  v28 = v27;
  objc_msgSend(v7, "headerViewInterMonthButtonSpacing");
  v30 = fmax(width - (v20 - (v22 + v29 + v26 + v26)), width);

  v31 = v30;
  v32 = fmax(v19 + v24, v28);
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)_adjustMonth:(id)a3
{
  UIButton *nextMonthButton;
  void *v6;
  id v7;

  nextMonthButton = self->_nextMonthButton;
  -[_UICalendarHeaderView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (nextMonthButton == a3)
    objc_msgSend(v6, "headerViewDidStepForward:", self);
  else
    objc_msgSend(v6, "headerViewDidStepBackward:", self);

}

- (void)setExpanded:(BOOL)a3
{
  -[_UICalendarHeaderView setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v7;
  double v8;
  __int128 v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  CGAffineTransform v13;
  BOOL v14;
  CGAffineTransform v15;

  v4 = a4;
  v5 = a3;
  if (-[_UICalendarHeaderView isExpanded](self, "isExpanded") != a3
    && -[UIControl isEnabled](self->_monthYearButton, "isEnabled"))
  {
    self->_expanded = v5;
    v7 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    memset(&v15, 0, sizeof(v15));
    if (v5)
    {
      v8 = 1.57079633;
      if (v7)
        v8 = -1.57079633;
      CGAffineTransformMakeRotation(&v15, v8);
    }
    else
    {
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v15.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v15.c = v9;
      *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v12[1] = 3221225472;
    v13 = v15;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[2] = __46___UICalendarHeaderView_setExpanded_animated___block_invoke;
    v12[3] = &unk_1E16BF6D8;
    v12[4] = self;
    v14 = v5;
    v10 = _Block_copy(v12);
    v11 = v10;
    if (v4)
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v10, 0, 0.25, 0.0);
    else
      (*((void (**)(void *))v10 + 2))(v10);

  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  _UICalendarHeaderTitleButton *v7;
  double Height;
  double v9;
  double v10;
  double x;
  double y;
  double width;
  double v14;
  UITargetedPreview *v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationAndToolbarSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_monthYearButton;
  -[UIView bounds](v7, "bounds");
  Height = CGRectGetHeight(v20);
  objc_msgSend(v6, "buttonMinimumHeight");
  v10 = fmax((v9 - Height) * 0.5, 0.0);
  -[UIView frame](v7, "frame");
  v22 = CGRectInset(v21, -4.0, -v10);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  v14 = v22.size.height;
  v15 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v7);

  +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", x, y, width, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_updateMonthButtonEnablement
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousMonth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "_ui_containsMonth:", v5);

  -[_UICalendarDataModel availableDateRange](self->_dataModel, "availableDateRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalendarDataModel visibleMonth](self->_dataModel, "visibleMonth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "_ui_containsMonth:", v9);

  -[UIButton setEnabled:](self->_previousMonthButton, "setEnabled:", v6);
  -[UIButton setEnabled:](self->_nextMonthButton, "setEnabled:", v10);
}

- (void)_updateMonthButtonVisibility
{
  double v3;

  if (self->_expanded)
    v3 = 0.0;
  else
    v3 = 1.0;
  -[UIView setAlpha:](self->_previousMonthButton, "setAlpha:", v3);
  -[UIView setAlpha:](self->_nextMonthButton, "setAlpha:", v3);
}

- (_UICalendarHeaderViewDelegate)delegate
{
  return (_UICalendarHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UICalendarDataModel)dataModel
{
  return self->_dataModel;
}

- (void)setDataModel:(id)a3
{
  objc_storeStrong((id *)&self->_dataModel, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextMonthButton, 0);
  objc_storeStrong((id *)&self->_previousMonthButton, 0);
  objc_storeStrong((id *)&self->_monthYearButton, 0);
  objc_storeStrong((id *)&self->_shortFormatter, 0);
  objc_storeStrong((id *)&self->_longFormatter, 0);
}

@end
