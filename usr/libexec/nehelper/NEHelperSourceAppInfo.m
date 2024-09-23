@implementation NEHelperSourceAppInfo

- (NEHelperSourceAppInfo)initWithFirstMessage:(id)a3
{
  id v4;
  NEHelperSourceAppInfo *v5;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  void *v8;
  void *v9;
  _BOOL4 value;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *v14;
  NEHelperSourceAppInfo *v15;
  _BOOL4 v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  pid_t pid;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  objc_super v32;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  _BYTE buffer[256];

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NEHelperSourceAppInfo;
  v5 = -[NEHelperSourceAppInfo init](&v32, "init");
  if (!v5)
    goto LABEL_10;
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  v8 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.nehelper.privileged");
  v9 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.neagent");
  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL)
  {
    value = xpc_BOOL_get_value(v8);
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    value = 0;
    if (!v9)
      goto LABEL_8;
  }
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL)
  {
    v16 = xpc_BOOL_get_value(v9);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("NEHelperSourceAppInfo", v18);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v19;

    if (v16 || value)
      goto LABEL_9;
LABEL_12:
    pid = xpc_connection_get_pid(v7);
    v22 = proc_name(pid, buffer, 0x100u);
    v23 = v22;
    v25 = ne_log_obj(v22, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v23 < 1)
    {
      if (v27)
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v34 = pid;
        *(_WORD *)&v34[4] = 2080;
        *(_QWORD *)&v34[6] = "com.apple.private.nehelper.privileged";
        v35 = 2080;
        v36 = "com.apple.private.neagent";
        v28 = "Denying connection from process %d because it is missing the %s entitlement and %s entitlement";
        v29 = v26;
        v30 = 28;
        goto LABEL_19;
      }
    }
    else if (v27)
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v34 = buffer;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = pid;
      v35 = 2080;
      v36 = "com.apple.private.nehelper.privileged";
      v37 = 2080;
      v38 = "com.apple.private.neagent";
      v28 = "Denying connection from %s (%d) because it is missing the %s entitlement and %s entitlement";
      v29 = v26;
      v30 = 38;
LABEL_19:
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    }

    v15 = 0;
    goto LABEL_17;
  }
LABEL_8:
  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = dispatch_queue_create("NEHelperSourceAppInfo", v12);
  v14 = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v13;

  if (!value)
    goto LABEL_12;
LABEL_9:

LABEL_10:
  v15 = v5;
LABEL_17:

  return v15;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
    self = (NEHelperSourceAppInfo *)objc_getProperty(self, a2, 8, 1);
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v3;
  uint64_t uint64;
  const char *string;
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  xpc_object_t v38;
  xpc_object_t value;
  xpc_object_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  char *v45;
  const char *v46;
  _QWORD *v47;
  NSObject *Property;
  _QWORD v49[4];
  char *v50;
  id v51;
  id v52;
  int v53;
  char *v54;
  __int16 v55;
  int v56;
  uuid_string_t out;
  uuid_t dst;
  __int128 buffer;
  __int128 v60;
  __int128 v61;
  id v62;
  _QWORD *v63;

  v3 = a3;
  memset(dst, 0, sizeof(dst));
  uint64 = xpc_dictionary_get_uint64(v3, "pid");
  string = xpc_dictionary_get_string(v3, "app-identifier");
  v6 = (char *)string;
  if ((_DWORD)uint64)
  {
    if (!string)
    {
LABEL_8:
      v8 = (void *)ne_copy_signature_info_for_pid(uint64);
      v9 = v8;
      if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
      {
        value = xpc_dictionary_get_value(v9, "SourceAppSigningIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue(value);
        v40 = xpc_dictionary_get_value(v9, "SourceAppUniqueIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        if (!v6 && v10)
          v6 = (char *)_CFXPCCreateCFObjectFromXPCObject(v10);
        if (v41)
        {
          v11 = (void *)_CFXPCCreateCFObjectFromXPCObject(v41);

LABEL_12:
          v62 = 0;
          v60 = 0u;
          v61 = 0u;
          buffer = 0u;
          v12 = proc_pidinfo(uint64, 17, 1uLL, &buffer, 56);
          if ((_DWORD)v12 == 56)
          {
            uuid_copy(dst, (const unsigned __int8 *)&buffer);
            memset(out, 0, sizeof(out));
            uuid_unparse(dst, out);
            v16 = ne_log_obj(v14, v15);
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              goto LABEL_18;
            v53 = 136315394;
            v54 = out;
            v55 = 1024;
            v56 = uint64;
            v18 = "Found UUID: %s by lookup for pid: %d";
            v19 = (char *)&v53;
            v20 = v17;
            v21 = 18;
          }
          else
          {
            v22 = ne_log_obj(v12, v13);
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)out = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not convert from PID to UUID", (uint8_t *)out, 2u);
            }

            v26 = ne_log_obj(v24, v25);
            v17 = objc_claimAutoreleasedReturnValue(v26);
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
LABEL_18:

              if (!v6)
                goto LABEL_26;
              goto LABEL_19;
            }
            *(_DWORD *)out = 67109120;
            *(_DWORD *)&out[4] = uint64;
            v18 = "Could not convert from PID (%d) to UUID";
            v19 = out;
            v20 = v17;
            v21 = 8;
          }
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)v19, v21);
          goto LABEL_18;
        }
      }
      else
      {
        v10 = 0;
      }
      v11 = 0;
      goto LABEL_12;
    }
    if (!*string)
    {
      v6 = 0;
      goto LABEL_8;
    }
  }
  else if (!string || !*string)
  {
    sub_1000037E4((uint64_t)NEHelperServer, v3, 22, 0);
    goto LABEL_53;
  }
  v7 = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", string);
  v6 = v7;
  if ((_DWORD)uint64)
    goto LABEL_8;
  v11 = 0;
  if (!v7)
    goto LABEL_26;
LABEL_19:
  if (objc_msgSend(v6, "length"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v6));
    v28 = v27;
    if (v27)
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "shortVersionString"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "teamID"));
      v31 = objc_msgSend(v30, "length");

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "teamID"));
      v33 = objc_msgSend(v32, "compare:", CFSTR("0000000000"));

      v34 = objc_alloc((Class)NSString);
      v35 = v34;
      if (v33 && v31)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "teamID"));
        v37 = objc_msgSend(v35, "initWithFormat:", CFSTR("%@.%@"), v36, v6);

      }
      else
      {
        v37 = objc_msgSend(v34, "initWithFormat:", CFSTR("%@.%@"), &stru_10003A6B8, v6);
      }
    }
    else
    {
      v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR(".%@"), v6);
      v29 = 0;
    }

    v38 = xpc_dictionary_create(0, 0, 0);
    if (v37 && objc_msgSend(v37, "length"))
      xpc_dictionary_set_string(v38, "app-identifier", (const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
    if (v29 && objc_msgSend(v29, "length"))
    {
      v29 = objc_retainAutorelease(v29);
      xpc_dictionary_set_string(v38, "version-string", (const char *)objc_msgSend(v29, "UTF8String"));
    }
    goto LABEL_40;
  }
LABEL_26:
  v38 = xpc_dictionary_create(0, 0, 0);
  v37 = 0;
  v29 = 0;
LABEL_40:
  if (v11 && objc_msgSend(v11, "length"))
  {
    v42 = objc_retainAutorelease(v11);
    xpc_dictionary_set_data(v38, "app-cd-hash", objc_msgSend(v42, "bytes"), (size_t)objc_msgSend(v42, "length"));
  }
  if (v6 && objc_msgSend(v6, "length") && uuid_is_null(dst))
  {
    v43 = sub_100020DBC((uint64_t)NEHelperCacheManager);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100026970;
    v49[3] = &unk_100039858;
    v50 = v6;
    v51 = v38;
    v52 = v3;
    v45 = v50;
    v47 = v49;
    if (v44)
    {
      Property = objc_getProperty(v44, v46, 8, 1);
      *(_QWORD *)&buffer = _NSConcreteStackBlock;
      *((_QWORD *)&buffer + 1) = 3221225472;
      *(_QWORD *)&v60 = sub_100025DA4;
      *((_QWORD *)&v60 + 1) = &unk_100039778;
      *(_QWORD *)&v61 = v44;
      *((_QWORD *)&v61 + 1) = v45;
      v62 = 0;
      v63 = v47;
      dispatch_async(Property, &buffer);

    }
  }
  else
  {
    if (!uuid_is_null(dst))
      xpc_dictionary_set_uuid(v38, "app-euuid", dst);
    sub_1000037E4((uint64_t)NEHelperServer, v3, 0, v38);
  }

LABEL_53:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
