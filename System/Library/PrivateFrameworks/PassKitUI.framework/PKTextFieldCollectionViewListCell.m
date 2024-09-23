@implementation PKTextFieldCollectionViewListCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PKTextFieldCollectionViewListCell contentConfiguration](self, "contentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "updatedConfigurationForState:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[PKTextFieldCollectionViewListCell setContentConfiguration:](self, "setContentConfiguration:", v8);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTextFieldCollectionViewListCell;
  -[PKTextFieldCollectionViewListCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

}

- (id)textFieldText
{
  void *v2;
  void *v3;

  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFieldText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)beginEditing
{
  id v2;

  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditing");

}

- (void)endEditing
{
  id v2;

  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing");

}

- (void)resetTextFieldTextFromLabel
{
  id v2;

  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetTextFieldTextFromLabel");

}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextFieldCollectionViewListCell _textFieldContentView](self, "_textFieldContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarItems:", v4);

}

- (BOOL)textFieldShouldReturn:(id)a3 forContentView:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = -[PKTextFieldCollectionViewListCellDelegate textFieldShouldReturn:forListCell:](self->_delegate, "textFieldShouldReturn:forListCell:", v5, self);
  else
    v6 = 0;

  return v6;
}

- (void)textFieldDidBeginEditing:(id)a3 forContentView:(id)a4
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKTextFieldCollectionViewListCellDelegate textFieldDidBeginEditing:forListCell:](self->_delegate, "textFieldDidBeginEditing:forListCell:", v5, self);

}

- (void)textFieldDidEndEditing:(id)a3 forContentView:(id)a4
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKTextFieldCollectionViewListCellDelegate textFieldDidEndEditing:forListCell:](self->_delegate, "textFieldDidEndEditing:forListCell:", v5, self);

}

- (void)textFieldDidChangeSelection:(id)a3 forContentView:(id)a4
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKTextFieldCollectionViewListCellDelegate textFieldDidChangeSelection:forListCell:](self->_delegate, "textFieldDidChangeSelection:forListCell:", v5, self);

}

- (PKTextFieldCollectionViewListCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
