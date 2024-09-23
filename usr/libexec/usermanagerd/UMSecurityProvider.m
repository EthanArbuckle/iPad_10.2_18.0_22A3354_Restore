@implementation UMSecurityProvider

- (BOOL)deleteKeychainItemsForPersonaWithUUID:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  id v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  _QWORD v18[4];
  id v19;
  __int16 v20;
  uint64_t v21;

  v5 = a3;
  if (qword_1000E0220 != -1)
    dispatch_once(&qword_1000E0220, &stru_1000D1CF8);
  v6 = (id)qword_1000E0218;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v21 = 0;
    v7 = sub_100007750(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      v8 = v7;
    else
      v8 = v7 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v20 = 0;
      v9 = (const char *)_os_log_send_and_compose_impl(v8, &v21, 0, 0);
      v10 = (char *)v9;
      if (v9)
        sub_100007780(v9);
    }
    else
    {
      v10 = 0;
    }
    free(v10);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100087230;
  v18[3] = &unk_1000D1CD8;
  v11 = v5;
  v19 = v11;
  _SecKeychainDeleteMultiUser(v11, v18);
  if (qword_1000E0220 != -1)
    dispatch_once(&qword_1000E0220, &stru_1000D1CF8);
  v12 = (id)qword_1000E0218;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v21 = 0;
    v13 = sub_100007750(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v14 = v13;
    else
      v14 = v13 & 0xFFFFFFFE;
    if ((_DWORD)v14)
    {
      v20 = 0;
      v15 = (const char *)_os_log_send_and_compose_impl(v14, &v21, 0, 0);
      v16 = (char *)v15;
      if (v15)
        sub_100007780(v15);
    }
    else
    {
      v16 = 0;
    }
    free(v16);
  }

  if (a4)
    *a4 = 0;

  return 1;
}

@end
