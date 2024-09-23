@implementation CLClientAuthorizationCache

- (void)setClientsAuthorizationMap:(id)a3
{
  NSObject *v5;
  _BOOL8 v6;
  NSMutableArray *cachePopulationReplyBlocks;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t buf;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    buf = 68289282;
    v18 = 2082;
    v19 = "";
    v20 = 2114;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setClientsAuthorizationMap\", \"clientToAuthorizationMap\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  if (-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"))
    v6 = 0;
  else
    v6 = -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap") == 0;
  -[CLClientAuthorizationCache setIsInitialCache:](self, "setIsInitialCache:", v6);
  -[CLClientAuthorizationCache setClientKeyToAuthContextMap:](self, "setClientKeyToAuthContextMap:", a3);
  if (-[CLClientAuthorizationCache isInitialCache](self, "isInitialCache"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    cachePopulationReplyBlocks = self->_cachePopulationReplyBlocks;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachePopulationReplyBlocks, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(cachePopulationReplyBlocks);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachePopulationReplyBlocks, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    self->_cachePopulationReplyBlocks = 0;
  }
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setIsInitialCache:(BOOL)a3
{
  self->_isInitialCache = a3;
}

- (void)setClientKeyToAuthContextMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)notifyWhenCacheIsPopulatedWithReply:(id)a3
{
  if (-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap")
    || -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[NSMutableArray addObject:](self->_cachePopulationReplyBlocks, "addObject:", objc_msgSend(a3, "copy"));
  }
}

- (BOOL)isInitialCache
{
  return self->_isInitialCache;
}

- (void)getAuthorizationContextOfNonZonalClient:(id)a3 withReply:(id)a4
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048444;
  v4[3] = &unk_102180A50;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[CLClientAuthorizationCache notifyWhenCacheIsPopulatedWithReply:](self, "notifyWhenCacheIsPopulatedWithReply:", v4);
}

- (NSMutableDictionary)clientKeyToClientInfoMap
{
  return self->_clientKeyToClientInfoMap;
}

- (NSDictionary)clientKeyToAuthContextMap
{
  return self->_clientKeyToAuthContextMap;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_10230EED8 != -1)
    dispatch_once(&qword_10230EED8, &stru_1021B58A0);
  return (id)qword_10230EED0;
}

- (CLClientAuthorizationCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLClientAuthorizationCache;
  return -[CLClientAuthorizationCache initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLClientAuthorizationCacheProtocol, &OBJC_PROTOCOL___CLClientAuthorizationCacheClientProtocol);
}

- (void)beginService
{
  self->_cachePopulationReplyBlocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
}

- (void)endService
{
  -[CLClientAuthorizationCache setClientKeyToAuthContextMap:](self, "setClientKeyToAuthContextMap:", 0);

  self->_cachePopulationReplyBlocks = 0;
  -[CLClientAuthorizationCache setClientKeyToClientInfoMap:](self, "setClientKeyToClientInfoMap:", 0);
}

- (int)syncgetAuthorizationOfClient:(id)a3 forServiceMask:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  int v25;

  v6 = -[NSDictionary objectForKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"), "objectForKeyedSubscript:", a3);
  if (v6)
  {
    v7 = objc_msgSend(v6, "transientAwareRegistrationResult");
    if ((a4 & 0xFFFFFFFFFFFF7380) != 0)
      v8 = 2;
    else
      v8 = v7;
  }
  else
  {
    v8 = 4;
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
  v9 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v21 = objc_msgSend(a3, "UTF8String");
    v22 = 2048;
    v23 = a4;
    v24 = 1024;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "syncgetAuthorizationOfClient, %s, forServiceMask, %lx, authorized, %d", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    v11 = qword_1022A01D8;
    v14 = 136315650;
    v15 = objc_msgSend(a3, "UTF8String");
    v16 = 2048;
    v17 = a4;
    v18 = 1024;
    v19 = v8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 2, "syncgetAuthorizationOfClient, %s, forServiceMask, %lx, authorized, %d", (const char *)&v14, 28);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLClientAuthorizationCache syncgetAuthorizationOfClient:forServiceMask:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  return v8;
}

- (id)syncgetAuthorizationContextIfClientIsNonZonal:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"), "objectForKeyedSubscript:", a3))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = objc_msgSend(a3, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Zonal client trying to access auth-context via Non-Zonal CLCAC api\", \"Client\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    }
    v6 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v7 = objc_msgSend(a3, "UTF8String");
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Zonal client trying to access auth-context via Non-Zonal CLCAC api", "{\"msg%{public}.0s\":\"Zonal client trying to access auth-context via Non-Zonal CLCAC api\", \"Client\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x1Cu);
    }
  }
  return -[NSDictionary objectForKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"), "objectForKeyedSubscript:", a3);
}

- (id)syncgetAuthorizationContextForClient:(id)a3 at:(id)a4
{
  CLClientManagerAuthorizationContext *v7;
  CLClientManagerAuthorizationContext *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  id v16;
  NSArray *v17;
  unsigned int v18;
  unsigned int v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  CLClientManagerAuthorizationContext *v26;
  CLLocation *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35[2];
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *__p;
  char v48;
  _OWORD v49[8];
  _OWORD v50[2];
  _OWORD v51[10];
  _BYTE v52[156];
  uint8_t v53[8];
  __int16 v54;
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint8_t *v61;
  __int16 v62;
  CLClientManagerAuthorizationContext *v63;
  __int16 v64;
  CLClientManagerAuthorizationContext *v65;
  uint8_t buf[32];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _OWORD v73[2];

  v7 = -[NSDictionary objectForKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"), "objectForKeyedSubscript:", a3);
  if (v7)
  {
    v8 = v7;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = objc_msgSend(a3, "UTF8String");
      v10 = "{\"msg%{public}.0s\":\"#clcac fetching auth-context from non-zonal cache\", \"Client\":%{public, location:escape_only}s}";
      v11 = buf;
      v12 = v9;
      v13 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v10, v11, v13);
    }
  }
  else if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"), "objectForKeyedSubscript:", a3))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    v14 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = objc_msgSend(a3, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#clcac computing auth-context from clientInfo in zonal cache\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    v15 = (NSMutableDictionary *)-[NSMutableDictionary objectForKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"), "objectForKeyedSubscript:", a3);
    v16 = -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("BigSwitchState"));
    v17 = sub_10019F778(v15, 0, v16 != 0, 0);
    v18 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1), "intValue");
    v19 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 2), "intValue");
    if (a4)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
      v20 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
      {
        v21 = objc_msgSend(a3, "UTF8String");
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#clcac location specified by zonal-client. Skip showing location-arrow\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      objc_msgSend(a4, "clientLocation");
      return sub_1001A372C(v15, v18, v19, v16 != 0, (uint64_t)v52);
    }
    else
    {
      v51[6] = xmmword_101BB53F8;
      v51[7] = unk_101BB5408;
      memset(&v51[8], 0, 28);
      v51[2] = xmmword_101BB53B8;
      v51[3] = unk_101BB53C8;
      v51[4] = xmmword_101BB53D8;
      v51[5] = unk_101BB53E8;
      v51[0] = xmmword_101BB5398;
      v51[1] = unk_101BB53A8;
      v26 = sub_1001A372C(v15, v18, v19, v16 != 0, (uint64_t)v51);
      v72 = 0u;
      memset(v73, 0, 28);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v67 = 0u;
      memset(buf, 0, sizeof(buf));
      v27 = -[CLClientAuthorizationCache currentLocation](self, "currentLocation");
      if (v27)
      {
        -[CLLocation clientLocation](v27, "clientLocation");
      }
      else
      {
        v72 = 0u;
        memset(v73, 0, 28);
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v67 = 0u;
        memset(buf, 0, sizeof(buf));
      }
      v49[6] = v71;
      v49[7] = v72;
      v50[0] = v73[0];
      *(_OWORD *)((char *)v50 + 12) = *(_OWORD *)((char *)v73 + 12);
      v49[2] = v67;
      v49[3] = v68;
      v49[4] = v69;
      v49[5] = v70;
      v49[0] = *(_OWORD *)buf;
      v49[1] = *(_OWORD *)&buf[16];
      v8 = sub_1001A372C(v15, v18, v19, v16 != 0, (uint64_t)v49);
      if (-[CLClientManagerAuthorizationContext isEqual:](v26, "isEqual:", v8))
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
        v28 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
        {
          v29 = objc_msgSend(a3, "UTF8String");
          *(_DWORD *)v53 = 68289795;
          *(_DWORD *)&v53[4] = 0;
          v54 = 2082;
          v55 = "";
          v56 = 2082;
          v57 = v29;
          v58 = 1040;
          v59 = 156;
          v60 = 2097;
          v61 = buf;
          v10 = "{\"msg%{public}.0s\":\"#clcac location not specified. NonZonal-AC is same as Zonal-AC at current-locatio"
                "n. Skip showing location-arrow\", \"Client\":%{public, location:escape_only}s, \"CLCAC-currentLocation\"
                ":%{private, location:CLClientLocation}.*P}";
          v11 = v53;
          v12 = v28;
          v13 = 44;
          goto LABEL_6;
        }
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
        v30 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
        {
          v31 = objc_msgSend(a3, "UTF8String");
          *(_DWORD *)v53 = 68290307;
          *(_DWORD *)&v53[4] = 0;
          v54 = 2082;
          v55 = "";
          v56 = 2082;
          v57 = v31;
          v58 = 1040;
          v59 = 156;
          v60 = 2097;
          v61 = buf;
          v62 = 2114;
          v63 = v26;
          v64 = 2114;
          v65 = v8;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#clcac location not specified. NonZonal-AC differs from Zonal-AC at current-location. Showing location-arrow\", \"Client\":%{public, location:escape_only}s, \"CLCAC-currentLocation\":%{private, location:CLClientLocation}.*P, \"NonZonalAC\":%{public, location:escape_only}@, \"ZonalAC\":%{public, location:escape_only}@}", v53, 0x40u);
        }
        v32 = objc_msgSend(-[CLClientAuthorizationCache vendor](self, "vendor"), "proxyForService:forClient:", CFSTR("CLClientManager"), CFSTR("CLClientAuthorizationCache"));
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
        v33 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
        {
          v34 = objc_msgSend(a3, "UTF8String");
          *(_DWORD *)v53 = 68289282;
          *(_DWORD *)&v53[4] = 0;
          v54 = 2082;
          v55 = "";
          v56 = 2082;
          v57 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"markReceivingLocationInformation\", \"Client\":%{public, location:escape_only}s}", v53, 0x1Cu);
        }
        sub_1015A2E04(v53, (char *)objc_msgSend(a3, "UTF8String"));
        sub_100204320((std::string *)v53, (uint64_t)v35);
        objc_msgSend(v32, "markReceivingLocationInformation:", sub_1001AE728((__int128 *)v35));
        if (v48 < 0)
          operator delete(__p);
        if (v46 < 0)
          operator delete(v45);
        if (v44 < 0)
          operator delete(v43);
        if (v42 < 0)
          operator delete(v41);
        if (v40 < 0)
          operator delete(v39);
        if (v38 < 0)
          operator delete(v37);
        if (v36 < 0)
          operator delete(v35[0]);
        if (SBYTE3(v57) < 0)
          operator delete(*(void **)v53);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    v22 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = objc_msgSend(a3, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to find client in both non-zonal and zonal cache #clcac\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
    }
    v23 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v24 = objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to find client in both non-zonal and zonal cache #clcac", "{\"msg%{public}.0s\":\"Unable to find client in both non-zonal and zonal cache #clcac\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    return 0;
  }
  return v8;
}

- (void)setPersistentStoreDictionary:(id)a3 forClient:(id)a4
{
  NSObject *v7;
  _BOOL8 v8;
  NSObject *v9;
  NSMutableArray *cachePopulationReplyBlocks;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  const char *v15;
  uint8_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _WORD v21[8];
  uint8_t v22[128];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289538;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = objc_msgSend(a4, "UTF8String");
    v29 = 2114;
    v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setPersistentStoreDictionary\", \"Client\":%{public, location:escape_only}s, \"ClientDictionary\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if (-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"))
    v8 = 0;
  else
    v8 = -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap") == 0;
  -[CLClientAuthorizationCache setIsInitialCache:](self, "setIsInitialCache:", v8);
  if (-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"))
  {
    if (!a3)
      goto LABEL_14;
  }
  else
  {
    -[CLClientAuthorizationCache setClientKeyToClientInfoMap:](self, "setClientKeyToClientInfoMap:", objc_alloc_init((Class)NSMutableDictionary));
    if (!a3)
      goto LABEL_14;
  }
  if (a4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"), "setObject:forKeyedSubscript:", a3, a4);
    goto LABEL_24;
  }
LABEL_14:
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    if (a3 || !a4)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "synchronizing clientInfo to CLCAC with invalid combination of arguments", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021B58C0);
        v21[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 17, "synchronizing clientInfo to CLCAC with invalid combination of arguments", v21, 2);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 0, "-[CLClientAuthorizationCache setPersistentStoreDictionary:forClient:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"), "removeObjectForKey:", a4);
    }
  }
  else
  {
    -[NSMutableDictionary removeAllObjects](-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"), "removeAllObjects");
  }
LABEL_24:
  if (-[CLClientAuthorizationCache isInitialCache](self, "isInitialCache"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    cachePopulationReplyBlocks = self->_cachePopulationReplyBlocks;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachePopulationReplyBlocks, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(cachePopulationReplyBlocks);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cachePopulationReplyBlocks, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    self->_cachePopulationReplyBlocks = 0;
  }
}

- (void)setClientKeyToClientInfoMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (NSMutableArray)cachePopulationReplyBlocks
{
  return self->_cachePopulationReplyBlocks;
}

- (void)setCachePopulationReplyBlocks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
