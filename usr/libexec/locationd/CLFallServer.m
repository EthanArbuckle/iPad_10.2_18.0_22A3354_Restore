@implementation CLFallServer

- (id)getUUID
{
  if (self->_subjectUUID)
    return -[NSUUID copy](self->_subjectUUID, "copy");
  else
    return -[CLFallServer _loadSubjectUUID](self, "_loadSubjectUUID");
}

- (void)clearUUID
{
  -[CLFallServer _registerDevice](self, "_registerDevice");
}

- (id)initInUniverse:(id)a3
{
  CLFallServer *v4;
  NSObject *v5;
  CLIntersiloUniverse *v6;
  NSMutableDictionary *v7;
  int *p_registrationTimerFireInterval;
  uint64_t v9;
  int v10;
  int v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  id v18;
  NSString *submissionEndpoint;
  NSObject *v20;
  const char *v22;
  char *v23;
  int v24;
  const char *v25;
  char *v26;
  const char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];
  __int128 v35;
  NSString *studyID;
  _OWORD buf[102];

  v31.receiver = self;
  v31.super_class = (Class)CLFallServer;
  v4 = -[CLFallServer init](&v31, "init");
  if (!v4)
    return v4;
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v5 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Initializing CLFallServer instance", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    LOWORD(v32) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Initializing CLFallServer instance", &v32, 2);
    v23 = (char *)v22;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer initInUniverse:]", "%s\n", v22);
    if (v23 != (char *)buf)
      free(v23);
  }
  v6 = (CLIntersiloUniverse *)a3;
  v4->_universe = v6;
  v4->_registrationTimer = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](v6, "silo"), "newTimer");
  v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_registrationTimerFireInterval = 3600;
  p_registrationTimerFireInterval = &v4->_registrationTimerFireInterval;
  v4->_responses = v7;
  v9 = sub_100127B9C();
  sub_100081C10(v9, buf);
  v10 = sub_1001C1194(*(uint64_t *)&buf[0], (uint64_t)CFSTR("ServerRegistrationTimerFireInterval"), &v4->_registrationTimerFireInterval);
  v11 = v10;
  v12 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
  if (!*((_QWORD *)&buf[0] + 1))
    goto LABEL_11;
  v13 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (v11)
      goto LABEL_12;
  }
  else
  {
LABEL_11:
    if (v10)
    {
LABEL_12:
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v15 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
      {
        v16 = *p_registrationTimerFireInterval;
        LODWORD(buf[0]) = 67109120;
        DWORD1(buf[0]) = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Overriding registration timer fire interval: %d", (uint8_t *)buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021B5B78);
        v24 = *p_registrationTimerFireInterval;
        v32 = 67109120;
        LODWORD(v33) = v24;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Overriding registration timer fire interval: %d", &v32);
        v26 = (char *)v25;
        sub_100512490("Generic", 1, 0, 2, "-[CLFallServer initInUniverse:]", "%s\n", v25);
        if (v26 != (char *)buf)
          free(v26);
      }
    }
  }
  v4->_logDirectory = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerLogDirectory"), CFSTR("/var/mobile/Library/locationd/Server"));
  v4->_host = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerHost"), CFSTR("https://ingest.apple-studies.com:8443"));
  v4->_registrationEndpoint = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerRegistrationEndpoint"), CFSTR("/ingest/v2/register"));
  v4->_submissionEndpoint = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerSubmissionEndpoint"), CFSTR("/ingest/v2/submit"));
  v4->_studyID = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerStudyID"), CFSTR("cf28ffed-271e-416f-9aff-f69bd999885a"));
  v4->_authorization = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerAuthorization"), CFSTR("RygmpPxtPG5B04FlpFT23YWMnqDhouPM0XANlLy3S3Asl5U6X7hu5eoJTl2CZFeK"));
  v4->_certificate = (NSString *)-[CLFallServer _initializeValueForKey:withDefault:](v4, "_initializeValueForKey:withDefault:", CFSTR("ServerCertificate"), CFSTR("MIIDjTCCAnWgAwIBAgIEFN2TTjANBgkqhkiG9w0BAQsFADB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwHhcNMTcwNDE4MTgzODI4WhcNMTgwNDE4MTgzODI4WjB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDvR2JtAkPdG/BldPRT7EupiMo4ZvLOzztoDeul2awbM9fBU8kc3nlapOi2vooX62cyPJKsqCas465gy4U3JJBMVg/MjshfUIDBb1LQzGtvfYkirdpWOqJ7riQ0Wbe6LLRFD0963JNF1lyMHkf7OqZegIh8c+xGGgd2ynkdivaKOr2d7Qf67y2UarQc+qIgkljsaOugfBr3jsUcO0tE0j9LGOvTZZEZd3ykXUEChIkwGW+QWWd3Indit4ArSMGDjkrltGX88FBWgbPYe8dgjWcE2GkEEWhJFwIiTCHQZFHlizSzY5vyG0mcbgdl/HjbyswUn3kw8CvmSOuzi7YNolypAgMBAAGjITAfMB0GA1UdDgQWBBRaESD5M6MGBsOr4aMdm42SVZwycDANBgkqhkiG9w0BAQsFAAOCAQEAVg1mV0Zf9/o+cAbwvcQgdGIbeUghVdDybkVkeew/3dpdRN/S9k9BTusNL4gNKbRRIjJiESq68rP++8BP7xhIO3EsICFAo/fp87af1EncYIjwh9V6P77V+wnvU8Ehgj9tGj5GhU/o1tmCLmBsJi+uUz8vd7p8S/CbH0wUpe0uov4d79R1DGYrM+fansMd9JnmZfLeGU1sx2q+hEfAZyuSRJEf4+GbgEuthq0aBNC6VeXVmmNqd36at3F9O4DzJiJOZiEHXNYOXiyJYSBEvgKdd23G9tR1Pdqw//0sKv/C4b3FQWowN7uZzJ3SJTrolzpUGlTSy5PPeXsmsL7TKM27uA=="));
  v17 = objc_alloc((Class)NSURL);
  v35 = *(_OWORD *)&v4->_host;
  studyID = v4->_studyID;
  v4->_registerURL = (NSURL *)objc_msgSend(v17, "initWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 3)));
  v18 = objc_alloc((Class)NSURL);
  submissionEndpoint = v4->_submissionEndpoint;
  v34[0] = v4->_host;
  v34[1] = submissionEndpoint;
  v4->_ingestURL = (NSURL *)objc_msgSend(v18, "initWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2)));
  v4->_studyUUID = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v4->_studyID);
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v4->_logDirectory)|| (v30 = 0, -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4->_logDirectory, 1, 0, &v30), !v30))
  {
    sub_100E35814();
  }
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v20 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf[0]) = 138412290;
    *(_QWORD *)((char *)buf + 4) = v30;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to create log directory, error: %@", (uint8_t *)buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v32 = 138412290;
    v33 = v30;
    LODWORD(v29) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Unable to create log directory, error: %@", &v32, v29);
    v28 = (char *)v27;
    sub_100512490("Generic", 1, 0, 0, "-[CLFallServer initInUniverse:]", "%s\n", v27);
    if (v28 != (char *)buf)
      free(v28);
  }
  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v3 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tearing down CLFallServer instance", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Tearing down CLFallServer instance", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }

  self->_universe = 0;
  self->_urlSession = 0;

  self->_registrationTimer = 0;
  self->_registerURL = 0;

  self->_ingestURL = 0;
  self->_studyUUID = 0;

  self->_subjectUUID = 0;
  self->_subjectAuth = 0;

  self->_hcConfig = 0;
  self->_responses = 0;

  self->_logDirectory = 0;
  self->_host = 0;

  self->_registrationEndpoint = 0;
  self->_submissionEndpoint = 0;

  self->_studyID = 0;
  self->_authorization = 0;

  self->_certificate = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLFallServer;
  -[CLFallServer dealloc](&v6, "dealloc");
}

- (BOOL)_shouldLogValueForKey:(id)a3
{
  uint64_t v4;
  BOOL result;

  v4 = 0;
  do
  {
    result = objc_msgSend(a3, "isEqualToString:", off_1021B5B30[v4]);
    if (result)
      break;
  }
  while (v4++ != 3);
  return result;
}

- (id)_initializeValueForKey:(id)a3 withDefault:(id)a4
{
  id result;
  NSString *v6;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::string *p_p;
  NSObject *v15;
  const char *v16;
  char *v17;
  NSObject *v18;
  const char *v19;
  std::string __p;
  int v21;
  id v22;
  __int16 v23;
  NSString *v24;
  _BYTE buf[1628];

  result = 0;
  if (!a3)
    return result;
  v6 = (NSString *)a4;
  if (!a4)
    return result;
  memset(&__p, 0, sizeof(__p));
  v8 = sub_100127B9C();
  sub_100081C10(v8, buf);
  v9 = sub_1000BD5F0(*(uint64_t *)buf, (uint64_t)a3, &__p);
  v10 = v9;
  v11 = *(std::__shared_weak_count **)&buf[8];
  if (!*(_QWORD *)&buf[8])
    goto LABEL_7;
  v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (!v10)
      goto LABEL_29;
  }
  else
  {
LABEL_7:
    if (!v9)
      goto LABEL_29;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__p.__r_.__value_.__l.__size_)
      goto LABEL_29;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_29;
    p_p = &__p;
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p);
  if (-[CLFallServer _shouldLogValueForKey:](self, "_shouldLogValueForKey:", a3))
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v15 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Overriding %{public}@ to: %{public}@", buf, 0x16u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_29;
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v21 = 138543618;
    v22 = a3;
    v23 = 2114;
    v24 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Overriding %{public}@ to: %{public}@", &v21, 22);
    v17 = (char *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer _initializeValueForKey:withDefault:]", "%s\n", v16);
  }
  else
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v18 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Overriding %{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_29;
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v21 = 138543362;
    v22 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Overriding %{public}@", &v21, 12);
    v17 = (char *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer _initializeValueForKey:withDefault:]", "%s\n", v19);
  }
  if (v17 != buf)
    free(v17);
LABEL_29:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

- (void)_registerDevice
{
  NSObject *v3;
  NSMutableURLRequest *v4;
  const char *v5;
  uint8_t *v6;
  _QWORD v7[5];
  _WORD v8[8];
  uint8_t buf[1640];

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v3 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Attempting to register device...", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Attempting to register device...", v8, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer _registerDevice]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", self->_registerURL);
  -[NSMutableURLRequest setAllowsCellularAccess:](v4, "setAllowsCellularAccess:", 1);
  -[NSMutableURLRequest setHTTPMethod:](v4, "setHTTPMethod:", CFSTR("POST"));
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v4, "setValue:forHTTPHeaderField:", self->_authorization, CFSTR("Authorization"));
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v4, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v4, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10140EFF0;
  v7[3] = &unk_1021B5B58;
  v7[4] = self;
  -[NSURLSessionDataTask resume](-[NSURLSession dataTaskWithRequest:completionHandler:](+[NSURLSession sharedSession](NSURLSession, "sharedSession"), "dataTaskWithRequest:completionHandler:", v4, v7), "resume");
}

- (id)_loadSubjectUUID
{
  uint64_t v2;
  int v3;
  id result;
  CFTypeRef v5;

  v5 = 0;
  v2 = sub_1001FD94C();
  v3 = sub_100219F40(v2, (uint64_t)CFSTR("HCSubjectUUID"), &v5);
  result = 0;
  if (v3)
    return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v5);
  return result;
}

- (id)_loadSubjectAuth
{
  CLKeychainItemWrapper *v2;
  id v3;

  v2 = -[CLKeychainItemWrapper initWithIdentifier:keyType:]([CLKeychainItemWrapper alloc], "initWithIdentifier:keyType:", CFSTR("HCSubjectAuth"), kSecAttrAccount);
  v3 = -[CLKeychainItemWrapper objectForKey:](v2, "objectForKey:", kSecValueData);

  if (objc_msgSend(v3, "length"))
    return v3;

  return 0;
}

- (void)_saveSubjectUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1001FD94C();
  objc_msgSend(a3, "UUIDString");
  sub_10023EC14(v4);
  v5 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 944))(v5);
}

- (void)_saveSubjectAuth:(id)a3
{
  CLKeychainItemWrapper *v4;

  v4 = -[CLKeychainItemWrapper initWithIdentifier:keyType:]([CLKeychainItemWrapper alloc], "initWithIdentifier:keyType:", CFSTR("HCSubjectAuth"), kSecAttrAccount);
  -[CLKeychainItemWrapper setObject:forKey:](v4, "setObject:forKey:", &__kCFBooleanTrue, kSecAttrIsInvisible);
  -[CLKeychainItemWrapper setObject:forKey:](v4, "setObject:forKey:", kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, kSecAttrAccessible);
  -[CLKeychainItemWrapper setObject:forKey:](v4, "setObject:forKey:", a3, kSecValueData);

}

- (void)_enableDataCollection
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSUUID *subjectUUID;
  NSUUID *studyUUID;
  _BYTE *v9;
  id v10;
  NSURLSessionConfiguration *v11;
  NSURLSession *v12;
  NSObject *v13;
  NSObject *v14;
  NSString *certificate;
  const char *v16;
  char *v17;
  const char *v18;
  char *v19;
  NSString *v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  int v24;
  NSString *v25;
  _BYTE buf[12];
  char v27;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v3 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Enabling data collection", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    LOWORD(v24) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Enabling data collection", &v24, 2);
    v17 = (char *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer _enableDataCollection]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  if (objc_opt_class(HKHealthWrapMessageConfiguration, v4))
  {
    v5 = HKHealthWrapCertificateFromString(self->_certificate);
    if (v5)
    {

      v6 = objc_alloc((Class)HKHealthWrapMessageConfiguration);
      studyUUID = self->_studyUUID;
      subjectUUID = self->_subjectUUID;
      sub_100197040();
      sub_10075A1D4((uint64_t)buf);
      if (v27 >= 0)
        v9 = buf;
      else
        v9 = *(_BYTE **)buf;
      self->_hcConfig = (HKHealthWrapMessageConfiguration *)objc_msgSend(v6, "initWithSubjectUUID:studyUUID:channel:payloadType:certificate:", subjectUUID, studyUUID, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9), CFSTR("newtongm"), v5);
      if (v27 < 0)
        operator delete(*(void **)buf);
      v10 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "operationQueue");
      v11 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.locationd.CLFallServer"));
      -[NSURLSessionConfiguration setAllowsCellularAccess:](v11, "setAllowsCellularAccess:", 0);

      v12 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v11, self, v10);
      self->_urlSession = v12;
      if (v12)
      {
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021B5B78);
        v13 = qword_10229FD98;
        if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Data collection enabled", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FD90 != -1)
            dispatch_once(&qword_10229FD90, &stru_1021B5B78);
          LOWORD(v24) = 0;
          LODWORD(v23) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Data collection enabled", &v24, v23);
          v19 = (char *)v18;
          sub_100512490("Generic", 1, 0, 2, "-[CLFallServer _enableDataCollection]", "%s\n", v18);
          if (v19 != buf)
            free(v19);
        }
        self->_dataCollectionEnabled = 1;
        -[CLTimer invalidate](self->_registrationTimer, "invalidate");
      }
    }
    else
    {
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v14 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_FAULT))
      {
        certificate = self->_certificate;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = certificate;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "NULL certificate for %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021B5B78);
        v20 = self->_certificate;
        v24 = 138543362;
        v25 = v20;
        LODWORD(v23) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 17, "NULL certificate for %{public}@", &v24, v23);
        v22 = (char *)v21;
        sub_100512490("Generic", 1, 0, 0, "-[CLFallServer _enableDataCollection]", "%s\n", v21);
        if (v22 != buf)
          free(v22);
      }
    }
  }
}

- (BOOL)sendData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  NSObject *v11;
  id v12;
  void *v13;
  NSMutableURLRequest *v14;
  NSURLSessionUploadTask *v15;
  NSObject *v16;
  id v17;
  NSURL *ingestURL;
  uint64_t v19;
  id v20;
  NSURL *v21;
  const char *v22;
  NSObject *v23;
  _BOOL4 dataCollectionEnabled;
  const char *v26;
  uint8_t *v27;
  uint8_t *v28;
  uint64_t v29;
  _BYTE v30[24];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  NSURLSessionUploadTask *v34;
  __int16 v35;
  NSURL *v36;

  if (self->_dataCollectionEnabled)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v11 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Attempting to send data...", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      *(_WORD *)v30 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Attempting to send data...", v30, 2);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLFallServer sendData:metaData:start:end:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    v12 = -[CLFallServer _encryptData:metaData:start:end:](self, "_encryptData:metaData:start:end:", a3, a4, a5, a6);
    if (v12)
    {
      v13 = v12;
      v14 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", self->_ingestURL);
      -[NSMutableURLRequest setHTTPMethod:](v14, "setHTTPMethod:", CFSTR("POST"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v14, "setValue:forHTTPHeaderField:", self->_authorization, CFSTR("Authorization"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v14, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v14, "setValue:forHTTPHeaderField:", self->_subjectAuth, CFSTR("X-HDS-Subject-Authorization"));
      v15 = -[NSURLSession uploadTaskWithRequest:fromFile:](self->_urlSession, "uploadTaskWithRequest:fromFile:", v14, v13);
      -[NSURLSessionUploadTask setTaskDescription:](v15, "setTaskDescription:", objc_msgSend(v13, "path"));
      -[NSURLSessionUploadTask resume](v15, "resume");
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v16 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v13, "path");
        ingestURL = self->_ingestURL;
        *(_DWORD *)buf = 138412802;
        v32 = v17;
        v33 = 2112;
        v34 = v15;
        v35 = 2112;
        v36 = ingestURL;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Created request for file: %@, task: %@, ingest URL: %@", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021B5B78);
        v19 = qword_10229FD98;
        v20 = objc_msgSend(v13, "path");
        v21 = self->_ingestURL;
        *(_DWORD *)v30 = 138412802;
        *(_QWORD *)&v30[4] = v20;
        *(_WORD *)&v30[12] = 2112;
        *(_QWORD *)&v30[14] = v15;
        *(_WORD *)&v30[22] = 2112;
        LODWORD(v29) = 32;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 1, "Created request for file: %@, task: %@, ingest URL: %@", v30, v29, *(_OWORD *)v30, *(_QWORD *)&v30[16], v21);
LABEL_29:
        v28 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 2, "-[CLFallServer sendData:metaData:start:end:]", "%s\n", v22);
        if (v28 != buf)
          free(v28);
      }
    }
  }
  else
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v23 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      dataCollectionEnabled = self->_dataCollectionEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = dataCollectionEnabled;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Data not sent, IsDataCollectionEnabled: %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Data not sent, IsDataCollectionEnabled: %d", v30);
      goto LABEL_29;
    }
  }
  return self->_dataCollectionEnabled;
}

- (void)cleanUp:(double)a3
{
  NSObject *v5;
  NSArray *v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  int v29;
  double v30;
  uint8_t buf[4];
  double v32;

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v5 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cleaning up Server files older than %f(s)", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v29 = 134217984;
    v30 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Cleaning up Server files older than %f(s)", COERCE_DOUBLE(&v29));
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer cleanUp:]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", self->_logDirectory, 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = -[NSString stringByAppendingPathComponent:](self->_logDirectory, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11));
        if (a3 <= 0.0
          || (objc_msgSend(-[NSDictionary objectForKey:](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v12, 0), "objectForKey:", NSFileCreationDate), "timeIntervalSinceNow"), fabs(v13) >= a3))
        {
          v23 = 0.0;
          -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v12, &v23);
          if (v23 == 0.0)
          {
            ++v9;
          }
          else
          {
            if (qword_10229FD90 != -1)
              dispatch_once(&qword_10229FD90, &stru_1021B5B78);
            v14 = qword_10229FD98;
            if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v23;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error removing data file, error: %@", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FD90 != -1)
                dispatch_once(&qword_10229FD90, &stru_1021B5B78);
              v29 = 138412290;
              v30 = v23;
              LODWORD(v22) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Error removing data file, error: %@", &v29, v22);
              v16 = (uint8_t *)v15;
              sub_100512490("Generic", 1, 0, 0, "-[CLFallServer cleanUp:]", "%s\n", v15);
              if (v16 != buf)
                free(v16);
            }
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v17 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Removed %d Server files", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v29 = 67109120;
    LODWORD(v30) = v9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Removed %d Server files", &v29);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer cleanUp:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
}

- (id)_encryptData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  id v11;
  double v12;
  uint64_t v13;
  double v14;
  NSString *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSURL *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v31;
  NSObject *v32;
  uint8_t *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSURL *v39;
  _BYTE v40[128];
  int v41;
  NSURL *v42;
  uint8_t buf[4];
  NSURL *v44;

  v11 = objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", "caseInsensitiveCompare:");
  objc_msgSend(a6, "timeIntervalSinceReferenceDate");
  v13 = (int)v12;
  objc_msgSend(a5, "timeIntervalSinceReferenceDate");
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d_%d_newtongm.dat"), v13, (int)v14);
  -[HKHealthWrapMessageConfiguration setStartDate:](self->_hcConfig, "setStartDate:", a5);
  -[HKHealthWrapMessageConfiguration setEndDate:](self->_hcConfig, "setEndDate:", a6);
  -[HKHealthWrapMessageConfiguration setKeyValuePairs:](self->_hcConfig, "setKeyValuePairs:", -[CLFallServer _createKeyValuePairsDict:metaData:](self, "_createKeyValuePairsDict:metaData:", v11, a4));
  -[HKHealthWrapMessageConfiguration setPayloadIdentifier:](self->_hcConfig, "setPayloadIdentifier:", v15);
  v16 = objc_msgSend(objc_alloc((Class)HKHealthWrapMessage), "initWithConfiguration:", self->_hcConfig);
  v39 = 0;
  if ((objc_msgSend(v16, "startWithError:", &v39) & 1) == 0)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v27 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v39;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error starting Server message, error: %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_34;
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v41 = 138412290;
    v42 = v39;
    LODWORD(v34) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Error starting Server message, error: %@", &v41, v34);
    goto LABEL_55;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
LABEL_4:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v19)
        objc_enumerationMutation(v11);
      if ((objc_msgSend(v16, "appendData:error:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v20)), &v39) & 1) == 0)break;
      if (v18 == (id)++v20)
      {
        v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v18)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v29 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v39;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error appending data to Server message, error: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v41 = 138412290;
      v42 = v39;
      LODWORD(v34) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Error appending data to Server message, error: %@", &v41, v34);
      goto LABEL_55;
    }
    goto LABEL_34;
  }
LABEL_10:
  v21 = objc_msgSend(v16, "finalizeWithError:", &v39);
  if (!v21)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v31 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v39;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error finalizing Server message, error: %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_34;
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v41 = 138412290;
    v42 = v39;
    LODWORD(v34) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Error finalizing Server message, error: %@", &v41, v34);
    goto LABEL_55;
  }
  v22 = v21;
  v23 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](self->_logDirectory, "stringByAppendingPathComponent:", objc_msgSend(v21, "lastPathComponent")));
  if (!-[NSFileManager moveItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "moveItemAtPath:toPath:error:", objc_msgSend(v22, "path"), -[NSURL path](v23, "path"), &v39))
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v32 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v39;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to move Server message along side url, error: %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_34;
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v41 = 138412290;
    v42 = v39;
    LODWORD(v34) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Unable to move Server message along side url, error: %@", &v41, v34);
LABEL_55:
    v33 = (uint8_t *)v28;
    sub_100512490("Generic", 1, 0, 0, "-[CLFallServer _encryptData:metaData:start:end:]", "%s\n", v28);
    if (v33 != buf)
      free(v33);
LABEL_34:
    objc_msgSend(v16, "reset");

    return 0;
  }
  objc_msgSend(v16, "reset");

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v24 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v44 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Successfully encrypted and moved out URL: %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v41 = 138477827;
    v42 = v23;
    LODWORD(v34) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Successfully encrypted and moved out URL: %{private}@", &v41, v34);
    v26 = (uint8_t *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer _encryptData:metaData:start:end:]", "%s\n", v25);
    if (v26 != buf)
      free(v26);
  }
  return v23;
}

- (id)_createKeyValuePairsDict:(id)a3 metaData:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  id v29;
  const __CFString *v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (char *)i + v9), objc_msgSend(CFSTR("idx-"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i)));
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      v9 = (v9 + (_DWORD)i);
    }
    while (v8);
  }
  if (a4)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(a4);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v15);
          v17 = objc_msgSend(a4, "objectForKeyedSubscript:", v16);
          v19 = objc_opt_class(NSString, v18);
          if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0
            || (v21 = objc_opt_class(NSNumber, v20), (objc_opt_isKindOfClass(v17, v21) & 1) != 0)
            || (v23 = objc_opt_class(NSNull, v22), (objc_opt_isKindOfClass(v17, v23) & 1) != 0)
            || (v25 = objc_opt_class(NSData, v24), (objc_opt_isKindOfClass(v17, v25) & 1) != 0))
          {
            objc_msgSend(v6, "setObject:forKey:", v17, v16);
          }
          else
          {
            if (qword_10229FD90 != -1)
              dispatch_once(&qword_10229FD90, &stru_1021B5B78);
            v26 = qword_10229FD98;
            if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v46 = v16;
              v47 = 2112;
              v48 = v17;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid value type for key: %@, val: %@", buf, 0x16u);
            }
            if (sub_1001BFF7C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FD90 != -1)
                dispatch_once(&qword_10229FD90, &stru_1021B5B78);
              v41 = 138412546;
              v42 = v16;
              v43 = 2112;
              v44 = v17;
              LODWORD(v32) = 22;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Invalid value type for key: %@, val: %@", &v41, v32);
              v28 = (uint8_t *)v27;
              sub_100512490("Generic", 1, 0, 0, "-[CLFallServer _createKeyValuePairsDict:metaData:]", "%s\n", v27);
              if (v28 != buf)
                free(v28);
            }
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v29 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
        v13 = v29;
      }
      while (v29);
    }
  }
  sub_100197040();
  if (sub_10075D288())
    v30 = CFSTR("internal");
  else
    v30 = CFSTR("gm");
  objc_msgSend(v6, "setObject:forKey:", v30, CFSTR("buildType"));
  return v6;
}

- (void)onDataProtectionManagerNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;

  objc_msgSend(*(id *)(a1 + 8), "silo");
  if (!*(_BYTE *)(a1 + 152) && (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 32)) && a3 == 1 && !*(_BYTE *)(a1 + 168))
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v7 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = BYTE4(a4) & 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received CLDataProtectionManager notification, deviceUnlockedSinceBoot: %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v18 = 67109120;
      LODWORD(v19) = BYTE4(a4) & 1;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 1, "Received CLDataProtectionManager notification, deviceUnlockedSinceBoot: %d", &v18);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLFallServer onDataProtectionManagerNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    if ((a4 & 0x100000000) != 0)
    {
      *(_BYTE *)(a1 + 152) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 160) + 16), "unregister:forNotification:", *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8), 1);
      *(_QWORD *)(a1 + 40) = objc_msgSend((id)a1, "_loadSubjectAuth");
      *(_QWORD *)(a1 + 32) = objc_msgSend((id)a1, "_loadSubjectUUID");
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v8 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138478083;
        v23 = v9;
        v24 = 2113;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Cached subject credentials, _subjectUUID: %{private}@, _subjectAuth: %{private}@", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021B5B78);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        v18 = 138478083;
        v19 = v13;
        v20 = 2113;
        v21 = v14;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Cached subject credentials, _subjectUUID: %{private}@, _subjectAuth: %{private}@", &v18, 22);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 2, "-[CLFallServer onDataProtectionManagerNotification:data:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
      if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 32))
      {
        objc_msgSend((id)a1, "_enableDataCollection");
      }
      else
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_101411A78;
        v17[3] = &unk_10212BB58;
        v17[4] = a1;
        objc_msgSend(*(id *)(a1 + 48), "setHandler:", v17);
        objc_msgSend(*(id *)(a1 + 48), "setNextFireDelay:interval:", 1.0, (double)*(int *)(a1 + 80));
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSObject *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v10 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v24 = NSStringFromSelector(a2);
    v25 = 2112;
    v26 = a4;
    v27 = 2048;
    v28 = objc_msgSend(a5, "length");
    v29 = 2112;
    v30 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got called back for %@ with task: %@ and data of length: %lu and id: %@", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v12 = qword_10229FD98;
    v15 = 138413058;
    v16 = NSStringFromSelector(a2);
    v17 = 2112;
    v18 = a4;
    v19 = 2048;
    v20 = objc_msgSend(a5, "length");
    v21 = 2112;
    v22 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 1, "Got called back for %@ with task: %@ and data of length: %lu and id: %@", &v15, 42);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer URLSession:dataTask:didReceiveData:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  v11 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));
  if (!v11)
  {
    v11 = objc_alloc_init((Class)NSMutableData);
    -[NSMutableDictionary setObject:forKey:](self->_responses, "setObject:forKey:", v11, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));

  }
  objc_msgSend(v11, "appendData:", a5);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unsigned int v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _BYTE v32[28];
  __int16 v33;
  id v34;
  uint8_t buf[4];
  _BYTE v36[28];
  __int16 v37;
  id v38;

  objc_sync_enter(self);
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v10 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v36 = NSStringFromSelector(a2);
    *(_WORD *)&v36[8] = 2112;
    *(_QWORD *)&v36[10] = a4;
    *(_WORD *)&v36[18] = 2112;
    *(_QWORD *)&v36[20] = a5;
    v37 = 2112;
    v38 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got called back for %@ with task: %@ and error: %@ and id: %@", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v20 = qword_10229FD98;
    v31 = 138413058;
    *(_QWORD *)v32 = NSStringFromSelector(a2);
    *(_WORD *)&v32[8] = 2112;
    *(_QWORD *)&v32[10] = a4;
    *(_WORD *)&v32[18] = 2112;
    *(_QWORD *)&v32[20] = a5;
    v33 = 2112;
    v34 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 1, "Got called back for %@ with task: %@ and error: %@ and id: %@", &v31, 42);
    v22 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer URLSession:task:didCompleteWithError:]", "%s\n", v21);
    if (v22 != buf)
      free(v22);
  }
  v11 = objc_msgSend(a4, "taskDescription");
  if (objc_msgSend(a4, "state") == (id)3 && objc_msgSend(v11, "length"))
  {
    v12 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 4, 0);
    -[NSMutableDictionary removeObjectForKey:](self->_responses, "removeObjectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));
    v14 = objc_msgSend(a4, "response");
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v15 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v14, "statusCode");
      *(_DWORD *)buf = 67240706;
      *(_DWORD *)v36 = v16;
      *(_WORD *)&v36[4] = 2112;
      *(_QWORD *)&v36[6] = v11;
      *(_WORD *)&v36[14] = 2112;
      *(_QWORD *)&v36[16] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "HTTP Response, statusCode: %{public}d, filePath: %@, response: %@", buf, 0x1Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v23 = qword_10229FD98;
      v24 = objc_msgSend(v14, "statusCode");
      v31 = 67240706;
      *(_DWORD *)v32 = v24;
      *(_WORD *)&v32[4] = 2112;
      *(_QWORD *)&v32[6] = v11;
      *(_WORD *)&v32[14] = 2112;
      *(_QWORD *)&v32[16] = v13;
      LODWORD(v29) = 28;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 1, "HTTP Response, statusCode: %{public}d, filePath: %@, response: %@", &v31, v29);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLFallServer URLSession:task:didCompleteWithError:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }

    v30 = 0;
    v17 = -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v11, &v30);
    if (v30)
      v18 = 0;
    else
      v18 = v17;
    if ((v18 & 1) == 0)
    {
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_1021B5B78);
      v19 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v36 = v11;
        *(_WORD *)&v36[8] = 2112;
        *(_QWORD *)&v36[10] = v30;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to remove file after upload attempt, filePath: %@, error: %@", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_1021B5B78);
        v31 = 138412546;
        *(_QWORD *)v32 = v11;
        *(_WORD *)&v32[8] = 2112;
        *(_QWORD *)&v32[10] = v30;
        LODWORD(v29) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 16, "Unable to remove file after upload attempt, filePath: %@, error: %@", &v31, v29);
        v28 = (uint8_t *)v27;
        sub_100512490("Generic", 1, 0, 0, "-[CLFallServer URLSession:task:didCompleteWithError:]", "%s\n", v27);
        if (v28 != buf)
          free(v28);
      }
    }
  }
  objc_sync_exit(self);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  id v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  id v40;

  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021B5B78);
  v13 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    v30 = NSStringFromSelector(a2);
    v31 = 2112;
    v32 = a4;
    v33 = 2048;
    v34 = a5;
    v35 = 2048;
    v36 = a6;
    v37 = 2048;
    v38 = a7;
    v39 = 2112;
    v40 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got called back for %@ with task: %@ and bytesSent: %lld and totalBytesSent: %lld and totalBytesExpectedToSend: %lld and id: %@", buf, 0x3Eu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021B5B78);
    v14 = qword_10229FD98;
    v17 = 138413570;
    v18 = NSStringFromSelector(a2);
    v19 = 2112;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    v23 = 2048;
    v24 = a6;
    v25 = 2048;
    v26 = a7;
    v27 = 2112;
    v28 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 1, "Got called back for %@ with task: %@ and bytesSent: %lld and totalBytesSent: %lld and totalBytesExpectedToSend: %lld and id: %@", &v17, 62);
    v16 = (uint8_t *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLFallServer URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]", "%s\n", v15);
    if (v16 != buf)
      free(v16);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  +[CLCertificatePinningHelper URLSession:didReceiveChallenge:completionHandler:](CLCertificatePinningHelper, "URLSession:didReceiveChallenge:completionHandler:", a3, a4, a5);
}

- (BOOL)dataCollectionEnabled
{
  return self->_dataCollectionEnabled;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  return self;
}

@end
