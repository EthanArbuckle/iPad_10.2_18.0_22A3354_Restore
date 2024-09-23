@implementation UMMobileKeyBagProvider

- (int)createPersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 passcode:(id)a5 homeDir:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  int PersonaKeyForUser;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  char *v17;
  uint64_t v19;
  int v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a6;
  PersonaKeyForUser = MKBUserSessionCreatePersonaKeyForUser(0, v8, a5, v9, v10);
  if (PersonaKeyForUser)
  {
    if (qword_1000E0210 != -1)
      dispatch_once(&qword_1000E0210, &stru_1000D1CB0);
    v12 = (id)qword_1000E0208;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = 0;
      v13 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v20 = 67109890;
        v21 = v8;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v10;
        v26 = 1024;
        v27 = PersonaKeyForUser;
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_1000E0210 != -1)
      dispatch_once(&qword_1000E0210, &stru_1000D1CB0);
    v12 = (id)qword_1000E0208;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v19 = 0;
      v15 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        v14 = v15;
      else
        v14 = v15 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v20 = 67109634;
        v21 = v8;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v10;
LABEL_18:
        v16 = (const char *)_os_log_send_and_compose_impl(v14, &v19, 0, 0);
        v17 = (char *)v16;
        if (v16)
          sub_100007780(v16);
        goto LABEL_21;
      }
LABEL_20:
      v17 = 0;
LABEL_21:
      free(v17);
    }
  }

  return PersonaKeyForUser;
}

- (int)removePersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 volumeUUID:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  char *v17;
  uint64_t v19;
  int v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  const __CFString *v28;
  id v29;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v28 = CFSTR("MKBUserSessionVolumeUUID");
    v29 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  }
  else
  {
    v10 = 0;
  }
  v11 = MKBUserSessionRemovePersonaKeyForUser(v10, v6, v7);
  if (v11)
  {
    if (qword_1000E0210 != -1)
      dispatch_once(&qword_1000E0210, &stru_1000D1CB0);
    v12 = (id)qword_1000E0208;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = 0;
      v13 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v20 = 67109890;
        v21 = v6;
        v22 = 2114;
        v23 = v7;
        v24 = 2114;
        v25 = v9;
        v26 = 1024;
        v27 = v11;
        goto LABEL_21;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1000E0210 != -1)
      dispatch_once(&qword_1000E0210, &stru_1000D1CB0);
    v12 = (id)qword_1000E0208;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v19 = 0;
      v15 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        v14 = v15;
      else
        v14 = v15 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v20 = 67109634;
        v21 = v6;
        v22 = 2114;
        v23 = v7;
        v24 = 2114;
        v25 = v9;
LABEL_21:
        v16 = (const char *)_os_log_send_and_compose_impl(v14, &v19, 0, 0);
        v17 = (char *)v16;
        if (v16)
          sub_100007780(v16);
        goto LABEL_24;
      }
LABEL_23:
      v17 = 0;
LABEL_24:
      free(v17);
    }
  }

  return v11;
}

- (int)setVolumePath:(id)a3 forPersona:(id)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  const char *v12;
  char *v13;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;

  v5 = a3;
  v6 = a4;
  v7 = MKBUserSessionSetVolumeToPersona(v5, v6);
  if (v7)
  {
    if (qword_1000E0210 != -1)
      dispatch_once(&qword_1000E0210, &stru_1000D1CB0);
    v8 = (id)qword_1000E0208;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 0;
      v9 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v16 = 138543874;
        v17 = v5;
        v18 = 2114;
        v19 = v6;
        v20 = 1024;
        v21 = v7;
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_1000E0210 != -1)
      dispatch_once(&qword_1000E0210, &stru_1000D1CB0);
    v8 = (id)qword_1000E0208;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = 0;
      v11 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        v10 = v11;
      else
        v10 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v16 = 138543618;
        v17 = v5;
        v18 = 2114;
        v19 = v6;
LABEL_18:
        v12 = (const char *)_os_log_send_and_compose_impl(v10, &v15, 0, 0);
        v13 = (char *)v12;
        if (v12)
          sub_100007780(v12);
        goto LABEL_21;
      }
LABEL_20:
      v13 = 0;
LABEL_21:
      free(v13);
    }
  }

  return v7;
}

@end
