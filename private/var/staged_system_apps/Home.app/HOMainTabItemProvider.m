@implementation HOMainTabItemProvider

- (HOMainTabItemProvider)initWithHome:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HOMainTabItemProvider *v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_msgSend(objc_alloc((Class)HFStaticItem), "initWithResultsBlock:", &stru_1000B5F48);
  objc_msgSend(v6, "addObject:", v7);
  objc_initWeak(&location, self);
  v8 = objc_alloc((Class)HFStaticItem);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B438;
  v23[3] = &unk_1000B5F70;
  objc_copyWeak(&v25, &location);
  v9 = v5;
  v24 = v9;
  v10 = objc_msgSend(v8, "initWithResultsBlock:", v23);
  objc_msgSend(v6, "addObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFStoreLocaleAvailability getAvailabilityDictionary](HFStoreLocaleAvailability, "getAvailabilityDictionary"));
  v12 = objc_alloc((Class)HFStaticItem);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B24C;
  v20[3] = &unk_1000B5F98;
  v13 = v11;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = objc_msgSend(v12, "initWithResultsBlock:", v20);
  objc_msgSend(v6, "addObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  v19.receiver = self;
  v19.super_class = (Class)HOMainTabItemProvider;
  v17 = -[HOMainTabItemProvider initWithItems:](&v19, "initWithItems:", v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a3);
    objc_storeStrong((id *)&v17->_orderedTabItems, v6);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

- (NSArray)orderedTabItems
{
  return self->_orderedTabItems;
}

- (BOOL)_shouldShowTriggerListForHome:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hf_currentUserIsRestrictedGuest") & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "hf_hasAnyVisibleTriggers") & 1) != 0
         || (objc_msgSend(v3, "hf_userCanCreateTrigger") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = HFForceAllowAutomationCreation();
  }

  return v4;
}

- (BOOL)_shouldShowTriggerAboutPageForHome:(id)a3
{
  if ((objc_msgSend(a3, "hf_userIsAllowedToCreateTrigger") & 1) != 0)
    return 1;
  else
    return -[HOMainTabItemProvider _isRunningInDemoMode](self, "_isRunningInDemoMode");
}

- (BOOL)_isRunningInDemoMode
{
  if ((+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode") & 1) != 0)
    return 1;
  else
    return +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled");
}

- (HOMainTabItemProvider)initWithItems:(id)a3
{
  void *v4;
  void *v5;
  HOMainTabItemProvider *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v6 = -[HOMainTabItemProvider initWithHome:](self, "initWithHome:", v5);

  return v6;
}

- (void)setOrderedTabItems:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTabItems, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_orderedTabItems, 0);
}

@end
