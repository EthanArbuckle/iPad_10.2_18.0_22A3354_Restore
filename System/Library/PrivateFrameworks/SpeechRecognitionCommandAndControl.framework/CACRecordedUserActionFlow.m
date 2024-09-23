@implementation CACRecordedUserActionFlow

- (CACRecordedUserActionFlow)init
{
  CACRecordedUserActionFlow *v2;
  CACRecordedUserActionFlow *v3;
  uint64_t v4;
  NSMutableDictionary *orignalEnvironmentSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACRecordedUserActionFlow;
  v2 = -[CACRecordedUserActionFlow init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_executingTaskIndex = -1;
    v4 = objc_opt_new();
    orignalEnvironmentSettings = v3->_orignalEnvironmentSettings;
    v3->_orignalEnvironmentSettings = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (CACRecordedUserActionFlow)initWithUserActions:(id)a3
{
  id v5;
  CACRecordedUserActionFlow *v6;
  CACRecordedUserActionFlow *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *environmentSettings;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[CACRecordedUserActionFlow init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tasks, a3);
    v15[0] = CFSTR("OverlayType");
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alwaysShowOverlayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("LocaleIdentifier");
    v16[0] = v9;
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    environmentSettings = v7->_environmentSettings;
    v7->_environmentSettings = (NSDictionary *)v12;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("Version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tasks, CFSTR("Tasks"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_environmentSettings, CFSTR("EnvironmentSettings"));

}

- (CACRecordedUserActionFlow)initWithCoder:(id)a3
{
  id v4;
  CACRecordedUserActionFlow *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *tasks;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *environmentSettings;

  v4 = a3;
  v5 = -[CACRecordedUserActionFlow init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Tasks"));
    v9 = objc_claimAutoreleasedReturnValue();
    tasks = v5->_tasks;
    v5->_tasks = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("EnvironmentSettings"));
    v14 = objc_claimAutoreleasedReturnValue();
    environmentSettings = v5->_environmentSettings;
    v5->_environmentSettings = (NSDictionary *)v14;

  }
  return v5;
}

- (NSArray)userActions
{
  return self->_tasks;
}

- (BOOL)doesNextSpokenCommandMatchIdentifier:(id)a3
{
  id v4;
  CACRecordedUserActionFlow *v5;
  int64_t executingTaskIndex;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  executingTaskIndex = v5->_executingTaskIndex;
  if (executingTaskIndex + 1 >= -[NSArray count](v5->_tasks, "count"))
  {
    v10 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](v5->_tasks, "objectAtIndex:", v5->_executingTaskIndex + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spokenCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

  }
  objc_sync_exit(v5);

  return v10;
}

- (void)beginExecutingWithCompletionBlock:(id)a3
{
  id v4;
  CACRecordedUserActionFlow *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  *(_WORD *)&v5->_isExecuting = 1;
  objc_sync_exit(v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__CACRecordedUserActionFlow_beginExecutingWithCompletionBlock___block_invoke;
  v7[3] = &unk_24F2AA990;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __63__CACRecordedUserActionFlow_beginExecutingWithCompletionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureEnvironment");
  return objc_msgSend(*(id *)(a1 + 32), "_executeNextActionWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)cancelExecution
{
  CACRecordedUserActionFlow *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isCancelled = 1;
  objc_sync_exit(obj);

}

- (void)_executeNextActionWithCompletionBlock:(id)a3
{
  id v4;
  CACRecordedUserActionFlow *v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 isCancelled;
  unint64_t v9;
  unint64_t v10;
  CACRecordedUserActionFlow *v12;
  void *v13;
  void *v14;
  CACRecordedUserActionFlow *v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = 1;
  if (v5->_skipNextAction)
    v6 = 2;
  v7 = v6 + v5->_executingTaskIndex;
  v5->_executingTaskIndex = v7;
  v5->_skipNextAction = 0;
  isCancelled = v5->_isCancelled;
  v9 = -[NSArray count](v5->_tasks, "count");
  v10 = v9;
  if (isCancelled || v7 >= v9)
  {
    objc_sync_exit(v5);

    if (isCancelled)
    {
      v12 = v5;
      objc_sync_enter(v12);
      v12->_isExecuting = 0;
      objc_sync_exit(v12);

      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandPlayback.Error.CancelledByUser"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CACMakeError(3000, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACRecordedUserActionFlow _exitFlowWithError:completionBlock:](v12, "_exitFlowWithError:completionBlock:", v13, v4);

      goto LABEL_14;
    }
    v14 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](v5->_tasks, "objectAtIndex:", v5->_executingTaskIndex);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  if (v7 < v10)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke;
    v16[3] = &unk_24F2AB120;
    v16[4] = v5;
    v17 = v4;
    objc_msgSend(v14, "beginExecutingWithCompletionBlock:", v16);

  }
  else
  {
    v15 = v5;
    objc_sync_enter(v15);
    v15->_isExecuting = 0;
    objc_sync_exit(v15);

    -[CACRecordedUserActionFlow _exitFlowWithError:completionBlock:](v15, "_exitFlowWithError:completionBlock:", 0, v4);
  }
LABEL_14:

}

void __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "code"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_exitFlowWithError:completionBlock:", v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    +[CACSpokenCommand defaultDelayBetweenCommands](CACSpokenCommand, "defaultDelayBetweenCommands");
    v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_24F2AA990;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    dispatch_after(v5, v6, v8);

  }
}

uint64_t __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeNextActionWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)_exitFlowWithError:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, id);
  id v7;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  -[CACRecordedUserActionFlow _restoreEnvironment](self, "_restoreEnvironment");
  v6[2](v6, v7);

}

- (void)_configureEnvironment
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSDictionary allKeys](self->_environmentSettings, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("OverlayType")))
        {
          -[NSDictionary objectForKey:](self->_environmentSettings, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "alwaysShowOverlayType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) == 0)
          {
            +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setAlwaysShowOverlayType:", v9);

            -[NSMutableDictionary setObject:forKey:](self->_orignalEnvironmentSettings, "setObject:forKey:", v11, v8);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_restoreEnvironment
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_orignalEnvironmentSettings, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("OverlayType")))
        {
          +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_orignalEnvironmentSettings, "objectForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAlwaysShowOverlayType:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)plistDescription
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_tasks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "plistDescription", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKey:", self->_environmentSettings, CFSTR("UserActionFlowEnvironment"));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("UserActionFlowTasks"));

  return v3;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_tasks;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%ld\t%@\n"), v8 + v9, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 += v9;
    }
    while (v6);
  }

  return v3;
}

- (BOOL)skipNextAction
{
  return self->_skipNextAction;
}

- (void)setSkipNextAction:(BOOL)a3
{
  self->_skipNextAction = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_orignalEnvironmentSettings, 0);
  objc_storeStrong((id *)&self->_environmentSettings, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
