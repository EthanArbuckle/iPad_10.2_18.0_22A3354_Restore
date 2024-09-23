@implementation PSSpinnerTableCell

- (PSSpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSSpinnerTableCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *spinner;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSSpinnerTableCell;
  v4 = -[PSSpinnerTableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    -[PSSpinnerTableCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_spinner);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSSpinnerTableCell;
  -[PSTableCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PSSpinnerTableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v9 = (v5 - v8) * 0.5;
  v11 = (v7 - v10) * 0.5;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", floorf(v9), floorf(v11));
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSSpinnerTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

@end
