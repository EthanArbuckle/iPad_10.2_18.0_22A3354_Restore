@implementation VSSpinnerTitleView

- (VSSpinnerTitleView)initWithTitle:(id)a3
{
  id v4;
  VSSpinnerTitleView *v5;
  id v6;
  uint64_t v7;
  UILabel *titleView;
  void *v9;
  UIActivityIndicatorView *v10;
  UIActivityIndicatorView *spinner;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSSpinnerTitleView;
  v5 = -[VSSpinnerTitleView initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, 0.0, 22.0);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDF6B68]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    titleView = v5->_titleView;
    v5->_titleView = (UILabel *)v7;

    -[UILabel setText:](v5->_titleView, "setText:", v4);
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleView, "setFont:", v9);

    v10 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x24BDF67D0]);
    spinner = v5->_spinner;
    v5->_spinner = v10;

    -[VSSpinnerTitleView addSubview:](v5, "addSubview:", v5->_titleView);
    -[VSSpinnerTitleView addSubview:](v5, "addSubview:", v5->_spinner);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)VSSpinnerTitleView;
  -[VSSpinnerTitleView dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UILabel sizeToFit](self->_titleView, "sizeToFit", a3.width, a3.height);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UILabel frame](self->_titleView, "frame");
  v5 = v4;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  if (v5 < v6)
    v5 = v6;
  -[UILabel frame](self->_titleView, "frame");
  v8 = v7 + 10.0;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v10 = v8 + v9 + 10.0;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v12 = v10 + v11;
  v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
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
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)VSSpinnerTitleView;
  -[VSSpinnerTitleView layoutSubviews](&v11, sel_layoutSubviews);
  -[UILabel sizeToFit](self->_titleView, "sizeToFit");
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[VSSpinnerTitleView bounds](self, "bounds");
  v4 = v3;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  -[UILabel frame](self->_titleView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[UILabel setFrame:](self->_titleView, "setFrame:", CGRectGetMaxX(v12) + 10.0, v6 + floor((v4 - v10) * 0.5), v8, v10);
}

- (void)didMoveToWindow
{
  void *v3;
  UIActivityIndicatorView *spinner;

  -[VSSpinnerTitleView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  spinner = self->_spinner;
  if (v3)
    -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
