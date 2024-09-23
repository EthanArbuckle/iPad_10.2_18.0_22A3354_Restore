@implementation STKAlertSessionManagerStartInternal

void __STKAlertSessionManagerStartInternal_block_invoke()
{
  STKSIMToolkitAlertSessionManager *v0;
  void *v1;
  STKClass0SMSAlertSessionManager *v2;
  void *v3;
  STKUSSDAlertSessionManager *v4;
  void *v5;
  STKCarrierSubscriptionMonitor *v6;

  NSLog(CFSTR("STK sessions are created"));
  v6 = objc_alloc_init(STKCarrierSubscriptionMonitor);
  v0 = -[STKSIMToolkitAlertSessionManager initWithSubscriptionMonitor:]([STKSIMToolkitAlertSessionManager alloc], "initWithSubscriptionMonitor:", v6);
  v1 = (void *)__stkSessionManager;
  __stkSessionManager = (uint64_t)v0;

  v2 = -[STKClass0SMSAlertSessionManager initWithSubscriptionMonitor:]([STKClass0SMSAlertSessionManager alloc], "initWithSubscriptionMonitor:", v6);
  v3 = (void *)__class0SessionManager;
  __class0SessionManager = (uint64_t)v2;

  v4 = -[STKUSSDAlertSessionManager initWithSubscriptionMonitor:]([STKUSSDAlertSessionManager alloc], "initWithSubscriptionMonitor:", v6);
  v5 = (void *)__ussdSessionManager;
  __ussdSessionManager = (uint64_t)v4;

}

@end
