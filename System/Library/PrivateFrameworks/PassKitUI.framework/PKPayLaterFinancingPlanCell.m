@implementation PKPayLaterFinancingPlanCell

- (void)setFinancingPlan:(id)a3 context:(unint64_t)a4 rowIndex:(int64_t)a5
{
  PKPayLaterFinancingPlan **p_financingPlan;
  PKPayLaterFinancingPlanCellView *v10;
  PKPayLaterFinancingPlanCellView *view;
  id v12;

  p_financingPlan = &self->_financingPlan;
  v12 = a3;
  if (!PKEqualObjects() || self->_context != a4)
  {
    objc_storeStrong((id *)&self->_financingPlan, a3);
    self->_context = a4;
    v10 = -[PKPayLaterFinancingPlanCellView initWithFinancingPlan:context:rowIndex:]([PKPayLaterFinancingPlanCellView alloc], "initWithFinancingPlan:context:rowIndex:", *p_financingPlan, a4, a5);
    view = self->_view;
    self->_view = v10;

    -[PKPayLaterIconCell setView:](self, "setView:", self->_view);
  }

}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[PKPayLaterFinancingPlanCellView setShowSpinner:](self->_view, "setShowSpinner:");
    -[PKPayLaterFinancingPlanCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)minimumHeight
{
  return 76.0;
}

- (void)prepareForReuse
{
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlanCellView *view;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterFinancingPlanCell;
  -[PKPayLaterIconCell prepareForReuse](&v5, sel_prepareForReuse);
  financingPlan = self->_financingPlan;
  self->_financingPlan = 0;

  self->_showSpinner = 0;
  -[PKPayLaterFinancingPlanCellView removeFromSuperview](self->_view, "removeFromSuperview");
  view = self->_view;
  self->_view = 0;

  self->_context = 0;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (unint64_t)context
{
  return self->_context;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
