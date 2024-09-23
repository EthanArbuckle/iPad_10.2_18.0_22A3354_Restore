@implementation ICDelegationServiceSecuritySettings

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDelegationServiceSecuritySettings;
  return -[ICDelegationServiceSecuritySettings init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_password)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p securityMode: %li hasPassword: %@>"), v5, self, self->_securityMode, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
}

+ (void)getDeviceReceiverSettingsWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (getDeviceReceiverSettingsWithCompletion__sOnceToken != -1)
    dispatch_once(&getDeviceReceiverSettingsWithCompletion__sOnceToken, &__block_literal_global_28265);
  v5 = v3;
  v4 = v3;
  MRMediaRemoteGetReceiverAirPlaySecuritySettings();

}

+ (void)getDeviceSenderSettingsForReceiverName:(id)a3 securityMode:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  id v10;

  v7 = a3;
  v8 = a5;
  if (a4 == 4)
  {
    if (getDeviceSenderSettingsForReceiverName_securityMode_completion__sOnceToken != -1)
      dispatch_once(&getDeviceSenderSettingsForReceiverName_securityMode_completion__sOnceToken, &__block_literal_global_13);
    v10 = v8;
    MRMediaRemoteGetSavedAVRoutePassword();

  }
  else
  {
    v9 = -[ICDelegationServiceSecuritySettings _init]([ICDelegationServiceSecuritySettings alloc], "_init");
    v9[1] = a4;
    (*((void (**)(id, _QWORD *, _QWORD))v8 + 2))(v8, v9, 0);

  }
}

void __102__ICDelegationServiceSecuritySettings_getDeviceSenderSettingsForReceiverName_securityMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = -[ICDelegationServiceSecuritySettings _init]([ICDelegationServiceSecuritySettings alloc], "_init");
  *((_QWORD *)v4 + 1) = *(_QWORD *)(a1 + 40);
  objc_storeStrong((id *)v4 + 2, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __102__ICDelegationServiceSecuritySettings_getDeviceSenderSettingsForReceiverName_securityMode_completion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceSecuritySettings.senderSerialQueue", 0);
  v1 = (void *)getDeviceSenderSettingsForReceiverName_securityMode_completion__sSerialQueue;
  getDeviceSenderSettingsForReceiverName_securityMode_completion__sSerialQueue = (uint64_t)v0;

}

void __79__ICDelegationServiceSecuritySettings_getDeviceReceiverSettingsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t (*Int64SymbolLoc)(const __CFString *, _QWORD);
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (a2)
  {
    switch(MRAVAirPlaySecuritySettingsGetSecurityMode())
    {
      case 1u:
        v4 = 0;
        v5 = 1;
        break;
      case 2u:
        v4 = 0;
        v5 = 2;
        break;
      case 3u:
        v4 = 0;
        v5 = 3;
        break;
      case 4u:
        MEMORY[0x1A1AFA06C](a2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 4;
        break;
      default:
        v5 = 0;
        v4 = 0;
        break;
    }
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isAppleTV") & 1) != 0 || objc_msgSend(v7, "isAudioAccessory"))
    {
      if (!AirPlaySupportLibraryCore_frameworkLibrary)
        AirPlaySupportLibraryCore_frameworkLibrary = _sl_dlopen();
      if (AirPlaySupportLibraryCore_frameworkLibrary && getAPSSettingsGetInt64SymbolLoc())
      {
        Int64SymbolLoc = (uint64_t (*)(const __CFString *, _QWORD))getAPSSettingsGetInt64SymbolLoc();
        if (!Int64SymbolLoc)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int64_t soft_APSSettingsGetInt64(CFStringRef, OSStatus *)");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("ICDelegationServiceSecuritySettings.m"), 21, CFSTR("%s"), dlerror());

          __break(1u);
        }
        if (Int64SymbolLoc(CFSTR("accessControlLevel"), 0) >= 1)
        {

          v4 = 0;
          v5 = 1;
        }
      }
    }
    v9 = -[ICDelegationServiceSecuritySettings _init]([ICDelegationServiceSecuritySettings alloc], "_init");
    v10 = (void *)v9[2];
    v9[1] = v5;
    v9[2] = v4;
    v11 = v4;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

  }
}

void __79__ICDelegationServiceSecuritySettings_getDeviceReceiverSettingsWithCompletion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceSecuritySettings.receiverSerialQueue", 0);
  v1 = (void *)getDeviceReceiverSettingsWithCompletion__sSerialQueue;
  getDeviceReceiverSettingsWithCompletion__sSerialQueue = (uint64_t)v0;

}

@end
