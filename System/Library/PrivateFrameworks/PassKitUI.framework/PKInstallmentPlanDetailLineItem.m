@implementation PKInstallmentPlanDetailLineItem

- (PKInstallmentPlanDetailLineItem)initWithLineItem:(id)a3 currencyCode:(id)a4
{
  id v6;
  NSString *v7;
  PKInstallmentPlanDetailLineItem *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSDecimalNumber *v13;
  void *v14;
  __CFString *v15;
  NSString *v16;
  __CFString *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  NSString *label;
  NSString *v23;
  NSString *value;
  objc_super v26;

  v6 = a3;
  v7 = (NSString *)a4;
  v26.receiver = self;
  v26.super_class = (Class)PKInstallmentPlanDetailLineItem;
  v8 = -[PKInstallmentPlanDetailLineItem init](&v26, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "type");
    v10 = objc_msgSend(v6, "state");
    objc_msgSend(v6, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    if (v7 && v11)
    {
      objc_msgSend(v6, "amount");
      v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v13, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    switch(v9)
    {
      case 0:
      case 4:
        objc_msgSend(v6, "itemDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_17;
        v15 = CFSTR("OTHER_LINE_ITEM");
        goto LABEL_19;
      case 1:
        objc_msgSend(v6, "itemDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_17;
        v15 = CFSTR("PRODUCT_LINE_ITEM");
        goto LABEL_19;
      case 2:
        v17 = CFSTR("TAX_LINE_ITEM");
        goto LABEL_13;
      case 3:
        v17 = CFSTR("SHIPPING_LINE_ITEM");
LABEL_13:
        PKLocalizedBeekmanString(&v17->isa);
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      case 5:
        PKLocalizedBeekmanString(CFSTR("INSTALLMENT_TRADE_IN_VALUE"));
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v10 == 3)
          goto LABEL_22;
        objc_msgSend(v12, "negativeValue");
        v18 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v18;
        goto LABEL_23;
      case 6:
        objc_msgSend(v6, "itemDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
LABEL_17:
          v19 = v14;
        }
        else
        {
          v15 = CFSTR("ACCESSORY_LINE_ITEM");
LABEL_19:
          PKLocalizedBeekmanString(&v15->isa);
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        v16 = v19;

LABEL_21:
        if (v10 == 3)
        {
LABEL_22:
          PKLocalizedBeekmanString(CFSTR("INSTALLMENT_LINE_ITEM_CANCELED"));
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_23:
          objc_msgSend(v12, "formattedStringValue");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        v21 = (NSString *)v20;
        label = v8->_label;
        v8->_label = v16;
        v23 = v16;

        value = v8->_value;
        v8->_value = v21;

        break;
      default:
        v16 = 0;
        goto LABEL_21;
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
  return 8;
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
