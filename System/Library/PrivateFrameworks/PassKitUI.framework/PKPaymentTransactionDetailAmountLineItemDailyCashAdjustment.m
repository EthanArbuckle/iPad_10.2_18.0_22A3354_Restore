@implementation PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment

- (PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment)initWithAssociatedTransaction:(id)a3
{
  id v4;
  PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment *v5;
  uint64_t v6;
  NSString *label;
  void *v8;
  uint64_t v9;
  NSString *value;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment;
  v5 = -[PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "featureIdentifier");
    PKLocalizedFeatureString();
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "currencyAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedStringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v9;

  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEmphasized
{
  return 0;
}

- (unint64_t)lineItemType
{
  return 7;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
