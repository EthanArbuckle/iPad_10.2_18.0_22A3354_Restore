@implementation _DASConfig

+ (BOOL)isInternalBuild
{
  return byte_1001ABCD0;
}

+ (BOOL)isiPhone
{
  if (qword_1001ABCF8 != -1)
    dispatch_once(&qword_1001ABCF8, &stru_10015F9D0);
  return byte_1001ABCF0;
}

+ (void)initialize
{
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[5];

  v3 = objc_autoreleasePoolPush();
  byte_1001ABCD0 = os_variant_has_internal_content("com.apple.dasd");
  global_queue = dispatch_get_global_queue(-32768, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  v7 = (void *)qword_1001ABCD8;
  qword_1001ABCD8 = (uint64_t)v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A6138;
  handler[3] = &unk_10015D3A8;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001ABCD8, handler);
  v8 = qword_1001ABCD8;
  v9 = dispatch_walltime(0, 43200000000000);
  dispatch_source_set_timer(v8, v9, 0x274A48A78000uLL, 0xD18C2E2800uLL);
  dispatch_activate((dispatch_object_t)qword_1001ABCD8);
  byte_1001ABCE0 = objc_msgSend((id)objc_opt_class(a1), "computeHasDeviceRecentlyUpdated");
  objc_autoreleasePoolPop(v3);
}

+ (BOOL)hasRecentlyUpdated
{
  return byte_1001ABCE0;
}

+ (BOOL)computeHasDeviceRecentlyUpdated
{
  BOOL v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  uint64_t v13;
  void *v14;

  v13 = 0;
  v14 = 0;
  if (sysctlbyname_get_data_np("kern.osversion", &v14, &v13))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
  free(v14);
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("savedBuildVersion")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v5
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") - 1)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", (char *)objc_msgSend(v5, "length") - 1)),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    objc_msgSend(v4, "doubleForKey:", CFSTR("savedBuildDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v10);
    v2 = v11 < 604800.0;

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("savedBuildVersion"));
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "setDouble:forKey:", CFSTR("savedBuildDate"));
    v2 = 1;
  }

  return v2;
}

+ (BOOL)isAudioAccessory
{
  return 0;
}

+ (BOOL)isiPad
{
  if (qword_1001ABCE8 != -1)
    dispatch_once(&qword_1001ABCE8, &stru_10015F9B0);
  return byte_1001ABCE1;
}

+ (BOOL)requiresStrictDarkBoot
{
  if (qword_1001ABD08 != -1)
    dispatch_once(&qword_1001ABD08, &stru_10015F9F0);
  return byte_1001ABD00;
}

@end
