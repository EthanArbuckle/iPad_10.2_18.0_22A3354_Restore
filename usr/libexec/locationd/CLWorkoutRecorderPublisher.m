@implementation CLWorkoutRecorderPublisher

- (CLWorkoutRecorderPublisher)initWithDelegate:(id)a3 settings:(void *)a4
{
  CLWorkoutRecorderPublisher *v6;
  NSObject *v7;
  void **v8;
  void **v9;
  id v10;
  void **v11;
  NSObject *v12;
  NSString *subjectUUIDKey;
  NSObject *v14;
  NSString *subjectAuthKey;
  void **v16;
  NSString *v17;
  id v18;
  NSURLSessionConfiguration *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v23;
  uint8_t *v24;
  NSString *v25;
  const char *v26;
  uint8_t *v27;
  NSString *v28;
  const char *v29;
  uint8_t *v30;
  const char *v31;
  uint8_t *v32;
  const char *v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37[2];
  char v38;
  objc_super v39;
  _QWORD v40[3];
  _QWORD v41[2];
  _QWORD v42[3];
  void *__p[2];
  uint64_t v44;
  uint8_t buf[4];
  _BYTE v46[20];
  uint64_t v47;

  v39.receiver = self;
  v39.super_class = (Class)CLWorkoutRecorderPublisher;
  v6 = -[CLWorkoutRecorderPublisher init](&v39, "init");
  if (v6)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v7 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Initializing CLWorkoutRecorderPublisher instance", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(__p[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Initializing CLWorkoutRecorderPublisher instance", __p, 2);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
    v6->_delegate = (CLWorkoutRecorderPublisherDelegate *)a3;
    sub_1018BF25C(buf, "WorkoutRecorderPublisherShowSubjectIDInLogs", byte_102300E00, 0);
    v6->_enableWritingRecordingIdentifiersToSysDiagnose = buf[1];
    sub_1015A2E04(v37, "JoyrVmlPfjBQSCHspqiWf3vT2dfmqe2ij97pxMwH46stDDAL0PW5COcu3gGJ40B4");
    sub_1018C9D4C((BOOL *)buf, "WorkoutRecorderPublisherAuthorization", (__int128 *)v37, 0);
    if (SHIBYTE(v47) < 0)
    {
      sub_100115CE4(__p, *(void **)&v46[4], *(unint64_t *)&v46[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v46[4];
      v44 = v47;
    }
    if (v44 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    v6->_authorization = (NSString *)-[NSString copy](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8), "copy");
    if (SHIBYTE(v44) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v47) < 0)
      operator delete(*(void **)&v46[4]);
    if (v38 < 0)
      operator delete(v37[0]);
    sub_1015A2E04(v37, "MIIDjTCCAnWgAwIBAgIEFN2TTjANBgkqhkiG9w0BAQsFADB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwHhcNMTcwNDE4MTgzODI4WhcNMTgwNDE4MTgzODI4WjB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDvR2JtAkPdG/BldPRT7EupiMo4ZvLOzztoDeul2awbM9fBU8kc3nlapOi2vooX62cyPJKsqCas465gy4U3JJBMVg/MjshfUIDBb1LQzGtvfYkirdpWOqJ7riQ0Wbe6LLRFD0963JNF1lyMHkf7OqZegIh8c+xGGgd2ynkdivaKOr2d7Qf67y2UarQc+qIgkljsaOugfBr3jsUcO0tE0j9LGOvTZZEZd3ykXUEChIkwGW+QWWd3Indit4ArSMGDjkrltGX88FBWgbPYe8dgjWcE2GkEEWhJFwIiTCHQZFHlizSzY5vyG0mcbgdl/HjbyswUn3kw8CvmSOuzi7YNolypAgMBAAGjITAfMB0GA1UdDgQWBBRaESD5M6MGBsOr4aMdm42SVZwycDANBgkqhkiG9w0BAQsFAAOCAQEAVg1mV0Zf9/o+cAbwvcQgdGIbeUghVdDybkVkeew/3dpdRN/S9k9BTusNL4gNKbRRIjJiESq68rP++8BP7xhIO3EsICFAo/fp87af1EncYIjwh9V6P77V+wnvU8Ehgj9tGj5GhU/o1tmCLmBsJi+uUz8vd7p8S/CbH0wUpe0uov4d79R1DGYrM+fansMd9JnmZfLeGU1sx2q+hEfAZyuSRJEf4+GbgEuthq0aBNC6VeXVmmNqd36at3F9O4DzJiJOZiEHXNYOXiyJYSBEvgKdd23G9tR1Pdqw//0sKv/C4b3FQWowN7uZzJ3SJTrolzpUGlTSy5PPeXsmsL7TKM27uA==");
    sub_1018C9D4C((BOOL *)buf, "WorkoutRecorderPublisherCertificate", (__int128 *)v37, 0);
    if (SHIBYTE(v47) < 0)
    {
      sub_100115CE4(__p, *(void **)&v46[4], *(unint64_t *)&v46[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v46[4];
      v44 = v47;
    }
    if (v44 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    v6->_certificate = (NSString *)-[NSString copy](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9), "copy");
    if (SHIBYTE(v44) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v47) < 0)
      operator delete(*(void **)&v46[4]);
    if (v38 < 0)
      operator delete(v37[0]);
    v10 = objc_alloc((Class)NSUUID);
    sub_1015A2E04(v37, "53681040-29d2-4420-988a-adbdf2f02905");
    sub_1018C9D4C((BOOL *)buf, "WorkoutRecorderPublisherStudyUUID", (__int128 *)v37, 0);
    if (SHIBYTE(v47) < 0)
    {
      sub_100115CE4(__p, *(void **)&v46[4], *(unint64_t *)&v46[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v46[4];
      v44 = v47;
    }
    if (v44 >= 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    v6->_studyUUID = (NSUUID *)objc_msgSend(v10, "initWithUUIDString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
    if (SHIBYTE(v44) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v47) < 0)
      operator delete(*(void **)&v46[4]);
    if (v38 < 0)
      operator delete(v37[0]);
    v6->_subjectUUIDKey = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), (*(uint64_t (**)(_QWORD))(**(_QWORD **)a4 + 24))(*(_QWORD *)a4), -[NSUUID UUIDString](v6->_studyUUID, "UUIDString"));
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v12 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      subjectUUIDKey = v6->_subjectUUIDKey;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v46 = subjectUUIDKey;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Setting subjectID key : %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v25 = v6->_subjectUUIDKey;
      LODWORD(__p[0]) = 138412290;
      *(void **)((char *)__p + 4) = v25;
      LODWORD(v35) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Setting subjectID key : %@", __p, v35);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    v6->_subjectAuthKey = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), (*(uint64_t (**)(_QWORD))(**(_QWORD **)a4 + 32))(*(_QWORD *)a4), -[NSUUID UUIDString](v6->_studyUUID, "UUIDString"));
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v14 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      subjectAuthKey = v6->_subjectAuthKey;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v46 = subjectAuthKey;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Setting subjectAuthKey key : %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v28 = v6->_subjectAuthKey;
      LODWORD(__p[0]) = 138412290;
      *(void **)((char *)__p + 4) = v28;
      LODWORD(v36) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Setting subjectAuthKey key : %@", __p, v36);
      v30 = (uint8_t *)v29;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v29);
      if (v30 != buf)
        free(v30);
    }
    sub_1015A2E04(v37, "https://ingest.apple-studies.com:8443");
    sub_1018C9D4C((BOOL *)buf, "WorkoutRecorderPublisherHost", (__int128 *)v37, 0);
    if (SHIBYTE(v47) < 0)
    {
      sub_100115CE4(__p, *(void **)&v46[4], *(unint64_t *)&v46[12]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)&v46[4];
      v44 = v47;
    }
    if (v44 >= 0)
      v16 = __p;
    else
      v16 = (void **)__p[0];
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16);
    if (SHIBYTE(v44) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v47) < 0)
      operator delete(*(void **)&v46[4]);
    if (v38 < 0)
      operator delete(v37[0]);
    v42[0] = v17;
    v42[1] = CFSTR("/ingest/v2/register");
    v42[2] = -[NSUUID UUIDString](v6->_studyUUID, "UUIDString");
    v6->_registerURL = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 3)));
    v41[0] = v17;
    v41[1] = CFSTR("/ingest/v2/submit");
    v6->_ingestURL = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2)));
    v40[0] = v17;
    v40[1] = CFSTR("/ingest/v1/config");
    v40[2] = -[NSString lowercaseString](-[NSUUID UUIDString](v6->_studyUUID, "UUIDString"), "lowercaseString");
    v6->_configurationURL = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3)));
    v18 = objc_msgSend(-[CLWorkoutRecorderPublisherDelegate silo](v6->_delegate, "silo"), "operationQueue");
    v19 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", (*(uint64_t (**)(_QWORD))(**(_QWORD **)a4 + 16))(*(_QWORD *)a4));
    -[NSURLSessionConfiguration setSessionSendsLaunchEvents:](v19, "setSessionSendsLaunchEvents:", 0);
    -[NSURLSessionConfiguration setAllowsCellularAccess:](v19, "setAllowsCellularAccess:", 0);
    -[NSURLSessionConfiguration set_requiresPowerPluggedIn:](v19, "set_requiresPowerPluggedIn:", 1);
    v6->_urlSession = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v19, v6, v18);
    v6->_responses = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/var/mobile/Library/locationd/WorkoutRecorder")))
    {
      v37[0] = 0;
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", CFSTR("/var/mobile/Library/locationd/WorkoutRecorder"), v37);
      if (v37[0])
      {
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v20 = qword_10229FE48;
        if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void **)v46 = v37[0];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to delete publishing directory directory, error: %{public}@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE40 != -1)
            dispatch_once(&qword_10229FE40, &stru_1021D8030);
          LODWORD(__p[0]) = 138543362;
          *(void **)((char *)__p + 4) = v37[0];
          LODWORD(v36) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Unable to delete publishing directory directory, error: %{public}@", __p, v36);
          v34 = (uint8_t *)v33;
          sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v33);
          if (v34 != buf)
            free(v34);
        }
      }
    }
    v37[0] = 0;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/locationd/WorkoutRecorder"), 1, 0, v37);
    if (v37[0])
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v21 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void **)v46 = v37[0];
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to create publishing directory, error: %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        LODWORD(__p[0]) = 138412290;
        *(void **)((char *)__p + 4) = v37[0];
        LODWORD(v36) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Unable to create publishing directory, error: %@", __p, v36);
        v32 = (uint8_t *)v31;
        sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher initWithDelegate:settings:]", "%s\n", v31);
        if (v32 != buf)
          free(v32);
      }
      return 0;
    }
    else
    {
      -[CLWorkoutRecorderPublisher registerDevice](v6, "registerDevice");
      -[CLWorkoutRecorderPublisher setupConfigurationTimer](v6, "setupConfigurationTimer");
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_delegate = 0;

  self->_urlSession = 0;
  self->_responses = 0;

  self->_registrationTimer = 0;
  self->_subjectUUID = 0;

  self->_subjectToken = 0;
  self->_authorization = 0;

  self->_certificate = 0;
  self->_studyUUID = 0;

  self->_registerURL = 0;
  self->_ingestURL = 0;

  self->_healthWrapConfiguration = 0;
  self->_subjectUUIDKey = 0;

  self->_subjectAuthKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWorkoutRecorderPublisher;
  -[CLWorkoutRecorderPublisher dealloc](&v3, "dealloc");
}

- (void)publishDataFiles:(id)a3 metadata:(id)a4 startDate:(id)a5 endDate:(id)a6 settings:(void *)a7
{
  NSObject *v13;
  id v14;
  NSMutableURLRequest *v15;
  NSString *authorization;
  NSURLSessionUploadTask *v17;
  NSObject *v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  NSObject *v27;
  const char *v28;
  uint8_t *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const char *v35;
  uint8_t *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint8_t *v40;
  const char *v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  id v46[2];
  int v47;
  _BYTE v48[10];
  NSURLSessionUploadTask *v49;
  uint8_t buf[4];
  _BYTE v51[10];
  NSURLSessionUploadTask *v52;

  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v13 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Publishing data files.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    LOWORD(v47) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Publishing data files.", &v47, 2);
    v36 = (uint8_t *)v35;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v35);
    if (v36 != buf)
      free(v36);
  }
  sub_100131938(v46, (uint64_t)"WorkoutRecorder.CLWorkoutRecorderPublisher.publishDataFiles", 0);
  if (-[CLWorkoutRecorderPublisher canPublish](self, "canPublish"))
  {
    v14 = -[CLWorkoutRecorderPublisher encryptData:metaData:start:end:](self, "encryptData:metaData:start:end:", a3, a4, a5, a6);
    if (v14)
    {
      v15 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", self->_ingestURL);
      -[NSMutableURLRequest setAllowsCellularAccess:](v15, "setAllowsCellularAccess:", 0);
      -[NSMutableURLRequest setHTTPMethod:](v15, "setHTTPMethod:", CFSTR("POST"));
      authorization = self->_authorization;
      if (authorization)
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v15, "setValue:forHTTPHeaderField:", authorization, CFSTR("Authorization"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v15, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v15, "setValue:forHTTPHeaderField:", -[CLWorkoutRecorderPublisher subjectToken](self, "subjectToken"), CFSTR("X-HDS-Subject-Authorization"));
      v17 = -[NSURLSession uploadTaskWithRequest:fromFile:](self->_urlSession, "uploadTaskWithRequest:fromFile:", v15, v14);
      -[NSURLSessionUploadTask setTaskDescription:](v17, "setTaskDescription:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@::%@"), CFSTR("ingest"), objc_msgSend(v14, "path")));
      -[NSURLSessionUploadTask resume](v17, "resume");
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v18 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
      {
        v19 = objc_msgSend(v14, "path");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v51 = v19;
        *(_WORD *)&v51[8] = 2112;
        v52 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Created request for file: %@, task: %@", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v37 = qword_10229FE48;
        v38 = objc_msgSend(v14, "path");
        v47 = 138412546;
        *(_QWORD *)v48 = v38;
        *(_WORD *)&v48[8] = 2112;
        v49 = v17;
        LODWORD(v44) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v37, 2, "Created request for file: %@, task: %@", &v47, v44);
        v40 = (uint8_t *)v39;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v39);
        if (v40 != buf)
          free(v40);
      }
      v20 = sub_1018C1104(*(_QWORD *)a7);
      v21 = sub_1001FD94C();
      v22 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a7 + 48))(*(_QWORD *)a7);
      *(_DWORD *)buf = 0;
      if (sub_1001C1194(v21, v22, buf))
        v23 = *(_DWORD *)buf + 1;
      else
        v23 = 1;
      v45 = v23;
      if (v20 - 1 >= v23)
      {
        v32 = sub_1001FD94C();
        v33 = (const __CFString *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)a7 + 48))(*(_QWORD *)a7);
        sub_10018AAE4(v32, v33, &v45);
      }
      else
      {
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v24 = qword_10229FE48;
        if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v51 = v23;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Reregistering the device as count: %d equals or exceeds maxCount: %d", buf, 0xEu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE40 != -1)
            dispatch_once(&qword_10229FE40, &stru_1021D8030);
          v47 = 67109376;
          *(_DWORD *)v48 = v23;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)&v48[6] = v20;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Reregistering the device as count: %d equals or exceeds maxCount: %d", &v47, 14);
          v42 = (uint8_t *)v41;
          sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v41);
          if (v42 != buf)
            free(v42);
        }
        -[CLWorkoutRecorderPublisher reregisterDevice](self, "reregisterDevice");
        v25 = sub_1001FD94C();
        v26 = (const __CFString *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)a7 + 48))(*(_QWORD *)a7);
        *(_DWORD *)buf = 0;
        sub_10011B5B8(v25, v26, buf);
      }
      v34 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 944))(v34);
      goto LABEL_45;
    }
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v30 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to send file, unable to create message for server.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v47) = 0;
      LODWORD(v43) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Unable to send file, unable to create message for server.", &v47, v43);
      v29 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v31);
LABEL_41:
      if (v29 != buf)
        free(v29);
    }
  }
  else
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v27 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unable to publish, publisher not active.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v47) = 0;
      LODWORD(v43) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "Unable to publish, publisher not active.", &v47, v43);
      v29 = (uint8_t *)v28;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher publishDataFiles:metadata:startDate:endDate:settings:]", "%s\n", v28);
      goto LABEL_41;
    }
  }
LABEL_45:
  sub_100131740(v46);
}

- (id)encryptData:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6
{
  HKHealthWrapMessageConfiguration *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSURL *v17;
  id v18;
  void *v19;
  NSURL *v20;
  NSObject *v21;
  NSURL *v22;
  uint64_t v23;
  NSURL *v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  uint8_t *v28;
  double v29;
  NSObject *v30;
  NSObject *v32;
  NSObject *v33;
  double v34;
  uint8_t *v35;
  uint8_t *v36;
  NSObject *v37;
  const char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  NSURL *v43;
  int v44;
  NSURL *v45;
  __int16 v46;
  NSURL *v47;
  uint8_t v48[128];
  uint8_t buf[4];
  NSURL *v50;
  __int16 v51;
  NSURL *v52;

  v11 = -[CLWorkoutRecorderPublisher healthWrapConfiguration](self, "healthWrapConfiguration");
  -[HKHealthWrapMessageConfiguration setStartDate:](v11, "setStartDate:", a5);
  -[HKHealthWrapMessageConfiguration setEndDate:](v11, "setEndDate:", a6);
  -[HKHealthWrapMessageConfiguration setKeyValuePairs:](v11, "setKeyValuePairs:", a4);
  -[HKHealthWrapMessageConfiguration setPayloadIdentifier:](v11, "setPayloadIdentifier:", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"));
  v12 = objc_msgSend(objc_alloc((Class)HKHealthWrapMessage), "initWithConfiguration:", v11);
  v43 = 0;
  if ((objc_msgSend(v12, "startWithError:", &v43) & 1) == 0)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v27 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v43;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Error starting message, error: %{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_35;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v44 = 138543362;
    v45 = v43;
    v29 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 1, "Error starting message, error: %{public}@", &v44, 12);
LABEL_65:
    v36 = v28;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n", v29);
    goto LABEL_66;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
LABEL_4:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v15)
        objc_enumerationMutation(a3);
      v17 = *(NSURL **)(*((_QWORD *)&v39 + 1) + 8 * v16);
      v43 = 0;
      if ((objc_msgSend(v12, "appendDataFromFileURL:error:", v17, &v43) & 1) == 0)
        break;
      if (v14 == (id)++v16)
      {
        v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v14)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v30 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v50 = v17;
      v51 = 2114;
      v52 = v43;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Error appending file to message, file: %{public}@, error: %{public}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v44 = 138543618;
      v45 = v17;
      v46 = 2114;
      v47 = v43;
      v29 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 1, "Error appending file to message, file: %{public}@, error: %{public}@", &v44, 22);
      goto LABEL_65;
    }
    goto LABEL_35;
  }
LABEL_10:
  v43 = 0;
  v18 = objc_msgSend(v12, "finalizeWithError:", &v43);
  if (!v18)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v32 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v43;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Error finalizing message, error: %{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_35;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v44 = 138543362;
    v45 = v43;
    v29 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 1, "Error finalizing message, error: %{public}@", &v44, 12);
    goto LABEL_65;
  }
  v19 = v18;
  v20 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(CFSTR("/var/mobile/Library/locationd/WorkoutRecorder"), "stringByAppendingPathComponent:", objc_msgSend(v18, "lastPathComponent")));
  if (!-[NSFileManager moveItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "moveItemAtPath:toPath:error:", objc_msgSend(v19, "path"), -[NSURL path](v20, "path"), &v43))
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v33 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v43;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Unable to move publishing file, error: %@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_35;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v44 = 138412290;
    v45 = v43;
    v34 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Unable to move publishing file, error: %@", &v44, 12);
    v36 = v35;
    sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n", v34);
LABEL_66:
    if (v36 != buf)
      free(v36);
LABEL_35:
    objc_msgSend(v12, "reset");
    v20 = 0;
    goto LABEL_36;
  }
  if (self->_enableWritingRecordingIdentifiersToSysDiagnose)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v21 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (NSURL *)-[HKHealthWrapMessageConfiguration payloadIdentifier](v11, "payloadIdentifier");
      *(_DWORD *)buf = 138478083;
      v50 = v22;
      v51 = 2114;
      v52 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully created message with UUID: %{private}@, URL: %{public}@", buf, 0x16u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_36;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v23 = qword_10229FE48;
    v24 = (NSURL *)-[HKHealthWrapMessageConfiguration payloadIdentifier](v11, "payloadIdentifier");
    v44 = 138478083;
    v45 = v24;
    v46 = 2114;
    v47 = v20;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 0, "Successfully created message with UUID: %{private}@, URL: %{public}@", &v44, 22);
    v26 = (uint8_t *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n", v25);
    if (v26 == buf)
      goto LABEL_36;
LABEL_61:
    free(v26);
    goto LABEL_36;
  }
  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v37 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Successfully created message with URL: %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v44 = 138543362;
    v45 = v20;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "Successfully created message with URL: %{public}@", &v44, 12);
    v26 = (uint8_t *)v38;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher encryptData:metaData:start:end:]", "%s\n", v38);
    if (v26 != buf)
      goto LABEL_61;
  }
LABEL_36:

  return v20;
}

- (void)sendRegisterRequest
{
  NSURLSession *urlSession;
  _QWORD v3[5];

  urlSession = self->_urlSession;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1018DDEE8;
  v3[3] = &unk_1021D8010;
  v3[4] = self;
  -[NSURLSession getTasksWithCompletionHandler:](urlSession, "getTasksWithCompletionHandler:", v3);
}

- (void)sendConfigurationRequest
{
  NSURLSession *urlSession;
  _QWORD v3[5];

  urlSession = self->_urlSession;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1018DE468;
  v3[3] = &unk_1021D8010;
  v3[4] = self;
  -[NSURLSession getTasksWithCompletionHandler:](urlSession, "getTasksWithCompletionHandler:", v3);
}

- (void)unregisterDevice
{

  self->_healthWrapConfiguration = 0;
  -[CLWorkoutRecorderPublisher setSubjectUUID:](self, "setSubjectUUID:", 0);
  -[CLWorkoutRecorderPublisher setSubjectToken:](self, "setSubjectToken:", 0);
}

- (void)registerDevice
{
  NSObject *v3;
  CLTimer *v4;
  const char *v5;
  uint8_t *v6;
  _QWORD v7[5];
  _WORD v8[8];
  uint8_t buf[8];
  double v10;

  if (-[CLWorkoutRecorderPublisher canPublish](self, "canPublish") || self->_registrationTimer)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v3 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Registration requiremets already met, will not register.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Registration requiremets already met, will not register.", v8, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher registerDevice]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
  else
  {
    v4 = (CLTimer *)objc_msgSend(-[CLWorkoutRecorderPublisherDelegate silo](self->_delegate, "silo"), "newTimer");
    self->_registrationTimer = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1018DEA6C;
    v7[3] = &unk_10212BB58;
    v7[4] = self;
    -[CLTimer setHandler:](v4, "setHandler:", v7);
    sub_1018BEA14(buf, "WorkoutRecorderPublisherRegistrationTimerInterval", &qword_102300E08, 0);
    -[CLTimer setNextFireDelay:interval:](self->_registrationTimer, "setNextFireDelay:interval:", 0.01, v10);
  }
}

- (void)reregisterDevice
{
  -[CLWorkoutRecorderPublisher unregisterDevice](self, "unregisterDevice");
  -[CLWorkoutRecorderPublisher registerDevice](self, "registerDevice");
}

- (void)setupConfigurationTimer
{
  CLTimer *v3;
  unsigned __int8 v4[8];
  double v5;
  _QWORD v6[5];

  v3 = (CLTimer *)objc_msgSend(-[CLWorkoutRecorderPublisherDelegate silo](self->_delegate, "silo"), "newTimer");
  self->_configurationTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1018DEB34;
  v6[3] = &unk_10212BB58;
  v6[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v6);
  sub_1018BEA14(v4, "WorkoutRecorderPublisherConfigurationTimerInterval", &qword_102300E10, 0);
  -[CLTimer setNextFireDelay:interval:](self->_configurationTimer, "setNextFireDelay:interval:", 0.01, v5);
}

- (void)requestConfiguration
{
  -[CLWorkoutRecorderPublisher sendConfigurationRequest](self, "sendConfigurationRequest");
}

- (BOOL)canPublish
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  _DWORD v8[4];
  uint8_t buf[4];
  _BOOL4 v10;

  if (-[CLWorkoutRecorderPublisher subjectToken](self, "subjectToken"))
    v3 = -[CLWorkoutRecorderPublisher healthWrapConfiguration](self, "healthWrapConfiguration") != 0;
  else
    v3 = 0;
  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v4 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "can Publish %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "can Publish %d", v8);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher canPublish]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  return v3;
}

- (NSString)subjectToken
{
  NSString *result;
  CLKeychainItemWrapper *v4;
  id v5;
  void *v6;
  NSObject *v7;
  double v8;
  uint8_t *v9;
  uint8_t *v10;
  NSObject *v11;
  double v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[1640];

  result = self->_subjectToken;
  if (!result)
  {
    v4 = -[CLKeychainItemWrapper initWithIdentifier:keyType:]([CLKeychainItemWrapper alloc], "initWithIdentifier:keyType:", self->_subjectAuthKey, kSecAttrAccount);
    v5 = -[CLKeychainItemWrapper objectForKey:](v4, "objectForKey:", kSecValueData);
    if (v5 && (v6 = v5, (objc_msgSend(v5, "isEqualToString:", &stru_1021D8FB8) & 1) == 0))
    {
      self->_subjectToken = (NSString *)objc_msgSend(v6, "copy");
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v11 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Succesfully acquired SubjectToken from keychain.", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_17;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v14[0] = 0;
      v12 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "Succesfully acquired SubjectToken from keychain.", v14, 2);
      v10 = v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectToken]", "%s\n", v12);
    }
    else
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v7 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Subject token was returned empty from keychain.", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_17;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v14[0] = 0;
      v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Subject token was returned empty from keychain.", v14, 2);
      v10 = v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher subjectToken]", "%s\n", v8);
    }
    if (v10 != buf)
      free(v10);
LABEL_17:

    return self->_subjectToken;
  }
  return result;
}

- (void)setSubjectToken:(id)a3
{
  NSString *v4;
  CLKeychainItemWrapper *v5;
  const __CFString *v6;
  NSObject *v7;
  NSString *subjectAuthKey;
  NSString *v9;
  const char *v10;
  NSObject *v11;
  uint8_t *v12;
  __int128 v13;
  uint8_t buf[4];
  NSString *v15;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  v5 = -[CLKeychainItemWrapper initWithIdentifier:keyType:]([CLKeychainItemWrapper alloc], "initWithIdentifier:keyType:", self->_subjectAuthKey, kSecAttrAccount);
  -[CLKeychainItemWrapper setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, kSecAttrIsInvisible);
  -[CLKeychainItemWrapper setObject:forKey:](v5, "setObject:forKey:", kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, kSecAttrAccessible);
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1021D8FB8;
  -[CLKeychainItemWrapper setObject:forKey:](v5, "setObject:forKey:", v6, kSecValueData);

  self->_subjectToken = v4;
  if (self->_enableWritingRecordingIdentifiersToSysDiagnose)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v7 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      subjectAuthKey = self->_subjectAuthKey;
      *(_DWORD *)buf = 138412290;
      v15 = subjectAuthKey;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Setting new SubjectToken for key %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v9 = self->_subjectAuthKey;
      LODWORD(v13) = 138412290;
      *(_QWORD *)((char *)&v13 + 4) = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Setting new SubjectToken for key %@", &v13, 12, v13);
LABEL_22:
      v12 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher setSubjectToken:]", "%s\n", v10);
      if (v12 != buf)
        free(v12);
    }
  }
  else
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v11 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Setting new SubjectToken.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v13) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Setting new SubjectToken.", &v13, 2, v13);
      goto LABEL_22;
    }
  }
}

- (NSString)subjectUUID
{
  NSString *result;
  uint64_t v4;
  NSObject *v5;
  NSString *subjectUUID;
  NSString *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSString *v22;
  uint8_t buf[4];
  NSString *v24;

  result = self->_subjectUUID;
  if (!result)
  {
    v20 = 0;
    v4 = sub_1001FD94C();
    if ((sub_100219F40(v4, (uint64_t)self->_subjectUUIDKey, (CFTypeRef *)&v20) & 1) == 0)
    {
      self->_subjectUUID = 0;
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v9 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cached subjectUUID found,subjectUUID is set to nil", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        LOWORD(v21) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "No cached subjectUUID found,subjectUUID is set to nil", &v21, 2);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectUUID]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
      return self->_subjectUUID;
    }
    self->_subjectUUID = (NSString *)objc_msgSend(v20, "copy");
    if (self->_enableWritingRecordingIdentifiersToSysDiagnose)
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v5 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
      {
        subjectUUID = self->_subjectUUID;
        *(_DWORD *)buf = 138412290;
        v24 = subjectUUID;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_subjectUUID cached copy %@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_26;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v7 = self->_subjectUUID;
      v21 = 138412290;
      v22 = v7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "_subjectUUID cached copy %@", &v21, 12);
    }
    else
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v12 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Successfully retrieved subjectUUID from cache", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_26;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v21) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Successfully retrieved subjectUUID from cache", &v21, 2);
    }
    v18 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectUUID]", "%s\n", v8);
    if (v18 != buf)
      free(v18);
LABEL_26:
    if (-[NSString isEqualToString:](self->_subjectUUID, "isEqualToString:", &stru_1021D8FB8))
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v13 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "subjectUUID is empty.Clearing uuid saved to cache", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        LOWORD(v21) = 0;
        LODWORD(v19) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "subjectUUID is empty.Clearing uuid saved to cache", &v21, v19);
        v17 = (uint8_t *)v16;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher subjectUUID]", "%s\n", v16);
        if (v17 != buf)
          free(v17);
      }
      v14 = sub_1001FD94C();
      sub_1005254E4(v14);
      v15 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 944))(v15);

      self->_subjectUUID = 0;
    }
    return self->_subjectUUID;
  }
  return result;
}

- (void)setSubjectUUID:(id)a3
{
  NSString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  uint8_t *v14;
  _QWORD v15[2];
  uint8_t buf[1640];

  v4 = (NSString *)objc_msgSend(a3, "copy");
  if (v4)
  {
    v5 = sub_1001FD94C();
    if (sub_10023EC14(v5))
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v6 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Setting subject id", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        LOWORD(v15[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Setting subject id", v15, 2, v15[0]);
LABEL_30:
        v14 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher setSubjectUUID:]", "%s\n", v7);
        if (v14 != buf)
          free(v14);
      }
    }
    else
    {
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v10 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Unable to set subject id in CLDaemonCache", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        LOWORD(v15[0]) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Unable to set subject id in CLDaemonCache", v15, 2, v15[0]);
        goto LABEL_30;
      }
    }
  }
  else
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v8 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "subjectUUID from server is empty", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "subjectUUID from server is empty", v15, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher setSubjectUUID:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v9 = sub_1001FD94C();
    sub_1005254E4(v9);
  }
  v11 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 944))(v11);

  self->_subjectUUID = v4;
}

- (HKHealthWrapMessageConfiguration)healthWrapConfiguration
{
  _BYTE *v4;
  NSString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  char *v9;
  NSObject *v10;
  NSString *certificate;
  NSString *v12;
  const char *v13;
  char *v14;
  int v15;
  NSString *v16;
  _BYTE __p[12];
  char v18;

  if (self->_healthWrapConfiguration || !-[CLWorkoutRecorderPublisher subjectUUID](self, "subjectUUID"))
    return self->_healthWrapConfiguration;
  sub_100197040();
  sub_10075A1D4((uint64_t)__p);
  if (v18 >= 0)
    v4 = __p;
  else
    v4 = *(_BYTE **)__p;
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4);
  if (v18 < 0)
    operator delete(*(void **)__p);
  v6 = HKHealthWrapCertificateFromString(self->_certificate);
  if (v6)
  {
    self->_healthWrapConfiguration = (HKHealthWrapMessageConfiguration *)objc_msgSend(objc_alloc((Class)HKHealthWrapMessageConfiguration), "initWithSubjectUUID:studyUUID:channel:payloadType:certificate:", objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", -[CLWorkoutRecorderPublisher subjectUUID](self, "subjectUUID")), self->_studyUUID, v5, CFSTR("workout"), v6);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v7 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating new healthwrapConfiguration", __p, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v15) = 0;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE48, 0, "Creating new healthwrapConfiguration", &v15, 2);
      v9 = (char *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher healthWrapConfiguration]", "%s\n", v8);
      if (v9 != __p)
        free(v9);
    }
    return self->_healthWrapConfiguration;
  }
  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v10 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_FAULT))
  {
    certificate = self->_certificate;
    *(_DWORD *)__p = 138543362;
    *(_QWORD *)&__p[4] = certificate;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "NULL certificate for %{public}@", __p, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v12 = self->_certificate;
    v15 = 138543362;
    v16 = v12;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE48, 17, "NULL certificate for %{public}@", &v15, 12);
    v14 = (char *)v13;
    sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher healthWrapConfiguration]", "%s\n", v13);
    if (v14 != __p)
      free(v14);
  }
  return 0;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  uint8_t *v18;
  uint8_t *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  NSData *v24;
  id v25;
  NSObject *v26;
  uint8_t *v27;
  double v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint8_t *v33;
  double v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint8_t *v38;
  uint64_t v39;
  const char *v40;
  uint8_t *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  double v46;
  uint8_t *v47;
  const char *v48;
  uint8_t *v49;
  uint64_t v50;
  void *v51;
  NSURL *v52;
  id v53;
  int v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;

  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v8 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v61 = objc_msgSend(a4, "taskDescription");
    v62 = 2048;
    v63 = objc_msgSend(a4, "taskIdentifier");
    v64 = 2112;
    v65 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Download task completed with task: %@ and task id: %lu and location: %@", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v39 = qword_10229FE48;
    v54 = 138412802;
    v55 = objc_msgSend(a4, "taskDescription");
    v56 = 2048;
    v57 = objc_msgSend(a4, "taskIdentifier");
    v58 = 2112;
    v59 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v39, 0, "Download task completed with task: %@ and task id: %lu and location: %@", &v54, 32);
    v41 = (uint8_t *)v40;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v40);
    if (v41 != buf)
      free(v41);
  }
  v9 = objc_msgSend(a4, "response");
  if (objc_msgSend(a4, "error")
    || (uint64_t)objc_msgSend(v9, "statusCode") < 200
    || (uint64_t)objc_msgSend(v9, "statusCode") >= 300)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v20 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend(a4, "taskDescription");
      v22 = objc_msgSend(v9, "statusCode");
      v23 = objc_msgSend(a4, "error");
      *(_DWORD *)buf = 138412802;
      v61 = v21;
      v62 = 2048;
      v63 = v22;
      v64 = 2112;
      v65 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Error in download task:%@, statusCode: %ld, error: %@", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v42 = qword_10229FE48;
      v43 = objc_msgSend(a4, "taskDescription");
      v44 = objc_msgSend(v9, "statusCode");
      v45 = objc_msgSend(a4, "error");
      v54 = 138412802;
      v55 = v43;
      v56 = 2048;
      v57 = v44;
      v58 = 2112;
      v59 = v45;
      LODWORD(v50) = 32;
      v46 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v42, 2, "Error in download task:%@, statusCode: %ld, error: %@", &v54, v50);
      v38 = v47;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v46);
      goto LABEL_84;
    }
  }
  else
  {
    v52 = 0;
    v53 = 0;
    sub_1018DE2CC(objc_msgSend(a4, "taskDescription"), &v53, &v52);
    if (objc_msgSend(v53, "isEqualToString:", CFSTR("registration")))
    {
      v51 = 0;
      v10 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a5), 1, &v51);
      if (v10 && !v51)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, "objectForKey:", CFSTR("subjectId"));
        v13 = objc_msgSend(v11, "objectForKey:", CFSTR("token"));
        if (v12)
        {
          v14 = v13;
          if (v13)
          {
            if (qword_10229FE40 != -1)
              dispatch_once(&qword_10229FE40, &stru_1021D8030);
            v15 = qword_10229FE48;
            if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting new subject ID and subject token.", buf, 2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FE40 != -1)
                dispatch_once(&qword_10229FE40, &stru_1021D8030);
              LOWORD(v54) = 0;
              LODWORD(v50) = 2;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "Setting new subject ID and subject token.", &v54, v50);
              v49 = (uint8_t *)v48;
              sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v48);
              if (v49 != buf)
                free(v49);
            }
            -[CLWorkoutRecorderPublisher setSubjectUUID:](self, "setSubjectUUID:", v12);
            -[CLWorkoutRecorderPublisher setSubjectToken:](self, "setSubjectToken:", v14);
            -[CLTimer invalidate](self->_registrationTimer, "invalidate");

            self->_registrationTimer = 0;
            if (qword_10229FE40 != -1)
              dispatch_once(&qword_10229FE40, &stru_1021D8030);
            v16 = qword_10229FE48;
            if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Successfully registered device.", buf, 2u);
            }
            if (!sub_1001BFF7C(115, 2))
              goto LABEL_59;
            bzero(buf, 0x65CuLL);
            if (qword_10229FE40 != -1)
              dispatch_once(&qword_10229FE40, &stru_1021D8030);
            LOWORD(v54) = 0;
            LODWORD(v50) = 2;
            v17 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 2, "Successfully registered device.", &v54, v50);
            v19 = v18;
            sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v17);
            goto LABEL_94;
          }
        }
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v35 = qword_10229FE48;
        if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Got invalid response from server on registration. subjectId or token nil.", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 0))
          goto LABEL_59;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        LOWORD(v54) = 0;
        LODWORD(v50) = 2;
        v34 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Got invalid response from server on registration. subjectId or token nil.", &v54, v50);
LABEL_93:
        v19 = v33;
        sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v34);
LABEL_94:
        if (v19 != buf)
          free(v19);
        goto LABEL_59;
      }
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v26 = qword_10229FE48;
      if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v51;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to parse response for register subject, error: %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v54 = 138412290;
        v55 = v51;
        LODWORD(v50) = 12;
        v28 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Unable to parse response for register subject, error: %@", &v54, v50);
LABEL_76:
        v38 = v27;
        sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher URLSession:downloadTask:didFinishDownloadingToURL:]", "%s\n", v28);
LABEL_84:
        if (v38 != buf)
          free(v38);
      }
    }
    else
    {
      if (!objc_msgSend(v53, "isEqualToString:", CFSTR("configuration")))
      {
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v29 = qword_10229FE48;
        if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
        {
          v30 = objc_msgSend(a4, "taskDescription");
          *(_DWORD *)buf = 138543362;
          v61 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Received callback for unexpected download task: %{public}@", buf, 0xCu);
        }
        if (!sub_1001BFF7C(115, 0))
          goto LABEL_59;
        bzero(buf, 0x65CuLL);
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v31 = qword_10229FE48;
        v32 = objc_msgSend(a4, "taskDescription");
        v54 = 138543362;
        v55 = v32;
        LODWORD(v50) = 12;
        v34 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v31, 16, "Received callback for unexpected download task: %{public}@", &v54, v50);
        goto LABEL_93;
      }
      v24 = +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a5);
      if (v24)
      {
        v51 = 0;
        v25 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v24, 1, &v51);
        if (v25 && !v51)
        {
          -[CLWorkoutRecorderPublisherDelegate handleResponse:](self->_delegate, "handleResponse:", v25);
LABEL_59:
          -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", a5, 0);
          return;
        }
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v37 = qword_10229FE48;
        if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v51;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Unable to parse response for configuration request, error: %@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE40 != -1)
            dispatch_once(&qword_10229FE40, &stru_1021D8030);
          v54 = 138412290;
          v55 = v51;
          LODWORD(v50) = 12;
          v28 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Unable to parse response for configuration request, error: %@", &v54, v50);
          goto LABEL_76;
        }
      }
      else
      {
        if (qword_10229FE40 != -1)
          dispatch_once(&qword_10229FE40, &stru_1021D8030);
        v36 = qword_10229FE48;
        if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Data from URL is nil, cannot serialize", buf, 2u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE40 != -1)
            dispatch_once(&qword_10229FE40, &stru_1021D8030);
          LOWORD(v54) = 0;
          LODWORD(v50) = 2;
          v28 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 16, "Data from URL is nil, cannot serialize", &v54, v50);
          goto LABEL_76;
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;

  v8 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier", a3)));
  if (!v8)
  {
    v8 = objc_alloc_init((Class)NSMutableData);
    -[NSMutableDictionary setObject:forKey:](self->_responses, "setObject:forKey:", v8, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));

  }
  objc_msgSend(v8, "appendData:", a5);
}

- (void)handleRegistrationResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6
{
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  if (!sub_1018E003C(a5))
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v9 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registration request sent to non default endpoint", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "Registration request sent to non default endpoint", &v20, 2);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher handleRegistrationResponse:data:url:didCompleteWithError:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
  if (a6 || (uint64_t)objc_msgSend(a3, "statusCode") < 200 || (uint64_t)objc_msgSend(a3, "statusCode") >= 300)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a4, 4);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v11 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(a3, "statusCode");
      *(_DWORD *)buf = 134349570;
      v27 = v12;
      v28 = 2114;
      v29 = a6;
      v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to register subject, statusCode: %{public}ld, error: %{public}@, response: %{public}@", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v13 = qword_10229FE48;
      v14 = objc_msgSend(a3, "statusCode");
      v20 = 134349570;
      v21 = v14;
      v22 = 2114;
      v23 = a6;
      v24 = 2114;
      v25 = v10;
      LODWORD(v19) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 16, "Unable to register subject, statusCode: %{public}ld, error: %{public}@, response: %{public}@", &v20, v19);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleRegistrationResponse:data:url:didCompleteWithError:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }

  }
}

- (void)handleConfigurationResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6
{
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  if (!sub_1018E003C(a5))
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v9 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuration request sent to non default endpoint", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE48, 0, "Configuration request sent to non default endpoint", &v20, 2);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher handleConfigurationResponse:data:url:didCompleteWithError:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
  if (a6 || (uint64_t)objc_msgSend(a3, "statusCode") < 200 || (uint64_t)objc_msgSend(a3, "statusCode") >= 300)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a4, 4);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v11 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(a3, "statusCode");
      *(_DWORD *)buf = 134349570;
      v27 = v12;
      v28 = 2114;
      v29 = a6;
      v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to get configuration, statusCode: %{public}ld, error: %{public}@, response: %{public}@", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v13 = qword_10229FE48;
      v14 = objc_msgSend(a3, "statusCode");
      v20 = 134349570;
      v21 = v14;
      v22 = 2114;
      v23 = a6;
      v24 = 2114;
      v25 = v10;
      LODWORD(v19) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 16, "Unable to get configuration, statusCode: %{public}ld, error: %{public}@, response: %{public}@", &v20, v19);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleConfigurationResponse:data:url:didCompleteWithError:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }

  }
}

- (void)handleIngestResponse:(id)a3 data:(id)a4 url:(id)a5 didCompleteWithError:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;

  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a4, 4);
  v28 = 0;
  if (!-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(a5, "path"), &v28))
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v10 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(a5, "path");
      *(_DWORD *)buf = 138543618;
      v38 = v11;
      v39 = 2114;
      v40 = v28;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to remove file: %{public}@, error: %{public}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE40 != -1)
        dispatch_once(&qword_10229FE40, &stru_1021D8030);
      v23 = qword_10229FE48;
      v24 = objc_msgSend(a5, "path");
      v29 = 138543618;
      v30 = v24;
      v31 = 2114;
      v32 = v28;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 16, "Unable to remove file: %{public}@, error: %{public}@", &v29, 22);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
  }
  if (!a6 && (uint64_t)objc_msgSend(a3, "statusCode") >= 200 && (uint64_t)objc_msgSend(a3, "statusCode") <= 299)
  {
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v12 = qword_10229FE48;
    if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(a5, "path");
      *(_DWORD *)buf = 138412546;
      v38 = v13;
      v39 = 2112;
      v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully uploaded file: %@, response: %@", buf, 0x16u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_24;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v14 = qword_10229FE48;
    v15 = objc_msgSend(a5, "path");
    v29 = 138412546;
    v30 = v15;
    v31 = 2112;
    v32 = v9;
    LODWORD(v27) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 0, "Successfully uploaded file: %@, response: %@", &v29, v27);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:]", "%s\n", v16);
    if (v17 == buf)
      goto LABEL_24;
LABEL_28:
    free(v17);
    goto LABEL_24;
  }
  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v18 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend(a5, "path");
    *(_DWORD *)buf = 138544130;
    v38 = v19;
    v39 = 2114;
    v40 = a6;
    v41 = 2114;
    v42 = a3;
    v43 = 2114;
    v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error when uploading file, file: %{public}@, error: %{public}@, response: %{public}@, responseBody: %{public}@", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v20 = qword_10229FE48;
    v21 = objc_msgSend(a5, "path");
    v29 = 138544130;
    v30 = v21;
    v31 = 2114;
    v32 = a6;
    v33 = 2114;
    v34 = a3;
    v35 = 2114;
    v36 = v9;
    LODWORD(v27) = 42;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 16, "Error when uploading file, file: %{public}@, error: %{public}@, response: %{public}@, responseBody: %{public}@", &v29, v27);
    v17 = (uint8_t *)v22;
    sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:]", "%s\n", v22);
    if (v17 != buf)
      goto LABEL_28;
  }
LABEL_24:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  _BYTE v15[12];
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  _BYTE buf[12];
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  objc_sync_enter(self);
  if (qword_10229FE40 != -1)
    dispatch_once(&qword_10229FE40, &stru_1021D8030);
  v9 = qword_10229FE48;
  if (os_log_type_enabled((os_log_t)qword_10229FE48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = a4;
    v23 = 2112;
    v24 = objc_msgSend(a4, "description");
    v25 = 2112;
    v26 = a5;
    v27 = 2112;
    v28 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Request completed with task: %@ and description: %@ and error: %@ and id: %@", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE40 != -1)
      dispatch_once(&qword_10229FE40, &stru_1021D8030);
    v12 = qword_10229FE48;
    *(_DWORD *)v15 = 138413058;
    *(_QWORD *)&v15[4] = a4;
    v16 = 2112;
    v17 = objc_msgSend(a4, "description");
    v18 = 2112;
    v19 = a5;
    v20 = 2112;
    v21 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "Request completed with task: %@ and description: %@ and error: %@ and id: %@", v15, 42);
    v14 = (char *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecorderPublisher URLSession:task:didCompleteWithError:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  if (objc_msgSend(a4, "state") == (id)3)
  {
    v10 = -[NSMutableDictionary objectForKey:](self->_responses, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));
    -[NSMutableDictionary removeObjectForKey:](self->_responses, "removeObjectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier")));
    *(_QWORD *)buf = 0;
    *(_QWORD *)v15 = 0;
    sub_1018DE2CC(objc_msgSend(a4, "taskDescription"), buf, (NSURL **)v15);
    v11 = objc_msgSend(a4, "response");
    if (objc_msgSend(*(id *)buf, "isEqualToString:", CFSTR("ingest")))
    {
      -[CLWorkoutRecorderPublisher handleIngestResponse:data:url:didCompleteWithError:](self, "handleIngestResponse:data:url:didCompleteWithError:", v11, v10, *(_QWORD *)v15, a5);
    }
    else if (objc_msgSend(*(id *)buf, "isEqualToString:", CFSTR("registration")))
    {
      -[CLWorkoutRecorderPublisher handleRegistrationResponse:data:url:didCompleteWithError:](self, "handleRegistrationResponse:data:url:didCompleteWithError:", v11, v10, *(_QWORD *)v15, a5);
    }
    else if (objc_msgSend(*(id *)buf, "isEqualToString:", CFSTR("configuration")))
    {
      -[CLWorkoutRecorderPublisher handleConfigurationResponse:data:url:didCompleteWithError:](self, "handleConfigurationResponse:data:url:didCompleteWithError:", v11, v10, *(_QWORD *)v15, a5);
    }

  }
  objc_sync_exit(self);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  +[CLCertificatePinningHelper URLSession:didReceiveChallenge:completionHandler:](CLCertificatePinningHelper, "URLSession:didReceiveChallenge:completionHandler:", a3, a4, a5);
}

- (void)setHealthWrapConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isAutoRegistration
{
  return self->_autoRegistration;
}

- (void)setAutoRegistration:(BOOL)a3
{
  self->_autoRegistration = a3;
}

@end
