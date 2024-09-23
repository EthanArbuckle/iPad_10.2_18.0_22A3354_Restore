@implementation NSThread(SCRCThread)

- (void)registerForStopNotification
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v3 = v1;
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SCRCThreadKey"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend((id)_RegistryLock, "lock");
      objc_msgSend((id)_StoppableThreads, "addObject:", v2);
      objc_msgSend((id)_RegistryLock, "unlock");
    }

    v1 = v3;
  }

}

- (void)unregisterForStopNotification
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v3 = v1;
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SCRCThreadKey"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend((id)_RegistryLock, "lock");
      objc_msgSend((id)_StoppableThreads, "removeObject:", v2);
      objc_msgSend((id)_RegistryLock, "unlock");
    }

    v1 = v3;
  }

}

- (uint64_t)shouldStop
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SCRCThreadKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_shouldStop");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
