@implementation CLNotifierClientAdapter

- (void)invalidate
{
  -[CLNotifierClientAdapter setValid:](self, "setValid:", 0);
  self->_client = 0;
}

- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3
{
  CLNotifierClientAdapter *v4;
  CLNotifierClientAdapter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLNotifierClientAdapter;
  v4 = -[CLNotifierClientAdapter init](&v7, "init");
  v5 = v4;
  if (v4)
    v4->_client = a3;
  -[CLNotifierClientAdapter setValid:](v4, "setValid:", 1);
  return v5;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  CLNotifierClientBase *client;

  client = self->_client;
  if (!client)
    sub_1019506E8();
  (*((void (**)(CLNotifierClientBase *, _QWORD, id))client->var0 + 2))(client, *(_QWORD *)&a3, a4);
}

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

- (CLNotifierClientAdapter)init
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

  if (qword_1022A0220 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1022A0228;
    if (os_log_type_enabled((os_log_t)qword_1022A0228, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A0220 != -1)
        dispatch_once(&qword_1022A0220, &stru_1021B29B0);
    }
    v3 = qword_1022A0228;
    if (os_signpost_enabled((os_log_t)qword_1022A0228))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A0220 != -1)
        dispatch_once(&qword_1022A0220, &stru_1021B29B0);
    }
    v4 = qword_1022A0228;
    if (os_log_type_enabled((os_log_t)qword_1022A0228, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Shared/Utilities/CLNotifierClientAdapter.mm", 25, "-[CLNotifierClientAdapter init]");
LABEL_11:
    dispatch_once(&qword_1022A0220, &stru_1021B29B0);
  }
}

- (NSString)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNotifierClientAdapter;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nCLNotifierClientBase: %p"), -[CLNotifierClientAdapter debugDescription](&v3, "debugDescription"), self->_client);
}

@end
