@implementation DMDMobileGestalt

+ (unint64_t)deviceType
{
  void *v2;
  unint64_t v3;
  int v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceClass"));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v3 = 5;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("AudioAccessory")) & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("RealityDevice")) & 1) != 0)
  {
    v3 = 8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138477827;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown device type %{private}@", (uint8_t *)&v5, 0xCu);
    }
    v3 = 0;
  }

  return v3;
}

+ (BOOL)hasAppleInternalInstallCapability
{
  return MGGetBoolAnswer(CFSTR("apple-internal-install"), a2);
}

+ (NSString)deviceClass
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
}

+ (NSString)productType
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("ProductType"), 0);
}

+ (NSString)productVersion
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("ProductVersion"), 0);
}

+ (NSString)buildVersion
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("BuildVersion"), 0);
}

+ (NSString)marketingName
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("marketing-name"), 0);
}

+ (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("SerialNumber"), 0);
}

+ (NSString)modelNumber
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("ModelNumber"), 0);
}

+ (NSString)uniqueDeviceID
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
}

+ (NSString)userAssignedDeviceName
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
}

+ (NSNumber)dataCapacity
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v2 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMGQDiskUsageTotalDataCapacity));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "floatValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5 * 9.31322575e-10));

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (NSNumber)dataAvailable
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v2 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMGQDiskUsageAmountDataAvailable));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "floatValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5 * 9.31322575e-10));

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (NSString)ethernetMacAddress
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("EthernetMacAddress"), 0);
}

+ (NSString)bluetoothAddress
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("BluetoothAddress"), 0);
}

+ (NSString)wifiAddress
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("WifiAddress"), 0);
}

+ (NSData)wifiAddressData
{
  return (NSData *)(id)MGCopyAnswer(CFSTR("WifiAddressData"), 0);
}

+ (BOOL)hasTelephonyCapability
{
  return MGGetBoolAnswer(CFSTR("telephony"), a2);
}

+ (BOOL)hasCellularDataCapability
{
  return MGGetBoolAnswer(CFSTR("cellular-data"), a2);
}

+ (BOOL)hasPersonalHotspotCapability
{
  return MGGetBoolAnswer(CFSTR("personal-hotspot"), a2);
}

+ (NSString)phoneNumber
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("PhoneNumber"), 0);
}

+ (NSString)mobileSubscriberCountryCode
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("MobileSubscriberCountryCode"), 0);
}

+ (NSString)mobileSubscriberNetworkCode
{
  return (NSString *)(id)MGCopyAnswer(CFSTR("MobileSubscriberNetworkCode"), 0);
}

@end
