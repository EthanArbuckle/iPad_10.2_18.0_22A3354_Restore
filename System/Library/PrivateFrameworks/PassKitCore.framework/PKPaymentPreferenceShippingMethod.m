@implementation PKPaymentPreferenceShippingMethod

- (BOOL)supportsDeletion
{
  return 0;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
}

@end
