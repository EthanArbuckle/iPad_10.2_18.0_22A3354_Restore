@implementation PKPayLaterProductAssessmentInstallmentSummary

- (NSArray)installmentAmounts
{
  return self->_installmentAmounts;
}

- (void)setInstallmentAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)installmentDates
{
  return self->_installmentDates;
}

- (void)setInstallmentDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentDates, 0);
  objc_storeStrong((id *)&self->_installmentAmounts, 0);
}

@end
