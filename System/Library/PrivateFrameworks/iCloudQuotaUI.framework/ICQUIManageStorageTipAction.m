@implementation ICQUIManageStorageTipAction

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("actionButtonText: %@, actionName: %@, actionURL: %@"), self->_actionButtonText, self->_actionName, self->_actionURL);
}

- (id)initFromRUITableViewRow:(id)a3
{
  id v4;
  ICQUIManageStorageTipAction *v5;
  void *v6;
  uint64_t v7;
  NSString *actionButtonText;
  uint64_t v9;
  NSString *actionName;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *actionURL;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQUIManageStorageTipAction;
  v5 = -[ICQUIManageStorageTipAction init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionButtonText"));
    v7 = objc_claimAutoreleasedReturnValue();
    actionButtonText = v5->_actionButtonText;
    v5->_actionButtonText = (NSString *)v7;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionName"));
    v9 = objc_claimAutoreleasedReturnValue();
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v9;

    v11 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v13;

  }
  return v5;
}

- (id)initFromActionInfo:(id)a3
{
  id v4;
  ICQUIManageStorageTipAction *v5;
  uint64_t v6;
  NSString *actionButtonText;
  void *v8;
  uint64_t v9;
  NSString *actionName;
  void *v11;
  void *v12;
  NSURL *v13;
  void *actionURL;
  void *v15;
  void *v16;
  NSURL *v17;
  void *v18;
  uint64_t v19;
  NSURL *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQUIManageStorageTipAction;
  v5 = -[ICQUIManageStorageTipAction init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    actionButtonText = v5->_actionButtonText;
    v5->_actionButtonText = (NSString *)v6;

    objc_msgSend(v4, "icqLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "action");
    _ICQStringForAction();
    v9 = objc_claimAutoreleasedReturnValue();
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v9;

    objc_msgSend(v4, "actionURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      actionURL = v5->_actionURL;
      v5->_actionURL = v13;
    }
    else
    {
      objc_msgSend(v4, "icqLink");
      actionURL = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(actionURL, "serverUIURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
        v18 = v5->_actionURL;
        v5->_actionURL = v17;
      }
      else
      {
        objc_msgSend(v4, "icqLink");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "actionURL");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v5->_actionURL;
        v5->_actionURL = (NSURL *)v19;

      }
    }

  }
  return v5;
}

+ (id)actionsFromActionInfos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ICQUIManageStorageTipAction *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [ICQUIManageStorageTipAction alloc];
        v12 = -[ICQUIManageStorageTipAction initFromActionInfo:](v11, "initFromActionInfo:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)actionButtonText
{
  return self->_actionButtonText;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_actionButtonText, 0);
}

@end
