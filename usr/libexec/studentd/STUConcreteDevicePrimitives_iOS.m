@implementation STUConcreteDevicePrimitives_iOS

- (STUDeviceLockProvider_iOS)deviceLockProvider
{
  STUDeviceLockProvider_iOS *deviceLockProvider;
  STUDeviceLockProvider_iOS *v4;
  STUDeviceLockProvider_iOS *v5;

  deviceLockProvider = self->_deviceLockProvider;
  if (!deviceLockProvider)
  {
    v4 = objc_opt_new(STUDeviceLockProvider_iOS);
    v5 = self->_deviceLockProvider;
    self->_deviceLockProvider = v4;

    deviceLockProvider = self->_deviceLockProvider;
  }
  return deviceLockProvider;
}

- (STUDisplayMonitor_iOS)displayMonitor
{
  STUDisplayMonitor_iOS *displayMonitor;
  STUDisplayMonitor_iOS *v4;
  STUDisplayMonitor_iOS *v5;

  displayMonitor = self->_displayMonitor;
  if (!displayMonitor)
  {
    v4 = objc_opt_new(STUDisplayMonitor_iOS);
    v5 = self->_displayMonitor;
    self->_displayMonitor = v4;

    displayMonitor = self->_displayMonitor;
  }
  return displayMonitor;
}

- (STUDeviceVersionProvider)versionProvider
{
  STUDeviceVersionProvider *versionProvider;
  STUDeviceVersionProvider *v4;
  STUDeviceVersionProvider *v5;

  versionProvider = self->_versionProvider;
  if (!versionProvider)
  {
    v4 = objc_opt_new(STUDeviceVersionProvider);
    v5 = self->_versionProvider;
    self->_versionProvider = v4;

    versionProvider = self->_versionProvider;
  }
  return versionProvider;
}

- (STUOpenApplicationProvider_iOS)openAppProvider
{
  STUOpenApplicationProvider_iOS *openAppProvider;
  STUOpenApplicationProvider_iOS *v4;
  STUOpenApplicationProvider_iOS *v5;

  openAppProvider = self->_openAppProvider;
  if (!openAppProvider)
  {
    v4 = objc_opt_new(STUOpenApplicationProvider_iOS);
    v5 = self->_openAppProvider;
    self->_openAppProvider = v4;

    openAppProvider = self->_openAppProvider;
  }
  return openAppProvider;
}

- (id)propertyProviders
{
  STUPasscodeEnabledPropertyProvider_iOS *v3;
  STUStaticPropertyProvider *v4;
  STUStaticPropertyProvider *v5;
  STUScreenIsOnPropertyProvider_iOS *v6;
  STUStaticPropertyProvider *v7;
  STUStaticPropertyProvider *v8;
  STUVolumePropertyProvider_iOS *v9;
  STUStaticPropertyProvider *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  STUStaticPropertyProvider *v14;
  STUMutePropertyProvider_iOS *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  STUModelPropertyProvider_iOS *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  STUDeviceOrientationPropertyProvider_iOS *v30;
  STUInstalledApplicationsProvider_iOS *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  STUChargingStatePropertyProvider_iOS *v46;
  STUAvailableBytesPropertyProvider_iOS *v47;
  STUAppLockedPropertyProvider_iOS *v48;
  STUActiveAirPlayRouteProvider_iOS *v49;
  _QWORD v50[26];

  v49 = objc_opt_new(STUActiveAirPlayRouteProvider_iOS);
  v50[0] = v49;
  v48 = objc_opt_new(STUAppLockedPropertyProvider_iOS);
  v50[1] = v48;
  v47 = objc_opt_new(STUAvailableBytesPropertyProvider_iOS);
  v50[2] = v47;
  v46 = objc_opt_new(STUChargingStatePropertyProvider_iOS);
  v50[3] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS displayMonitor](self, "displayMonitor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "displaysProvider"));
  v50[4] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS displayMonitor](self, "displayMonitor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "displayWidthProvider"));
  v50[5] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS displayMonitor](self, "displayMonitor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "displayHeightProvider"));
  v50[6] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS displayMonitor](self, "displayMonitor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "displayScaleFactorProvider"));
  v50[7] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS displayMonitor](self, "displayMonitor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "interfaceOrientationProvider"));
  v50[8] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS deviceLockProvider](self, "deviceLockProvider"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lockStateProvider"));
  v50[9] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS deviceLockProvider](self, "deviceLockProvider"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "managementLockPasscodeProvider"));
  v50[10] = v32;
  v31 = objc_opt_new(STUInstalledApplicationsProvider_iOS);
  v50[11] = v31;
  v30 = objc_opt_new(STUDeviceOrientationPropertyProvider_iOS);
  v50[12] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS versionProvider](self, "versionProvider"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "buildVersionProvider"));
  v50[13] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS versionProvider](self, "versionProvider"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "systemVersionProvider"));
  v50[14] = v26;
  v25 = objc_opt_new(STUModelPropertyProvider_iOS);
  v50[15] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS openAppProvider](self, "openAppProvider"));
  v50[16] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS openAppProvider](self, "openAppProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "primaryAppProvider"));
  v50[17] = v22;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives_iOS openAppProvider](self, "openAppProvider"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "secondaryAppProvider"));
  v50[18] = v19;
  v3 = objc_opt_new(STUPasscodeEnabledPropertyProvider_iOS);
  v50[19] = v3;
  v4 = [STUStaticPropertyProvider alloc];
  v5 = -[STUStaticPropertyProvider initWithKey:value:](v4, "initWithKey:value:", CRKDevicePlatformKey, &off_1000D4230);
  v50[20] = v5;
  v6 = objc_opt_new(STUScreenIsOnPropertyProvider_iOS);
  v50[21] = v6;
  v7 = [STUStaticPropertyProvider alloc];
  v8 = -[STUStaticPropertyProvider initWithKey:value:](v7, "initWithKey:value:", CRKDeviceSystemNameKey, CFSTR("iOS"));
  v50[22] = v8;
  v9 = objc_opt_new(STUVolumePropertyProvider_iOS);
  v50[23] = v9;
  v10 = [STUStaticPropertyProvider alloc];
  v11 = CRKDeviceEphemeralMultiUserKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isEphemeralMultiUser")));
  v14 = -[STUStaticPropertyProvider initWithKey:value:](v10, "initWithKey:value:", v11, v13);
  v50[24] = v14;
  v15 = objc_opt_new(STUMutePropertyProvider_iOS);
  v50[25] = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 26));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives crossPlatformPropertyProviders](self, "crossPlatformPropertyProviders"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v21));

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAppProvider, 0);
  objc_storeStrong((id *)&self->_versionProvider, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_deviceLockProvider, 0);
}

@end
