@implementation VUINetworkUtilities

void __37__VUINetworkUtilities_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_8;
  sharedInstance_sharedInstance_8 = v0;

}

- (VUINetworkUtilities)init
{
  VUINetworkUtilities *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *networkUtilityQueue;
  void *v5;
  id v6;
  uint64_t v7;
  RadiosPreferences *radioPrefs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUINetworkUtilities;
  v2 = -[VUINetworkUtilities init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VUINetworkUtility", 0);
    networkUtilityQueue = v2->_networkUtilityQueue;
    v2->_networkUtilityQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", v2);

    v6 = objc_alloc(MEMORY[0x1E0CFA9B8]);
    v7 = objc_msgSend(v6, "initWithQueue:", MEMORY[0x1E0C80D38]);
    radioPrefs = v2->_radioPrefs;
    v2->_radioPrefs = (RadiosPreferences *)v7;

    -[RadiosPreferences setDelegate:](v2->_radioPrefs, "setDelegate:", v2);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21 != -1)
    dispatch_once(&sharedInstance_onceToken_21, &__block_literal_global_100);
  return (id)sharedInstance_sharedInstance_8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[RadiosPreferences setDelegate:](self->_radioPrefs, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)VUINetworkUtilities;
  -[VUINetworkUtilities dealloc](&v4, sel_dealloc);
}

- (BOOL)isNetworkReachable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRemoteServerLikelyReachable");

  return v3;
}

- (BOOL)isAirplaneModeEnabled
{
  return -[RadiosPreferences airplaneMode](self->_radioPrefs, "airplaneMode");
}

- (NSString)networkType
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");
  v4 = CFSTR("Unknown");
  if (v3 > 99)
  {
    if (v3 > 1000)
    {
      v5 = CFSTR("Bridged WiFi");
      v6 = CFSTR("Wired Ethernet");
      v8 = CFSTR("Other");
      if (v3 != 3000)
        v8 = CFSTR("Unknown");
      if (v3 != 2000)
        v6 = v8;
      v7 = v3 == 1001;
    }
    else
    {
      if (v3 == 100)
        goto LABEL_3;
      v5 = CFSTR("Bluetooth");
      v6 = CFSTR("WiFi");
      if (v3 != 1000)
        v6 = CFSTR("Unknown");
      v7 = v3 == 500;
    }
    if (v7)
      v4 = v5;
    else
      v4 = v6;
  }
  else if ((unint64_t)(v3 - 1) < 8)
  {
LABEL_3:
    v4 = CFSTR("Cellular");
  }

  return &v4->isa;
}

- (void)_notifyObservers
{
  NSObject *networkUtilityQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  networkUtilityQueue = self->_networkUtilityQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__VUINetworkUtilities__notifyObservers__block_invoke;
  v4[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, &location);
  dispatch_async(networkUtilityQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__VUINetworkUtilities__notifyObservers__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isNetworkReachable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("isNetworkReachable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isAirplaneModeEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v3, CFSTR("isInAirplaneMode"));

  objc_msgSend(WeakRetained, "networkType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v4, CFSTR("NetworkType"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUINetworkPropertiesChangedNotification"), WeakRetained, v1);

}

- (OS_dispatch_queue)networkUtilityQueue
{
  return self->_networkUtilityQueue;
}

- (void)setNetworkUtilityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_networkUtilityQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkUtilityQueue, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

@end
