@implementation PKAccountWebServicePayLaterReportIssueContentRequest

- (PKAccountWebServicePayLaterReportIssueContentRequest)initWithTopic:(id)a3
{
  id v4;
  PKAccountWebServicePayLaterReportIssueContentRequest *v5;
  uint64_t v6;
  NSString *contextString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountWebServicePayLaterReportIssueContentRequest;
  v5 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "payLaterContentRequestTypeString");
    v6 = objc_claimAutoreleasedReturnValue();
    contextString = v5->_contextString;
    v5->_contextString = (NSString *)v6;

  }
  return v5;
}

- (id)contextString
{
  return self->_contextString;
}

- (id)bodyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKAccountWebServicePayLaterReportIssueContentRequest;
  -[PKAccountWebServicePayLaterContentRequest bodyDictionary](&v20, sel_bodyDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelySetObject:forKey:", v5, CFSTR("financingPlanIdentifier"));

  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelySetObject:forKey:", v6, CFSTR("paymentIdentifier"));

  -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelySetObject:forKey:", v7, CFSTR("installmentIdentifier"));

  -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelySetObject:forKey:", v9, CFSTR("merchantName"));

  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "totalAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[PKAccountWebServiceRequest currencyAmountFormattedDictionary:](PKAccountWebServiceRequest, "currencyAmountFormattedDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelySetObject:forKey:", v12, CFSTR("financingPlanTotalAmount"));

  }
  -[PKPayLaterPayment amount](self->_payment, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[PKAccountWebServiceRequest currencyAmountFormattedDictionary:](PKAccountWebServiceRequest, "currencyAmountFormattedDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelySetObject:forKey:", v14, CFSTR("paymentAmount"));

  }
  -[PKPayLaterPayment postedDate](self->_payment, "postedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    PKISO8601DateStringFromDate(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelySetObject:forKey:", v17, CFSTR("paymentPostedDate"));

  }
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
  objc_storeStrong((id *)&self->_payment, a3);
}

- (PKPayLaterInstallment)installment
{
  return self->_installment;
}

- (void)setInstallment:(id)a3
{
  objc_storeStrong((id *)&self->_installment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
}

@end
