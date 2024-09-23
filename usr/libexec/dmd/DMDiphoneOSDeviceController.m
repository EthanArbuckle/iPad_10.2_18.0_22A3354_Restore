@implementation DMDiphoneOSDeviceController

- (id)bluetoothAddress
{
  return +[DMDMobileGestalt bluetoothAddress](DMDMobileGestalt, "bluetoothAddress");
}

- (id)buildVersion
{
  return +[DMDMobileGestalt buildVersion](DMDMobileGestalt, "buildVersion");
}

- (id)deviceName
{
  return +[DMDMobileGestalt userAssignedDeviceName](DMDMobileGestalt, "userAssignedDeviceName");
}

- (id)deviceType
{
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[DMDMobileGestalt deviceType](DMDMobileGestalt, "deviceType"));
}

- (id)isAppleInternal
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDMobileGestalt hasAppleInternalInstallCapability](DMDMobileGestalt, "hasAppleInternalInstallCapability"));
}

- (id)isAwaitingConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](MCCloudConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v2, "isAwaitingConfiguration")));

  return v3;
}

- (id)isInSingleAppMode
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", MCIsEffectivelyInAppWhitelistMode(self, a2));
}

- (id)iTunesStoreAccountHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDMDMUtilities iTunesAccountHashForUniqueIdentifier:](DMDMDMUtilities, "iTunesAccountHashForUniqueIdentifier:", v4));

  return v5;
}

- (id)iTunesStoreAccountIsActive
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));
  if (v3)
    v4 = &__kCFBooleanTrue;
  else
    v4 = &__kCFBooleanFalse;
  v5 = v4;

  return v5;
}

- (id)marketingName
{
  return +[DMDMobileGestalt marketingName](DMDMobileGestalt, "marketingName");
}

- (id)model
{
  return +[DMDMobileGestalt modelNumber](DMDMobileGestalt, "modelNumber");
}

- (id)modelName
{
  return +[DMDMobileGestalt deviceClass](DMDMobileGestalt, "deviceClass");
}

- (id)osVersion
{
  return +[DMDMobileGestalt productVersion](DMDMobileGestalt, "productVersion");
}

- (id)productName
{
  return +[DMDMobileGestalt productType](DMDMobileGestalt, "productType");
}

- (id)serialNumber
{
  return +[DMDMobileGestalt serialNumber](DMDMobileGestalt, "serialNumber");
}

- (id)wifiAddress
{
  return +[DMDMobileGestalt wifiAddress](DMDMobileGestalt, "wifiAddress");
}

- (id)isSupervised
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](MCCloudConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v2, "isSupervised")));

  return v3;
}

- (id)lastCloudBackupDate
{
  return +[DMDLockdownUtilities deviceLastCloudBackupDate](DMDLockdownUtilities, "deviceLastCloudBackupDate");
}

- (id)uniqueIdentifier
{
  return +[DMDMobileGestalt uniqueDeviceID](DMDMobileGestalt, "uniqueDeviceID");
}

@end
