@implementation PKDashboardSpendingSummaryItem

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = PKEqualObjects();
  else
    v4 = 0;

  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_spendingSummary);
  v4 = PKCombinedHash();

  return v4;
}

+ (id)identifier
{
  return CFSTR("spendingSummary");
}

- (PKSpendingSummary)spendingSummary
{
  return self->_spendingSummary;
}

- (void)setSpendingSummary:(id)a3
{
  objc_storeStrong((id *)&self->_spendingSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spendingSummary, 0);
}

@end
