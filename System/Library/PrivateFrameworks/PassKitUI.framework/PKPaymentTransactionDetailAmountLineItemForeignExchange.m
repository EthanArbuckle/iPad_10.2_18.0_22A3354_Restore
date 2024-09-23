@implementation PKPaymentTransactionDetailAmountLineItemForeignExchange

- (PKPaymentTransactionDetailAmountLineItemForeignExchange)initWithForeignExchangeInformation:(id)a3 type:(unint64_t)a4
{
  id v6;
  PKPaymentTransactionDetailAmountLineItemForeignExchange *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  NSString *label;
  NSString *v13;
  NSString *value;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentTransactionDetailAmountLineItemForeignExchange;
  v7 = -[PKPaymentTransactionDetailAmountLineItemForeignExchange init](&v16, sel_init);
  if (v7)
  {
    if (a4 == 1)
    {
      PKLocalizedFeatureString();
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "exchangeRate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKFormattedStringSignificantDigitsFromNumber();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v8 = 0;
        v11 = 0;
        goto LABEL_8;
      }
      PKLocalizedFeatureString();
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "destinationCurrencyAmount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "formattedStringValue");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (NSString *)v10;

LABEL_8:
    label = v7->_label;
    v7->_label = v8;
    v13 = v8;

    value = v7->_value;
    v7->_value = v11;

  }
  return v7;
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
  return 5;
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
