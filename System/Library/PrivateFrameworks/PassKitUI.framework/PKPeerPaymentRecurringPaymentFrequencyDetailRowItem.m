@implementation PKPeerPaymentRecurringPaymentFrequencyDetailRowItem

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentFrequencyDetailRowItem;
  -[PKPeerPaymentRecurringPaymentDetailRowItem hash](&v6, sel_hash);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *v4;
  PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *v5;
  PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *v6;
  BOOL v7;
  objc_super v9;

  v4 = (PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentFrequencyDetailRowItem;
    v7 = -[PKPeerPaymentRecurringPaymentDetailRowItem isEqual:](&v9, sel_isEqual_, v6)
      && PKEqualObjects()
      && self->_frequency == v6->_frequency;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
