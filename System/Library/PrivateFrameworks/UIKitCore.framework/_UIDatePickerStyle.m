@implementation _UIDatePickerStyle

- (id)createOverlayBackgroundView
{
  return (id)objc_opt_new();
}

- (void)addSubview:(id)a3 toOverlayBackgroundView:(id)a4
{
  objc_msgSend(a4, "addSubview:", a3);
}

- (double)horizontalDatePadding
{
  return 10.0;
}

- (double)horizontalTimeColumnPadding
{
  return 15.0;
}

- (double)horizontalWeekMonthDayPadding
{
  return 11.0;
}

- (double)horizontalWeekdayTimePadding
{
  return 10.0;
}

- (double)horizontalPaddingForAMPM
{
  return 8.0;
}

- (CGSize)idealLayoutFittingSizeForDatePickerMode:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)inlineDateViewMinimumWidth
{
  return 0.0;
}

- (double)inlineTimeViewMinimumWidth
{
  return 0.0;
}

- (double)inlineDatePickerMaximumWidth
{
  return 0.0;
}

- (UIEdgeInsets)maximumWidthOverhangForProposedLayoutMargins:(UIEdgeInsets)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIOffset)overlayPlatterPaddingForAppliedInsets:(UIEdgeInsets)a3 datePickerMode:(int64_t)a4
{
  double left;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  left = a3.left;
  top = a3.top;
  -[_UIDatePickerStyle overlayPlatterDefaultMargin](self, "overlayPlatterDefaultMargin", a4, a3.top, a3.left, a3.bottom, a3.right);
  v8 = v7 - left;
  -[_UIDatePickerStyle overlayPlatterDefaultMargin](self, "overlayPlatterDefaultMargin");
  v10 = v9 - top;
  v11 = v8;
  result.vertical = v10;
  result.horizontal = v11;
  return result;
}

- (double)inlineTimeAndDateSpacing
{
  return 0.0;
}

- (double)inlineDatePickerMinimumMargin
{
  return 0.0;
}

- (double)compactLabelButtonSpacing
{
  return 0.0;
}

- (double)compactLabelCornerRadius
{
  return 0.0;
}

- (CGSize)compactLabelBackgroundPadding
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

- (int64_t)datePickerModalPresentationStyle
{
  return -1;
}

- (double)overlayPlatterCornerRadius
{
  return 0.0;
}

- (double)overlayPlatterInitialScale
{
  return 0.0;
}

- (double)overlayPlatterInitialHeight
{
  return 0.0;
}

- (double)overlayPlatterDefaultSpacing
{
  return 0.0;
}

- (double)overlayPlatterDefaultMargin
{
  return 0.0;
}

- (double)horizontalEdgeInset
{
  return 13.0;
}

- (BOOL)overlayPlatterWantsShadowView
{
  return 0;
}

- (id)compactLabelTextColorForEditingState:(BOOL)a3
{
  if (a3)
    +[UIColor blackColor](UIColor, "blackColor");
  else
    +[UIColor labelColor](UIColor, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compactLabelBackgroundColorForEnabledState:(BOOL)a3
{
  if (!a3)
    return 0;
  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compactLabelBackgroundButtonConfiguration
{
  return +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
}

- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3 datePickerMode:(int64_t)a4 dayIsBeforeMonth:(BOOL)a5
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 2;
  v6 = 1;
  v7 = 2;
  if (a5)
    v7 = 0;
  if (a3 == 8)
    v6 = v7;
  if (a3 == 16)
    v6 = 2;
  if (a3 != 32)
    v5 = v6;
  if (a4 == 3)
    return 2;
  else
    return v5;
}

- (double)compactDateLabelPlatterHorizontalPadding
{
  return 0.0;
}

- (double)compactDateLabelPlatterVerticalPadding
{
  return 0.0;
}

- (double)pickerHorizontalEdgeInset
{
  return self->_pickerHorizontalEdgeInset;
}

@end
