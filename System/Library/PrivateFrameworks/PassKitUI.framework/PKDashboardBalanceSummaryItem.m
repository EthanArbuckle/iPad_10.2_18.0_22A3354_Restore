@implementation PKDashboardBalanceSummaryItem

+ (id)identifier
{
  return CFSTR("balanceSummary");
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserCollection, a3);
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, a3);
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCards, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKPaymentTransactionGroup)transactionGroup
{
  return self->_transactionGroup;
}

- (void)setTransactionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transactionGroup, a3);
}

- (PKCreditAccountMergeSummaryAccountDetails)mergeSummaryAccountDetails
{
  return self->_mergeSummaryAccountDetails;
}

- (void)setMergeSummaryAccountDetails:(id)a3
{
  objc_storeStrong((id *)&self->_mergeSummaryAccountDetails, a3);
}

- (NSDate)mergeDate
{
  return self->_mergeDate;
}

- (void)setMergeDate:(id)a3
{
  objc_storeStrong((id *)&self->_mergeDate, a3);
}

- (PKCreditAccountStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(id)a3
{
  objc_storeStrong((id *)&self->_statement, a3);
}

- (PKCreditAccountSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSArray)statements
{
  return self->_statements;
}

- (void)setStatements:(id)a3
{
  objc_storeStrong((id *)&self->_statements, a3);
}

- (PKCurrencyAmount)rewardsCurrencyAmount
{
  return self->_rewardsCurrencyAmount;
}

- (void)setRewardsCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsCurrencyAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsCurrencyAmount, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_mergeDate, 0);
  objc_storeStrong((id *)&self->_mergeSummaryAccountDetails, 0);
  objc_storeStrong((id *)&self->_transactionGroup, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
