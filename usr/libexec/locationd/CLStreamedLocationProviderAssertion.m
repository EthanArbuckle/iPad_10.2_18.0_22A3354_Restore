@implementation CLStreamedLocationProviderAssertion

- (id)initInUniverse:(id)a3
{
  CLStreamedLocationProviderAssertion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLStreamedLocationProviderAssertion;
  v4 = -[CLStreamedLocationProviderAssertion init](&v6, "init");
  if (v4)
  {
    -[CLStreamedLocationProviderAssertion setProxy:](v4, "setProxy:", objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", CFSTR("CLStreamedLocationProvider")));
    -[CLStreamedLocationProviderAssertion takeAssertion](v4, "takeAssertion");
  }
  return v4;
}

- (void)invalidate
{
  -[CLStreamedLocationProviderAssertion releaseAssertion](self, "releaseAssertion");
  -[CLStreamedLocationProviderAssertion setProxy:](self, "setProxy:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[CLStreamedLocationProviderAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationProviderAssertion;
  -[CLStreamedLocationProviderAssertion dealloc](&v3, "dealloc");
}

- (void)takeAssertion
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  if (qword_1022A01E0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
    }
    v3 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Must be overridden", "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
    }
    v4 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Shared/Streaming/CLStreamedLocationProvider.mm", 929, "-[CLStreamedLocationProviderAssertion takeAssertion]");
LABEL_11:
    dispatch_once(&qword_1022A01E0, &stru_10213E450);
  }
}

- (void)releaseAssertion
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  if (qword_1022A01E0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
    }
    v3 = qword_1022A01E8;
    if (os_signpost_enabled((os_log_t)qword_1022A01E8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Must be overridden", "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
    }
    v4 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Shared/Streaming/CLStreamedLocationProvider.mm", 934, "-[CLStreamedLocationProviderAssertion releaseAssertion]");
LABEL_11:
    dispatch_once(&qword_1022A01E0, &stru_10213E450);
  }
}

- (CLStreamedLocationProviderProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
