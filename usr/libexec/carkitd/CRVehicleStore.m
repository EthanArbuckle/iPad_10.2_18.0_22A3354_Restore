@implementation CRVehicleStore

+ (id)_allPreferencesPairings
{
  void *v2;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("pairings"), CRPreferencesNotMigratedDomain);
  if (!v2)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  return v2;
}

+ (id)_itemClassKeychainAttributes
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v2, "setObject:forKey:", CFSTR("com.apple.carplay.pairings"), kSecAttrAccessGroup);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("carplay-pairing"), kSecAttrService);
  objc_msgSend(v2, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  return v2;
}

+ (id)_keychainItemAttributesForAllVehicles
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  CFTypeRef result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;

  result = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_itemClassKeychainAttributes"));
  objc_msgSend(v2, "setObject:forKey:", kSecMatchLimitAll, kSecMatchLimit);
  objc_msgSend(v2, "setObject:forKey:", kCFBooleanTrue, kSecReturnAttributes);
  objc_msgSend(v2, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  if (v2)
  {
    v3 = SecItemCopyMatching((CFDictionaryRef)v2, &result);
    v4 = v3;
    v5 = (void *)result;
    v6 = CarGeneralLogging(v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4 || !v5)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412546;
        v12 = v2;
        v13 = 1024;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No vehicles found for keychain query: %@ error: %i", buf, 0x12u);
      }
      v5 = 0;
    }
    else if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found queried keychain items: %@", buf, 0xCu);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allStoredVehicles
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  if (!+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))return 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CRVehicleStore cachedVehicles](self, "cachedVehicles"));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = CarGeneralLogging(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100068CD0(v4, v6);

    v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithSet:copyItems:", v4, 1);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = objc_msgSend((id)objc_opt_class(self), "_keychainItemAttributesForAllVehicles");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "mutableCopy");

    v13 = objc_msgSend((id)objc_opt_class(self), "_allPreferencesPairings");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A4A8;
    v17[3] = &unk_1000B51E0;
    v17[4] = self;
    v18 = v12;
    v15 = v9;
    v19 = v15;
    v16 = v12;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);
    if (objc_msgSend(v15, "count"))
      -[CRVehicleStore setCachedVehicles:](self, "setCachedVehicles:", v15);
    v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithSet:copyItems:", v15, 1);

  }
  return v7;
}

- (NSSet)cachedVehicles
{
  return self->_cachedVehicles;
}

+ (id)_identifyingKeychainAttributesForVehicle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_itemClassKeychainAttributes"));
    objc_msgSend(v6, "setObject:forKey:", v5, kSecAttrAccount);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_addKeychainAttributesForVehicle:(id)a3 toDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleName"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleName"));
    objc_msgSend(v6, "setObject:forKey:", v8, kSecAttrLabel);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateSerialNumber"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateSerialNumber"));
    objc_msgSend(v6, "setObject:forKey:", v10, kSecValueData);

  }
  v13 = bswap32(objc_msgSend(v5, "pairingStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v13, 4));
  v12 = bswap32(objc_msgSend(v5, "enhancedIntegrationStatus"));
  objc_msgSend(v11, "appendBytes:length:", &v12, 4);
  objc_msgSend(v6, "setObject:forKey:", v11, kSecAttrGeneric);

}

+ (id)_allKeychainAttributesForVehicle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_identifyingKeychainAttributesForVehicle:", v4));
  objc_msgSend(a1, "_addKeychainAttributesForVehicle:toDictionary:", v4, v5);

  return v5;
}

+ (id)_creationKeychainAttributesForVehicle:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allKeychainAttributesForVehicle:", a3));
  objc_msgSend(v3, "setObject:forKey:", kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, kSecAttrAccessible);
  return v3;
}

+ (id)_updateKeychainAttributesForVehicle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(a1, "_addKeychainAttributesForVehicle:toDictionary:", v4, v5);

  return v5;
}

+ (id)_keychainAttributesMatchingQuery:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  CFTypeRef result;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  int v15;

  result = 0;
  v3 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setObject:forKey:", kCFBooleanTrue, kSecReturnAttributes);
  objc_msgSend(v3, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  if (v3)
  {
    v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
    v5 = v4;
    v6 = (void *)result;
    v7 = CarGeneralLogging(v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5 || !v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        v14 = 1024;
        v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No vehicle found for keychain query: %@ error: %i", buf, 0x12u);
      }
      v6 = 0;
    }
    else if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found a queried keychain item: %@", buf, 0xCu);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_addKeychainPairingForVehicle:(id)a3
{
  id v4;
  id v5;
  const __CFDictionary *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  const __CFDictionary *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int v22;
  const __CFDictionary *v23;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "_identifyingKeychainAttributesForVehicle:", v4);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(a1), "_keychainAttributesMatchingQuery:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_opt_class(a1);
    if (v8)
    {
      v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_updateKeychainAttributesForVehicle:", v4));
      v11 = SecItemUpdate(v6, v10);
      v12 = v11;
      v13 = CarGeneralLogging(v11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v12)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100068A28();
LABEL_17:
        v16 = 0;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v10;
        v19 = "Updated a keychain item: %@";
        goto LABEL_13;
      }
    }
    else
    {
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_creationKeychainAttributesForVehicle:", v4));
      v10 = v17;
      if (!v17 || (v17 = (const __CFDictionary *)SecItemAdd(v17, 0), (_DWORD)v17))
      {
        v20 = CarGeneralLogging(v17);
        v15 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1000689C8();
        goto LABEL_17;
      }
      v18 = CarGeneralLogging(v17);
      v15 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v10;
        v19 = "Created a keychain item: %@";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 0xCu);
      }
    }
    v16 = 1;
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

+ (BOOL)_removeKeychainPairingForVehicle:(id)a3
{
  id v4;
  id v5;
  const __CFDictionary *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  int v14;
  const __CFDictionary *v15;
  __int16 v16;
  int v17;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "_identifyingKeychainAttributesForVehicle:", v4);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = SecItemDelete(v6);
    v8 = v7;
    if (!(_DWORD)v7)
    {
      v9 = CarGeneralLogging(v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleted keychain items matching: %@", (uint8_t *)&v14, 0xCu);
      }
      v11 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
  }
  v12 = CarGeneralLogging(v7);
  v10 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 1024;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete keychain items matching: %@ error: %i", (uint8_t *)&v14, 0x12u);
  }
  v11 = 0;
LABEL_10:

  return v11;
}

+ (id)_allUnpairedVehicleStorage
{
  void *v2;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("unpairedVehicleStorage"), CRPreferencesNotMigratedDomain);
  if (!v2)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  return v2;
}

+ (id)payloadForVehicleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allUnpairedVehicleStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

+ (BOOL)setPayload:(id)a3 forVehicleWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allUnpairedVehicleStorage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v8));

  v11 = CarGeneralLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v13)
    {
      v26 = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting payload %@ for identifier %@", (uint8_t *)&v26, 0x16u);
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7);
  }
  else
  {
    if (v13)
    {
      v26 = 138412290;
      v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing payload for identifier %@", (uint8_t *)&v26, 0xCu);
    }

    objc_msgSend(v9, "removeObjectForKey:", v7);
  }
  CFPreferencesSetAppValue(CFSTR("unpairedVehicleStorage"), v9, CRPreferencesNotMigratedDomain);
  v14 = CFPreferencesAppSynchronize(CRPreferencesNotMigratedDomain);
  v15 = v14;
  if (!(_DWORD)v14)
  {
    v16 = CarGeneralLogging(v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100068A88(v17, v18, v19, v20, v21, v22, v23, v24);

  }
  return v15 != 0;
}

+ (BOOL)removePayloadForVehicleWithIdentifier:(id)a3
{
  return objc_msgSend(a1, "setPayload:forVehicleWithIdentifier:", 0, a3);
}

+ (id)_preferencesAttributesForVehicle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  uint64_t v93;
  _BYTE v94[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehicleName"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehicleName"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("name"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothAddress"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothAddress"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("bluetoothAddress"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "carplayWiFiUUID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "carplayWiFiUUID"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("carplayWiFiUUID"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessoryProtocols"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessoryProtocols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("carPlayProtocols"));

  }
  if (objc_msgSend(v3, "supportsEnhancedIntegration"))
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("supportsEnhancedIntegration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsMixableAudio")));
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("supportsMixableAudio"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isSiriBargeInDisabled")));
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("isSiriBargeInDisabled"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supportsStartSessionRequest"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supportsStartSessionRequest"));
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("supportsStartSessionRequest"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsUSBCarPlay")));
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("supportsUSBCarPlay"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsWirelessCarPlay")));
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("supportsWirelessCarPlay"));

  if (objc_msgSend(v3, "albumArtUserPreference"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "albumArtUserPreference")));
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("albumArtUserPreference"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wallpaperIdentifier"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wallpaperIdentifier"));
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("wallpaperIdentifierUserPreference"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousWallpaperIdentifier"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousWallpaperIdentifier"));
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("previousWallpaperIdentifierUserPreference"));

  }
  if (objc_msgSend(v3, "appearanceModePreference") == (id)-1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref interfaceStyle](CARPrototypePref, "interfaceStyle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "value"));

    if (v26)
    {
      objc_msgSend(v3, "setAppearanceModePreference:", objc_msgSend(v26, "unsignedIntegerValue"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref interfaceStyle](CARPrototypePref, "interfaceStyle"));
      objc_msgSend(v27, "setValue:", 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref latestInterfaceStyle](CARPrototypePref, "latestInterfaceStyle"));
      objc_msgSend(v28, "setValue:", v26);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[CARPrototypePref latestInterfaceStyle](CARPrototypePref, "latestInterfaceStyle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "value"));

      if (v28)
        objc_msgSend(v3, "setAppearanceModePreference:", objc_msgSend(v28, "unsignedIntegerValue"));
    }

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "appearanceModePreference")));
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("appearanceModeUserPreference"));

  if (objc_msgSend(v3, "mapsAppearancePreference") != (id)-1)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "mapsAppearancePreference")));
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("mapsAppearanceUserPreference"));

  }
  if (objc_msgSend(v3, "colorFilterPreference"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "colorFilterPreference")));
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("colorFilterUserPreference"));

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorFilterIntensityPreference"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorFilterIntensityPreference"));
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("colorFilterIntensityUserPreference"));

  }
  if (objc_msgSend(v3, "boldTextPreference"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "boldTextPreference")));
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("boldTextUserPreference"));

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "soundRecognitionPreference")));
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("soundRecognitionUserPreference"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "voiceControlPreference")));
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("voiceControlUserPreference"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "disabledFeaturesPreference"));
  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "disabledFeaturesPreference"));
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("disabledFeaturesPreference"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsBluetoothLE")));
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("supportsBluetoothLE"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supportsThemeAssets"));
  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supportsThemeAssets"));
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("supportsThemeAssets"));

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetIdentifier"));

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetIdentifier"));
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("clusterAssetIdentifier"));

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetiOSContentVersion"));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetiOSContentVersion"));
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("clusterAssetiOSContentVersion"));

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetVersion"));

  if (v47)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetVersion"));
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("clusterAssetVersion"));

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SDKVersion"));

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "SDKVersion"));
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("SDKVersion"));

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetURL"));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clusterAssetURL"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "path"));
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("clusterAssetPath"));

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetiOSContentVersion"));

  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetiOSContentVersion"));
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("stagedClusterAssetiOSContentVersion"));

  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetVersion"));

  if (v56)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetVersion"));
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("stagedClusterAssetVersion"));

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetURL"));

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagedClusterAssetURL"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "path"));
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("stagedClusterAssetPath"));

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayThemeData"));

  if (v61)
  {
    v87 = v4;
    v62 = objc_alloc_init((Class)NSMutableDictionary);
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayThemeData"));
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v89;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v89 != v66)
            objc_enumerationMutation(v63);
          v68 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayThemeData"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKey:", v68));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "asDictionary"));

          if (v71)
          {
            objc_msgSend(v62, "setObject:forKey:", v71, v68);
          }
          else
          {
            v73 = CarGeneralLogging(v72);
            v74 = objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v68;
              _os_log_fault_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_FAULT, "Failed to serialize theme data for display: %@", buf, 0xCu);
            }

          }
          v67 = (char *)v67 + 1;
        }
        while (v65 != v67);
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
      }
      while (v65);
    }

    v4 = v87;
    objc_msgSend(v87, "setObject:forKey:", v62, CFSTR("displayThemeData"));

  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasGaugeClusterScreen"));

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasGaugeClusterScreen"));
    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("hasGaugeClusterScreen"));

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "finishedWelcome"));

  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "finishedWelcome"));
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("finishedWelcome"));

  }
  if (CRIsInternalInstall())
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastConnectedDate"));

    if (v79)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastConnectedDate"));
      objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("lastConnectedDate"));

    }
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehicleModelName"));

    if (v81)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehicleModelName"));
      objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("vehicleModelName"));

    }
  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internalNotes"));

  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internalNotes"));
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("internalNotes"));

  }
  v85 = v4;

  return v85;
}

+ (void)_applyPreferencesAttributes:(id)a3 toVehicle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  id v102;
  uint64_t v103;
  id v104;
  void *v105;
  id v106;
  uint64_t v107;
  id v108;
  void *v109;
  id v110;
  uint64_t v111;
  id v112;
  void *v113;
  id v114;
  uint64_t v115;
  id v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  id v124;
  uint64_t v125;
  id v126;
  void *v127;
  id v128;
  uint64_t v129;
  id v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  id v141;
  id v142;
  id v143;
  uint64_t v144;
  void *i;
  uint64_t v146;
  void *v147;
  id v148;
  uint64_t v149;
  NSObject *v150;
  uint64_t v151;
  id v152;
  void *v153;
  id v154;
  uint64_t v155;
  id v156;
  void *v157;
  id v158;
  id v159;
  uint64_t v160;
  id v161;
  void *v162;
  id v163;
  uint64_t v164;
  id v165;
  void *v166;
  id v167;
  uint64_t v168;
  id v169;
  void *v170;
  id v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  uint8_t buf[4];
  uint64_t v211;
  _BYTE v212[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(NSString);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("name")));
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10)
    objc_msgSend(v6, "setVehicleName:", v10);
  v11 = objc_opt_class(NSString);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("bluetoothAddress")));
  v13 = v12;
  if (v12 && (objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (v14)
    objc_msgSend(v6, "setBluetoothAddress:", v14);
  v204 = v14;
  v15 = objc_opt_class(NSString);
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("carplayWiFiUUID")));
  v17 = v16;
  if (v16 && (objc_opt_isKindOfClass(v16, v15) & 1) != 0)
    v18 = v17;
  else
    v18 = 0;

  if (v18)
    objc_msgSend(v6, "setCarplayWiFiUUID:", v18);
  v203 = v18;
  v19 = objc_opt_class(NSString);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("carPlayProtocols")));
  v21 = sub_1000099A0(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v22));
    objc_msgSend(v6, "setAccessoryProtocols:", v23);

  }
  v24 = objc_opt_class(NSNumber);
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsEnhancedIntegration")));
  v26 = v25;
  if (v25 && (objc_opt_isKindOfClass(v25, v24) & 1) != 0)
    v27 = v26;
  else
    v27 = 0;

  if (v27)
    objc_msgSend(v6, "setSupportsEnhancedIntegration:", objc_msgSend(v27, "BOOLValue"));
  v201 = v27;
  v28 = objc_opt_class(NSNumber);
  v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsMixableAudio")));
  v30 = v29;
  if (v29 && (objc_opt_isKindOfClass(v29, v28) & 1) != 0)
    v31 = v30;
  else
    v31 = 0;

  if (v31)
    objc_msgSend(v6, "setSupportsMixableAudio:", objc_msgSend(v31, "BOOLValue"));
  v200 = v31;
  v32 = objc_opt_class(NSNumber);
  v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("isSiriBargeInDisabled")));
  v34 = v33;
  if (v33 && (objc_opt_isKindOfClass(v33, v32) & 1) != 0)
    v35 = v34;
  else
    v35 = 0;

  if (v35)
    objc_msgSend(v6, "setSiriBargeInDisabled:", objc_msgSend(v35, "BOOLValue"));
  v199 = v35;
  v36 = objc_opt_class(NSNumber);
  v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsUSBCarPlay")));
  v38 = v37;
  if (v37 && (objc_opt_isKindOfClass(v37, v36) & 1) != 0)
    v39 = v38;
  else
    v39 = 0;

  if (v39)
    objc_msgSend(v6, "setSupportsUSBCarPlay:", objc_msgSend(v39, "BOOLValue"));
  v198 = v39;
  v40 = objc_opt_class(NSNumber);
  v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsWirelessCarPlay")));
  v42 = v41;
  if (v41 && (objc_opt_isKindOfClass(v41, v40) & 1) != 0)
    v43 = v42;
  else
    v43 = 0;

  if (v43)
    objc_msgSend(v6, "setSupportsWirelessCarPlay:", objc_msgSend(v43, "BOOLValue"));
  v197 = v43;
  v44 = objc_opt_class(NSNumber);
  v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsStartSessionRequest")));
  v46 = v45;
  if (v45 && (objc_opt_isKindOfClass(v45, v44) & 1) != 0)
    v47 = v46;
  else
    v47 = 0;

  v48 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
    objc_msgSend(v6, "setSupportsStartSessionRequest:", v47);
  v196 = v47;
  v49 = objc_opt_class(NSNumber);
  v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("albumArtUserPreference")));
  v51 = v50;
  if (v50 && (objc_opt_isKindOfClass(v50, v49) & 1) != 0)
    v52 = v51;
  else
    v52 = 0;

  if (v52)
    objc_msgSend(v6, "setAlbumArtUserPreference:", objc_msgSend(v52, "integerValue"));
  v195 = v52;
  v53 = objc_opt_class(NSString);
  v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("wallpaperIdentifierUserPreference")));
  v55 = v54;
  if (v54 && (objc_opt_isKindOfClass(v54, v53) & 1) != 0)
    v56 = v55;
  else
    v56 = 0;

  if (v56)
    objc_msgSend(v6, "setWallpaperIdentifier:", v56);
  v194 = v56;
  v57 = objc_opt_class(NSString);
  v58 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("previousWallpaperIdentifierUserPreference")));
  v59 = v58;
  if (v58 && (objc_opt_isKindOfClass(v58, v57) & 1) != 0)
    v60 = v59;
  else
    v60 = 0;

  if (v60)
    objc_msgSend(v6, "setPreviousWallpaperIdentifier:", v60);
  v193 = v60;
  v61 = objc_opt_class(NSNumber);
  v62 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("appearanceModeUserPreference")));
  v63 = v62;
  if (v62 && (objc_opt_isKindOfClass(v62, v61) & 1) != 0)
    v64 = v63;
  else
    v64 = 0;

  if (v64)
    objc_msgSend(v6, "setAppearanceModePreference:", objc_msgSend(v64, "integerValue"));
  v192 = v64;
  v65 = objc_opt_class(NSNumber);
  v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("mapsAppearanceUserPreference")));
  v67 = v66;
  if (v66 && (objc_opt_isKindOfClass(v66, v65) & 1) != 0)
    v68 = v67;
  else
    v68 = 0;

  if (v68)
    objc_msgSend(v6, "setMapsAppearancePreference:", objc_msgSend(v68, "integerValue"));
  v191 = v68;
  v69 = objc_opt_class(NSNumber);
  v70 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("colorFilterUserPreference")));
  v71 = v70;
  if (v70 && (objc_opt_isKindOfClass(v70, v69) & 1) != 0)
    v72 = v71;
  else
    v72 = 0;
  v202 = (void *)v22;

  if (v72)
    objc_msgSend(v6, "setColorFilterPreference:", objc_msgSend(v72, "integerValue"));
  v190 = v72;
  v73 = objc_opt_class(NSString);
  v74 = objc_opt_class(NSNumber);
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("colorFilterIntensityUserPreference")));
  v76 = sub_100009A7C(v73, v74, v75);
  v77 = objc_claimAutoreleasedReturnValue(v76);

  if (v77)
    objc_msgSend(v6, "setColorFilterIntensityPreference:", v77);
  v189 = (void *)v77;
  v78 = objc_opt_class(NSNumber);
  v79 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("boldTextUserPreference")));
  v80 = v79;
  if (v79 && (objc_opt_isKindOfClass(v79, v78) & 1) != 0)
    v81 = v80;
  else
    v81 = 0;

  if (v81)
    objc_msgSend(v6, "setBoldTextPreference:", objc_msgSend(v81, "integerValue"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("soundRecognitionUserPreference")));
  v83 = v82;
  if (v82)
    objc_msgSend(v6, "setSoundRecognitionPreference:", objc_msgSend(v82, "integerValue"));
  v187 = v83;
  v188 = v81;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("voiceControlUserPreference")));
  v85 = v84;
  if (v84)
    objc_msgSend(v6, "setVoiceControlPreference:", objc_msgSend(v84, "integerValue"));
  v186 = v85;
  v86 = objc_opt_class(NSNumber);
  v87 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsBluetoothLE")));
  v88 = v87;
  if (v87 && (objc_opt_isKindOfClass(v87, v86) & 1) != 0)
    v89 = v88;
  else
    v89 = 0;

  if (v89)
    objc_msgSend(v6, "setSupportsBluetoothLE:", objc_msgSend(v89, "BOOLValue"));
  v185 = v89;
  v90 = objc_opt_class(NSNumber);
  v91 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("disabledFeaturesPreference")));
  v92 = v91;
  if (v91 && (objc_opt_isKindOfClass(v91, v90) & 1) != 0)
    v93 = v92;
  else
    v93 = 0;

  if (v93)
    objc_msgSend(v6, "setDisabledFeaturesPreference:", v93);
  v184 = v93;
  v94 = objc_opt_class(NSNumber);
  v95 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("supportsThemeAssets")));
  v96 = v95;
  if (v95 && (objc_opt_isKindOfClass(v95, v94) & 1) != 0)
    v97 = v96;
  else
    v97 = 0;

  v98 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v97, v98) & 1) != 0)
    objc_msgSend(v6, "setSupportsThemeAssets:", v97);
  v183 = v97;
  v99 = objc_opt_class(NSString);
  v100 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("clusterAssetIdentifier")));
  v101 = v100;
  if (v100 && (objc_opt_isKindOfClass(v100, v99) & 1) != 0)
    v102 = v101;
  else
    v102 = 0;

  if (v102)
    objc_msgSend(v6, "setClusterAssetIdentifier:", v102);
  v182 = v102;
  v103 = objc_opt_class(NSString);
  v104 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("clusterAssetiOSContentVersion")));
  v105 = v104;
  if (v104 && (objc_opt_isKindOfClass(v104, v103) & 1) != 0)
    v106 = v105;
  else
    v106 = 0;

  if (v106)
    objc_msgSend(v6, "setClusterAssetiOSContentVersion:", v106);
  v181 = v106;
  v107 = objc_opt_class(NSNumber);
  v108 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("clusterAssetVersion")));
  v109 = v108;
  if (v108 && (objc_opt_isKindOfClass(v108, v107) & 1) != 0)
    v110 = v109;
  else
    v110 = 0;

  if (v110)
    objc_msgSend(v6, "setClusterAssetVersion:", v110);
  v180 = v110;
  v111 = objc_opt_class(NSString);
  v112 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SDKVersion")));
  v113 = v112;
  if (v112 && (objc_opt_isKindOfClass(v112, v111) & 1) != 0)
    v114 = v113;
  else
    v114 = 0;

  if (v114)
    objc_msgSend(v6, "setSDKVersion:", v114);
  v179 = v114;
  v115 = objc_opt_class(NSString);
  v116 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("clusterAssetPath")));
  v117 = v116;
  if (v116 && (objc_opt_isKindOfClass(v116, v115) & 1) != 0)
    v118 = v117;
  else
    v118 = 0;

  v119 = v118;
  if (v118)
  {
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v118, 0));
    objc_msgSend(v6, "setClusterAssetURL:", v120);

  }
  v178 = v119;
  v121 = objc_opt_class(NSString);
  v122 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("stagedClusterAssetiOSContentVersion")));
  v123 = v122;
  if (v122 && (objc_opt_isKindOfClass(v122, v121) & 1) != 0)
    v124 = v123;
  else
    v124 = 0;

  if (v124)
    objc_msgSend(v6, "setStagedClusterAssetiOSContentVersion:", v124);
  v177 = v124;
  v125 = objc_opt_class(NSNumber);
  v126 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("stagedClusterAssetVersion")));
  v127 = v126;
  if (v126 && (objc_opt_isKindOfClass(v126, v125) & 1) != 0)
    v128 = v127;
  else
    v128 = 0;

  if (v128)
    objc_msgSend(v6, "setStagedClusterAssetVersion:", v128);
  v176 = v128;
  v129 = objc_opt_class(NSString);
  v130 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("stagedClusterAssetPath")));
  v131 = v130;
  if (v130 && (objc_opt_isKindOfClass(v130, v129) & 1) != 0)
    v132 = v131;
  else
    v132 = 0;

  v133 = v132;
  if (v132)
  {
    v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v132, 0));
    objc_msgSend(v6, "setStagedClusterAssetURL:", v134);

  }
  v175 = v133;
  v135 = objc_opt_class(NSString);
  v136 = objc_opt_class(NSDictionary);
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("displayThemeData")));
  v138 = sub_100009A7C(v135, v136, v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue(v138);

  v205 = v139;
  if (v139)
  {
    v172 = v10;
    v173 = v6;
    v174 = v5;
    v140 = objc_alloc_init((Class)NSMutableDictionary);
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v209 = 0u;
    v141 = v139;
    v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v206, v212, 16);
    if (v142)
    {
      v143 = v142;
      v144 = *(_QWORD *)v207;
      do
      {
        for (i = 0; i != v143; i = (char *)i + 1)
        {
          if (*(_QWORD *)v207 != v144)
            objc_enumerationMutation(v141);
          v146 = *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * (_QWORD)i);
          v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKey:", v146, v172));
          v148 = objc_msgSend(objc_alloc((Class)CRDisplayThemeData), "initWithDictionary:", v147);
          if (v148)
          {
            objc_msgSend(v140, "setObject:forKey:", v148, v146);
          }
          else
          {
            v149 = CarGeneralLogging(0);
            v150 = objc_claimAutoreleasedReturnValue(v149);
            if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v211 = v146;
              _os_log_fault_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_FAULT, "Failed to deserialize theme data for display: %@", buf, 0xCu);
            }

          }
        }
        v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v206, v212, 16);
      }
      while (v143);
    }

    v6 = v173;
    objc_msgSend(v173, "setDisplayThemeData:", v140);

    v5 = v174;
    v10 = v172;
  }
  v151 = objc_opt_class(NSNumber);
  v152 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("hasGaugeClusterScreen")));
  v153 = v152;
  if (v152 && (objc_opt_isKindOfClass(v152, v151) & 1) != 0)
    v154 = v153;
  else
    v154 = 0;

  if (v154)
    objc_msgSend(v6, "setHasGaugeClusterScreen:", v154);
  v155 = objc_opt_class(NSNumber);
  v156 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("finishedWelcome")));
  v157 = v156;
  if (v156 && (objc_opt_isKindOfClass(v156, v155) & 1) != 0)
    v158 = v157;
  else
    v158 = 0;

  if (v158)
    v159 = objc_msgSend(v6, "setFinishedWelcome:", v158);
  if (CRIsInternalInstall(v159))
  {
    v160 = objc_opt_class(NSDate);
    v161 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("lastConnectedDate")));
    v162 = v161;
    if (v161 && (objc_opt_isKindOfClass(v161, v160) & 1) != 0)
      v163 = v162;
    else
      v163 = 0;

    if (v163)
      objc_msgSend(v6, "setLastConnectedDate:", v163);
    v164 = objc_opt_class(NSString);
    v165 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("vehicleModelName")));
    v166 = v165;
    if (v165 && (objc_opt_isKindOfClass(v165, v164) & 1) != 0)
      v167 = v166;
    else
      v167 = 0;

    if (v167)
      objc_msgSend(v6, "setVehicleModelName:", v167);

  }
  v168 = objc_opt_class(NSString);
  v169 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("internalNotes")));
  v170 = v169;
  if (v169 && (objc_opt_isKindOfClass(v169, v168) & 1) != 0)
    v171 = v170;
  else
    v171 = 0;

  if (v171)
    objc_msgSend(v6, "setInternalNotes:", v171);

}

+ (BOOL)_addPreferencesPairingForVehicle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(a1), "_preferencesAttributesForVehicle:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allPreferencesPairings"));
      v10 = objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "setObject:forKey:", v8, v6);
      CFPreferencesSetAppValue(CFSTR("pairings"), v10, CRPreferencesNotMigratedDomain);
      v11 = CFPreferencesAppSynchronize(CRPreferencesNotMigratedDomain);
      v12 = (_DWORD)v11 != 0;
      if (!(_DWORD)v11)
      {
        v13 = CarGeneralLogging(v11);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100068AB8((uint64_t)v6, v4, v14);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_removePreferencesPairingForVehicle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(a1, "_removePreferencesPairingForVehicleIdentifier:", v6);
  if ((v7 & 1) == 0)
  {
    v9 = CarGeneralLogging(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100068B44((uint64_t)v6, v4, v10);

    goto LABEL_7;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

+ (BOOL)_removePreferencesPairingForVehicleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allPreferencesPairings"));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", v4);
  CFPreferencesSetAppValue(CFSTR("pairings"), v6, CRPreferencesNotMigratedDomain);
  LOBYTE(v5) = CFPreferencesAppSynchronize(CRPreferencesNotMigratedDomain) != 0;

  return (char)v5;
}

+ (void)_cleanupPreferencesForIncompleteVehicleIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_100068C38();

  v10 = objc_msgSend((id)objc_opt_class(a1), "_removePreferencesPairingForVehicleIdentifier:", v6);
  v11 = (int)v10;
  v12 = CarGeneralLogging(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cleaned up preferences for missing keychain item %@ (%@)", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_100068BD0();
  }

}

+ (void)postPairingsDidChangeNotification
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = CarGeneralLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "posting pairings changed", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CRPairedVehiclesDidChangeNotification, 0);

}

- (CRVehicleStore)init
{
  CRVehicleStore *v2;
  CRVehicleStore *v3;
  CARObserverHashTable *v4;
  CARObserverHashTable *observers;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRVehicleStore;
  v2 = -[CRVehicleStore init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[CRVehicleStore _invalidateCachedVehicles](v2, "_invalidateCachedVehicles");
    v4 = (CARObserverHashTable *)objc_msgSend(objc_alloc((Class)CARObserverHashTable), "initWithProtocol:", &OBJC_PROTOCOL___CRVehicleStoreObserving);
    observers = v3->_observers;
    v3->_observers = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "handleAvailabilityDidChange:", CRVehicleStoreAvailabilityDidChangeNotification, 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRVehicleStore;
  -[CRVehicleStore dealloc](&v4, "dealloc");
}

- (void)_invalidateCachedVehicles
{
  -[CRVehicleStore setCachedVehicles:](self, "setCachedVehicles:", 0);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRVehicleStore observers](self, "observers"));
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRVehicleStore observers](self, "observers"));
  objc_msgSend(v5, "removeObserver:", v4);

}

- (id)saveVehicle:(id)a3
{
  return -[CRVehicleStore saveVehicle:withMergePolicy:](self, "saveVehicle:withMergePolicy:", a3, 0);
}

- (id)saveVehicle:(id)a3 withMergePolicy:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD, id, void *);
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  CRVehicleStore *v26;
  uint64_t (**v27)(_QWORD, id, void *);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD, id, void *))a4;
  if (!+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))
  {
    v21 = 0;
    goto LABEL_26;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "certificateSerialNumber"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRVehicleStore allStoredVehicles](self, "allStoredVehicles"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v26 = self;
    v27 = v7;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "isEqual:", v6, v26) & 1) == 0)
        {
          if (!v8)
            continue;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "certificateSerialNumber"));
          v17 = objc_msgSend(v8, "isEqualToData:", v16);

          if (!v17)
            continue;
        }
        v18 = v15;

        v12 = v18;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);

    if (!v12)
    {
      self = v26;
      v7 = v27;
      goto LABEL_22;
    }
    self = v26;
    v7 = v27;
    if (v27)
    {
      v19 = v27[2](v27, v6, v12);
      v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    }
    else
    {
      objc_msgSend(v12, "mergeAttributesFromVehicle:", v6);
      v20 = v12;
      v12 = v20;
    }
    v9 = v6;
    v6 = v20;
  }
  else
  {
    v12 = 0;
  }

LABEL_22:
  -[CRVehicleStore _invalidateCachedVehicles](self, "_invalidateCachedVehicles");
  v22 = objc_msgSend((id)objc_opt_class(self), "_addPreferencesPairingForVehicle:", v6);
  v23 = objc_msgSend((id)objc_opt_class(self), "_addKeychainPairingForVehicle:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRVehicleStore observers](self, "observers"));
  objc_msgSend(v24, "vehicleStore:didSaveVehicle:", self, v6);

  objc_msgSend((id)objc_opt_class(self), "postPairingsDidChangeNotification");
  v21 = 0;
  if (v22 && v23)
    v21 = v6;

LABEL_26:
  return v21;
}

- (BOOL)removeVehicle:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  if (!v4)
  {
    v13 = CarGeneralLogging(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100068CA0(v14, v15, v16, v17, v18, v19, v20, v21);

    goto LABEL_10;
  }
  if (!+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[CRVehicleStore _invalidateCachedVehicles](self, "_invalidateCachedVehicles");
  v5 = objc_msgSend((id)objc_opt_class(self), "_removePreferencesPairingForVehicle:", v4);
  v6 = objc_msgSend((id)objc_opt_class(self), "_removeKeychainPairingForVehicle:", v4);
  v7 = (void *)objc_opt_class(self);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothAddress"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("CarPlay");
  objc_msgSend(v7, "removePayloadForVehicleWithIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRVehicleStore observers](self, "observers"));
  objc_msgSend(v11, "vehicleStore:didRemoveVehicle:", self, v4);

  objc_msgSend((id)objc_opt_class(self), "postPairingsDidChangeNotification");
  v12 = v5 & v6;
LABEL_11:

  return v12;
}

- (id)_matchingKeychainItemForIdentifier:(id)a3 inKeychainItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", kSecAttrAccount, (_QWORD)v16));
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "isEqualToString:", v5) & 1) != 0)
        {
          v14 = v11;

          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)handleAvailabilityDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A8C0;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)vehicleForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRVehicleStore allStoredVehicles](self, "allStoredVehicles"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)vehicleForBluetoothAddress:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRVehicleStore allStoredVehicles](self, "allStoredVehicles"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothAddress", (_QWORD)v15));
        if (v10)
        {
          v11 = (void *)v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothAddress"));
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)vehicleForCertificateSerial:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRVehicleStore allStoredVehicles](self, "allStoredVehicles"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "certificateSerialNumber", (_QWORD)v15));
        if (v10)
        {
          v11 = (void *)v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "certificateSerialNumber"));
          v13 = objc_msgSend(v12, "isEqualToData:", v4);

          if (v13)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)setCachedVehicles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedVehicles, 0);
}

@end
