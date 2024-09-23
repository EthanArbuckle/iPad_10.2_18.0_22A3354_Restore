@implementation NESMAppPushSession

- (NESMAppPushSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  NESMAppPushSession *v4;
  const char *v5;
  NESMAppPushSession *v6;
  SEL v7;
  SEL v8;
  void *v9;
  SEL v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v15;
  __int128 block;
  void (*v17)(uint64_t, const char *);
  void *v18;
  NESMAppPushSession *v19;

  v15.receiver = self;
  v15.super_class = (Class)NESMAppPushSession;
  v4 = -[NESMSession initWithConfiguration:andServer:](&v15, "initWithConfiguration:andServer:", a3, a4);
  v6 = v4;
  if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0, 384);
    -[NESMAppPushSession setActive:](v6, "setActive:", 0);
    v6->_installed = 0;
    objc_setProperty_atomic(v6, v7, 0, 360);
    objc_setProperty_atomic(v6, v8, 0, 416);
    v6->_refCount = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_setProperty_atomic(v6, v10, v9, 392);

    v6->_currentSSIDMatchStaus = 0;
    v6->_currentPLTEMatchStaus = 0;
    v11 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](v6, "queue"));
    *(_QWORD *)&block = _NSConcreteStackBlock;
    *((_QWORD *)&block + 1) = 3221225472;
    v17 = sub_10001463C;
    v18 = &unk_1000BEB80;
    v19 = v6;
    dispatch_async(v11, &block);

    v6->_providerInstalled = 1;
    v4 = (NESMAppPushSession *)-[NESMAppPushSession addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", v6, CFSTR("active"), 5, 0);
  }
  v12 = ne_log_obj(v4, v5);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(block) = 138412290;
    *(_QWORD *)((char *)&block + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ initialized app push provider session", (uint8_t *)&block, 0xCu);
  }

  return v6;
}

- (int)type
{
  return 8;
}

- (void)install
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  NESMAppPushSession *v7;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received install", (uint8_t *)&v6, 0xCu);
  }

  if (self)
  {
    self->_installed = 1;
    sub_10001316C((uint64_t)self, v5);
  }
}

- (void)installPended
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  NESMAppPushSession *v9;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received install pending", buf, 0xCu);
  }

  v5 = dispatch_time(0, 2000000000);
  v6 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014564;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_after(v5, v6, block);

}

- (void)uninstall
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NESMAppPushSession *v6;

  if (self)
    self->_installed = 0;
  v3 = ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received uninstall", (uint8_t *)&v5, 0xCu);
  }

}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v9;
  uint8_t buf[4];
  NESMAppPushSession *v11;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ deallocating session", buf, 0xCu);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v5, 392, 1), "removeAllObjects");
    sub_100011DD8(self, v6);
    sub_100011EB4(self, v7);
    sub_100012000((uint64_t)self);
    sub_100011C14(self, v8);
  }
  else
  {
    objc_msgSend(0, "removeAllObjects");
  }
  v9.receiver = self;
  v9.super_class = (Class)NESMAppPushSession;
  -[NESMSession dealloc](&v9, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  NESMAppPushSession *v10;
  const char *v11;
  id v12;
  id Property;
  NESMAppPushSession *v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  const __CFString *v22;
  _QWORD block[5];
  uint8_t buf[4];
  NESMAppPushSession *v25;
  __int16 v26;
  const __CFString *v27;

  v9 = a3;
  v10 = (NESMAppPushSession *)a4;
  v12 = a5;
  if (self)
    Property = objc_getProperty(self, v11, 368, 1);
  else
    Property = 0;
  v14 = (NESMAppPushSession *)Property;
  if (v14 == v10)
  {
    v15 = objc_msgSend(v9, "isEqualToString:", CFSTR("status"));

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100014240;
      block[3] = &unk_1000BEB80;
      block[4] = self;
      dispatch_async(v16, block);

      goto LABEL_14;
    }
  }
  else
  {

  }
  if (v10 == self)
  {
    v17 = objc_msgSend(v9, "isEqualToString:", CFSTR("active"));
    if ((_DWORD)v17)
    {
      v19 = ne_log_obj(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = -[NESMAppPushSession active](self, "active");
        v22 = CFSTR("inactive");
        if (v21)
          v22 = CFSTR("active");
        *(_DWORD *)buf = 138412546;
        v25 = self;
        v26 = 2112;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ session became %@", buf, 0x16u);
      }

      -[NESMSession notifyChangedExtendedStatus](self, "notifyChangedExtendedStatus");
    }
  }
LABEL_14:

}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int refCount;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  id Property;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  objc_super v39;
  uint8_t buf[4];
  NESMAppPushSession *v41;
  __int16 v42;
  unsigned int v43;

  v5 = a3;
  if (v5)
  {
    v39.receiver = self;
    v39.super_class = (Class)NESMAppPushSession;
    v6 = (id)-[NESMSession handleUpdateConfiguration:](&v39, "handleUpdateConfiguration:", v5);
    if ((_DWORD)v6)
    {
      v8 = ne_log_obj(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (self)
          refCount = self->_refCount;
        else
          refCount = 0;
        *(_DWORD *)buf = 138412546;
        v41 = self;
        v42 = 1024;
        v43 = refCount;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ configuration changed [ref count:%u]", buf, 0x12u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appPush"));
      v13 = objc_msgSend(v12, "isEnabled");

      if ((v13 & 1) != 0)
      {
        if (-[NESMAppPushSession active](self, "active"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appPush"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "providerConfiguration"));

          if (self)
          {
            Property = objc_getProperty(self, v20, 384, 1);
            if (Property)
            {
              v22 = Property;
              v23 = v19;
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "remotePluginObject"));
              objc_msgSend(v24, "setProviderConfiguration:", v23);

            }
          }

        }
        if (self)
        {
          sub_10001390C(self, v16);
          sub_100013978(self, v25);
          sub_100013A2C((uint64_t)self, v26);
          sub_100013CF4(self, v27);
        }
      }
      else
      {
        v33 = ne_log_obj(v14, v15);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = self;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@ configuration is disabled", buf, 0xCu);
        }

        if (self)
        {
          self->_refCount = 0;
          sub_10001390C(self, v35);
          sub_100013978(self, v36);
          sub_100011B08((uint64_t)self, v37);
        }
      }
      LOBYTE(self) = 1;
      goto LABEL_25;
    }
LABEL_19:
    LOBYTE(self) = 0;
    goto LABEL_25;
  }
  v28 = ne_log_obj(0, v4);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@ configuration is removed/app uninstalled", buf, 0xCu);
  }

  if (self)
  {
    self->_refCount = 0;
    sub_10001390C(self, v30);
    sub_100013978(self, v31);
    sub_100011B08((uint64_t)self, v32);
    goto LABEL_19;
  }
LABEL_25:

  return (char)self;
}

- (id)copyExtendedStatus
{
  id v3;
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v8.receiver = self;
  v8.super_class = (Class)NESMAppPushSession;
  v4 = -[NESMSession copyExtendedStatus](&v8, "copyExtendedStatus");
  v5 = objc_msgSend(v3, "initWithDictionary:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NESMAppPushSession active](self, "active")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("IsAppPushActive"));

  return v5;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t reply;
  id v7;
  void *v8;
  void *v9;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v11;
  xpc_object_t xdict;

  xdict = a3;
  reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    v7 = -[NESMAppPushSession copyExtendedStatus](self, "copyExtendedStatus");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
      xpc_dictionary_set_value(reply, "SessionInfo", v9);

    }
  }
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v11, reply);

}

- (void)handleSendInfoMessage:(id)a3 withType:(int)a4
{
  id v6;
  void *v7;
  xpc_object_t value;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void ***v14;
  uint64_t v15;
  void ***v16;
  NSObject *v17;
  xpc_object_t reply;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  const __CFString *v40;
  _UNKNOWN **v41;
  __int128 block;
  void (*v43)(uint64_t);
  void *v44;
  NESMAppPushSession *v45;
  id v46;
  void ***v47;

  v6 = a3;
  v7 = v6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10001361C;
  v38 = sub_10001362C;
  v39 = 0;
  if (a4 == 5)
  {
    value = xpc_dictionary_get_value(v6, "SessionAppPushCallInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    v10 = v9;
    if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v11 = (void *)_CFXPCCreateCFObjectFromXPCObject(v10);
      v12 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        v28 = _NSConcreteStackBlock;
        v29 = 3221225472;
        v30 = sub_100013634;
        v31 = &unk_1000BD6A0;
        v32 = v7;
        v33 = &v34;
        v13 = v11;
        v14 = &v28;
        v16 = v14;
        if (self)
        {
          if (self->_active)
          {
            v17 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue", v28, v29));
            *(_QWORD *)&block = _NSConcreteStackBlock;
            *((_QWORD *)&block + 1) = 3221225472;
            v43 = sub_1000137A0;
            v44 = &unk_1000BECA8;
            v45 = self;
            v47 = v16;
            v46 = v13;
            dispatch_async(v17, &block);

          }
          else
          {
            v25 = ne_log_obj(v14, v15);
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(_QWORD *)((char *)&block + 4) = self;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@ cannot send outgoing call message for inactive  session", (uint8_t *)&block, 0xCu);
            }

            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NEAppPushErrorDomain, 4, 0, v28, v29));
            v30((uint64_t)v16, v27);

          }
        }

        reply = v32;
      }
      else
      {
        reply = xpc_dictionary_create_reply(v7);
        v40 = CFSTR("AppPushSendCallInfoErrorCode");
        v41 = &off_1000C1678;
        v19 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        v20 = (void *)v35[5];
        v35[5] = v19;

        v21 = v35[5];
        if (v21)
        {
          v22 = (void *)_CFXPCCreateXPCObjectFromCFObject(v21);
          xpc_dictionary_set_value(reply, "SessionAppPushSendMessageResult", v22);

        }
        remote_connection = xpc_dictionary_get_remote_connection(v7);
        v24 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
        xpc_connection_send_message(v24, reply);

      }
    }

  }
  _Block_object_dispose(&v34, 8);

}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  id Property;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  dispatch_time_t v26;
  NSObject *v27;
  _BYTE v28[24];
  void *v29;
  NESMAppPushSession *v30;

  v7 = a5;
  v9 = v7;
  if (!a4 || v7)
  {
    v18 = ne_log_obj(v7, v8);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "appPush"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "providerBundleIdentifier"));
      *(_DWORD *)v28 = 138412802;
      *(_QWORD *)&v28[4] = self;
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v22;
      *(_WORD *)&v28[22] = 2112;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: failed to start provider %@. error: %@", v28, 0x20u);

    }
    if (v9)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("NEAgentErrorDomain")) & 1) != 0)
      {
        v25 = objc_msgSend(v9, "code");

        if (v25 == (id)2)
        {
          if (!self)
            goto LABEL_17;
          if (self->_refCount)
          {
            v26 = dispatch_time(0, 15000000000);
            v27 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
            *(_QWORD *)v28 = _NSConcreteStackBlock;
            *(_QWORD *)&v28[8] = 3221225472;
            *(_QWORD *)&v28[16] = sub_1000130A8;
            v29 = &unk_1000BEB80;
            v30 = self;
            dispatch_after(v26, v27, v28);

            goto LABEL_17;
          }
        }
      }
      else
      {

      }
    }
    sub_100011D08(self, v23);
    goto LABEL_17;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appPush"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "providerConfiguration"));

  if (self)
  {
    Property = objc_getProperty(self, v13, 384, 1);
    if (Property)
    {
      v15 = Property;
      v16 = v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remotePluginObject"));
      objc_msgSend(v17, "startConnectionWithProviderConfig:", v16);

    }
  }

LABEL_17:
}

- (void)pluginDidDispose:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  NESMAppPushSession *v9;

  v4 = ne_log_obj(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ provider disposed", buf, 0xCu);
  }

  -[NESMAppPushSession setActive:](self, "setActive:", 0);
  v6 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001304C;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v6, block);

}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  return 1;
}

- (void)plugin:(id)a3 didReceiveProviderError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  int v14;
  NESMAppPushSession *v15;

  v6 = a3;
  v7 = a4;
  v9 = v7;
  if (!self->_active)
  {
    v10 = ne_log_obj(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ provider failed to start", (uint8_t *)&v14, 0xCu);
      }

      -[NESMAppPushSession setActive:](self, "setActive:", 0);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ provider started, session is active now", (uint8_t *)&v14, 0xCu);
      }

      -[NESMAppPushSession setActive:](self, "setActive:", 1);
      sub_100012D54(self, v13);
    }
  }

}

- (void)plugin:(id)a3 didReceiveProviderError:(id)a4 forMessageID:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  NESMAppPushSession *v19;
  __int16 v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v10 = ne_log_obj(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ provider ack'd message delivery for [%@]", buf, 0x16u);
  }

  v12 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012B80;
  block[3] = &unk_1000BE878;
  block[4] = self;
  v16 = v8;
  v17 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(v12, block);

}

- (void)plugin:(id)a3 didReceiveIncomingCallWithUserInfo:(id)a4
{
  id v6;
  uint64_t isKindOfClass;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  NESMAppPushSession *v19;
  NSObject *v20;

  v6 = a3;
  isKindOfClass = (uint64_t)a4;
  v9 = (void *)isKindOfClass;
  if (isKindOfClass
    && (v10 = objc_opt_class(NSDictionary),
        isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0))
  {
    v11 = ne_log_obj(isKindOfClass, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ provider reported incoming call", (uint8_t *)&v16, 0xCu);
    }

    v13 = v9;
    if (self)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      *(_QWORD *)&v16 = _NSConcreteStackBlock;
      *((_QWORD *)&v16 + 1) = 3221225472;
      v17 = sub_1000128A0;
      v18 = &unk_1000BEB58;
      v19 = self;
      v20 = v13;
      dispatch_async(v14, &v16);

    }
  }
  else
  {
    v15 = ne_log_obj(isKindOfClass, v8);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ provider reported incoming call with invalid user info", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)plugin:(id)a3 didReceivePushToTalkMessageWithUserInfo:(id)a4
{
  id v6;
  uint64_t isKindOfClass;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  NESMAppPushSession *v19;
  NSObject *v20;

  v6 = a3;
  isKindOfClass = (uint64_t)a4;
  v9 = (void *)isKindOfClass;
  if (isKindOfClass
    && (v10 = objc_opt_class(NSDictionary),
        isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0))
  {
    v11 = ne_log_obj(isKindOfClass, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ provider reported PushToTalk message", (uint8_t *)&v16, 0xCu);
    }

    v13 = v9;
    if (self)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      *(_QWORD *)&v16 = _NSConcreteStackBlock;
      *((_QWORD *)&v16 + 1) = 3221225472;
      v17 = sub_100012624;
      v18 = &unk_1000BEB58;
      v19 = self;
      v20 = v13;
      dispatch_async(v14, &v16);

    }
  }
  else
  {
    v15 = ne_log_obj(isKindOfClass, v8);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ provider reported PushToTalk message with invalid user info", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)didExtensionExit:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  int v9;
  NESMAppPushSession *v10;

  v4 = ne_log_obj(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ provider exited", (uint8_t *)&v9, 0xCu);
  }

  sub_100011D08(self, v6);
  sub_100011DD8(self, v7);
  sub_100012504(self, v8);
}

- (void)handleProviderStopped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  int v7;
  NESMAppPushSession *v8;

  v4 = ne_log_obj(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ provider stopped", (uint8_t *)&v7, 0xCu);
  }

  sub_100012504(self, v6);
}

- (void)handleProviderInstallationStatus:(id)a3 status:(int64_t)a4
{
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NESMAppPushSession *v11;
  __int16 v12;
  const __CFString *v13;

  v5 = CFSTR("uninstalled");
  if (a4 == 2)
    v5 = CFSTR("installed");
  v6 = a4 != 1 && a4 == 2;
  if (a4 == 1)
    v7 = CFSTR("installing");
  else
    v7 = v5;
  self->_providerInstalled = v6;
  v8 = ne_log_obj(self, a2);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ provider software installation status changed to [%@]", (uint8_t *)&v10, 0x16u);
  }

  if (self->_providerInstalled && self->_refCount && !self->_installed)
    sub_1000114D8((uint64_t)self, 1);
}

- (void)didReceiveStatusChangeWithInterface:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  unint64_t currentPLTEMatchStaus;
  const __CFString *v8;
  const __CFString *v9;
  unsigned int refCount;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  int v21;
  NESMAppPushSession *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  unsigned int v28;

  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      currentPLTEMatchStaus = self->_currentPLTEMatchStaus;
      objc_opt_self(NESMAppPushSession);
      if (currentPLTEMatchStaus > 2)
        v8 = CFSTR("unknown");
      else
        v8 = off_1000BD6C0[currentPLTEMatchStaus];
    }
    else
    {
      objc_opt_self(NESMAppPushSession);
      v8 = CFSTR("Invalid");
    }
    objc_opt_self(NESMAppPushSession);
    if ((unint64_t)a3 > 2)
      v9 = CFSTR("unknown");
    else
      v9 = off_1000BD6C0[a3];
    if (self)
      refCount = self->_refCount;
    else
      refCount = 0;
    v21 = 138413058;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 1024;
    v28 = refCount;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ private LTE network match status changed from '%@' to '%@' [ref count:%u]", (uint8_t *)&v21, 0x26u);
  }

  if (a3 == 2)
  {
    if (self && self->_currentPLTEMatchStaus == 1)
    {
      --self->_refCount;
      self->_currentPLTEMatchStaus = 2;
      sub_100011B08((uint64_t)self, (uint64_t)v12);
      sub_100011C14(self, v20);
    }
  }
  else
  {
    if (a3 != 1)
      return;
    if (self)
    {
      if (self->_currentPLTEMatchStaus == 1)
      {
LABEL_22:
        if (self->_installed)
        {
          v16 = sub_100011618(self, v12);
          if ((v16 & 1) == 0)
          {
            v18 = ne_log_obj(v16, v17);
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v21 = 138412290;
              v22 = self;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ failed to set the scoping policy", (uint8_t *)&v21, 0xCu);
            }

          }
        }
        return;
      }
      ++self->_refCount;
      self->_currentPLTEMatchStaus = 1;
    }
    v13 = ne_log_obj(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (self)
        v15 = self->_refCount;
      else
        v15 = 0;
      v21 = 138412546;
      v22 = self;
      v23 = 1024;
      LODWORD(v24) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ requesting install for LTE match [ref count:%u]", (uint8_t *)&v21, 0x12u);
    }

    sub_1000114D8((uint64_t)self, 0);
    if (self)
      goto LABEL_22;
  }
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicySession, 0);
  objc_storeStrong((id *)&self->_outgoingMessageCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_plteMatchMonitor, 0);
  objc_storeStrong((id *)&self->_ssidMatchMonitor, 0);
  objc_storeStrong((id *)&self->_providerWakeTimer, 0);
}

+ (BOOL)hasRequiredFrameworks
{
  uint64_t v2;

  v2 = objc_opt_class(CoreTelephonyClient);
  if (v2)
  {
    v2 = objc_opt_class(CXNetworkExtensionMessageController);
    if (v2)
    {
      v2 = objc_opt_class(MCProfileConnection);
      if (v2)
        LOBYTE(v2) = objc_opt_class(SWWakingTimer) != 0;
    }
  }
  return v2;
}

@end
