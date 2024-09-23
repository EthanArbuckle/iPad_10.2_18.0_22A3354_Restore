@implementation CLUDPListenerHelper

- (CLUDPListenerHelper)initWith:(int)a3 conformanceMode:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  CLUDPListenerHelper *v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  objc_super v11;
  _DWORD v12[2];
  __int16 v13;
  _BOOL4 v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  _BOOL4 v18;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)CLUDPListenerHelper;
  v6 = -[CLUDPListenerHelper init](&v11, "init");
  if (v6)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v7 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v16 = v5;
      v17 = 1024;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,startListener,port,%d,isConformanceMode,%d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10217A2F8);
      v12[0] = 67109376;
      v12[1] = v5;
      v13 = 1024;
      v14 = v4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,startListener,port,%d,isConformanceMode,%d", v12, 14);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper initWith:conformanceMode:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    -[CLUDPListenerHelper setPort:](v6, "setPort:", v5);
    -[CLUDPListenerHelper setAllSessions:](v6, "setAllSessions:", +[NSMutableSet set](NSMutableSet, "set"));
    -[CLUDPListenerHelper setConformanceMode:](v6, "setConformanceMode:", v4);
  }
  return v6;
}

- (void)stopListener
{
  NSObject *v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  const char *v10;
  uint8_t *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _WORD v16[8];
  uint8_t v17[128];
  uint8_t buf[1640];

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,stopListener", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v16[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,stopListener", v16, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper stopListener]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (-[CLUDPListenerHelper listener](self, "listener"))
  {
    -[NWUDPListener removeObserver:forKeyPath:](self->_listener, "removeObserver:forKeyPath:", self, CFSTR("error"));
    -[NWUDPListener removeObserver:forKeyPath:](self->_listener, "removeObserver:forKeyPath:", self, CFSTR("localEndpoint"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = -[CLUDPListenerHelper allSessions](self, "allSessions");
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("state"));
          objc_msgSend(v9, "cancel");
        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v6);
    }
    -[NSMutableSet removeAllObjects](-[CLUDPListenerHelper allSessions](self, "allSessions"), "removeAllObjects");

    -[CLUDPListenerHelper setListener:](self, "setListener:", 0);
  }
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,server dealloc", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,server dealloc", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLUDPListenerHelper stop](self, "stop");
  v6.receiver = self;
  v6.super_class = (Class)CLUDPListenerHelper;
  -[CLUDPListenerHelper dealloc](&v6, "dealloc");
}

- (void)callStatusHandler:(int)a3
{
  id v5;
  void (**v6)(id, id);

  if (-[CLUDPListenerHelper statusHandler](self, "statusHandler"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("CLUDPListenerHelper"), a3, 0);
    v6 = -[CLUDPListenerHelper statusHandler](self, "statusHandler");
    v6[2](v6, v5);
    CFRelease(v5);
  }
}

- (void)start:()basic_string<char
{
  void *v3;
  id v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  int v15;
  NSString *v16;
  uint8_t buf[4];
  NSString *v18;

  v6 = objc_alloc_init((Class)NWParameters);
  if (v6)
  {
    v3 = v6;
    if (qword_1022A0080 == -1)
      goto LABEL_3;
  }
  else
  {
    sub_101921CE8(qword_1022A0080 == -1);
  }
  dispatch_once(&qword_1022A0080, &stru_10217A2F8);
LABEL_3:
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,start", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    LOWORD(v15) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,start", &v15, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper start:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0)
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), data);
  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v9 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,UDPListener UUID %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v15 = 138412290;
    v16 = v8;
    LODWORD(v14) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,UDPListener UUID %@", &v15, v14);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper start:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  objc_msgSend(v3, "requireNetworkAgentWithDomain:type:", CFSTR("Cellular"), CFSTR("Em"));
  objc_msgSend(v3, "setAccount:", v8);
  self->_evaluator = (NWPathEvaluator *)objc_msgSend(objc_alloc((Class)NWPathEvaluator), "initWithEndpoint:parameters:", 0, v3);
  if (!-[CLUDPListenerHelper evaluator](self, "evaluator"))
    sub_101921E6C();
  -[NWPathEvaluator addObserver:forKeyPath:options:context:](self->_evaluator, "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 5, 0);
  CFRelease(v3);
}

- (void)stop
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,stop", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,stop", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper stop]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  if (-[CLUDPListenerHelper evaluator](self, "evaluator"))
  {
    -[NWPathEvaluator removeObserver:forKeyPath:](-[CLUDPListenerHelper evaluator](self, "evaluator"), "removeObserver:forKeyPath:", self, CFSTR("path"));

    -[CLUDPListenerHelper setEvaluator:](self, "setEvaluator:", 0);
  }
  -[CLUDPListenerHelper stopListener](self, "stopListener");
}

- (void)handleSession:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v5 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,handleSession", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,handleSession", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper handleSession:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 5, 0);
  -[NSMutableSet addObject:](-[CLUDPListenerHelper allSessions](self, "allSessions"), "addObject:", a3);
}

- (void)dictAddStringAsArray:(__CFDictionary *)a3 ofProp:(__CFString *)a4 withStr:(const char *)a5
{
  CFArrayRef v7;
  CFArrayRef v8;
  CLUDPListenerHelper *v9;
  SEL v10;
  __CFDictionary *v11;
  __CFString *v12;
  int v13;
  void *values;

  if (a5)
  {
    values = (void *)CFStringCreateWithCString(0, a5, 0x600u);
    if (values)
    {
      v7 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      if (v7)
      {
        v8 = v7;
        CFRelease(values);
        CFDictionarySetValue(a3, a4, v8);
        CFRelease(v8);
        return;
      }
    }
    else
    {
      v7 = (CFArrayRef)sub_101921FD0();
    }
    v9 = (CLUDPListenerHelper *)sub_101922134(v7);
    -[CLUDPListenerHelper dictAddIntAsArray:ofProp:withInt:](v9, v10, v11, v12, v13);
  }
}

- (void)dictAddIntAsArray:(__CFDictionary *)a3 ofProp:(__CFString *)a4 withInt:(int)a5
{
  CFArrayRef v7;
  CFArrayRef v8;
  CLUDPListenerHelper *v9;
  SEL v10;
  CFTypeRef cf;
  int valuePtr;

  valuePtr = a5;
  cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (cf)
  {
    v7 = CFArrayCreate(0, &cf, 1, &kCFTypeArrayCallBacks);
    if (v7)
    {
      v8 = v7;
      CFRelease(cf);
      CFDictionarySetValue(a3, a4, v8);
      CFRelease(v8);
      return;
    }
  }
  else
  {
    v7 = (CFArrayRef)sub_101922298(0);
  }
  v9 = (CLUDPListenerHelper *)sub_1019223FC(v7);
  -[CLUDPListenerHelper stopService](v9, v10);
}

- (void)stopService
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v3 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,stopService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,stopService", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper stopService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  if (-[CLUDPListenerHelper service](self, "service"))
  {
    CFRelease(-[CLUDPListenerHelper service](self, "service"));
    -[CLUDPListenerHelper setService:](self, "setService:", 0);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v4 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,Service stopped\"}", buf, 0x12u);
    }
  }
}

- (BOOL)startService:(__CFDictionary *)a3 interface:(__CFString *)a4
{
  NSObject *v7;
  __IPConfigurationService *v8;
  NSObject *v9;
  const char *v10;
  const char *v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v7 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nilr,#supl,#udp,startService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v14[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0088, 0, "#nilr,#supl,#udp,startService", v14, 2);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLUDPListenerHelper startService:interface:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  -[CLUDPListenerHelper setService:](self, "setService:", IPConfigurationServiceCreate(a4, a3));
  v8 = -[CLUDPListenerHelper service](self, "service");
  if (v8)
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v9 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v10 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,startService,success\"}";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x12u);
    }
  }
  else
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v9 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v10 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,startService,fail\"}";
      goto LABEL_15;
    }
  }
  return v8 != 0;
}

- (__CFDictionary)optionsDictCreate:(__CFDictionary *)a3 mtu:(int)a4 perform_nud:(BOOL)a5 ipv6_ll:(__CFString *)a6 enable_dad:(BOOL)a7
{
  CFNumberRef v11;
  unsigned int v12;
  CFDictionaryRef v13;
  __CFDictionary *v14;
  int valuePtr;
  void *values[2];
  __int128 v18;
  uint64_t v19;
  void *keys[2];
  __int128 v21;
  uint64_t v22;

  valuePtr = a4;
  v22 = 0;
  *(_OWORD *)keys = 0u;
  v21 = 0u;
  v19 = 0;
  *(_OWORD *)values = 0u;
  v18 = 0u;
  if (a4)
  {
    v11 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    keys[0] = (void *)kIPConfigurationServiceOptionMTU;
    values[0] = v11;
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  if (a5)
  {
    if (a7)
      goto LABEL_6;
  }
  else
  {
    *(_QWORD *)((unint64_t)keys | (8 * v12)) = kIPConfigurationServiceOptionPerformNUD;
    *(_QWORD *)((unint64_t)values & 0xFFFFFFFFFFFFFFF7 | (8 * (v12++ & 1))) = kCFBooleanFalse;
    if (a7)
    {
LABEL_6:
      if (!a3)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  keys[v12] = (void *)kIPConfigurationServiceOptionEnableDAD;
  values[v12++] = kCFBooleanFalse;
  if (a3)
  {
LABEL_7:
    keys[v12] = (void *)kIPConfigurationServiceOptionIPv6Entity;
    values[v12++] = a3;
  }
LABEL_8:
  if (a6)
  {
    keys[v12] = (void *)kIPConfigurationServiceOptionIPv6LinkLocalAddress;
    values[v12++] = a6;
  }
  v13 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v12, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v13)
    sub_101922560();
  v14 = v13;
  if (v11)
    CFRelease(v11);
  return v14;
}

- (void)startUDPListner
{
  id v2;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;

  if (qword_1022A0080 != -1)
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
  v4 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"startUDPListner\"}", buf, 0x12u);
  }
  v5 = objc_alloc_init((Class)NWParameters);
  if (v5)
  {
    v4 = v5;
    -[NSObject setLocalAddress:](v5, "setLocalAddress:", +[NWAddressEndpoint endpointWithHostname:port:](NWAddressEndpoint, "endpointWithHostname:port:", CFSTR("::"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_port)));
    v2 = objc_msgSend(0, "path");
    if (qword_1022A0080 == -1)
      goto LABEL_7;
  }
  else
  {
    sub_1019226C4();
  }
  dispatch_once(&qword_1022A0080, &stru_10217A2F8);
LABEL_7:
  v6 = qword_1022A0088;
  if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v2, "status");
    *(_DWORD *)buf = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#supl\", \"path.status\":%{public}d}", buf, 0x18u);
  }
  -[CLUDPListenerHelper setListener:](self, "setListener:", objc_msgSend(objc_alloc((Class)NWUDPListener), "initWithParameters:delegate:", v4, self));
  if (!-[CLUDPListenerHelper listener](self, "listener"))
  {
    sub_101922828();
LABEL_25:
    dispatch_once(&qword_1022A0080, &stru_10217A2F8);
LABEL_12:
    v8 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,listener already in progress\"}", buf, 0x12u);
    }
    return;
  }
  if (-[CLUDPListenerHelper listener](self, "listener"))
  {
    if (qword_1022A0080 == -1)
      goto LABEL_12;
    goto LABEL_25;
  }
  if (-[CLUDPListenerHelper service](self, "service"))
  {
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v9 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,service already up\"}", buf, 0x12u);
    }
    -[CLUDPListenerHelper stopService](self, "stopService");
  }
  -[NWUDPListener addObserver:forKeyPath:options:context:](-[CLUDPListenerHelper listener](self, "listener"), "addObserver:forKeyPath:options:context:", self, CFSTR("error"), 5, 0);
  -[NWUDPListener addObserver:forKeyPath:options:context:](-[CLUDPListenerHelper listener](self, "listener"), "addObserver:forKeyPath:options:context:", self, CFSTR("localEndpoint"), 5, 0);
  -[CLUDPListenerHelper callStatusHandler:](self, "callStatusHandler:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  CFMutableDictionaryRef Mutable;
  std::string *p_p;
  __CFDictionary *v18;
  NSObject *v19;
  std::string *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  std::string *v24;
  uint64_t v25;
  std::string *v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  NSObject *v33;
  uint64_t v34;
  std::string *v35;
  const char *v36;
  NSObject *v37;
  uint64_t v38;
  uint32_t v39;
  NSObject *v40;
  std::string *v41;
  uint64_t v42;
  std::string *v43;
  uint64_t v44;
  std::string *v45;
  uint64_t v46;
  unsigned int v47;
  _QWORD v48[5];
  std::string __p;
  uint8_t buf[8];
  _BYTE v51[10];
  __int16 v52;
  std::string *v53;
  __int16 v54;
  int v55;

  v9 = objc_opt_class(NWPathEvaluator, a2);
  if ((objc_opt_isKindOfClass(a4, v9) & 1) != 0)
  {
    v11 = objc_msgSend(a4, "path");
    if (qword_1022A0080 != -1)
      dispatch_once(&qword_1022A0080, &stru_10217A2F8);
    v12 = qword_1022A0088;
    if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v51 = 2082;
      *(_QWORD *)&v51[2] = "";
      v52 = 1026;
      LODWORD(v53) = objc_msgSend(v11, "status");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#supl\", \"path.status\":%{public}d}", buf, 0x18u);
    }
    if (objc_msgSend(v11, "status") == (id)1 && -[CLUDPListenerHelper conformanceMode](self, "conformanceMode"))
    {
      sub_1015A2E04(&__p, "fd00::1");
      sub_1001E4804(buf);
      sub_1000BCB64(*(uint64_t *)buf, "SuplUdpPushDeviceIP", &__p);
      v13 = *(std::__shared_weak_count **)v51;
      if (*(_QWORD *)v51)
      {
        v14 = (unint64_t *)(*(_QWORD *)v51 + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      a4 = Mutable;
      if (Mutable)
      {
        CFDictionarySetValue(Mutable, kSCPropNetIPv6ConfigMethod, kSCValNetIPv6ConfigMethodManual);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        -[CLUDPListenerHelper dictAddStringAsArray:ofProp:withStr:](self, "dictAddStringAsArray:ofProp:withStr:", a4, kSCPropNetIPv6Addresses, p_p);
        -[CLUDPListenerHelper dictAddIntAsArray:ofProp:withInt:](self, "dictAddIntAsArray:ofProp:withInt:", a4, kSCPropNetIPv6PrefixLength, 64);
        v18 = -[CLUDPListenerHelper optionsDictCreate:mtu:perform_nud:ipv6_ll:enable_dad:](self, "optionsDictCreate:mtu:perform_nud:ipv6_ll:enable_dad:", a4, 0, 1, 0, 1);
        CFRelease(a4);
        a4 = (id)-[CLUDPListenerHelper startService:interface:](self, "startService:interface:", v18, objc_msgSend(objc_msgSend(v11, "interface"), "interfaceName"));
        CFRelease(v18);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10217A2F8);
        v19 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEFAULT))
        {
          v20 = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v20 = (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v51 = 2082;
          *(_QWORD *)&v51[2] = "";
          v52 = 2082;
          v53 = v20;
          v54 = 1026;
          v55 = (int)a4;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,In Conformance Mode. Attempting to start additional service.\", \"IP\":%{public, location:escape_only}s, \"Started\":%{public}hhd}", buf, 0x22u);
        }
        if (objc_alloc_init((Class)NWParameters))
        {
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          return;
        }
        sub_101922ADC();
        abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Positioning/GPS/SUPL/CLUdpListener.mm", 365, "-[CLUDPListenerHelper observeValueForKeyPath:ofObject:change:context:]");
      }
      else
      {
        sub_10192298C();
        abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Positioning/GPS/SUPL/CLUdpListener.mm", 349, "-[CLUDPListenerHelper observeValueForKeyPath:ofObject:change:context:]");
      }
      __break(1u);
      goto LABEL_78;
    }
  }
  v21 = objc_opt_class(NWUDPListener, v10);
  if ((objc_opt_isKindOfClass(a4, v21) & 1) != 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("error")))
    {
      if (objc_msgSend(a4, "error"))
      {
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10217A2F8);
        v23 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
        {
          v24 = (std::string *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "error"), "description"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v51 = 2082;
          *(_QWORD *)&v51[2] = "";
          v52 = 2082;
          v53 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#supl\", \"listenerError\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10217A2F8);
        }
        v25 = qword_1022A0088;
        if (os_signpost_enabled((os_log_t)qword_1022A0088))
        {
          v26 = (std::string *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "error"), "description"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v51 = 2082;
          *(_QWORD *)&v51[2] = "";
          v52 = 2082;
          v53 = v26;
          v27 = "#supl";
          v28 = "{\"msg%{public}.0s\":\"#supl\", \"listenerError\":%{public, location:escape_only}s}";
          v29 = v25;
LABEL_63:
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v27, v28, buf, 0x1Cu);
        }
      }
    }
    else
    {
      if (objc_msgSend(a3, "isEqualToString:", CFSTR("localEndpoint")))
      {
        if (qword_1022A0080 == -1)
        {
LABEL_50:
          v34 = qword_1022A0088;
          if (!os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
            return;
          v35 = (std::string *)objc_msgSend(objc_msgSend(objc_msgSend(a4, "localEndpoint"), "port"), "UTF8String");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v51 = 2082;
          *(_QWORD *)&v51[2] = "";
          v52 = 2082;
          v53 = v35;
          v36 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,Listening\", \"NWAddressEndpoint\":%{public, location:escape_only}s}";
          v37 = v34;
          goto LABEL_68;
        }
LABEL_78:
        dispatch_once(&qword_1022A0080, &stru_10217A2F8);
        goto LABEL_50;
      }
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10217A2F8);
      v40 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_ERROR))
      {
        v41 = (std::string *)objc_msgSend(a3, "UTF8String");
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v51 = 2082;
        *(_QWORD *)&v51[2] = "";
        v52 = 2082;
        v53 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,unhandled listener\", \"keyPath\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10217A2F8);
      }
      v42 = qword_1022A0088;
      if (os_signpost_enabled((os_log_t)qword_1022A0088))
      {
        v43 = (std::string *)objc_msgSend(a3, "UTF8String");
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v51 = 2082;
        *(_QWORD *)&v51[2] = "";
        v52 = 2082;
        v53 = v43;
        v27 = "#nilr,#supl,#udp,unhandled listener";
        v28 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,unhandled listener\", \"keyPath\":%{public, location:escape_only}s}";
        v29 = v42;
        goto LABEL_63;
      }
    }
  }
  else
  {
    v30 = objc_opt_class(NWUDPSession, v22);
    if ((objc_opt_isKindOfClass(a4, v30) & 1) != 0)
    {
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("state")) & 1) != 0)
      {
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10217A2F8);
        v31 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
        {
          v32 = objc_msgSend(a4, "state");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v51 = 2082;
          *(_QWORD *)&v51[2] = "";
          v52 = 1026;
          LODWORD(v53) = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,processing session state\", \"state\":%{public}d}", buf, 0x18u);
        }
        if (objc_msgSend(a4, "state") == (id)3)
        {
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10217A2F8);
          v33 = qword_1022A0088;
          if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289026;
            *(_DWORD *)&buf[4] = 0;
            *(_WORD *)v51 = 2082;
            *(_QWORD *)&v51[2] = "";
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,processing state NWUDPSessionStateReady\"}", buf, 0x12u);
          }
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100C1C754;
          v48[3] = &unk_10212BB80;
          v48[4] = self;
          objc_msgSend(a4, "setReadHandler:maxDatagrams:", v48, 10);
        }
        else
        {
          if (qword_1022A0080 != -1)
            dispatch_once(&qword_1022A0080, &stru_10217A2F8);
          v46 = qword_1022A0088;
          if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
          {
            v47 = objc_msgSend(a4, "state");
            *(_DWORD *)buf = 68289282;
            *(_DWORD *)&buf[4] = 0;
            *(_WORD *)v51 = 2082;
            *(_QWORD *)&v51[2] = "";
            v52 = 1026;
            LODWORD(v53) = v47;
            v36 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,unhandled state\", \"state\":%{public}d}";
            v37 = v46;
            v39 = 24;
            goto LABEL_69;
          }
        }
      }
      else
      {
        if (qword_1022A0080 != -1)
          dispatch_once(&qword_1022A0080, &stru_10217A2F8);
        v44 = qword_1022A0088;
        if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
        {
          v45 = (std::string *)objc_msgSend(a3, "UTF8String");
          *(_DWORD *)buf = 68289282;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v51 = 2082;
          *(_QWORD *)&v51[2] = "";
          v52 = 2082;
          v53 = v45;
          v36 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,don't handle keypath\", \"keyPath\":%{public, location:escape_only}s}";
          v37 = v44;
LABEL_68:
          v39 = 28;
          goto LABEL_69;
        }
      }
    }
    else
    {
      if (qword_1022A0080 != -1)
        dispatch_once(&qword_1022A0080, &stru_10217A2F8);
      v38 = qword_1022A0088;
      if (os_log_type_enabled((os_log_t)qword_1022A0088, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v51 = 2082;
        *(_QWORD *)&v51[2] = "";
        v36 = "{\"msg%{public}.0s\":\"#nilr,#supl,#udp,skipping non session object\"}";
        v37 = v38;
        v39 = 18;
LABEL_69:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, v36, buf, v39);
      }
    }
  }
}

- (NWUDPListener)listener
{
  return (NWUDPListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)allSessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setReadHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (BOOL)conformanceMode
{
  return self->_conformanceMode;
}

- (void)setConformanceMode:(BOOL)a3
{
  self->_conformanceMode = a3;
}

- (id)statusHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setStatusHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NWPathEvaluator)evaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEvaluator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (__IPConfigurationService)service
{
  return self->_service;
}

- (void)setService:(__IPConfigurationService *)a3
{
  self->_service = a3;
}

@end
