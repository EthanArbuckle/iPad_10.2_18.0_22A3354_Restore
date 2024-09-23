@implementation PKServiceProviderListItem

- (NSCopying)identifier
{
  void *v2;
  void *v3;

  -[PKPaymentSetupServiceProviderProductWithItem item](self->_itemPair, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCopying *)v3;
}

- (PKPaymentSetupServiceProviderProductWithItem)itemPair
{
  return self->_itemPair;
}

- (void)setItemPair:(id)a3
{
  objc_storeStrong((id *)&self->_itemPair, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPair, 0);
}

@end
