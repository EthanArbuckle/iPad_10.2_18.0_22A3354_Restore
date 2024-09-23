@implementation UIDOMHTMLOptionPickerCell

- (BOOL)_isSelectable
{
  return !-[UIDOMHTMLOptionPickerCell disabled](self, "disabled");
}

- (id)initCommon
{
  UIDOMHTMLOptionPickerCell *v2;
  UIDOMHTMLOptionPickerCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDOMHTMLOptionPickerCell;
  v2 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
    -[UILabel setLineBreakMode:](-[UIPickerContentView titleLabel](v2, "titleLabel"), "setLineBreakMode:", 5);
  return v3;
}

- (UIDOMHTMLOptionPickerCell)initWithHTMLOptionNode:(id)a3
{
  UIDOMHTMLOptionPickerCell *v4;

  v4 = -[UIDOMHTMLOptionPickerCell initCommon](self, "initCommon");
  if (v4)
  {
    -[UILabel setText:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setText:", objc_msgSend(a3, "itemTitle"));
    -[UIPickerContentView setChecked:](v4, "setChecked:", objc_msgSend(a3, "selected"));
    -[UIDOMHTMLOptionPickerCell setDisabled:](v4, "setDisabled:", objc_msgSend(a3, "disabled"));
    if (-[UIDOMHTMLOptionPickerCell disabled](v4, "disabled"))
      -[UILabel setTextColor:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setTextColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
  }
  return v4;
}

- (BOOL)disabled
{
  return *((_BYTE *)&self->super._pickerContentViewFlags + 4);
}

- (void)setDisabled:(BOOL)a3
{
  *((_BYTE *)&self->super._pickerContentViewFlags + 4) = a3;
}

@end
