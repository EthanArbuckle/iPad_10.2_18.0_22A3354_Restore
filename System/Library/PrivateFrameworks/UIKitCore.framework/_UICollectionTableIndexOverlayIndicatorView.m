@implementation _UICollectionTableIndexOverlayIndicatorView

- (_UICollectionTableIndexOverlayIndicatorView)initWithHost:(id)a3
{
  id v4;
  _UICollectionTableIndexOverlayIndicatorView *v5;
  UILabel *v6;
  UILabel *label;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionTableIndexOverlayIndicatorView;
  v5 = -[UIView init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(UILabel);
    label = v5->_label;
    v5->_label = v6;

    -[UIView addSubview:](v5, "addSubview:", v5->_label);
    v8 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v5, sel__tapGestureChanged_);
    tapGestureRecognizer = v5->_tapGestureRecognizer;
    v5->_tapGestureRecognizer = v8;

    -[UIView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_tapGestureRecognizer);
    objc_storeWeak((id *)&v5->_host, v4);
  }

  return v5;
}

- (void)_tapGestureChanged:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    objc_msgSend(WeakRetained, "_hideIndexOverlay");

  }
}

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  UILabel *label;
  void *v6;
  UILabel *v7;
  void *v8;
  id v9;

  if (a3 == 3)
  {
    label = self->_label;
    +[UIColor whiteColor](UIColor, "whiteColor", 3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](label, "setTextColor:", v6);

    v7 = self->_label;
    objc_msgSend(off_1E167A828, "_ultraLightSystemFontOfSize:", 150.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.85);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v9);

  }
}

- (void)layoutSubviews
{
  UILabel *label;

  label = self->_label;
  -[UIView bounds](self, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
}

- (NSString)currentText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setCurrentText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
