@implementation PKLeftAlignedSpinnerCell

- (PKLeftAlignedSpinnerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKLeftAlignedSpinnerCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *spinner;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKLeftAlignedSpinnerCell;
  v4 = -[PKLeftAlignedSpinnerCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView startAnimating](v4->_spinner, "startAnimating");
    -[PKLeftAlignedSpinnerCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_spinner);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)PKLeftAlignedSpinnerCell;
  -[PKLeftAlignedSpinnerCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKLeftAlignedSpinnerCell;
  -[PKLeftAlignedSpinnerCell layoutSubviews](&v11, sel_layoutSubviews);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v4 = v3;
  v6 = v5;
  v7 = PKTableViewCellTextInset();
  -[PKLeftAlignedSpinnerCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9 * 0.5 - v6 * 0.5;

  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v7, v10, v4, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
