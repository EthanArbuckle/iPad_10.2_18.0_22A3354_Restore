@implementation MSDPlatform

+ (id)sharedInstance
{
  if (qword_100053D90 != -1)
    dispatch_once(&qword_100053D90, &stru_100048C78);
  return (id)qword_100053D88;
}

+ (BOOL)iOSHub
{
  if (qword_100053DA0 != -1)
    dispatch_once(&qword_100053DA0, &stru_100048C98);
  return byte_100053D98;
}

- (MSDPlatform)init
{
  MSDPlatform *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;

  v10.receiver = self;
  v10.super_class = (Class)MSDPlatform;
  v2 = -[MSDPlatform init](&v10, "init");
  if (!v2)
    return v2;
  v3 = (void *)MGCopyAnswer(CFSTR("ProductName"), 0);
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Watch OS")))
    {
      -[MSDPlatform setWatchOS:](v2, "setWatchOS:", 1);
      v5 = CFSTR("watchOS");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Apple TVOS")))
    {
      -[MSDPlatform setTvOS:](v2, "setTvOS:", 1);
      v5 = CFSTR("tvOS");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("iPhone OS")))
    {
      -[MSDPlatform setIOS:](v2, "setIOS:", 1);
      v5 = CFSTR("iOS");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("macOS")) & 1) != 0
           || objc_msgSend(v4, "isEqualToString:", CFSTR("Mac OS X")))
    {
      -[MSDPlatform setMacOS:](v2, "setMacOS:", 1);
      v5 = CFSTR("macOS");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("xrOS")))
        goto LABEL_13;
      -[MSDPlatform setIOS:](v2, "setIOS:", 1);
      -[MSDPlatform setROS:](v2, "setROS:", 1);
      v5 = CFSTR("xrOS");
    }
    -[MSDPlatform setPlatformType:](v2, "setPlatformType:", v5);
  }
LABEL_13:
  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPlatform platformType](v2, "platformType"));
    *(_DWORD *)buf = 136315394;
    v12 = "-[MSDPlatform init]";
    v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: PlatformType '%{public}@'.", buf, 0x16u);

  }
  return v2;
}

- (void)setPlatformWithManifestProductList:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v10 = a3;
  if (-[MSDPlatform tvOS](self, "tvOS") || -[MSDPlatform watchOS](self, "watchOS"))
    goto LABEL_15;
  -[MSDPlatform setWatchOS:](self, "setWatchOS:", 0);
  -[MSDPlatform setTvOS:](self, "setTvOS:", 0);
  -[MSDPlatform setIOS:](self, "setIOS:", 0);
  -[MSDPlatform setMacOS:](self, "setMacOS:", 0);
  -[MSDPlatform setROS:](self, "setROS:", 0);
  if (!objc_msgSend(v10, "count"))
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:](self, "raiseInvalidProductListExceptionWithReason:", CFSTR("Empty product list."));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  v5 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0)
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:](self, "raiseInvalidProductListExceptionWithReason:", CFSTR("Product list entry must be of type String."));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));

  if ((objc_msgSend(v8, "containsString:", CFSTR("iphone")) & 1) != 0
    || (objc_msgSend(v8, "containsString:", CFSTR("ipad")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ipod")))
  {
    -[MSDPlatform setIOS:](self, "setIOS:", 1);
    v9 = CFSTR("iOS");
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("watch")))
  {
    -[MSDPlatform setWatchOS:](self, "setWatchOS:", 1);
    v9 = CFSTR("watchOS");
  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("appletv")))
  {
    -[MSDPlatform setTvOS:](self, "setTvOS:", 1);
    v9 = CFSTR("tvOS");
  }
  else if ((objc_msgSend(v8, "containsString:", CFSTR("mac")) & 1) != 0
         || objc_msgSend(v8, "containsString:", CFSTR("adp")))
  {
    -[MSDPlatform setMacOS:](self, "setMacOS:", 1);
    v9 = CFSTR("macOS");
  }
  else
  {
    if (!objc_msgSend(v8, "containsString:", CFSTR("realitydevice")))
      goto LABEL_12;
    -[MSDPlatform setROS:](self, "setROS:", 1);
    v9 = CFSTR("xrOS");
  }
  -[MSDPlatform setPlatformType:](self, "setPlatformType:", v9);
LABEL_12:
  if (!-[MSDPlatform isValidProductList:](self, "isValidProductList:", v10))
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:](self, "raiseInvalidProductListExceptionWithReason:", CFSTR("Product list should contain only one product category."));

LABEL_15:
}

- (BOOL)isValidProductList:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
          goto LABEL_24;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString", (_QWORD)v14));
        if (-[MSDPlatform watchOS](self, "watchOS")
          && !objc_msgSend(v11, "containsString:", CFSTR("watch"))
          || -[MSDPlatform tvOS](self, "tvOS") && !objc_msgSend(v11, "containsString:", CFSTR("appletv"))
          || -[MSDPlatform iOS](self, "iOS")
          && (objc_msgSend(v11, "containsString:", CFSTR("iphone")) & 1) == 0
          && (objc_msgSend(v11, "containsString:", CFSTR("ipad")) & 1) == 0
          && !objc_msgSend(v11, "containsString:", CFSTR("ipod"))
          || -[MSDPlatform macOS](self, "macOS")
          && (objc_msgSend(v11, "containsString:", CFSTR("mac")) & 1) == 0
          && !objc_msgSend(v11, "containsString:", CFSTR("adp"))
          || -[MSDPlatform rOS](self, "rOS")
          && !objc_msgSend(v11, "containsString:", CFSTR("realitydevice")))
        {

LABEL_24:
          v12 = 0;
          goto LABEL_26;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_26:

  return v12;
}

- (void)raiseInvalidProductListExceptionWithReason:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("InvalidManifestProductList"), a3, 0));
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[MSDPlatform raiseInvalidProductListExceptionWithReason:]";
    v8 = 2114;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - Exception:  %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(v3, "raise");
}

- (BOOL)watchOS
{
  return self->_watchOS;
}

- (void)setWatchOS:(BOOL)a3
{
  self->_watchOS = a3;
}

- (BOOL)tvOS
{
  return self->_tvOS;
}

- (void)setTvOS:(BOOL)a3
{
  self->_tvOS = a3;
}

- (BOOL)iOS
{
  return self->_iOS;
}

- (void)setIOS:(BOOL)a3
{
  self->_iOS = a3;
}

- (BOOL)macOS
{
  return self->_macOS;
}

- (void)setMacOS:(BOOL)a3
{
  self->_macOS = a3;
}

- (BOOL)rOS
{
  return self->_rOS;
}

- (void)setROS:(BOOL)a3
{
  self->_rOS = a3;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (void)setPlatformType:(id)a3
{
  objc_storeStrong((id *)&self->_platformType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformType, 0);
}

@end
