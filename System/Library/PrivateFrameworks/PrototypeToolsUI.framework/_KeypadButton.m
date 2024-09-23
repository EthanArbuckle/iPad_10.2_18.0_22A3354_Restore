@implementation _KeypadButton

- (_KeypadButton)initWithKeyType:(int64_t)a3 digit:(unint64_t)a4 target:(id)a5
{
  id v8;
  _KeypadButton *v9;
  _KeypadButton *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_KeypadButton;
  v9 = -[_KeypadButton initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = v9;
  if (v9)
  {
    v9->_keyType = a3;
    v9->_digit = a4;
    -[_KeypadButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", v8, sel_keyPress_, 64);
    switch(v10->_keyType)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v10->_digit);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        v11 = CFSTR(".");
        break;
      case 2:
        v11 = CFSTR("+/-");
        break;
      case 3:
        v11 = CFSTR("C");
        break;
      case 4:
        v11 = CFSTR("⇦");
        break;
      default:
        v11 = 0;
        break;
    }
    -[_KeypadButton setTitle:forState:](v10, "setTitle:forState:", v11, 0);
    _KeypadForegroundColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KeypadButton setTitleColor:forState:](v10, "setTitleColor:forState:", v12, 0);

    _KeypadBackgroundColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KeypadButton setTitleColor:forState:](v10, "setTitleColor:forState:", v13, 1);

    -[_KeypadButton titleLabel](v10, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7890]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    -[_KeypadButton layer](v10, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", 6.0);

    -[_KeypadButton layer](v10, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderWidth:", 1.0);

    -[_KeypadButton layer](v10, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _KeypadForegroundColor();
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

    -[_KeypadButton _updateBackgroundColor](v10, "_updateBackgroundColor");
  }

  return v10;
}

- (_KeypadButton)initWithKeyType:(int64_t)a3 target:(id)a4
{
  return -[_KeypadButton initWithKeyType:digit:target:](self, "initWithKeyType:digit:target:", a3, 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (_KeypadButton)initWithDigit:(unint64_t)a3 target:(id)a4
{
  return -[_KeypadButton initWithKeyType:digit:target:](self, "initWithKeyType:digit:target:", 0, a3, a4);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_KeypadButton;
  -[_KeypadButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[_KeypadButton _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  id v3;

  if ((-[_KeypadButton isHighlighted](self, "isHighlighted") & 1) != 0)
    _KeypadForegroundColor();
  else
    _KeypadBackgroundColor();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_KeypadButton setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (int64_t)keyType
{
  return self->_keyType;
}

- (unint64_t)digit
{
  return self->_digit;
}

@end
