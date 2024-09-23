@implementation SULoadingView

- (SULoadingView)initWithFrame:(CGRect)a3
{
  SULoadingView *v3;
  SULoadingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SULoadingView;
  v3 = -[SULoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_activityIndicatorStyle = 100;
    v3->_textColor = (UIColor *)(id)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SULoadingView;
  -[SULoadingView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SULoadingView _setupSubviews](self, "_setupSubviews");
  -[SULoadingView addSubview:](self, "addSubview:", self->_label);
  -[SULoadingView addSubview:](self, "addSubview:", self->_progressIndicator);
  -[SULoadingView bounds](self, "bounds");
  v4 = v3;
  -[UILabel frame](self->_label, "frame");
  v6 = v5;
  v8 = v7;
  -[UIActivityIndicatorView frame](self->_progressIndicator, "frame");
  -[UILabel setFrame:](self->_label, "setFrame:", v9 + v10 + 4.0, floor((v4 - v8) * 0.5), v6, v8);
}

- (void)sizeToFit
{
  -[SULoadingView _setupSubviews](self, "_setupSubviews");
  -[UILabel frame](self->_label, "frame");
  -[UIActivityIndicatorView frame](self->_progressIndicator, "frame");
  -[SULoadingView frame](self, "frame");
  -[SULoadingView setFrame:](self, "setFrame:");
}

- (id)newProgressIndicator
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", self->_activityIndicatorStyle);
  objc_msgSend(v3, "setColor:", self->_activityIndicatorColor);
  objc_msgSend(v3, "startAnimating");
  return v3;
}

- (id)newTextLabel
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v3, "setBackgroundColor:", 0);
  objc_msgSend(v3, "setHighlightedTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0));
  if (self->_textShadowColor)
  {
    objc_msgSend(v3, "setShadowColor:");
    objc_msgSend(v3, "setShadowOffset:", 0.0, 1.0);
  }
  objc_msgSend(v3, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24DE83F60, 0));
  objc_msgSend(v3, "setTextColor:", self->_textColor);
  return v3;
}

- (void)setActivityIndicatorColor:(id)a3
{
  UIColor *activityIndicatorColor;
  UIColor *v6;

  activityIndicatorColor = self->_activityIndicatorColor;
  if (activityIndicatorColor != a3)
  {

    v6 = (UIColor *)a3;
    self->_activityIndicatorColor = v6;
    -[UIActivityIndicatorView setColor:](self->_progressIndicator, "setColor:", v6);
  }
}

- (void)setActivityIndicatorStyle:(int64_t)a3
{
  self->_activityIndicatorStyle = a3;
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_progressIndicator, "setActivityIndicatorViewStyle:");
}

- (void)setStyle:(unint64_t)a3
{
  uint64_t v4;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 1)
      v4 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
    else
      v4 = objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    -[SULoadingView setTextShadowColor:](self, "setTextShadowColor:", v4);
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *textColor;

  textColor = self->_textColor;
  if (textColor != a3)
  {

    self->_textColor = (UIColor *)a3;
    -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
  }
}

- (void)setTextShadowColor:(id)a3
{
  UIColor *textShadowColor;

  textShadowColor = self->_textShadowColor;
  if (textShadowColor != a3)
  {

    self->_textShadowColor = (UIColor *)a3;
    -[UILabel setShadowColor:](self->_label, "setShadowColor:", a3);
  }
}

- (void)_setupSubviews
{
  UILabel *v3;

  if (!self->_label)
  {
    v3 = -[SULoadingView newTextLabel](self, "newTextLabel");
    self->_label = v3;
    -[UILabel sizeToFit](v3, "sizeToFit");
  }
  if (!self->_progressIndicator)
    self->_progressIndicator = (UIActivityIndicatorView *)-[SULoadingView newProgressIndicator](self, "newProgressIndicator");
}

- (UIColor)activityIndicatorColor
{
  return self->_activityIndicatorColor;
}

- (int64_t)activityIndicatorStyle
{
  return self->_activityIndicatorStyle;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)textShadowColor
{
  return self->_textShadowColor;
}

@end
