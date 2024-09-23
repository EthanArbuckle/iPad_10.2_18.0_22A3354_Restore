@implementation WFCellularSettings

- (WFCellularSettings)init
{
  WFCellularSettings *v2;
  WFCellularSettings *v3;
  void *v4;
  void *v5;
  const void *v6;
  WFCellularSettings *v7;
  WFCellularSettings *result;
  void *v9;
  void *v10;
  _QWORD v11[2];
  __int128 v12;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v14.receiver = self;
  v14.super_class = (Class)WFCellularSettings;
  v2 = -[WFCellularSettings init](&v14, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_6;
  v11[0] = 0;
  v12 = 0u;
  v13 = 0;
  v11[1] = v2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v4 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  v18 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr)
  {
    v5 = CoreTelephonyLibrary();
    v4 = dlsym(v5, "_CTServerConnectionCreateWithIdentifier");
    v16[3] = (uint64_t)v4;
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v15, 8);
  if (v4)
  {
    v6 = (const void *)((uint64_t (*)(_QWORD, const __CFString *, uint64_t (*)(), _QWORD *))v4)(*MEMORY[0x1E0C9AE00], CFSTR("com.apple.shortcuts"), WFCoreTelephonyConnectionCallbackStub, v11);
    v3->_connection = (__CTServerConnection *)CFRetain(v6);
    CFRelease(v6);
    v7 = v3;
LABEL_6:

    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTServerConnectionRef WF_CTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("WFCellularSettings.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)WFCellularSettings;
  -[WFCellularSettings dealloc](&v3, sel_dealloc);
}

- (BOOL)cellularDataEnabledWithError:(id *)a3
{
  __CTServerConnection *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL result;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v11 = 0;
  v4 = -[WFCellularSettings connection](self, "connection");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  v15 = get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  if (!get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr)
  {
    v6 = CoreTelephonyLibrary();
    v5 = dlsym(v6, "_CTServerConnectionGetCellularDataIsEnabled");
    v13[3] = (uint64_t)v5;
    get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v12, 8);
  if (v5)
  {
    v7 = ((uint64_t (*)(__CTServerConnection *, char *))v5)(v4, &v11);
    WFNSErrorFromCTError(v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v11 == 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTError WF_CTServerConnectionGetCellularDataIsEnabled(CTServerConnectionRef, Boolean *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("WFCellularSettings.m"), 17, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)isCellularDataCapableWithError:(id *)a3
{
  __CTServerConnection *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL result;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v11 = 0;
  v4 = -[WFCellularSettings connection](self, "connection");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr;
  v15 = get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr;
  if (!get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr)
  {
    v6 = CoreTelephonyLibrary();
    v5 = dlsym(v6, "_CTServerConnectionGetCellularDataSettings");
    v13[3] = (uint64_t)v5;
    get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v12, 8);
  if (v5)
  {
    v7 = ((uint64_t (*)(__CTServerConnection *, char *, _QWORD, _QWORD))v5)(v4, &v11, 0, 0);
    if (a3)
    {
      WFNSErrorFromCTError(v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return v11 == 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTError WF_CTServerConnectionGetCellularDataSettings(CTServerConnectionRef, Boolean *, Boolean *, Boolean *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("WFCellularSettings.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (__CTServerConnection)connection
{
  return self->_connection;
}

+ (id)defaultSettings
{
  if (defaultSettings_onceToken != -1)
    dispatch_once(&defaultSettings_onceToken, &__block_literal_global_8620);
  return (id)defaultSettings_settings;
}

void __37__WFCellularSettings_defaultSettings__block_invoke()
{
  WFCellularSettings *v0;
  void *v1;

  v0 = objc_alloc_init(WFCellularSettings);
  v1 = (void *)defaultSettings_settings;
  defaultSettings_settings = (uint64_t)v0;

}

@end
