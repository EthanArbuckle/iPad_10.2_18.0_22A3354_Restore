@implementation PKPaymentTransactionDetailAmountLineItemGeneric

- (PKPaymentTransactionDetailAmountLineItemGeneric)initWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  PKPaymentTransactionDetailAmountLineItemGeneric *v8;
  uint64_t v9;
  NSString *label;
  uint64_t v11;
  NSString *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionDetailAmountLineItemGeneric;
  v8 = -[PKPaymentTransactionDetailAmountLineItemGeneric init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v11;

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

- (unint64_t)lineItemType
{
  return 9;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (void)setIsEmphasized:(BOOL)a3
{
  self->_isEmphasized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
