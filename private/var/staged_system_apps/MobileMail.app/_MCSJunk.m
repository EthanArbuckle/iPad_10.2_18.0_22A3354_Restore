@implementation _MCSJunk

- (_MCSJunk)initWithSpecialDestination:(int64_t)a3 markAsRead:(BOOL)a4 flagsToSet:(id)a5 flagsToClear:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _MCSJunk *v12;
  NSArray *v13;
  MCSFlagChange *v14;
  void *v15;
  void *v16;
  MCSFlagChange *v17;
  MCSTransfer *v18;
  NSArray *operations;
  _MCSJunk *v20;
  objc_super v22;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_MCSJunk;
  v12 = -[_MCSJunk init](&v22, "init");
  if (v12)
  {
    v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v14 = [MCSFlagChange alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
    v17 = -[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:](v14, "initWithFlagsToSet:flagsToClear:reason:", v15, v16, 4);

    -[NSArray addObject:](v13, "addObject:", v17);
    if (a3 != -500)
    {
      v18 = -[MCSTransfer initWithSpecialDestination:markAsRead:deleteIfSame:]([MCSTransfer alloc], "initWithSpecialDestination:markAsRead:deleteIfSame:", a3, v7, 0);
      -[MCSTransfer setIsDeletion:](v18, "setIsDeletion:", 0);
      -[NSArray addObject:](v13, "addObject:", v18);

    }
    operations = v12->_operations;
    v12->_operations = v13;

    v20 = v12;
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p Mark as Junk"), self);
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_operations;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "applyPendingChangeToObjects:", v4, (_QWORD)v12));
        objc_msgSend(v5, "addEntriesFromDictionary:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  objc_msgSend(v11, "addReason:", MonitoredActivityReasonJunking);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCSJunk mf_andOperations:](self, "mf_andOperations:", self->_operations));
  LOBYTE(v11) = objc_msgSend(v12, "commitToMessages:failures:newMessages:", v8, v9, v10);

  return (char)v11;
}

- (BOOL)willMarkRead
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MCSJunk mf_orOperations:](self, "mf_orOperations:", self->_operations));
  v3 = objc_msgSend(v2, "willMarkRead");

  return v3;
}

- (BOOL)willMarkUnread
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MCSJunk mf_orOperations:](self, "mf_orOperations:", self->_operations));
  v3 = objc_msgSend(v2, "willMarkUnread");

  return v3;
}

- (BOOL)willFlag
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MCSJunk mf_orOperations:](self, "mf_orOperations:", self->_operations));
  v3 = objc_msgSend(v2, "willFlag");

  return v3;
}

- (BOOL)willUnflag
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MCSJunk mf_orOperations:](self, "mf_orOperations:", self->_operations));
  v3 = objc_msgSend(v2, "willUnflag");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
