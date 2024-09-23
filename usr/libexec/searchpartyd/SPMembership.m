@implementation SPMembership

+ (BOOL)isLocalAccountUUID:(id)a3
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  uuid_t uu;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SPMembership isLocalAccountUUID: %@", buf, 0xCu);
  }
  v15 = 0;
  memset(uu, 0, sizeof(uu));
  v4 = objc_retainAutorelease(v3);
  uuid_parse((const char *)objc_msgSend(v4, "UTF8String"), uu);
  if (mbr_check_membership_by_id(uu, 20, &v15))
  {
    v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5)
      sub_100E16A60(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v4;
      v18 = 1024;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SPMembership isLocalAccountUUID: %@, LocalGroup: staff(20), result: %i", buf, 0x12u);
    }
    v13 = v15 == 1;
  }

  return v13;
}

+ (id)currentMachineUserUUID
{
  uid_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[37];
  uuid_t uu;

  v2 = getuid();
  memset(uu, 0, sizeof(uu));
  if (mbr_uid_to_uuid(v2, uu))
  {
    v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4)
      sub_100E16A98(v4, v5, v6, v7, v8, v9, v10, v11);
    exit(1);
  }
  memset(v12, 0, sizeof(v12));
  uuid_unparse_upper(uu, v12);
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 1));
}

@end
