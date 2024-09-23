@implementation CLCapabilityMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102307400 != -1)
    dispatch_once(&qword_102307400, &stru_10217BE68);
  return (id)qword_1023073F8;
}

- (CLCapabilityMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCapabilityMonitor;
  return -[CLCapabilityMonitor initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCapabilityMonitorServiceProtocol, &OBJC_PROTOCOL___CLCapabilityMonitorClientProtocol);
}

- (void)beginService
{
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  -[CLCapabilityMonitor setCapabilityChangeClients:](self, "setCapabilityChangeClients:", objc_opt_new(NSMutableSet));
  -[CLCapabilityMonitor setStewieSupported:](self, "setStewieSupported:", 0);
  -[CLCapabilityMonitor universe](self, "universe");
  sub_1012B2C64();
}

- (void)endService
{
  Client *value;
  Client *v4;

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  value = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  -[CLCapabilityMonitor setSupervised:](self, "setSupervised:", 0);
  -[CLCapabilityMonitor setICloudManagedAppleID:](self, "setICloudManagedAppleID:", 0);
  -[CLCapabilityMonitor setITunesManagedAppleID:](self, "setITunesManagedAppleID:", 0);
  -[CLCapabilityMonitor setInstalledEducationProfile:](self, "setInstalledEducationProfile:", 0);
  -[CLCapabilityMonitor setCapabilityChangeClients:](self, "setCapabilityChangeClients:", 0);
  -[CLCapabilityMonitor setStewieSupported:](self, "setStewieSupported:", 0);
}

- (void)updateSupervised
{
  uint64_t v3;
  id v4;

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (objc_opt_class(MCProfileConnection, v3))
    v4 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isSupervised");
  else
    v4 = 0;
  -[CLCapabilityMonitor setSupervised:](self, "setSupervised:", v4);
}

- (void)setSupervised:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 supervised;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  uint8_t buf[4];
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;

  v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_supervised != v3)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10217BF90);
    v5 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      supervised = self->_supervised;
      *(_DWORD *)buf = 67109376;
      v14 = supervised;
      v15 = 1024;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "supervised capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10217BF90);
      v7 = self->_supervised;
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 1024;
      v12 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "supervised capability changed from, %d, to, %d", v10, 14);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLCapabilityMonitor setSupervised:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    self->_supervised = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }
}

- (void)updateICloudManagedAppleID
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  CLCapabilityMonitor *v6;

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (objc_opt_class(ACAccountStore, v3))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100C570E8;
    v4[3] = &unk_10217BEE0;
    v5 = objc_alloc_init((Class)ACAccountStore);
    v6 = self;
    objc_msgSend(v5, "accountTypeWithIdentifier:completion:", ACAccountTypeIdentifierAppleAccount, v4);
  }
}

- (void)setICloudManagedAppleID:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 iCloudManagedAppleID;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  uint8_t buf[4];
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;

  v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_iCloudManagedAppleID != v3)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10217BF90);
    v5 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      iCloudManagedAppleID = self->_iCloudManagedAppleID;
      *(_DWORD *)buf = 67109376;
      v14 = iCloudManagedAppleID;
      v15 = 1024;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "iCloud managed apple ID capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10217BF90);
      v7 = self->_iCloudManagedAppleID;
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 1024;
      v12 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "iCloud managed apple ID capability changed from, %d, to, %d", v10, 14);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLCapabilityMonitor setICloudManagedAppleID:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    self->_iCloudManagedAppleID = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }
}

- (void)updateInstalledEducationProfile
{
  uint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (objc_opt_class(MCProfileConnection, v3))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100C57590;
    v4[3] = &unk_10217BF30;
    v4[4] = &v5;
    objc_msgSend(objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "installedProfileIdentifiers"), "enumerateObjectsUsingBlock:", v4);
  }
  -[CLCapabilityMonitor setInstalledEducationProfile:](self, "setInstalledEducationProfile:", *((unsigned __int8 *)v6 + 24));
  _Block_object_dispose(&v5, 8);
}

- (void)setInstalledEducationProfile:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 installedEducationProfile;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  uint8_t buf[4];
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;

  v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_installedEducationProfile != v3)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10217BF90);
    v5 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      installedEducationProfile = self->_installedEducationProfile;
      *(_DWORD *)buf = 67109376;
      v14 = installedEducationProfile;
      v15 = 1024;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "installed education profile capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10217BF90);
      v7 = self->_installedEducationProfile;
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 1024;
      v12 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "installed education profile capability changed from, %d, to, %d", v10, 14);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLCapabilityMonitor setInstalledEducationProfile:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    self->_installedEducationProfile = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }
}

- (void)updateITunesManagedAppleID
{
  id v3;

  v3 = objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (&_SSActiveAccountIsManagedAppleID)
    -[CLCapabilityMonitor setITunesManagedAppleID:](self, "setITunesManagedAppleID:", SSActiveAccountIsManagedAppleID(v3));
}

- (void)setITunesManagedAppleID:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 iTunesManagedAppleID;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  uint8_t buf[4];
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;

  v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_iTunesManagedAppleID != v3)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10217BF90);
    v5 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      iTunesManagedAppleID = self->_iTunesManagedAppleID;
      *(_DWORD *)buf = 67109376;
      v14 = iTunesManagedAppleID;
      v15 = 1024;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "iTunes managed apple ID capability changed from, %d, to, %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10217BF90);
      v7 = self->_iTunesManagedAppleID;
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 1024;
      v12 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "iTunes managed apple ID capability changed from, %d, to, %d", v10, 14);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLCapabilityMonitor setITunesManagedAppleID:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    self->_iTunesManagedAppleID = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }
}

- (void)onDarwinNotification:(int)a3 data:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _DWORD v9[4];
  uint8_t buf[4];
  int v11;

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe", *(_QWORD *)&a3, *(_QWORD *)&a4.var0), "silo");
  switch(a3)
  {
    case 2:
      -[CLCapabilityMonitor updateSupervised](self, "updateSupervised");
      break;
    case 3:
      -[CLCapabilityMonitor updateICloudManagedAppleID](self, "updateICloudManagedAppleID");
      break;
    case 4:
      -[CLCapabilityMonitor updateInstalledEducationProfile](self, "updateInstalledEducationProfile");
      break;
    case 5:
      -[CLCapabilityMonitor updateITunesManagedAppleID](self, "updateITunesManagedAppleID");
      break;
    default:
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10217BF90);
      v6 = qword_1022A02D8;
      if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "received unhandled notification, %{public}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02D0 != -1)
          dispatch_once(&qword_1022A02D0, &stru_10217BF90);
        v9[0] = 67240192;
        v9[1] = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "received unhandled notification, %{public}d", v9, 8);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 0, "-[CLCapabilityMonitor onDarwinNotification:data:]", "%s\n", v7);
        if (v8 != buf)
          free(v8);
      }
      break;
  }
}

- (void)setStewieSupported:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 stewieSupported;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;

  v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if ((_os_feature_enabled_impl("CoreTelephony", "Bifrost") & 1) != 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217BFB0);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      stewieSupported = self->_stewieSupported;
      v7[0] = 68289538;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 1026;
      v11 = stewieSupported;
      v12 = 1026;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CapabilityMonitor update stewieSupported\", \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v7, 0x1Eu);
    }
  }
  if (self->_stewieSupported != v3)
  {
    self->_stewieSupported = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }
}

- (void)onTelephonyNotification:(int)a3 data:(void *)a4
{
  NSObject *v6;
  const __CFString *v7;
  void **v8;
  const void *v9;
  NSObject *v10;
  const __CFString *v11;
  void **v12;
  void *__p[2];
  char v14;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void **v21;

  v15 = a3;
  objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10217BFB0);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (const __CFString *)sub_1001DEC98(&v15);
    sub_1001A486C(v7, (uint64_t)__p);
    v8 = v14 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 68289282;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CapabilityMonitor onTelephonyNotification\", \"notification\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v14 < 0)
      operator delete(__p[0]);
  }
  v9 = (const void *)sub_1001DEC98(&v15);
  if (CFEqual(CFSTR("kStewieSupportNotification"), v9))
  {
    buf[0] = 0;
    sub_1012641BC(*a4, buf);
    objc_msgSend(a1, "setStewieSupported:", buf[0]);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217BFB0);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (const __CFString *)sub_1001DEC98(&v15);
      sub_1001A486C(v11, (uint64_t)__p);
      if (v14 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      *(_DWORD *)buf = 68289282;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CapabilityMonitor received unhandled notification, skipping\", \"notification\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (v14 < 0)
        operator delete(__p[0]);
    }
  }
}

- (BOOL)hasCapability:(id)a3
{
  unsigned __int8 v5;

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLNONEDU")))
  {
    v5 = sub_10075F4B4();
    return v5 ^ 1;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLSupervised")))
    return -[CLCapabilityMonitor supervised](self, "supervised");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLNonSupervised")))
  {
    v5 = -[CLCapabilityMonitor supervised](self, "supervised");
    return v5 ^ 1;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLInstalledProfileEducation")))
    return -[CLCapabilityMonitor installedEducationProfile](self, "installedEducationProfile");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLNonManagedAppleID")))
  {
    if (!-[CLCapabilityMonitor iCloudManagedAppleID](self, "iCloudManagedAppleID"))
    {
      v5 = -[CLCapabilityMonitor iTunesManagedAppleID](self, "iTunesManagedAppleID");
      return v5 ^ 1;
    }
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLHeadingCompass")))
    return sub_1001E4BF4() & 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLSystemCustomization")))
  {
    if ((sub_10075C0C4() & 1) == 0)
    {
      v5 = sub_10011E0F0();
      return v5 ^ 1;
    }
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CLBifrostSupported")))
    return -[CLCapabilityMonitor stewieSupported](self, "stewieSupported");
  else
    return sub_1000C27F0((uint64_t)a3);
}

- (void)updateLocationDictionaryCachedCapabilities
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];
  _QWORD v6[8];

  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  v5[0] = CFSTR("CLNONEDU");
  v6[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_10075F4B4() ^ 1);
  v5[1] = CFSTR("CLSupervised");
  v6[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLCapabilityMonitor supervised](self, "supervised"));
  v5[2] = CFSTR("CLNonSupervised");
  v6[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLCapabilityMonitor supervised](self, "supervised") ^ 1);
  v5[3] = CFSTR("CLInstalledProfileEducation");
  v6[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLCapabilityMonitor installedEducationProfile](self, "installedEducationProfile"));
  v5[4] = CFSTR("CLNonManagedAppleID");
  if (-[CLCapabilityMonitor iCloudManagedAppleID](self, "iCloudManagedAppleID"))
    v3 = 0;
  else
    v3 = -[CLCapabilityMonitor iTunesManagedAppleID](self, "iTunesManagedAppleID") ^ 1;
  v6[4] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3);
  v5[5] = CFSTR("CLHeadingCompass");
  v6[5] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_1001E4BF4() & 1);
  v5[6] = CFSTR("CLSystemCustomization");
  if ((sub_10075C0C4() & 1) != 0)
    v4 = 0;
  else
    v4 = sub_10011E0F0() ^ 1;
  v6[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4);
  v5[7] = CFSTR("CLBifrostSupported");
  v6[7] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLCapabilityMonitor stewieSupported](self, "stewieSupported"));
  sub_100E48454(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 8));
}

- (void)onCapabilityChange
{
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  -[CLCapabilityMonitor updateLocationDictionaryCachedCapabilities](self, "updateLocationDictionaryCachedCapabilities");
  -[NSMutableSet enumerateObjectsUsingBlock:](-[CLCapabilityMonitor capabilityChangeClients](self, "capabilityChangeClients"), "enumerateObjectsUsingBlock:", &stru_10217BF70);
}

- (void)startMonitoringCapabilityChangeForClient:(id)a3
{
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  -[NSMutableSet addObject:](-[CLCapabilityMonitor capabilityChangeClients](self, "capabilityChangeClients"), "addObject:", a3);
}

- (void)stopMonitoringCapabilityChangeForClient:(id)a3
{
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](-[CLCapabilityMonitor capabilityChangeClients](self, "capabilityChangeClients"), "removeObject:", a3);
}

- (BOOL)syncgetForceCacheUpdate
{
  -[CLCapabilityMonitor updateLocationDictionaryCachedCapabilities](self, "updateLocationDictionaryCachedCapabilities");
  return 1;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (BOOL)iCloudManagedAppleID
{
  return self->_iCloudManagedAppleID;
}

- (BOOL)iTunesManagedAppleID
{
  return self->_iTunesManagedAppleID;
}

- (BOOL)installedEducationProfile
{
  return self->_installedEducationProfile;
}

- (BOOL)stewieSupported
{
  return self->_stewieSupported;
}

- (NSMutableSet)capabilityChangeClients
{
  return self->_capabilityChangeClients;
}

- (void)setCapabilityChangeClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  value = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
