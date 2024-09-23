@implementation ICSSpinnerCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  void *v9;
  void *v10;
  void *v11;
  UIActivityIndicatorView *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICSSpinnerCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v14, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("ICSSpinnerCellIsSpinningKey"), v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "BOOLValue");
  if ((_DWORD)v4)
  {
    -[PSTableCell setType:](self, "setType:", 3);
    -[ICSSpinnerCell setEnabled:](self, "setEnabled:", 0);
    spinner = self->_spinner;
    if (!spinner)
    {
      v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      v8 = self->_spinner;
      self->_spinner = v7;

      spinner = self->_spinner;
    }
    -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UPGRADING"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSSpinnerCell detailTextLabel](self, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[ICSSpinnerCell setAccessoryView:](self, "setAccessoryView:", self->_spinner);
  }
  else
  {
    v12 = self->_spinner;
    self->_spinner = 0;

    -[ICSSpinnerCell setAccessoryView:](self, "setAccessoryView:", 0);
    -[PSTableCell setType:](self, "setType:", 2);
    -[ICSSpinnerCell setEnabled:](self, "setEnabled:", 1);
    -[ICSSpinnerCell detailTextLabel](self, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICSSpinnerCell;
  -[PSTableCell layoutSubviews](&v13, sel_layoutSubviews);
  if (self->_spinner)
  {
    -[ICSSpinnerCell detailTextLabel](self, "detailTextLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[ICSSpinnerCell detailTextLabel](self, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5 + -7.0, v7, v9, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
