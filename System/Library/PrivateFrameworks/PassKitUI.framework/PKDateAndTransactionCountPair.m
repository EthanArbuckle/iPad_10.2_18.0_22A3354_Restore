@implementation PKDateAndTransactionCountPair

- (BOOL)isEqual:(id)a3
{
  PKDateAndTransactionCountPair *v4;
  PKDateAndTransactionCountPair *v5;
  PKDateAndTransactionCountPair *v6;
  BOOL v7;

  v4 = (PKDateAndTransactionCountPair *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
      v7 = self->_transactionCount == v6->_transactionCount;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_date)
  {
    v4[0] = self->_date;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKCombinedHash();

  }
  else
  {
    PKCombinedHash();
  }
  return PKIntegerHash();
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
