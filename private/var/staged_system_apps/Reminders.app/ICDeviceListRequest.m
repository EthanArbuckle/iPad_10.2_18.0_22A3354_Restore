@implementation ICDeviceListRequest

- (ICDeviceListRequest)initWithAccount:(id)a3
{
  id v5;
  ICDeviceListRequest *v6;
  ICDeviceListRequest *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *workSemaphore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDeviceListRequest;
  v6 = -[ICDeviceListRequest init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = dispatch_semaphore_create(0);
    workSemaphore = v7->_workSemaphore;
    v7->_workSemaphore = (OS_dispatch_semaphore *)v8;

  }
  return v7;
}

- (BOOL)anyDeviceNeedsUpgrade
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest devices](self, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "upgraded"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)anyDeviceNotUpgradable
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest devices](self, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "upgradable"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)anyOSXDeviceNotUpgraded
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest devices](self, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isOSXDevice") && !objc_msgSend(v6, "upgraded"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)waitForFetchWithTimeout:(double)a3
{
  ICDeviceListRequest *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;

  v4 = self;
  v5 = objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest workSemaphore](self, "workSemaphore"));
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_semaphore_wait(v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest devices](v4, "devices"));
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)AACloudKitDevicesListRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest account](self, "account"));
  v7 = objc_msgSend(v5, "initWithAccount:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032C14;
  v9[3] = &unk_1005EA088;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performRequestWithHandler:", v9);

}

- (void)fetchICloudDevicesWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@;%@"), v7, v8));

  v10 = objc_alloc((Class)AADeviceListRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceListRequest account](self, "account"));
  v12 = objc_msgSend(v10, "initWithAccount:", v11);

  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100032F84;
  v16[3] = &unk_1005EA0B0;
  objc_copyWeak(&v20, &location);
  v13 = v6;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v4;
  v19 = v15;
  objc_msgSend(v12, "performRequestWithHandler:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)fetchWithCompletionBlock:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033390;
  v8[3] = &unk_1005EA178;
  v8[4] = self;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

+ (id)filteredDevices:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v6 = (void *)objc_opt_new(NSMutableArray, v4, v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "shouldBeHidden", (_QWORD)v15) & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = objc_msgSend(v6, "copy");
  return v13;
}

+ (id)setOfDeviceNamesFromDevices:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name", (_QWORD)v14));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)combineICloudDevices:(id)a3 withCloudKitDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setOfDeviceNamesFromDevices:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name", (_QWORD)v20));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          v18 = objc_msgSend(v8, "containsObject:", v17);

          if ((v18 & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v9;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)didGetICloudDeviceList
{
  return self->_didGetICloudDeviceList;
}

- (void)setDidGetICloudDeviceList:(BOOL)a3
{
  self->_didGetICloudDeviceList = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (OS_dispatch_semaphore)workSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void)setModelDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_workSemaphore, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
