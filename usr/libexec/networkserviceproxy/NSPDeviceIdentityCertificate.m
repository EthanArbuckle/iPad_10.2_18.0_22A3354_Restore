@implementation NSPDeviceIdentityCertificate

- (id)description
{
  id v3;
  void *v4;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", self->_deviceIdentityFetchDate, 1, 2));
    sub_1000418A4(v3, v4, CFSTR("Device Identity Fetch Date"), 0, 14);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPDeviceIdentityCertificate *v4;
  NSPDeviceIdentityCertificate *v5;
  NSDate *deviceIdentityFetchDate;

  v4 = -[NSPDeviceIdentityCertificate init](+[NSPDeviceIdentityCertificate allocWithZone:](NSPDeviceIdentityCertificate, "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    v4->_diskVersion = self->_diskVersion;
    deviceIdentityFetchDate = self->_deviceIdentityFetchDate;
  }
  else
  {
    deviceIdentityFetchDate = 0;
    v4->_diskVersion = 0;
  }
  objc_storeStrong((id *)&v4->_deviceIdentityFetchDate, deviceIdentityFetchDate);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPDeviceIdentityCertificate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSPDeviceIdentityCertificate *v7;
  id v8;
  uint64_t v9;
  NSDate *deviceIdentityFetchDate;
  NSPDeviceIdentityCertificate *v11;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NSPDeviceIdentityCertificate;
  v7 = -[NSPDeviceIdentityCertificate init](&v16, "init");
  if (v7)
  {
    v7->_diskVersion = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DiskVersion"));
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("DeviceIdentityFetchDate"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    deviceIdentityFetchDate = v7->_deviceIdentityFetchDate;
    v7->_deviceIdentityFetchDate = (NSDate *)v9;

    v11 = v7;
  }
  else
  {
    v13 = nplog_obj(0, v5, v6);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "[super init] failed", v15, 2u);
    }

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *deviceIdentityFetchDate;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", 1, CFSTR("DiskVersion"));
  if (self)
    deviceIdentityFetchDate = self->_deviceIdentityFetchDate;
  else
    deviceIdentityFetchDate = 0;
  objc_msgSend(v5, "encodeObject:forKey:", deviceIdentityFetchDate, CFSTR("DeviceIdentityFetchDate"));

}

+ (void)removeFromPreferences
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  _CFPreferencesSetFileProtectionClass(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost, 0, 3);
  CFPreferencesSetAppValue(CFSTR("DeviceIdentityInfo"), 0, kCFPreferencesCurrentApplication);
  v2 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  v3 = v2;
  v6 = nplog_obj(v2, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed device identity info from preference file", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove device identity info from preference file", buf, 2u);
  }

}

+ (id)sharedDeviceIdentity
{
  if (qword_100112E50 != -1)
    dispatch_once(&qword_100112E50, &stru_1000F5E68);
  return (id)qword_100112E48;
}

- (void)resetDeviceIdentityInfo
{
  if (self)
  {
    if (self->_deviceIdentityFetchDate)
      sub_10000D344((uint64_t)self, 0);
    self->_ignoreExistingKeychainIdentity = 0;
  }
}

- (void)deviceIdentityAuthenticationFailed
{
  if (self)
    self->_ignoreExistingKeychainIdentity = 1;
}

- (void)signData:(id)a3 andFetchDeviceIdentityCertificate:(id)a4
{
  id v6;
  id v7;
  NSDate *v8;
  NSDate *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSDate *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id inited;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  NSPDeviceIdentityCertificate *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[3];
  _QWORD v37[6];
  _QWORD v38[6];
  uint8_t buf[4];
  void *v40;

  v6 = a3;
  v7 = a4;
  if (self
    && (v8 = self->_deviceIdentityFetchDate) != 0
    && (v9 = v8,
        -[NSDate timeIntervalSinceNow](self->_deviceIdentityFetchDate, "timeIntervalSinceNow"),
        v11 = v10,
        v9,
        v11 > 0.0))
  {
    v15 = nplog_obj(v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = self->_deviceIdentityFetchDate;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v17, 1, 2));
      *(_DWORD *)buf = 138412290;
      v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "deferring fetching device identity until %@", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v37[0] = kMAOptionsBAAValidity;
    v37[1] = kMAOptionsBAASCRTAttestation;
    v38[0] = &off_1000FF248;
    v38[1] = &off_1000FF260;
    v37[2] = kMAOptionsBAAOIDSToInclude;
    v36[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
    v36[1] = kMAOptionsBAAOIDDeviceIdentifiers;
    v36[2] = kMAOptionsBAAOIDDeviceOSInformation;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 3));
    v38[2] = v19;
    v37[3] = kMAOptionsBAANetworkTimeoutInterval;
    v37[4] = kMAOptionsBAAKeychainLabel;
    v38[3] = &off_1000FF278;
    v38[4] = CFSTR("PrivacyProxy");
    v37[5] = kMAOptionsBAADeleteDuplicateKeychainItems;
    v38[5] = &off_1000FF290;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 6));

    if (qword_100112E40 != -1)
      dispatch_once(&qword_100112E40, &stru_1000F5E48);
    if (byte_100112E38 == 1)
    {
      objc_initWeak((id *)buf, self);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v20));
      v22 = NPGetInternalQueue(objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_1000FF290, kMAOptionsBAASkipNetworkRequest));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10004AA9C;
      v33[3] = &unk_1000F5E90;
      objc_copyWeak(&v35, (id *)buf);
      v34 = v7;
      DeviceIdentityCreateHostSignatureWithCompletion(v23, v6, v21, v33);

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (self && self->_ignoreExistingKeychainIdentity)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v20));
        objc_msgSend(v27, "setObject:forKeyedSubscript:", &off_1000FF290, kMAOptionsBAAIgnoreExistingKeychainItems);
        self->_ignoreExistingKeychainIdentity = 0;

      }
      inited = objc_initWeak((id *)buf, self);
      v25 = NPGetInternalQueue(inited);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10004ABD8;
      v28[3] = &unk_1000F5EB8;
      objc_copyWeak(&v32, (id *)buf);
      v29 = v6;
      v30 = self;
      v31 = v7;
      DeviceIdentityIssueClientCertificateWithCompletion(v26, v20, v28);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentityFetchDate, 0);
}

@end
