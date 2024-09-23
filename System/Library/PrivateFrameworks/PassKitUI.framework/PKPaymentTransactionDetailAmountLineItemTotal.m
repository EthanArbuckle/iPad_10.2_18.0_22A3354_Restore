@implementation PKPaymentTransactionDetailAmountLineItemTotal

- (PKPaymentTransactionDetailAmountLineItemTotal)initWithAmount:(id)a3 totalType:(unint64_t)a4
{
  id v6;
  PKPaymentTransactionDetailAmountLineItemTotal *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *value;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  NSString *label;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentTransactionDetailAmountLineItemTotal;
  v7 = -[PKPaymentTransactionDetailAmountLineItemTotal init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pk_isNegativeNumber");

    if (v9)
    {
      objc_msgSend(v6, "negativeValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "formattedStringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      value = v7->_value;
      v7->_value = (NSString *)v12;

      v6 = v10;
    }
    else
    {
      objc_msgSend(v6, "formattedStringValue");
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = v7->_value;
      v7->_value = (NSString *)v14;
    }

    switch(a4)
    {
      case 0uLL:
        v15 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_PAID");
        goto LABEL_15;
      case 1uLL:
        v15 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_SENT");
        goto LABEL_15;
      case 2uLL:
        v15 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_RECEIVED");
        goto LABEL_15;
      case 3uLL:
        v15 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_NOT_ACCEPTED");
        goto LABEL_15;
      case 4uLL:
        v15 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_UNQUALIFIED_TOTAL");
        goto LABEL_15;
      case 5uLL:
        PKLocalizedPaymentString(CFSTR("SUBTOTAL"));
        v16 = objc_claimAutoreleasedReturnValue();
        break;
      case 6uLL:
        PKLocalizedBeekmanString(CFSTR("TOTAL_FINANCED"));
        v16 = objc_claimAutoreleasedReturnValue();
        break;
      case 7uLL:
        v15 = CFSTR("TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_REQUEST");
LABEL_15:
        PKLocalizedPeerPaymentString(&v15->isa);
        v16 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v16 = 0;
        break;
    }
    label = v7->_label;
    v7->_label = (NSString *)v16;

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
  return 1;
}

- (unint64_t)lineItemType
{
  return 2;
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
