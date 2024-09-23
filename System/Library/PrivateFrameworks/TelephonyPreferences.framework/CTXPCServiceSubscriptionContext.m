@implementation CTXPCServiceSubscriptionContext

void __72__CTXPCServiceSubscriptionContext_TelephonyPreferences__telephonyClient__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0CA6E38]);
  v1 = objc_msgSend(v0, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v2 = (void *)telephonyClient_telephonyClient;
  telephonyClient_telephonyClient = v1;

}

@end
