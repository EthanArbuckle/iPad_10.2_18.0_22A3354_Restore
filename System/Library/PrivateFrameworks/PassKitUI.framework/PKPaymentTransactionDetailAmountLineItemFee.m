@implementation PKPaymentTransactionDetailAmountLineItemFee

- (PKPaymentTransactionDetailAmountLineItemFee)initWithFeeItem:(id)a3
{
  id v4;
  PKPaymentTransactionDetailAmountLineItemFee *v5;
  void *v6;
  uint64_t v7;
  NSString *value;
  void *v9;
  id v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  NSString *label;
  id v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionDetailAmountLineItemFee;
  v5 = -[PKPaymentTransactionDetailAmountLineItemFee init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "currencyAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formattedStringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v7;

    objc_msgSend(v4, "localizedDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = v9;
    }
    else
    {
      v11 = objc_msgSend(v4, "type");
      v12 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_CREDIT_CARD");
      switch(v11)
      {
        case 0:
          goto LABEL_7;
        case 1:
          goto LABEL_10;
        case 2:
          v12 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_FOREIGN_TRANSACTION");
          goto LABEL_10;
        case 3:
          v12 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_SERVICE_CHARGE");
          goto LABEL_10;
        case 4:
          v12 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_INSTANT_WITHDRAWAL");
          goto LABEL_10;
        default:
          if (v11 == 100)
          {
LABEL_7:
            v12 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_GENERIC");
LABEL_10:
            PKLocalizedPeerPaymentString(&v12->isa);
            v10 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = 0;
          }
          if (!objc_msgSend(v10, "length"))
          {
            PKLocalizedPeerPaymentString(CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_FEE_DESCRIPTION_GENERIC"));
            v13 = objc_claimAutoreleasedReturnValue();

            v10 = (id)v13;
          }
          break;
      }
    }
    label = v5->_label;
    v5->_label = (NSString *)v10;
    v15 = v10;

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
  return 0;
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
