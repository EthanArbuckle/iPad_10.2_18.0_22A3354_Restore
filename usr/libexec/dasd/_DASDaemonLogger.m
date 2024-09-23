@implementation _DASDaemonLogger

+ (id)defaultCategory
{
  return (id)qword_1001ABD30;
}

+ (id)logForCategory:(id)a3
{
  id v3;
  os_log_t v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001ABD50);
  v4 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABD38, "objectForKeyedSubscript:", v3));
  if (!v4)
    v4 = os_log_create("com.apple.duetactivityscheduler", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  objc_msgSend((id)qword_1001ABD38, "setObject:forKeyedSubscript:", v4, v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001ABD50);

  return v4;
}

+ (void)initialize
{
  if (qword_1001ABD28 != -1)
    dispatch_once(&qword_1001ABD28, &stru_10015FFD8);
}

+ (id)signpostForCategory:(id)a3
{
  id v3;
  os_log_t v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001ABD50);
  v4 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABD40, "objectForKeyedSubscript:", v3));
  if (!v4)
    v4 = os_log_create("com.apple.dasd.signpost", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001ABD50);

  return v4;
}

+ (unint64_t)makeIDForString:(id)a3 forLog:(id)a4
{
  id v5;
  os_signpost_id_t v6;
  void *v7;

  v5 = a3;
  v6 = os_signpost_id_generate((os_log_t)a4);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001ABD50);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v6));
  objc_msgSend((id)qword_1001ABD48, "setObject:forKeyedSubscript:", v7, v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001ABD50);
  return v6;
}

+ (unint64_t)removeIDForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001ABD50);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABD48, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedLongLongValue");
    objc_msgSend((id)qword_1001ABD48, "removeObjectForKey:", v3);
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001ABD50);

  return (unint64_t)v6;
}

+ (id)inferCarryStatusXPCCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, 1000);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  return v2;
}

@end
