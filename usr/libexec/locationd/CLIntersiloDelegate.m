@implementation CLIntersiloDelegate

- (BOOL)valid
{
  return 1;
}

- (void)setValid:(BOOL)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;

  if (qword_1022A01D0 != -1)
    goto LABEL_11;
  while (1)
  {
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "false";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"This delegate cannot be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
    }
    v4 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "false";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "This delegate cannot be invalidated", "{\"msg%{public}.0s\":\"This delegate cannot be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
    }
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "false";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"This delegate cannot be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLInternalService.mm", 173, "-[CLIntersiloDelegate setValid:]");
LABEL_11:
    dispatch_once(&qword_1022A01D0, &stru_1021D69F0);
  }
}

@end
