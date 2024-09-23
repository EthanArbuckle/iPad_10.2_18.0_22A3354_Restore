@implementation APAttributionAnalytics

- (APAttributionAnalytics)init
{
  APAttributionAnalytics *v2;
  APAttributionAnalytics *v3;
  NSString *storefrontID;
  APUnfairLock *v5;
  APUnfairLock *analyticsLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APAttributionAnalytics;
  v2 = -[APAttributionAnalytics init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    storefrontID = v2->_storefrontID;
    v2->_storefrontID = (NSString *)&stru_100219118;

    v3->_state = 0;
    v5 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 0);
    analyticsLock = v3->_analyticsLock;
    v3->_analyticsLock = v5;

  }
  return v3;
}

- (void)sendAnalytics
{
  unint64_t end;
  unint64_t serverPostEnd;
  unint64_t serverPostStart;
  unint64_t lsProxyEnd;
  unint64_t v7;
  unint64_t tokenDaemonStart;
  unint64_t start;
  unint64_t v10;
  unint64_t tokenDaemonEnd;
  unint64_t tokenStart;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t tokenEnd;
  unint64_t lsProxyStart;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t v37;
  unint64_t v38;
  NSString *storefrontID;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD v59[12];
  _QWORD v60[12];
  uint8_t buf[4];
  unint64_t v62;
  __int16 v63;
  unint64_t v64;

  -[APUnfairLock lock](self->_analyticsLock, "lock");
  if (self->_state == 3)
  {
    end = self->_end;
    serverPostEnd = self->_serverPostEnd;
    lsProxyEnd = self->_lsProxyEnd;
    serverPostStart = self->_serverPostStart;
    if (serverPostEnd >= serverPostStart)
      v7 = serverPostEnd - serverPostStart;
    else
      v7 = 0;
    start = self->_start;
    tokenDaemonStart = self->_tokenDaemonStart;
    if (tokenDaemonStart >= start)
      v10 = tokenDaemonStart - start;
    else
      v10 = 0;
    tokenDaemonEnd = self->_tokenDaemonEnd;
    tokenStart = self->_tokenStart;
    v24 = tokenDaemonEnd >= start;
    v13 = tokenDaemonEnd - start;
    if (v24)
      v14 = v13;
    else
      v14 = 0;
    if (tokenStart >= start)
      v15 = tokenStart - start;
    else
      v15 = 0;
    tokenEnd = self->_tokenEnd;
    lsProxyStart = self->_lsProxyStart;
    v24 = tokenEnd >= start;
    v18 = tokenEnd - start;
    if (v24)
      v19 = v18;
    else
      v19 = 0;
    v20 = lsProxyStart - start;
    if (lsProxyStart < start)
      v20 = 0;
    v24 = lsProxyEnd >= start;
    v21 = lsProxyEnd - start;
    if (!v24)
      v21 = 0;
    v24 = serverPostStart >= start;
    v22 = serverPostStart - start;
    if (!v24)
      v22 = 0;
    v24 = serverPostEnd >= start;
    v23 = serverPostEnd - start;
    if (!v24)
      v23 = 0;
    v24 = end >= start;
    v25 = end - start;
    if (v24)
      v26 = v25;
    else
      v26 = 0;
    v56 = v22;
    v57 = v23;
    v54 = v20;
    v55 = v21;
    if (!v24)
    {
      v27 = APLogForCategory(4);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = self->_start;
        v30 = self->_end;
        *(_DWORD *)buf = 134218240;
        v62 = v29;
        v63 = 2048;
        v64 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Attribution start time %lu should not be greater than end time %lu", buf, 0x16u);
      }

      start = self->_start;
      tokenDaemonStart = self->_tokenDaemonStart;
    }
    if (tokenDaemonStart < start)
    {
      v31 = APLogForCategory(4);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = self->_start;
        v34 = self->_tokenDaemonStart;
        *(_DWORD *)buf = 134218240;
        v62 = v33;
        v63 = 2048;
        v64 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Attribution client start time %lu should not be greater than attribution daemon start time %lu", buf, 0x16u);
      }

    }
    if (self->_end < self->_tokenDaemonEnd)
    {
      v35 = APLogForCategory(4);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = self->_start;
        v38 = self->_tokenDaemonStart;
        *(_DWORD *)buf = 134218240;
        v62 = v37;
        v63 = 2048;
        v64 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Attribution deamon end time %lu should not be greater than Attribution client end time %lu", buf, 0x16u);
      }

    }
    v59[0] = CFSTR("attributionRoundTrip");
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
    v60[0] = v53;
    v59[1] = CFSTR("svrPostRoundTrip");
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    storefrontID = self->_storefrontID;
    v60[1] = v52;
    v60[2] = storefrontID;
    v59[2] = CFSTR("storeFront");
    v59[3] = CFSTR("DaemonStart");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    v60[3] = v51;
    v59[4] = CFSTR("DaemonEnd");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
    v60[4] = v40;
    v59[5] = CFSTR("TokenGenerateStart");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    v60[5] = v41;
    v59[6] = CFSTR("TokenGenerateEnd");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
    v60[6] = v42;
    v59[7] = CFSTR("LSProxyStart");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v54));
    v60[7] = v43;
    v59[8] = CFSTR("LSProxyEnd");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v55));
    v60[8] = v44;
    v59[9] = CFSTR("ServerPostStart");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v56));
    v60[9] = v45;
    v59[10] = CFSTR("ServerPostEnd");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
    v60[10] = v46;
    v59[11] = CFSTR("AttributionEnd");
    v58 = v26;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
    v60[11] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 12));

    +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("attribution.latency"), v48);
    v49 = APLogForCategory(4);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v62 = v58;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Attribution Roundtrip %lu", buf, 0xCu);
    }

    -[APUnfairLock unlock](self->_analyticsLock, "unlock");
  }
  else
  {
    -[APUnfairLock unlock](self->_analyticsLock, "unlock");
  }
}

- (void)sendTokenAnalytics
{
  NSString *errorCode;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSString *status;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *v12;
  int v13;
  NSString *v14;
  _QWORD v15[3];
  _QWORD v16[3];

  if (self->_status)
  {
    errorCode = self->_errorCode;
    if (errorCode)
      v4 = errorCode;
    else
      v4 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v6 = v4;
    status = self->_status;
    v15[0] = CFSTR("Status");
    v15[1] = CFSTR("Code");
    v16[0] = status;
    v16[1] = v4;
    v15[2] = CFSTR("Retry");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_retry));
    v16[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

    +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("attribution.token"), v9);
    v10 = APLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_status;
      v13 = 138543362;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Analytics token event status %{public}@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    v5 = APLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Analytics status cannot be nil", (uint8_t *)&v13, 2u);
    }
  }

}

- (void)setEnd:(unint64_t)a3
{
  unint64_t state;
  unint64_t v6;

  -[APUnfairLock lock](self->_analyticsLock, "lock");
  self->_end = a3;
  state = self->_state;
  if (!state)
  {
    v6 = 1;
    goto LABEL_5;
  }
  if (state == 2)
  {
    v6 = 3;
LABEL_5:
    self->_state = v6;
  }
  -[APUnfairLock unlock](self->_analyticsLock, "unlock");
}

- (unint64_t)end
{
  unint64_t end;

  -[APUnfairLock lock](self->_analyticsLock, "lock");
  end = self->_end;
  -[APUnfairLock unlock](self->_analyticsLock, "unlock");
  return end;
}

- (void)setServerPostEnd:(unint64_t)a3
{
  unint64_t state;
  unint64_t v6;

  -[APUnfairLock lock](self->_analyticsLock, "lock");
  self->_serverPostEnd = a3;
  state = self->_state;
  if (!state)
  {
    v6 = 2;
    goto LABEL_5;
  }
  if (state == 1)
  {
    v6 = 3;
LABEL_5:
    self->_state = v6;
  }
  -[APUnfairLock unlock](self->_analyticsLock, "unlock");
}

- (unint64_t)serverPostEnd
{
  unint64_t serverPostEnd;

  -[APUnfairLock lock](self->_analyticsLock, "lock");
  serverPostEnd = self->_serverPostEnd;
  -[APUnfairLock unlock](self->_analyticsLock, "unlock");
  return serverPostEnd;
}

+ (void)sendTokenDuplicateAnalytics:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  const __CFString *v9;
  id v10;

  v3 = a3;
  v9 = CFSTR("source");
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("attribution.duplicate"), v4);

  v5 = APLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Analytics duplicate token event status %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

+ (id)_buildPayloadForTimingAnalytics:(id)a3 startDate:(id)a4 endDate:(id)a5 additionalFields:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length"))
  {
    v13 = 0.0;
    if (v10)
    {
      if (v11)
      {
        objc_msgSend(v11, "timeIntervalSinceDate:", v10);
        v13 = v14;
        if (v14 < 0.0)
        {
          v15 = APLogForCategory(4);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136642819;
            v25 = "+[APAttributionAnalytics _buildPayloadForTimingAnalytics:startDate:endDate:additionalFields:]";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{sensitive}s] Start date is prior to end date", buf, 0xCu);
          }

        }
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)(v13 * 1000.0), v9));
    v23 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

    if (v12)
    {
      v19 = objc_msgSend(v18, "mutableCopy");
      objc_msgSend(v19, "addEntriesFromDictionary:", v12);
      v20 = objc_msgSend(v19, "copy");

      v18 = v20;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (int64_t)findBucketForDaemonRunningTime:(double)a3
{
  int64_t result;

  for (result = 0; result != 10; ++result)
  {
    if (qword_1001B73A0[result] >= (uint64_t)(a3 * 1000.0))
      break;
  }
  return result;
}

+ (id)storefrontCountryOnly:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  v4 = v3;
  v5 = CFSTR("NONE");
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-")));
    if (objc_msgSend(v6, "count"))
    {
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    }
    else
    {
      v8 = APLogForCategory(8);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error extracting storefront country only.", v11, 2u);
      }

      v7 = v4;
    }
    v5 = v7;

  }
  return v5;
}

+ (void)sendTimingAnalytics:(id)a3 startDate:(id)a4 endDate:(id)a5 additionalFields:(id)a6
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildPayloadForTimingAnalytics:startDate:endDate:additionalFields:", a3, a4, a5, a6));
  if (v6)
  {
    v7 = v6;
    +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("attribution.timings"), v6);
    v6 = v7;
  }

}

+ (void)sendTimedAnalytic:(id)a3 fieldName:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  +[APAttributionAnalytics sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:](APAttributionAnalytics, "sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:", a3, a4, a5, a6, 0);
}

+ (void)sendTimedAnalytic:(id)a3 fieldName:(id)a4 startDate:(id)a5 endDate:(id)a6 additionalFields:(id)a7
{
  void *v12;
  id v13;

  v13 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_buildPayloadForTimingAnalytics:startDate:endDate:additionalFields:", a4, a5, a6, a7));
  if (v12)
    +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", v13, v12);

}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  self->_start = a3;
}

- (unint64_t)tokenDaemonStart
{
  return self->_tokenDaemonStart;
}

- (void)setTokenDaemonStart:(unint64_t)a3
{
  self->_tokenDaemonStart = a3;
}

- (unint64_t)tokenDaemonEnd
{
  return self->_tokenDaemonEnd;
}

- (void)setTokenDaemonEnd:(unint64_t)a3
{
  self->_tokenDaemonEnd = a3;
}

- (unint64_t)tokenStart
{
  return self->_tokenStart;
}

- (void)setTokenStart:(unint64_t)a3
{
  self->_tokenStart = a3;
}

- (unint64_t)tokenEnd
{
  return self->_tokenEnd;
}

- (void)setTokenEnd:(unint64_t)a3
{
  self->_tokenEnd = a3;
}

- (unint64_t)lsProxyStart
{
  return self->_lsProxyStart;
}

- (void)setLsProxyStart:(unint64_t)a3
{
  self->_lsProxyStart = a3;
}

- (unint64_t)lsProxyEnd
{
  return self->_lsProxyEnd;
}

- (void)setLsProxyEnd:(unint64_t)a3
{
  self->_lsProxyEnd = a3;
}

- (unint64_t)serverPostStart
{
  return self->_serverPostStart;
}

- (void)setServerPostStart:(unint64_t)a3
{
  self->_serverPostStart = a3;
}

- (NSString)storefrontID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStorefrontID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)status
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)errorCode
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setErrorCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)retry
{
  return self->_retry;
}

- (void)setRetry:(int64_t)a3
{
  self->_retry = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (APUnfairLock)analyticsLock
{
  return (APUnfairLock *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnalyticsLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsLock, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
}

@end
