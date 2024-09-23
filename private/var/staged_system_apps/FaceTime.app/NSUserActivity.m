@implementation NSUserActivity

- (NSString)callProviderIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity userInfo](self, "userInfo"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", TUCallUserActivityProviderIdentifierKey));
    v5 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = objc_msgSend(v4, "copy");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (int)callService
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity userInfo](self, "userInfo"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TUCallUserActivityServiceKey")));
    v5 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = objc_msgSend(v4, "intValue");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TUHandle)handle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity userInfo](self, "userInfo"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", TUCallUserActivityHandleKey));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDictionaryRepresentation:](TUHandle, "handleWithDictionaryRepresentation:", v4));
      if (v5)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      v6 = sub_10000E6C4();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User activity is missing the required key TUCallUserActivityHandleKey.", buf, 2u);
      }

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", TUCallUserActivityDestinationIDKey));
    if (v8)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v8));
    }
    else
    {
      v9 = sub_10000E6C4();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User activity is missing the required key TUCallUserActivityDestinationIDKey.", v12, 2u);
      }

      v5 = 0;
    }

    goto LABEL_15;
  }
  v5 = 0;
LABEL_16:

  return (TUHandle *)v5;
}

@end
