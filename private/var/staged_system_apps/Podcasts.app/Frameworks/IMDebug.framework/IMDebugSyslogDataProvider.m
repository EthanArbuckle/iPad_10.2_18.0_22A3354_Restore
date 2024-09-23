@implementation IMDebugSyslogDataProvider

- (id)debugData
{
  void *v2;
  id v3;
  __asl_object_s *v4;
  __asl_object_s *v5;
  asl_object_t v6;
  __asl_object_s *v7;
  const char *v8;
  double v9;
  const char *v10;
  NSDate *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;

  v2 = (void *)objc_opt_new(NSMutableString, a2);
  +[NSDateFormatter setDefaultFormatterBehavior:](NSDateFormatter, "setDefaultFormatterBehavior:", 1040);
  v3 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v3, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss.SSS"));
  v4 = asl_new(1u);
  v5 = asl_search(0, v4);
  v6 = asl_next(v5);
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = asl_get(v7, "Time");
      v9 = (double)atol(v8);
      v10 = asl_get(v7, "TimeNanoSec");
      v11 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)atol(v10) / 1000000000.0 + v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v12));
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", asl_get(v7, "Message"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v2, "appendString:", v13);
      objc_msgSend(v2, "appendString:", CFSTR(" "));
      objc_msgSend(v2, "appendString:", v15);
      objc_msgSend(v2, "appendString:", CFSTR("\n"));

      v7 = asl_next(v5);
    }
    while (v7);
  }
  asl_release(v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataUsingEncoding:", 4));

  return v16;
}

- (id)debugDataFileName
{
  return CFSTR("syslog.txt");
}

@end
