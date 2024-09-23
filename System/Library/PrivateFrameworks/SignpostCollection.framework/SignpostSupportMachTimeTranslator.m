@implementation SignpostSupportMachTimeTranslator

void __81__SignpostSupportMachTimeTranslator_Collection___globalNotificationDispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("SignpostSupportMachTimeTranslation sleep/wake notification queue", 0);
  v1 = (void *)_globalNotificationDispatchQueue_notificationQueue;
  _globalNotificationDispatchQueue_notificationQueue = (uint64_t)v0;

}

void __68__SignpostSupportMachTimeTranslator_Collection___timeTranslationLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SignpostSupport", "TimeTranslation");
  v1 = (void *)_timeTranslationLog_timeTranslationLog;
  _timeTranslationLog_timeTranslationLog = (uint64_t)v0;

}

void __77__SignpostSupportMachTimeTranslator_Collection___addListeningTimeTranslator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  IONotificationPort *v5;
  NSObject *v6;
  IONotificationPortRef thePortRef;

  v2 = (void *)gListeningTimeTranslators;
  if (!gListeningTimeTranslators)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)gListeningTimeTranslators;
    gListeningTimeTranslators = v3;

    v2 = (void *)gListeningTimeTranslators;
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend((id)gListeningTimeTranslators, "count") == 1)
  {
    thePortRef = 0;
    gRootDomainConnect = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)_SignpostSupportMachTimeTranslatorPowerChanged, &gNotifier);
    v5 = thePortRef;
    objc_msgSend(*(id *)(a1 + 40), "_globalNotificationDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    IONotificationPortSetDispatchQueue(v5, v6);

    gNotificationPort = (uint64_t)thePortRef;
  }
}

void __80__SignpostSupportMachTimeTranslator_Collection___removeListeningTimeTranslator___block_invoke(uint64_t a1)
{
  void *v2;

  if (gListeningTimeTranslators && objc_msgSend((id)gListeningTimeTranslators, "count"))
  {
    objc_msgSend((id)gListeningTimeTranslators, "removeObject:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend((id)gListeningTimeTranslators, "count"))
    {
      IODeregisterForSystemPower(&gNotifier);
      IONotificationPortDestroy((IONotificationPortRef)gNotificationPort);
      v2 = (void *)gListeningTimeTranslators;
      gListeningTimeTranslators = 0;

    }
  }
}

@end
