@implementation ISDevice

- (ISDevice)init
{
  ISDevice *v3;
  ISDevice *v4;
  objc_super v6;

  __ISRecordSPIClassUsage(self);
  v6.receiver = self;
  v6.super_class = (Class)ISDevice;
  v3 = -[ISDevice init](&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_biometricStyle = 0;
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesStore.ISDevice", 0);
    v4->_lastFreeSpaceRequest = -1.79769313e308;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_sync(dispatchQueue, &__block_literal_global);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)ISDevice;
  -[ISDevice dealloc](&v4, sel_dealloc);
}

+ (void)setSharedInstance:(id)a3
{
  pthread_mutex_lock(&__SharedInstanceLock);
  if ((id)__SharedInstance != a3)
  {

    __SharedInstance = (uint64_t)a3;
  }
  pthread_mutex_unlock(&__SharedInstanceLock);
}

+ (id)sharedInstance
{
  ISDevice *v2;
  ISDevice *v3;

  pthread_mutex_lock(&__SharedInstanceLock);
  v2 = (ISDevice *)__SharedInstance;
  if (!__SharedInstance)
  {
    v2 = objc_alloc_init(ISDevice);
    __SharedInstance = (uint64_t)v2;
  }
  v3 = v2;
  pthread_mutex_unlock(&__SharedInstanceLock);
  return v3;
}

- (BOOL)checkCapabilities:(id)a3 withMismatches:(id *)a4
{
  uint64_t (*v6)(id, _QWORD);
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFBoolean *Value;
  void *v10;
  BOOL v11;
  id v12;

  v6 = (uint64_t (*)(id, _QWORD))ISWeakLinkedSymbolForString("MobileInstallationCheckCapabilitiesMatch", (const void *)0x17);
  if (v6 && (v7 = (const __CFDictionary *)v6(a3, 0)) != 0)
  {
    v8 = v7;
    Value = (const __CFBoolean *)CFDictionaryGetValue(v7, CFSTR("CapabilitiesMatch"));
    if (Value && CFBooleanGetValue(Value))
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      v10 = (void *)CFDictionaryGetValue(v8, CFSTR("MismatchedCapabilities"));
      v12 = v10;
      v11 = 0;
    }
    CFRelease(v8);
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    if (!a4)
    {
LABEL_10:

      return v11;
    }
  }
  *a4 = v10;
  return v11;
}

- (id)copyProtocolConditionalContext
{
  id v3;
  int v4;
  _QWORD *v5;
  _QWORD *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEB1F68]);
  objc_msgSend(v3, "setSystemVersion:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "productVersion"));
  v4 = -[ISDevice _deviceClass](self, "_deviceClass");
  v5 = (_QWORD *)MEMORY[0x24BEB29B0];
  v6 = (_QWORD *)MEMORY[0x24BEB29C0];
  if (v4 != 2)
    v6 = (_QWORD *)MEMORY[0x24BEB29B8];
  if (v4 != 3)
    v5 = v6;
  objc_msgSend(v3, "setPlatformName:", *v5);
  return v3;
}

- (int64_t)deviceBiometricStyle
{
  const void *v3;
  const void *v4;
  const void *v5;
  int64_t v6;

  if (!self->_biometricStyle)
  {
    v3 = (const void *)MGCopyAnswer();
    v4 = (const void *)*MEMORY[0x24BDBD270];
    if (v3 == (const void *)*MEMORY[0x24BDBD270])
    {
      v5 = 0;
      v6 = 3;
    }
    else
    {
      v5 = (const void *)MGCopyAnswer();
      v6 = 1;
      if (v5 == v4)
        v6 = 2;
    }
    self->_biometricStyle = v6;
    if (v3)
      CFRelease(v3);
    if (v5)
      CFRelease(v5);
  }
  return self->_biometricStyle;
}

- (NSString)deviceName
{
  void *v2;

  v2 = (void *)MGCopyAnswer();
  if (v2)
    return (NSString *)v2;
  else
    return (NSString *)CFSTR("Unknown");
}

- (NSString)guid
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __16__ISDevice_guid__block_invoke;
  v5[3] = &unk_24C43BF00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __16__ISDevice_guid__block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1E90], "sharedInstance"), "copyDeviceGUID");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)hardwareName
{
  return (NSString *)(id)MGCopyAnswer();
}

- (BOOL)releasePowerAssertion:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v4)
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (v6)
  {
    v11 = 138412546;
    v12 = objc_opt_class();
    v13 = 2112;
    v14 = a3;
    LODWORD(v10) = 22;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v11, v10);
      free(v8);
      SSFileLog();
    }
  }
  return CPSetPowerAssertionWithIdentifier();
}

- (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)systemName
{
  void *v2;
  NSString *v3;

  v2 = (void *)_CFCopySystemVersionDictionary();
  v3 = (NSString *)(id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBD1F8]);

  return v3;
}

- (BOOL)takePowerAssertion:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v4)
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (v6)
  {
    v11 = 138412546;
    v12 = objc_opt_class();
    v13 = 2112;
    v14 = a3;
    LODWORD(v10) = 22;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v11, v10);
      free(v8);
      SSFileLog();
    }
  }
  return CPSetPowerAssertionWithIdentifier();
}

- (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 withOptions:(id)a5 completionBlock:(id)a6
{
  NSObject *dispatchQueue;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ISDevice_requestFreeSpace_atPath_withOptions_completionBlock___block_invoke;
  block[3] = &unk_24C43BF28;
  block[5] = self;
  block[6] = &v8;
  block[4] = a5;
  dispatch_sync(dispatchQueue, block);
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();

  _Block_object_dispose(&v8, 8);
}

void *__64__ISDevice_requestFreeSpace_atPath_withOptions_completionBlock___block_invoke(_QWORD *a1)
{
  double Current;
  double v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *result;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = Current;
  v4 = (void *)a1[4];
  if (v4)
  {
    v5 = v4;
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v5;
    goto LABEL_6;
  }
  if (Current - *(double *)(a1[5] + 40) < 300.0)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE70]);
    v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v5 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, *MEMORY[0x24BE047C0], 0);
    goto LABEL_5;
  }
LABEL_6:
  result = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!result
    || (result = (void *)objc_msgSend((id)objc_msgSend(result, "objectForKey:", *MEMORY[0x24BE047C0]), "integerValue")) != 0)
  {
    *(double *)(a1[5] + 40) = v3;
  }
  return result;
}

- (void)resetLocationAndPrivacy
{
  void *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _WORD *v10;
  uint64_t v11;
  _WORD v12[8];

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v2)
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_INFO))
    v5 = v4;
  else
    v5 = v4 & 2;
  if (v5)
  {
    v12[0] = 0;
    LODWORD(v11) = 2;
    v10 = v12;
    v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, v12, v11);
      free(v7);
      v10 = (_WORD *)v8;
      SSFileLog();
    }
  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage", v10);
  objc_msgSend(v9, "removeCookiesWithProperties:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("xp_ci"), *MEMORY[0x24BDD0D98]));
}

- (id)supportedOfferDeviceForDevices:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[ISDevice _deviceClass](self, "_deviceClass");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (2)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(a3);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    switch(objc_msgSend(v9, "deviceIdentifier"))
    {
      case 1:
        return v9;
      case 2:
        if (v4 != 1)
          goto LABEL_12;
        break;
      case 3:
      case 4:
        if (v4 != 2)
          goto LABEL_12;
        break;
      case 9:
        if (v4 != 3)
          goto LABEL_12;
        break;
      default:
LABEL_12:
        if (v6 != ++v8)
          continue;
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (!v6)
          return 0;
        goto LABEL_3;
    }
    return v9;
  }
}

- (int)_deviceClass
{
  void *v2;
  int v3;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

@end
