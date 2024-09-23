@implementation AppleHPMUserClientManager

+ (id)sharedInstance
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_100021800;
  if (!qword_100021800)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_100021800;
    qword_100021800 = (uint64_t)v4;

    v3 = (void *)qword_100021800;
  }
  return v3;
}

- (AppleHPMUserClientManager)init
{
  AppleHPMUserClientManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AppleHPMUserClientManager;
  v2 = -[AppleHPMUserClientManager init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    -[AppleHPMUserClientManager setUserClientSet:](v2, "setUserClientSet:", v3);

    -[AppleHPMUserClientManager findUserClients](v2, "findUserClients");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AppleHPMUserClientManager setUserClientSet:](self, "setUserClientSet:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AppleHPMUserClientManager;
  -[AppleHPMUserClientManager dealloc](&v3, "dealloc");
}

- (id)userClientForRouterID:(unsigned __int8)a3 andRoute:(unint64_t)a4
{
  int v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppleHPMUserClientManager userClientSet](self, "userClientSet", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "routerID") == v5 && objc_msgSend(v11, "routeString") == (id)a4)
        {
          v12 = v11;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (int)findUserClients
{
  const __CFDictionary *v3;
  kern_return_t MatchingServices;
  uint64_t v5;
  uint64_t v6;
  io_iterator_t existing;

  v3 = IOServiceMatching("AppleHPM");
  existing = 0;
  if (!v3)
    return -536870212;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if (!existing)
    return -536870160;
  if (!MatchingServices)
  {
    IOIteratorReset(existing);
    v5 = IOIteratorNext(existing);
    if ((_DWORD)v5)
    {
      v6 = v5;
      do
      {
        -[AppleHPMUserClientManager createUserClientForService:](self, "createUserClientForService:", v6);
        v6 = IOIteratorNext(existing);
      }
      while ((_DWORD)v6);
    }
  }
  if (existing)
    IOObjectRelease(existing);
  return MatchingServices;
}

- (int)createUserClientForService:(unsigned int)a3
{
  uint64_t v3;
  AppleHPMUserClient *v5;
  int v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(AppleHPMUserClient);
  v6 = -[AppleHPMUserClient createUserClientForService:](v5, "createUserClientForService:", v3);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppleHPMUserClientManager userClientSet](self, "userClientSet"));
    objc_msgSend(v7, "addObject:", v5);

  }
  return v6;
}

- (NSMutableOrderedSet)userClientSet
{
  return self->_userClientSet;
}

- (void)setUserClientSet:(id)a3
{
  objc_storeStrong((id *)&self->_userClientSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userClientSet, 0);
}

@end
