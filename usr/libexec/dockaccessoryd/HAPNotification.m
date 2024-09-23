@implementation HAPNotification

+ (void)postNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v11 = sub_10007CCE4(0, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = sub_10007CD2C(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16 = 138544130;
    v17 = v14;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@CoreHAP - Sending notification %@ with object %@ and userInfo %@", (uint8_t *)&v16, 0x2Au);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "postNotificationName:object:userInfo:", v7, v8, v9);

}

+ (id)typeToString:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown Reachability Notification type %ld"), a3));
  else
    return off_100236CF8[a3 - 1];
}

@end
