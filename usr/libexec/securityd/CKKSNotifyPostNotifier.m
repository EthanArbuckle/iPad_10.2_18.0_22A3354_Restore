@implementation CKKSNotifyPostNotifier

+ (void)post:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    v4 = sub_10000BDF4(CFSTR("ckks"), 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "posting notification %@", (uint8_t *)&v6, 0xCu);
    }

    notify_post((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }

}

@end
