@implementation SUScriptNotificationObserver

- (SUScriptNotificationObserver)init
{
  SUScriptNotificationObserver *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptNotificationObserver;
  v2 = -[SUScriptNotificationObserver init](&v4, sel_init);
  if (v2)
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  return v2;
}

- (void)dealloc
{
  __CFSet *receivers;
  objc_super v4;

  -[SUScriptNotificationObserver _endObservingNotifications](self, "_endObservingNotifications");

  self->_lock = 0;
  receivers = self->_receivers;
  if (receivers)
  {
    CFRelease(receivers);
    self->_receivers = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUScriptNotificationObserver;
  -[SUScriptNotificationObserver dealloc](&v4, sel_dealloc);
}

- (void)addEventReceiver:(id)a3
{
  __CFSet *receivers;

  -[NSLock lock](self->_lock, "lock");
  receivers = self->_receivers;
  if (!receivers)
  {
    receivers = CFSetCreateMutable(0, 0, 0);
    self->_receivers = receivers;
  }
  CFSetAddValue(receivers, a3);
  if (CFSetGetCount(self->_receivers) == 1)
    -[SUScriptNotificationObserver _beginObservingNotifications](self, "_beginObservingNotifications");
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeEventReceiver:(id)a3
{
  __CFSet *receivers;

  -[NSLock lock](self->_lock, "lock");
  receivers = self->_receivers;
  if (receivers)
  {
    CFSetRemoveValue(receivers, a3);
    if (!CFSetGetCount(self->_receivers))
      -[SUScriptNotificationObserver _endObservingNotifications](self, "_endObservingNotifications");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_audioSessionsChangedNotification:(id)a3
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("activeaudioplayerchange"));
}

- (void)_memoryWarningNotification:(id)a3
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("lowmemory"));
}

- (void)_networkTypeChangedNotification:(id)a3
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("networktypechange"));
}

- (void)_purchaseRequestDidSucceedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("SUPurchaseNotificationKeyPurchaseResponse"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend((id)objc_msgSend(v4, "URLResponse"), "bodyData");
    if (v6)
    {
      v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB20B8], "consumer"), "objectForData:response:error:", v6, 0, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v7, "objectForKey:", CFSTR("metrics"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v10 = objc_msgSend(v9, "shouldLog");
          if (objc_msgSend(v9, "shouldLogToDisk"))
            v11 = v10 | 2;
          else
            v11 = v10;
          if (os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v12 = v11;
          else
            v12 = v11 & 2;
          if (v12)
          {
            *(_DWORD *)v31 = 138412290;
            *(_QWORD *)&v31[4] = self;
            LODWORD(v30) = 12;
            v29 = v31;
            v13 = _os_log_send_and_compose_impl();
            if (v13)
            {
              v14 = (void *)v13;
              v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, v31, v30);
              free(v14);
              v29 = (_BYTE *)v15;
              SSFileLog();
            }
          }
          -[SUScriptNotificationObserver _dispatchEventWithDictionary:forName:](self, "_dispatchEventWithDictionary:forName:", v8, CFSTR("buyConfirmed"), v29);
        }
        return;
      }
      v24 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v25 = objc_msgSend(v24, "shouldLog");
      if (objc_msgSend(v24, "shouldLogToDisk"))
        v26 = v25 | 2;
      else
        v26 = v25;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v24, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v26 &= 2u;
      if (v26)
        goto LABEL_36;
    }
    else
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v22 = objc_msgSend(v21, "shouldLog");
      if (objc_msgSend(v21, "shouldLogToDisk"))
        v23 = v22 | 2;
      else
        v23 = v22;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v23 &= 2u;
      if (v23)
      {
LABEL_36:
        *(_DWORD *)v31 = 138412546;
        *(_QWORD *)&v31[4] = objc_opt_class();
        *(_WORD *)&v31[12] = 2112;
        *(_QWORD *)&v31[14] = v5;
        LODWORD(v30) = 22;
        v27 = _os_log_send_and_compose_impl();
        if (!v27)
          return;
        v28 = (void *)v27;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v27, 4, v31, v30, *(_OWORD *)v31, *(_QWORD *)&v31[16]);
        free(v28);
        goto LABEL_38;
      }
    }
  }
  else
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v18 &= 2u;
    if (v18)
    {
      *(_DWORD *)v31 = 138412546;
      *(_QWORD *)&v31[4] = objc_opt_class();
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = 0;
      LODWORD(v30) = 22;
      v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        v20 = (void *)v19;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, v31, v30);
        free(v20);
LABEL_38:
        SSFileLog();
      }
    }
  }
}

- (void)_restrictionsChangedNotification:(id)a3
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("restrictionschange"));
}

- (void)_softwareMapChangedNotification:(id)a3
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("softwarechange"));
}

- (void)_storeBagDidChangeNotification:(id)a3
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("bagchange"));
}

- (void)_subscriptionStatusDidChangeNotification:(id)a3
{
  uint64_t v4;
  SUScriptDictionary *v5;
  SUScriptDictionary *v6;

  v4 = objc_msgSend(a3, "userInfo");
  if (v4)
    v5 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v4);
  else
    v5 = 0;
  v6 = v5;
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", v5, CFSTR("subscriptionstatuschange"));

}

- (void)_safariViewControllerDataUpdate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SUScriptNotificationObserver _copySafariQueryDictionaryFromURL:](self, "_copySafariQueryDictionaryFromURL:", v4);
    v5 = objc_msgSend(v6, "objectForKey:", CFSTR("safariid"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUScriptNotificationObserver _dispatchSafariEventWithDictionary:andIdentifier:](self, "_dispatchSafariEventWithDictionary:andIdentifier:", v6, v5);

  }
}

- (id)_copySafariQueryDictionaryFromURL:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v4 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name=%@"), CFSTR("action"));
  v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "queryItems"), "mutableCopy");
  v6 = objc_msgSend((id)objc_msgSend(v5, "filteredArrayUsingPredicate:", v4), "firstObject");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(v5, "removeObject:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "value"), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "name"));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(v7, "copy");
  return v12;
}

- (void)_dispatchSafariEventWithDictionary:(id)a3 andIdentifier:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__SUScriptNotificationObserver__dispatchSafariEventWithDictionary_andIdentifier___block_invoke;
  v4[3] = &unk_24DE7C1F8;
  v4[4] = a4;
  v4[5] = a3;
  v4[6] = self;
  -[SUScriptNotificationObserver _enumerateReceiversUsingBlock:](self, "_enumerateReceiversUsingBlock:", v4);
}

void __81__SUScriptNotificationObserver__dispatchSafariEventWithDictionary_andIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "safariViewControllerIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      v4 = objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", *(_QWORD *)(a1 + 40), 0, 0);
      if (v4)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
        v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v7 = objc_msgSend(v6, "shouldLog");
        if (objc_msgSend(v6, "shouldLogToDisk"))
          v8 = v7 | 2;
        else
          v8 = v7;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v9 = v8;
        else
          v9 = v8 & 2;
        if (v9)
        {
          v15 = 138412290;
          v16 = v5;
          LODWORD(v14) = 12;
          v13 = &v15;
          v10 = _os_log_send_and_compose_impl();
          if (v10)
          {
            v11 = (void *)v10;
            v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v15, v14);
            free(v11);
            v13 = (int *)v12;
            SSFileLog();
          }
        }
        objc_msgSend(*(id *)(a1 + 48), "_dispatchEvent:forName:", v5, CFSTR("safariviewcontrollerdataupdate"), v13);

      }
    }
  }
}

- (void)_accessibilityPerformScrollUp
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("accessibilityscrollup"));
}

- (void)_accessibilityPerformScrollDown
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("accessibilityscrolldown"));
}

- (void)_accessibilityPerformScrollLeft
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("accessibilityscrollleft"));
}

- (void)_accessibilityPerformScrollRight
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("accessibilityscrollright"));
}

- (void)_accessibilityPerformEscape
{
  -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("accessibilityescape"));
}

- (void)_beginObservingNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__networkTypeChangedNotification_, *MEMORY[0x24BEC8B00], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__audioSessionsChangedNotification_, CFSTR("SUAudioPlayerSessionsChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__purchaseRequestDidSucceedNotification_, CFSTR("SUPurchaseRequestDidSucceedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__memoryWarningNotification_, *MEMORY[0x24BDF7538], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__storeBagDidChangeNotification_, CFSTR("SUScriptStoreBagDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__subscriptionStatusDidChangeNotification_, CFSTR("SUScriptSubscriptionStatusDidChangeNotification"), +[SUScriptSubscriptionStatusObserver sharedObserver](SUScriptSubscriptionStatusObserver, "sharedObserver"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__safariViewControllerDataUpdate_, CFSTR("SSScriptSafariViewControllerDataUpdateNotification"), 0);
  objc_msgSend(MEMORY[0x24BEC8C20], "startObservingNotifications");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__softwareMapChangedNotification_, *MEMORY[0x24BEC8B20], 0);
}

- (void)_dispatchEvent:(id)a3 forName:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SUScriptNotificationObserver__dispatchEvent_forName___block_invoke;
  v4[3] = &unk_24DE7C220;
  v4[4] = a3;
  v4[5] = a4;
  -[SUScriptNotificationObserver _enumerateReceiversUsingBlock:](self, "_enumerateReceiversUsingBlock:", v4);
}

uint64_t __55__SUScriptNotificationObserver__dispatchEvent_forName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dispatchEvent:forName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_dispatchEventWithDictionary:(id)a3 forName:(id)a4
{
  uint64_t v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:") & 1) != 0)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 0, 0);
    if (v7)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
      -[SUScriptNotificationObserver _dispatchEvent:forName:](self, "_dispatchEvent:forName:", v8, a4);

    }
  }
  else
  {
    NSLog(CFSTR("Unable to serialize dictionary for event: %@, dictionary: %@"), a4, a3);
  }
}

- (void)_endObservingNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B20], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUAudioPlayerSessionsChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUPurchaseRequestDidSucceedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUScriptStoreBagDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUScriptSubscriptionStatusDidChangeNotification"), +[SUScriptSubscriptionStatusObserver sharedObserver](SUScriptSubscriptionStatusObserver, "sharedObserver"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SSScriptSafariViewControllerDataUpdateNotification"), 0);
}

- (void)_enumerateReceiversUsingBlock:(id)a3
{
  SUScriptNotificationObserver *v5;
  id v6;

  -[NSLock lock](self->_lock, "lock");
  if (self->_receivers)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    CFSetApplyFunction(self->_receivers, (CFSetApplierFunction)__AddObjectToNSMutableSet, v6);
    -[NSLock unlock](self->_lock, "unlock");
    if (v6)
    {
      v5 = self;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", a3);

    }
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

@end
