@implementation TPBottomDoubleButtonBar

- (double)_buttonWidth
{
  unint64_t style;
  double result;
  double v4;
  float v5;

  style = self->super.super._style;
  if (style < 2)
  {
    -[TPBottomDoubleButtonBar bounds](self, "bounds");
    v5 = v4 * 0.5;
    return roundf(v5);
  }
  else if (style == 2)
  {
    return 128.0;
  }
  else
  {
    result = 0.0;
    if (style == 3)
      return 201.0;
  }
  return result;
}

- (void)setButton:(id)a3 andStyle:(BOOL)a4
{
  _BOOL4 v4;
  TPButton *v7;
  TPButton *button;
  TPButton *v9;
  TPButton *v10;

  v4 = a4;
  v7 = (TPButton *)a3;
  button = self->super._button;
  v9 = v7;
  v10 = v7;
  if (button != v7)
  {
    -[TPButton removeFromSuperview](button, "removeFromSuperview", v7);
    objc_storeStrong((id *)&self->super._button, a3);
    v9 = self->super._button;
  }
  if (v9 && v4)
  {
    -[TPBottomDoubleButtonBar addSubview:](self, "addSubview:");
    -[TPBottomDoubleButtonBar layoutSubviews](self, "layoutSubviews");
  }

}

- (void)setButton2:(id)a3 andStyle:(BOOL)a4
{
  _BOOL4 v4;
  TPButton *v7;
  TPButton *button2;
  TPButton *v9;
  TPButton *v10;

  v4 = a4;
  v7 = (TPButton *)a3;
  button2 = self->_button2;
  v9 = v7;
  v10 = v7;
  if (button2 != v7)
  {
    -[TPButton removeFromSuperview](button2, "removeFromSuperview", v7);
    objc_storeStrong((id *)&self->_button2, a3);
    v9 = self->_button2;
  }
  if (v9 && v4)
  {
    -[TPBottomDoubleButtonBar addSubview:](self, "addSubview:");
    -[TPBottomDoubleButtonBar layoutSubviews](self, "layoutSubviews");
  }

}

- (id)button2
{
  return self->_button2;
}

- (void)_layoutButtons
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->super._button)
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", -[TPButton buttonColor](self->super._button, "buttonColor"));
    v4 = v3;
    -[TPBottomDoubleButtonBar bounds](self, "bounds");
    -[TPButton setFrame:](self->super._button, "setFrame:", 0.0, 0.0, v5 * 0.5, v4);
  }
  if (self->_button2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", -[TPButton buttonColor](self->_button2, "buttonColor"));
    v7 = v6;
    -[TPBottomDoubleButtonBar bounds](self, "bounds");
    v9 = v8 * 0.5;
    -[TPBottomDoubleButtonBar bounds](self, "bounds");
    -[TPButton setFrame:](self->_button2, "setFrame:", v9, 0.0, v10 * 0.5, v7);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPBottomDoubleButtonBar;
  -[TPBottomDoubleButtonBar layoutSubviews](&v3, sel_layoutSubviews);
  -[TPBottomDoubleButtonBar _layoutButtons](self, "_layoutButtons");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button2, 0);
}

@end
