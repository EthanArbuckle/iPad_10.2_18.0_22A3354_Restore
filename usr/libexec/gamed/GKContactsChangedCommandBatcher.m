@implementation GKContactsChangedCommandBatcher

- (GKContactsChangedCommandBatcher)initWithPlayerProvider:(id)a3 meContactID:(id)a4 batchSize:(unint64_t)a5 finishedCommand:(id)a6
{
  id v10;
  id v11;
  id v12;
  GKContactsCacheUpdateBatchStartCommand *v13;
  GKContactsCacheUpdateBatchEndCommand *v14;
  GKContactsChangedCommandBatcher *v15;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(GKContactsCacheUpdateBatchStartCommand);
  v14 = objc_alloc_init(GKContactsCacheUpdateBatchEndCommand);
  v15 = -[GKContactsChangedCommandBatcher initWithPlayerProvider:meContactID:batchSize:batchStartCommand:batchEndCommand:finishedCommand:](self, "initWithPlayerProvider:meContactID:batchSize:batchStartCommand:batchEndCommand:finishedCommand:", v12, v11, a5, v13, v14, v10);

  return v15;
}

- (GKContactsChangedCommandBatcher)initWithPlayerProvider:(id)a3 meContactID:(id)a4 batchSize:(unint64_t)a5 batchStartCommand:(id)a6 batchEndCommand:(id)a7 finishedCommand:(id)a8
{
  id v15;
  id v16;
  id v17;
  GKContactsChangedCommandBatcher *v18;
  GKContactsChangedCommandBatcher *v19;
  uint64_t v20;
  NSMutableSet *commands;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)GKContactsChangedCommandBatcher;
  v18 = -[GKContactsChangedCommandBatcher init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    v18->_batchSize = a5;
    objc_storeStrong((id *)&v18->_meContactID, a4);
    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", a5, v23, v24));
    commands = v19->_commands;
    v19->_commands = (NSMutableSet *)v20;

    objc_storeStrong((id *)&v19->_playerProvider, a3);
    objc_storeStrong((id *)&v19->_batchStartCommand, a6);
    objc_storeStrong((id *)&v19->_batchEndCommand, a7);
    objc_storeStrong((id *)&v19->_finishedCommand, a8);
  }

  return v19;
}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  GKContactsChangedAddOrUpdateCommand *v5;
  void *v6;
  void *v7;
  GKContactsChangedAddOrUpdateCommand *v8;

  v4 = a3;
  v5 = [GKContactsChangedAddOrUpdateCommand alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher meContactID](self, "meContactID"));
  v8 = -[GKContactsChangedAddOrUpdateCommand initWithContact:meContactID:](v5, "initWithContact:meContactID:", v6, v7);

  -[GKContactsChangedCommandBatcher addCommand:](self, "addCommand:", v8);
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  GKContactsChangedDeleteCommand *v5;
  void *v6;
  GKContactsChangedDeleteCommand *v7;

  v4 = a3;
  v5 = [GKContactsChangedDeleteCommand alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));

  v7 = -[GKContactsChangedDeleteCommand initWithContactID:](v5, "initWithContactID:", v6);
  -[GKContactsChangedCommandBatcher addCommand:](self, "addCommand:", v7);

}

- (void)visitDropEverythingEvent:(id)a3
{
  GKContactsChangedClearCommand *v4;

  v4 = objc_alloc_init(GKContactsChangedClearCommand);
  -[GKContactsChangedCommandBatcher addCommand:](self, "addCommand:", v4);

}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  GKContactsChangedAddOrUpdateCommand *v5;
  void *v6;
  void *v7;
  GKContactsChangedAddOrUpdateCommand *v8;

  v4 = a3;
  v5 = [GKContactsChangedAddOrUpdateCommand alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher meContactID](self, "meContactID"));
  v8 = -[GKContactsChangedAddOrUpdateCommand initWithContact:meContactID:](v5, "initWithContact:meContactID:", v6, v7);

  -[GKContactsChangedCommandBatcher addCommand:](self, "addCommand:", v8);
}

- (void)addCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands"));
  objc_msgSend(v5, "addObject:", v4);

  if (-[GKContactsChangedCommandBatcher shouldExecuteCommands](self, "shouldExecuteCommands"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher playerProvider](self, "playerProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localPlayerCacheGroup"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100122A64;
    v10[3] = &unk_1002BB658;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    objc_msgSend(v8, "performBlockAndWait:", v10);

  }
}

- (BOOL)shouldExecuteCommands
{
  GKContactsChangedCommandBatcher *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands"));
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 >= (id)-[GKContactsChangedCommandBatcher batchSize](v2, "batchSize");

  return (char)v2;
}

- (void)addCommand:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands"));
  objc_msgSend(v7, "addObject:", v6);

  if (-[GKContactsChangedCommandBatcher shouldExecuteCommands](self, "shouldExecuteCommands"))
    v8 = -[GKContactsChangedCommandBatcher executeCommandsWithContext:](self, "executeCommandsWithContext:", v9);

}

- (id)executeCommandsWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v7);
    v13 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_1001230F8(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher error](self, "error"));

  if (v8)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v9);
    v11 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100123160(v11, self);
    goto LABEL_12;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher batchStartCommand](self, "batchStartCommand"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "executeWithContext:", v4));
  -[GKContactsChangedCommandBatcher setError:](self, "setError:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher error](self, "error"));
  if (v23)
  {
LABEL_12:
    v25 = 0;
    goto LABEL_13;
  }
  if (!os_log_GKGeneral)
    v27 = (id)GKOSLoggers(v24);
  v28 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10012312C(v28, v29, v30, v31, v32, v33, v34, v35);
  v36 = objc_alloc((Class)NSMutableSet);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands"));
  v25 = objc_msgSend(v36, "initWithCapacity:", objc_msgSend(v37, "count"));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands", 0));
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v48;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v42), "executeWithContext:", v4));
        if (v43)
          objc_msgSend(v25, "unionSet:", v43);

        v42 = (char *)v42 + 1;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v40);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher batchEndCommand](self, "batchEndCommand"));
  v45 = objc_msgSend(v25, "copy");
  objc_msgSend(v44, "executeWithHandles:context:", v45, v4);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher commands](self, "commands"));
  objc_msgSend(v46, "removeAllObjects");

LABEL_13:
  return v25;
}

- (void)finish
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher playerProvider](self, "playerProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localPlayerCacheGroup"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100122F3C;
  v7[3] = &unk_1002BB658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

- (void)finishWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[GKContactsChangedCommandBatcher executeCommandsWithContext:](self, "executeCommandsWithContext:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher error](self, "error"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedCommandBatcher finishedCommand](self, "finishedCommand"));
    objc_msgSend(v6, "executeWithContext:", v7);

  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (GKContactsCacheUpdateBatchStartCommand)batchStartCommand
{
  return self->_batchStartCommand;
}

- (void)setBatchStartCommand:(id)a3
{
  objc_storeStrong((id *)&self->_batchStartCommand, a3);
}

- (GKContactsCacheUpdateBatchEndCommand)batchEndCommand
{
  return self->_batchEndCommand;
}

- (void)setBatchEndCommand:(id)a3
{
  objc_storeStrong((id *)&self->_batchEndCommand, a3);
}

- (GKContactsCacheUpdateFinishedCommand)finishedCommand
{
  return self->_finishedCommand;
}

- (void)setFinishedCommand:(id)a3
{
  objc_storeStrong((id *)&self->_finishedCommand, a3);
}

- (NSString)meContactID
{
  return self->_meContactID;
}

- (void)setMeContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (GKPlayerInternalProvider)playerProvider
{
  return self->_playerProvider;
}

- (void)setPlayerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_playerProvider, a3);
}

- (NSMutableSet)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_storeStrong((id *)&self->_commands, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_playerProvider, 0);
  objc_storeStrong((id *)&self->_meContactID, 0);
  objc_storeStrong((id *)&self->_finishedCommand, 0);
  objc_storeStrong((id *)&self->_batchEndCommand, 0);
  objc_storeStrong((id *)&self->_batchStartCommand, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
