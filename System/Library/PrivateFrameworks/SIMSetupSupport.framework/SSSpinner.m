@implementation SSSpinner

- (SSSpinner)initWithText:(id)a3
{
  id v4;
  SSSpinner *v5;
  uint64_t v6;
  UIActivityIndicatorView *activityIndicator;
  UILabel *v8;
  UILabel *label;
  void *v10;
  UILabel *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSSpinner;
  v5 = -[SSSpinner init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v5->_activityIndicator;
    v5->_activityIndicator = (UIActivityIndicatorView *)v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v5->_label;
    v5->_label = v8;

    -[UILabel setText:](v5->_label, "setText:", v4);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_label, "setTextColor:", v10);

    -[UILabel setHidden:](v5->_label, "setHidden:", 1);
    v11 = v5->_label;
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 16.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[SSSpinner setSpacing:](v5, "setSpacing:", 8.0);
    -[SSSpinner addArrangedSubview:](v5, "addArrangedSubview:", v5->_activityIndicator);
    -[SSSpinner addArrangedSubview:](v5, "addArrangedSubview:", v5->_label);
    -[SSSpinner setAxis:](v5, "setAxis:", 0);
    -[SSSpinner setAlignment:](v5, "setAlignment:", 3);
  }

  return v5;
}

- (void)startAnimating
{
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  -[UILabel setHidden:](self->_label, "setHidden:", 0);
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  -[UILabel setHidden:](self->_label, "setHidden:", 1);
}

- (void)updateText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (BOOL)isAnimating
{
  return -[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating");
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setActivityIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 456, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
