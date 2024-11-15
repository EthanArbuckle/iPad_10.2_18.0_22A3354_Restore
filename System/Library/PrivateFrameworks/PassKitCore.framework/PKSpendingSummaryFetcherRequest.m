@implementation PKSpendingSummaryFetcherRequest

- (id)copyWithZone:(_NSZone *)a3
{
  PKSpendingSummaryFetcherRequest *v5;
  uint64_t v6;
  NSDate *startDate;

  v5 = -[PKSpendingSummaryFetcherRequest init](+[PKSpendingSummaryFetcherRequest allocWithZone:](PKSpendingSummaryFetcherRequest, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v6;

  v5->_withLastChange = self->_withLastChange;
  v5->_type = self->_type;
  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_withLastChange - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDate *startDate;
  NSDate *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    startDate = self->_startDate;
    v7 = (NSDate *)v5[2];
    if (startDate && v7)
    {
      if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
        goto LABEL_10;
    }
    else if (startDate != v7)
    {
      goto LABEL_10;
    }
    if (self->_type == v5[3])
    {
      v8 = self->_withLastChange == *((unsigned __int8 *)v5 + 8);
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BOOL)withLastChange
{
  return self->_withLastChange;
}

- (void)setWithLastChange:(BOOL)a3
{
  self->_withLastChange = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
