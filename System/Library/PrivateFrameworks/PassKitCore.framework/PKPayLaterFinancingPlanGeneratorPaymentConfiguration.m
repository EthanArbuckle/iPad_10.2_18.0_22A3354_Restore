@implementation PKPayLaterFinancingPlanGeneratorPaymentConfiguration

+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 amount:(id)a4 relativeToInstallmentNumber:(int64_t)a5 daysPriorToRelativeInstallmentNumber:(int64_t)a6 fundingSources:(unint64_t)a7
{
  id v11;
  PKPayLaterFinancingPlanGeneratorPaymentConfiguration *v12;
  PKPayLaterFinancingPlanGeneratorPaymentConfiguration *v13;
  unint64_t v14;

  v11 = a4;
  v12 = objc_alloc_init(PKPayLaterFinancingPlanGeneratorPaymentConfiguration);
  v13 = v12;
  if (a3 <= 1)
    v14 = 1;
  else
    v14 = a3;
  -[PKPayLaterFinancingPlanGeneratorPaymentConfiguration setPaymentType:](v12, "setPaymentType:", v14);
  -[PKPayLaterFinancingPlanGeneratorPaymentConfiguration setAmount:](v13, "setAmount:", v11);

  -[PKPayLaterFinancingPlanGeneratorPaymentConfiguration setRelativeToInstallmentNumber:](v13, "setRelativeToInstallmentNumber:", a5);
  -[PKPayLaterFinancingPlanGeneratorPaymentConfiguration setDaysPriorToRelativeInstallmentNumber:](v13, "setDaysPriorToRelativeInstallmentNumber:", a6);
  -[PKPayLaterFinancingPlanGeneratorPaymentConfiguration setFundingSources:](v13, "setFundingSources:", a7);
  return v13;
}

+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 amount:(id)a4 relativeToInstallmentNumber:(int64_t)a5 daysPriorToRelativeInstallmentNumber:(int64_t)a6
{
  return (id)objc_msgSend(a1, "paymentConfigurationWithPaymentType:amount:relativeToInstallmentNumber:daysPriorToRelativeInstallmentNumber:fundingSources:", a3, a4, a5, a6, 1);
}

+ (id)paymentConfigurationWithAmount:(id)a3 relativeToInstallmentNumber:(int64_t)a4 daysPriorToRelativeInstallmentNumber:(int64_t)a5
{
  return (id)objc_msgSend(a1, "paymentConfigurationWithPaymentType:amount:relativeToInstallmentNumber:daysPriorToRelativeInstallmentNumber:fundingSources:", 1, a3, a4, a5, 1);
}

+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3
{
  return (id)objc_msgSend(a1, "paymentConfigurationWithAmount:relativeToInstallmentNumber:daysPriorToRelativeInstallmentNumber:", 0, a3, 0);
}

+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4
{
  return (id)objc_msgSend(a1, "paymentConfigurationWithAmount:relativeToInstallmentNumber:daysPriorToRelativeInstallmentNumber:", 0, a3, a4);
}

+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4 installmentAmountMultiple:(int64_t)a5
{
  void *v6;

  +[PKPayLaterFinancingPlanGeneratorPaymentConfiguration paymentConfigurationForDefaultInstallmentNumber:daysPriorToRelativeInstallmentNumber:](PKPayLaterFinancingPlanGeneratorPaymentConfiguration, "paymentConfigurationForDefaultInstallmentNumber:daysPriorToRelativeInstallmentNumber:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInstallmentAmountMultiple:", a5);
  return v6;
}

+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 relativeToInstallmentNumber:(int64_t)a4 daysPriorToRelativeInstallmentNumber:(int64_t)a5 installmentAmountMultiple:(int64_t)a6
{
  void *v7;

  objc_msgSend(a1, "paymentConfigurationForDefaultInstallmentNumber:daysPriorToRelativeInstallmentNumber:installmentAmountMultiple:", a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaymentType:", a3);
  return v7;
}

+ (id)paymentConfigurationForRemainingFinancingPlanBalancRelativeToInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4
{
  void *v4;

  +[PKPayLaterFinancingPlanGeneratorPaymentConfiguration paymentConfigurationForDefaultInstallmentNumber:daysPriorToRelativeInstallmentNumber:](PKPayLaterFinancingPlanGeneratorPaymentConfiguration, "paymentConfigurationForDefaultInstallmentNumber:daysPriorToRelativeInstallmentNumber:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayOffRestOfLoanBalance:", 1);
  return v4;
}

+ (id)paymentConfigurationForDeclinedPaymentForInstallmentNumber:(int64_t)a3
{
  void *v3;

  objc_msgSend(a1, "paymentConfigurationForDefaultInstallmentNumber:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaymentType:", 5);
  return v3;
}

+ (id)paymentConfigurationForDeclinedPaymentForInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4
{
  void *v4;

  objc_msgSend(a1, "paymentConfigurationForDefaultInstallmentNumber:daysPriorToRelativeInstallmentNumber:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaymentType:", 5);
  return v4;
}

- (unint64_t)paymentType
{
  return self->_paymentType;
}

- (void)setPaymentType:(unint64_t)a3
{
  self->_paymentType = a3;
}

- (unint64_t)paymentSubtype
{
  return self->_paymentSubtype;
}

- (void)setPaymentSubtype:(unint64_t)a3
{
  self->_paymentSubtype = a3;
}

- (BOOL)forDispute
{
  return self->_forDispute;
}

- (void)setForDispute:(BOOL)a3
{
  self->_forDispute = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)relativeToInstallmentNumber
{
  return self->_relativeToInstallmentNumber;
}

- (void)setRelativeToInstallmentNumber:(int64_t)a3
{
  self->_relativeToInstallmentNumber = a3;
}

- (int64_t)daysPriorToRelativeInstallmentNumber
{
  return self->_daysPriorToRelativeInstallmentNumber;
}

- (void)setDaysPriorToRelativeInstallmentNumber:(int64_t)a3
{
  self->_daysPriorToRelativeInstallmentNumber = a3;
}

- (unint64_t)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(unint64_t)a3
{
  self->_fundingSources = a3;
}

- (BOOL)payOffRestOfLoanBalance
{
  return self->_payOffRestOfLoanBalance;
}

- (void)setPayOffRestOfLoanBalance:(BOOL)a3
{
  self->_payOffRestOfLoanBalance = a3;
}

- (int64_t)installmentAmountMultiple
{
  return self->_installmentAmountMultiple;
}

- (void)setInstallmentAmountMultiple:(int64_t)a3
{
  self->_installmentAmountMultiple = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
