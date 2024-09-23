@implementation PKServiceProviderProductListItem

- (NSCopying)identifier
{
  return (NSCopying *)-[PKDigitalIssuanceServiceProviderProduct identifier](self->_product, "identifier");
}

- (PKDigitalIssuanceServiceProviderProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
