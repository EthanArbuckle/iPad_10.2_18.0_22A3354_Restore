@implementation LTPowerLogger

void __32___LTPowerLogger_sharedInstance__block_invoke()
{
  _LTPowerLogger *v0;
  void *v1;

  v0 = objc_alloc_init(_LTPowerLogger);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

void __65___LTPowerLogger_logTranslateRequestEvent_requestType_routeType___block_invoke(_QWORD *a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = &stru_251A15610;
  v2 = (void *)a1[5];
  if (a1[4])
    v1 = (const __CFString *)a1[4];
  v6[0] = v1;
  v5[0] = CFSTR("processName");
  v5[1] = CFSTR("requestType");
  objc_msgSend(v2, "_maskForRequestType:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

@end
