@implementation RERecentActionManager

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RERecentActionManager;
  v2 = -[RESingleton _init](&v11, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[1];
    v2[1] = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[2];
    v2[2] = v5;

    +[REPredictedActionServer sharedInstance](REPredictedActionServer, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v2[3];
    v2[3] = v7;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleRecentActionNotification_, CFSTR("RERecentDonatedActionWasPerformedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RERecentActionManager;
  -[RERecentActionManager dealloc](&v4, sel_dealloc);
}

- (void)didPerformAction:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[RERecentActionManager _storePerformAction:date:remote:](self, "_storePerformAction:date:remote:", v5, v6, 0);

}

- (void)_storePerformAction:(id)a3 date:(id)a4 remote:(BOOL)a5
{
  id v8;
  id v9;
  REPredictedActionServer *server;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_initWeak(&location, self);
    server = self->_server;
    objc_msgSend(v8, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "actionIdentifier");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__RERecentActionManager__storePerformAction_date_remote___block_invoke;
    v13[3] = &unk_24CF91220;
    objc_copyWeak(&v16, &location);
    v14 = v9;
    v17 = a5;
    v15 = v8;
    -[REPredictedActionServer fetchPerformedTodayCountForActionWithBundleIdentifer:actionIdentifier:completion:](server, "fetchPerformedTodayCountForActionWithBundleIdentifer:actionIdentifier:completion:", v11, v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __57__RERecentActionManager__storePerformAction_date_remote___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = (void *)objc_opt_new();
    v6 = v5;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "setDate:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDate:", v7);

    }
    objc_msgSend(v6, "setRemote:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v6, "setCount:", a2);
    objc_msgSend(WeakRetained[1], "lock");
    objc_msgSend(WeakRetained[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_10;
    if ((objc_msgSend(v8, "remote") & 1) == 0 && *(_BYTE *)(a1 + 56))
      goto LABEL_9;
    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "laterDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "isEqualToDate:", v13);

    if ((v17 & 1) != 0)
    {
LABEL_9:
      objc_msgSend(WeakRetained[1], "unlock");
    }
    else
    {
LABEL_10:
      objc_msgSend(WeakRetained[2], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
      objc_msgSend(WeakRetained[1], "unlock");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v18 = CFSTR("RERecentActionManagerUpdatedActionKey");
      v19[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("RERecentActionManagerDidUpdateAction"), 0, v16);

    }
  }

}

- (id)_dataForAction:(id)a3
{
  NSLock *lock;
  id v5;
  void *v6;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dateValues, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (id)lastPerformedDateForAction:(id)a3
{
  void *v3;
  void *v4;

  -[RERecentActionManager _dataForAction:](self, "_dataForAction:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)actionWasPerformedLocally:(id)a3
{
  void *v3;
  char v4;

  -[RERecentActionManager _dataForAction:](self, "_dataForAction:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "remote") ^ 1;

  return v4;
}

- (unint64_t)actionNumberOfTimesPeformedToday:(id)a3
{
  void *v3;
  unint64_t v4;

  -[RERecentActionManager _dataForAction:](self, "_dataForAction:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)_handleRecentActionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RERecentDonatedActionBundleIdentifierKey"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RERecentDonatedActionIdentifierKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RERecentDonatedActionDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RERecentAction actionWithBundleIdentifier:actionIdentifier:](RERecentAction, "actionWithBundleIdentifier:actionIdentifier:", v11, objc_msgSend(v7, "unsignedLongLongValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERecentActionManager _storePerformAction:date:remote:](self, "_storePerformAction:date:remote:", v10, v9, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_dateValues, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
