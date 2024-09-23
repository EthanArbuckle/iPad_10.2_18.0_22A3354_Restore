@implementation MSDEnrollRequest

- (BOOL)isValid
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDEnrollRequest;
  if (-[MSDCommandServerRequest isValid](&v8, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest registrationInfo](self, "registrationInfo"));
    v5 = objc_opt_class(NSDictionary, v4);
    isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)getPostData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;

  if (-[MSDEnrollRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest registrationInfo](self, "registrationInfo"));
    v4 = objc_msgSend(v3, "mutableCopy");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("MSDTimeZone"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest deviceName](self, "deviceName"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest deviceName](self, "deviceName"));
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("DeviceName"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest pairingCredentials](self, "pairingCredentials"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest pairingCredentials](self, "pairingCredentials"));
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("PairingCredential"));

    }
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1000C9A5C((uint64_t)v4, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "convertToNSData"));
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDEnrollResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)MSDEnrollRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v35, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v11 = 0;
    v14 = 0;
    goto LABEL_25;
  }
  v34 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v34));
  v12 = v34;

  if (!v11)
  {
    v14 = 0;
LABEL_24:
    v6 = v12;
LABEL_25:
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

    if (v31)
    {
      v12 = v6;
    }
    else
    {
      v32 = v6;
      sub_1000B63A4(&v32, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
      v12 = v32;

      objc_msgSend(v9, "setError:", v12);
    }
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Credential")));
  if (!v14 || (v15 = objc_opt_class(NSString, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
  {
    v25 = sub_1000604F0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000C9B50(self);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Error")));
    if (v27)
    {
      v28 = sub_1000604F0();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1000C9AD0(self);

      v33 = v12;
      sub_1000B63A4(&v33, 3727744512, (uint64_t)v27);
      v30 = v33;

      v12 = v30;
    }

    goto LABEL_24;
  }
  objc_msgSend(v9, "setCredential:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Settings")));
  if (v17)
  {
    v18 = objc_opt_class(NSDictionary, v16);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      objc_msgSend(v9, "setSettingsDict:", v17);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("protocolVersion")));
  if (v20)
  {
    v21 = objc_opt_class(NSString, v19);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      objc_msgSend(v9, "setHubProtocolVersion:", v20);
  }
  v22 = sub_1000604F0();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enroll succeeded with response: %{public}@", buf, 0xCu);
  }

LABEL_14:
  return v9;
}

- (NSArray)getRegistrationInfoKeys
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("UniqueDeviceID"), CFSTR("SerialNumber"), CFSTR("ProductVersion"), CFSTR("BuildVersion"), CFSTR("ProductType"), CFSTR("InternationalMobileEquipmentIdentity"), CFSTR("xRyzf9zFE/ycr/wJPweZvQ"), CFSTR("MobileEquipmentIdentifier"), CFSTR("BatteryCurrentCapacity"), CFSTR("MSDDemoAcceptUATContent"), CFSTR("MSDDemoNANDSize"), CFSTR("MSDDemoSystemLanguage"), CFSTR("MSDDemoSystemRegion"), CFSTR("MSDNetworkInterfacesEnabled"), CFSTR("MSDCurrentWiFiSSID"), CFSTR("MSDPersistentWiFiSSID"), CFSTR("MSDCellularConfiguration"),
           CFSTR("MSDDemoProductDescription"),
           CFSTR("PartNumber"),
           0);
}

- (NSDictionary)registrationInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegistrationInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)pairingCredentials
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPairingCredentials:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingCredentials, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_registrationInfo, 0);
}

@end
