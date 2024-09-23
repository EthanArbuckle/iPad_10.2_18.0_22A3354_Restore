@implementation ACMSystemInfo

- (NSString)IPAddress
{
  int v2;
  uint64_t v3;
  ifaddrs *v4;
  uint64_t v5;
  in_addr v6;
  in_addr v7;
  const __CFString *v8;
  NSString *p_isa;
  ifaddrs *v11;

  v11 = 0;
  v2 = getifaddrs(&v11);
  v3 = 0;
  v4 = v11;
  if (v2 || !v11)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v3 = 0;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4->ifa_name), "isEqualToString:", CFSTR("en0")))
        {
          v6.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntoa(v6));
        }
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4->ifa_name), "isEqualToString:", CFSTR("ppp0")))
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntoa(v7));
        }
      }
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v11;
  }
  v8 = CFSTR("127.0.0.1");
  if (v3)
    v8 = (const __CFString *)v3;
  if (v5)
    p_isa = (NSString *)v5;
  else
    p_isa = &v8->isa;
  MEMORY[0x2348A3A3C](v4);
  return p_isa;
}

- (NSString)MACAddress
{
  int v2;
  void *v3;
  ifaddrs *v4;
  sockaddr *ifa_addr;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  ifaddrs *v10;

  v10 = 0;
  v2 = getifaddrs(&v10);
  v3 = 0;
  v4 = v10;
  if (!v2 && v10)
  {
    v3 = 0;
    do
    {
      ifa_addr = v4->ifa_addr;
      if (ifa_addr->sa_family == 18 && ifa_addr->sa_data[2] == 6)
      {
        v6 = ifa_addr->sa_data[3];
        v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
        if (ifa_addr->sa_data[4])
        {
          v7 = 0;
          v8 = (uint64_t)&ifa_addr->sa_data[v6 + 6];
          do
            objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v8 + v7++));
          while (v7 < ifa_addr->sa_data[4]);
        }
      }
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v10;
  }
  MEMORY[0x2348A3A3C](v4);
  return (NSString *)v3;
}

- (id)previousVersionUUID
{
  id v2;
  void *v3;
  _QWORD v5[5];
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
  v2 = +[ACMEnvironmentPreferences supportedRealms](ACMEnvironmentPreferences, "supportedRealms");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__ACMSystemInfo_previousVersionUUID__block_invoke;
  v5[3] = &unk_24FCE4F80;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ACMSystemInfo_previousVersionUUID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t result;

  v6 = (void *)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "environmentPreferencesWithRealm:", a2);
  result = objc_msgSend((id)objc_msgSend(v6, "provisionedDeviceIdentifier"), "length");
  if (result)
  {
    result = objc_msgSend(v6, "provisionedDeviceIdentifier");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (NSString)uniqueDeviceIdentifier
{
  id v3;
  void *v4;

  v3 = (id)_sharedUniqueDeviceIdentifier;
  if (!_sharedUniqueDeviceIdentifier)
  {
    v3 = (id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "UUID");
    _sharedUniqueDeviceIdentifier = (uint64_t)v3;
    if (!v3)
    {
      _sharedUniqueDeviceIdentifier = (uint64_t)-[ACMSystemInfo previousVersionUUID](self, "previousVersionUUID");
      if (_sharedUniqueDeviceIdentifier)
        goto LABEL_10;
      _sharedUniqueDeviceIdentifier = (uint64_t)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "identifierForVendor"), "UUIDString");
      if (_sharedUniqueDeviceIdentifier)
        goto LABEL_10;
      v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "UUIDString");
      _sharedUniqueDeviceIdentifier = (uint64_t)v3;
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
          ACFLog(7, (uint64_t)"-[ACMSystemInfo uniqueDeviceIdentifier]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMSystemInfo.m", 136, 0, "Failed to get device ID, generating random %@", _sharedUniqueDeviceIdentifier);
        v3 = (id)_sharedUniqueDeviceIdentifier;
      }
      if (v3)
      {
LABEL_10:
        v4 = (void *)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences");
        objc_msgSend(v4, "setUUID:", _sharedUniqueDeviceIdentifier);
        v3 = (id)_sharedUniqueDeviceIdentifier;
      }
    }
  }
  return (NSString *)v3;
}

- (NSString)deviceModel
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "model");
}

- (NSString)systemVersion
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "systemVersion");
}

- (BOOL)isRunningOnModernMobileSystem
{
  return floor(*MEMORY[0x24BDD0D50]) > 993.0;
}

- (BOOL)isTouchIDAvailable
{
  return 0;
}

- (BOOL)isRetailDevice
{
  return 0;
}

- (NSString)version
{
  return (NSString *)CFSTR("2.9.2");
}

- (BOOL)isPreRelease
{
  NSString *v2;
  uint64_t v3;

  v2 = -[ACMSystemInfo version](self, "version");
  -[NSString rangeOfCharacterFromSet:](v2, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet"));
  return v3 != 0;
}

@end
