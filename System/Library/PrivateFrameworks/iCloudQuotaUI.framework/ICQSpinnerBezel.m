@implementation ICQSpinnerBezel

- (ICQSpinnerBezel)initWithFrame:(CGRect)a3
{
  ICQSpinnerBezel *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICQSpinnerBezel;
  v3 = -[ICQSpinnerBezel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    v6 = v3->_spinner;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v6, "setColor:", v7);

    -[UIActivityIndicatorView startAnimating](v3->_spinner, "startAnimating");
    -[ICQSpinnerBezel addSubview:](v3, "addSubview:", v3->_spinner);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQSpinnerBezel setBackgroundColor:](v3, "setBackgroundColor:", v8);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;

  -[ICQSpinnerBezel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v8 = (v4 - v7) * 0.5;
  v10 = v6 * 0.5 - v9;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", floorf(v8), floorf(v10));
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  NSString *bezelText;
  void *v15;
  id v16;

  -[ICQSpinnerBezel bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.699999988);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");

  objc_msgSend(v16, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set");

  v12 = v9 * 0.5;
  v13 = floorf(v12);
  bezelText = self->_bezelText;
  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 22.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString _legacy_drawInRect:withFont:lineBreakMode:alignment:](bezelText, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v15, 0, 1, v5, v13 + 10.0, v7, v13);

}

- (NSString)bezelText
{
  return self->_bezelText;
}

- (void)setBezelText:(id)a3
{
  objc_storeStrong((id *)&self->_bezelText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezelText, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
