@implementation TonePickerStyleProvider

- (_TtC13SleepHealthUI23TonePickerStyleProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TonePickerStyleProvider();
  return -[TonePickerStyleProvider init](&v3, sel_init);
}

- (BOOL)tonePickerUsesOpaqueBackground
{
  return 1;
}

- (int64_t)tonePickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)tonePickerCellTextFont
{
  return (UIFont *)0;
}

- (UIColor)tonePickerCellTextColor
{
  return (UIColor *)0;
}

- (UIColor)tonePickerCellHighlightedTextColor
{
  return (UIColor *)0;
}

- (UIColor)tonePickerCellBackgroundColor
{
  return (UIColor *)0;
}

- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3
{
  return 0;
}

- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell
{
  return 0;
}

- (BOOL)wantsCustomTonePickerHeaderView
{
  return 0;
}

- (UIFont)tonePickerHeaderTextFont
{
  return (UIFont *)0;
}

- (UIColor)tonePickerHeaderTextColor
{
  return (UIColor *)0;
}

- (UIColor)tonePickerHeaderTextShadowColor
{
  return (UIColor *)0;
}

- (UIOffset)tonePickerHeaderTextShadowOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = *MEMORY[0x1E0DC51A8];
  v3 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)vibrationPickerUsesOpaqueBackground
{
  return 1;
}

- (int64_t)vibrationPickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)vibrationPickerCellTextFont
{
  return (UIFont *)objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4A88]);
}

- (UIColor)vibrationPickerCellTextColor
{
  return (UIColor *)0;
}

- (UIColor)vibrationPickerCellHighlightedTextColor
{
  return (UIColor *)0;
}

- (UIColor)vibrationPickerCellBackgroundColor
{
  return (UIColor *)0;
}

- (id)newAccessoryDisclosureIndicatorViewForVibrationPickerCell
{
  return 0;
}

- (BOOL)wantsCustomVibrationPickerHeaderView
{
  return 0;
}

- (UIFont)vibrationPickerHeaderTextFont
{
  return (UIFont *)0;
}

- (UIColor)vibrationPickerHeaderTextColor
{
  return (UIColor *)0;
}

- (UIColor)vibrationPickerHeaderTextShadowColor
{
  return (UIColor *)0;
}

- (id)newBackgroundViewForSelectedVibrationPickerCell:(BOOL)a3
{
  return 0;
}

@end
