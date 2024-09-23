@implementation PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumDate);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumDate);
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem;
  -[PKPeerPaymentRecurringPaymentDetailRowItem hash](&v6, sel_hash);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *v4;
  PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *v5;
  PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *v6;
  char v7;
  objc_super v9;

  v4 = (PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem;
    if (-[PKPeerPaymentRecurringPaymentDetailRowItem isEqual:](&v9, sel_isEqual_, v6)
      && PKEqualObjects()
      && PKEqualObjects())
    {
      v7 = PKEqualObjects();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (void)setMaximumDate:(id)a3
{
  objc_storeStrong((id *)&self->_maximumDate, a3);
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (void)setMinimumDate:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
