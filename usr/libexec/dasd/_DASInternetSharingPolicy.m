@implementation _DASInternetSharingPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 < _DASSchedulingPriorityUtility
    && (objc_msgSend(v3, "requiresNetwork") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "requiresDeviceInactivity");
  }

  return v5;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (_DASInternetSharingPolicy)init
{
  _DASInternetSharingPolicy *v2;
  _DASInternetSharingPolicy *v3;
  NSString *policyName;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *wirelessModemDynamicStoreQueue;
  NSObject *v9;
  _QWORD block[4];
  _DASInternetSharingPolicy *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_DASInternetSharingPolicy;
  v2 = -[_DASInternetSharingPolicy init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Internet Sharing Policy");

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.dasd.wirelessModemDynamicStoreQueue", v6);
    wirelessModemDynamicStoreQueue = v3->_wirelessModemDynamicStoreQueue;
    v3->_wirelessModemDynamicStoreQueue = (OS_dispatch_queue *)v7;

    v9 = v3->_wirelessModemDynamicStoreQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004CD5C;
    block[3] = &unk_10015D4E0;
    v12 = v3;
    dispatch_async(v9, block);

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D008;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB6E0 != -1)
    dispatch_once(&qword_1001AB6E0, block);
  return (id)qword_1001AB6E8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  _DASPolicyResponseRationale *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Internet Sharing Policy"));
  if (-[_DASInternetSharingPolicy enabled](self, "enabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("InternetSharingActive = %@"), &off_10016E738));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v5, "addRationaleWithCondition:", v6);

    v7 = 33;
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v7, v5, (double)0x384uLL));

  return v8;
}

- (void)handleWirelessModemDynamicStoreChanged
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID v5;
  const __CFArray *Value;
  const __CFArray *v7;
  const void *ValueAtIndex;
  const __CFDictionary *v9;
  const void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _DWORD v14[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_wirelessModemDynamicStoreQueue);
  v3 = (const __CFDictionary *)SCDynamicStoreCopyValue(self->_wirelessModemDynamicStore, self->_wirelessModemDynamicStoreSharingKey);
  if (!v3)
    return;
  v4 = v3;
  v5 = CFGetTypeID(v3);
  if (v5 != CFDictionaryGetTypeID())
    goto LABEL_11;
  Value = (const __CFArray *)CFDictionaryGetValue(v4, CFSTR("InternalInterfaces"));
  v7 = Value;
  if (!Value)
    goto LABEL_12;
  if (!CFArrayGetCount(Value)
    || (ValueAtIndex = CFArrayGetValueAtIndex(v7, 0),
        !-[_DASInternetSharingPolicy hasStateForNetworkType:interfaceName:](self, "hasStateForNetworkType:interfaceName:", kSCEntNetIPv4, ValueAtIndex))&& !-[_DASInternetSharingPolicy hasStateForNetworkType:interfaceName:](self, "hasStateForNetworkType:interfaceName:", kSCEntNetIPv6, ValueAtIndex))
  {
LABEL_11:
    LODWORD(v7) = 0;
    goto LABEL_12;
  }
  v9 = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("Hosts"));
  v7 = v9;
  if (v9)
  {
    if (CFDictionaryGetCount(v9))
    {
      v10 = CFDictionaryGetValue(v7, CFSTR("Current"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = v11;
      if (v11)
        LODWORD(v7) = objc_msgSend(v11, "intValue");
      else
        LODWORD(v7) = 0;

      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  if (-[_DASInternetSharingPolicy enabled](self, "enabled") != (int)v7 > 0)
  {
    -[_DASInternetSharingPolicy setEnabled:](self, "setEnabled:", (int)v7 > 0);
    v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("InternetSharingPolicy")));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109120;
      v14[1] = (int)v7 > 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "InternetSharing in use: %d", (uint8_t *)v14, 8u);
    }

  }
  CFRelease(v4);
}

- (BOOL)hasStateForNetworkType:(__CFString *)a3 interfaceName:(__CFString *)a4
{
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v6;
  CFPropertyListRef v7;
  BOOL v8;

  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, a4, a3);
  if (!NetworkInterfaceEntity)
    return 0;
  v6 = NetworkInterfaceEntity;
  v7 = SCDynamicStoreCopyValue(self->_wirelessModemDynamicStore, NetworkInterfaceEntity);
  v8 = v7 != 0;
  if (v7)
    CFRelease(v7);
  CFRelease(v6);
  return v8;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (__SCDynamicStore)wirelessModemDynamicStore
{
  return self->_wirelessModemDynamicStore;
}

- (void)setWirelessModemDynamicStore:(__SCDynamicStore *)a3
{
  self->_wirelessModemDynamicStore = a3;
}

- (OS_dispatch_queue)wirelessModemDynamicStoreQueue
{
  return self->_wirelessModemDynamicStoreQueue;
}

- (void)setWirelessModemDynamicStoreQueue:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessModemDynamicStoreQueue, a3);
}

- (__CFString)wirelessModemDynamicStoreSharingKey
{
  return self->_wirelessModemDynamicStoreSharingKey;
}

- (void)setWirelessModemDynamicStoreSharingKey:(__CFString *)a3
{
  self->_wirelessModemDynamicStoreSharingKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessModemDynamicStoreQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
