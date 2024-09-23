@implementation SiriUIActivityIndicatorTemplateView

- (SiriUIActivityIndicatorTemplateView)initWithDataSource:(id)a3
{
  SiriUIActivityIndicatorTemplateView *v3;
  uint64_t v4;
  UILabel *detailTextLabel;
  UILabel *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIActivityIndicatorView *spinnerView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SiriUIActivityIndicatorTemplateView;
  v3 = -[SiriUIBaseTemplateView initWithDataSource:](&v12, sel_initWithDataSource_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredBodyLabel");
    v4 = objc_claimAutoreleasedReturnValue();
    detailTextLabel = v3->_detailTextLabel;
    v3->_detailTextLabel = (UILabel *)v4;

    -[UILabel setUseSecondaryTextColor](v3->_detailTextLabel, "setUseSecondaryTextColor");
    v6 = v3->_detailTextLabel;
    -[SiriUIBaseTemplateView dataSource](v3, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6, "setText:", v8);

    -[SiriUIActivityIndicatorTemplateView addSubview:](v3, "addSubview:", v3->_detailTextLabel);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = (UIActivityIndicatorView *)v9;

    -[UIActivityIndicatorView startAnimating](v3->_spinnerView, "startAnimating");
    -[SiriUIActivityIndicatorTemplateView addSubview:](v3, "addSubview:", v3->_spinnerView);
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
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  UIActivityIndicatorView *spinnerView;
  CGAffineTransform v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SiriUIActivityIndicatorTemplateView;
  -[SiriUIActivityIndicatorTemplateView layoutSubviews](&v18, sel_layoutSubviews);
  -[SiriUIActivityIndicatorTemplateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel sizeToFit](self->_detailTextLabel, "sizeToFit");
  -[UILabel frame](self->_detailTextLabel, "frame");
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v7 * -0.5 + v4 * 0.5, v6 * 0.5);
  -[UIActivityIndicatorView sizeToFit](self->_spinnerView, "sizeToFit");
  -[UIActivityIndicatorView frame](self->_spinnerView, "frame");
  v9 = v8;
  v11 = v10;
  -[UILabel text](self->_detailTextLabel, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[UILabel frame](self->_detailTextLabel, "frame");
    v15 = v14 - v11 + -10.0;
  }
  else
  {
    v15 = v11 * -0.5 + v6 * 0.5;
  }
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v9 * -0.5 + v4 * 0.5, v15, v9, v11);
  spinnerView = self->_spinnerView;
  CGAffineTransformMakeScale(&v17, 1.5, 1.5);
  -[UIActivityIndicatorView setTransform:](spinnerView, "setTransform:", &v17);
}

- (void)reloadData
{
  UILabel *detailTextLabel;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUIActivityIndicatorTemplateView;
  -[SiriUIBaseTemplateView reloadData](&v6, sel_reloadData);
  detailTextLabel = self->_detailTextLabel;
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](detailTextLabel, "setText:", v5);

}

- (double)desiredHeight
{
  return 180.0;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabel, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
}

@end
