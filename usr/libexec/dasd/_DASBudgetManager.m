@implementation _DASBudgetManager

- (void)reportActivityNoLongerRunning:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widgetBudgetID"));

  if (v4)
    -[_DASWidgetRefreshBudgetManager reportActivityNoLongerRunning:](self->_widgetRefreshBudgetManager, "reportActivityNoLongerRunning:", v5);
  -[_DASSystemBudgetManager reportActivityNoLongerRunning:](self->_systemBudgetManager, "reportActivityNoLongerRunning:", v5);

}

- (_DASBudgetManager)init
{
  _DASBudgetManager *v2;
  uint64_t v3;
  _DASSystemBudgetManager *systemBudgetManager;
  uint64_t v5;
  _DASWidgetRefreshBudgetManager *widgetRefreshBudgetManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASBudgetManager;
  v2 = -[_DASBudgetManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASSystemBudgetManager sharedInstance](_DASSystemBudgetManager, "sharedInstance"));
    systemBudgetManager = v2->_systemBudgetManager;
    v2->_systemBudgetManager = (_DASSystemBudgetManager *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager sharedInstance](_DASWidgetRefreshBudgetManager, "sharedInstance"));
    widgetRefreshBudgetManager = v2->_widgetRefreshBudgetManager;
    v2->_widgetRefreshBudgetManager = (_DASWidgetRefreshBudgetManager *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F520;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABB40 != -1)
    dispatch_once(&qword_1001ABB40, block);
  return (id)qword_1001ABB48;
}

- (id)budgetKeyPathForBudgetName:(id)a3
{
  return -[_DASSystemBudgetManager budgetKeyPathForBudgetName:](self->_systemBudgetManager, "budgetKeyPathForBudgetName:", a3);
}

- (id)allBudgets
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager allBudgets](self->_systemBudgetManager, "allBudgets"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager allBudgets](self->_widgetRefreshBudgetManager, "allBudgets"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (double)balanceForBudgetWithName:(id)a3
{
  _DASWidgetRefreshBudgetManager *widgetRefreshBudgetManager;
  id v5;
  unsigned int v6;
  uint64_t v7;
  double v8;
  double v9;

  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  v5 = a3;
  v6 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:](widgetRefreshBudgetManager, "managesBudgetWithName:", v5);
  v7 = 8;
  if (v6)
    v7 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "balanceForBudgetWithName:", v5);
  v9 = v8;

  return v9;
}

- (double)capacityForBudgetWithName:(id)a3
{
  _DASWidgetRefreshBudgetManager *widgetRefreshBudgetManager;
  id v5;
  unsigned int v6;
  uint64_t v7;
  double v8;
  double v9;

  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  v5 = a3;
  v6 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:](widgetRefreshBudgetManager, "managesBudgetWithName:", v5);
  v7 = 8;
  if (v6)
    v7 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "capacityForBudgetWithName:", v5);
  v9 = v8;

  return v9;
}

- (void)reinstantiateConfiguredBudgets
{
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0)
    -[_DASWidgetRefreshBudgetManager reinstantiateConfiguredBudgets](self->_widgetRefreshBudgetManager, "reinstantiateConfiguredBudgets");
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0)
    -[_DASSystemBudgetManager reinstantiateConfiguredBudgets](self->_systemBudgetManager, "reinstantiateConfiguredBudgets");
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  _DASWidgetRefreshBudgetManager *widgetRefreshBudgetManager;
  unsigned int v7;
  uint64_t v8;
  id v9;

  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  v9 = a4;
  v7 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:](widgetRefreshBudgetManager, "managesBudgetWithName:", v9);
  v8 = 8;
  if (v7)
    v8 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "setBalance:forBudgetWithName:", v9, a3);

}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  _DASWidgetRefreshBudgetManager *widgetRefreshBudgetManager;
  unsigned int v7;
  uint64_t v8;
  id v9;

  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  v9 = a4;
  v7 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:](widgetRefreshBudgetManager, "managesBudgetWithName:", v9);
  v8 = 8;
  if (v7)
    v8 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "decrementBy:forBudgetWithName:", v9, a3);

}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  _DASWidgetRefreshBudgetManager *widgetRefreshBudgetManager;
  unsigned int v7;
  uint64_t v8;
  id v9;

  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  v9 = a4;
  v7 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:](widgetRefreshBudgetManager, "managesBudgetWithName:", v9);
  v8 = 8;
  if (v7)
    v8 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "setCapacity:forBudgetWithName:", v9, a3);

}

- (BOOL)isWidgetRefreshBudget:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(_DASWidgetRefreshBudget);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (void)reportActivityRunning:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widgetBudgetID"));

  if (v4)
    -[_DASWidgetRefreshBudgetManager reportActivityRunning:](self->_widgetRefreshBudgetManager, "reportActivityRunning:", v5);
  -[_DASSystemBudgetManager reportActivityRunning:](self->_systemBudgetManager, "reportActivityRunning:", v5);

}

- (void)reportActivityRunningWithParameters:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0)
    -[_DASWidgetRefreshBudgetManager reportActivityRunningWithParameters:](self->_widgetRefreshBudgetManager, "reportActivityRunningWithParameters:", v5);
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0)
    -[_DASSystemBudgetManager reportActivityRunningWithParameters:](self->_systemBudgetManager, "reportActivityRunningWithParameters:", v5);

}

- (void)reportActivityNoLongerRunningWithParameters:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0)
    -[_DASWidgetRefreshBudgetManager reportActivityNoLongerRunningWithParameters:](self->_widgetRefreshBudgetManager, "reportActivityNoLongerRunningWithParameters:", v5);
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0)
    -[_DASSystemBudgetManager reportActivityNoLongerRunningWithParameters:](self->_systemBudgetManager, "reportActivityNoLongerRunningWithParameters:", v5);

}

- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0)
    -[_DASWidgetRefreshBudgetManager reportUpdateForActivity:withDataConsumed:](self->_widgetRefreshBudgetManager, "reportUpdateForActivity:withDataConsumed:", v8, v7);
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0)
    -[_DASSystemBudgetManager reportUpdateForActivity:withDataConsumed:](self->_systemBudgetManager, "reportUpdateForActivity:withDataConsumed:", v8, v7);

}

- (_DASSystemBudgetManager)systemBudgetManager
{
  return self->_systemBudgetManager;
}

- (void)setSystemBudgetManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemBudgetManager, a3);
}

- (_DASWidgetRefreshBudgetManager)widgetRefreshBudgetManager
{
  return self->_widgetRefreshBudgetManager;
}

- (void)setWidgetRefreshBudgetManager:(id)a3
{
  objc_storeStrong((id *)&self->_widgetRefreshBudgetManager, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDictionary)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
  objc_storeStrong((id *)&self->_budgets, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_budgets, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_widgetRefreshBudgetManager, 0);
  objc_storeStrong((id *)&self->_systemBudgetManager, 0);
}

@end
