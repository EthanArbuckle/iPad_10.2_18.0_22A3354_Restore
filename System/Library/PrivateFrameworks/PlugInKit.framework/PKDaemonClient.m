@implementation PKDaemonClient

- (void)matchPlugIns:(id)a3 flags:(unint64_t)a4 uuid:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 uuid[8];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uuid = 0;
  v15 = 0;
  v10 = a6;
  v11 = a3;
  objc_msgSend(a5, "getUUIDBytes:", uuid);
  -[PKDaemonClient request:](self, "request:", "match");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(v12, "rules", v13);
  xpc_dictionary_set_uint64(v12, "flags", a4);
  xpc_dictionary_set_uuid(v12, "uuids", uuid);
  -[PKDaemonClient sendSynchronously:request:retry:reply:](self, "sendSynchronously:request:retry:reply:", (a4 >> 10) & 1, v12, 1, v10);

}

- (void)sendSynchronously:(BOOL)a3 request:(id)a4 retry:(BOOL)a5 reply:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  xpc_object_t v15;
  xpc_object_t v16;
  uint64_t uint64;
  int v18;
  NSObject *v19;
  OS_xpc_object *pkd;
  NSObject *replyQueue;
  _QWORD handler[4];
  id v23;
  void (**v24)(_QWORD, _QWORD);
  id v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  PKDaemonClient *v32;
  uint64_t v33;

  v7 = a5;
  v8 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1AF25736C;
  v27[3] = &unk_1E5F40F00;
  objc_copyWeak(&v29, &location);
  v13 = v11;
  v28 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45AEB8](v27);
  if (v8)
  {
    v15 = xpc_connection_send_message_with_reply_sync(self->_pkd, v10);
    v16 = (xpc_object_t)MEMORY[0x1E0C81258];
    if (v15 == (xpc_object_t)MEMORY[0x1E0C81258] && v7)
    {
      uint64 = xpc_dictionary_get_uint64(v10, "flags");
      xpc_dictionary_set_uint64(v10, "flags", uint64 & 0xFFFFFFFFFFFF7FFFLL);
      v18 = 1;
      while (1)
      {
        pklog_handle_for_category(1);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = self;
          _os_log_error_impl(&dword_1AF254000, v19, OS_LOG_TYPE_ERROR, "%@: retrying sync request", buf, 0xCu);
        }

        v15 = xpc_connection_send_message_with_reply_sync(self->_pkd, v10);
        if (v15 != v16)
          break;
        if (--v18)
        {
          v15 = v16;
          break;
        }
      }
    }
    ((void (**)(_QWORD, xpc_object_t))v14)[2](v14, v15);

  }
  else
  {
    pkd = self->_pkd;
    replyQueue = self->_replyQueue;
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = sub_1AF26F2B4;
    handler[3] = &unk_1E5F40F50;
    objc_copyWeak(&v25, &location);
    v26 = v7;
    v23 = v10;
    v24 = v14;
    xpc_connection_send_message_with_reply(pkd, v23, replyQueue, handler);

    objc_destroyWeak(&v25);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (id)request:(const char *)a3
{
  xpc_object_t v5;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "request", a3);
  xpc_dictionary_set_uint64(v5, "version", -[PKDaemonClient protocolVersion](self, "protocolVersion"));
  return v5;
}

- (id)errorInReply:(id)a3
{
  id v3;
  uint64_t uint64;
  const char *string;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (MEMORY[0x1AF45B2D8]() == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 4;
LABEL_6:
    pkError(v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  uint64 = xpc_dictionary_get_uint64(v3, "errorcode");
  string = xpc_dictionary_get_string(v3, "error");
  if (uint64)
  {
    if (!string)
    {
      pkError(uint64, CFSTR("unknown error returned by PlugInKit subsystem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = uint64;
    goto LABEL_6;
  }
  if (string)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("pkd reported error without a code: %s"), string);
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)convertFromXPC:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[PKDaemonClient protocolVersion](self, "protocolVersion") == 3)
    v5 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  else
    v5 = 0;

  return v5;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

+ (id)convertToXPC:(id)a3 version:(unint64_t)a4
{
  if (a4 == 3)
    return (id)_CFXPCCreateXPCMessageWithCFObject();
  else
    return 0;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (PKDaemonClient)initWithServiceName:(const char *)a3 user:(unsigned int)a4
{
  uint64_t v4;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  xpc_connection_t mach_service;
  PKDaemonClient *v10;

  v4 = *(_QWORD *)&a4;
  if (a3)
    v6 = a3;
  else
    v6 = "com.apple.pluginkit.pkd";
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("pkd_client", v7);

  mach_service = xpc_connection_create_mach_service(v6, v8, 0);
  v10 = -[PKDaemonClient initWithConnection:queue:user:](self, "initWithConnection:queue:user:", mach_service, v8, v4);

  return v10;
}

- (PKDaemonClient)initWithServiceName:(const char *)a3
{
  return -[PKDaemonClient initWithServiceName:user:](self, "initWithServiceName:user:", a3, 0);
}

- (PKDaemonClient)initWithConnection:(id)a3 queue:(id)a4 user:(unsigned int)a5
{
  id v9;
  id v10;
  PKDaemonClient *v11;
  PKDaemonClient *v12;
  _xpc_connection_s *pkd;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKDaemonClient;
  v11 = -[PKDaemonClient init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_replyQueue, a4);
    objc_storeStrong((id *)&v12->_pkd, a3);
    objc_initWeak(&location, v12);
    pkd = v12->_pkd;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = sub_1AF26E760;
    v18 = &unk_1E5F40ED8;
    objc_copyWeak(&v19, &location);
    xpc_connection_set_event_handler(pkd, &v15);
    if (a5)
      xpc_connection_set_target_uid();
    -[PKDaemonClient setProtocolVersion:](v12, "setProtocolVersion:", 3, v15, v16, v17, v18);
    xpc_connection_resume(v12->_pkd);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)rawConnection
{
  return self->_pkd;
}

- (void)addPlugIns:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKDaemonClient request:paths:](self, "request:paths:", "add", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDaemonClient send:reply:](self, "send:reply:", v7, v6);

}

- (void)removePlugIns:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKDaemonClient request:paths:](self, "request:paths:", "remove", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDaemonClient send:reply:](self, "send:reply:", v7, v6);

}

- (void)bulkPlugins:(unint64_t)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKDaemonClient request:](self, "request:", "bulk");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v7, "flags", a3);
  -[PKDaemonClient send:reply:](self, "send:reply:", v7, v6);

}

- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 environment:(id)a6 languages:(id)a7 persona:(id)a8 sandbox:(id)a9 reply:(id)a10
{
  _BOOL8 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  id v29;
  uint64_t v30;

  v14 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  -[PKDaemonClient request:](self, "request:", "ready");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v22, "flags", a5);
  if (v17)
  {
    v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v22, "environment", v23);

  }
  if (objc_msgSend(v18, "count"))
  {
    pklog_handle_for_category(1);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v28 = 138412290;
      v29 = v18;
      _os_log_impl(&dword_1AF254000, v24, OS_LOG_TYPE_INFO, "Setting app-specific languages: %@", (uint8_t *)&v28, 0xCu);
    }

    v25 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v22, "preferredlanguages", v25);

  }
  if (v19)
  {
    objc_msgSend(v19, "personaUniqueString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v19, "personaUniqueString");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v22, "persona", (const char *)-[NSObject UTF8String](v27, "UTF8String"));
    }
    else
    {
      pklog_handle_for_category(1);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1AF27745C();
    }

  }
  if (v20)
    xpc_dictionary_set_string(v22, "sandbox", (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
  -[PKDaemonClient set:plugins:](self, "set:plugins:", v22, v16);
  -[PKDaemonClient sendSynchronously:request:reply:](self, "sendSynchronously:request:reply:", v14, v22, v21);

}

- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 reply:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[PKDaemonClient request:](self, "request:", "access");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v12, "flags", a5);
  -[PKDaemonClient set:plugins:](self, "set:plugins:", v12, v11);

  -[PKDaemonClient sendSynchronously:request:reply:](self, "sendSynchronously:request:reply:", v7, v12, v10);
}

- (void)findPlugInByUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 uuid[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uuid = 0;
  v10 = 0;
  v6 = a4;
  v7 = a3;
  -[PKDaemonClient request:](self, "request:", "find");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUUIDBytes:", uuid);

  xpc_dictionary_set_uuid(v8, "uuids", uuid);
  -[PKDaemonClient send:reply:](self, "send:reply:", v8, v6);

}

- (void)findPlugInByPathURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  xpc_object_t xdict;

  v6 = a4;
  v7 = a3;
  -[PKDaemonClient request:](self, "request:", "find");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  xpc_dictionary_set_string(xdict, "paths", (const char *)objc_msgSend(v9, "UTF8String"));

  -[PKDaemonClient send:reply:](self, "send:reply:", xdict, v6);
}

- (void)setPluginAnnotations:(id)a3 annotations:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  xpc_object_t xdict;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKDaemonClient request:](self, "request:", "annotate");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  -[PKDaemonClient set:uuids:](self, "set:uuids:", xdict, v10);

  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(xdict, "annotations", v11);
  -[PKDaemonClient send:reply:](self, "send:reply:", xdict, v8);

}

- (void)bulkSetPluginAnnotations:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  xpc_object_t xdict;

  v6 = a4;
  v7 = a3;
  -[PKDaemonClient request:](self, "request:", "bulk-annotate");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(xdict, "annotations", v8);
  -[PKDaemonClient send:reply:](self, "send:reply:", xdict, v6);

}

- (void)holdPlugins:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  xpc_object_t v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PKDaemonClient *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12)
    -[PKDaemonClient request:paths:](self, "request:paths:", "lock", v12);
  else
    -[PKDaemonClient request:](self, "request:", "lock");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    xpc_dictionary_set_string(v16, "extensionpoint", (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
    if (objc_msgSend(v14, "count"))
    {
      v23 = self;
      v24 = a6;
      v17 = xpc_array_create(0, 0);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = v14;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v26;
        do
        {
          v21 = 0;
          if (v19 <= 1)
            v22 = 1;
          else
            v22 = v19;
          do
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v18);
            xpc_array_set_uint64(v17, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21++), "unsignedLongLongValue", v23, v24, (_QWORD)v25));
          }
          while (v22 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v19);
      }

      xpc_dictionary_set_value(v16, "platforms", v17);
      self = v23;
      a6 = v24;
    }
  }
  xpc_dictionary_set_uint64(v16, "flags", a6);
  -[PKDaemonClient sendSynchronously:request:reply:](self, "sendSynchronously:request:reply:", (a6 >> 3) & 1, v16, v15);

}

- (void)releaseHold:(id)a3 flags:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[PKDaemonClient request:](self, "request:", "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDaemonClient set:uuids:](self, "set:uuids:", v10, v11);
  xpc_dictionary_set_uint64(v10, "flags", a4);
  -[PKDaemonClient sendSynchronously:request:reply:](self, "sendSynchronously:request:reply:", (a4 >> 3) & 1, v10, v8);

}

- (id)request:(const char *)a3 paths:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PKDaemonClient request:](self, "request:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(v7, "paths", v8);
  return v7;
}

- (void)send:(id)a3 reply:(id)a4
{
  -[PKDaemonClient sendSynchronously:request:reply:](self, "sendSynchronously:request:reply:", 0, a3, a4);
}

- (void)sendSynchronously:(BOOL)a3 request:(id)a4 reply:(id)a5
{
  -[PKDaemonClient sendSynchronously:request:retry:reply:](self, "sendSynchronously:request:retry:reply:", a3, a4, 0, a5);
}

- (void)set:(id)a3 plugins:(id)a4
{
  id v5;
  id v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  id v11;
  xpc_object_t value;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v7 = xpc_array_create(0, 0);
  v8 = xpc_array_create(0, 0);
  v9 = xpc_array_create(0, 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1AF26F540;
  v13[3] = &unk_1E5F40F78;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v10 = v9;
  v11 = v7;
  value = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  xpc_dictionary_set_value(v6, "uuids", value);
  xpc_dictionary_set_value(v6, "paths", v11);
  xpc_dictionary_set_value(v6, "oneshotuuids", v10);

}

- (void)set:(id)a3 uuids:(id)a4
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unsigned __int8 uuid[8];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = xpc_array_create(0, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      if (v9 <= 1)
        v12 = 1;
      else
        v12 = v9;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        *(_QWORD *)uuid = 0;
        v19 = 0;
        objc_msgSend(v13, "getUUIDBytes:", uuid, (_QWORD)v14);
        xpc_array_set_uuid(v7, 0xFFFFFFFFFFFFFFFFLL, uuid);
        ++v11;
      }
      while (v12 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v9);
  }

  xpc_dictionary_set_value(v5, "uuids", v7);
}

- (OS_xpc_object)pkd
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPkd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReplyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_pkd, 0);
}

@end
