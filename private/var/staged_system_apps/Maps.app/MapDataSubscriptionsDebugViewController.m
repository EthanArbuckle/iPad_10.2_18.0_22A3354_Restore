@implementation MapDataSubscriptionsDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  UITableViewDiffableDataSource *v7;
  UITableViewDiffableDataSource *dataSource;
  UITableViewDiffableDataSource *v9;
  void *v10;
  _MapDataSubscriptionStateObserverRegistry *v11;
  _MapDataSubscriptionStateObserverRegistry *observerRegistry;
  _MapDataSubscriptionStateObserverRegistry *v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t, uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MapDataSubscriptionsDebugViewController;
  -[MapDataSubscriptionsDebugViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionsDebugViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("subscription"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionsDebugViewController tableView](self, "tableView"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("map"));

  objc_initWeak(&location, self);
  v5 = objc_alloc((Class)UITableViewDiffableDataSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionsDebugViewController tableView](self, "tableView"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1005C51A0;
  v17 = &unk_1011BCB00;
  objc_copyWeak(&v18, &location);
  v7 = (UITableViewDiffableDataSource *)objc_msgSend(v5, "initWithTableView:cellProvider:", v6, &v14);
  dataSource = self->_dataSource;
  self->_dataSource = v7;

  v9 = self->_dataSource;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionsDebugViewController tableView](self, "tableView", v14, v15, v16, v17));
  objc_msgSend(v10, "setDataSource:", v9);

  v11 = objc_alloc_init(_MapDataSubscriptionStateObserverRegistry);
  observerRegistry = self->_observerRegistry;
  self->_observerRegistry = v11;

  v13 = self->_observerRegistry;
  if (v13)
    objc_storeStrong((id *)&v13->_dataSource, self->_dataSource);
  -[MapDataSubscriptionsDebugViewController setTitle:](self, "setTitle:", CFSTR("Data Subscriptions"));
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  GEOMapDataSubscriptionManager *v4;
  GEOMapDataSubscriptionManager *subscriptionManager;
  const char *v6;
  id v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MapDataSubscriptionsDebugViewController;
  -[MapDataSubscriptionsDebugViewController viewWillAppear:](&v14, "viewWillAppear:", a3);
  if (!self->_subscriptionManager)
  {
    v4 = (GEOMapDataSubscriptionManager *)objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    subscriptionManager = self->_subscriptionManager;
    self->_subscriptionManager = v4;

  }
  objc_initWeak(&location, self);
  v6 = (const char *)GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification;
  v7 = &_dispatch_main_q;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1005C5344;
  v11 = &unk_1011BCB28;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v6, &self->_subscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, &v8);

  -[MapDataSubscriptionsDebugViewController _reloadSubscriptions](self, "_reloadSubscriptions", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapDataSubscriptionsDebugViewController;
  -[MapDataSubscriptionsDebugViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  notify_cancel(self->_subscriptionsChangedNotifyToken);
  self->_subscriptionsChangedNotifyToken = 0;
}

- (id)_configuredCellForSubscriptionIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  NSArray *v35;
  id v36;
  _QWORD v37[4];
  NSArray *v38;
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v4 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = self->_subscriptions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v42;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subscription"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v6 == (id)++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    v13 = v9;

    if (!v13)
    {
      v6 = 0;
      goto LABEL_19;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionsDebugViewController tableView](self, "tableView"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dequeueReusableCellWithIdentifier:", CFSTR("subscription")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray state](v13, "state"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subscription](v13, "subscription"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    objc_msgSend(v16, "setText:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subscription](v13, "subscription"));
    v20 = GEOMapDataSubscriptionPolicyAsString(objc_msgSend(v19, "policy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = GEOMapDataSubscriptionDataTypeAsString(objc_msgSend(v19, "dataTypes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ • %@"), v21, v23));

    objc_msgSend(v16, "setSecondaryText:", v24);
    if (objc_msgSend(v15, "loadState"))
    {
      objc_msgSend(v6, "setAccessoryView:", 0);
      objc_msgSend(v6, "setAccessoryType:", 1);
    }
    else
    {
      objc_initWeak(&location, self);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "downloadProgress"));
      v26 = v25 == 0;

      if (v26)
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1005C591C;
        v34[3] = &unk_1011ACEC0;
        objc_copyWeak(&v36, &location);
        v35 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v34));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0, v30));

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.and.arrow.down")));
        objc_msgSend(v31, "setImage:forState:", v32, 0);

        objc_msgSend(v31, "sizeToFit");
        objc_msgSend(v6, "setAccessoryView:", v31);

        objc_destroyWeak(&v36);
      }
      else
      {
        v27 = objc_alloc_init((Class)MUCircleProgressObservingView);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("stop.fill")));
        objc_msgSend(v27, "setImage:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "downloadProgress"));
        objc_msgSend(v27, "setProgress:", v29);

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1005C58A0;
        v37[3] = &unk_1011AD1E8;
        objc_copyWeak(&v39, &location);
        v38 = v13;
        objc_msgSend(v27, "setPrimaryAction:", v37);
        objc_msgSend(v6, "setAccessoryView:", v27);

        objc_destroyWeak(&v39);
      }
      objc_destroyWeak(&location);
    }
    objc_msgSend(v6, "setContentConfiguration:", v16);

    v5 = v13;
  }
LABEL_18:

LABEL_19:
  return v6;
}

- (void)_reloadSubscriptions
{
  GEOMapDataSubscriptionManager *subscriptionManager;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  subscriptionManager = self->_subscriptionManager;
  v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005C5A78;
  v5[3] = &unk_1011ADF70;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[GEOMapDataSubscriptionManager fetchAllSubscriptionsWithCallbackQueue:completionHandler:](subscriptionManager, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", &_dispatch_main_q, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  MapDataSubscriptionDetailsDebugViewController *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "section"))
  {
    v8 = objc_msgSend(v7, "row");
    if (v8 >= (id)-[NSArray count](self->_subscriptions, "count"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: (NSUInteger)indexPath.row < _subscriptions.count", v12, 2u);
      }
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_subscriptions, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      v10 = -[MapDataSubscriptionDetailsDebugViewController initWithSubscription:]([MapDataSubscriptionDetailsDebugViewController alloc], "initWithSubscription:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionsDebugViewController navigationController](self, "navigationController"));
      objc_msgSend(v11, "pushViewController:animated:", v10, 1);

      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_observerRegistry, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
}

@end
