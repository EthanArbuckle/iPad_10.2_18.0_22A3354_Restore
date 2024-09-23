@implementation REMAccountTemplatesContextChangeItem

- (REMAccountTemplatesContextChangeItem)initWithAccountChangeItem:(id)a3
{
  id v5;
  REMAccountTemplatesContextChangeItem *v6;
  REMAccountTemplatesContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountTemplatesContextChangeItem;
  v6 = -[REMAccountTemplatesContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountChangeItem, a3);

  return v7;
}

- (id)addTemplateWithName:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[REMAccountTemplatesContextChangeItem accountChangeItem](self, "accountChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMAccountTemplatesContextChangeItem accountChangeItem](self, "accountChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTemplateWithName:configuration:toAccountChangeItem:", v7, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (REMManualOrdering)unsavedManualOrdering
{
  void *v2;
  void *v3;

  -[REMAccountTemplatesContextChangeItem accountChangeItem](self, "accountChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templatesManualOrdering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMManualOrdering *)v3;
}

- (void)updateManualOrdering:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMAccountTemplatesContextChangeItem accountChangeItem](self, "accountChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTemplatesManualOrdering:", v4);

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
