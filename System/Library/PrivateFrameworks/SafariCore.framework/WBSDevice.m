@implementation WBSDevice

+ (WBSDevice)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_8);
  return (WBSDevice *)(id)currentDevice_currentDevice;
}

uint64_t __26__WBSDevice_currentDevice__block_invoke()
{
  WBSDevice *v0;
  void *v1;

  v0 = objc_alloc_init(WBSDevice);
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = (uint64_t)v0;

  return objc_msgSend((id)currentDevice_currentDevice, "registerForNotifications");
}

- (WBSDevice)init
{
  WBSDevice *v2;
  WBSDevice *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WBSDevice;
  v2 = -[WBSDevice init](&v5, sel_init);
  if (v2)
  {
    v2->_deviceClass = MGGetSInt32Answer();
    v3 = v2;
  }

  return v2;
}

- (NSString)userAssignedName
{
  NSString *userAssignedName;
  NSString *v4;
  NSString *v5;
  __CFString *v6;
  NSString *v7;
  NSString *v8;

  userAssignedName = self->_userAssignedName;
  if (!userAssignedName)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_userAssignedName;
    self->_userAssignedName = v4;

    userAssignedName = self->_userAssignedName;
    if (!userAssignedName)
    {
      switch(self->_deviceClass)
      {
        case 1:
          v6 = CFSTR("iPhone");
          goto LABEL_8;
        case 3:
          v6 = CFSTR("iPad");
          goto LABEL_8;
        case 4:
          v6 = CFSTR("Apple TV");
          goto LABEL_8;
        case 6:
          v6 = CFSTR("Apple Watch");
LABEL_8:
          _WBSLocalizedString(v6, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          v8 = self->_userAssignedName;
          self->_userAssignedName = v7;

          break;
        default:
          break;
      }
      userAssignedName = self->_userAssignedName;
    }
  }
  return userAssignedName;
}

- (void)registerForNotifications
{
  id v3;
  id v4;
  id location;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!self->_notificationToken)
  {
    objc_initWeak(&location, self);
    v6[0] = CFSTR("UserAssignedDeviceName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v4, &location);
    self->_notificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_notificationToken)
    MGCancelNotifications();
  v3.receiver = self;
  v3.super_class = (Class)WBSDevice;
  -[WBSDevice dealloc](&v3, sel_dealloc);
}

- (NSString)userUniqueDeviceIdentifier
{
  NSString *userUniqueDeviceIdentifier;
  NSString *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  userUniqueDeviceIdentifier = self->_userUniqueDeviceIdentifier;
  if (!userUniqueDeviceIdentifier)
  {
    v4 = (NSString *)MGGetStringAnswer();
    v5 = self->_userUniqueDeviceIdentifier;
    self->_userUniqueDeviceIdentifier = v4;

    userUniqueDeviceIdentifier = self->_userUniqueDeviceIdentifier;
    if (!userUniqueDeviceIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_userUniqueDeviceIdentifier;
      self->_userUniqueDeviceIdentifier = v7;

      userUniqueDeviceIdentifier = self->_userUniqueDeviceIdentifier;
    }
  }
  return userUniqueDeviceIdentifier;
}

void __37__WBSDevice_registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = objc_msgSend(a2, "isEqualToString:", CFSTR("UserAssignedDeviceName"));
    WeakRetained = v6;
    if (v4)
    {
      v5 = (void *)MGCopyAnswer();
      objc_msgSend(v6, "_setUserAssignedName:", v5);

      WeakRetained = v6;
    }
  }

}

- (void)unregisterForNotifications
{
  if (self->_notificationToken)
    MGCancelNotifications();
}

- (NSString)deviceTypeIdentifier
{
  NSString *deviceTypeIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  deviceTypeIdentifier = self->_deviceTypeIdentifier;
  if (!deviceTypeIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_deviceTypeIdentifier;
    self->_deviceTypeIdentifier = v5;

    deviceTypeIdentifier = self->_deviceTypeIdentifier;
  }
  return deviceTypeIdentifier;
}

- (void)test_setUserAssignedName:(id)a3
{
  id v4;

  v4 = a3;
  if (+[WBSFeatureAvailability isInternalInstall](WBSFeatureAvailability, "isInternalInstall"))
    -[WBSDevice _setUserAssignedName:](self, "_setUserAssignedName:", v4);

}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)_setUserAssignedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAssignedName, 0);
  objc_storeStrong((id *)&self->_userUniqueDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
}

@end
