@implementation PKDashboardSpendingSummaryAccountUserItem

+ (id)identifier
{
  return CFSTR("spendingSummaryAccountUser");
}

- (PKSpendingSummary)spendingSummary
{
  return self->_spendingSummary;
}

- (void)setSpendingSummary:(id)a3
{
  objc_storeStrong((id *)&self->_spendingSummary, a3);
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
  objc_storeStrong((id *)&self->_accountUser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_spendingSummary, 0);
}

@end
