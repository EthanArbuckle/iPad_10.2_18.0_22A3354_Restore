@implementation UMDPersonaManifest

+ (Class)platformClass
{
  return (Class)objc_opt_class(UMDPersonaManifestEmbedded);
}

+ (unsigned)currentVersion
{
  return objc_msgSend(objc_msgSend(a1, "platformClass"), "currentVersion");
}

+ (id)manifest
{
  return objc_msgSend(objc_msgSend(a1, "platformClass"), "manifest");
}

+ (id)manifestFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "platformClass"), "manifestFromData:", v4));

  return v5;
}

- (UMDPersonaManifest)init
{
  UMDPersonaManifest *v2;
  UMDPersonaManifest *v3;
  uint64_t v4;
  NSSet *users;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UMDPersonaManifest;
  v2 = -[UMDPersonaManifest init](&v7, "init");
  if (!v2)
    sub_1000ACF54();
  v3 = v2;
  v4 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  users = v3->_users;
  v3->_users = (NSSet *)v4;

  return v3;
}

- (NSData)dataValue
{
  NSObject *v2;
  unsigned int v3;
  uint64_t v4;
  const char *v5;
  char *v6;
  uint64_t v8;

  if (qword_1000E0190 != -1)
    dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
  v2 = (id)qword_1000E0188;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v8 = 0;
    v3 = sub_100007750(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      v4 = v3;
    else
      v4 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v4)
    {
      v5 = (const char *)_os_log_send_and_compose_impl(v4, &v8, 0, 0);
      v6 = (char *)v5;
      if (v5)
        sub_100007780(v5);
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  return 0;
}

+ (id)personaSetFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  UMDPersonaManifestPersona *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  unsigned int v30;
  uint64_t v31;
  const char *v32;
  char *v33;
  unsigned int v34;
  uint64_t v35;
  const char *v36;
  char *v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  const char *v47;
  char *v48;
  NSObject *obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[12];
  __int16 v58;
  id v59;

  v3 = sub_100088A58((uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (!v4)
  {
    if (qword_1000E0190 != -1)
      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
    v6 = (id)qword_1000E0188;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)v57 = 0;
      v30 = sub_100007750(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        v31 = v30;
      else
        v31 = v30 & 0xFFFFFFFE;
      if ((_DWORD)v31)
      {
        LOWORD(v55) = 0;
        v32 = (const char *)_os_log_send_and_compose_impl(v31, v57, 0, 0);
        v33 = (char *)v32;
        if (v32)
          sub_100007780(v32);
      }
      else
      {
        v33 = 0;
      }
      free(v33);
    }
    v25 = 0;
    goto LABEL_99;
  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NUMENT")));
  if (!v6 || (v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
  {
    if (qword_1000E0190 != -1)
      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
    v8 = (id)qword_1000E0188;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)v57 = 0;
      v26 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v27 = v26;
      else
        v27 = v26 & 0xFFFFFFFE;
      if ((_DWORD)v27)
      {
        LOWORD(v55) = 0;
        v28 = (const char *)_os_log_send_and_compose_impl(v27, v57, 0, 0);
        v29 = (char *)v28;
        if (v28)
          sub_100007780(v28);
      }
      else
      {
        v29 = 0;
      }
      free(v29);
    }
    v25 = 0;
    goto LABEL_98;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BLOB")));
  if (!v8 || (v9 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    if (qword_1000E0190 != -1)
      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
    v12 = (id)qword_1000E0188;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)v57 = 0;
      v34 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v35 = v34;
      else
        v35 = v34 & 0xFFFFFFFE;
      if ((_DWORD)v35)
      {
        LOWORD(v55) = 0;
        v36 = (const char *)_os_log_send_and_compose_impl(v35, v57, 0, 0);
        v37 = (char *)v36;
        if (v36)
          sub_100007780(v36);
      }
      else
      {
        v37 = 0;
      }
      free(v37);
    }
    v25 = 0;
    goto LABEL_97;
  }
  v10 = sub_100088CD4((uint64_t)v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v11)
  {
    if (qword_1000E0190 != -1)
      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
    v24 = (id)qword_1000E0188;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_95;
    *(_QWORD *)v57 = 0;
    v38 = sub_100007750(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      v39 = v38;
    else
      v39 = v38 & 0xFFFFFFFE;
    if ((_DWORD)v39)
    {
      LOWORD(v55) = 0;
      v40 = (void *)_os_log_send_and_compose_impl(v39, v57, 0, 0);
      if (!v40)
        goto LABEL_73;
      goto LABEL_71;
    }
LABEL_72:
    v40 = 0;
    goto LABEL_73;
  }
  v13 = -[NSObject count](v11, "count");
  if (v13 != -[NSObject unsignedLongValue](v6, "unsignedLongValue"))
  {
    if (qword_1000E0190 != -1)
      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
    v24 = (id)qword_1000E0188;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_95;
    v55 = 0;
    LODWORD(v41) = sub_100007750(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      v41 = v41;
    else
      v41 = v41 & 0xFFFFFFFE;
    if ((_DWORD)v41)
    {
      v42 = v24;
      *(_DWORD *)v57 = 134218240;
      *(_QWORD *)&v57[4] = -[NSObject count](v12, "count");
      v58 = 2048;
      v59 = -[NSObject unsignedLongValue](v6, "unsignedLongValue");
      v40 = (void *)_os_log_send_and_compose_impl(v41, &v55, 0, 0);

      if (!v40)
      {
LABEL_73:
        free(v40);
LABEL_95:
        v25 = 0;
        goto LABEL_96;
      }
LABEL_71:
      sub_100007780((const char *)v40);
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v12;
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (!v15)
    goto LABEL_17;
  v16 = v15;
  v17 = *(_QWORD *)v52;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v52 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
      v20 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
      {
        if (qword_1000E0190 != -1)
          dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
        v24 = v14;
        v43 = (id)qword_1000E0188;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_94;
        *(_QWORD *)v57 = 0;
        v44 = sub_100007750(0);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          v45 = v44;
        else
          v45 = v44 & 0xFFFFFFFE;
        if ((_DWORD)v45)
        {
          LOWORD(v55) = 0;
          goto LABEL_90;
        }
LABEL_92:
        v48 = 0;
LABEL_93:
        free(v48);
LABEL_94:

        goto LABEL_95;
      }
      v21 = sub_100078748((uint64_t)UMDPersonaManifestPersona, v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (!v22)
      {
        if (qword_1000E0190 != -1)
          dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
        v24 = v14;
        v43 = (id)qword_1000E0188;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_94;
        *(_QWORD *)v57 = 0;
        v46 = sub_100007750(0);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          v45 = v46;
        else
          v45 = v46 & 0xFFFFFFFE;
        if ((_DWORD)v45)
        {
          LOWORD(v55) = 0;
LABEL_90:
          v47 = (const char *)_os_log_send_and_compose_impl(v45, v57, 0, 0);
          v48 = (char *)v47;
          if (v47)
            sub_100007780(v47);
          goto LABEL_93;
        }
        goto LABEL_92;
      }
      v23 = (void *)v22;
      -[NSObject addObject:](v14, "addObject:", v22);

    }
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v16)
      continue;
    break;
  }
LABEL_17:

  v24 = v14;
  v25 = v24;
LABEL_96:

LABEL_97:
LABEL_98:

LABEL_99:
  return v25;
}

+ (id)dataForPersonaSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = sub_100078C8C(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v5, "addObject:", v12, (_QWORD)v19);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("NUMENT"));

  v14 = sub_1000888DC((uint64_t)v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("BLOB"));

  v16 = sub_100088760((uint64_t)v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

+ (id)userSetFromDict:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  UMDPersonaManifestUser *v30;
  const char *v31;
  id v32;
  NSObject *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  char *v38;
  unsigned int v40;
  uint64_t v41;
  const char *v42;
  char *v43;
  unsigned int v44;
  uint64_t v45;
  const char *v46;
  char *v47;
  unsigned int v48;
  uint64_t v49;
  const char *v50;
  char *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[12];
  __int16 v68;
  NSObject *v69;
  _BYTE v70[128];
  _BYTE v71[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v64;
    v10 = &AKSGetLastUser_ptr;
    v11 = &AKSGetLastUser_ptr;
    v55 = v6;
    v56 = v5;
    v52 = *(_QWORD *)v64;
    v53 = a1;
LABEL_3:
    v12 = 0;
    v54 = v8;
    while (1)
    {
      if (*(_QWORD *)v64 != v9)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v12);
      v14 = sub_10001ACA4((uint64_t)v10[129], v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!v15)
        break;
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));
      v18 = objc_opt_class(v11[117]);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
      {
        if (qword_1000E0190 != -1)
          dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
        v20 = (id)qword_1000E0188;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_QWORD *)v67 = 0;
          v44 = sub_100007750(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            v45 = v44;
          else
            v45 = v44 & 0xFFFFFFFE;
          if ((_DWORD)v45)
          {
            LOWORD(v62[0]) = 0;
            v46 = (const char *)_os_log_send_and_compose_impl(v45, v67, 0, 0);
            v47 = (char *)v46;
            if (v46)
              sub_100007780(v46);
          }
          else
          {
            v47 = 0;
          }
          free(v47);
        }
        goto LABEL_37;
      }
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "personaSetFromData:", v17));
      v20 = v19;
      if (!v19)
      {
        if (qword_1000E0190 != -1)
          dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
        v21 = (id)qword_1000E0188;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_QWORD *)v67 = 0;
          v48 = sub_100007750(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            v49 = v48;
          else
            v49 = v48 & 0xFFFFFFFE;
          if ((_DWORD)v49)
          {
            LOWORD(v62[0]) = 0;
            v50 = (const char *)_os_log_send_and_compose_impl(v49, v67, 0, 0);
            v51 = (char *)v50;
            if (v50)
              sub_100007780(v50);
          }
          else
          {
            v51 = 0;
          }
          free(v51);
        }
LABEL_36:

LABEL_37:
LABEL_38:

        v32 = 0;
        goto LABEL_39;
      }
      v57 = v17;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v21 = v19;
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v59 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
            if (v26)
            {
              v27 = *(id *)(v26 + 120);
              if (v27)
              {
                v28 = v27;
                v29 = objc_msgSend(*(id *)(v26 + 120), "isEqual:", v16);

                if ((v29 & 1) == 0)
                {
                  if (qword_1000E0190 != -1)
                    dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
                  v5 = v56;
                  v33 = (id)qword_1000E0188;
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    v62[0] = 0;
                    v34 = sub_100007750(0);
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                      v35 = v34;
                    else
                      v35 = v34 & 0xFFFFFFFE;
                    if ((_DWORD)v35)
                    {
                      v36 = *(_QWORD *)(v26 + 120);
                      *(_DWORD *)v67 = 138543618;
                      *(_QWORD *)&v67[4] = v36;
                      v68 = 2114;
                      v69 = v16;
                      v37 = v33;
                      v38 = (char *)_os_log_send_and_compose_impl(v35, v62, 0, 0);

                      if (v38)
                        sub_100007780(v38);
                    }
                    else
                    {
                      v38 = 0;
                    }
                    free(v38);
                  }

                  v6 = v55;
                  v17 = v57;
                  goto LABEL_36;
                }
              }
            }
          }
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          if (v23)
            continue;
          break;
        }
      }

      v30 = objc_alloc_init(UMDPersonaManifestUser);
      sub_10001C838((uint64_t)v30, v16);
      if (v30)
        objc_setProperty_nonatomic_copy(v30, v31, v21, 16);
      v5 = v56;
      objc_msgSend(v56, "addObject:", v30);

      v12 = (char *)v12 + 1;
      v6 = v55;
      v9 = v52;
      a1 = v53;
      v10 = &AKSGetLastUser_ptr;
      v11 = &AKSGetLastUser_ptr;
      if (v12 == v54)
      {
        v8 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_23;
      }
    }
    if (qword_1000E0190 != -1)
      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
    v16 = (id)qword_1000E0188;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v62[0] = 0;
      v40 = sub_100007750(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        v41 = v40;
      else
        v41 = v40 & 0xFFFFFFFE;
      if ((_DWORD)v41)
      {
        *(_DWORD *)v67 = 138543362;
        *(_QWORD *)&v67[4] = v13;
        v42 = (const char *)_os_log_send_and_compose_impl(v41, v62, 0, 0);
        v43 = (char *)v42;
        if (v42)
          sub_100007780(v42);
      }
      else
      {
        v43 = 0;
      }
      free(v43);
    }
    goto LABEL_38;
  }
LABEL_23:

  v32 = v5;
LABEL_39:

  return v32;
}

+ (id)dictForUserSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  char *v30;
  unsigned int v32;
  uint64_t v33;
  const char *v34;
  char *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[12];
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v46;
    v38 = v5;
    v39 = v4;
    v36 = *(_QWORD *)v46;
    while (2)
    {
      v37 = v6;
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if (!v9 || !*(_QWORD *)(v9 + 24))
        {
          if (qword_1000E0190 != -1)
            dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
          v10 = (id)qword_1000E0188;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_QWORD *)v49 = 0;
            v32 = sub_100007750(0);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              v33 = v32;
            else
              v33 = v32 & 0xFFFFFFFE;
            if ((_DWORD)v33)
            {
              LOWORD(v40) = 0;
              v34 = (const char *)_os_log_send_and_compose_impl(v33, v49, 0, 0);
              v35 = (char *)v34;
              if (v34)
                sub_100007780(v34);
            }
            else
            {
              v35 = 0;
            }
            free(v35);
          }
LABEL_35:

          v23 = 0;
          goto LABEL_36;
        }
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v10 = *(id *)(v9 + 16);
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
              if (v15)
              {
                v16 = *(id *)(v15 + 120);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)(v9 + 24);
                  v19 = *(id *)(v15 + 120);
                  LOBYTE(v18) = objc_msgSend(v19, "isEqual:", v18);

                  if ((v18 & 1) == 0)
                  {
                    if (qword_1000E0190 != -1)
                      dispatch_once(&qword_1000E0190, &stru_1000D1BC8);
                    v5 = v38;
                    v24 = (id)qword_1000E0188;
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                    {
                      v40 = 0;
                      LODWORD(v25) = sub_100007750(0);
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                        v25 = v25;
                      else
                        v25 = v25 & 0xFFFFFFFE;
                      if ((_DWORD)v25)
                      {
                        v26 = *(void **)(v15 + 120);
                        v27 = *(_QWORD *)(v9 + 24);
                        *(_DWORD *)v49 = 138543618;
                        *(_QWORD *)&v49[4] = v26;
                        v50 = 2114;
                        v51 = v27;
                        v28 = v26;
                        v29 = v24;
                        v30 = (char *)_os_log_send_and_compose_impl(v25, &v40, 0, 0);

                        if (v30)
                          sub_100007780(v30);
                      }
                      else
                      {
                        v30 = 0;
                      }
                      free(v30);
                    }

                    v4 = v39;
                    goto LABEL_35;
                  }
                }
              }
            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
            if (v12)
              continue;
            break;
          }
        }

        v5 = v38;
        v4 = v39;
        v7 = v36;
        v20 = *(id *)(v9 + 16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[UMDPersonaManifest dataForPersonaSet:](UMDPersonaManifest, "dataForPersonaSet:", v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 24), "UUIDString"));
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v21, v22);

      }
      v6 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v6)
        continue;
      break;
    }
  }

  v23 = v4;
LABEL_36:

  return v23;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (NSSet)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
}

@end
