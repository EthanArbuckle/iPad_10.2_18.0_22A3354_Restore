@implementation TKPickerTableViewCell

- (void)setTextLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_textLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textLabelColor, a3);
    -[TKPickerTableViewCell _updateTextLabelColor](self, "_updateTextLabelColor");
    v5 = v6;
  }

}

- (void)setShouldTintTextLabel:(BOOL)a3
{
  if (self->_shouldTintTextLabel != a3)
  {
    self->_shouldTintTextLabel = a3;
    if (!self->_textLabelColor)
      -[TKPickerTableViewCell _updateTextLabelColor](self, "_updateTextLabelColor");
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKPickerTableViewCell;
  -[TKPickerTableViewCell tintColorDidChange](&v3, sel_tintColorDidChange);
  if (!self->_textLabelColor && self->_shouldTintTextLabel)
    -[TKPickerTableViewCell _updateTextLabelColor](self, "_updateTextLabelColor");
}

- (void)_updateTextLabelColor
{
  UIColor *v3;
  void *v4;
  UIColor *v5;

  v3 = self->_textLabelColor;
  if (!v3)
  {
    if (!self->_shouldTintTextLabel
      || (-[TKPickerTableViewCell tintColor](self, "tintColor"),
          (v3 = (UIColor *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      +[TKUIKitConstants defaultTableViewCellTextColor](TKUIKitConstants, "defaultTableViewCellTextColor");
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
  }
  v5 = v3;
  -[TKPickerTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)setSectionLocation:(int)a3 animated:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)TKPickerTableViewCell;
  -[TKPickerTableViewCell setSectionLocation:animated:](&v8, sel_setSectionLocation_animated_, *(_QWORD *)&a3, a4);
  -[TKPickerTableViewCell backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setSectionLocation:", v4);
  -[TKPickerTableViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setSectionLocation:", v4);

}

- (UIColor)textLabelColor
{
  return self->_textLabelColor;
}

- (BOOL)shouldTintTextLabel
{
  return self->_shouldTintTextLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabelColor, 0);
}

@end
