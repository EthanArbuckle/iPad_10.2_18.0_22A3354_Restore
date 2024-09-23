@implementation SKUIJSTelephony

- (SKUIJSTelephony)initWithAppContext:(id)a3
{
  id v4;
  SKUIJSTelephony *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *telephonyQueue;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSTelephony initWithAppContext:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIJSTelephony;
  v5 = -[IKJSObject initWithAppContext:](&v9, sel_initWithAppContext_, v4);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIJSTelephony", 0);
    telephonyQueue = v5->_telephonyQueue;
    v5->_telephonyQueue = (OS_dispatch_queue *)v6;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void (*v5)(__CTServerConnection *, _QWORD);
  void (*v6)(__CTServerConnection *, _QWORD);
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v11;

  v3 = (void *)SKUICoreTelephonyFramework();
  if (self->_telephonyServer)
  {
    v4 = v3;
    v5 = (void (*)(__CTServerConnection *, _QWORD))SKUIWeakLinkedSymbolForString("_CTServerConnectionUnregisterForNotification", v3);
    if (v5)
    {
      v6 = v5;
      v7 = SKUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v7);
      v8 = SKUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v4);
      v6(self->_telephonyServer, *v8);
      v9 = SKUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v9);
      v10 = SKUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v4);
      v6(self->_telephonyServer, *v10);
    }
    CFRelease(self->_telephonyServer);
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIJSTelephony;
  -[SKUIJSTelephony dealloc](&v11, sel_dealloc);
}

- (void)beginObserving
{
  __CTServerConnection *v3;
  __CTServerConnection *v4;
  void *v5;
  void (*v6)(__CTServerConnection *, _QWORD);
  void (*v7)(__CTServerConnection *, _QWORD);
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  if (!self->_isObserving)
  {
    v3 = -[SKUIJSTelephony _telephonyServer](self, "_telephonyServer");
    if (v3)
    {
      v4 = v3;
      v5 = (void *)SKUICoreTelephonyFramework();
      v6 = (void (*)(__CTServerConnection *, _QWORD))SKUIWeakLinkedSymbolForString("_CTServerConnectionRegisterForNotification", v5);
      if (v6)
      {
        v7 = v6;
        v8 = SKUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v5);
        v7(v4, *v8);
        v9 = SKUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v5);
        v7(v4, *v9);
        v10 = SKUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v5);
        v7(v4, *v10);
        v11 = SKUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v5);
        v7(v4, *v11);
      }
      self->_isObserving = 1;
    }
  }
}

- (NSString)countryCode
{
  return (NSString *)(id)CPPhoneNumberCopyActiveCountryCode();
}

- (id)formattedPhoneNumber:(id)a3
{
  return (id)CPPhoneNumberCopyFormattedStringForTextMessage();
}

- (BOOL)isCellularRoaming
{
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  const __CFDictionary *v5;
  const void **v6;
  const void *Value;
  const void *v8;
  CFTypeRef *v9;
  BOOL v10;

  v2 = (void *)SKUICoreTelephonyFramework();
  v3 = (uint64_t (*)(void))SKUIWeakLinkedSymbolForString("CTRegistrationCopyDataStatus", v2);
  if (!v3)
    return 0;
  v4 = v3();
  if (!v4)
    return 0;
  v5 = (const __CFDictionary *)v4;
  v6 = (const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationStatus", v2);
  Value = CFDictionaryGetValue(v5, *v6);
  if (Value)
  {
    v8 = Value;
    v9 = (CFTypeRef *)SKUIWeakLinkedSymbolForString("kCTRegistrationStatusRegisteredRoaming", v2);
    v10 = CFEqual(v8, *v9) != 0;
  }
  else
  {
    v10 = 0;
  }
  CFRelease(v5);
  return v10;
}

- (NSString)mobileCountryCode
{
  __CTServerConnection *v2;
  __CTServerConnection *v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = -[SKUIJSTelephony _telephonyServer](self, "_telephonyServer");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)SKUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SKUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileCountryCode", v4);
    if (v2)
    {
      ((void (*)(__CTServerConnection *, id *))v2)(v3, &v6);
      v2 = (__CTServerConnection *)v6;
    }
  }
  return (NSString *)v2;
}

- (NSString)mobileNetworkCode
{
  __CTServerConnection *v2;
  __CTServerConnection *v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = -[SKUIJSTelephony _telephonyServer](self, "_telephonyServer");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)SKUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SKUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileNetworkCode", v4);
    if (v2)
    {
      ((void (*)(__CTServerConnection *, id *))v2)(v3, &v6);
      v2 = (__CTServerConnection *)v6;
    }
  }
  return (NSString *)v2;
}

- (NSString)operatorName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)providerName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)sendSMSWithBodyText:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = SKUICoreTelephonyFramework();
  v11 = SKUIWeakLinkedClassForString(CFSTR("CTMessageCenter"), v10);
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("CTPhoneNumber"), v10), "phoneNumberWithDigits:countryCode:", v8, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sharedMessageCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "canonicalFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSMSWithText:serviceCenter:toAddress:", v9, 0, v13);

}

- (__CTServerConnection)_telephonyServer
{
  void *v3;
  void *v4;
  void (*v5)(void);
  void (*v6)(void);
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;

  if (!self->_telephonyServer)
  {
    v3 = (void *)SKUICoreTelephonyFramework();
    v4 = SKUIWeakLinkedSymbolForString("_CTServerConnectionCreateWithIdentifier", v3);
    v5 = (void (*)(void))SKUIWeakLinkedSymbolForString("_CTServerConnectionSetTargetQueue", v3);
    if (v4)
    {
      v6 = v5;
      if (v5)
      {
        v8[0] = 0;
        v9 = 0u;
        v10 = 0;
        v8[1] = self;
        self->_telephonyServer = (__CTServerConnection *)((uint64_t (*)(_QWORD, const __CFString *, _QWORD, _QWORD *))v4)(0, CFSTR("com.apple.StoreKitUI.SKUIJSTelephony"), _telephonyNotification, v8);
        v6();
      }
    }
  }
  return self->_telephonyServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
}

- (void)initWithAppContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSTelephony initWithAppContext:]";
}

@end
