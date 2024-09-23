@implementation APDeviceInfo

- (NSString)osVersionAndBuild
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v2 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings")), v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "osVersionOverride")), v3, v2, v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osVersionOverride"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSystemInfo systemDescription](APSystemInfo, "systemDescription"));
  }
  return (NSString *)v5;
}

+ (APDeviceInfo)current
{
  if (qword_1002695C8 != -1)
    dispatch_once(&qword_1002695C8, &stru_100213E58);
  return (APDeviceInfo *)(id)qword_1002695C0;
}

- (NSString)deviceModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v2 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings")), v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceTypeOverride")), v3, v2, v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfoSettings settings](APDeviceInfoSettings, "settings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceTypeOverride"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSystemInfo deviceModel](APSystemInfo, "deviceModel"));
  }
  return (NSString *)v5;
}

- (NSString)systemVersion
{
  return (NSString *)+[APSystemInfo osVersion](APSystemInfo, "osVersion");
}

- (NSString)systemName
{
  return (NSString *)+[APSystemInfo osName](APSystemInfo, "osName");
}

- (NSString)buildVersion
{
  return (NSString *)+[APSystemInfo longBuildVersion](APSystemInfo, "longBuildVersion");
}

- (id)userAgentStringForBundleID:(id)a3 storefront:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDeviceInfo deviceModel](self, "deviceModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APDeviceInfo osVersionAndBuild](self, "osVersionAndBuild"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@; %@; %@; %@"),
                    v8,
                    v9,
                    v7,
                    v6));

  return v10;
}

- (BOOL)educationModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = objc_msgSend(v2, "isSharedIPad");

  return v3;
}

- (int64_t)connectionType
{
  if (-[APTelephony networkDataValid](self->_telephony, "networkDataValid"))
    return -[APTelephony networkType](self->_telephony, "networkType");
  else
    return -1;
}

- (BOOL)personalizedAdsEnabled
{
  return self->_personalizedAdsEnabled;
}

- (void)setPersonalizedAdsEnabled:(BOOL)a3
{
  self->_personalizedAdsEnabled = a3;
}

- (BOOL)personalizedAdsAcknowledged
{
  id v4;

  if (self->_personalizedAdsAcknowledged)
    return 1;
  v4 = objc_alloc_init((Class)ADTrackingTransparency);
  self->_personalizedAdsAcknowledged = (uint64_t)objc_msgSend(v4, "acknowledgedVersionForPersonalizedAds") > 0;

  return self->_personalizedAdsAcknowledged;
}

- (void)_retrievePersonalizedAdsValue
{
  id v3;

  v3 = objc_alloc_init((Class)ADTrackingTransparency);
  -[APDeviceInfo setPersonalizedAdsEnabled:](self, "setPersonalizedAdsEnabled:", objc_msgSend(v3, "personalizedAds"));
  self->_personalizedAdsAcknowledged = (uint64_t)objc_msgSend(v3, "acknowledgedVersionForPersonalizedAds") > 0;

}

- (APDeviceInfo)init
{
  APDeviceInfo *v2;
  uint64_t v3;
  APTelephony *telephony;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id notificationObject;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APDeviceInfo;
  v2 = -[APDeviceInfo init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[APTelephony telephony](APTelephony, "telephony"));
    telephony = v2->_telephony;
    v2->_telephony = (APTelephony *)v3;

    -[APDeviceInfo _retrievePersonalizedAdsValue](v2, "_retrievePersonalizedAdsValue");
    objc_initWeak(&location, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    v6 = kAPAccountChangedNotification;
    v7 = kAPAdLibBundleID;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003530;
    v11[3] = &unk_100213E80;
    objc_copyWeak(&v12, &location);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, v7, 0, v11));
    notificationObject = v2->_notificationObject;
    v2->_notificationObject = (id)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSNumber)signalStrength
{
  return -[APTelephony signalStrength](self->_telephony, "signalStrength");
}

- (BOOL)networkDataValid
{
  return -[APTelephony networkDataValid](self->_telephony, "networkDataValid");
}

- (BOOL)telephonyDataValid
{
  return -[APTelephony telephonyDataValid](self->_telephony, "telephonyDataValid");
}

- (APTelephony)telephony
{
  return (APTelephony *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTelephony:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)notificationObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_telephony, 0);
}

@end
