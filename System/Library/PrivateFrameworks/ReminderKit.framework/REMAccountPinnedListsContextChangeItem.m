@implementation REMAccountPinnedListsContextChangeItem

- (REMAccountPinnedListsContextChangeItem)initWithAccountChangeItem:(id)a3
{
  id v5;
  REMAccountPinnedListsContextChangeItem *v6;
  REMAccountPinnedListsContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountPinnedListsContextChangeItem;
  v6 = -[REMAccountPinnedListsContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountChangeItem, a3);

  return v7;
}

- (REMManualOrdering)unsavedManualOrdering
{
  void *v2;
  void *v3;

  -[REMAccountPinnedListsContextChangeItem accountChangeItem](self, "accountChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinnedListsManualOrdering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMManualOrdering *)v3;
}

- (void)updateManualOrdering:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMAccountPinnedListsContextChangeItem accountChangeItem](self, "accountChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPinnedListsManualOrdering:", v4);

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
