@implementation REMSmartListCustomContext

- (REMSmartListCustomContext)initWithSmartList:(id)a3 account:(id)a4 parentList:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMSmartListCustomContext *v12;
  REMSmartListCustomContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMSmartListCustomContext;
  v12 = -[REMSmartListCustomContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartlist, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_parentList, a5);
  }

  return v13;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[REMSmartListCustomContext smartlist](self, "smartlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (REMColor)color
{
  void *v2;
  void *v3;

  -[REMSmartListCustomContext smartlist](self, "smartlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMColor *)v3;
}

- (REMListBadge)badge
{
  void *v2;
  void *v3;
  REMListBadge *v4;

  -[REMSmartListCustomContext smartlist](self, "smartlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeEmblem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[REMListBadge initWithRawValue:]([REMListBadge alloc], "initWithRawValue:", v3);
  else
    v4 = 0;

  return v4;
}

- (REMAccount)account
{
  return self->_account;
}

- (REMList)parentList
{
  return self->_parentList;
}

- (REMSmartList)smartlist
{
  return self->_smartlist;
}

- (void)setSmartlist:(id)a3
{
  objc_storeStrong((id *)&self->_smartlist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartlist, 0);
  objc_storeStrong((id *)&self->_parentList, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
