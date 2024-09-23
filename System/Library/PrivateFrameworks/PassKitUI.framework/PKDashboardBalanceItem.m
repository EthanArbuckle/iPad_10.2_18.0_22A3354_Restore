@implementation PKDashboardBalanceItem

+ (id)identifier
{
  return CFSTR("balanceItem");
}

- (NSString)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_storeStrong((id *)&self->_balance, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (NSString)availableCredit
{
  return self->_availableCredit;
}

- (void)setAvailableCredit:(id)a3
{
  objc_storeStrong((id *)&self->_availableCredit, a3);
}

- (NSString)topUpTitle
{
  return self->_topUpTitle;
}

- (void)setTopUpTitle:(id)a3
{
  objc_storeStrong((id *)&self->_topUpTitle, a3);
}

- (id)topUpAction
{
  return self->_topUpAction;
}

- (void)setTopUpAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)topUpEnabled
{
  return self->_topUpEnabled;
}

- (void)setTopUpEnabled:(BOOL)a3
{
  self->_topUpEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_topUpAction, 0);
  objc_storeStrong((id *)&self->_topUpTitle, 0);
  objc_storeStrong((id *)&self->_availableCredit, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_balance, 0);
}

@end
