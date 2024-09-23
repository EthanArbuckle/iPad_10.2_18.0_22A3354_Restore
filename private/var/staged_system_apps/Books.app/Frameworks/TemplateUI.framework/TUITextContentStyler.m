@implementation TUITextContentStyler

- (void)applyStylingToLayer:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUITextContentStyler;
  -[TUIBackgroundColorStyler applyStylingToLayer:](&v3, "applyStylingToLayer:", a3);
}

- (void)applyStylingToView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUITextContentStyler;
  -[TUIBackgroundColorStyler applyStylingToView:](&v5, "applyStylingToView:", v4);
  if (self->_tintColor && (objc_opt_respondsToSelector(v4, "setTintColor:") & 1) != 0)
    objc_msgSend(v4, "setTintColor:", self->_tintColor);
  if (self->_textColor && (objc_opt_respondsToSelector(v4, "setTextColor:") & 1) != 0)
    objc_msgSend(v4, "setTextColor:", self->_textColor);
  if (self->_font && (objc_opt_respondsToSelector(v4, "setFont:") & 1) != 0)
    objc_msgSend(v4, "setFont:", self->_font);

}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  UIColor *textColor;
  UIFont *font;
  UIColor *tintColor;
  unsigned __int8 v11;
  objc_super v13;

  v4 = a3;
  v5 = objc_opt_class(TUITextContentStyler);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue(v6);

  v13.receiver = self;
  v13.super_class = (Class)TUITextContentStyler;
  if (-[TUIBackgroundColorStyler isEqualToStyle:](&v13, "isEqualToStyle:", v7)
    && ((textColor = self->_textColor, textColor == (UIColor *)v7[2])
     || -[UIColor isEqual:](textColor, "isEqual:"))
    && ((font = self->_font, font == (UIFont *)v7[3]) || -[UIFont isEqual:](font, "isEqual:")))
  {
    tintColor = self->_tintColor;
    if (tintColor == (UIColor *)v7[4])
      v11 = 1;
    else
      v11 = -[UIColor isEqual:](tintColor, "isEqual:");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
