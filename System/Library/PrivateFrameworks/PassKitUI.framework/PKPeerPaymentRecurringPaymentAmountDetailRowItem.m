@implementation PKPeerPaymentRecurringPaymentAmountDetailRowItem

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentAmountDetailRowItem;
  -[PKPeerPaymentRecurringPaymentDetailRowItem hash](&v6, sel_hash);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *v4;
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *v5;
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *v6;
  char v7;
  objc_super v9;

  v4 = (PKPeerPaymentRecurringPaymentAmountDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentAmountDetailRowItem;
    if (-[PKPeerPaymentRecurringPaymentDetailRowItem isEqual:](&v9, sel_isEqual_, v6) && PKEqualObjects())
      v7 = PKEqualObjects();
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
