@implementation RDXPCHandler

- (void)createNewDataCache
{
  RDCachedData *dataCache;
  RDCachedData *v4;
  RDCachedData *v5;

  dataCache = self->_dataCache;
  self->_dataCache = 0;

  v4 = (RDCachedData *)objc_alloc_init((Class)RDCachedData);
  v5 = self->_dataCache;
  self->_dataCache = v4;

  -[RDCachedData saveCache](self->_dataCache, "saveCache");
}

- (RDXPCHandler)init
{
  RDXPCHandler *v2;
  uint64_t v3;
  RDCachedData *dataCache;
  NSObject *v5;
  _TtC8countryd14RDStatusSharer *v6;
  _TtC8countryd14RDStatusSharer *sharer;
  objc_super v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;

  v9.receiver = self;
  v9.super_class = (Class)RDXPCHandler;
  v2 = -[RDXPCHandler init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[RDCachedData loadCache](RDCachedData, "loadCache"));
    dataCache = v2->_dataCache;
    v2->_dataCache = (RDCachedData *)v3;

    if (!v3)
    {
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
      v5 = qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v11 = 0;
        v12 = 2082;
        v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Cache load failed, perhaps because it was never set before. Starting a new one\"}", buf, 0x12u);
      }
      -[RDXPCHandler createNewDataCache](v2, "createNewDataCache");
    }
    if (+[RDSharerAvailability hasLocalStatusKit](_TtC8countryd20RDSharerAvailability, "hasLocalStatusKit"))
    {
      v6 = objc_alloc_init(_TtC8countryd14RDStatusSharer);
      sharer = v2->_sharer;
      v2->_sharer = v6;

    }
  }
  return v2;
}

- (void)update:(int64_t)a3 withDict:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v6 = a4;
  if (sub_10000BB68())
  {
    if (sub_10000BD9C())
    {
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
      v7 = qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 68289026;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", (uint8_t *)&v25, 0x12u);
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kRDUpdateKeyCountryCodes));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kRDUpdateKeyInDisputedArea));
      v10 = objc_msgSend(v9, "BOOLValueSafe");

      if (v8 && (v11 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v8, v11) & 1) == 0))
      {
        if (qword_1000193A8 != -1)
          dispatch_once(&qword_1000193A8, &stru_100014A70);
        v15 = (void *)qword_1000193B0;
        if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
        {
          v16 = v15;
          v25 = 68289538;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2114;
          v30 = v8;
          v31 = 2114;
          v32 = (id)objc_opt_class(v8);
          v17 = v32;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"update from peer had malformed country codes entry\", \"countryCodes\":%{public, location:escape_only}@, \"class\":%{public, location:escape_only}@}", (uint8_t *)&v25, 0x26u);

          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
        }
        v18 = (void *)qword_1000193B0;
        if (os_signpost_enabled((os_log_t)qword_1000193B0))
        {
          v19 = v18;
          v20 = (void *)objc_opt_class(v8);
          v25 = 68289538;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2114;
          v30 = v8;
          v31 = 2114;
          v32 = v20;
          v21 = v20;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "update from peer had malformed country codes entry", "{\"msg%{public}.0s\":\"update from peer had malformed country codes entry\", \"countryCodes\":%{public, location:escape_only}@, \"class\":%{public, location:escape_only}@}", (uint8_t *)&v25, 0x26u);

        }
      }
      else
      {
        v12 = v8;
        switch(a3)
        {
          case 0:
            if (qword_1000193A8 != -1)
              dispatch_once(&qword_1000193A8, &stru_100014A70);
            v13 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              v25 = 68289538;
              v26 = 0;
              v27 = 2082;
              v28 = "";
              v29 = 2114;
              v30 = v12;
              v31 = 1026;
              LODWORD(v32) = (_DWORD)v10;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location info update\", \"countryCodes\":%{public, location:escape_only}@, \"isDisputed\":%{public}hhd}", (uint8_t *)&v25, 0x22u);
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            objc_msgSend(v14, "setCountriesFromLocation:isInDisputedArea:", v12, v10);
            goto LABEL_37;
          case 1:
            if (qword_1000193A8 != -1)
              dispatch_once(&qword_1000193A8, &stru_100014A70);
            v22 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              v25 = 68289282;
              v26 = 0;
              v27 = 2082;
              v28 = "";
              v29 = 2114;
              v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"NearbyCell info update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v25, 0x1Cu);
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            objc_msgSend(v14, "setCountriesFromNearbyCells:", v12);
            goto LABEL_37;
          case 2:
            if (qword_1000193A8 != -1)
              dispatch_once(&qword_1000193A8, &stru_100014A70);
            v23 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              v25 = 68289282;
              v26 = 0;
              v27 = 2082;
              v28 = "";
              v29 = 2114;
              v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"ServingCell info update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v25, 0x1Cu);
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            objc_msgSend(v14, "setCountriesFromServingCell:", v12);
            goto LABEL_37;
          case 3:
            if (qword_1000193A8 != -1)
              dispatch_once(&qword_1000193A8, &stru_100014A70);
            v24 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              v25 = 68289282;
              v26 = 0;
              v27 = 2082;
              v28 = "";
              v29 = 2114;
              v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"WiFi AP info update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v25, 0x1Cu);
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            objc_msgSend(v14, "setCountriesFromWiFiAPs:", v12);
LABEL_37:

            break;
          default:
            break;
        }

      }
    }
  }

}

- (void)update:(int64_t)a3 withListOfCountryCodes:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  v6 = a4;
  if (sub_10000BB68())
  {
    if (!sub_10000BD9C())
    {
      switch(a3)
      {
        case 0:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v9 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 68289282;
            v16 = 0;
            v17 = 2082;
            v18 = "";
            v19 = 2114;
            v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v10, "setCountriesFromLocation:", v6);
          goto LABEL_38;
        case 1:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v11 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 68289282;
            v16 = 0;
            v17 = 2082;
            v18 = "";
            v19 = 2114;
            v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"NearbyCell update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v10, "setCountriesFromNearbyCells:", v6);
          goto LABEL_38;
        case 2:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v12 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 68289282;
            v16 = 0;
            v17 = 2082;
            v18 = "";
            v19 = 2114;
            v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"ServingCell update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v10, "setCountriesFromServingCell:", v6);
          goto LABEL_38;
        case 3:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v13 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 68289282;
            v16 = 0;
            v17 = 2082;
            v18 = "";
            v19 = 2114;
            v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"WiFi AP update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v10, "setCountriesFromWiFiAPs:", v6);
          goto LABEL_38;
        case 4:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v7 = qword_1000193B0;
          if (!os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            goto LABEL_39;
          v15 = 68289026;
          v16 = 0;
          v17 = 2082;
          v18 = "";
          v8 = "{\"msg%{public}.0s\":\"clearing state\"}";
          goto LABEL_7;
        case 5:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v14 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 68289026;
            v16 = 0;
            v17 = 2082;
            v18 = "";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"forcing a recompute\"}", (uint8_t *)&v15, 0x12u);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v10, "recompute");
LABEL_38:

          goto LABEL_39;
        default:
          goto LABEL_39;
      }
    }
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v7 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v8 = "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0x12u);
    }
  }
LABEL_39:

}

- (void)update:(int64_t)a3 withCountryCode:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;

  v6 = a4;
  if (sub_10000BB68())
  {
    if (!sub_10000BD9C())
    {
      switch(a3)
      {
        case 0:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v9 = (void *)qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v10 = objc_retainAutorelease(v6);
            v11 = v9;
            v20 = 68289282;
            v21 = 0;
            v22 = 2082;
            v23 = "";
            v24 = 2082;
            v25 = objc_msgSend(v10, "UTF8String");
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location update\", \"countryCode\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);

          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v12, "setCountryFromLocation:", v6);
          goto LABEL_33;
        case 2:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v13 = (void *)qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_retainAutorelease(v6);
            v15 = v13;
            v20 = 68289282;
            v21 = 0;
            v22 = 2082;
            v23 = "";
            v24 = 2082;
            v25 = objc_msgSend(v14, "UTF8String");
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MCC update\", \"countryCode\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);

          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v12, "setCountryFromMCC:", v6);
          goto LABEL_33;
        case 3:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v16 = (void *)qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v17 = objc_retainAutorelease(v6);
            v18 = v16;
            v20 = 68289282;
            v21 = 0;
            v22 = 2082;
            v23 = "";
            v24 = 2082;
            v25 = objc_msgSend(v17, "UTF8String");
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"WiFi AP update\", \"countryCode\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);

          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v12, "setCountryFromWiFiAPs:", v6);
          goto LABEL_33;
        case 4:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v7 = qword_1000193B0;
          if (!os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            goto LABEL_34;
          v20 = 68289026;
          v21 = 0;
          v22 = 2082;
          v23 = "";
          v8 = "{\"msg%{public}.0s\":\"clearing state\"}";
          goto LABEL_7;
        case 5:
          if (qword_1000193A8 != -1)
            dispatch_once(&qword_1000193A8, &stru_100014A70);
          v19 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            v20 = 68289026;
            v21 = 0;
            v22 = 2082;
            v23 = "";
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"forcing a recompute\"}", (uint8_t *)&v20, 0x12u);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          objc_msgSend(v12, "recompute");
LABEL_33:

          goto LABEL_34;
        default:
          goto LABEL_34;
      }
    }
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v7 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v8 = "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, 0x12u);
    }
  }
LABEL_34:

}

- (void)updatePeer:(id)a3 withCountryCode:(id)a4 priority:(int)a5 andTimestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (sub_10000BD9C())
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v13 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 68289026;
      v17[1] = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", (uint8_t *)v17, 0x12u);
    }
  }
  else
  {
    if (kRDPrioritySingleLocation + 1 < a5)
      v14 = kRDPrioritySingleLocation + 1;
    else
      v14 = a5;
    if (a5 >= 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = objc_msgSend(objc_alloc((Class)RDEstimate), "initWithCountryCode:priority:timestamp:inDisputedArea:", v11, v15, v12, 0);
    -[RDXPCHandler updatePeer:withEstimate:](self, "updatePeer:withEstimate:", v10, v16);

  }
}

- (void)updatePeer:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *log;
  void *v29;
  unsigned int v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;

  v6 = a3;
  v7 = a4;
  if (sub_10000BD9C())
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v8 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", buf, 0x12u);
    }
  }
  else if (v6)
  {
    if (sub_10000BB68())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.priority")));
      v11 = objc_msgSend(v10, "integerValue");

      if (kRDPrioritySingleLocation + 1 < v11)
        v12 = kRDPrioritySingleLocation + 1;
      else
        v12 = v11;
      if ((uint64_t)v11 >= 0)
        v13 = v12;
      else
        v13 = 0;
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
      v14 = (void *)qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
      {
        log = v14;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.priority")));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.priority")));
        v15 = objc_msgSend(v29, "integerValue");
        v30 = v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.isDisputed")));
        v17 = objc_msgSend(v16, "BOOLValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.countryCode")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.timestamp")));
        *(_DWORD *)buf = 68290562;
        v32 = 0;
        v33 = 2082;
        v34 = "";
        v35 = 2114;
        v36 = v9;
        v37 = 2114;
        v38 = v27;
        v39 = 2050;
        v40 = v15;
        v41 = 1026;
        v42 = v17;
        v43 = 2114;
        v44 = v18;
        v45 = 2114;
        v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"peer update received\", \"dict\":%{public, location:escape_only}@, \"prio\":%{public, location:escape_only}@, \"prioVal\":%{public}ld, \"disputed?\":%{public}hhd, \"countryCode\":%{public, location:escape_only}@, \"timestamp\":%{public, location:escape_only}@}", buf, 0x4Au);

        v13 = v30;
      }
      v20 = objc_alloc((Class)RDEstimate);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.countryCode")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.timestamp")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.RegulatoryDomain.peer_status.isDisputed")));
      v24 = objc_msgSend(v20, "initWithCountryCode:priority:timestamp:inDisputedArea:", v21, v13, v22, objc_msgSend(v23, "BOOLValue"));

      -[RDXPCHandler updatePeer:withEstimate:](self, "updatePeer:withEstimate:", v6, v24);
    }
  }
  else
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v25 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
    }
    v26 = qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      *(_DWORD *)buf = 68289026;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "got nil peer UUID!", "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
    }
  }

}

- (void)updatePeer:(id)a3 withEstimate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  RDXPCHandler *v14;
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;

  v6 = a3;
  v7 = a4;
  if (sub_10000BD9C())
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v8 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", buf, 0x12u);
    }
  }
  else if (v6)
  {
    if (sub_10000BB68())
    {
      if (qword_100019630 != -1)
        dispatch_once(&qword_100019630, &stru_100014A90);
      v9 = qword_100019628;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D09C;
      block[3] = &unk_1000149F0;
      v13 = v7;
      v14 = self;
      v15 = v6;
      dispatch_async(v9, block);

    }
  }
  else
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v10 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
    }
    v11 = qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "got nil peer UUID!", "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
    }
  }

}

- (void)shareStatusWithPeers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getLocalOnlyEstimates"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionary"));

  if (v5 && objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler sharer](self, "sharer"));
    objc_msgSend(v6, "shareStatusesWithEstimates:completionHandler:", v7, &stru_100014A30);

  }
  else
  {
    -[RDXPCHandler clearStatusSharedWithPeers](self, "clearStatusSharedWithPeers");
  }

}

- (void)clearStatusSharedWithPeers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDXPCHandler sharer](self, "sharer"));
  objc_msgSend(v2, "shareStatusWithEstimate:completionHandler:", 0, &stru_100014A50);

}

- (void)ping
{
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;

  if (qword_100019398 != -1)
    dispatch_once(&qword_100019398, &stru_100014AB0);
  v2 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"pinged!\"}", (uint8_t *)v3, 0x12u);
  }
}

- (void)createCacheDirAtPath:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;

  v3 = a3;
  if (qword_1000193A8 != -1)
    dispatch_once(&qword_1000193A8, &stru_100014A70);
  v4 = qword_1000193B0;
  if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
  {
    v6 = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Nothing should have used createCacheDirAtPath!\"}", (uint8_t *)&v6, 0x12u);
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
  }
  v5 = qword_1000193B0;
  if (os_signpost_enabled((os_log_t)qword_1000193B0))
  {
    v6 = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Nothing should have used createCacheDirAtPath!", "{\"msg%{public}.0s\":\"Nothing should have used createCacheDirAtPath!\"}", (uint8_t *)&v6, 0x12u);
  }

}

- (void)triggerUpdateToEligibilityEngine
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_100019398 != -1)
    dispatch_once(&qword_100019398, &stru_100014AB0);
  v3 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"triggering update to eligibility engine\"}", (uint8_t *)v5, 0x12u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
  objc_msgSend(v4, "postResultsToEligibilityEngine");

}

- (void)setCacheLockState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unsigned int v22;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.countryd.lock")));
  if (!v5
    || (v6 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    || (objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v9 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      v10 = v9;
      v15 = 68289538;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "com.apple.countryd.lock";
      v21 = 1026;
      v22 = objc_msgSend(v4, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"peer process is missing entitlement lock our cache\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v15, 0x22u);

      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
    }
    v11 = (void *)qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      v12 = v11;
      v13 = objc_msgSend(v4, "processIdentifier");
      v15 = 68289538;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "com.apple.countryd.lock";
      v21 = 1026;
      v22 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "peer process is missing entitlement lock our cache", "{\"msg%{public}.0s\":\"peer process is missing entitlement lock our cache\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v15, 0x22u);

    }
    goto LABEL_20;
  }

  if (!geteuid())
  {
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_100014AB0);
    v14 = qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 1026;
      LODWORD(v20) = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updating lock state\", \"locked\":%{public}hhd}", (uint8_t *)&v15, 0x18u);
    }
    v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.RegulatoryDomain"));
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("UpdatesLocked"));
LABEL_20:

    return;
  }
  if (qword_100019398 != -1)
    dispatch_once(&qword_100019398, &stru_100014AB0);
  v7 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_FAULT))
  {
    v15 = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"lock state can only be modified by root user\"}", (uint8_t *)&v15, 0x12u);
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_100014AB0);
  }
  v8 = qword_1000193A0;
  if (os_signpost_enabled((os_log_t)qword_1000193A0))
  {
    v15 = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "lock state can only be modified by root user", "{\"msg%{public}.0s\":\"lock state can only be modified by root user\"}", (uint8_t *)&v15, 0x12u);
  }
}

- (RDCachedData)dataCache
{
  return (RDCachedData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_TtC8countryd14RDStatusSharer)sharer
{
  return (_TtC8countryd14RDStatusSharer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharer, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
}

@end
