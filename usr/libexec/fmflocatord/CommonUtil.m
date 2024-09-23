@implementation CommonUtil

+ (id)stringForFourCC:(unsigned int)a3
{
  _BYTE v4[2];
  __int16 v5;
  char v6;

  v5 = bswap32(a3) >> 16;
  v4[1] = BYTE2(a3);
  v4[0] = HIBYTE(a3);
  v6 = 0;
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 4));
}

+ (id)stringForLocationType:(int)a3
{
  int v4;
  id v5;
  NSObject *v6;

  v4 = a3 - 1;
  if ((a3 - 1) < 0xA && ((0x3EFu >> v4) & 1) != 0)
    return *(&off_100055B78 + v4);
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10003498C(a3, v6);

  return CFSTR("Unknown");
}

+ (void)handleAlertAction:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v3 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sensitive")));

    v5 = objc_msgSend(v4, "BOOLValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "openSensitiveURL:withOptions:", v8, 0);
    else
      objc_msgSend(v6, "openURL:configuration:completionHandler:", v8, 0, 0);

  }
}

+ (id)userInfoFrom:(id)a3
{
  xpc_object_t value;
  void *v4;
  void *v5;
  void *v6;

  value = xpc_dictionary_get_value(a3, "UserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v5);
  else
    v6 = 0;

  return v6;
}

@end
