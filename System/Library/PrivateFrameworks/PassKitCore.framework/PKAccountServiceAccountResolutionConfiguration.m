@implementation PKAccountServiceAccountResolutionConfiguration

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("earlyInstallmentPlan: '%@'; "), self->_earlyInstallmentPlan);
  objc_msgSend(v3, "appendFormat:", CFSTR("businessChatContext: '%@'; "), self->_businessChatContext);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKCreditInstallmentPlan)earlyInstallmentPlan
{
  return self->_earlyInstallmentPlan;
}

- (void)setEarlyInstallmentPlan:(id)a3
{
  objc_storeStrong((id *)&self->_earlyInstallmentPlan, a3);
}

- (PKBusinessChatContext)businessChatContext
{
  return self->_businessChatContext;
}

- (void)setBusinessChatContext:(id)a3
{
  objc_storeStrong((id *)&self->_businessChatContext, a3);
}

- (int64_t)billPayAmountType
{
  return self->_billPayAmountType;
}

- (void)setBillPayAmountType:(int64_t)a3
{
  self->_billPayAmountType = a3;
}

- (NSDecimalNumber)billPayAmount
{
  return self->_billPayAmount;
}

- (void)setBillPayAmount:(id)a3
{
  objc_storeStrong((id *)&self->_billPayAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_billPayAmount, 0);
  objc_storeStrong((id *)&self->_businessChatContext, 0);
  objc_storeStrong((id *)&self->_earlyInstallmentPlan, 0);
}

@end
