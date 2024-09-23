@implementation DMDActivationPredicateObserverManager

- (DMDActivationPredicateObserverManager)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  DMDActivationPredicateObserverManager *v5;
  uint64_t v6;
  NSMutableDictionary *activationPredicateObserversByIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMDActivationPredicateObserverManager;
  v5 = -[DMDActivationPredicateObserverManager init](&v9, "init");
  if (v5)
  {
    v6 = objc_opt_new(NSMutableDictionary, v2, v3, v4);
    activationPredicateObserversByIdentifier = v5->_activationPredicateObserversByIdentifier;
    v5->_activationPredicateObserversByIdentifier = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)addActivationPredicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  if (!v10)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager _predicateObserverForPredicate:withUniqueIdentifier:](self, "_predicateObserverForPredicate:withUniqueIdentifier:", v6, v7));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v7);

    }
  }
  objc_sync_exit(v8);

  return v10;
}

- (void)removeActivationPredicateObserverWithUniqueIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v8));

  objc_msgSend(v6, "invalidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v4);
}

- (id)activationPredicateObserverForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (void)_reportChangeToObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  DMDActivationPredicateObserverManager *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "activationPredicateObserverManager:didObserveChangeForPredicateWithIdentifier:") & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000105B8;
    block[3] = &unk_1000B9BD0;
    v7 = v5;
    v8 = self;
    v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_updateAllActivationPredicateObserverRegistrations
{
  void *v3;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserversByIdentifier](self, "activationPredicateObserversByIdentifier"));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_1000B9C10);

  objc_sync_exit(obj);
}

- (id)_predicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DMDActivationBudgetObserver *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __objc2_class *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  DMDActivationPredicateNot *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  __objc2_class *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(CEMPredicateBudget, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    v12 = objc_opt_class(CEMPredicateCompositeBudget, v10);
    if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
    {
      v11 = -[DMDActivationBudgetObserver initWithDelegate:uniqueIdentifier:compositeBudgetPredicate:]([DMDActivationBudgetObserver alloc], "initWithDelegate:uniqueIdentifier:compositeBudgetPredicate:", self, v7, v6);
      goto LABEL_16;
    }
    v14 = objc_opt_class(CEMPredicateWeeklyTimeRange, v13);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
    {
      v11 = -[DMDActivationCurfewObserver initWithDelegate:uniqueIdentifier:curfewPredicate:]([DMDActivationCurfewObserver alloc], "initWithDelegate:uniqueIdentifier:curfewPredicate:", self, v7, v6);
      goto LABEL_16;
    }
    v16 = objc_opt_class(CEMPredicateOneTime, v15);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
    {
      v11 = -[DMDActivationOneTimeObserver initWithDelegate:uniqueIdentifier:oneTimePredicate:]([DMDActivationOneTimeObserver alloc], "initWithDelegate:uniqueIdentifier:oneTimePredicate:", self, v7, v6);
      goto LABEL_16;
    }
    v18 = objc_opt_class(CEMPredicateiCloudAccount, v17);
    if ((objc_opt_isKindOfClass(v6, v18) & 1) != 0)
    {
      v11 = -[DMDActivationiCloudAccountObserver initWithDelegate:uniqueIdentifier:iCloudAccountPredicate:]([DMDActivationiCloudAccountObserver alloc], "initWithDelegate:uniqueIdentifier:iCloudAccountPredicate:", self, v7, v6);
      goto LABEL_16;
    }
    v20 = objc_opt_class(CEMPredicateTrue, v19);
    if ((objc_opt_isKindOfClass(v6, v20) & 1) != 0)
    {
      v22 = DMDActivationPredicateTrue;
LABEL_15:
      v11 = (DMDActivationBudgetObserver *)objc_msgSend([v22 alloc], "initWithDelegate:uniqueIdentifier:predicate:", self, v7, v6);
      goto LABEL_16;
    }
    v23 = objc_opt_class(CEMPredicateFalse, v21);
    if ((objc_opt_isKindOfClass(v6, v23) & 1) != 0)
    {
      v22 = DMDActivationPredicateFalse;
      goto LABEL_15;
    }
    v27 = objc_opt_class(CEMPredicateNot, v24);
    if ((objc_opt_isKindOfClass(v6, v27) & 1) != 0)
    {
      v29 = v6;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "payloadPredicate"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager _predicateObserverForPredicate:withUniqueIdentifier:](self, "_predicateObserverForPredicate:withUniqueIdentifier:", v30, v7));

      if (v31)
      {
        v32 = -[DMDActivationPredicateNot initWithDelegate:uniqueIdentifier:subPredicateObserver:predicate:]([DMDActivationPredicateNot alloc], "initWithDelegate:uniqueIdentifier:subPredicateObserver:predicate:", self, v7, v31, v29);
LABEL_28:
        v25 = v32;
LABEL_30:

        goto LABEL_17;
      }
LABEL_29:
      v25 = 0;
      goto LABEL_30;
    }
    v33 = objc_opt_class(CEMPredicateAll, v28);
    if ((objc_opt_isKindOfClass(v6, v33) & 1) != 0)
    {
      v29 = v6;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "payloadPredicates"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager _subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:](self, "_subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:", v35, v7));

      v36 = objc_msgSend(v31, "count");
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "payloadPredicates"));
      v38 = objc_msgSend(v37, "count");

      if (v36 != v38)
        goto LABEL_29;
      v39 = DMDActivationPredicateAll;
    }
    else
    {
      v40 = objc_opt_class(CEMPredicateAny, v34);
      if ((objc_opt_isKindOfClass(v6, v40) & 1) == 0)
      {
        v25 = 0;
        goto LABEL_17;
      }
      v29 = v6;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "payloadPredicates"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager _subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:](self, "_subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:", v41, v7));

      v42 = objc_msgSend(v31, "count");
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "payloadPredicates"));
      v44 = objc_msgSend(v43, "count");

      if (v42 != v44)
        goto LABEL_29;
      v39 = DMDActivationPredicateAny;
    }
    v32 = (DMDActivationPredicateNot *)objc_msgSend([v39 alloc], "initWithDelegate:uniqueIdentifier:subPredicateObservers:predicate:", self, v7, v31, v29);
    goto LABEL_28;
  }
  v11 = -[DMDActivationBudgetObserver initWithDelegate:uniqueIdentifier:budgetPredicate:]([DMDActivationBudgetObserver alloc], "initWithDelegate:uniqueIdentifier:budgetPredicate:", self, v7, v6);
LABEL_16:
  v25 = v11;
LABEL_17:

  return v25;
}

- (id)_subPredicateObserversForCompoundSubPredicates:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v19 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = 1;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld"), v7, (char *)v12 + v11));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager _predicateObserverForPredicate:withUniqueIdentifier:](self, "_predicateObserverForPredicate:withUniqueIdentifier:", v13, v14));
        if (v15)
          -[NSMutableArray addObject:](v19, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v11 += (uint64_t)v12;
    }
    while (v9);
  }

  v16 = -[NSMutableArray copy](v19, "copy");
  return v16;
}

- (BOOL)alarms
{
  return 1;
}

- (NSArray)notifyMatchingNotifications
{
  _QWORD v3[3];

  v3[0] = CFSTR("com.apple.dmd.budget.didChange");
  v3[1] = CFSTR("SignificantTimeChangeNotification");
  v3[2] = DMFiCloudAccountDidChangeDarwinNotification;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (void)handleAlarmWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  DMDActivationPredicateObserverManager *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = DMFConfigurationEngineLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling alarm with identifier: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserverManager activationPredicateObserverForIdentifier:](self, "activationPredicateObserverForIdentifier:", v4));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "updateObserverRegistration");
    v9 = self;
    v10 = v8;
  }
  else
  {
    -[DMDActivationPredicateObserverManager _updateAllActivationPredicateObserverRegistrations](self, "_updateAllActivationPredicateObserverRegistrations");
    v9 = self;
    v10 = 0;
  }
  -[DMDActivationPredicateObserverManager _reportChangeToObserver:](v9, "_reportChangeToObserver:", v10);

}

- (void)handleNotifyMatchingNotificationWithName:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = DMFConfigurationEngineLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling notify matching notification with name: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.dmd.budget.didChange")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("SignificantTimeChangeNotification")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", DMFiCloudAccountDidChangeDarwinNotification))
  {
    -[DMDActivationPredicateObserverManager _updateAllActivationPredicateObserverRegistrations](self, "_updateAllActivationPredicateObserverRegistrations");
    -[DMDActivationPredicateObserverManager _reportChangeToObserver:](self, "_reportChangeToObserver:", 0);
  }

}

- (DMDActivationPredicateObserverManagerDelegate)delegate
{
  return (DMDActivationPredicateObserverManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)activationPredicateObserversByIdentifier
{
  return self->_activationPredicateObserversByIdentifier;
}

- (void)setActivationPredicateObserversByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activationPredicateObserversByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationPredicateObserversByIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
