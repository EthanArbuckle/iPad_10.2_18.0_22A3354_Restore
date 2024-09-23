@implementation MCMachineInfo

+ (id)machineInfoWithKeys:(id)a3 challenge:(id)a4 identity:(__SecIdentity *)a5 additionalInfo:(id)a6 outError:(id *)a7
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t DeviceUUID;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ProductName;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  os_log_t v43;
  NSObject *v44;
  void *v45;
  const void *v46;
  uint64_t DeviceIntermediateCertificates;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[128];

  v9 = a3;
  v58 = a4;
  v57 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)objc_msgSend(v9, "count") + (_QWORD)objc_msgSend(v57, "count")));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v61;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v15);
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("UDID")))
        {
          DeviceUUID = MCGestaltGetDeviceUUID();
          v18 = (void *)objc_claimAutoreleasedReturnValue(DeviceUUID);
          v19 = v10;
          v20 = v18;
          v21 = CFSTR("UDID");
          goto LABEL_14;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("IMEI")))
        {
          v22 = MCCTIMEI();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v19 = v10;
          v20 = v18;
          v21 = CFSTR("IMEI");
          goto LABEL_14;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("MEID")))
        {
          v23 = MCCTMEID();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v19 = v10;
          v20 = v18;
          v21 = CFSTR("MEID");
          goto LABEL_14;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("VERSION")))
        {
          v24 = MCProductBuildVersion();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v19 = v10;
          v20 = v18;
          v21 = CFSTR("VERSION");
          goto LABEL_14;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("SERIAL")))
        {
          v25 = MCIOSerialString();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v25);
          objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", v18, CFSTR("SERIAL"));
          goto LABEL_15;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("PRODUCT")))
        {
          ProductName = MCGestaltGetProductName();
          v18 = (void *)objc_claimAutoreleasedReturnValue(ProductName);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[DMCFeatureOverrides productNameWithDefaultValue:](DMCFeatureOverrides, "productNameWithDefaultValue:", v18));
          objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", v27, CFSTR("PRODUCT"));

          goto LABEL_15;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("LANGUAGE")))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
          objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", v28, CFSTR("LANGUAGE"));

          goto LABEL_15;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("OS_VERSION")))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt marketingVersion](DMCMobileGestalt, "marketingVersion"));
          objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", v18, CFSTR("OS_VERSION"));
          goto LABEL_15;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("SUPPLEMENTAL_BUILD_VERSION")))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt supplementalBuildVersion](DMCMobileGestalt, "supplementalBuildVersion"));
          v19 = v10;
          v20 = v18;
          v21 = CFSTR("SUPPLEMENTAL_BUILD_VERSION");
          goto LABEL_14;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("SUPPLEMENTAL_OS_VERSION_EXTRA")))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt supplementalMarketingVersionExtra](DMCMobileGestalt, "supplementalMarketingVersionExtra"));
          v19 = v10;
          v20 = v18;
          v21 = CFSTR("SUPPLEMENTAL_OS_VERSION_EXTRA");
LABEL_14:
          objc_msgSend(v19, "MCSetObjectIfNotNil:forKey:", v20, v21);
LABEL_15:

          goto LABEL_16;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("SOFTWARE_UPDATE_DEVICE_ID")))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUUtility currentProductType](SUUtility, "currentProductType"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[DMCFeatureOverrides softwareUpdateDeviceIDWithDefaultValue:](DMCFeatureOverrides, "softwareUpdateDeviceIDWithDefaultValue:", v18));
          objc_msgSend(v10, "MCSetObjectIfNotNil:forKey:", v29, CFSTR("SOFTWARE_UPDATE_DEVICE_ID"));

          goto LABEL_15;
        }
LABEL_16:
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v30 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      v13 = v30;
    }
    while (v30);
  }

  if (v58)
    objc_msgSend(v10, "setObject:forKey:", v58, CFSTR("CHALLENGE"));
  objc_msgSend(v10, "addEntriesFromDictionary:", v57);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v59 = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v10, 100, 0, &v59));
  v33 = v59;
  if (v33)
  {
    v34 = v33;
    v35 = MCOTAProfilesErrorDomain;
    v36 = MCErrorArray(CFSTR("OTA_CANNOT_CREATE_ATTRIBUTE_DICT"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v35, 24000, v37, v34, MCErrorTypeFatal, 0));
    goto LABEL_40;
  }
  if (a5)
  {
    v39 = SecCMSSignDataAndAttributes(a5, v32, 0, v31, 0);
    if (v39)
    {
LABEL_39:
      v40 = MCOTAProfilesErrorDomain;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v39));
      v41 = MCErrorArray(CFSTR("OTA_CANNOT_SIGN_ATTRIBUTE_DICT_P_OSSTATUS"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v40, 24001, v34, MCErrorTypeFatal, v37, 0));
      goto LABEL_40;
    }
LABEL_53:
    v42 = 0;
    goto LABEL_54;
  }
  v46 = (const void *)MCLockdownCopyBuiltInIdentity();
  if (v46 || sub_10009204C() && (v46 = (const void *)MCLockdownCopyBuiltInIdentity()) != 0)
  {
    DeviceIntermediateCertificates = MCLockdownGetDeviceIntermediateCertificates();
    v48 = objc_claimAutoreleasedReturnValue(DeviceIntermediateCertificates);
    v49 = (void *)v48;
    if (v48)
    {
      v66 = kSecCMSAdditionalCerts;
      v67 = v48;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    }
    else
    {
      v50 = 0;
    }
    v39 = SecCMSCreateSignedData(v46, v32, v50, 0, v31);
    CFRelease(v46);

    if (v39)
      goto LABEL_39;
    goto LABEL_53;
  }
  v52 = MCInstallationErrorDomain;
  v53 = MCErrorArrayByDevice(CFSTR("ERROR_INSTALL_NO_IDENTITY"), v51);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v52, 4014, v37, MCErrorTypeFatal, 0));
  v38 = objc_msgSend(v34, "MCCopyAsPrimaryError");
LABEL_40:
  v42 = v38;

  if (v42)
  {
    v43 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v65 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Could not create machine info dictionary. Error: %{public}@", buf, 0xCu);

    }
    if (a7)
    {
      v42 = objc_retainAutorelease(v42);
      *a7 = v42;
    }
  }
LABEL_54:

  return v31;
}

+ (id)machineInfoWithKeys:(id)a3 outError:(id *)a4
{
  return objc_msgSend(a1, "machineInfoWithKeys:challenge:identity:additionalInfo:outError:", a3, 0, 0, 0, a4);
}

@end
