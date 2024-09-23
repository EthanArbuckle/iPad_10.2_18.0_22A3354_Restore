@implementation PKPayLaterIconTextCell

- (void)setPrimaryText:(id)a3
{
  id v4;
  PKTitleDetailValueTextView *view;
  id v6;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTitleDetailValueTextView setPrimaryText:](view, "setPrimaryText:", v6);
}

- (void)setSecondaryText:(id)a3
{
  id v4;
  PKTitleDetailValueTextView *view;
  id v6;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTitleDetailValueTextView setSecondaryText:](view, "setSecondaryText:", v6);
}

- (void)setTertiaryText:(id)a3
{
  id v4;
  PKTitleDetailValueTextView *view;
  id v6;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTitleDetailValueTextView setTertiaryText:](view, "setTertiaryText:", v6);
}

- (void)setAmountText:(id)a3
{
  id v4;
  PKTitleDetailValueTextView *view;
  id v6;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTitleDetailValueTextView setAmountText:](view, "setAmountText:", v6);
}

- (void)setPrimaryFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setPrimaryFont:](self->_view, "setPrimaryFont:", v4);

}

- (void)setSecondaryFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setSecondaryFont:](self->_view, "setSecondaryFont:", v4);

}

- (void)setTertiaryFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setTertiaryFont:](self->_view, "setTertiaryFont:", v4);

}

- (void)setAmountFont:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setAmountFont:](self->_view, "setAmountFont:", v4);

}

- (void)setPrimaryTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setPrimaryTextColor:](self->_view, "setPrimaryTextColor:", v4);

}

- (void)setSecondaryTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setSecondaryTextColor:](self->_view, "setSecondaryTextColor:", v4);

}

- (void)setTertiaryTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setTertiaryTextColor:](self->_view, "setTertiaryTextColor:", v4);

}

- (void)setAmountTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setAmountTextColor:](self->_view, "setAmountTextColor:", v4);

}

- (void)setAccessory:(unint64_t)a3
{
  -[PKPayLaterIconTextCell _createViewIfNecessary](self, "_createViewIfNecessary");
  -[PKTitleDetailValueTextView setAccessory:](self->_view, "setAccessory:", a3);
}

- (void)_createViewIfNecessary
{
  PKTitleDetailValueTextView *v3;
  PKTitleDetailValueTextView *view;

  if (!self->_view)
  {
    v3 = objc_alloc_init(PKTitleDetailValueTextView);
    view = self->_view;
    self->_view = v3;

    -[PKPayLaterIconCell setView:](self, "setView:", self->_view);
  }
}

- (void)prepareForReuse
{
  PKTitleDetailValueTextView *view;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterIconTextCell;
  -[PKPayLaterIconCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKTitleDetailValueTextView removeFromSuperview](self->_view, "removeFromSuperview");
  view = self->_view;
  self->_view = 0;

}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)tertiaryFont
{
  return self->_tertiaryFont;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_tertiaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
