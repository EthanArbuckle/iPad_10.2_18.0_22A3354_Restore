@implementation SUKeybagInterface(SUSUIAuthenticationKeybagInterface)

- (uint64_t)lockDevice
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[7];
  os_log_type_t v6;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = SUSUILogKeybagInterface();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_impl(&dword_218F45000, log, type, "attemptAuthentication: blocked", v5, 2u);
  }
  objc_storeStrong(location, 0);
  return MKBLockDeviceNow();
}

- (BOOL)authenticate:()SUSUIAuthenticationKeybagInterface
{
  BOOL v4;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_msgSend(location[0], "dataUsingEncoding:", 4);
  v4 = MKBUnlockDevice() == 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (double)backOffTime
{
  id v2;
  id v3;
  double v4;
  double v6;
  id v7;
  id v8[3];
  id v9;

  v8[2] = a1;
  v8[1] = a2;
  v8[0] = 0;
  v9 = (id)MKBGetDeviceLockStateInfo();
  v7 = v9;
  v2 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE67210]);
  v3 = v8[0];
  v8[0] = v2;

  objc_msgSend(v8[0], "doubleValue");
  v6 = v4;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v6;
}

@end
