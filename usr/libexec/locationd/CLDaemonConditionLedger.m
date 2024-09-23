@implementation CLDaemonConditionLedger

- (CLDaemonConditionLedger)initWithConfiguration:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 hasClassCAccess:(BOOL)a7 callbackHandler:(id)a8
{
  id v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;

  if (a7)
  {
    self->_universe = (CLIntersiloUniverse *)a6;
    self->_authContext = (CLClientManagerAuthorizationContext *)a5;
    -[CLDaemonConditionLedger setCallbackHandler:](self, "setCallbackHandler:", a8);
    -[CLDaemonConditionLedger setCkp:](self, "setCkp:", a4);
    v12 = -[CLDaemonConditionLedger containerURLForClientWithClientKey:](self, "containerURLForClientWithClientKey:", objc_msgSend(a4, "legacyClientKey"));
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    v13 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Path of the container\", \"containerURL\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v14 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", objc_msgSend(v12, "path"), CFSTR("kCLMonitorLedgerPathKey"));
    v17.receiver = self;
    v17.super_class = (Class)CLDaemonConditionLedger;
    return -[CLConditionLedger initWithStoreType:domain:monitorConfiguration:](&v17, "initWithStoreType:domain:monitorConfiguration:", 1, 1, v14);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    v16 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor daemon ledger file is not accessible before first unlock, bailing out early\"}", buf, 0x12u);
    }

    return 0;
  }
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  if (!-[NSDictionary count](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "count"))-[CLConditionLedger deleteLedgerFile](self, "deleteLedgerFile");
  sandbox_extension_release(self->_containerExtensionHandle, v3);
  self->_containerExtensionHandle = -1;
  self->_universe = 0;

  self->_ckp = 0;
  self->_authContext = 0;
  -[CLDaemonConditionLedger setCallbackHandler:](self, "setCallbackHandler:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonConditionLedger;
  -[CLConditionLedger dealloc](&v4, "dealloc");
}

- (void)performMigration
{
  NSObject *v3;
  CLClientKeyPath *v4;
  NSString *v5;
  unsigned int v6;
  NSDictionary *v7;
  id v8;
  uint64_t v9;
  void *v10;
  CLClientKeyPath *v11;
  NSObject *v12;
  NSString *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19[2];
  _BYTE v20[128];
  uint64_t buf;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CLClientKeyPath *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;

  sub_100131938(v19, (uint64_t)-[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MonitorMigraiton:%@::%@"), -[CLClientKeyPath description](-[CLDaemonConditionLedger ckp](self, "ckp"), "description"), -[CLConditionLedger ledgerName](self, "ledgerName")), "UTF8String"), 0);
  if (-[CLDaemonConditionLedger shouldMigrate](self, "shouldMigrate"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[CLDaemonConditionLedger ckp](self, "ckp");
      v5 = -[CLConditionLedger ledgerName](self, "ledgerName");
      v6 = -[NSNumber intValue](-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), "intValue");
      buf = 68290050;
      v22 = 2082;
      v23 = "";
      v24 = 2114;
      v25 = v4;
      v26 = 2114;
      v27 = v5;
      v28 = 1026;
      v29 = v6;
      v30 = 1026;
      v31 = 1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Migrating daemon ledger\", \"clientKey\":%{public, location:escape_only}@, \"ledger\":%{public, location:escape_only}@, \"ledgerExistingVersion\":%{public}d, \"newVersionToMigrateTo\":%{public}d}", (uint8_t *)&buf, 0x32u);
    }
    v7 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(CLClientKeyPath **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
          v12 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            v13 = -[NSDictionary objectForKeyedSubscript:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "objectForKeyedSubscript:", v11);
            buf = 68289539;
            v22 = 2082;
            v23 = "";
            v24 = 2114;
            v25 = v11;
            v26 = 2113;
            v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor removing condition due to migration\", \"identifier\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
          }
          -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:](self, "removeRecordFromMonitoringWithIdentifier:", v11);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }
    if (-[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count"))
    {
      sub_1019237DC();
      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/DaemonIdentifiableClients/CLDaemonConditionLedger.mm", 157, "-[CLDaemonConditionLedger performMigration]");
      __break(1u);
    }
    v14.receiver = self;
    v14.super_class = (Class)CLDaemonConditionLedger;
    -[CLConditionLedger setLedgerVersionNumber:](&v14, "setLedgerVersionNumber:", 1);
  }
  sub_100131740(v19);
}

- (BOOL)shouldMigrate
{
  return -[NSNumber intValue](-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), "intValue") < 1;
}

- (id)containerURLForClientWithClientKey:(id)a3
{
  std::string *v5;
  uint64_t v6;
  void **v7;
  NSObject *v8;
  NSURL *v9;
  NSObject *v10;
  NSURL *v11;
  NSURL *v12;
  NSMutableString *v13;
  NSURL *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSObject *v18;
  int v19;
  xpc_object_t v20;
  uint64_t single_result;
  uint64_t v22;
  NSMutableString *v23;
  NSMutableString *v24;
  uint64_t v25;
  void *v26;
  int64_t v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t last_error;
  NSURL *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void **v39;
  NSObject *v40;
  void **v41;
  NSObject *v42;
  xpc_object_t v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  int v47;
  NSObject *v49;
  void **v50;
  NSObject *v51;
  void **v52;
  NSObject *v53;
  void **v54;
  NSObject *v55;
  void **v56;
  objc_super v57;
  void *__p[2];
  char v59;
  objc_super v60;
  void *v61[2];
  char v62;
  void *v63[2];
  char v64;
  void *v65;
  char v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  char v72;
  void *v73;
  char v74;
  void *v75;
  char v76;
  uint8_t buf[8];
  __int16 v78;
  const char *v79;
  __int16 v80;
  NSURL *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  const char *v85;

  v5 = (std::string *)sub_1015A2E04(buf, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100204320(v5, (uint64_t)v63);
  if (SBYTE3(v81) < 0)
    operator delete(*(void **)buf);
  sub_100C39348((uint64_t)v63, (uint64_t)v61);
  sub_100197040();
  if (!sub_10011E0F0() || (sub_100197040(), sub_10075A02C()))
  {
    v6 = container_query_create();
    if (!v6)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
      v8 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        v9 = (NSURL *)objc_msgSend(a3, "UTF8String");
        *(_QWORD *)buf = 68289282;
        v78 = 2082;
        v79 = "";
        v80 = 2082;
        v81 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to create query\", \"clientKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
      }
      v10 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        v11 = (NSURL *)objc_msgSend(a3, "UTF8String");
        *(_QWORD *)buf = 68289282;
        v78 = 2082;
        v79 = "";
        v80 = 2082;
        v81 = v11;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to create query", "{\"msg%{public}.0s\":\"#monitor unable to create query\", \"clientKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      v12 = 0;
      v6 = 0;
      goto LABEL_87;
    }
    if (v62 < 0)
    {
      if (v61[1])
      {
        v7 = (void **)v61[0];
LABEL_22:
        v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        v18 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_QWORD *)buf = 68289282;
          v78 = 2082;
          v79 = "";
          v80 = 2114;
          v81 = (NSURL *)v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor platform bundleID is found\", \"platformBundleID\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        if (v17)
        {
          sub_100197040();
          if (!sub_10011E0F0())
          {
            v43 = xpc_string_create(-[NSString UTF8String](v17, "UTF8String"));
            container_query_set_identifiers(v6, v43);
            xpc_release(v43);
            container_query_set_class(v6, 12);
            v19 = 0;
            v15 = 0;
LABEL_33:
            container_query_operation_set_flags(v6, 0x900000001);
            container_query_set_persona_unique_string(v6, CONTAINER_PERSONA_PRIMARY);
            if ((v19 & 1) == 0)
            {
              sub_100197040();
              if ((sub_10011E0F0() & 1) == 0)
              {
                v20 = xpc_string_create(-[NSString UTF8String](v17, "UTF8String"));
                container_query_set_identifiers(v6, v20);
                xpc_release(v20);
              }
            }
            single_result = container_query_get_single_result(v6);
            v22 = single_result;
            if (!single_result)
            {
              last_error = container_query_get_last_error(v6);
              v35 = (NSURL *)container_error_copy_unlocalized_description(last_error);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
              v36 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
              {
                *(_QWORD *)buf = 68289282;
                v78 = 2082;
                v79 = "";
                v80 = 2082;
                v81 = v35;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Error executing query for container\", \"error\":%{public, location:escape_only}s}", buf, 0x1Cu);
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
              }
              v37 = qword_1022A01D8;
              if (os_signpost_enabled((os_log_t)qword_1022A01D8))
              {
                *(_QWORD *)buf = 68289282;
                v78 = 2082;
                v79 = "";
                v80 = 2082;
                v81 = v35;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Error executing query for container", "{\"msg%{public}.0s\":\"#monitor Error executing query for container\", \"error\":%{public, location:escape_only}s}", buf, 0x1Cu);
              }
              free(v35);
              v12 = 0;
              goto LABEL_87;
            }
            v23 = +[NSMutableString stringWithCString:encoding:](NSMutableString, "stringWithCString:encoding:", container_get_path(single_result), 4);
            v24 = v23;
            if (v19)
              -[NSMutableString appendFormat:](v23, "appendFormat:", CFSTR("/%@/"), v15);
            v12 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v24, 1);
            v25 = container_copy_sandbox_token(v22);
            v26 = (void *)v25;
            if (!v25)
            {
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
              v42 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
              {
                *(_QWORD *)buf = 68289026;
                v78 = 2082;
                v79 = "";
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Unable to get sandbox extension from container\"}", buf, 0x12u);
              }
              goto LABEL_87;
            }
            v27 = sandbox_extension_consume(v25);
            free(v26);
            if (v27 < 0)
            {
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
              v44 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
              {
                v45 = *__error();
                *(_QWORD *)buf = 68289282;
                v78 = 2082;
                v79 = "";
                v80 = 1026;
                LODWORD(v81) = v45;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Error consuming extension for container\", \"errno\":%{public}d}", buf, 0x18u);
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
              }
              v46 = qword_1022A01D8;
              if (!os_signpost_enabled((os_log_t)qword_1022A01D8))
                goto LABEL_87;
              v47 = *__error();
              *(_QWORD *)buf = 68289282;
              v78 = 2082;
              v79 = "";
              v80 = 1026;
              LODWORD(v81) = v47;
              v30 = "#monitor Error consuming extension for container";
              v31 = "{\"msg%{public}.0s\":\"#monitor Error consuming extension for container\", \"errno\":%{public}d}";
              v32 = v46;
              v33 = 24;
LABEL_86:
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v30, v31, buf, v33);
              goto LABEL_87;
            }
            self->_containerExtensionHandle = v27;
LABEL_42:
            v57.receiver = self;
            v57.super_class = (Class)CLDaemonConditionLedger;
            if (-[CLConditionLedger directoryExists:](&v57, "directoryExists:", v12))
            {
LABEL_87:
              container_query_free(v6);
              goto LABEL_88;
            }
            v15 = (NSString *)&qword_1022A0000;
            if (qword_1022A01D0 == -1)
              goto LABEL_44;
            goto LABEL_148;
          }
          v19 = 0;
          goto LABEL_31;
        }
LABEL_30:
        v19 = 1;
LABEL_31:
        v15 = sub_100C396B4((uint64_t)v63);
        if (v15)
        {
          container_query_set_class(v6, 10);
          goto LABEL_33;
        }
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        v12 = (NSURL *)&qword_1022A0000;
        v49 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          v15 = __p;
          sub_1001A885C((uint64_t)v63, (uint64_t)__p);
          if (v59 >= 0)
            v50 = __p;
          else
            v50 = (void **)__p[0];
          *(_QWORD *)buf = 68289795;
          v78 = 2082;
          v79 = "";
          v80 = 2082;
          v81 = (NSURL *)v50;
          v82 = 2082;
          v83 = "assert";
          v84 = 2081;
          v85 = "subPath";
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
          if (v59 < 0)
            operator delete(__p[0]);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        }
        v51 = qword_1022A01D8;
        if (os_signpost_enabled((os_log_t)qword_1022A01D8))
        {
          v15 = __p;
          sub_1001A885C((uint64_t)v63, (uint64_t)__p);
          if (v59 >= 0)
            v52 = __p;
          else
            v52 = (void **)__p[0];
          *(_QWORD *)buf = 68289795;
          v78 = 2082;
          v79 = "";
          v80 = 2082;
          v81 = (NSURL *)v52;
          v82 = 2082;
          v83 = "assert";
          v84 = 2081;
          v85 = "subPath";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to get identifiable name from client key", "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
          if (v59 < 0)
            operator delete(__p[0]);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        }
        v6 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
        {
          sub_1001A885C((uint64_t)v63, (uint64_t)__p);
          sub_1019239A0();
        }
        abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/DaemonIdentifiableClients/CLDaemonConditionLedger.mm", 224, "-[CLDaemonConditionLedger containerURLForClientWithClientKey:]");
LABEL_147:
        __break(1u);
LABEL_148:
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
LABEL_44:
        v28 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
        {
          *(_QWORD *)buf = 68289282;
          v78 = 2082;
          v79 = "";
          v80 = 2114;
          v81 = v12;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor directory doesn't exist\", \"contrainerURL\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (v15[58] != (NSString)-1)
            dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        }
        v29 = qword_1022A01D8;
        if (!os_signpost_enabled((os_log_t)qword_1022A01D8))
          goto LABEL_87;
        *(_QWORD *)buf = 68289282;
        v78 = 2082;
        v79 = "";
        v80 = 2114;
        v81 = v12;
        v30 = "#monitor directory doesn't exist";
        v31 = "{\"msg%{public}.0s\":\"#monitor directory doesn't exist\", \"contrainerURL\":%{public, location:escape_only}@}";
        v32 = v29;
        v33 = 28;
        goto LABEL_86;
      }
    }
    else if (v62)
    {
      v7 = v61;
      goto LABEL_22;
    }
    v17 = 0;
    goto LABEL_30;
  }
  v13 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("/var/db/locationd/CLDaemonMonitor/"));
  v14 = sub_100C3939C((uint64_t)v13);
  v60.receiver = self;
  v60.super_class = (Class)CLDaemonConditionLedger;
  v15 = (NSString *)"directoryExists:";
  if (-[CLConditionLedger directoryExists:](&v60, "directoryExists:", v14))
  {
    v16 = sub_100C396B4((uint64_t)v63);
    if (v16)
    {
      -[NSMutableString appendString:](v13, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/"), v16));
      v12 = sub_100C3939C((uint64_t)v13);
      v6 = 0;
      goto LABEL_42;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    v12 = (NSURL *)&qword_1022A0000;
    v53 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v15 = __p;
      sub_1001A885C((uint64_t)v63, (uint64_t)__p);
      if (v59 >= 0)
        v54 = __p;
      else
        v54 = (void **)__p[0];
      *(_QWORD *)buf = 68289795;
      v78 = 2082;
      v79 = "";
      v80 = 2082;
      v81 = (NSURL *)v54;
      v82 = 2082;
      v83 = "assert";
      v84 = 2081;
      v85 = "subPath";
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (v59 < 0)
        operator delete(__p[0]);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    }
    v55 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v15 = __p;
      sub_1001A885C((uint64_t)v63, (uint64_t)__p);
      if (v59 >= 0)
        v56 = __p;
      else
        v56 = (void **)__p[0];
      *(_QWORD *)buf = 68289795;
      v78 = 2082;
      v79 = "";
      v80 = 2082;
      v81 = (NSURL *)v56;
      v82 = 2082;
      v83 = "assert";
      v84 = 2081;
      v85 = "subPath";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to get identifiable name from client key", "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (v59 < 0)
        operator delete(__p[0]);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    }
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      sub_1001A885C((uint64_t)v63, (uint64_t)__p);
      sub_1019239A0();
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/DaemonIdentifiableClients/CLDaemonConditionLedger.mm", 200, "-[CLDaemonConditionLedger containerURLForClientWithClientKey:]");
    goto LABEL_147;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
  v38 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
  {
    sub_1001A885C((uint64_t)v63, (uint64_t)__p);
    if (v59 >= 0)
      v39 = __p;
    else
      v39 = (void **)__p[0];
    *(_QWORD *)buf = 68289282;
    v78 = 2082;
    v79 = "";
    v80 = 2082;
    v81 = (NSURL *)v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to create directory to store daemon ledger in locationd path\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v59 < 0)
      operator delete(__p[0]);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
  }
  v40 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    sub_1001A885C((uint64_t)v63, (uint64_t)__p);
    v41 = v59 >= 0 ? __p : (void **)__p[0];
    *(_QWORD *)buf = 68289282;
    v78 = 2082;
    v79 = "";
    v80 = 2082;
    v81 = (NSURL *)v41;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to create directory to store daemon ledger in locationd path", "{\"msg%{public}.0s\":\"#monitor unable to create directory to store daemon ledger in locationd path\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v59 < 0)
      operator delete(__p[0]);
  }
  v12 = 0;
LABEL_88:
  if (v62 < 0)
    operator delete(v61[0]);
  if (v76 < 0)
    operator delete(v75);
  if (v74 < 0)
    operator delete(v73);
  if (v72 < 0)
    operator delete(v71);
  if (v70 < 0)
    operator delete(v69);
  if (v68 < 0)
    operator delete(v67);
  if (v66 < 0)
    operator delete(v65);
  if (v64 < 0)
    operator delete(v63[0]);
  return v12;
}

- (BOOL)isMonitoring
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[NSDictionary allValues](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier", 0), "allValues");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "isMonitoring") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (void)validateClientMonitoringRecordsByIdenitifier:(id)a3
{
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSObject *v7;
  id v8;
  NSUInteger v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  NSObject *v14;
  NSArray *v15;
  id v16;
  void *j;
  void *v18;
  CLDaemonMonitoringRecord *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36[2];
  uint8_t v37[128];
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSUInteger v45;
  _BYTE v46[128];

  sub_100131938(v36, (uint64_t)-[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Monitor:%@:%@::validateClientMonitoringRecords"), -[CLDaemonConditionLedger ckp](self, "ckp"), -[CLConditionLedger ledgerName](self, "ledgerName")), "UTF8String"), 0);
  if (a3)
  {
    v5 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", objc_msgSend(a3, "allKeys"));
    v6 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"));
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSMutableSet count](v5, "count");
      v9 = -[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count");
      *(_DWORD *)buf = 68289538;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      v42 = 2050;
      v43 = v8;
      v44 = 2050;
      v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor client has monitoring records\", \"clientCount\":%{public}ld, \"daemonCount\":%{public}ld}", buf, 0x26u);
    }
    -[NSMutableSet minusSet:](v6, "minusSet:", v5);
    -[NSMutableSet unionSet:](v5, "unionSet:", +[NSSet setWithArray:](NSSet, "setWithArray:", -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers")));
    -[NSMutableSet minusSet:](v5, "minusSet:", v6);
    v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v5);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i));
        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      }
      while (v11);
    }
    -[CLDaemonConditionLedger removeConditionsWithIdentifiers:](self, "removeConditionsWithIdentifiers:", v6);
    -[CLDaemonConditionLedger adjustMonitoringAccordingToClientLedgerDictionary:](self, "adjustMonitoringAccordingToClientLedgerDictionary:", v10);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v39 = 0;
      v40 = 2082;
      v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor reiniting all monitored conditions\"}", buf, 0x12u);
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers");
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v16)
    {
      v24 = *(_QWORD *)v33;
      do
      {
        v25 = v16;
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v15);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
          v19 = -[CLDaemonMonitoringRecord initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:]([CLDaemonMonitoringRecord alloc], "initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:", -[NSDictionary objectForKeyedSubscript:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "objectForKeyedSubscript:", v18), -[CLDaemonConditionLedger ckp](self, "ckp"), self->_authContext, self->_universe, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), -[CLClientKeyPath clientKey](-[CLDaemonConditionLedger ckp](self, "ckp"), "clientKey"), -[CLConditionLedger ledgerName](self, "ledgerName")), 0, -[CLDaemonConditionLedger callbackHandler](self, "callbackHandler"));
          v31.receiver = self;
          v31.super_class = (Class)CLDaemonConditionLedger;
          -[CLConditionLedger updateRecord:identifier:](&v31, "updateRecord:identifier:", v19, v18);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
          v20 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            v21 = objc_msgSend(v18, "UTF8String");
            *(_DWORD *)buf = 68289539;
            v39 = 0;
            v40 = 2082;
            v41 = "";
            v42 = 2082;
            v43 = v21;
            v44 = 2113;
            v45 = (NSUInteger)v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor reinited record\", \"identifier\":%{public, location:escape_only}s, \"record\":%{private, location:escape_only}@}", buf, 0x26u);
          }

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v16);
    }
    v30.receiver = self;
    v30.super_class = (Class)CLDaemonConditionLedger;
    if (!-[CLConditionLedger writeToFile](&v30, "writeToFile"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
      v22 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v39 = 0;
        v40 = 2082;
        v41 = "";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#monitor #Warning reinited conditions failed to write to disk\"}", buf, 0x12u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
      }
      v23 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        *(_DWORD *)buf = 68289026;
        v39 = 0;
        v40 = 2082;
        v41 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor #Warning reinited conditions failed to write to disk", "{\"msg%{public}.0s\":\"#monitor #Warning reinited conditions failed to write to disk\"}", buf, 0x12u);
      }
    }
  }
  sub_100131740(v36);
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLDaemonConditionLedger;
  -[CLConditionLedger updateRecord:identifier:](&v4, "updateRecord:identifier:", a3, a4);
}

- (void)updateAuthorizationContext:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  self->_authContext = (CLClientManagerAuthorizationContext *)a3;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a3, "registrationResult");
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2050;
    v10 = objc_msgSend(a3, "registrationResult");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor updateAuthContext change\", \"RegistrationResult\":%{public, location:CLClientRegistrationResult}lld}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)updateCallbackHandler:(id)a3
{
  _QWORD v4[5];

  -[CLDaemonConditionLedger setCallbackHandler:](self, "setCallbackHandler:", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C3A1C0;
  v4[3] = &unk_10217B278;
  v4[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)stopMonitoringAllConditions
{
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "enumerateKeysAndObjectsUsingBlock:", &stru_10217B2B8);
}

- (void)removeConditionsWithIdentifiers:(id)a3
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 68289282;
    v13 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:](self, "removeRecordFromMonitoringWithIdentifier:", v10, v13);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        v11 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_msgSend(v10, "UTF8String");
          *(_DWORD *)buf = v13;
          v19 = 0;
          v20 = 2082;
          v21 = "";
          v22 = 2082;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor remove condition\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v7);
  }
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;

  v7.receiver = self;
  v7.super_class = (Class)CLDaemonConditionLedger;
  v4 = -[CLConditionLedger removeRecordFromMonitoringWithIdentifier:](&v7, "removeRecordFromMonitoringWithIdentifier:");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = a3;
    v14 = 1026;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor remove record with identifier from monitoring \", \"identifier\":%{public, location:escape_only}@, \"removeStatus\":%{public}hhd}", buf, 0x22u);
  }
  return v4;
}

- (void)addMonitoringRecord:(id)a3 forIdentifier:(id)a4
{
  id v7;
  NSString *v8;
  CLDaemonMonitoringRecord *v9;
  NSObject *v10;
  NSObject *v11;
  CLDaemonMonitoringRecord *v12;
  objc_super v13;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLClientKeyPath *v22;
  __int16 v23;
  id v24;

  v7 = -[NSDictionary objectForKeyedSubscript:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "objectForKeyedSubscript:", a4);
  if (!v7
    || (objc_msgSend(objc_msgSend(v7, "clientCondition"), "isEqual:", objc_msgSend(a3, "condition")) & 1) == 0)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), -[CLClientKeyPath clientKey](-[CLDaemonConditionLedger ckp](self, "ckp"), "clientKey"), -[CLConditionLedger ledgerName](self, "ledgerName"));
    if (-[CLDaemonConditionLedger canAddToMonitor](self, "canAddToMonitor"))
    {
      v9 = -[CLDaemonMonitoringRecord initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:]([CLDaemonMonitoringRecord alloc], "initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:", a3, -[CLDaemonConditionLedger ckp](self, "ckp"), self->_authContext, self->_universe, v8, 0, -[CLDaemonConditionLedger callbackHandler](self, "callbackHandler"));
      v13.receiver = self;
      v13.super_class = (Class)CLDaemonConditionLedger;
      if (!-[CLConditionLedger addRecordForMonitoring:identifier:persist:](&v13, "addRecordForMonitoring:identifier:persist:", v9, a4, 1))-[CLDaemonMonitoringRecord setPersistenceUnavailable:](v9, "setPersistenceUnavailable:", 1);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
      v10 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2114;
        v20 = (NSString *)a4;
        v21 = 2113;
        v22 = (CLClientKeyPath *)v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor add record for monitoring\", \"identifier\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", buf, 0x26u);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
      v11 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289795;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2114;
        v20 = -[CLConditionLedger ledgerName](self, "ledgerName");
        v21 = 2114;
        v22 = -[CLDaemonConditionLedger ckp](self, "ckp");
        v23 = 2113;
        v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #monitor number for monitoring conditions limit reached. Sending unmonitoring state\", \"monitor\":%{public, location:escape_only}@, \"client\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", buf, 0x30u);
      }
      v12 = -[CLDaemonMonitoringRecord initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:]([CLDaemonMonitoringRecord alloc], "initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:", a3, -[CLDaemonConditionLedger ckp](self, "ckp"), self->_authContext, self->_universe, v8, 1, 0);
      -[CLDaemonMonitoringRecord setConditionLimitExceeded:](v12, "setConditionLimitExceeded:", 1);
      v14.receiver = self;
      v14.super_class = (Class)CLDaemonConditionLedger;
      -[CLConditionLedger addRecordForMonitoring:identifier:persist:](&v14, "addRecordForMonitoring:identifier:persist:", v12, a4, 0);
    }
  }
}

- (void)updateClientEvent:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLDaemonConditionLedger *v19;

  v6 = -[NSDictionary objectForKeyedSubscript:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "objectForKeyedSubscript:", a4);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_msgSend(v6, "clientEvent"), "state");
    if (v8 != objc_msgSend(a3, "state")
      || (v9 = objc_msgSend(objc_msgSend(v7, "clientEvent"), "diagnosticMask"), v9 != objc_msgSend(a3, "diagnosticMask")))
    {
      objc_msgSend(v7, "updateClientEvent:", a3);
      -[CLConditionLedger writeToFile](self, "writeToFile");
    }
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_10217B2F8);
    v10 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289795;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = a3;
      v16 = 2114;
      v17 = -[CLConditionLedger ledgerName](self, "ledgerName");
      v18 = 2050;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor received event from client but record doesn't exist\", \"event\":%{private, location:escape_only}@, \"monitor\":%{public, location:escape_only}@, \"this\":\"%{public}p\"}", (uint8_t *)v11, 0x30u);
    }
  }
}

- (void)updateDaemonEvent:(id)a3 forIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = -[NSDictionary objectForKeyedSubscript:](-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"), "objectForKeyedSubscript:", a4);
  if (v5)
  {
    objc_msgSend(v5, "updateDaemonEvent:", a3);
  }
  else
  {
    if (qword_1022A01C0 != -1)
      dispatch_once(&qword_1022A01C0, &stru_10217B2F8);
    v6 = qword_1022A01C8;
    if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
    {
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor received daemon event from monitored conditions but record doesn't exist\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
      if (qword_1022A01C0 != -1)
        dispatch_once(&qword_1022A01C0, &stru_10217B2F8);
    }
    v7 = qword_1022A01C8;
    if (os_signpost_enabled((os_log_t)qword_1022A01C8))
    {
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor received daemon event from monitored conditions but record doesn't exist", "{\"msg%{public}.0s\":\"#monitor received daemon event from monitored conditions but record doesn't exist\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)adjustMonitoringAccordingToClientLedgerDictionary:(id)a3
{
  uint64_t *v4;
  NSObject *v5;
  id v6;
  void *i;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id obj;
  uint64_t v33;
  NSDictionary *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];

  v4 = &qword_1022A0000;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v47 = 0;
    v48 = 2082;
    v49 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor validate conditions\"}", buf, 0x12u);
  }
  v34 = -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier");
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = objc_msgSend(a3, "allKeys");
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v36)
  {
    v33 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(a3, "objectForKeyedSubscript:", v8);
        if (v4[58] != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        v10 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289283;
          v47 = 0;
          v48 = 2082;
          v49 = "";
          v50 = 2113;
          v51 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor validating client record\", \"clientRecord\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        v11 = objc_msgSend(v9, "condition");
        v12 = -[NSDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v8);
        if (!v12)
          goto LABEL_33;
        v13 = v12;
        v14 = objc_msgSend(v12, "condition");
        -[CLDaemonConditionLedger updateClientEvent:forIdentifier:](self, "updateClientEvent:forIdentifier:", objc_msgSend(v9, "lastEvent"), v8);
        v15 = objc_msgSend(v11, "isEqual:", v14);
        v16 = objc_msgSend(v13, "daemonCondition");
        if (!v15)
        {
          v18 = v4[58];
          if (v16)
          {
            if (v18 != -1)
              dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
            v19 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v20 = objc_msgSend(v8, "UTF8String");
              *(_DWORD *)buf = 68289795;
              v47 = 0;
              v48 = 2082;
              v49 = "";
              v50 = 2082;
              v51 = v20;
              v52 = 2113;
              v53 = v14;
              v54 = 2113;
              v55 = v11;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor stop monitoring - client condition changed for identifier\", \"identifier\":%{public, location:escape_only}s, \"previous\":%{private, location:escape_only}@, \"current\":%{private, location:escape_only}@}", buf, 0x30u);
            }
            objc_msgSend(v13, "resetDaemonPartOfCondition");
          }
          else
          {
            if (v18 != -1)
              dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
            v21 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v22 = objc_msgSend(v8, "UTF8String");
              v23 = objc_msgSend(objc_msgSend(v13, "recordIdentifier"), "UTF8String");
              *(_DWORD *)buf = 68290051;
              v47 = 0;
              v48 = 2082;
              v49 = "";
              v50 = 2082;
              v51 = v22;
              v52 = 2082;
              v53 = v23;
              v54 = 2113;
              v55 = v14;
              v56 = 2113;
              v57 = v11;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor need to stop monitoring by init\", \"identifier\":%{public, location:escape_only}s, \"recordIdentifier\":%{public, location:escape_only}s, \"previous\":%{private, location:escape_only}@, \"current\":%{private, location:escape_only}@}", buf, 0x3Au);
            }

            v4 = &qword_1022A0000;
          }
          -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:](self, "removeRecordFromMonitoringWithIdentifier:", v8);
LABEL_33:
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);
          continue;
        }
        if (!v16)
        {
          objc_msgSend(v13, "setupDaemonPartOfConditionWithAuthContext:clientKeyPath:universe:identifier:stopMonitoring:callbackHandler:", self->_authContext, -[CLDaemonConditionLedger ckp](self, "ckp"), self->_universe, objc_msgSend(v13, "recordIdentifier"), 0, -[CLDaemonConditionLedger callbackHandler](self, "callbackHandler"));
          if (v4[58] != -1)
            dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
          v17 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289283;
            v47 = 0;
            v48 = 2082;
            v49 = "";
            v50 = 2113;
            v51 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor setup monitoring daemon parts\", \"daemonCondition\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
        }
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v36);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v24 = objc_msgSend(v6, "allKeys");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v28);
        v30 = objc_msgSend(v6, "objectForKeyedSubscript:", v29);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_10217B2D8);
        v31 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289283;
          v47 = 0;
          v48 = 2082;
          v49 = "";
          v50 = 2113;
          v51 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor created daemon record\", \"record\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        -[CLDaemonConditionLedger addMonitoringRecord:forIdentifier:](self, "addMonitoringRecord:forIdentifier:", v30, v29);
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v26);
  }

}

- (BOOL)canAddToMonitor
{
  return -[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count") < 0x14;
}

- (void)refillAwaitingMonitoringConditions:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = -[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count");
  if (v5 != 20)
  {
    v6 = v5;
    v7 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", objc_msgSend(a3, "allKeys"));
    -[NSMutableSet minusSet:](v7, "minusSet:", +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers")));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 20 - v6;
      v11 = *(_QWORD *)v14;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        -[CLDaemonConditionLedger addMonitoringRecord:forIdentifier:](self, "addMonitoringRecord:forIdentifier:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12)), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        if (v10 - 1 == v12)
          break;
        if (v9 == (id)++v12)
        {
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          v10 -= v12;
          if (v9)
            goto LABEL_4;
          return;
        }
      }
    }
  }
}

- (id)callbackHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setCallbackHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (CLClientKeyPath)ckp
{
  return (CLClientKeyPath *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCkp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

@end
