@implementation CRFeaturesAvailabilityAgent

- (CRFeaturesAvailabilityAgent)initWithPreferencesManager:(id)a3 vehicleStore:(id)a4
{
  id v7;
  id v8;
  CRFeaturesAvailabilityAgent *v9;
  CRFeaturesAvailabilityAgent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRFeaturesAvailabilityAgent;
  v9 = -[CRFeaturesAvailabilityAgent init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferencesManager, a3);
    objc_storeStrong((id *)&v10->_vehicleStore, a4);
  }

  return v10;
}

- (unint64_t)_deviceFeatures
{
  const void *v3;
  unint64_t v4;
  int v5;
  BOOL v6;
  BOOL v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  int v28;
  void *v29;

  v3 = (const void *)MGCopyAnswer(CFSTR("HardwarePlatform"), 0);
  v4 = (unint64_t)v3;
  if (v3)
  {
    v5 = CFEqual(v3, CFSTR("t7000"));
    v6 = CFEqual((CFTypeRef)v4, CFSTR("s8000"))
      || CFEqual((CFTypeRef)v4, CFSTR("s8001"))
      || CFEqual((CFTypeRef)v4, CFSTR("s8003")) != 0;
    v7 = CFEqual((CFTypeRef)v4, CFSTR("t8010"))
      || CFEqual((CFTypeRef)v4, CFSTR("t8011"))
      || CFEqual((CFTypeRef)v4, CFSTR("t8012")) != 0;
    if (v5)
      v8 = 1;
    else
      v8 = v6;
    v9 = v8 | v7;
    v10 = (v8 | v7) ^ 1;
    v11 = MGGetBoolAnswer(CFSTR("DeviceSupportsCarPlay2"));
    v12 = v11;
    if ((v11 & 1) == 0)
    {
      v13 = CarGeneralLogging(v11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "device doesn't support HEVC", (uint8_t *)&v28, 2u);
      }

    }
    CFRelease((CFTypeRef)v4);
    v15 = 7;
    if ((v9 & 1) != 0)
      v15 = 4;
    v16 = 3;
    if ((v9 & 1) != 0)
      v16 = 0;
    if (v12)
      v4 = v15;
    else
      v4 = v16;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent preferencesManager](self, "preferencesManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "isCarPlayThemeSupportEnabled"));

  v19 = objc_msgSend(v18, "BOOLValue");
  if ((v19 & 1) != 0)
  {
    v20 = v4 | 0x38;
    if (!v12)
      v20 = v4;
    if ((v10 & 1) != 0)
      v4 = v20;
  }
  else
  {
    v21 = CarGeneralLogging(v19);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "features disabled because global preference is disabled", (uint8_t *)&v28, 2u);
    }

  }
  v23 = CarGeneralLogging(v19);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CRCarPlayFeaturesName(v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v28 = 138412290;
    v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Device supported features: %@", (uint8_t *)&v28, 0xCu);

  }
  return v4;
}

- (id)_BOOLValueInCarPlayDomainForKey:(__CFString *)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  NSNumber *v6;
  void *v7;

  v3 = (const __CFBoolean *)CFPreferencesCopyValue(a3, CRPreferencesNotMigratedDomain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
    {
      v6 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", CFBooleanGetValue(v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)_disabledCarPlayFeaturesForVehicle:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "disabledFeaturesPreference"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 0;

  return (unint64_t)v5;
}

- (unint64_t)_supportedCarPlayFeaturesForVehicle:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  uint64_t v21;

  v4 = a3;
  v5 = -[CRFeaturesAvailabilityAgent deviceSupportedCarPlayFeatures](self, "deviceSupportedCarPlayFeatures");
  if (!v4)
  {
    v11 = CRCarPlayFeaturesAllFerriteFeatures();
    v10 = v11 & v5;
    goto LABEL_14;
  }
  v6 = -[CRFeaturesAvailabilityAgent _disabledCarPlayFeaturesForVehicle:](self, "_disabledCarPlayFeaturesForVehicle:", v4);
  v7 = v6 & v5;
  if ((v6 & v5) != 0)
  {
    v8 = CarGeneralLogging(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v20 = 134349056;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: features disabled by preference: %{public}lu", (uint8_t *)&v20, 0xCu);
    }

    v5 ^= v7;
  }
  v10 = CRCarPlayFeaturesAllFerriteFeatures() & v5;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportsThemeAssets"));
  if (!v11)
    goto LABEL_14;
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportsThemeAssets"));
  v14 = objc_msgSend(v13, "BOOLValue");

  if (!v10 || !v14)
  {
    if ((v14 & 1) != 0)
    {
LABEL_17:
      v5 ^= v10;
      goto LABEL_18;
    }
LABEL_14:
    v17 = CarGeneralLogging(v11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 134349056;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: vehicle doesn't support features requiring asset: %{public}lu", (uint8_t *)&v20, 0xCu);
    }

    goto LABEL_17;
  }
  v15 = CarGeneralLogging(v11);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v20 = 134349056;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "supportedCarPlayFeatures: device and vehicle support features requiring asset: %{public}lu", (uint8_t *)&v20, 0xCu);
  }

LABEL_18:
  return v5;
}

- (unint64_t)deviceSupportedCarPlayFeatures
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent preferencesManager](self, "preferencesManager"));
  v4 = objc_msgSend(v3, "isCarPlayAllowed");

  if (v4)
    return -[CRFeaturesAvailabilityAgent _deviceFeatures](self, "_deviceFeatures");
  else
    return 0;
}

- (BOOL)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  int v18;
  unint64_t v19;
  __int16 v20;
  const __CFString *v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent vehicleStore](self, "vehicleStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleForIdentifier:", v6));

  if (v8)
  {
    v10 = -[CRFeaturesAvailabilityAgent _disabledCarPlayFeaturesForVehicle:](self, "_disabledCarPlayFeaturesForVehicle:", v8);
    v11 = v10 & a3;
    v12 = (v10 & a3) != 0;
    v13 = CarGeneralLogging(v10);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("NO");
      if (v11)
        v15 = CFSTR("YES");
      v18 = 134349314;
      v19 = a3;
      v20 = 2114;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "disables CarPlay features %{public}lu: %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v16 = CarGeneralLogging(v9);
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100069170(v6);
    v12 = 0;
  }

  return v12;
}

- (BOOL)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v24;
  unint64_t v25;
  __int16 v26;
  void *v27;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent vehicleStore](self, "vehicleStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vehicleForIdentifier:", v8));

  if (v10)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "disabledFeaturesPreference"));
    v13 = v12;
    if (v12)
      v12 = (uint64_t)objc_msgSend((id)v12, "unsignedIntegerValue");
    if (v5)
      v14 = v12 | a3;
    else
      v14 = v12 & ~a3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
    objc_msgSend(v10, "setDisabledFeaturesPreference:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent vehicleStore](self, "vehicleStore"));
    v17 = objc_msgSend(v16, "saveVehicle:", v10);

    v19 = CarGeneralLogging(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      v24 = 134349314;
      v25 = v14;
      v26 = 2112;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "set disabled CarPlay features to %{public}lu for vehicleID: %@", (uint8_t *)&v24, 0x16u);

    }
  }
  else
  {
    v22 = CarGeneralLogging(v11);
    v13 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100069170(v8);
  }

  return v10 != 0;
}

- (unint64_t)supportedCarPlayFeaturesForCertificateSerial:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent vehicleStore](self, "vehicleStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleForCertificateSerial:", v4));

  v7 = -[CRFeaturesAvailabilityAgent _supportedCarPlayFeaturesForVehicle:](self, "_supportedCarPlayFeaturesForVehicle:", v6);
  return v7;
}

- (unint64_t)supportedCarPlayFeaturesForVehicleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRFeaturesAvailabilityAgent vehicleStore](self, "vehicleStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleForIdentifier:", v4));

  v7 = -[CRFeaturesAvailabilityAgent _supportedCarPlayFeaturesForVehicle:](self, "_supportedCarPlayFeaturesForVehicle:", v6);
  return v7;
}

- (CRCarPlayPreferences)preferencesManager
{
  return self->_preferencesManager;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_preferencesManager, 0);
}

@end
