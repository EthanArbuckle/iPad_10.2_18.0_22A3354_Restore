@implementation MIBUDefaultPreferences

+ (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = a3;
  v6 = a4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056DD0);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "+[MIBUDefaultPreferences setObject:forKey:]";
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - Setting %{public}@ for key %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "setObject:forKey:", v5, v6);
  v9 = objc_msgSend(v8, "synchronize");
  if ((v9 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056DF0);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C600((uint64_t)v5, (uint64_t)v6, v10);
  }

  return v9;
}

+ (id)objectForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  return v5;
}

+ (BOOL)removeObjectForKey:(id)a3
{
  return objc_msgSend(a1, "setObject:forKey:", 0, a3);
}

+ (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryRepresentation"));

  return v3;
}

@end
