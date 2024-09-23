@implementation _DASBlueListManager

+ (int64_t)nextHoursBudgetWithPreviousBudget:(int64_t)a3
{
  double v3;

  v3 = (double)(a3 + 8);
  if (v3 > 12.0)
    return (uint64_t)12.0;
  return (uint64_t)v3;
}

+ (id)managerWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v4);

  return v5;
}

- (_DASBlueListManager)initWithContext:(id)a3
{
  id v5;
  _DASBlueListManager *v6;
  _DASBlueListManager *v7;
  uint64_t v8;
  _CDContextualKeyPath *blueListKeyPath;
  uint64_t v10;
  _CDContextualKeyPath *pushBudgetKeyPath;
  uint64_t v12;
  _CDContextualKeyPath *pushBudgetResetKeyPath;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_DASBlueListManager;
  v6 = -[_DASBlueListManager init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/push/bluelist")));
    blueListKeyPath = v7->_blueListKeyPath;
    v7->_blueListKeyPath = (_CDContextualKeyPath *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/push/globalBudget")));
    pushBudgetKeyPath = v7->_pushBudgetKeyPath;
    v7->_pushBudgetKeyPath = (_CDContextualKeyPath *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/push/globalBudgetResetDate")));
    pushBudgetResetKeyPath = v7->_pushBudgetResetKeyPath;
    v7->_pushBudgetResetKeyPath = (_CDContextualKeyPath *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v7->_context, "objectForKeyedSubscript:", v7->_blueListKeyPath));
    v7->_blueListEnabled = objc_msgSend(v14, "BOOLValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v7->_context, "objectForKeyedSubscript:", v7->_pushBudgetKeyPath));
    v16 = v15;
    if (v15)
      v7->_pushBudget = (int64_t)objc_msgSend(v15, "integerValue");
    else
      -[_DASBlueListManager updateGlobalBudget:](v7, "updateGlobalBudget:", 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v7->_context, "objectForKeyedSubscript:", v7->_pushBudgetResetKeyPath));
    v19 = v18;
    if (v18 && (objc_msgSend(v18, "timeIntervalSinceDate:", v17), v20 >= 0.0))
    {
      v21 = v19;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v17, 3600.0));

      -[_CDLocalContext setObject:forKeyedSubscript:](v7->_context, "setObject:forKeyedSubscript:", v21, v7->_pushBudgetResetKeyPath);
      if (v16)
        -[_DASBlueListManager updateBudgetsForNextSlot](v7, "updateBudgetsForNextSlot");
    }
    -[_DASBlueListManager registerForBlueListNotifications](v7, "registerForBlueListNotifications");
    -[_DASBlueListManager setupResetTimer](v7, "setupResetTimer");

  }
  return v7;
}

- (void)updateGlobalBudget:(int64_t)a3
{
  void *v4;
  _DASBlueListManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_pushBudget = a3 & ~(a3 >> 63);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
  -[_CDLocalContext setObject:forKeyedSubscript:](obj->_context, "setObject:forKeyedSubscript:", v4, obj->_pushBudgetKeyPath);

  -[_DASBlueListManager updateBlueListStatus:](obj, "updateBlueListStatus:", -[_DASBlueListManager shouldBlueListPushes](obj, "shouldBlueListPushes"));
  objc_sync_exit(obj);

}

- (void)updateBudgetsForNextSlot
{
  -[_DASBlueListManager updateGlobalBudget:](self, "updateGlobalBudget:", objc_msgSend((id)objc_opt_class(self), "nextHoursBudgetWithPreviousBudget:", self->_pushBudget));
}

- (void)decrementPushBudgetRemaining
{
  _DASBlueListManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_DASBlueListManager updateGlobalBudget:](obj, "updateGlobalBudget:", obj->_pushBudget - 1);
  objc_sync_exit(obj);

}

- (void)setupResetTimer
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *budgetResetTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  global_queue = dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  budgetResetTimer = self->_budgetResetTimer;
  self->_budgetResetTimer = v5;

  v7 = self->_budgetResetTimer;
  v8 = dispatch_walltime(0, 3600000000000);
  dispatch_source_set_timer(v7, v8, 0x34630B8A000uLL, 0x174876E800uLL);
  v9 = self->_budgetResetTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100091A1C;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_budgetResetTimer);
}

- (void)updateBlueListStatus:(BOOL)a3
{
  _BOOL8 v3;
  _DASBlueListManager *v4;
  void *v5;
  _DASBlueListManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_blueListEnabled != v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[_CDLocalContext setObject:forKeyedSubscript:](obj->_context, "setObject:forKeyedSubscript:", v5, obj->_blueListKeyPath);

    v4 = obj;
    obj->_blueListEnabled = v3;
  }
  objc_sync_exit(v4);

}

- (BOOL)shouldBlueListPushes
{
  _CDLocalContext *context;
  void *v4;
  void *v5;
  int v6;
  char v7;
  _CDLocalContext *v9;
  void *v10;
  void *v11;
  int v12;
  _CDLocalContext *v13;
  void *v14;
  void *v15;
  _CDLocalContext *v16;
  void *v17;
  void *v18;
  _CDLocalContext *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  unsigned __int8 v24;

  context = self->_context;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "intValue");

  if (v6 > 20 || self->_pushBudget < 1)
    return 1;
  if ((+[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", self->_context) & 1) != 0)
    return 0;
  v9 = self->_context;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
  v12 = objc_msgSend(v11, "intValue");

  v13 = self->_context;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14));

  v16 = self->_context;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17));

  v19 = self->_context;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20));

  v22 = (uint64_t)objc_msgSend(v15, "integerValue") <= 49
     && (uint64_t)objc_msgSend(v18, "integerValue") <= 49
     && (uint64_t)objc_msgSend(v21, "integerValue") < 100;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v24 = objc_msgSend(v23, "isLowPowerModeEnabled");

  if (v12 >= 21)
    v7 = v22 | v24;
  else
    v7 = 1;

  return v7;
}

- (void)registerForBlueListNotifications
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_queue_global_t global_queue;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD handler[5];
  _QWORD v26[5];
  _QWORD v27[4];

  v3 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v4 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality"));
  v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality"));
  v24 = (void *)v3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v3, CFSTR("self.%@.value > %@"), v3, &off_10016EC30));
  v23 = (void *)v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v4, CFSTR("self.%@.value < %@"), v4, &off_10016EC48));
  v22 = (void *)v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v5, CFSTR("self.%@.value < %@"), v5, &off_10016EC48));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:withFormat:](_CDContextualPredicate, "predicateForKeyPath:withFormat:", v6, CFSTR("self.%@.value < %@"), v6, &off_10016EC60));
  v27[0] = v21;
  v27[1] = v20;
  v27[2] = v19;
  v27[3] = v18;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate andPredicateWithSubpredicates:](_CDContextualPredicate, "andPredicateWithSubpredicates:", v7));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100092068;
  v26[3] = &unk_10015DA08;
  v26[4] = self;
  v9 = objc_retainBlock(v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.dasd.blueListEnable"), v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate notPredicateWithSubpredicate:](_CDContextualPredicate, "notPredicateWithSubpredicate:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.dasd.blueListEnable"), v11, v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v17));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.dasd.blueListPlugin"), v13, v9));

  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v10);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v12);
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v14);
  -[_DASBlueListManager updateBlueListStatus:](self, "updateBlueListStatus:", -[_DASBlueListManager shouldBlueListPushes](self, "shouldBlueListPushes"));
  global_queue = dispatch_get_global_queue(-32768, 0);
  v16 = objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100092180;
  handler[3] = &unk_10015D9B8;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.lowpowermode", &self->_lpmNotifyToken, v16, handler);

}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_CDContextualKeyPath)blueListKeyPath
{
  return self->_blueListKeyPath;
}

- (void)setBlueListKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_blueListKeyPath, a3);
}

- (_CDContextualKeyPath)pushBudgetKeyPath
{
  return self->_pushBudgetKeyPath;
}

- (void)setPushBudgetKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_pushBudgetKeyPath, a3);
}

- (_CDContextualKeyPath)pushBudgetResetKeyPath
{
  return self->_pushBudgetResetKeyPath;
}

- (void)setPushBudgetResetKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_pushBudgetResetKeyPath, a3);
}

- (int64_t)pushBudget
{
  return self->_pushBudget;
}

- (void)setPushBudget:(int64_t)a3
{
  self->_pushBudget = a3;
}

- (OS_dispatch_source)budgetResetTimer
{
  return self->_budgetResetTimer;
}

- (void)setBudgetResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_budgetResetTimer, a3);
}

- (BOOL)blueListEnabled
{
  return self->_blueListEnabled;
}

- (void)setBlueListEnabled:(BOOL)a3
{
  self->_blueListEnabled = a3;
}

- (int)lpmNotifyToken
{
  return self->_lpmNotifyToken;
}

- (void)setLpmNotifyToken:(int)a3
{
  self->_lpmNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetResetTimer, 0);
  objc_storeStrong((id *)&self->_pushBudgetResetKeyPath, 0);
  objc_storeStrong((id *)&self->_pushBudgetKeyPath, 0);
  objc_storeStrong((id *)&self->_blueListKeyPath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
