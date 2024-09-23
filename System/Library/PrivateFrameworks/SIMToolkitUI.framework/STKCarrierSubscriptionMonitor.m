@implementation STKCarrierSubscriptionMonitor

- (STKCarrierSubscriptionMonitor)init
{
  STKCarrierSubscriptionMonitor *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *subscriptionInfo;
  uint64_t v7;
  NSMutableDictionary *subscriptionContext;
  uint64_t v9;
  CoreTelephonyClient *telephonyClient;
  NSObject *v11;
  _QWORD block[4];
  STKCarrierSubscriptionMonitor *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)STKCarrierSubscriptionMonitor;
  v2 = -[STKCarrierSubscriptionMonitor init](&v15, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v5 = objc_claimAutoreleasedReturnValue();
    subscriptionInfo = v2->_subscriptionInfo;
    v2->_subscriptionInfo = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v2->_subscriptionContext;
    v2->_subscriptionContext = (NSMutableDictionary *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v2->_queue);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v9;

    -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);
    v11 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__STKCarrierSubscriptionMonitor_init__block_invoke;
    block[3] = &unk_24D563080;
    v14 = v2;
    dispatch_sync(v11, block);

  }
  return v2;
}

uint64_t __37__STKCarrierSubscriptionMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriptionInfoDidChange");
}

- (id)subscriptionInfoForSlot:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__STKCarrierSubscriptionMonitor_subscriptionInfoForSlot___block_invoke;
  block[3] = &unk_24D5633D8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__STKCarrierSubscriptionMonitor_subscriptionInfoForSlot___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)subscriptionContextForSlot:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__STKCarrierSubscriptionMonitor_subscriptionContextForSlot___block_invoke;
  block[3] = &unk_24D5633D8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__STKCarrierSubscriptionMonitor_subscriptionContextForSlot___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)numAvailableSubscriptions
{
  return -[NSMutableDictionary count](self->_subscriptionContext, "count");
}

- (void)subscriptionInfoDidChange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216439000, v0, v1, "STKAlertSessionManager: subscriptionInfoDidChange: failed to get subscription info [error] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __58__STKCarrierSubscriptionMonitor_subscriptionInfoDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleChange:", *(_QWORD *)(a1 + 40));
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  CoreTelephonyClient *telephonyClient;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  CoreTelephonyClient *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  CoreTelephonyClient *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  CoreTelephonyClient *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  STKCarrierSubscriptionInfo *v34;
  NSMutableDictionary *subscriptionInfo;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssert();
  STKCommonLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v4;
    _os_log_impl(&dword_216439000, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle did change: %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
  telephonyClient = self->_telephonyClient;
  v40 = 0;
  v8 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:error:](telephonyClient, "copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:error:", v4, &unk_24D56C9B8, v6, &v40);
  v9 = v40;
  if (v9)
  {
    v10 = v9;
    STKCommonLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STKCarrierSubscriptionMonitor carrierBundleChange:].cold.4();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v8, "BOOLValue");
  else
    v12 = 0;
  STKClass0SMSLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v42) = v12;
    _os_log_impl(&dword_216439000, v13, OS_LOG_TYPE_DEFAULT, "Carrier bundle value changed: showClass0SMSOverInCallAlerts = %d", buf, 8u);
  }

  v14 = self->_telephonyClient;
  v39 = 0;
  v15 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v14, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v4, CFSTR("ShowClass0SMSFromField"), v6, &v39);
  v16 = v39;
  if (v16)
  {
    v17 = v16;
    STKCommonLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[STKCarrierSubscriptionMonitor carrierBundleChange:].cold.3();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = objc_msgSend(v15, "BOOLValue");
  else
    v19 = 0;

  v20 = self->_telephonyClient;
  v38 = 0;
  v21 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v20, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v4, CFSTR("USSDFilterPatterns"), v6, &v38);
  v22 = v38;
  if (v22)
  {
    v23 = v22;
    STKCommonLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[STKCarrierSubscriptionMonitor carrierBundleChange:].cold.2();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v21;
    if ((objc_msgSend(v25, "bs_containsObjectPassingTest:", &__block_literal_global_2) & 1) != 0)
      v26 = (id)MEMORY[0x24BDBD1A8];
    else
      v26 = v25;

  }
  else
  {
    v26 = (id)MEMORY[0x24BDBD1A8];
  }

  v27 = self->_telephonyClient;
  v37 = 0;
  v28 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](v27, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v4, CFSTR("USSDFilterSometimesPatterns"), v6, &v37);
  v29 = v37;
  if (v29)
  {
    v30 = v29;
    STKCommonLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[STKCarrierSubscriptionMonitor carrierBundleChange:].cold.1();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v28;
    if ((objc_msgSend(v32, "bs_containsObjectPassingTest:", &__block_literal_global_20) & 1) != 0)
      v33 = (id)MEMORY[0x24BDBD1A8];
    else
      v33 = v32;

  }
  else
  {
    v33 = (id)MEMORY[0x24BDBD1A8];
  }

  v34 = -[STKCarrierSubscriptionInfo initWithShowClass0SMSFromField:canShowClass0SMSOverInCallAlerts:ussdAlwaysFilteredPatterns:ussdSometimesFilteredPatterns:]([STKCarrierSubscriptionInfo alloc], "initWithShowClass0SMSFromField:canShowClass0SMSOverInCallAlerts:ussdAlwaysFilteredPatterns:ussdSometimesFilteredPatterns:", v19, v12, v26, v33);
  subscriptionInfo = self->_subscriptionInfo;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](subscriptionInfo, "setObject:forKeyedSubscript:", v34, v36);

}

BOOL __53__STKCarrierSubscriptionMonitor_carrierBundleChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __53__STKCarrierSubscriptionMonitor_carrierBundleChange___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)carrierBundleChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216439000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get USSDFilterSometimesPatterns [error] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)carrierBundleChange:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216439000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get USSDFilterPatterns [error] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)carrierBundleChange:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216439000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get ShowClass0SMSFromField [error] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)carrierBundleChange:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_216439000, v0, v1, "STKAlertSessionManager: carrierBundleChange: failed to get ShowClass0SMSOverInCallAlerts [error] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
