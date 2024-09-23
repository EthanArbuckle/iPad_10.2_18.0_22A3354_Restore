@implementation PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem

- (PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem)initWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5
{
  id v9;
  PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem *v10;
  PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem;
  v10 = -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem initWithFinancingPlan:installment:](&v13, sel_initWithFinancingPlan_installment_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_payment, a5);

  return v11;
}

- (void)populateRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingPlanPaymentScheduleComposerDeclinedInstallmentItem;
  -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem populateRow:](&v11, sel_populateRow_, v4);
  if (-[PKPayLaterPayment type](self->_payment, "type") == 5)
  {
    -[PKPayLaterPayment fundingSources](self->_payment, "fundingSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_DECLINED"), CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_attributedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSecondaryText:", v10);

    objc_msgSend(v4, "setSecondaryTextColor:", v9);
    objc_msgSend(v4, "setShowChevron:", 1);

  }
}

- (unint64_t)type
{
  return 3;
}

- (id)paymentIdentifier
{
  return (id)-[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<installmentDeclinedItem; "));
  -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem installment](self, "installment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installmentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentIdentifier: '%@'; "), v5);

  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentIdentifier: '%@'; "), v6);

  -[PKPayLaterFinancingPlanPaymentScheduleComposerInstallmentItem installment](self, "installment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dueDate: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (PKPayLaterPayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
}

@end
