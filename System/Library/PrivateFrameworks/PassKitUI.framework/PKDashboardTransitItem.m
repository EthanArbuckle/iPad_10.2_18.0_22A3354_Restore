@implementation PKDashboardTransitItem

- (PKDashboardTransitItem)initWithPass:(id)a3 transitBalanceModel:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  PKDashboardTransitItem *v11;
  PKDashboardTransitItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardTransitItem;
  v11 = -[PKDashboardTransitItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pass, a3);
    objc_storeStrong((id *)&v12->_transitBalanceModel, a4);
    v12->_transitItemType = a5;
  }

  return v12;
}

+ (id)identifier
{
  return CFSTR("transit");
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (unint64_t)transitItemType
{
  return self->_transitItemType;
}

- (void)setTransitItemType:(unint64_t)a3
{
  self->_transitItemType = a3;
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void)setTransitBalanceModel:(id)a3
{
  objc_storeStrong((id *)&self->_transitBalanceModel, a3);
}

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (void)setTransitCommutePlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)actionGroups
{
  return self->_actionGroups;
}

- (void)setActionGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
