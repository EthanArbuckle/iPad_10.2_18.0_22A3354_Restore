@implementation PRDiagnosticsService

- (PRDiagnosticsService)init
{
  PRDiagnosticsService *v2;
  PRDiagnosticsService *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *protobufClients;
  std::recursive_mutex *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRDiagnosticsService;
  v2 = -[PRDiagnosticsService init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_protobufLock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new(NSMutableDictionary);
    protobufClients = v3->_protobufClients;
    v3->_protobufClients = v4;

    v6 = (std::recursive_mutex *)sub_1002CA108();
    sub_1002CA250(v6, v3);
  }
  return v3;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  int v28;
  _QWORD v29[4];
  id v30;
  int v31;
  id buf[2];

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003C8CA0(v5);
  v6 = objc_msgSend(v4, "processIdentifier");
  v7 = -[PRDiagnosticsService validateClientEntitlements:](self, "validateClientEntitlements:", v4);
  v8 = qword_10085F520;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003C8BC0(v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.nearbyd.protobuf-client")));
    if (v10 && (v11 = objc_opt_class(NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
    {
      v12 = objc_msgSend(v10, "BOOLValue");

      if (v12)
      {
        v13 = sub_100179020();
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        objc_msgSend(v4, "setRemoteObjectInterface:", v14);

        v15 = sub_100178F9C();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v4, "setExportedInterface:", v16);
        goto LABEL_19;
      }
    }
    else
    {

    }
    if (sub_10000A04C(v4))
    {
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#reg-assist, setExportedInterface,calling", (uint8_t *)buf, 2u);
      }
      v18 = sub_1001790A8();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_msgSend(v4, "setExportedInterface:", v19);

      v20 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#reg-assist, setExportedInterface,called", (uint8_t *)buf, 2u);
      }
      goto LABEL_20;
    }
    objc_msgSend(v4, "setRemoteObjectInterface:", 0);
    v21 = sub_100178E08();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v4, "setExportedInterface:", v16);
LABEL_19:

LABEL_20:
    objc_msgSend(v4, "setExportedObject:", self);
    objc_initWeak(buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000A0C4;
    v29[3] = &unk_1007F9E90;
    v31 = v6;
    objc_copyWeak(&v30, buf);
    objc_msgSend(v4, "setInterruptionHandler:", v29);
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_10000A19C;
    v26 = &unk_1007F9E90;
    v28 = v6;
    objc_copyWeak(&v27, buf);
    objc_msgSend(v4, "setInvalidationHandler:", &v23);
    objc_msgSend(v4, "resume", v23, v24, v25, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003C8C30(v6, v8);
LABEL_21:

  return v7;
}

- (NSArray)machServicesNames
{
  return (NSArray *)&off_10082BC98;
}

- (void)getChipInfo:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned int v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  char v14;
  __int16 v15;

  v3 = (void (**)(id, id))a3;
  v4 = sub_1002CA108();
  if ((sub_1002CCDEC((uint64_t)v4, (uint64_t)&v8) & 1) != 0)
  {
    v5 = objc_alloc((Class)PRChipInfo);
    WORD1(v7) = v15;
    LOBYTE(v7) = v14;
    v6 = objc_msgSend(v5, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:", v8, v9, v10, v11, v12, v13, v7);
    v3[2](v3, v6);

  }
  else
  {
    v3[2](v3, 0);
  }

}

- (void)getPreflightInfo:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v3 = sub_1002CA108();
  v4 = (void *)sub_1002CCDDC((uint64_t)v3);
  v5[2]();
  if (v4)

}

- (void)hasFailedRoseUpdate:(id)a3
{
  void *v3;
  uint64_t v4;
  void (**v5)(id, uint64_t);

  v5 = (void (**)(id, uint64_t))a3;
  v3 = sub_1002CA108();
  v4 = sub_1002CCDE4((uint64_t)v3);
  v5[2](v5, v4);

}

- (void)sendHelloSync:(unint64_t)a3 reply:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  id v7;
  id v8;
  _BYTE v9[112];
  char v10;

  v5 = (void (**)(id, id))a4;
  v6 = sub_1002CA108();
  sub_1002CA2F0((uint64_t)v6, a3, v9);
  if (v10)
  {
    v7 = objc_alloc((Class)PRHelloResponse);
    if (!v10)
      sub_10000BA44();
    v8 = objc_msgSend(v7, "initWithHelloResponse:", v9);
    v5[2](v5, v8);

  }
  else
  {
    v5[2](v5, 0);
  }
  sub_10000BA78((uint64_t)v9);

}

- (void)getPowerStatsSync:(unint64_t)a3 reply:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  id v7;
  id v8;
  _BYTE v9[60];
  char v10;

  v5 = (void (**)(id, id))a4;
  v6 = sub_1002CA108();
  sub_1002CCF28((uint64_t)v6, a3, (uint64_t)v9);
  if (v10)
  {
    v7 = objc_alloc((Class)PRGetPowerStatsResponse);
    if (!v10)
      sub_10000BA44();
    v8 = objc_msgSend(v7, "initWithGetPowerStatsResponse:", v9);
    v5[2](v5, v8);

  }
  else
  {
    v5[2](v5, 0);
  }

}

- (void)setRegulatoryMcc:(id)a3 reply:(id)a4
{
  void (**v5)(id, BOOL);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, BOOL))a4;
  v6 = v8;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRGlobalDebugSettings sharedSettings](PRGlobalDebugSettings, "sharedSettings"));
    objc_msgSend(v7, "setObject:forKey:", v8, PRDebugConfigArgMcc);

    v6 = v8;
  }
  v5[2](v5, v6 != 0);

}

- (void)setRegulatoryIsoCountry:(id)a3 reply:(id)a4
{
  void (**v5)(id, BOOL);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, BOOL))a4;
  v6 = v8;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRGlobalDebugSettings sharedSettings](PRGlobalDebugSettings, "sharedSettings"));
    objc_msgSend(v7, "setObject:forKey:", v8, PRDebugConfigArgIsoCountry);

    v6 = v8;
  }
  v5[2](v5, v6 != 0);

}

- (void)setRegulatoryAccessoryState:(id)a3 reply:(id)a4
{
  void (**v5)(id, BOOL);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, BOOL))a4;
  v6 = v8;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRGlobalDebugSettings sharedSettings](PRGlobalDebugSettings, "sharedSettings"));
    objc_msgSend(v7, "setObject:forKey:", v8, PRDebugConfigArgAccessoryState);

    v6 = v8;
  }
  v5[2](v5, v6 != 0);

}

- (void)triggerLogCollection:(int64_t)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  NSObject *v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const std::string::value_type *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[112];
  char v24;
  std::string v25;
  uint8_t v26[8];
  char v27;
  uint8_t buf[4];
  uint8_t *v29;

  v5 = (void (**)(id, uint64_t))a4;
  memset(&v25, 0, sizeof(v25));
  v6 = sub_100004784();
  sub_10000BC94(v23, (uint64_t)v6);
  if (v24)
  {
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (!v24)
        sub_10000BA44();
      sub_10038CB30((uint64_t)v23);
      if (v27 >= 0)
        v8 = v26;
      else
        v8 = *(uint8_t **)v26;
      *(_DWORD *)buf = 136315138;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cached Hello Response: %s", buf, 0xCu);
      if (v27 < 0)
        operator delete(*(void **)v26);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));

  v11 = (id)qword_10085F520;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)v26 = 67109120;
    *(_DWORD *)&v26[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "===== Current defaults (%d) =====", v26, 8u);
  }

  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &stru_1007F9ED0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "printableState"));

  v15 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "===== Findable Device =====", v26, 2u);
  }
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &stru_1007F9F10);
  v16 = objc_claimAutoreleasedReturnValue(+[NIServerFindingSession sharedServicePrintableState](NIServerFindingSession, "sharedServicePrintableState"));

  v17 = (void *)v16;
  v18 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "===== Finding Service =====", v26, 2u);
  }
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", &stru_1007F9F30);
  v19 = "sysdiagnose-triggered";
  switch(a3)
  {
    case 0:
      goto LABEL_19;
    case 1:
      std::string::assign(&v25, "user-triggered-non-fatal");
      v20 = 1;
      goto LABEL_23;
    case 2:
      std::string::assign(&v25, "user-triggered-fatal");
      goto LABEL_21;
    case 3:
      std::string::assign(&v25, "user-triggered-dump-all-existing-logs-if-crashlog");
      v20 = 2;
      goto LABEL_23;
    case 4:
      v19 = "user-triggered-dump-all-existing-logs";
LABEL_19:
      std::string::assign(&v25, v19);
      v20 = 3;
      goto LABEL_23;
    default:
LABEL_21:
      v20 = 0;
LABEL_23:
      v21 = sub_1002CA108();
      v22 = sub_1002CCDF4((uint64_t)v21, v20, (std::string::size_type)&v25);
      v5[2](v5, v22);

      sub_10000BA78((uint64_t)v23);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);

      return;
  }
}

- (void)setRoseGlobalConfigParams:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (v5)
  {
    v17 = 0;
    v8 = sub_100013398(v5, &v17);
    v9 = v17;
    if ((v8 & 1) == 0)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C8CDC((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
    v7[2](v7, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)getRoseChipPowerState:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t);
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;

  v3 = (void (**)(id, uint64_t, uint64_t))a3;
  v9 = 0;
  v4 = sub_1002CA108();
  if ((sub_1002CCF30((uint64_t)v4, (BOOL *)&v9 + 1) & 1) != 0)
  {
    if (!HIBYTE(v9))
    {
      v7 = 0;
LABEL_12:
      v8 = 1;
      goto LABEL_13;
    }
    v5 = sub_1002CA108();
    if (sub_1002CCF40((uint64_t)v5, &v9))
    {
      if (HIBYTE(v9))
        v6 = v9 == 0;
      else
        v6 = 0;
      v7 = v6;
      goto LABEL_12;
    }
  }
  v8 = 0;
  v7 = 0;
LABEL_13:
  v3[2](v3, v8, v7);

}

- (void)requestPowerChange:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v4 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v5 = sub_1002CA108();
  v6 = sub_1002CCF38((uint64_t)v5, v4);
  v7[2](v7, v6);

}

- (void)getChipType:(id)a3
{
  int v3;
  uint64_t v4;
  void (**v5)(id, uint64_t);

  v5 = (void (**)(id, uint64_t))a3;
  v3 = sub_100393C4C();
  if (v3)
    v4 = 2 * (v3 == 1);
  else
    v4 = 1;
  v5[2](v5, v4);

}

- (void)getChipPublicKey:(id)a3
{
  void *v3;
  CFDataRef v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v3 = sub_1002CA108();
  v4 = sub_1002CCF48((uint64_t)v3);
  v5[2]();
  if (v4)

}

- (void)setNarrowbandSarState:(int64_t)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a4;
  if (a3 == 3)
  {
    v7 = 2;
LABEL_8:
    v8 = sub_1002CA108();
    v6 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v8 + 136))(v8, v7);
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    v7 = 1;
    goto LABEL_8;
  }
  if (a3)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v5 = sub_1002CA108();
  v6 = (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 144))(v5);
LABEL_9:
  v9[2](v9, v6);

}

- (void)getDeepSleepState:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  int v12;
  const char *v13;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = sub_1002CA108();
  v5 = sub_1002CCF50((uint64_t)v4);
  v6 = v5;
  v7 = v5;
  v8 = qword_10085F520;
  v9 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (v7 > 0xFF)
  {
    if (v9)
    {
      if (v6 > 2u)
        v11 = "";
      else
        v11 = off_1007FA030[(char)v6];
      v12 = 136315138;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#deep-slp PRDiagnosticsService getDeepSleepState %s", (uint8_t *)&v12, 0xCu);
    }
    if (v6 >= 3u)
      v10 = 0;
    else
      v10 = v6 + 1;
  }
  else
  {
    if (v9)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#deep-slp PRDiagnosticsService getDeepSleepState nullopt", (uint8_t *)&v12, 2u);
    }
    v10 = 0;
  }
  v3[2](v3, v10);

}

- (void)startStreamingProtobufDataForClientId:(id)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(&self->_protobufLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_protobufClients, "setObject:forKeyedSubscript:", v7, v8);

  os_unfair_lock_unlock(&self->_protobufLock);
  v6[2](v6, 1);

}

- (void)stopStreamingProtobufDataForClientId:(id)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(&self->_protobufLock);
  -[NSMutableDictionary removeObjectForKey:](self->_protobufClients, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(&self->_protobufLock);
  v6[2](v6, 1);

}

- (void)prepareForRegulatoryAssistance:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  uint8_t v9[8];
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#reg-assist, prepareForRegulatoryAssistance called.", v9, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = sub_10000A04C(v5);

  if ((v6 & 1) != 0)
  {
    v3[2](v3, 0);
  }
  else
  {
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("Insufficient entitlements.");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 999, v7));
    ((void (**)(id, void *))v3)[2](v3, v8);

  }
}

- (void)injectIsoCode:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *__p[2];
  char v25;
  uint8_t buf[4];
  id v27;

  v3 = a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#reg-assist, injectIsoCode called.", (uint8_t *)__p, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if ((sub_10000A04C(v5) & 1) != 0)
  {
    if (v3)
    {
      v6 = objc_retainAutorelease(v3);
      sub_10000BF04(__p, (char *)objc_msgSend(v6, "UTF8String"));
      v7 = sub_1002CA108();
      v8 = (*(uint64_t (**)(void *, void **))(*(_QWORD *)v7 + 128))(v7, __p);
      v9 = qword_10085F520;
      if ((v8 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#reg-assist, successfully inject iso code: %@.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        sub_1003C8D7C((uint64_t)v6, v9, v18, v19, v20, v21, v22, v23);
      }
      if (v25 < 0)
        operator delete(__p[0]);
    }
    else
    {
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003C8D40(v17);
    }
  }
  else
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003C8DE0((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (BOOL)validateClientEntitlements:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.nearbyd.diagnostics")));
  if (v4 && (v5 = objc_opt_class(NSNumber, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)handleXPCDisconnection
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PRDiagnosticsService] xpc disconnection", v3, 2u);
  }
}

- (void)publishBytes:(char *)a3 amount:(unint64_t)a4
{
  os_unfair_lock_s *p_protobufLock;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (a4 >= 0x3E9)
    sub_1003C8E44();
  p_protobufLock = &self->_protobufLock;
  os_unfair_lock_lock(&self->_protobufLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_protobufClients;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_protobufClients, "objectForKeyedSubscript:", v13, (_QWORD)v16));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remoteObjectProxy"));
        objc_msgSend(v15, "consumeProtobufBytes:", v8);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_protobufLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->machServicesNames, 0);
  objc_storeStrong((id *)&self->_protobufClients, 0);
}

@end
