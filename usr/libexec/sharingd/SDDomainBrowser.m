@implementation SDDomainBrowser

+ (id)sharedBrowser
{
  if (qword_1007C6C00 != -1)
    dispatch_once(&qword_1007C6C00, &stru_100719D98);
  return (id)qword_1007C6C08;
}

- (SDDomainBrowser)init
{
  SDDomainBrowser *v2;
  SDDomainBrowser *v3;
  OS_dispatch_source *timer;
  NSNetServiceBrowser *domainBrowser;
  NSMutableSet *v6;
  NSMutableSet *domains;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDDomainBrowser;
  v2 = -[SDDomainBrowser init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    timer = v2->_timer;
    v2->_timer = 0;

    v3->_clientCount = 0;
    domainBrowser = v3->_domainBrowser;
    v3->_domainBrowser = 0;

    v3->_sendNotification = 0;
    v6 = objc_opt_new(NSMutableSet);
    domains = v3->_domains;
    v3->_domains = v6;

    v3->_domainTree = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_100719C70, &kCFTypeDictionaryValueCallBacks);
  }
  return v3;
}

- (void)browseAfterDelay:(double)a3
{
  NSObject *timer;
  dispatch_time_t v4;

  timer = self->_timer;
  v4 = sub_10019AAC0(a3);
  sub_10019AB78(timer, v4);
}

- (void)statusChanged:(id)a3
{
  -[SDDomainBrowser browseAfterDelay:](self, "browseAfterDelay:", a3, 0.2);
}

- (void)scheduleBrowser
{
  NSNetServiceBrowser *v3;
  NSNetServiceBrowser *domainBrowser;

  v3 = (NSNetServiceBrowser *)objc_alloc_init((Class)NSNetServiceBrowser);
  domainBrowser = self->_domainBrowser;
  self->_domainBrowser = v3;

  -[NSNetServiceBrowser searchForBrowsableDomains](self->_domainBrowser, "searchForBrowsableDomains");
  -[NSNetServiceBrowser setDelegate:](self->_domainBrowser, "setDelegate:", self);
}

- (void)restart
{
  NSNetServiceBrowser *domainBrowser;

  if (self->_clientCount >= 1)
  {
    -[NSMutableSet removeAllObjects](self->_domains, "removeAllObjects");
    domainBrowser = self->_domainBrowser;
    if (domainBrowser)
      -[NSNetServiceBrowser stop](domainBrowser, "stop");
    CFDictionaryRemoveAllValues(self->_domainTree);
    -[SDDomainBrowser scheduleBrowser](self, "scheduleBrowser");
  }
}

- (id)childrenForNode:(__SFNode *)a3
{
  void *Value;
  const __CFSet *v6;
  uint64_t v7;
  const void *v8;

  if (SFNodeIsRoot(a3))
  {
    Value = (void *)CFDictionaryGetValue(self->_domainTree, &stru_10072FE60);
  }
  else
  {
    v6 = (const __CFSet *)SFNodeCopyKinds(a3);
    if (CFSetContainsValue(v6, kSFNodeKindDomain))
    {
      v8 = (const void *)SFNodeCopyRealName(a3, v7);
      Value = (void *)CFDictionaryGetValue(self->_domainTree, v8);
      CFRelease(v8);
    }
    else
    {
      Value = 0;
    }
    CFRelease(v6);
  }
  return objc_msgSend(Value, "allValues");
}

- (id)displayNameForDomain:(id)a3
{
  __CFString *v3;
  char *v4;
  char *v5;
  __CFString *Mutable;
  unsigned __int8 *v7;
  const __CFString *v8;
  const __CFString *v9;
  __int128 v11;

  v3 = (__CFString *)a3;
  v4 = (char *)-[__CFString length](v3, "length", 0, 0, 0, 0, 0, 0, 0, 0) + 1;
  v5 = (char *)malloc_type_malloc((size_t)v4, 0x25665BCEuLL);
  if (CFStringGetCString(v3, v5, (CFIndex)v4, 0x8000100u))
  {
    Mutable = CFStringCreateMutable(0, 0);
    if (v5 && *v5)
    {
      v7 = (unsigned __int8 *)v5;
      do
      {
        v7 = sub_1001A18A8(v7, (uint64_t)&v11);
        v8 = CFStringCreateWithCString(0, (const char *)&v11, 0x8000100u);
        if (v8)
        {
          v9 = v8;
          CFStringAppend(Mutable, v8);
          CFRelease(v9);
        }
        if (!v7)
          break;
        if (*v7)
          CFStringAppend(Mutable, CFSTR("."));
      }
      while (*v7);
    }
  }
  else
  {
    Mutable = 0;
  }
  free(v5);

  return Mutable;
}

- (void)parseDomain:(id)a3
{
  __CFString *v4;
  id v5;
  char *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  CFStringRef v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  unsigned __int8 *v15;
  CFStringRef v16;
  CFStringRef v17;
  void *Value;
  const void *v19;
  const __CFDictionary *v20;
  void *Mutable;
  void *v22;
  const void *v23;
  char *v24;
  uint64_t v25;
  _QWORD v26[128];
  char cStr[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v4 = (__CFString *)a3;
  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)cStr = 0u;
  v28 = 0u;
  if (v4)
  {
    bzero(v26, 0x400uLL);
    v5 = -[__CFString length](v4, "length");
    v6 = (char *)malloc_type_malloc((size_t)v5 + 1, 0xEAAC5916uLL);
    CFStringGetCString(v4, v6, (CFIndex)v5 + 1, 0x8000100u);
    v7 = 0;
    v6[(_QWORD)v5 - 1] = 0;
    v24 = v6;
    v8 = (unsigned __int8 *)v6;
    while (*v8)
    {
      v9 = v7 + 1;
      v26[v7] = v8;
      v8 = sub_1001A18A8(v8, (uint64_t)cStr);
      v7 = v9;
      if (!v8)
        goto LABEL_7;
    }
    LODWORD(v9) = v7;
LABEL_7:
    v10 = v9 - 1;
    if ((int)v9 >= 1)
    {
      v11 = 0;
      v12 = 0;
      v25 = kSFNodeKindDomain;
      v13 = v9 + 1;
      do
      {
        if (v11)
          CFRelease(v11);
        v14 = (char *)v26[v10];
        v11 = CFStringCreateWithCString(0, v14, 0x8000100u);
        if (v12)
        {
          v15 = sub_1001A18A8((unsigned __int8 *)v14, (uint64_t)cStr);
          v16 = CFStringCreateWithCString(0, cStr, 0x8000100u);
          v17 = CFStringCreateWithCString(0, (const char *)v15, 0x8000100u);
          Value = (void *)CFDictionaryGetValue(self->_domainTree, v17);
          if (!Value)
          {
            Value = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_100719C70, &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(self->_domainTree, v17, Value);
            CFRelease(Value);
          }
          if (!CFDictionaryGetValue((CFDictionaryRef)Value, v16))
          {
            v19 = (const void *)SFNodeCreate(0, v16, v11);
            SFNodeAddDomain(v19, v11);
            SFNodeAddKind(v19, v25);
            SFNodeSetDomain(v19, v17);
            CFDictionarySetValue((CFMutableDictionaryRef)Value, v16, v19);
            CFRelease(v19);
          }
          CFRelease(v16);
          CFRelease(v17);
          v12 = 1;
        }
        else
        {
          v20 = (const __CFDictionary *)CFDictionaryGetValue(self->_domainTree, &stru_10072FE60);
          if (v20)
            v12 = CFDictionaryGetValue(v20, v11) != 0;
          else
            v12 = 0;
        }
        --v13;
        --v10;
      }
      while (v13 > 1);
      if (v11)
      {
        if (!v12)
        {
          Mutable = (void *)CFDictionaryGetValue(self->_domainTree, &stru_10072FE60);
          if (!Mutable)
          {
            Mutable = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_100719C70, &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(self->_domainTree, &stru_10072FE60, Mutable);
            CFRelease(Mutable);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDDomainBrowser displayNameForDomain:](self, "displayNameForDomain:", v11));
          v23 = (const void *)SFNodeCreate(0, v22, v11);
          SFNodeAddDomain(v23, v11);
          SFNodeAddKind(v23, v25);
          CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v11, v23);
          CFRelease(v23);

        }
        CFRelease(v11);
      }
    }
    free(v24);
  }

}

- (void)buildNodes
{
  void *v3;
  uint64_t Count;
  __CFArray *MutableCopy;
  CFIndex i;
  CFRange v7;

  CFDictionaryRemoveAllValues(self->_domainTree);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_domains, "allObjects"));

  if (v3)
  {
    Count = CFArrayGetCount((CFArrayRef)v3);
    MutableCopy = CFArrayCreateMutableCopy(0, Count, (CFArrayRef)v3);
    v7.location = 0;
    v7.length = Count;
    CFArraySortValues(MutableCopy, v7, (CFComparatorFunction)sub_1001A1DB4, self);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
        -[SDDomainBrowser parseDomain:](self, "parseDomain:", CFArrayGetValueAtIndex(MutableCopy, i));
    }
    CFRelease(MutableCopy);
  }
}

- (void)postNotification
{
  id v2;

  if (self->_clientCount >= 1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.DomainsChanged"), 0, 0);

  }
}

- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString"));
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR("local.")) & 1) == 0)
    -[NSMutableSet addObject:](self->_domains, "addObject:", v9);
  if (!a5)
  {
    -[SDDomainBrowser buildNodes](self, "buildNodes");
    -[SDDomainBrowser postNotification](self, "postNotification");
  }

}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  -[NSMutableSet removeObject:](self->_domains, "removeObject:", a4);
  if (!a5)
  {
    -[SDDomainBrowser buildNodes](self, "buildNodes");
    -[SDDomainBrowser postNotification](self, "postNotification");
  }
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a4;
  v6 = browser_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1001A2224((uint64_t)v4, v7);

}

- (void)start
{
  int clientCount;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  void *v7;
  _QWORD v8[5];

  clientCount = self->_clientCount;
  self->_clientCount = clientCount + 1;
  if (!clientCount)
  {
    -[SDDomainBrowser scheduleBrowser](self, "scheduleBrowser");
    if (!self->_timer)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1001A2064;
      v8[3] = &unk_1007146D8;
      v8[4] = self;
      v4 = sub_10019AAD8(1, &_dispatch_main_q, v8);
      v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v4);
      timer = self->_timer;
      self->_timer = v5;

      dispatch_resume((dispatch_object_t)self->_timer);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "statusChanged:", CFSTR("com.apple.sharingd.MulticastDNSChanged"), 0);

  }
}

- (void)stop
{
  int v2;
  NSNetServiceBrowser *domainBrowser;
  NSNetServiceBrowser *v5;
  id v6;

  v2 = self->_clientCount - 1;
  self->_clientCount = v2;
  if (!v2)
  {
    domainBrowser = self->_domainBrowser;
    if (domainBrowser)
    {
      -[NSNetServiceBrowser setDelegate:](domainBrowser, "setDelegate:", 0);
      -[NSNetServiceBrowser stop](self->_domainBrowser, "stop");
      v5 = self->_domainBrowser;
      self->_domainBrowser = 0;

    }
    -[NSMutableSet removeAllObjects](self->_domains, "removeAllObjects");
    CFDictionaryRemoveAllValues(self->_domainTree);
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:", self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainBrowser, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_domains, 0);
}

@end
