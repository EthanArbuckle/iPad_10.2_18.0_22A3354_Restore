@implementation UMDarwinDirectoryProvider

- (void)initializeLocalUsersAndGroups:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100087868;
  v4[3] = &unk_1000D1D20;
  v5 = a3;
  v3 = v5;
  DDIInitializeLocalUsersAndGroups(v4);

}

- (BOOL)updateLocalUsersAndGroupsWithError:(id *)a3 updater:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  char *v13;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int v19;
  id v20;

  v5 = a4;
  if (a3)
    *a3 = 0;
  v18 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100087DA0;
  v16[3] = &unk_1000D1D48;
  v6 = v5;
  v17 = v6;
  v7 = DDIUpdateLocalUsersAndGroups(&v18, v16);
  v8 = v18;
  if ((v7 & 1) == 0)
  {
    if (qword_1000E0230 != -1)
      dispatch_once(&qword_1000E0230, &stru_1000D1D68);
    v9 = (id)qword_1000E0228;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 0;
      v10 = sub_100007750(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if ((_DWORD)v11)
      {
        v19 = 138543362;
        v20 = v8;
        v12 = (const char *)_os_log_send_and_compose_impl(v11, &v15, 0, 0);
        v13 = (char *)v12;
        if (v12)
          sub_100007780(v12);
      }
      else
      {
        v13 = 0;
      }
      free(v13);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v7;
}

@end
