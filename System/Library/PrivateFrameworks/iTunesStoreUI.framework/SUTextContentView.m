@implementation SUTextContentView

- (void)dealloc
{
  objc_super v3;

  self->_placeholderLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTextContentView;
  -[UITextContentView dealloc](&v3, sel_dealloc);
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTextContentView;
  v3 = -[UITextContentView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v3)
    -[UILabel removeFromSuperview](self->_placeholderLabel, "removeFromSuperview");
  return v3;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  objc_super v5;

  -[UILabel removeFromSuperview](self->_placeholderLabel, "removeFromSuperview");
  v5.receiver = self;
  v5.super_class = (Class)SUTextContentView;
  -[UITextContentView keyboardInputChangedSelection:](&v5, sel_keyboardInputChangedSelection_, a3);
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTextContentView;
  v3 = -[UITextContentView resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3 && self->_placeholderLabel && !-[NSString length](-[UITextContentView text](self, "text"), "length"))
    -[SUTextContentView addSubview:](self, "addSubview:", self->_placeholderLabel);
  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  -[UILabel setBackgroundColor:](self->_placeholderLabel, "setBackgroundColor:");
  v5.receiver = self;
  v5.super_class = (Class)SUTextContentView;
  -[SUTextContentView setBackgroundColor:](&v5, sel_setBackgroundColor_, a3);
}

- (void)setText:(id)a3
{
  uint64_t v5;
  UILabel *placeholderLabel;
  objc_super v7;

  if (!self->_placeholderLabel)
  {
    placeholderLabel = 0;
    goto LABEL_5;
  }
  v5 = objc_msgSend(a3, "length");
  placeholderLabel = self->_placeholderLabel;
  if (v5)
  {
LABEL_5:
    -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");
    goto LABEL_6;
  }
  -[SUTextContentView addSubview:](self, "addSubview:", placeholderLabel);
LABEL_6:
  v7.receiver = self;
  v7.super_class = (Class)SUTextContentView;
  -[UITextContentView setText:](&v7, sel_setText_, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTextContentView;
  -[SUTextContentView layoutSubviews](&v5, sel_layoutSubviews);
  if (self->_placeholderLabel)
  {
    -[SUTextContentView bounds](self, "bounds");
    v4 = v3;
    -[UILabel frame](self->_placeholderLabel, "frame");
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", 8.0, 8.0, v4 + -8.0 + -15.0);
  }
}

- (NSString)placeholder
{
  return -[UILabel text](self->_placeholderLabel, "text");
}

- (void)setPlaceholder:(id)a3
{
  UILabel *v5;
  UILabel *placeholderLabel;

  if (objc_msgSend(a3, "length") || (placeholderLabel = self->_placeholderLabel) == 0)
  {
    if (objc_msgSend(a3, "length"))
    {
      if (!self->_placeholderLabel)
      {
        v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
        self->_placeholderLabel = v5;
        -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", -[SUTextContentView backgroundColor](self, "backgroundColor"));
        -[UILabel setTextColor:](self->_placeholderLabel, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "placeholderTextColor"));
        -[UILabel setUserInteractionEnabled:](self->_placeholderLabel, "setUserInteractionEnabled:", 0);
      }
      if (!-[UITextContentView isFirstResponder](self, "isFirstResponder")
        && (SUTextContentView *)-[UILabel superview](self->_placeholderLabel, "superview") != self
        && !-[NSString length](-[UITextContentView text](self, "text"), "length"))
      {
        -[SUTextContentView addSubview:](self, "addSubview:", self->_placeholderLabel);
      }
      -[UILabel setFont:](self->_placeholderLabel, "setFont:", -[UITextContentView font](self, "font"));
      -[UILabel setText:](self->_placeholderLabel, "setText:", a3);
      -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
      if ((SUTextContentView *)-[UILabel superview](self->_placeholderLabel, "superview") == self)
        -[SUTextContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");

    self->_placeholderLabel = 0;
  }
}

@end
