@implementation _KeypadDismissButton

- (_KeypadDismissButton)initWithFrame:(CGRect)a3
{
  _KeypadDismissButton *v3;
  _KeypadDismissButton *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_KeypadDismissButton;
  v3 = -[_KeypadDismissButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_KeypadDismissButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", 2.0);

    -[_KeypadDismissButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _KeypadBackgroundColor();
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    _KeypadForegroundColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KeypadDismissButton setBackgroundColor:](v4, "setBackgroundColor:", v8);

    -[_KeypadDismissButton setTitle:forState:](v4, "setTitle:forState:", CFSTR("✕"), 0);
    _KeypadBackgroundColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KeypadDismissButton setTitleColor:forState:](v4, "setTitleColor:forState:", v9, 0);

    _KeypadForegroundColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KeypadDismissButton setTitleColor:forState:](v4, "setTitleColor:forState:", v10, 1);

    -[_KeypadDismissButton titleLabel](v4, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 24.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (a3)
    _KeypadBackgroundColor();
  else
    _KeypadForegroundColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KeypadDismissButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6.receiver = self;
  v6.super_class = (Class)_KeypadDismissButton;
  -[_KeypadDismissButton setHighlighted:](&v6, sel_setHighlighted_, v3);
}

@end
