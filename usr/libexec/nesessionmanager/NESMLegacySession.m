@implementation NESMLegacySession

- (int)type
{
  if (self)
    LODWORD(self) = self->_sessionType;
  return (int)self;
}

- (void)dealloc
{
  objc_super v3;

  if (self && self->_bridge)
  {
    if (qword_1000CF8F0 != -1)
      dispatch_once(&qword_1000CF8F0, &stru_1000BE2C0);
    (*(void (**)(_ne_sm_bridge *))(qword_1000CF8E8 + 8))(self->_bridge);
    self->_bridge = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NESMLegacySession;
  -[NESMSession dealloc](&v3, "dealloc");
}

- (void)handleStartMessage:(id)a3
{
  id v4;
  xpc_object_t value;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  char *v22;
  SEL v23;
  id v24;
  void *v25;
  SEL v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  const char *v32;
  id v33;
  uint64_t v34;
  id v35;
  CFStringRef v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  CFStringRef v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  SEL v59;
  id Property;
  const char *v61;
  int v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  _QWORD v69[6];
  int v70;
  int v71;
  objc_super v72;
  uint8_t buf[8];
  NSString *v74;

  v4 = a3;
  value = xpc_dictionary_get_value(v4, "SessionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (qword_1000CF8F0 != -1)
    dispatch_once(&qword_1000CF8F0, &stru_1000BE2C0);
  v72.receiver = self;
  v72.super_class = (Class)NESMLegacySession;
  -[NESMSession handleStartMessage:](&v72, "handleStartMessage:", v4, qword_1000CF8E8);
  v7 = &AnalyticsSendEventLazy_ptr;
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
    v9 = isa_nsdictionary(v8);
    if ((v9 & 1) != 0)
    {
      v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v8);

      if (v11)
        goto LABEL_12;
    }
    else
    {
      v12 = ne_log_obj(v9, v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to convert the XPC options dictionary to a CFDictionary", buf, 2u);
      }

    }
  }
  v11 = objc_alloc_init((Class)NSMutableDictionary);
LABEL_12:
  v66 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("OutgoingInterface")));
  if ((isa_nsstring(v14) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primaryPhysicalInterface"));

    if (!v16)
      goto LABEL_16;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "primaryPhysicalInterface"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "interfaceName"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("OutgoingInterface"));

  }
LABEL_16:
  v19 = v11;
  v21 = v19;
  v65 = v6;
  if (!self)
  {

    v58 = 0;
    Property = 0;
    goto LABEL_73;
  }
  v22 = (char *)objc_msgSend(objc_getProperty(self, v20, 360, 1), "type");
  v24 = objc_msgSend(objc_getProperty(self, v23, 360, 1), "passwordKeychainItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v27 = objc_msgSend(objc_getProperty(self, v26, 360, 1), "username");
  v68 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (v21)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kSCEntNetIPSec));
    if (isa_nsdictionary(v28))
      v29 = objc_msgSend(v28, "mutableCopy");
    else
      v29 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kSCEntNetPPP));

    if (isa_nsdictionary(v31))
      v30 = objc_msgSend(v31, "mutableCopy");
    else
      v30 = 0;

    v7 = &AnalyticsSendEventLazy_ptr;
    if (v29)
    {
      if (v30)
        goto LABEL_27;
LABEL_30:
      v30 = objc_alloc_init((Class)v7[218]);
      if (v25)
        goto LABEL_28;
      goto LABEL_31;
    }
  }
  else
  {
    v30 = 0;
  }
  v29 = objc_alloc_init((Class)v7[218]);
  if (!v30)
    goto LABEL_30;
LABEL_27:
  if (v25)
  {
LABEL_28:
    v67 = objc_msgSend(v25, "copyPassword");
    goto LABEL_32;
  }
LABEL_31:
  v67 = 0;
LABEL_32:
  if ((unint64_t)(v22 - 1) <= 1)
  {
    v33 = objc_msgSend(objc_getProperty(self, v32, 360, 1), "sharedSecretKeychainItem");
    v34 = objc_claimAutoreleasedReturnValue(v33);

    v25 = (void *)v34;
  }
  if (v25)
    v35 = objc_msgSend(v25, "copyPassword");
  else
    v35 = 0;
  if (v68)
  {
    if (v22 == (char *)1)
    {
      v36 = kSCPropNetIPSecXAuthName;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kSCPropNetIPSecXAuthName));
      v38 = isa_nsstring(v37);

      if ((v38 & 1) != 0)
        goto LABEL_45;
      v39 = v29;
      goto LABEL_44;
    }
    if (v22 == (char *)2)
    {
      v36 = kSCPropNetPPPAuthName;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", kSCPropNetPPPAuthName));
      v41 = isa_nsstring(v40);

      if ((v41 & 1) == 0)
      {
        v39 = v30;
LABEL_44:
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v68, v36);
      }
    }
  }
LABEL_45:
  if (v67)
  {
    if (v22 == (char *)1)
    {
      v42 = kSCPropNetIPSecXAuthPassword;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kSCPropNetIPSecXAuthPassword));
      v44 = isa_nsstring(v43);

      if ((v44 & 1) == 0)
      {
        v45 = v29;
LABEL_52:
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v67, v42);
      }
    }
    else if (v22 == (char *)2)
    {
      v42 = kSCPropNetPPPAuthPassword;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", kSCPropNetPPPAuthPassword));
      v47 = isa_nsstring(v46);

      if ((v47 & 1) == 0)
      {
        v45 = v30;
        goto LABEL_52;
      }
    }
  }
  if (v35)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kSCPropNetIPSecSharedSecret));
    v49 = isa_nsstring(v48);

    if ((v49 & 1) == 0)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, kSCPropNetIPSecSharedSecret);
  }
  if (v21 && v22 == (char *)1)
  {
    if (!v29)
      v29 = objc_alloc_init((Class)NSMutableDictionary);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", NEVPNConnectionStartOptionUsername));
    v51 = isa_nsstring(v50);

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", NEVPNConnectionStartOptionUsername));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v52, kSCPropNetIPSecXAuthName);

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", NEVPNConnectionStartOptionPassword));
    v54 = isa_nsstring(v53);

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", NEVPNConnectionStartOptionPassword));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v55, kSCPropNetIPSecXAuthName);

    }
    *(_QWORD *)buf = NEVPNConnectionStartOptionPassword;
    v74 = NEVPNConnectionStartOptionUsername;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 2));
    objc_msgSend(v21, "removeObjectsForKeys:", v56);

  }
  else if (!v21)
  {
    if (objc_msgSend(v29, "count") || objc_msgSend(v30, "count"))
      v57 = objc_alloc_init((Class)NSMutableDictionary);
    else
      v57 = 0;
    goto LABEL_67;
  }
  v57 = v21;
LABEL_67:
  if (objc_msgSend(v30, "count"))
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v30, kSCEntNetPPP);
  if (v29 && objc_msgSend(v29, "count"))
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v29, kSCEntNetIPSec);
  v58 = v57;

  Property = objc_getProperty(self, v59, 360, 1);
LABEL_73:
  if (objc_msgSend(Property, "type") == (id)2)
  {
    v62 = xpc_dictionary_copy_mach_send(v66, "SessionBootstrapPort");
    v63 = xpc_dictionary_copy_mach_send(v66, "SessionAuditSessionPort");
  }
  else
  {
    v62 = 0;
    v63 = 0;
  }
  if (self)
    objc_setProperty_atomic(self, v61, v58, 384);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100063404;
  v69[3] = &unk_1000BE2A0;
  v69[4] = self;
  v69[5] = v64;
  v70 = v62;
  v71 = v63;
  sub_10005EA68((uint64_t)self, v69);

}

- (void)handleStopMessageWithReason:(int)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NESMLegacySession;
  -[NESMSession handleStopMessageWithReason:](&v5, "handleStopMessageWithReason:", *(_QWORD *)&a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006337C;
  v4[3] = &unk_1000BEB80;
  v4[4] = self;
  sub_10005EA68((uint64_t)self, v4);
}

- (BOOL)handleSleep
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000632D8;
  v3[3] = &unk_1000BEB80;
  v3[4] = self;
  sub_10005EA68((uint64_t)self, v3);
  return 1;
}

- (void)handleSleepTime:(double)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100063268;
  v3[3] = &unk_1000BEA98;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  sub_10005EA68((uint64_t)self, v3);
}

- (void)handleWakeup
{
  NSObject *v3;
  _QWORD v4[5];
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000631F0;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000631FC;
  v4[3] = &unk_1000BEB80;
  v4[4] = self;
  sub_10005EA68((uint64_t)self, v4);
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NESMLegacySession;
  -[NESMSession handleChangeEventForInterface:newFlags:previousFlags:](&v13, "handleChangeEventForInterface:newFlags:previousFlags:", v8, a4, a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062E60;
  v10[3] = &unk_1000BE850;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  sub_10005EA68((uint64_t)self, v10);

}

- (void)handleSecuritySessionInfoRequest:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  NESMLegacySession *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100062D70;
  v5[3] = &unk_1000BEB58;
  v6 = a3;
  v7 = self;
  v4 = v6;
  sub_10005EA68((uint64_t)self, v5);

}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  NESMLegacySession *v8;
  int v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100062A38;
  v6[3] = &unk_1000BED20;
  v9 = a4;
  v7 = a3;
  v8 = self;
  v5 = v7;
  sub_10005EA68((uint64_t)self, v6);

}

- (void)install
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100061348;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (void)uninstall
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000611CC;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  objc_super v17;
  uint8_t buf[4];
  NESMLegacySession *v19;
  __int16 v20;
  unsigned int v21;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    v7 = ne_log_obj(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "VPN"));
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 1024;
      v21 = objc_msgSend(v9, "isEnabled");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: enabled = %d", buf, 0x12u);

    }
    v17.receiver = self;
    v17.super_class = (Class)NESMLegacySession;
    if (-[NESMSession handleUpdateConfiguration:](&v17, "handleUpdateConfiguration:", v6))
    {
      if (self && self->_sessionType == 2)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appVPN"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "protocol"));
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "VPN"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "protocol"));
        if (!self)
        {
LABEL_11:

          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100061150;
          v16[3] = &unk_1000BEB80;
          v16[4] = self;
          sub_10005EA68((uint64_t)self, v16);
          v14 = 1;
          goto LABEL_12;
        }
      }
      objc_setProperty_atomic(self, v12, v13, 360);
      goto LABEL_11;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)handleUserLogout
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000610D4;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (void)handleUserSwitch
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100061058;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (void)handleDeviceLock
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100060FDC;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (void)handleDeviceUnlock
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100060F60;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (void)handleInstalledAppsChanged
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000607E0;
  v2[3] = &unk_1000BEB80;
  v2[4] = self;
  sub_10005EA68((uint64_t)self, v2);
}

- (void)handleInitializeState
{
  NESMLegacySession *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  const __CFString *v16;
  void *v17;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%d"), v5, -[NESMLegacySession type](v2, "type")));
  -[NESMSession setAuxiliaryDataKey:](v2, "setAuxiliaryDataKey:", v6);

  -[NESMSession setupFromAuxiliaryData](v2, "setupFromAuxiliaryData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](v2, "lastDisconnectError"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NEVPNConnectionErrorDomainIPSec"));

    if (v10)
    {
      v16 = CFSTR("LastCause");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
      v17 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10005E9E8;
      v14[3] = &unk_1000BEB58;
      v14[4] = v2;
      v13 = v12;
      v15 = v13;
      sub_10005EA68((uint64_t)v2, v14);

    }
  }

  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userOptions, 0);
  objc_storeStrong((id *)&self->_agentPIDs, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
