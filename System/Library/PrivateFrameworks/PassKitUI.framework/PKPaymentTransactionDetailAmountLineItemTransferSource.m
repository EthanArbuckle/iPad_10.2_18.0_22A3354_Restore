@implementation PKPaymentTransactionDetailAmountLineItemTransferSource

- (PKPaymentTransactionDetailAmountLineItemTransferSource)initWithAmount:(id)a3 transactionSourceCollection:(id)a4
{
  id v6;
  id v7;
  PKPaymentTransactionDetailAmountLineItemTransferSource *v8;
  uint64_t v9;
  NSString *value;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *label;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentTransactionDetailAmountLineItemTransferSource;
  v8 = -[PKPaymentTransactionDetailAmountLineItemTransferSource init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "formattedStringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    value = v8->_value;
    v8->_value = (NSString *)v9;

    objc_msgSend(v7, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_TRANSFERRED_TO"), CFSTR("%@"), v13);
      v14 = objc_claimAutoreleasedReturnValue();
      label = v8->_label;
      v8->_label = (NSString *)v14;

    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_TRANSFERRED_TO_CARD"));
      v16 = objc_claimAutoreleasedReturnValue();
      v13 = v8->_label;
      v8->_label = (NSString *)v16;
    }

  }
  return v8;
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
  return 6;
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
