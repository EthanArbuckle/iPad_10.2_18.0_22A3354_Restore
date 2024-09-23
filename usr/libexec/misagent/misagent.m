uint64_t sub_100003F00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100003FE8(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;
  int v6;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  v5 = sqlite3_bind_parameter_index(a2, "@predicate");
  sqlite3_bind_text(a2, v5, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
  v6 = sqlite3_bind_parameter_index(a2, "@wildcard");
  return sqlite3_bind_int(a2, v6, *(unsigned __int8 *)(a1 + 48));
}

void sub_100004230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004254(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004264(uint64_t a1)
{

}

uint64_t sub_10000426C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];
  _BYTE v45[128];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "readSetting:", CFSTR("databaseSchemaVersion")));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    v10 = sub_10000757C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MISQL: null version, potential erase or updgrade", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSetting:toValue:", CFSTR("databaseSchemaVersion"), CFSTR("1"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE TABLE profiles(uuid TEXT NOT NULL PRIMARY KEY, team_id TEXT NOT NULL, install_time TEXT DEFAULT CURRENT_TIMESTAMP, name TEXT NOT NULL, expires INTEGER, is_for_all_devices INTEGER, is_apple_internal INTEGER, is_local INTEGER, is_beta INTEGER, cms_blob BLOB NOT NULL)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v12 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AFA0(a1 + 48);
      goto LABEL_41;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE TABLE certificates(pk INTEGER PRIMARY KEY AUTOINCREMENT, leaf BLOB UNIQUE NOT NULL)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v13 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AF38(a1 + 48);
      goto LABEL_41;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE UNIQUE INDEX certificate_leaf_index ON certificates (leaf)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v15 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AED0(a1 + 48);
      goto LABEL_41;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE TABLE certificate_provisioning_cache(pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT NOT NULL, leaf_pk INTEGER NOT NULL, UNIQUE(uuid, leaf_pk), CONSTRAINT fk_certificate_leaf  FOREIGN KEY (leaf_pk)  REFERENCES certificates(pk)  ON DELETE CASCADE, CONSTRAINT fk_cert_profile_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v33 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AE68(a1 + 48);
      goto LABEL_41;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE TABLE entitlements_provisioning_cache(pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT NOT NULL, predicate TEXT NOT NULL, wildcard INTEGER NOT NULL, UNIQUE(uuid, predicate), CONSTRAINT fk_predicate_profile_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v34 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AE00(a1 + 48);
      goto LABEL_41;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE UNIQUE INDEX entitlements_cache_index ON entitlements_provisioning_cache (uuid, predicate)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v35 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AD98(a1 + 48);
      goto LABEL_41;
    }
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = CFSTR("1");

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("1")))
  {
    v6 = sub_10000757C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "MISQL: performing database migration 1 -> 2", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSetting:toValue:", CFSTR("databaseSchemaVersion"), CFSTR("2"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("ALTER TABLE profiles ADD COLUMN is_der INTEGER DEFAULT (0)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v8 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AD30(a1 + 48);
LABEL_41:
      v29 = 0;
LABEL_42:

      return v29;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeQuery:withBind:withResults:", CFSTR("CREATE TABLE xml_profiles_cache(uuid TEXT NOT NULL PRIMARY KEY, cms_blob BLOB NOT NULL, CONSTRAINT fk_xml_profile_cache_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)"), 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v14 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000ACC8(a1 + 48);
      goto LABEL_41;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = CFSTR("2");

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", CFSTR("2")))
  {
    v18 = sub_10000757C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "MISQL: performing database migration 2 -> 3", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSetting:toValue:", CFSTR("databaseSchemaVersion"), CFSTR("3"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "findProfilesMatchingEntitlements:withCertificate:", &off_1000116C0, 0));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v20;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      v38 = a1 + 48;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v9);
          v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v25, "ProvisionsAllDevices", v38)
            && !objc_msgSend(v25, "AppleInternal"))
          {
            v26 = *(void **)(a1 + 32);
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_10000490C;
            v39[3] = &unk_100010760;
            v39[4] = v25;
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v26, "executeQuery:withBind:withResults:", CFSTR("UPDATE profiles SET is_beta = 1 WHERE uuid = @uuid"), v39, 0);
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              v30 = sub_10000757C();
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                sub_10000AC60(v38);

              goto LABEL_41;
            }
          }
        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v22)
          continue;
        break;
      }
    }

    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = CFSTR("3");

    v29 = 1;
    goto LABEL_42;
  }
  return 1;
}

void sub_10000490C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  id v5;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUID")));
  sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(v5, "UTF8String"), -1, 0);

}

void sub_100004A40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100004A58(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isProfileInstalled:", MISProvisioningProfileGetUUID(*(_QWORD *)(a1 + 48))) & 1) != 0)return 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "insertProfile:", *(_QWORD *)(a1 + 48));
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
}

void sub_100004B80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100004B98(_QWORD *a1)
{
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 56), "removeProfile:", a1[5]);
  return *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0;
}

void sub_100004CDC(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  void *v5;
  NSData *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("profile_cms_blob")));
  v6 = sub_10000A9AC(a2, (int)objc_msgSend(v5, "intValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

void sub_100004D54(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  void *v5;
  NSData *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("blob")));
  v6 = sub_10000A9AC(a2, (int)objc_msgSend(v5, "intValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

void sub_100004E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BoxedMISProfile fromSQLStatement:withMap:](BoxedMISProfile, "fromSQLStatement:withMap:", a2, a3));
  objc_msgSend(v3, "addObject:", v4);

}

id sub_100004FA0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id sub_10000515C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(%lu,@p%lu)"), a3, a3);
}

id sub_1000051B0(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;
  void *v6;
  id result;
  unint64_t v8;
  unint64_t v9;
  id v10;
  int v11;
  id v12;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = sqlite3_bind_parameter_index(a2, "@cert");
    sqlite3_bind_blob(a2, v4, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  }
  v5 = sqlite3_bind_parameter_index(a2, "@totalPredicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count")));
  sqlite3_bind_int64(a2, v5, (sqlite3_int64)objc_msgSend(v6, "longLongValue"));

  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@p%u"), v9)));
      v11 = sqlite3_bind_parameter_index(a2, (const char *)objc_msgSend(v10, "UTF8String"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8)));
      sqlite3_bind_text(a2, v11, (const char *)objc_msgSend(v12, "UTF8String"), -1, 0);

      v8 = (v9 + 1);
      result = objc_msgSend(*(id *)(a1 + 40), "count");
      v9 = v8;
    }
    while ((unint64_t)result > v8);
  }
  return result;
}

void sub_100005330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BoxedMISProfile fromSQLStatement:withMap:](BoxedMISProfile, "fromSQLStatement:withMap:", a2, a3));
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t sub_1000054A4(uint64_t result, sqlite3_stmt *a2)
{
  uint64_t v3;
  int v4;

  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    v4 = sqlite3_bind_parameter_index(a2, "@cert");
    return sqlite3_bind_blob(a2, v4, objc_msgSend(objc_retainAutorelease(*(id *)(v3 + 32)), "bytes"), (int)objc_msgSend(*(id *)(v3 + 32), "length"), 0);
  }
  return result;
}

void sub_100005524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BoxedMISProfile fromSQLStatement:withMap:](BoxedMISProfile, "fromSQLStatement:withMap:", a2, a3));
  objc_msgSend(v3, "addObject:", v4);

}

const char *sub_1000055EC(uint64_t a1)
{
  return sqlite3_errstr(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24));
}

void sub_100005600(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const char *sub_10000562C()
{
  return "/Library/MobileDevice/ProvisioningProfiles";
}

void start()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  _xpc_connection_s *mach_service;
  _QWORD handler[5];

  signal(15, (void (__cdecl *)(int))1);
  v0 = sub_1000056E8();
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100005728;
  handler[3] = &unk_100010898;
  handler[4] = v1;
  dispatch_source_set_event_handler(v1, handler);
  dispatch_resume(v1);
  v2 = sub_1000056E8();
  mach_service = xpc_connection_create_mach_service("com.apple.misagent", v2, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000108D8);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

uint64_t sub_1000056E8()
{
  if (qword_100014B08 != -1)
    dispatch_once(&qword_100014B08, &stru_100010918);
  return qword_100014B00;
}

void sub_100005728(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  exit(0);
}

void sub_100005740(id a1, void *a2)
{
  xpc_type_t type;
  const char *string;
  NSObject *v5;
  _QWORD handler[5];

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_retain(a2);
    xpc_connection_set_finalizer_f((xpc_connection_t)a2, (xpc_finalizer_t)sub_10000586C);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_1000058C8;
    handler[3] = &unk_100010938;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    v5 = sub_10000757C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000B008((uint64_t)string, v5);
  }
}

void sub_100005824(id a1)
{
  qword_100014B00 = (uint64_t)dispatch_workloop_create_inactive("com.apple.misagent.worker");
  dispatch_set_qos_class_fallback();
  dispatch_workloop_set_scheduler_priority(qword_100014B00, 36, 1);
  dispatch_activate((dispatch_object_t)qword_100014B00);
}

void sub_10000586C()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = sub_10000757C();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "XPC connection has been town down", v1, 2u);
  }
}

void sub_1000058C8(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  NSObject *v5;
  uint8_t v6[8];
  CFTypeRef cf;

  type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    cf = 0;
    if (lockdown_copy_checkin_info(object, &cf))
    {
      sub_100006030(*(void **)(a1 + 32), object);
    }
    else
    {
      sub_100008758(cf);
      CFRelease(cf);
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_error && sub_100005FB0(object))
  {
    v5 = sub_10000757C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Releasing XPC connection", v6, 2u);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
  }
}

uint64_t sub_1000059A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005A38;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100005A38(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  if (MISProvisioningProfileIsForBetaDeployment(*(_QWORD *)(a1 + 40)))
  {
    v2 = sub_10000757C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempt to install a Beta profile over lockdown connection.", v5, 2u);
    }

    result = 3892346911;
  }
  else
  {
    result = sub_100005ACC(*(_QWORD *)(a1 + 40));
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100005ACC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v10;
  uint64_t UUID;

  v2 = sub_100006E08(a1);
  v3 = sub_10000757C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v2)
  {
    if (v5)
    {
      v10 = 67109120;
      LODWORD(UUID) = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "attempt to install invalid profile: 0x%x", (uint8_t *)&v10, 8u);
    }

  }
  else
  {
    if (v5)
    {
      v10 = 138412290;
      UUID = MISProvisioningProfileGetUUID(a1);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Installing provisioning profile: %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = sub_100006EB0();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (objc_msgSend(v7, "insertProfile:", a1))
      v2 = 3892346906;
    else
      v2 = 0;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("MISProvisioningProfileInstalled"), 0, 0, 0);
  }
  return v2;
}

uint64_t sub_100005C10(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005CA0;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005CA0(uint64_t a1)
{
  sub_100005CD0(*(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void sub_100005CD0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  uint64_t v8;

  v2 = sub_10000757C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing provisioning profile: %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = sub_100006EB0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "removeProfile:", a1);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("MISProvisioningProfileRemoved"), 0, 0, 0);
}

uint64_t sub_100005DA4(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005E34;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005E34(uint64_t a1)
{
  __CFArray **v2;
  CFMutableArrayRef Mutable;
  __CFArray *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = *(__CFArray ***)(a1 + 40);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = sub_100006EB0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allCMSBlobs", 0));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          CFArrayAppendValue(v4, *(const void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v12 = 0;
    *v2 = v4;
  }
  else
  {
    v13 = sub_10000757C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000B07C();

    v12 = -402620406;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
}

BOOL sub_100005FB0(xpc_object_t xdict)
{
  id v2;
  NSObject *v3;

  if (xdict != &_xpc_error_connection_invalid)
  {
    xpc_dictionary_get_string(xdict, _xpc_error_key_description);
    v2 = sub_10000757C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000B0A8();

  }
  return xdict == &_xpc_error_connection_invalid;
}

void sub_100006030(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *string;
  const char *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  xpc_object_t reply;
  id v19;
  id v20;
  const UInt8 *data;
  CFDataRef v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  _xpc_connection_s *v27;
  void *v28;
  pid_t pid;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  _xpc_connection_s *v34;
  id v35;
  const char *v36;
  CFStringRef v37;
  CFStringRef v38;
  uint64_t v39;
  _xpc_connection_s *v40;
  id v41;
  xpc_object_t empty;
  id v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  id v49;
  xpc_object_t v50;
  int v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _xpc_connection_s *v61;
  id v62;
  const char *v63;
  const __CFString *v64;
  unint64_t v65;
  BOOL v66;
  int v67;
  BOOL v68;
  _BOOL8 v69;
  id v70;
  void *v71;
  uint64_t v72;
  int v73;
  id v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  NSObject *v84;
  xpc_object_t dictionary;
  const void *v86;
  xpc_object_t array;
  xpc_object_t v88;
  id v89;
  NSObject *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *j;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  NSObject *v105;
  xpc_object_t v106;
  id v107;
  id v108;
  NSObject *v109;
  id v110;
  NSObject *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  xpc_object_t v120;
  xpc_object_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  id v125;
  uint64_t v126;
  void *k;
  void *v128;
  id v129;
  NSObject *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  xpc_object_t v135;
  xpc_object_t v136;
  id v137;
  void *context;
  void *v139;
  xpc_object_t xarray;
  void *v141;
  _xpc_connection_s *connection;
  id v143;
  xpc_object_t xdict;
  void *v145;
  void *v146;
  void *v147;
  _QWORD applier[4];
  id v149;
  size_t v150;
  uint8_t buf[4];
  void *v152;
  __int16 v153;
  void *v154;
  __int128 length;
  uint64_t v156;
  uint64_t (*v157)(uint64_t, uint64_t);
  void (*v158)(uint64_t);
  id v159;
  char buffer[16];
  __int128 v161;
  __int128 v162;
  __int128 v163;

  v3 = a1;
  v4 = a2;
  v147 = objc_autoreleasePoolPush();
  string = xpc_dictionary_get_string(v4, "MessageType");
  v145 = v3;
  v146 = v4;
  if (!string)
  {
    v9 = sub_10000757C();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000B108(v8, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  v6 = string;
  if (!strcmp(string, "Ping"))
  {
    v17 = (_xpc_connection_s *)v3;
    reply = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_string(reply, "Payload", "pong!");
    xpc_dictionary_set_uint64(reply, "Status", 0);
    xpc_connection_send_message(v17, reply);

    goto LABEL_130;
  }
  if (!strcmp(v6, "Install"))
  {
    v19 = v3;
    v20 = v4;
    *(_QWORD *)&length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(v20, "Profile", (size_t *)&length);
    if (!data)
    {
      v52 = sub_10000757C();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        sub_10000B178(v53, v54, v55, v56, v57, v58, v59, v60);

      v22 = 0;
      v26 = -402620403;
      goto LABEL_127;
    }
    v22 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
    if (!v22)
    {
      v83 = sub_10000757C();
      v84 = objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        sub_10000B1E8();

      v22 = 0;
      v26 = -402620406;
      goto LABEL_127;
    }
    v23 = objc_autoreleasePoolPush();
    v24 = MISProfileCreateWithData(kCFAllocatorDefault, v22);
    v25 = (void *)v24;
    if (!v24)
    {
      v108 = sub_10000757C();
      v109 = objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        sub_10000B214();

      v26 = -402620406;
      goto LABEL_126;
    }
    v26 = MISProvisioningProfileValidateSignature(v24);
    if (!v26)
    {
      if (MISProvisioningProfileIsForBetaDeployment(v25))
      {
        v27 = (_xpc_connection_s *)v19;
        v28 = (void *)xpc_connection_copy_entitlement_value();
        pid = xpc_connection_get_pid(v27);

        if (v28 != &_xpc_BOOL_true)
        {
          v30 = sub_10000757C();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_10000B26C(pid, v31);

          v32 = sub_10000757C();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            sub_10000B240();

          v26 = -402620385;
          goto LABEL_126;
        }

      }
      v26 = sub_100005ACC((uint64_t)v25);
    }
LABEL_126:

    objc_autoreleasePoolPop(v23);
LABEL_127:
    v136 = xpc_dictionary_create_reply(v20);
    xpc_dictionary_set_uint64(v136, "Status", v26);
    xpc_connection_send_message((xpc_connection_t)v19, v136);
    if (v22)
      CFRelease(v22);

    goto LABEL_130;
  }
  if (!strcmp(v6, "Remove"))
  {
    v34 = (_xpc_connection_s *)v3;
    v35 = v4;
    v36 = xpc_dictionary_get_string(v35, "ProfileID");
    if (v36)
    {
      v37 = CFStringCreateWithCString(kCFAllocatorDefault, v36, 0x8000100u);
      if (v37)
      {
        v38 = v37;
        sub_100005CD0((uint64_t)v37);
        v39 = 0;
      }
      else
      {
        v104 = sub_10000757C();
        v105 = objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
          sub_10000B360();

        v38 = 0;
        v39 = -402620406;
      }
    }
    else
    {
      v74 = sub_10000757C();
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        sub_10000B2F0(v75, v76, v77, v78, v79, v80, v81, v82);

      v38 = 0;
      v39 = -402620403;
    }
    v106 = xpc_dictionary_create_reply(v35);

    xpc_dictionary_set_uint64(v106, "Status", v39);
    xpc_connection_send_message(v34, v106);

    if (v38)
      CFRelease(v38);

    goto LABEL_130;
  }
  if (!strcmp(v6, "CopyAll"))
  {
    v40 = (_xpc_connection_s *)v3;
    v41 = v4;
    empty = xpc_array_create_empty();
    if (empty)
    {
      v162 = 0u;
      v163 = 0u;
      *(_OWORD *)buffer = 0u;
      v161 = 0u;
      v43 = sub_100006EB0();
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "allProfiles"));

      v46 = (uint64_t)-[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", buffer, &length, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v161;
        while (2)
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v161 != v47)
              objc_enumerationMutation(v45);
            v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buffer[8]
                                                                                                  + 8 * i), "UUID")));
            v50 = xpc_string_create((const char *)objc_msgSend(v49, "UTF8String"));

            if (!v50)
            {
              v51 = 0;
              v46 = -402620382;
              goto LABEL_107;
            }
            xpc_array_append_value(empty, v50);

          }
          v46 = (uint64_t)-[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", buffer, &length, 16);
          v51 = 1;
          if (v46)
            continue;
          break;
        }
      }
      else
      {
        v51 = 1;
      }
    }
    else
    {
      v107 = sub_10000757C();
      v45 = objc_claimAutoreleasedReturnValue(v107);
      v46 = -402620406;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_10000B38C();
      v51 = 0;
    }
LABEL_107:

    v121 = xpc_dictionary_create_reply(v41);
    xpc_dictionary_set_uint64(v121, "Status", v46);
    if (v51)
      xpc_dictionary_set_value(v121, "Payload", empty);
    xpc_connection_send_message(v40, v121);

    goto LABEL_130;
  }
  if (!strcmp(v6, "CopySingle"))
  {
    v61 = (_xpc_connection_s *)v3;
    v62 = v4;
    *(_QWORD *)&length = 0;
    *((_QWORD *)&length + 1) = &length;
    v156 = 0x3032000000;
    v157 = sub_10000721C;
    v158 = sub_10000722C;
    v159 = 0;
    v63 = xpc_dictionary_get_string(v62, "ProfileID");
    if (v63)
    {
      v64 = CFStringCreateWithCString(kCFAllocatorDefault, v63, 0x8000100u);
      if (CFStringGetLength(v64) == 36)
      {
        CFStringGetCString(v64, buffer, 37, 0x8000100u);
        v65 = 0;
        v66 = 0;
        do
        {
          v67 = buffer[v65];
          v68 = (v67 - 58) > 0xFFFFFFF5 || (v67 - 71) > 0xFFFFFFF9;
          if (!v68 && (v67 - 97) >= 6 && v67 != 45)
            break;
          v66 = v65++ > 0x22;
        }
        while (v65 != 36);
        if (v66)
        {
          v69 = xpc_dictionary_get_BOOL(v62, "ForceXML");
          v70 = sub_100006EB0();
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          *(_QWORD *)buffer = _NSConcreteStackBlock;
          *(_QWORD *)&buffer[8] = 3221225472;
          *(_QWORD *)&v161 = sub_100007234;
          *((_QWORD *)&v161 + 1) = &unk_1000109C8;
          *(_QWORD *)&v162 = &length;
          objc_msgSend(v71, "queryCMSBlobForProfile:forcingXML:handler:", v64, v69, buffer);

          if (*(_QWORD *)(*((_QWORD *)&length + 1) + 40))
          {
            v72 = 0;
            v73 = 1;
LABEL_101:
            v120 = xpc_dictionary_create_reply(v62);
            xpc_dictionary_set_uint64(v120, "Status", v72);
            if (v73)
              xpc_dictionary_set_value(v120, "Payload", *(xpc_object_t *)(*((_QWORD *)&length + 1) + 40));
            xpc_connection_send_message(v61, v120);
            if (v64)
              CFRelease(v64);

            _Block_object_dispose(&length, 8);
            goto LABEL_130;
          }
          v137 = sub_10000757C();
          v111 = objc_claimAutoreleasedReturnValue(v137);
          v72 = -402620406;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            sub_10000B428();
LABEL_100:

          v73 = 0;
          goto LABEL_101;
        }
      }
      v110 = sub_10000757C();
      v111 = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        sub_10000B454();
    }
    else
    {
      v112 = sub_10000757C();
      v111 = objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        sub_10000B3B8(v111, v113, v114, v115, v116, v117, v118, v119);
      v64 = 0;
    }
    v72 = -402620403;
    goto LABEL_100;
  }
  if (strcmp(v6, "CopyMatching"))
  {
    v7 = sub_10000757C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000B4B4((uint64_t)v6, v8);
LABEL_10:

    goto LABEL_130;
  }
  connection = (_xpc_connection_s *)v3;
  v143 = v4;
  dictionary = xpc_dictionary_get_dictionary(v143, "Payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue(dictionary);
  if (xdict)
  {
    context = objc_autoreleasePoolPush();
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    v150 = 0;
    v86 = xpc_dictionary_get_data(xdict, "Cert", &v150);
    array = xpc_dictionary_get_array(xdict, "Predicates");
    xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue(array);
    v139 = 0;
    if (v86 && v150)
      v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v86));
    if (xarray)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000072F4;
      applier[3] = &unk_1000109F0;
      v149 = v141;
      xpc_array_apply(xarray, applier);

    }
    v88 = xpc_array_create_empty();
    v89 = sub_10000757C();
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      LODWORD(length) = 138412290;
      *(_QWORD *)((char *)&length + 4) = v141;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "Copying profiles for %@", (uint8_t *)&length, 0xCu);
    }

    if (objc_msgSend(v141, "count"))
    {
      v162 = 0uLL;
      v163 = 0uLL;
      *(_OWORD *)buffer = 0uLL;
      v161 = 0uLL;
      v91 = sub_100006EB0();
      v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "findProfilesMatchingPredicates:withCertificate:", v141, v139));

      v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", buffer, &length, 16);
      if (v94)
      {
        v95 = *(_QWORD *)v161;
        do
        {
          for (j = 0; j != v94; j = (char *)j + 1)
          {
            if (*(_QWORD *)v161 != v95)
              objc_enumerationMutation(v93);
            v97 = *(void **)(*(_QWORD *)&buffer[8] + 8 * (_QWORD)j);
            v98 = sub_10000757C();
            v99 = objc_claimAutoreleasedReturnValue(v98);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "UUID"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "Name"));
              *(_DWORD *)buf = 138412546;
              v152 = v100;
              v153 = 2112;
              v154 = v101;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);

            }
            v102 = sub_100007348(v97);
            v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
            xpc_array_append_value(v88, v103);

          }
          v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", buffer, &length, 16);
        }
        while (v94);
      }
    }
    else
    {
      v162 = 0uLL;
      v163 = 0uLL;
      *(_OWORD *)buffer = 0uLL;
      v161 = 0uLL;
      v123 = sub_100006EB0();
      v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "findProfilesWithCertificate:", v139));

      v125 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", buffer, &length, 16);
      if (v125)
      {
        v126 = *(_QWORD *)v161;
        do
        {
          for (k = 0; k != v125; k = (char *)k + 1)
          {
            if (*(_QWORD *)v161 != v126)
              objc_enumerationMutation(v93);
            v128 = *(void **)(*(_QWORD *)&buffer[8] + 8 * (_QWORD)k);
            v129 = sub_10000757C();
            v130 = objc_claimAutoreleasedReturnValue(v129);
            if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
            {
              v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "UUID"));
              v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "Name"));
              *(_DWORD *)buf = 138412546;
              v152 = v131;
              v153 = 2112;
              v154 = v132;
              _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);

            }
            v133 = sub_100007348(v128);
            v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
            xpc_array_append_value(v88, v134);

          }
          v125 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", buffer, &length, 16);
        }
        while (v125);
      }
    }

    objc_autoreleasePoolPop(context);
    v122 = 0;
  }
  else
  {
    v88 = 0;
    v122 = -402620415;
  }
  v135 = xpc_dictionary_create_reply(v143);
  xpc_dictionary_set_uint64(v135, "Status", v122);
  if (xdict)
    xpc_dictionary_set_value(v135, "Payload", v88);
  xpc_connection_send_message(connection, v135);

LABEL_130:
  objc_autoreleasePoolPop(v147);

}

void sub_100006DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006E08(uint64_t a1)
{
  const void *v2;
  const void *v3;
  CFAbsoluteTime Current;
  CFDateRef v5;
  uint64_t v6;
  id v8;
  NSObject *v9;

  v2 = sub_1000074DC();
  if (v2)
  {
    v3 = v2;
    Current = j__CFAbsoluteTimeGetCurrent();
    v5 = CFDateCreate(kCFAllocatorDefault, Current);
    v6 = MISProvisioningProfileCheckValidity(a1, v3, v5);
    CFRelease(v5);
    CFRelease(v3);
    return v6;
  }
  else
  {
    v8 = sub_10000757C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000B538();

    return 3892346881;
  }
}

id sub_100006EB0()
{
  if (qword_100014B18 != -1)
    dispatch_once(&qword_100014B18, &stru_1000109A0);
  return (id)qword_100014B10;
}

void sub_100006EF0(id a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  DIR *v8;
  DIR *v9;
  dirent *i;
  const char *d_name;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  id v16;
  NSObject *v17;
  char __str[1024];

  v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_10000562C());
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("/mis.db")));
  v5 = objc_claimAutoreleasedReturnValue(+[SQLDB databaseWithURL:](MISDBManager, "databaseWithURL:", v4));
  v6 = (void *)qword_100014B10;
  qword_100014B10 = v5;

  v7 = sub_10000562C();
  v8 = opendir(v7);
  if (v8)
  {
    v9 = v8;
    for (i = readdir(v8); i; i = readdir(v9))
    {
      if (i->d_type == 8)
      {
        d_name = i->d_name;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", i->d_name));
        if (objc_msgSend(v12, "length") == (id)36)
        {
          v13 = sub_10000562C();
          v14 = snprintf(__str, 0x400uLL, "%s/%s", v13, d_name);
          v15 = sub_1000070B8(v14, __str);

          if (!v15)
            break;
        }
        else
        {

        }
      }
    }
    closedir(v9);
  }
  else if (*__error() != 2)
  {
    __error();
    v16 = sub_10000757C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000B564();

  }
}

uint64_t sub_1000070B8(uint64_t a1, const char *a2)
{
  CFStringRef v3;
  CFStringRef v4;
  const void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  id v15;

  v3 = CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, a2);
  if (v3)
  {
    v4 = v3;
    v5 = (const void *)MISProfileCreateWithFile(kCFAllocatorDefault, v3);
    CFRelease(v4);
    if (v5)
    {
      if (!sub_100006E08((uint64_t)v5)
        && !objc_msgSend((id)qword_100014B10, "insertProfile:", v5))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
        v15 = 0;
        objc_msgSend(v6, "removeItemAtPath:error:", v7, &v15);
        v8 = v15;

        v9 = sub_10000757C();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
        if (v8)
        {
          if (v11)
            sub_10000B650();
        }
        else if (v11)
        {
          sub_10000B5F0();
        }

      }
      CFRelease(v5);
    }
  }
  else
  {
    v12 = sub_10000757C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000B590();

  }
  return 1;
}

uint64_t sub_10000721C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000722C(uint64_t a1)
{

}

void sub_100007234(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5;
  const void *v6;
  void *v7;
  int v8;
  xpc_object_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("\"profile_cms_blob\"")));
  v6 = sqlite3_column_blob(a2, (int)objc_msgSend(v12, "intValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("\"profile_cms_blob\"")));

  v8 = sqlite3_column_bytes(a2, (int)objc_msgSend(v7, "intValue"));
  v9 = xpc_data_create(v6, v8);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t sub_1000072F4(uint64_t a1, int a2, xpc_object_t xstring)
{
  void *v3;
  NSString *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(xstring));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "addObject:", v5);

  return 1;
}

id sub_100007348(void *a1)
{
  id v1;
  xpc_object_t empty;
  id v3;
  id v4;
  id v5;
  void *v6;
  double v7;

  v1 = a1;
  empty = xpc_array_create_empty();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "UUID")));
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v3, "UTF8String"));

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "TeamID")));
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v4, "UTF8String"));

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "Name")));
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v5, "UTF8String"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "Expires"));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  xpc_array_set_date(empty, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)v7);

  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(v1, "ProvisionsAllDevices") != 0);
  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(v1, "AppleInternal") != 0);
  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(v1, "Local") != 0);
  LODWORD(v6) = objc_msgSend(v1, "Beta");

  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, (_DWORD)v6 != 0);
  return empty;
}

void sub_1000074A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000074B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const void *sub_1000074DC()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;

  v0 = (const void *)sub_10000A920();
  if (!v0)
  {
    v5 = sub_10000757C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000B6B0();

    return 0;
  }
  v1 = v0;
  v2 = CFGetTypeID(v0);
  if (v2 != CFStringGetTypeID())
  {
    v3 = sub_10000757C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000B6DC();

    CFRelease(v1);
    return 0;
  }
  return v1;
}

id sub_10000757C()
{
  if (qword_100014B28 != -1)
    dispatch_once(&qword_100014B28, &stru_100010A10);
  if (qword_100014B20)
    return (id)qword_100014B20;
  else
    return &_os_log_default;
}

void sub_1000075CC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mis", "mis");
  v2 = (void *)qword_100014B20;
  qword_100014B20 = (uint64_t)v1;

}

uint64_t sub_100007AB0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return 1;
}

void sub_100008188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000081A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000081B0(uint64_t a1)
{

}

uint64_t sub_1000081B8(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_1000081F4(uint64_t a1, sqlite3_stmt *a2)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sub_10000A930(a2, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t sub_1000082DC(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  return sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
}

uint64_t sub_1000083C4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_100008538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008554(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sub_10000A980(a2, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_100008600(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

uint64_t sub_10000864C()
{
  sqlite3 **v0;

  return sqlite3_errcode(*v0);
}

const char *sub_100008658(sqlite3 **a1)
{
  return sqlite3_errmsg(*a1);
}

uint64_t sub_100008664(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    v6 = lockdown_send(*a1, a2, v3);
    if (v6 == -1)
      break;
    a2 += v6;
    v3 -= v6;
    if (!v3)
      return 0;
  }
  return *__error() | 0xC000u;
}

uint64_t sub_1000086D4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    v6 = lockdown_recv(*a1, a2, v3);
    if (v6 <= 0)
      break;
    a2 += v6;
    v3 -= v6;
    if (!v3)
      return 0;
  }
  if (v6 == -1)
    return *__error() | 0xC000u;
  else
    return 3892346892;
}

uint64_t sub_100008758(const void *a1)
{
  __CFDictionary *Mutable;
  int v3;
  int v4;
  NSObject *v5;
  NSObject *global_queue;
  _QWORD block[6];
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v11 = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, a1);
  v3 = secure_lockdown_checkin(&v11, Mutable, 0);
  if (v3)
  {
    v4 = v3;
    v5 = sub_10000757C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000B934(v4, v5);
  }
  else
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2000000000;
    v10 = 0;
    v10 = os_transaction_create("Handle misagent message");
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000888C;
    block[3] = &unk_100010A68;
    block[4] = v9;
    block[5] = v11;
    dispatch_async(global_queue, block);
    _Block_object_dispose(v9, 8);
  }
  if (Mutable)
    CFRelease(Mutable);
  return 1;
}

void sub_10000888C(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)(a1 + 40);
  while (!sub_10000A47C(v2, sub_1000059A8, (uint64_t (*)(void))sub_100005C10, (uint64_t (*)(void **))sub_100005DA4));
  lockdown_disconnect(*(_QWORD *)(a1 + 40));
  os_release(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void sub_100008900(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", off_100014AF8));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008A48;
  v6[3] = &unk_100010A90;
  v7 = v3;
  v5 = v3;
  sub_1000089A8(a1, v4, v6);

}

void sub_1000089A8(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008A54;
  v7[3] = &unk_100010AB8;
  v8 = a2;
  v9 = a3;
  v5 = v9;
  v6 = v8;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t sub_100008A48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100008A54(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  *a4 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "appendString:", v9);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", off_100014AF8);
  sub_100008B08(*(void **)(a1 + 32), v8, *(void **)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", (char *)objc_msgSend(*(id *)(a1 + 32), "length") + ~(unint64_t)objc_msgSend(v9, "length"), (char *)objc_msgSend(v9, "length") + 1);
}

void sub_100008B08(void *a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  CFTypeID v11;
  const __CFString *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v17 = a1;
  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    v8 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100008D10;
      v18[3] = &unk_100010AE0;
      v19 = v17;
      v20 = v6;
      -[__CFString enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v18);

      goto LABEL_16;
    }
    v9 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      v16 = v5;
      v10 = CFSTR("string");
    }
    else
    {
      v11 = CFGetTypeID(v5);
      if (v11 != CFBooleanGetTypeID())
      {
        v13 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v5, v13) & 1) == 0)
          abort();
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%lld"), CFSTR("number"), v17, -[__CFString longLongValue](v5, "longLongValue"));
        goto LABEL_15;
      }
      if (CFEqual(v5, kCFBooleanTrue))
        v12 = CFSTR("true");
      else
        v12 = CFSTR("false");
      v16 = v12;
      v10 = CFSTR("BOOL");
    }
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v10, v17, v16);
LABEL_15:
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    (*((void (**)(id, void *))v6 + 2))(v6, v15);

    goto LABEL_16;
  }
  sub_1000089A8(v5, v17, v6);
LABEL_16:

}

uint64_t sub_100008D10(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  return sub_100008B08(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

void sub_100008F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008F38(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

uint64_t sub_100008F94(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100008FB0(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_1000090BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000090D4(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  void *v5;
  NSData *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("profile_cms_blob")));
  v6 = sub_10000A9AC(a2, (int)objc_msgSend(v5, "intValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MISProfileCreateWithData(kCFAllocatorDefault, v7);
}

void sub_100009278(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009290(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_1000092EC(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  void *v5;
  unsigned __int8 *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("profile_uuid")));
  v6 = sub_10000A930(a2, (int)objc_msgSend(v5, "intValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v7);
}

void sub_100009898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000098C8(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  v5 = sqlite3_bind_parameter_index(a2, "@cms_blob");
  return sqlite3_bind_blob(a2, v5, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), 0);
}

uint64_t sub_100009968(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  double v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  v5 = sqlite3_bind_parameter_index(a2, "@team_id");
  sqlite3_bind_text(a2, v5, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
  v6 = sqlite3_bind_parameter_index(a2, "@name");
  sqlite3_bind_text(a2, v6, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
  v7 = sqlite3_bind_parameter_index(a2, "@expires");
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSince1970");
  sqlite3_bind_int64(a2, v7, (uint64_t)v8);
  v9 = sqlite3_bind_parameter_index(a2, "@is_for_all_devices");
  sqlite3_bind_int(a2, v9, *(unsigned __int8 *)(a1 + 72));
  v10 = sqlite3_bind_parameter_index(a2, "@is_apple_internal");
  sqlite3_bind_int(a2, v10, *(unsigned __int8 *)(a1 + 73));
  v11 = sqlite3_bind_parameter_index(a2, "@is_local");
  sqlite3_bind_int(a2, v11, *(unsigned __int8 *)(a1 + 74));
  v12 = sqlite3_bind_parameter_index(a2, "@is_beta");
  sqlite3_bind_int(a2, v12, *(unsigned __int8 *)(a1 + 75));
  v13 = sqlite3_bind_parameter_index(a2, "@cms_blob");
  sqlite3_bind_blob(a2, v13, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 64), "length"), 0);
  v14 = sqlite3_bind_parameter_index(a2, "@is_der");
  return sqlite3_bind_int(a2, v14, *(unsigned __int8 *)(a1 + 76));
}

uint64_t sub_100009B44(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  v5 = sqlite3_bind_parameter_index(a2, "@leaf_pk");
  return sqlite3_bind_int64(a2, v5, (sqlite3_int64)objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

void sub_100009BCC(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (!*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v3 = (void *)a1[4];
    v4 = a2;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "Entitlements"));
    LODWORD(v3) = objc_msgSend(v5, "insertEntitlement:forProfile:", v4, a1[5]);

    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (_DWORD)v3;
  }
}

uint64_t sub_100009D04(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text(a2, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_100009ED4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009EEC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100009EFC(uint64_t a1)
{

}

uint64_t sub_100009F04(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = sqlite3_bind_parameter_index(a2, "@cert");
  return sqlite3_bind_blob(a2, v4, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 32), "length"), 0);
}

uint64_t sub_100009F6C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = sqlite3_bind_parameter_index(a2, "@cert");
  return sqlite3_bind_blob(a2, v4, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 32), "length"), 0);
}

void sub_100009FD4(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pk")));
  v5 = sub_10000A980(a2, (int)objc_msgSend(v9, "intValue"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t sub_10000A47C(_QWORD *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void), uint64_t (*a4)(void **))
{
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFString *Value;
  __CFString *Mutable;
  unsigned int v12;
  CFNumberRef v13;
  CFIndex v14;
  CFDictionaryRef v15;
  CFDictionaryRef v16;
  unsigned int v17;
  const __CFString *v19;
  CFComparisonResult v20;
  uint64_t Count;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v24;
  uint64_t v25;
  CFDictionaryRef theDict;
  unsigned int valuePtr;
  void *values[3];
  void *keys[2];
  const __CFString *v30;

  theDict = 0;
  v8 = sub_10000A764(a1, &theDict);
  if ((_DWORD)v8)
    return v8;
  v9 = theDict;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("ProfileType"));
  if (!Value || CFStringCompare(Value, CFSTR("Provisioning"), 0))
    goto LABEL_4;
  v19 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("MessageType"));
  Mutable = (__CFString *)v19;
  if (!v19)
    goto LABEL_5;
  if (CFStringCompare(v19, CFSTR("Install"), 0))
  {
    if (CFStringCompare(Mutable, CFSTR("Remove"), 0))
    {
      v20 = CFStringCompare(Mutable, CFSTR("CopyAll"), 0);
      Mutable = 0;
      v12 = -402620403;
      if (v20 == kCFCompareEqualTo)
      {
        keys[0] = 0;
        v12 = a4(keys);
        Mutable = 0;
        if (!v12)
        {
          if (keys[0])
          {
            Count = CFArrayGetCount((CFArrayRef)keys[0]);
            Mutable = (__CFString *)CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
            if (Mutable && Count >= 1)
            {
              for (i = 0; i != Count; ++i)
              {
                ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)keys[0], i);
                CFArrayAppendValue((CFMutableArrayRef)Mutable, ValueAtIndex);
              }
            }
            CFRelease(keys[0]);
          }
        }
      }
      goto LABEL_6;
    }
    if (!CFDictionaryGetValue(v9, CFSTR("ProfileID")))
      goto LABEL_4;
    v12 = a3();
LABEL_34:
    Mutable = 0;
    goto LABEL_6;
  }
  v24 = CFDictionaryGetValue(v9, CFSTR("Profile"));
  if (v24)
  {
    v25 = MISProfileCreateWithData(kCFAllocatorDefault, v24);
    Mutable = (__CFString *)v25;
    if (!v25)
    {
      v12 = -402620413;
      goto LABEL_6;
    }
    v12 = a2(v25);
    CFRelease(Mutable);
    goto LABEL_34;
  }
LABEL_4:
  Mutable = 0;
LABEL_5:
  v12 = -402620403;
LABEL_6:
  valuePtr = v12;
  v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_100010BA0;
  v30 = CFSTR("Payload");
  values[0] = CFSTR("Response");
  values[1] = v13;
  values[2] = Mutable;
  if (Mutable)
    v14 = 3;
  else
    v14 = 2;
  v15 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v14, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v15)
  {
    v16 = v15;
    v17 = sub_10000A868(a1, v15);
    CFRelease(v16);
  }
  else
  {
    v17 = -402620406;
  }
  CFRelease(v13);
  if (v12)
    v8 = v12;
  else
    v8 = v17;
  CFRelease(v9);
  if (Mutable)
    CFRelease(Mutable);
  return v8;
}

uint64_t sub_10000A764(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  size_t v5;
  UInt8 *v6;
  UInt8 *v7;
  uint64_t v8;
  const __CFData *v9;
  const __CFData *v10;
  CFPropertyListRef v11;
  CFIndex length;

  LODWORD(length) = 0;
  v4 = sub_1000086D4(a1, (uint64_t)&length, 4);
  if (!(_DWORD)v4)
  {
    v4 = 3892346890;
    v5 = bswap32(length);
    LODWORD(length) = v5;
    v6 = (UInt8 *)malloc_type_malloc(v5, 0x3CAACF42uLL);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000086D4(a1, (uint64_t)v6, length);
      if (!(_DWORD)v8)
      {
        v9 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, length, kCFAllocatorNull);
        v8 = 3892346890;
        if (v9)
        {
          v10 = v9;
          v11 = CFPropertyListCreateWithData(kCFAllocatorDefault, v9, 0, 0, 0);
          *a2 = v11;
          if (v11)
            v8 = 0;
          else
            v8 = 3892346890;
          CFRelease(v10);
        }
      }
      free(v7);
      return v8;
    }
  }
  return v4;
}

uint64_t sub_10000A868(_QWORD *a1, const void *a2)
{
  const __CFData *Data;
  const __CFData *v4;
  const UInt8 *BytePtr;
  unsigned int Length;
  uint64_t v7;
  unsigned int v9;

  Data = CFPropertyListCreateData(kCFAllocatorDefault, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data)
    return 3892346890;
  v4 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v4);
  v9 = bswap32(Length);
  v7 = sub_100008664(a1, (uint64_t)&v9, 4);
  if (!(_DWORD)v7)
    v7 = sub_100008664(a1, (uint64_t)BytePtr, Length);
  CFRelease(v4);
  return v7;
}

uint64_t sub_10000A920()
{
  return MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
}

unsigned __int8 *sub_10000A930(sqlite3_stmt *a1, int a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
  if (v2)
    v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
  return v2;
}

id sub_10000A95C(sqlite3_stmt *a1, int a2)
{
  double v2;

  v2 = (double)sqlite3_column_int64(a1, a2);
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v2);
}

id sub_10000A980(sqlite3_stmt *a1, int a2)
{
  sqlite3_int64 v2;

  v2 = sqlite3_column_int64(a1, a2);
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v2);
}

NSData *sub_10000A9AC(sqlite3_stmt *a1, int a2)
{
  const void *v4;

  v4 = sqlite3_column_blob(a1, a2);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, sqlite3_column_bytes(a1, a2));
}

sqlite3 *sub_10000A9FC(void *a1, int a2)
{
  int v2;
  id v3;
  int v4;
  id v5;
  NSObject *v6;
  sqlite3 *ppDb;

  ppDb = 0;
  if (a2)
    v2 = 65537;
  else
    v2 = 65542;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path")));
  v4 = sqlite3_open_v2((const char *)objc_msgSend(v3, "UTF8String"), &ppDb, v2, 0);

  if (v4)
  {
    v5 = sub_10000757C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000B9A8(v4, v6);

  }
  return ppDb;
}

BOOL sub_10000AA90(sqlite3 *a1, const char *a2)
{
  return sqlite3_db_readonly(a1, a2) == 1;
}

uint64_t sub_10000AAAC(const char *a1)
{
  return sub_10000AAB4(a1, 384);
}

uint64_t sub_10000AAB4(const char *a1, int a2)
{
  int v3;
  int v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  stat v12;

  if (!a1)
    sub_10000BA1C();
  v3 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v3 == -1)
  {
    v6 = sub_10000757C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000BA44();

    return 0;
  }
  else
  {
    v4 = v3;
    if (fstat(v3, &v12) < 0)
    {
      v8 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000BAB4();
    }
    else
    {
      if ((v12.st_mode & 0x1FF) == a2 || (fchmod(v4, a2) & 0x80000000) == 0)
      {
        v5 = 1;
        if (v4 < 0)
          return v5;
        goto LABEL_16;
      }
      v10 = sub_10000757C();
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000BB24();
    }

    v5 = 0;
    if ((v4 & 0x80000000) == 0)
LABEL_16:
      close(v4);
  }
  return v5;
}

void sub_10000ABEC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *sub_10000AC18()
{
  return __error();
}

void sub_10000AC20(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Critical SQLite error, could not checkpoint", v1, 2u);
}

void sub_10000AC60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't update is_beta column: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000ACC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create the xml profiles table: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AD30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't add is_der to the profiles table: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AD98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create entitlements index: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AE00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create entitlements provisioning cache: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AE68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create certificates provisioning cache: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AED0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create certificates index: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AF38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create certificates table: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000AFA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1000055EC(a1);
  sub_100005620();
  sub_100005600((void *)&_mh_execute_header, v1, v2, "Couldn't create profiles table: %s", v3, v4, v5, v6, v7);
  sub_100005614();
}

void sub_10000B008(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "listener connection error: %s\n", (uint8_t *)&v2, 0xCu);
}

void sub_10000B07C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to allocate profiles array", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B0A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005620();
  sub_1000074A0((void *)&_mh_execute_header, v0, v1, "client connection error: %s\n", v2, v3, v4, v5, v6);
  sub_1000074C0();
}

void sub_10000B108(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000074A0((void *)&_mh_execute_header, a1, a3, "message missing '%s' key", a5, a6, a7, a8, 2u);
  sub_1000074C0();
}

void sub_10000B178(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000074A0((void *)&_mh_execute_header, a1, a3, "install message missing '%s' key", a5, a6, a7, a8, 2u);
  sub_1000074C0();
}

void sub_10000B1E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to create CFDataRef for profile data", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B214()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to create MISProfileRef for profile data", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "Attempted to install a Beta profile without the proper entitlement.", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B26C(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  const char *v4;

  v2[0] = 67109378;
  v2[1] = a1;
  v3 = 2080;
  v4 = "com.apple.private.mis.beta-install";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Caller (pid %d) does not have required entitlement '%s'", (uint8_t *)v2, 0x12u);
  sub_1000074C0();
}

void sub_10000B2F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000074A0((void *)&_mh_execute_header, a1, a3, "remove message missing '%s' key", a5, a6, a7, a8, 2u);
  sub_1000074C0();
}

void sub_10000B360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to create CFStringRef for profile id", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B38C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to create array", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B3B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000074A0((void *)&_mh_execute_header, a1, a3, "copy single message missing '%s' key", a5, a6, a7, a8, 2u);
  sub_1000074C0();
}

void sub_10000B428()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to create xpc data object", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005620();
  sub_1000074A0((void *)&_mh_execute_header, v0, v1, "Requested profile has invalid UUID '%s'.", v2, v3, v4, v5, v6);
  sub_1000074C0();
}

void sub_10000B4B4(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "MessageType";
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unrecognized value for '%s' key: %s", (uint8_t *)&v2, 0x16u);
  sub_1000074C0();
}

void sub_10000B538()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "could not get device UDID", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "unable to open profile directory", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B590()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005620();
  sub_1000074A0((void *)&_mh_execute_header, v0, v1, "unable to create profile path for '%s'", v2, v3, v4, v5, v6);
  sub_1000074C0();
}

void sub_10000B5F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005620();
  sub_1000074A0((void *)&_mh_execute_header, v0, v1, "migrated %s", v2, v3, v4, v5, v6);
  sub_1000074C0();
}

void sub_10000B650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005620();
  sub_1000074A0((void *)&_mh_execute_header, v0, v1, "encountered migration error %@", v2, v3, v4, v5, v6);
  sub_1000074C0();
}

void sub_10000B6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "got NULL when querying UDID", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B6DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000074D0();
  sub_1000074B0((void *)&_mh_execute_header, v0, v1, "got non-string when querying UDID", v2, v3, v4, v5, v6);
  sub_1000074C8();
}

void sub_10000B708(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000074B0((void *)&_mh_execute_header, a1, a3, "Database failed to initialize.", a5, a6, a7, a8, 0);
}

void sub_10000B73C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100008624();
  sub_100008600((void *)&_mh_execute_header, v0, (uint64_t)v0, "Finalize error (%d) on query: %@", v1);
  sub_1000074C0();
}

void sub_10000B7A4(sqlite3 **a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_100008658(a1);
  sub_10000864C();
  sub_10000860C();
  sub_100008600((void *)&_mh_execute_header, a2, v3, "SQL error '%s' (%1d)", v4);
  sub_10000863C();
}

void sub_10000B820(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000074B0((void *)&_mh_execute_header, a1, a3, "Query canceled", a5, a6, a7, a8, 0);
}

void sub_10000B854()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100008624();
  sub_100008600((void *)&_mh_execute_header, v0, (uint64_t)v0, "Prepare error (%d) on query: %@", v1);
  sub_1000074C0();
}

void sub_10000B8BC(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  sub_100008600((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to table row count for %@: %d", (uint8_t *)&v3);
  sub_1000074C0();
}

void sub_10000B934(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "secure_lockdown_checkin failed: %d\n", (uint8_t *)v2, 8u);
}

void sub_10000B9A8(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening DB: %d", (uint8_t *)v2, 8u);
}

void sub_10000BA1C()
{
  __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
}

void sub_10000BA44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AC18();
  sub_10000AC00();
  sub_10000ABEC((void *)&_mh_execute_header, v0, v1, "unable to open file to update permissions: %d, %s", v2, v3, v4, v5, v6);
  sub_100005614();
}

void sub_10000BAB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AC18();
  sub_10000AC00();
  sub_10000ABEC((void *)&_mh_execute_header, v0, v1, "unable to check filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
  sub_100005614();
}

void sub_10000BB24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AC18();
  sub_10000AC00();
  sub_10000ABEC((void *)&_mh_execute_header, v0, v1, "unable to set filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
  sub_100005614();
}

id objc_msgSend_AppleInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AppleInternal");
}

id objc_msgSend_Beta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Beta");
}

id objc_msgSend_Entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Entitlements");
}

id objc_msgSend_Expires(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Expires");
}

id objc_msgSend_Local(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Local");
}

id objc_msgSend_Name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Name");
}

id objc_msgSend_ProvisionsAllDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ProvisionsAllDevices");
}

id objc_msgSend_TeamID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TeamID");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allCMSBlobs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allCMSBlobs");
}

id objc_msgSend_allProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allProfiles");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_checkpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkpoint");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_databaseWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseWithURL:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_emitEntitlementPredicates_predicateHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emitEntitlementPredicates:predicateHandler:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_executeQuery_withBind_withCancellableResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:withBind:withCancellableResults:");
}

id objc_msgSend_executeQuery_withBind_withResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:withBind:withResults:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findProfilesMatchingEntitlements_withCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findProfilesMatchingEntitlements:withCertificate:");
}

id objc_msgSend_findProfilesMatchingPredicates_withCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findProfilesMatchingPredicates:withCertificate:");
}

id objc_msgSend_findProfilesWithCertificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findProfilesWithCertificate:");
}

id objc_msgSend_fromSQLStatement_withMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fromSQLStatement:withMap:");
}

id objc_msgSend_getCertPrimaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCertPrimaryKey:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_initWithDB_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDB:");
}

id objc_msgSend_initWithDatabaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabaseURL:");
}

id objc_msgSend_initWithUUID_withTeamID_withName_withExpiry_isUniversal_isAppleInternal_isLocal_isBeta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:withTeamID:withName:withExpiry:isUniversal:isAppleInternal:isLocal:isBeta:");
}

id objc_msgSend_insertEntitlement_forProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertEntitlement:forProfile:");
}

id objc_msgSend_insertProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertProfile:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isProfileInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProfileInstalled:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_queryCMSBlobForProfile_forcingXML_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCMSBlobForProfile:forcingXML:handler:");
}

id objc_msgSend_readSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readSetting:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProfile:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSetting_toValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetting:toValue:");
}

id objc_msgSend_setupPermissions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPermissions");
}

id objc_msgSend_setupSchema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSchema");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_transaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transaction:");
}

id objc_msgSend_transaction_immediate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transaction:immediate:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}
