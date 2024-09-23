@implementation KTPCSOperations

+ (id)PCSOperationWithSpecificUser:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithSpecificUser:", v4);

  return v5;
}

- (KTPCSOperations)initWithSpecificUser:(id)a3
{
  id v4;
  KTPCSOperations *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  KTPCSOperations *v13;
  NSObject *v14;
  NSObject *v15;
  objc_super v17;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KTPCSOperations;
  cf = 0;
  v5 = -[KTPCSOperations init](&v17, "init");
  if (!v5)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_18;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dsid"));
  -[KTPCSOperations setDsid:](v5, "setDsid:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](v5, "dsid"));
  if (!v7)
  {
    if (qword_1002A7890 != -1)
      dispatch_once(&qword_1002A7890, &stru_100248A10);
    v14 = qword_1002A7898;
    if (os_log_type_enabled((os_log_t)qword_1002A7898, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "initWithSpecificUser dsid is NULL", buf, 2u);
    }
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "altDSID"));
  -[KTPCSOperations setAltDSID:](v5, "setAltDSID:", v8);

  v21 = kPCSSetupDSID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](v5, "dsid"));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v11 = objc_msgSend(v10, "mutableCopy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations altDSID](v5, "altDSID"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kPCSSetupAltDSID);

  -[KTPCSOperations setSet:](v5, "setSet:", PCSIdentitySetCreate(v11, 0, &cf));
  if (-[KTPCSOperations set](v5, "set"))
  {
    v13 = v5;
  }
  else
  {
    if (qword_1002A7890 != -1)
      dispatch_once(&qword_1002A7890, &stru_100248A30);
    v15 = qword_1002A7898;
    if (os_log_type_enabled((os_log_t)qword_1002A7898, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = cf;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "PCSIdentitySetCreate: %@", buf, 0xCu);
    }
    if (cf)
      CFRelease(cf);
    v13 = 0;
  }

LABEL_18:
  return v13;
}

- (void)dealloc
{
  _PCSIdentitySetData *set;
  objc_super v4;

  set = self->_set;
  if (set)
  {
    CFRelease(set);
    self->_set = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)KTPCSOperations;
  -[KTPCSOperations dealloc](&v4, "dealloc");
}

- (void)createManateeIdentity:(id)a3 service:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _PCSIdentitySetData *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v8 = a5;
  v19[0] = kPCSSetupDSID;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](self, "dsid"));
  v19[1] = kPCSSetupSyncIdentity;
  v20[0] = v11;
  v20[1] = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations altDSID](self, "altDSID"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, kPCSSetupAltDSID);

  LODWORD(v14) = objc_msgSend(v10, "roll");
  if ((_DWORD)v14)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kPCSSetupRollIdentity);
  v15 = -[KTPCSOperations set](self, "set");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100156798;
  v17[3] = &unk_100248A78;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  PCSIdentitySetCreateManatee(v15, v9, v13, v17);

}

- (id)getCurrentKTPCSIdentity:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v15 = 0;
  v7 = kTransparencyFlagForceCDPWaiting;
  if (+[TransparencySettings getBool:defaultValue:](TransparencySettings, "getBool:defaultValue:", kTransparencyFlagForceCDPWaiting, 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -350, CFSTR("Identity creation failed: %@ set"), v7));
    v9 = v8;
    if (a4 && v8)
      *a4 = objc_retainAutorelease(v8);

  }
  else
  {
    v11 = PCSIdentitySetCopyCurrentIdentityPointer(-[KTPCSOperations set](self, "set"), v6, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v10)
      goto LABEL_12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](self, "dsid"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations altDSID](self, "altDSID"));
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PCSIdentitySetCopyCurrentIdentityWithError: %@[%@] %@", buf, 0x20u);

    }
    if (a4)
    {
      v10 = 0;
      *a4 = objc_retainAutorelease(v15);
      goto LABEL_12;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
