@implementation REMAccountGroupContextChangeItem

- (REMAccountGroupContextChangeItem)initWithAccountChangeItem:(id)a3
{
  id v5;
  REMAccountGroupContextChangeItem *v6;
  REMAccountGroupContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountGroupContextChangeItem;
  v6 = -[REMAccountGroupContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountChangeItem, a3);

  return v7;
}

- (REMAccountChangeItem)accountChangeItem
{
  return self->_accountChangeItem;
}

- (void)setAccountChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeItem, 0);
}

@end
