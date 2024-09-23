@implementation UMDPersonaManifestEmbedded

+ (unsigned)currentVersion
{
  return 1;
}

+ (id)manifest
{
  id v3;

  v3 = objc_alloc_init((Class)a1);
  objc_msgSend(v3, "setVersion:", objc_msgSend(a1, "currentVersion"));
  return v3;
}

+ (id)manifestFromData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  UMDPersonaManifestEmbedded *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v26;
  int v27;
  unsigned int v28;

  v4 = a3;
  v5 = sub_100088A58((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v6)
  {
    if (qword_1000E0110 != -1)
      dispatch_once(&qword_1000E0110, &stru_1000D1730);
    v8 = (id)qword_1000E0108;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v26 = 0;
      v13 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        LOWORD(v27) = 0;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v26, 0, 0);
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
    goto LABEL_41;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UsePersonaManifestVersion")));
  if (v8)
  {
    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      if (qword_1000E0110 != -1)
        dispatch_once(&qword_1000E0110, &stru_1000D1730);
      v17 = (id)qword_1000E0108;
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      v26 = 0;
      v18 = sub_100007750(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        v19 = v18;
      else
        v19 = v18 & 0xFFFFFFFE;
      if ((_DWORD)v19)
      {
        LOWORD(v27) = 0;
        v20 = (void *)_os_log_send_and_compose_impl(v19, &v26, 0, 0);
        if (!v20)
          goto LABEL_39;
        goto LABEL_35;
      }
LABEL_38:
      v20 = 0;
      goto LABEL_39;
    }
  }
  v10 = -[NSObject unsignedIntValue](v8, "unsignedIntValue");
  if (v10 == 1)
  {
    v21 = sub_10005B63C((uint64_t)a1, v7);
    v12 = objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_26;
  }
  if (v10)
  {
    if (qword_1000E0110 != -1)
      dispatch_once(&qword_1000E0110, &stru_1000D1730);
    v17 = (id)qword_1000E0108;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    v26 = 0;
    LODWORD(v23) = sub_100007750(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v23 = v23;
    else
      v23 = v23 & 0xFFFFFFFE;
    if ((_DWORD)v23)
    {
      v24 = v17;
      v27 = 67109120;
      v28 = -[NSObject unsignedIntValue](v8, "unsignedIntValue");
      v20 = (void *)_os_log_send_and_compose_impl(v23, &v26, 0, 0);

      if (!v20)
      {
LABEL_39:
        free(v20);
LABEL_40:

LABEL_41:
        v22 = 0;
        goto LABEL_42;
      }
LABEL_35:
      sub_100007780((const char *)v20);
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  v11 = sub_10005B2EC((uint64_t)a1, v4);
  v12 = objc_claimAutoreleasedReturnValue(v11);
LABEL_26:
  v22 = (void *)v12;
LABEL_42:

  return v22;
}

- (id)dataValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  char *v13;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_1000D5420, CFSTR("UsePersonaManifestVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[UMDPersonaManifest generation](self, "generation")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("UsePersonaGenerationID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UMDPersonaManifest users](self, "users"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMDPersonaManifest dictForUserSet:](UMDPersonaManifest, "dictForUserSet:", v5));

  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("UserPersonaDictionary"));
    v7 = sub_100088760((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    if (qword_1000E0110 != -1)
      dispatch_once(&qword_1000E0110, &stru_1000D1730);
    v9 = (id)qword_1000E0108;
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

    v8 = 0;
  }

  return v8;
}

@end
