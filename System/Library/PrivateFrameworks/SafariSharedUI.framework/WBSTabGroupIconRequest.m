@implementation WBSTabGroupIconRequest

- (WBSTabGroupIconRequest)initWithTabGroup:(id)a3 tabProvider:(id)a4
{
  id v6;
  id v7;
  WBSTabGroupIconRequest *v8;
  uint64_t v9;
  NSString *tabGroupUUID;
  WBSTabGroupIconRequest *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSTabGroupIconRequest;
  v8 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v13, sel_initWithURL_extraInfo_, 0, 0);
  if (v8)
  {
    objc_msgSend(v6, "uuid");
    v9 = objc_claimAutoreleasedReturnValue();
    tabGroupUUID = v8->_tabGroupUUID;
    v8->_tabGroupUUID = (NSString *)v9;

    objc_storeWeak((id *)&v8->_tabProvider, v7);
    v11 = v8;
  }

  return v8;
}

- (NSArray)tabs
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabProvider);
  objc_msgSend(WeakRetained, "tabGroupWithUUID:", self->_tabGroupUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "tabs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (NSString)uniqueIdentifier
{
  return self->_tabGroupUUID;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_tabGroupUUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSTabGroupIconRequest *v4;
  NSString *tabGroupUUID;
  void *v6;
  char v7;

  v4 = (WBSTabGroupIconRequest *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      tabGroupUUID = self->_tabGroupUUID;
      -[WBSTabGroupIconRequest tabGroupUUID](v4, "tabGroupUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqual:](tabGroupUUID, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (CGSize)sizeForDrawing
{
  double v2;
  double v3;
  CGSize result;

  v2 = 64.0;
  v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (WBTabProvider)tabProvider
{
  return (WBTabProvider *)objc_loadWeakRetained((id *)&self->_tabProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabProvider);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
}

@end
