@implementation SUButtonAccessoryView

- (SUButtonAccessoryView)initWithDefaultSize
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  return -[SUButtonAccessoryView initWithFrame:](self, "initWithFrame:", 0.0, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  self->_button = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUButtonAccessoryView;
  -[SUButtonAccessoryView dealloc](&v3, sel_dealloc);
}

- (SUGradientButton)button
{
  SUGradientButton *button;
  SUGradientButton *v4;
  void *v5;

  button = self->_button;
  if (!button)
  {
    v4 = objc_alloc_init(SUGradientButton);
    self->_button = v4;
    v5 = (void *)-[SUGradientButton titleLabel](v4, "titleLabel");
    objc_msgSend(v5, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 17.0));
    -[SUGradientButton sizeToFit](self->_button, "sizeToFit");
    button = self->_button;
  }
  if ((SUButtonAccessoryView *)-[SUGradientButton superview](button, "superview") != self)
    -[SUButtonAccessoryView addSubview:](self, "addSubview:", self->_button);
  return self->_button;
}

- (void)layoutSubviews
{
  SUGradientButton *button;
  double v4;
  double v5;
  double v6;

  button = self->_button;
  if (button)
  {
    -[SUGradientButton frame](button, "frame");
    v5 = v4;
    -[SUButtonAccessoryView bounds](self, "bounds");
    -[SUGradientButton setFrame:](self->_button, "setFrame:", 9.0, 16.0, v6 + -9.0 + -9.0, v5);
  }
}

@end
