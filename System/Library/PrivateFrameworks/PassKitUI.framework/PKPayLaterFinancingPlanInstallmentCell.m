@implementation PKPayLaterFinancingPlanInstallmentCell

- (void)setFinancingPlan:(id)a3 installment:(id)a4 rowIndex:(int64_t)a5 paymentIntentController:(id)a6 presentingViewController:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKPayLaterFinancingPlanInstallmentCellView *v16;
  id v17;

  v17 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!PKEqualObjects() || (PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_financingPlan, a3);
    objc_storeStrong((id *)&self->_installment, a4);
    v16 = -[PKPayLaterFinancingPlanInstallmentCellView initWithFinancingPlan:installment:rowIndex:paymentIntentController:presentingViewController:]([PKPayLaterFinancingPlanInstallmentCellView alloc], "initWithFinancingPlan:installment:rowIndex:paymentIntentController:presentingViewController:", self->_financingPlan, self->_installment, a5, v14, v15);
    -[PKPayLaterIconCell setView:](self, "setView:", v16);

  }
}

- (void)prepareForReuse
{
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterInstallment *installment;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterFinancingPlanInstallmentCell;
  -[PKPayLaterIconCell prepareForReuse](&v5, sel_prepareForReuse);
  financingPlan = self->_financingPlan;
  self->_financingPlan = 0;

  installment = self->_installment;
  self->_installment = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
