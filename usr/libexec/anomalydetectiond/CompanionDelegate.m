@implementation CompanionDelegate

- (CompanionDelegate)initWithSilo:(id)a3 idsService:(id)a4
{
  id v6;
  id v7;
  IDSService *idsService;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_idsService, a4);
  idsService = self->_idsService;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));
  -[IDSService addDelegate:queue:](idsService, "addDelegate:queue:", self, v9);

  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v10 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "IDSService Delegate initialized %p", buf, 0xCu);
  }
  self->_hasMsgVersion = 0;
  self->_lastUpdateSpuTs = 0;
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002C41D0;
  v12[3] = &unk_10035C840;
  objc_copyWeak(&v13, (id *)buf);
  objc_msgSend(v6, "async:", v12);
  -[CompanionDelegate setSilo:](self, "setSilo:", v6);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return self;
}

- (void)dealloc
{
  id statusHandler;
  id testTriggerHandler;
  id messageHandler;
  id companionStatusHandler;
  objc_super v7;

  statusHandler = self->_statusHandler;
  self->_statusHandler = 0;

  testTriggerHandler = self->_testTriggerHandler;
  self->_testTriggerHandler = 0;

  messageHandler = self->_messageHandler;
  self->_messageHandler = 0;

  companionStatusHandler = self->_companionStatusHandler;
  self->_companionStatusHandler = 0;

  self->_lastUpdateSpuTs = 0;
  v7.receiver = self;
  v7.super_class = (Class)CompanionDelegate;
  -[CompanionDelegate dealloc](&v7, "dealloc");
}

- (void)updateIDSStatus
{
  double Current;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  int v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  _BOOL4 v41;
  NSObject *v42;
  _BOOL4 hasMsgVersion;
  CompanionDelegate *v44;
  NSObject *v45;
  _BOOL4 v46;
  void (**statusHandler)(id, _BOOL8, IDSDevice *, CFAbsoluteTime);
  _BOOL8 v48;
  IDSDevice *pairedDevice;
  CFAbsoluteTime v50;
  NSObject *v51;
  void (**companionStatusHandler)(double);
  uint64_t v53;
  NSObject *v54;
  unint64_t v55;
  _BOOL4 isConnected;
  CompanionDelegate *v57;
  IDSDevice **p_pairedDevice;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  _BYTE v65[40];
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  unsigned int v69;
  _BYTE v70[128];

  v55 = +[CSTimeManager SPU_estimate_current_timestamp](CSTimeManager, "SPU_estimate_current_timestamp");
  Current = CFAbsoluteTimeGetCurrent();
  isConnected = self->_isConnected;
  self->_isConnected = 0;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v57 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (!v4)
    goto LABEL_50;
  v5 = *(_QWORD *)v61;
  p_pairedDevice = &self->_pairedDevice;
  while (2)
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v61 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v6);
      if (qword_100387380 != -1)
        dispatch_once(&qword_100387380, &stru_1003657B8);
      v8 = (id)qword_100387388;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "modelIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "productBuildVersion"));
        v11 = objc_msgSend(v7, "isNearby");
        v12 = objc_msgSend(v7, "isConnected");
        v13 = objc_msgSend(v7, "isLocallyPaired");
        *(_DWORD *)buf = 68290307;
        *(_DWORD *)v65 = 0;
        *(_WORD *)&v65[4] = 2082;
        *(_QWORD *)&v65[6] = "";
        *(_WORD *)&v65[14] = 2113;
        *(_QWORD *)&v65[16] = v9;
        *(_WORD *)&v65[24] = 2113;
        *(_QWORD *)&v65[26] = v10;
        *(_WORD *)&v65[34] = 1026;
        *(_DWORD *)&v65[36] = v11;
        v66 = 1026;
        v67 = v12;
        v68 = 1026;
        v69 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updateIDSStatus:\", \"model\":%{private, location:escape_only}@, \"build\":%{private, location:escape_only}@, \"isNearby\":%{public}hhd, \"isConnected\":%{public}hhd, \"isLocallyPaired\":%{public}hhd}", buf, 0x38u);

      }
      if (objc_msgSend(v7, "isDefaultPairedDevice") && objc_msgSend(v7, "isNearby"))
      {
        v57->_isConnected = 1;
        objc_storeStrong((id *)p_pairedDevice, v7);
        if (qword_100387380 != -1)
          dispatch_once(&qword_100387380, &stru_1003657B8);
        v14 = (id)qword_100387388;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](*p_pairedDevice, "modelIdentifier")));
          v16 = objc_msgSend(v15, "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v65 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Companion model is %s", buf, 0xCu);

        }
        if (!_companionCompatibility)
        {
          if (v57->_hasMsgVersion)
          {
            _companionCompatibility = 1;
            goto LABEL_50;
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice productBuildVersion](*p_pairedDevice, "productBuildVersion"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet uppercaseLetterCharacterSet](NSCharacterSet, "uppercaseLetterCharacterSet"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v18));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c"), objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v20, "length"))));

          if (qword_100387380 != -1)
            dispatch_once(&qword_100387380, &stru_1003657B8);
          v22 = (id)qword_100387388;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](*p_pairedDevice, "modelIdentifier")));
            v24 = objc_msgSend(v23, "UTF8String");
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v65 = v24;
            *(_WORD *)&v65[8] = 2112;
            *(_QWORD *)&v65[10] = v25;
            *(_WORD *)&v65[18] = 2112;
            *(_QWORD *)&v65[20] = v26;
            *(_WORD *)&v65[28] = 2112;
            *(_QWORD *)&v65[30] = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "build %s, number %@ %@, letter %@", buf, 0x2Au);

          }
          if (-[IDSDevice deviceType](*p_pairedDevice, "deviceType") == (id)2)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
            v28 = (int)objc_msgSend(v27, "intValue") > 20;

            if (!v28)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
              v30 = (int)objc_msgSend(v29, "intValue") < 20;

              if (v30)
                goto LABEL_43;
              if (objc_msgSend(CFSTR("D"), "compare:", v21) == (id)1)
              {
                v31 = objc_msgSend(CFSTR("C"), "compare:", v21);
                if (v31 != (id)1)
                {
                  if (!v31)
                  {
                    v32 = 3;
LABEL_44:
                    _companionCompatibility = v32;
                  }
LABEL_45:
                  if (qword_100387380 != -1)
                    dispatch_once(&qword_100387380, &stru_1003657B8);
                  v42 = qword_100387388;
                  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
                  {
                    hasMsgVersion = v57->_hasMsgVersion;
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v65 = hasMsgVersion;
                    *(_WORD *)&v65[4] = 1024;
                    *(_DWORD *)&v65[6] = _companionCompatibility;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Companion hasMsgVersion:%d, companionCompatibility:%d", buf, 0xEu);
                  }

                  goto LABEL_50;
                }
LABEL_43:
                v32 = 2;
                goto LABEL_44;
              }
            }
          }
          else
          {
            if (-[IDSDevice deviceType](*p_pairedDevice, "deviceType") != (id)6)
              goto LABEL_45;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
            v34 = (int)objc_msgSend(v33, "intValue") > 20;

            if (!v34)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
              v36 = (int)objc_msgSend(v35, "intValue") < 20;

              if (v36)
                goto LABEL_43;
              v37 = objc_msgSend(CFSTR("S"), "compare:", v21);
              if (v37 == (id)1)
                goto LABEL_43;
              if (v37 != (id)-1)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
                v39 = (int)objc_msgSend(v38, "intValue") < 601;

                if (v39)
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
                  v41 = (int)objc_msgSend(v40, "intValue") < 301;

                  if (v41)
                    v32 = 2;
                  else
                    v32 = 3;
                  goto LABEL_44;
                }
              }
            }
          }
          v32 = 1;
          v57->_hasMsgVersion = 1;
          goto LABEL_44;
        }
      }
      v6 = (char *)v6 + 1;
    }
    while (v4 != v6);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v4)
      continue;
    break;
  }
LABEL_50:

  v44 = v57;
  if (isConnected != v57->_isConnected)
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v45 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v57->_isConnected;
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v65 = isConnected;
      *(_WORD *)&v65[4] = 1026;
      *(_DWORD *)&v65[6] = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Paired device connection changed: before: %{public}d, after: %{public}d", buf, 0xEu);
    }
    statusHandler = (void (**)(id, _BOOL8, IDSDevice *, CFAbsoluteTime))v57->_statusHandler;
    if (statusHandler)
    {
      v48 = v57->_isConnected;
      pairedDevice = v57->_pairedDevice;
      v50 = CFAbsoluteTimeGetCurrent();
      statusHandler[2](statusHandler, v48, pairedDevice, v50);
      v44 = v57;
    }
    else
    {
      if (qword_100387380 != -1)
        dispatch_once(&qword_100387380, &stru_1003657B8);
      v51 = qword_100387388;
      if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "Status handler is nil", buf, 2u);
      }
    }
  }
  companionStatusHandler = (void (**)(double))v44->_companionStatusHandler;
  if (companionStatusHandler)
  {
    if (v44->_isConnected)
      v53 = 1;
    else
      v53 = 0xFFFFFFFFLL;
    if (isConnected == v44->_isConnected)
    {
      if (v55 - v44->_lastUpdateSpuTs >= 0xF4241)
      {
        companionStatusHandler[2](Current);
        goto LABEL_73;
      }
    }
    else
    {
      ((void (*)(void (**)(double), unint64_t, uint64_t, double))companionStatusHandler[2])(companionStatusHandler, v55, v53, Current);
LABEL_73:
      v57->_lastUpdateSpuTs = v55;
    }
  }
  else
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v54 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "companionStatusHandler is nil", buf, 2u);
    }
  }
}

- (id)downgradeMsgToOlderType:(id)a3 type:(int *)a4
{
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  int v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  int v26;
  __int128 v27;
  int v28;
  uint64_t v29;
  int v30;

  v5 = a3;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v6 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    v7 = *a4;
    *(_DWORD *)buf = 67109120;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "downgradeMsgToOlderType - msg type to downgrade: %d", buf, 8u);
  }
  if ((*a4 - 101) > 1)
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v10 = qword_100387388;
    if (!os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    v11 = *a4;
    *(_DWORD *)buf = 67109120;
    v26 = v11;
    v12 = "No downgrade needed for this message type: %d";
    v13 = buf;
    v14 = v10;
    v15 = OS_LOG_TYPE_DEBUG;
    v16 = 8;
    goto LABEL_21;
  }
  if (*a4 == 101)
    v8 = 4;
  else
    v8 = 5;
  *a4 = v8;
  *(_DWORD *)buf = 1;
  objc_msgSend(v5, "getBytes:length:", buf, 40);
  if (_companionCompatibility == 3)
  {
    v20 = v26;
    v21 = v27;
    v22 = v28;
    v23 = v29;
    v24 = v30;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v20, 36));
    goto LABEL_23;
  }
  if (_companionCompatibility != 2)
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v17 = qword_100387388;
    if (!os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LOWORD(v20) = 0;
    v12 = "Unknown companion compatibility";
    v13 = (uint8_t *)&v20;
    v14 = v17;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 2;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v12, v13, v16);
LABEL_22:
    v9 = v5;
    goto LABEL_23;
  }
  v20 = v26;
  v21 = v27;
  v22 = v28;
  LODWORD(v23) = v29;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v20, 28));
LABEL_23:
  v18 = v9;

  return v18;
}

- (void)sendData:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IDSService *idsService;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned int v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[2];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CompanionDelegate updateIDSStatus](self, "updateIDSStatus");
  if (self->_isConnected)
  {
    v22 = v4;
    if ((int)v4 < 101 || self->_hasMsgVersion)
    {
      v7 = v6;
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[CompanionDelegate downgradeMsgToOlderType:type:](self, "downgradeMsgToOlderType:type:", v6, &v22));
      v4 = v22;
    }
    v33[0] = CFSTR("type");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    v33[1] = CFSTR("payload");
    v34[0] = v8;
    v34[1] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));

    v31[0] = IDSSendMessageOptionTimeoutKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 2.0));
    v32[0] = v10;
    v32[1] = &__kCFBooleanTrue;
    v31[1] = IDSSendMessageOptionLocalDeliveryKey;
    v31[2] = IDSSendMessageOptionEncryptPayloadKey;
    v32[2] = &__kCFBooleanTrue;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));

    idsService = self->_idsService;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
    v20 = 0;
    v21 = 0;
    v14 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](idsService, "sendMessage:toDestinations:priority:options:identifier:error:", v9, v13, 300, v11, &v21, &v20);
    v15 = v21;
    v16 = v20;

    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v17 = (id)qword_100387388;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      v19 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 136315906;
      v24 = v18;
      v25 = 2048;
      v26 = v19;
      v27 = 1024;
      v28 = v22;
      v29 = 1024;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Sending message: ID:%s size: %lu type: %d over IDSService - Status %d", buf, 0x22u);
    }

  }
}

- (void)receivedMessage:(int)a3 data:(id)a4 identifierString:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void (**messageHandler)(id, _QWORD, id, double);
  CFAbsoluteTime Current;
  void (**testTriggerHandler)(id, double);
  CFAbsoluteTime v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v10 = (id)qword_100387388;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v20 = 136315650;
    v21 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v22 = 1024;
    v23 = v6;
    v24 = 2048;
    v25 = objc_msgSend(v8, "length");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Received message: ID:%s, type:%d, size %lu", (uint8_t *)&v20, 0x1Cu);
  }

  if ((_DWORD)v6)
  {
    messageHandler = (void (**)(id, _QWORD, id, double))self->_messageHandler;
    if (messageHandler)
    {
      Current = CFAbsoluteTimeGetCurrent();
      messageHandler[2](messageHandler, v6, v8, Current);
      if ((_DWORD)v6 == 11 && !self->_hasMsgVersion)
        self->_hasMsgVersion = 1;
      goto LABEL_21;
    }
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v15 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      v16 = "Message handler is nil";
      v17 = v15;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v20, 2u);
    }
  }
  else
  {
    testTriggerHandler = (void (**)(id, double))self->_testTriggerHandler;
    if (testTriggerHandler)
    {
      v14 = CFAbsoluteTimeGetCurrent();
      testTriggerHandler[2](testTriggerHandler, v14);
      goto LABEL_21;
    }
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v19 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      v16 = "Test trigger handler is nil";
      v17 = v19;
      v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("type")));
  v14 = objc_msgSend(v13, "intValue");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("payload")));
  v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v15, 4);
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v17 = qword_100387388;
  if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138413314;
    v20 = v16;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 1024;
    v28 = (int)v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Received string: %@ data: %@ from: %@ context: %@ type: %d", (uint8_t *)&v19, 0x30u);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "outgoingResponseIdentifier"));
  -[CompanionDelegate receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", v14, v15, v18);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  double Current;
  NSObject *v17;
  void *v18;
  void (**companionStatusHandler)(id, unint64_t, uint64_t, double);
  uint64_t v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v10 = a6;
  v12 = a5;
  v13 = a7;
  v14 = a8;
  v15 = +[CSTimeManager SPU_estimate_current_timestamp](CSTimeManager, "SPU_estimate_current_timestamp");
  Current = CFAbsoluteTimeGetCurrent();
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  v17 = (id)qword_100387388;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v21 = 138413058;
    v22 = v12;
    v23 = 2112;
    v24 = v18;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Did send message %@ success %@ error %@ context %@", (uint8_t *)&v21, 0x2Au);

  }
  companionStatusHandler = (void (**)(id, unint64_t, uint64_t, double))self->_companionStatusHandler;
  if (companionStatusHandler)
  {
    if (v10)
      v20 = 2;
    else
      v20 = 4294967294;
    companionStatusHandler[2](companionStatusHandler, v15, v20, Current);
  }

}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)hasMsgVersion
{
  return self->_hasMsgVersion;
}

- (void)setHasMsgVersion:(BOOL)a3
{
  self->_hasMsgVersion = a3;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (IDSDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDevice, a3);
}

- (CLSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
  objc_storeStrong((id *)&self->_silo, a3);
}

- (id)statusHandler
{
  return self->_statusHandler;
}

- (void)setStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)testTriggerHandler
{
  return self->_testTriggerHandler;
}

- (void)setTestTriggerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)companionStatusHandler
{
  return self->_companionStatusHandler;
}

- (void)setCompanionStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_companionStatusHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_testTriggerHandler, 0);
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong((id *)&self->_silo, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
