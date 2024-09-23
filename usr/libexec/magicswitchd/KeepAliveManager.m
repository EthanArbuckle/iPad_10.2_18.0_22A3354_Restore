@implementation KeepAliveManager

+ (void)createMagicSwitchPathFile
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  if (qword_100021A20 != 2)
  {
    if (!qword_100021A28)
    {
      v2 = os_transaction_create("com.apple.magicswitchd.KeepAlive", a2);
      v3 = (void *)qword_100021A28;
      qword_100021A28 = v2;

    }
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Creating KeepAlive file", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v11 = 0;
    v6 = objc_msgSend(v5, "writeToFile:options:error:", CFSTR("/var/mobile/Library/DeviceRegistry/MagicSwitchKeepAlive"), 268435457, &v11);
    v7 = v11;

    if ((v6 & 1) != 0)
      goto LABEL_9;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if ((objc_msgSend(v8, "isEqualToString:", NSCocoaErrorDomain) & 1) != 0)
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == (id)516)
      {
LABEL_9:
        qword_100021A20 = 2;
LABEL_13:

        return;
      }
    }
    else
    {

    }
    v10 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Failed to create KeepAlive file with error: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
}

+ (void)deleteMagicSwitchPathFile
{
  void *v2;
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_100021A20 != 1)
  {
    v2 = (void *)qword_100021A28;
    if (qword_100021A28)
    {
      qword_100021A28 = 0;

    }
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Deleting KeepAlive file", buf, 2u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/DeviceRegistry/MagicSwitchKeepAlive"), &v10);
    v6 = v10;

    if ((v5 & 1) != 0)
      goto LABEL_9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if ((objc_msgSend(v7, "isEqualToString:", NSCocoaErrorDomain) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == (id)4)
      {
LABEL_9:
        qword_100021A20 = 1;
LABEL_13:

        return;
      }
    }
    else
    {

    }
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Failed to delete KeepAlive file with error: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
}

@end
