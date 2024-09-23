@implementation PKDashboardCreditAccountItem

- (PKDashboardCreditAccountItem)initWithAccount:(id)a3 accountUserCollection:(id)a4 physicalCards:(id)a5 transactionSourceCollection:(id)a6 familyCollection:(id)a7 avatarManager:(id)a8 type:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  PKDashboardCreditAccountItem *v20;
  PKDashboardCreditAccountItem *v21;
  uint64_t v22;
  NSSet *physicalCards;
  id v25;
  id v26;
  objc_super v27;

  v16 = a3;
  v26 = a4;
  v17 = a5;
  v25 = a6;
  v18 = a7;
  v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PKDashboardCreditAccountItem;
  v20 = -[PKDashboardCreditAccountItem init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_account, a3);
    objc_storeStrong((id *)&v21->_accountUserCollection, a4);
    v22 = objc_msgSend(v17, "copy");
    physicalCards = v21->_physicalCards;
    v21->_physicalCards = (NSSet *)v22;

    objc_storeStrong((id *)&v21->_transactionSourceCollection, a6);
    objc_storeStrong((id *)&v21->_familyCollection, a7);
    objc_storeStrong((id *)&v21->_avatarManager, a8);
    v21->_type = a9;
  }

  return v21;
}

+ (id)identifier
{
  return CFSTR("creditAccount");
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (PKContactAvatarManager)avatarManager
{
  return self->_avatarManager;
}

- (void)setAvatarManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarManager, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)weeks
{
  return self->_weeks;
}

- (void)setWeeks:(id)a3
{
  objc_storeStrong((id *)&self->_weeks, a3);
}

- (NSArray)months
{
  return self->_months;
}

- (void)setMonths:(id)a3
{
  objc_storeStrong((id *)&self->_months, a3);
}

- (NSArray)years
{
  return self->_years;
}

- (void)setYears:(id)a3
{
  objc_storeStrong((id *)&self->_years, a3);
}

- (PKSpendingSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (PKSpendingSummaryFetcher)summaryFetcher
{
  return self->_summaryFetcher;
}

- (void)setSummaryFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_summaryFetcher, a3);
}

- (NSArray)mostRecentTransactions
{
  return self->_mostRecentTransactions;
}

- (void)setMostRecentTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentTransactions, a3);
}

- (NSArray)pendingPayments
{
  return self->_pendingPayments;
}

- (void)setPendingPayments:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPayments, a3);
}

- (NSArray)upcomingScheduledPayments
{
  return self->_upcomingScheduledPayments;
}

- (void)setUpcomingScheduledPayments:(id)a3
{
  objc_storeStrong((id *)&self->_upcomingScheduledPayments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upcomingScheduledPayments, 0);
  objc_storeStrong((id *)&self->_pendingPayments, 0);
  objc_storeStrong((id *)&self->_mostRecentTransactions, 0);
  objc_storeStrong((id *)&self->_summaryFetcher, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_weeks, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
