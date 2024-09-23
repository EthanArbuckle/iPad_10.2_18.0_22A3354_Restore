@implementation PKPaymentTransactionDetailAmountLineItemPaymentTotal

- (PKPaymentTransactionDetailAmountLineItemPaymentTotal)initWithAmount:(id)a3
{
  id v4;
  void *v5;
  NSDecimalNumber *v6;
  NSString *v7;
  void *v8;
  PKPaymentTransactionDetailAmountLineItemPaymentTotal *v9;
  uint64_t v10;
  NSString *label;
  void *v12;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_absoluteValue");
  v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currency");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  PKCurrencyAmountCreate(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)PKPaymentTransactionDetailAmountLineItemPaymentTotal;
  v9 = -[PKPaymentTransactionDetailAmountLineItemPaymentTotal init](&v16, sel_init);
  if (v9)
  {
    PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_UNQUALIFIED_TOTAL"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v9->_label;
    v9->_label = (NSString *)v10;

    objc_msgSend(v8, "formattedStringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    value = v9->_value;
    v9->_value = (NSString *)v13;

  }
  return v9;
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
  return 1;
}

- (unint64_t)lineItemType
{
  return 3;
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
