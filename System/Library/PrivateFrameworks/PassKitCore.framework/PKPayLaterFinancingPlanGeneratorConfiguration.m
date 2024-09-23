@implementation PKPayLaterFinancingPlanGeneratorConfiguration

+ (id)configurationWithProductType:(unint64_t)a3 apr:(id)a4 totalPrincipal:(id)a5 installmentCount:(int64_t)a6 daysSinceTransactionStart:(int64_t)a7 merchant:(unint64_t)a8 fundingSources:(unint64_t)a9 payments:(id)a10
{
  id v16;
  id v17;
  id v18;
  PKPayLaterFinancingPlanGeneratorConfiguration *v19;

  v16 = a10;
  v17 = a5;
  v18 = a4;
  v19 = objc_alloc_init(PKPayLaterFinancingPlanGeneratorConfiguration);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setProductType:](v19, "setProductType:", a3);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setApr:](v19, "setApr:", v18);

  -[PKPayLaterFinancingPlanGeneratorConfiguration setTotalPrincipal:](v19, "setTotalPrincipal:", v17);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setInstallmentCount:](v19, "setInstallmentCount:", a6);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setDaysSinceTransactionStart:](v19, "setDaysSinceTransactionStart:", a7);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setMerchant:](v19, "setMerchant:", a8);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setFundingSources:](v19, "setFundingSources:", a9);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setPayments:](v19, "setPayments:", v16);

  -[PKPayLaterFinancingPlanGeneratorConfiguration setAutoPayment:](v19, "setAutoPayment:", 1);
  -[PKPayLaterFinancingPlanGeneratorConfiguration setCurrency:](v19, "setCurrency:", CFSTR("USD"));
  return v19;
}

+ (id)configurationWithProductType:(unint64_t)a3 apr:(id)a4 totalPrincipal:(id)a5 installmentCount:(int64_t)a6 daysSinceTransactionStart:(int64_t)a7 payments:(id)a8
{
  return (id)objc_msgSend(a1, "configurationWithProductType:apr:totalPrincipal:installmentCount:daysSinceTransactionStart:merchant:fundingSources:payments:", a3, a4, a5, a6, a7, 1, 1, a8);
}

+ (id)configurationForBNPLWithTotalPrincipal:(id)a3 daysSinceTransactionStart:(int64_t)a4 payments:(id)a5
{
  return (id)objc_msgSend(a1, "configurationWithProductType:apr:totalPrincipal:installmentCount:daysSinceTransactionStart:merchant:fundingSources:payments:", 1, 0, a3, 4, a4, 1, 1, a5);
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (BOOL)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (int64_t)daysSinceTransactionStart
{
  return self->_daysSinceTransactionStart;
}

- (void)setDaysSinceTransactionStart:(int64_t)a3
{
  self->_daysSinceTransactionStart = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)totalPrincipal
{
  return self->_totalPrincipal;
}

- (void)setTotalPrincipal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(unint64_t)a3
{
  self->_merchant = a3;
}

- (unint64_t)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(unint64_t)a3
{
  self->_fundingSources = a3;
}

- (unint64_t)scheduleSummaryReason
{
  return self->_scheduleSummaryReason;
}

- (void)setScheduleSummaryReason:(unint64_t)a3
{
  self->_scheduleSummaryReason = a3;
}

- (BOOL)ignoreFuturePayments
{
  return self->_ignoreFuturePayments;
}

- (void)setIgnoreFuturePayments:(BOOL)a3
{
  self->_ignoreFuturePayments = a3;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_totalPrincipal, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_apr, 0);
}

@end
