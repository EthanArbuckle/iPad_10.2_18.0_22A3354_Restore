@implementation PKPaymentTransactionDetailAmountLineCompletionDate

- (PKPaymentTransactionDetailAmountLineCompletionDate)initWithDate:(id)a3 completed:(BOOL)a4
{
  id v7;
  PKPaymentTransactionDetailAmountLineCompletionDate *v8;
  PKPaymentTransactionDetailAmountLineCompletionDate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTransactionDetailAmountLineCompletionDate;
  v8 = -[PKPaymentTransactionDetailAmountLineCompletionDate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_completed = a4;
    objc_storeStrong((id *)&v8->_date, a3);
  }

  return v9;
}

- (NSString)label
{
  PKLocalizedFeatureString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)value
{
  return (NSString *)PKMediumDateString();
}

- (id)image
{
  return 0;
}

- (id)secondaryLabel
{
  return 0;
}

- (id)tertiaryLabel
{
  return 0;
}

- (BOOL)isEmphasized
{
  return 1;
}

- (unint64_t)lineItemType
{
  return 11;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSDate)date
{
  return self->_date;
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
  objc_storeStrong((id *)&self->_date, 0);
}

@end
