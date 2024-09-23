@implementation SUNetworkObserver

- (SUNetworkObserver)init
{
  SUNetworkObserver *v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUNetworkObserver;
  v2 = -[SUNetworkObserver init](&v6, sel_init);
  if (v2)
  {
    v2->_partnerIdentifier = (NSString *)CFSTR("origin");
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__partnerHeaderChanged_, *MEMORY[0x24BEC8A88], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__storeServicesNetworkStartNotification_, *MEMORY[0x24BEB2B30], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__storeServicesNetworkStopNotification_, *MEMORY[0x24BEB2B38], 0);
    v4 = objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__networkTypeChanged_, *MEMORY[0x24BEC8B00], v4);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__networkUsageStateChanged_, *MEMORY[0x24BEC8B08], v4);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8A88], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B30], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B38], 0);
  v4 = objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], v4);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B08], v4);
  -[SUNetworkObserver _cancelStartupTimer](self, "_cancelStartupTimer");

  self->_partnerIdentifier = 0;
  v5.receiver = self;
  v5.super_class = (Class)SUNetworkObserver;
  -[SUNetworkObserver dealloc](&v5, sel_dealloc);
}

+ (void)setSharedInstance:(id)a3
{
  if ((id)__SharedInstance_0 != a3)
  {

    __SharedInstance_0 = (uint64_t)a3;
  }
}

+ (id)sharedInstance
{
  id result;

  result = (id)__SharedInstance_0;
  if (!__SharedInstance_0)
  {
    result = objc_alloc_init((Class)objc_opt_class());
    __SharedInstance_0 = (uint64_t)result;
  }
  return result;
}

- (void)checkPartnerAvailability
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8BB8]), "initWithBagContext:", v2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v3);

}

- (NSString)partnerIdentifier
{
  if (self->_partnersEnabled)
    return self->_partnerIdentifier;
  else
    return (NSString *)CFSTR("origin");
}

- (void)setPartnerIdentifier:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[NSString isEqualToString:](self->_partnerIdentifier, "isEqualToString:"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v7 &= 2u;
    if (v7)
    {
      v11 = 138412546;
      v12 = objc_opt_class();
      v13 = 2112;
      v14 = a3;
      LODWORD(v10) = 22;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v11, v10);
        free(v9);
        SSFileLog();
      }
    }

    self->_partnerIdentifier = (NSString *)a3;
    if (self->_partnersEnabled)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPartnerChangedNotification"), self->_partnerIdentifier);
  }
}

- (void)setPartnersEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSString *partnerIdentifier;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_partnersEnabled != a3)
  {
    v3 = a3;
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v7 &= 2u;
    if (v7)
    {
      v12 = 138412546;
      v13 = objc_opt_class();
      v14 = 1024;
      v15 = v3;
      LODWORD(v11) = 18;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v12, v11);
        free(v9);
        SSFileLog();
      }
    }
    self->_partnersEnabled = v3;
    partnerIdentifier = self->_partnerIdentifier;
    if (partnerIdentifier)
    {
      if (!-[NSString isEqualToString:](partnerIdentifier, "isEqualToString:", CFSTR("origin")))
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPartnerChangedNotification"), -[SUNetworkObserver partnerIdentifier](self, "partnerIdentifier"));
    }
  }
}

- (void)startNetworkAvailabilityTimer
{
  if (!self->_startupTimer)
    self->_startupTimer = (NSTimer *)(id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__startupTimer_, 0, 0, 12.0);
}

- (void)_networkTypeChanged:(id)a3
{
  -[SUNetworkObserver _handleNetworkTypeChange:](self, "_handleNetworkTypeChange:", objc_msgSend(a3, "userInfo"));
}

- (void)_networkUsageStateChanged:(id)a3
{
  -[SUNetworkObserver _handleUsingNetworkChange:](self, "_handleUsingNetworkChange:", objc_msgSend(a3, "userInfo"));
}

- (void)_partnerHeaderChanged:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)-[SUNetworkObserver mainThreadProxy](self, "mainThreadProxy");
  v5 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend(v4, "_mainThreadSetPartnerIdentifier:", objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEC8A90]));
}

- (void)_storeServicesNetworkStartNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SUNetworkObserver__storeServicesNetworkStartNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

_QWORD *__60__SUNetworkObserver__storeServicesNetworkStartNotification___block_invoke(uint64_t a1)
{
  _QWORD *result;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  result = *(_QWORD **)(a1 + 32);
  if (result[5] == 1)
    return (_QWORD *)objc_msgSend(result, "_updateNetworkActivityIndicator");
  return result;
}

- (void)_storeServicesNetworkStopNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUNetworkObserver__storeServicesNetworkStopNotification___block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

_QWORD *__59__SUNetworkObserver__storeServicesNetworkStopNotification___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 40);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 40) = v4;
    result = (_QWORD *)result[4];
    if (!result[5])
      return (_QWORD *)objc_msgSend(result, "_mainThreadScheduleNetworkActivityUpdate");
  }
  return result;
}

- (void)_cancelStartupTimer
{
  -[NSTimer invalidate](self->_startupTimer, "invalidate");

  self->_startupTimer = 0;
}

- (void)_handleNetworkTypeChange:(id)a3
{
  objc_msgSend((id)-[SUNetworkObserver mainThreadProxy](self, "mainThreadProxy"), "_mainThreadHandleNetworkTypeChange:", a3);
}

- (void)_handleUsingNetworkChange:(id)a3
{
  objc_msgSend((id)-[SUNetworkObserver mainThreadProxy](self, "mainThreadProxy", a3), "_mainThreadScheduleNetworkActivityUpdate");
}

- (void)_mainThreadHandleNetworkTypeChange:(id)a3
{
  -[SUNetworkObserver _cancelStartupTimer](self, "_cancelStartupTimer", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUNetworkTypeChangedNotification"), self);
}

- (void)_mainThreadScheduleNetworkActivityUpdate
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateNetworkActivityIndicator, 0);
  -[SUNetworkObserver performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateNetworkActivityIndicator, 0, 0.25);
}

- (void)_mainThreadSetPartnerIdentifier:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "rangeOfString:", CFSTR("."));
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      a3 = (id)objc_msgSend(a3, "substringToIndex:", v5);
    -[SUNetworkObserver setPartnerIdentifier:](self, "setPartnerIdentifier:", a3);
  }
}

- (void)_startupTimer:(id)a3
{
  -[SUNetworkObserver _mainThreadHandleNetworkTypeChange:](self, "_mainThreadHandleNetworkTypeChange:", 0);
}

- (void)_updateNetworkActivityIndicator
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  if (self->_storeServicesNetworkUsageCount <= 0)
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "isUsingNetwork");
  else
    v4 = 1;
  objc_msgSend(v3, "setNetworkActivityIndicatorVisible:", v4);
}

@end
