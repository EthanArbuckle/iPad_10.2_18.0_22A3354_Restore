@implementation HKSPHealthStoreProvider

+ (id)_initializedLocalDeviceHealthStore
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  objc_msgSend(v2, "setSourceBundleIdentifier:", CFSTR("com.apple.private.health.localdevice"));
  objc_msgSend(v2, "resume");
  return v2;
}

- (HKSPHealthStoreProvider)initWithLocalDeviceHealthStore
{
  void *v3;
  void *v4;
  HKSPHealthStoreProvider *v5;

  objc_msgSend((id)objc_opt_class(), "_initializedLocalDeviceHealthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA85B8]), "initWithHealthStore:", v3);
  v5 = -[HKSPHealthStoreProvider initWithSleepHealthStore:healthStore:](self, "initWithSleepHealthStore:healthStore:", v4, v3);

  return v5;
}

- (HKSPHealthStoreProvider)initWithSleepHealthStore:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  HKSPHealthStoreProvider *v9;
  HKSPHealthStoreProvider *v10;
  HKSPHealthStoreProvider *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKSPHealthStoreProvider;
  v9 = -[HKSPHealthStoreProvider init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sleepHealthStore, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = v10;
  }

  return v10;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSleepHealthStore)sleepHealthStore
{
  return self->_sleepHealthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepHealthStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
