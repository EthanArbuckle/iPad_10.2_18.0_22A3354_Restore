@implementation PKMerchantLookupResponse

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (int64_t)fallbackCategory
{
  return self->_fallbackCategory;
}

- (void)setFallbackCategory:(int64_t)a3
{
  self->_fallbackCategory = a3;
}

- (PKMapsMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (PKMapsBrand)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_storeStrong((id *)&self->_brand, a3);
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (void)setPlacemark:(id)a3
{
  objc_storeStrong((id *)&self->_placemark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
}

@end
