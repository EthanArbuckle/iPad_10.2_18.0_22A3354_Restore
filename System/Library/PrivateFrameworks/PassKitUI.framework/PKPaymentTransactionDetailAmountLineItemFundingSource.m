@implementation PKPaymentTransactionDetailAmountLineItemFundingSource

- (PKPaymentTransactionDetailAmountLineItemFundingSource)initWithAmount:(id)a3 transactionSourceCollection:(id)a4
{
  id v6;
  id v7;
  PKPaymentTransactionDetailAmountLineItemFundingSource *v8;
  uint64_t v9;
  NSString *value;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *label;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentTransactionDetailAmountLineItemFundingSource;
  v8 = -[PKPaymentTransactionDetailAmountLineItemFundingSource init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "formattedStringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    value = v8->_value;
    v8->_value = (NSString *)v9;

    objc_msgSend(v7, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_CARD_DESCRIPTION_FORMAT_STRING"), CFSTR("%@"), v12);
    else
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_CASH"));
    v13 = objc_claimAutoreleasedReturnValue();
    label = v8->_label;
    v8->_label = (NSString *)v13;

  }
  return v8;
}

- (PKPaymentTransactionDetailAmountLineItemFundingSource)initWithAmount:(id)a3 credentialType:(int64_t)a4 dpanSuffix:(id)a5 cardDescription:(id)a6
{
  id v9;
  id v10;
  id v11;
  PKPaymentTransactionDetailAmountLineItemFundingSource *v12;
  uint64_t v13;
  NSString *value;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  NSString *label;
  id v21;
  objc_super v22;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentTransactionDetailAmountLineItemFundingSource;
  v12 = -[PKPaymentTransactionDetailAmountLineItemFundingSource init](&v22, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "formattedStringValue");
    v13 = objc_claimAutoreleasedReturnValue();
    value = v12->_value;
    v12->_value = (NSString *)v13;

    if (objc_msgSend(v11, "length"))
    {
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_CARD_DESCRIPTION_FORMAT_STRING"), CFSTR("%@"), v11);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      label = v12->_label;
      v12->_label = (NSString *)v15;

      goto LABEL_15;
    }
    PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length") && objc_msgSend(v10, "length"))
    {
      PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_CARD_NETWORK_AND_DPAN_SUFFIX_FORMAT_STRING"), CFSTR("%@%@"), v16, v10);
    }
    else
    {
      if (objc_msgSend(v16, "length"))
      {
        v21 = v16;
        v17 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_CARD_NETWORK_FORMAT_STRING");
      }
      else
      {
        if (!objc_msgSend(v10, "length"))
        {
          PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_GENERIC"));
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        v21 = v10;
        v17 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FUNDING_SOURCE_DPAN_SUFFIX_FORMAT_STRING");
      }
      PKLocalizedPeerPaymentString(&v17->isa, CFSTR("%@"), v21);
    }
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = v18;

    goto LABEL_14;
  }
LABEL_15:

  return v12;
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
  return 1;
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
