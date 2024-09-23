@implementation BluetoothDevice(SiriClientAdditions)

- (uint64_t)ac_isEyesFree
{
  void *v2;
  char v3;
  _BOOL8 v4;
  CFDataRef v6;
  CFDataRef v7;
  UInt8 bytes[4];
  __int16 v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getServiceSetting:key:", 1, CFSTR("BT_KEY_SIRI_EYESFREE_MODE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLValue") & 1) != 0)
  {

    return 1;
  }
  v3 = AFPreferencesAlwaysEyesFreeEnabled();

  if ((v3 & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isServiceSupported:", 128))
  {
    v10 = 0;
    v11[0] = 0;
    *(_QWORD *)((char *)v11 + 7) = 0;
    objc_msgSend(a1, "device");
    if (!BTDeviceGetAddressString())
    {
      v9 = 0;
      *(_DWORD *)bytes = 0;
      v4 = 0;
      if (BTDeviceAddressFromString())
        return v4;
      v6 = CFDataCreate(0, bytes, 6);
      if (v6)
      {
        v7 = v6;
        v4 = IAPBluetoothDeviceMode() == 2;
        CFRelease(v7);
        return v4;
      }
    }
  }
  return 0;
}

- (uint64_t)ac_isBluetoothVehicle
{
  int DeviceType;
  uint64_t result;

  objc_msgSend(a1, "device");
  DeviceType = BTDeviceGetDeviceType();
  result = 0;
  if (!DeviceType)
    return AFPreferencesAlwaysEyesFreeEnabled();
  return result;
}

@end
