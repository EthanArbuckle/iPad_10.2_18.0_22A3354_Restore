@implementation PKDashboardFinancingPlanItem

- (PKDashboardFinancingPlanItem)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5 pageTag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKDashboardFinancingPlanItem *v15;
  PKDashboardFinancingPlanItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKDashboardFinancingPlanItem;
  v15 = -[PKDashboardFinancingPlanItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_financingPlan, a3);
    objc_storeStrong((id *)&v16->_payLaterAccount, a4);
    objc_storeStrong((id *)&v16->_paymentIntentController, a5);
    objc_storeStrong((id *)&v16->_pageTag, a6);
  }

  return v16;
}

+ (id)identifier
{
  return CFSTR("financingPlanItemIdentifier");
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (NSString)pageTag
{
  return self->_pageTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTag, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
