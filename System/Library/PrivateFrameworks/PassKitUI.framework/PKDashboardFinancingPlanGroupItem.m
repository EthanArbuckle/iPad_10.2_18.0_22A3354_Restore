@implementation PKDashboardFinancingPlanGroupItem

- (PKDashboardFinancingPlanGroupItem)initWithFinancingPlansCount:(int64_t)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5 pageTag:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKDashboardFinancingPlanGroupItem *v14;
  PKDashboardFinancingPlanGroupItem *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKDashboardFinancingPlanGroupItem;
  v14 = -[PKDashboardFinancingPlanGroupItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_financingPlansCount = a3;
    objc_storeStrong((id *)&v14->_payLaterAccount, a4);
    objc_storeStrong((id *)&v15->_paymentIntentController, a5);
    objc_storeStrong((id *)&v15->_pageTag, a6);
  }

  return v15;
}

+ (id)identifier
{
  return CFSTR("financingPlanGroupItemIdentifier");
}

- (int64_t)financingPlansCount
{
  return self->_financingPlansCount;
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
}

@end
