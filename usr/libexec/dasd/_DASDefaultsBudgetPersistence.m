@implementation _DASDefaultsBudgetPersistence

- (_DASDefaultsBudgetPersistence)init
{
  _DASDefaultsBudgetPersistence *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  os_log_t v7;
  OS_os_log *log;
  NSUserDefaults *v9;
  NSUserDefaults *defaults;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *budgetsInfo;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  NSDate *lastModulationDate;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_DASDefaultsBudgetPersistence;
  v2 = -[_DASDefaultsBudgetPersistence init](&v19, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.dasd.budgetPersistence.defaultsqueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = os_log_create("com.apple.duetactivityscheduler", "budgetDefaults");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

    v9 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.widgetRefreshBudgets"));
    defaults = v2->_defaults;
    v2->_defaults = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("budgets")));
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    budgetsInfo = v2->_budgetsInfo;
    v2->_budgetsInfo = v12;

    if (!v2->_budgetsInfo)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v15 = v2->_budgetsInfo;
      v2->_budgetsInfo = v14;

    }
    v16 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("lastModulation")));
    lastModulationDate = v2->_lastModulationDate;
    v2->_lastModulationDate = (NSDate *)v16;

  }
  return v2;
}

+ (id)persistence
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000237E8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB410 != -1)
    dispatch_once(&qword_1001AB410, block);
  return (id)qword_1001AB418;
}

- (id)loadBudgetsWithExpectedNames:(id)a3
{
  id v4;
  id v5;
  OS_dispatch_queue *queue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000238C8;
  block[3] = &unk_10015D530;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)saveBudgets:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023BE4;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)updateBudget:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023DE0;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)saveModulationDate:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023EEC;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (NSDate)lastModulationDate
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100023FD8;
  v10 = sub_100023FE8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023FF0;
  v5[3] = &unk_10015D580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (id)convertNameFromFullToCompact:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "copy");
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.dasd.widget")))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.dasd.widget"), "length")));

    v4 = (id)v5;
  }

  return v4;
}

- (id)convertNameFromCompactToFull:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.dasd.widget"), a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)budgetsInfo
{
  return self->_budgetsInfo;
}

- (void)setBudgetsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_budgetsInfo, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setLastModulationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModulationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModulationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_budgetsInfo, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
