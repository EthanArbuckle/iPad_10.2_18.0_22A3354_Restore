@implementation SKStepWiFiPreflight

- (SKStepWiFiPreflight)init
{
  SKStepWiFiPreflight *v2;
  SKStepWiFiPreflight *v3;
  SKStepWiFiPreflight *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKStepWiFiPreflight;
  v2 = -[SKStepWiFiPreflight init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3->_preventAppleWiFi = 1;
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiPreflight;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKStepWiFiPreflight;
  -[SKStepWiFiPreflight dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");

  LogCategoryReplaceF();
}

- (void)activate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = _Block_copy(self->_skCompletionHandler);
  if (!v3)
  {
    CUFatalErrorF();
    JUMPOUT(0x21484DCCCLL);
  }
  v4 = v3;
  v8 = 0;
  -[SKStepWiFiPreflight checkWiFiAndReturnError:](self, "checkWiFiAndReturnError:", &v8);
  v5 = v8;
  v6 = _Block_copy(self->_skCompletionHandler);
  v7 = v6;
  if (v6)
    (*((void (**)(void *, id))v6 + 2))(v6, v5);

}

- (BOOL)checkWiFiAndReturnError:(id *)a3
{
  int var0;
  void *v6;
  void *v7;
  void *v8;
  unsigned int Int64Ranged;
  uint64_t v10;
  int v11;
  BOOL v12;
  void *v14;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[CUEnvironment objectForKeyedSubscript:](self->_environment, "objectForKeyedSubscript:", CFSTR("_wifiInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetTypeID();
  CFGetTypedObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = (void *)WiFiCopyCurrentNetworkInfoEx();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a3)
      goto LABEL_29;
    goto LABEL_27;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (CFDictionaryGetInt64())
  {
    if (Int64Ranged != 1)
    {
      NSPrintF();
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v14 = (void *)v10;
        if (a3)
        {
          NSErrorF_safe();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_27;
      }
    }
  }
  if (Int64Ranged >= 2)
  {
    if (a3)
      goto LABEL_29;
    goto LABEL_27;
  }
  if (self->_preventAppleWiFi && objc_msgSend(v8, "isEqual:", CFSTR("AppleWiFi")))
  {
    if (a3)
    {
LABEL_29:
      NSErrorF_safe();
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_27:
    v12 = 0;
    goto LABEL_19;
  }
  v11 = self->_ucat->var0;
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v12 = 1;
LABEL_19:

  return v12;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (CUEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSString)label
{
  return self->_label;
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_skMessaging, a3);
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
  objc_storeWeak((id *)&self->_skSetupObject, a3);
}

- (BOOL)preventAppleWiFi
{
  return self->_preventAppleWiFi;
}

- (void)setPreventAppleWiFi:(BOOL)a3
{
  self->_preventAppleWiFi = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
