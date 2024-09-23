@implementation NSPProxyTokenInfo

- (NSString)description
{
  id v3;
  void *v4;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo proxyURL](self->_proxyInfo, "proxyURL"));
    sub_1000418A4(v3, v4, CFSTR("Proxy URL"), 0, 14);

    sub_100042144(v3, self->_tokenCount, (uint64_t)CFSTR("Proxy tokens count"), 0, 14);
    sub_1000418A4(v3, self->_tokenAgentUUID, CFSTR("Proxy token Agent UUID"), 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSPPrivacyProxyProxyInfo *proxyInfo;
  NSPPrivacyProxyProxyInfo *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  NSPPrivacyProxyTokenRegistration *tokenRegistration;
  objc_super v13;
  uint8_t buf[4];
  void *v15;

  v4 = nplog_obj(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
      proxyInfo = self->_proxyInfo;
    else
      proxyInfo = 0;
    v7 = proxyInfo;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo vendor](v7, "vendor"));
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc: Proxy Token Info : \"%@\", buf, 0xCu);

  }
  sub_10000B9FC((uint64_t)self, v9, v10);
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mergeTokenStats:", self);

    tokenRegistration = self->_tokenRegistration;
  }
  else
  {
    objc_msgSend(0, "mergeTokenStats:", 0);
    tokenRegistration = 0;
  }
  sub_100005E50((uint64_t)tokenRegistration);
  sub_10000BC74((uint64_t)self);
  v13.receiver = self;
  v13.super_class = (Class)NSPProxyTokenInfo;
  -[NSPProxyTokenInfo dealloc](&v13, "dealloc");
}

- (NSPProxyTokenInfo)init
{
  NSPProxyTokenInfo *v2;
  uint64_t v3;
  NSUUID *tokenAgentUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPProxyTokenInfo;
  v2 = -[NSPProxyTokenInfo init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    tokenAgentUUID = v2->_tokenAgentUUID;
    v2->_tokenAgentUUID = (NSUUID *)v3;

  }
  return v2;
}

- (NSPProxyTokenInfo)initWithCoder:(id)a3
{
  id v4;
  NSPProxyTokenInfo *v5;
  id v6;
  uint64_t v7;
  NSPPrivacyProxyProxyInfo *proxyInfo;
  id v9;
  uint64_t v10;
  NSUUID *tokenAgentUUID;
  id v12;
  uint64_t v13;
  NSDate *tokenFetchRetryDate;
  id v15;
  uint64_t v16;
  NSData *networkSignature;

  v4 = a3;
  v5 = -[NSPProxyTokenInfo init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPPrivacyProxyProxyInfo), CFSTR("proxyInfo"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    proxyInfo = v5->_proxyInfo;
    v5->_proxyInfo = (NSPPrivacyProxyProxyInfo *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("proxyTokenAgentUUID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    tokenAgentUUID = v5->_tokenAgentUUID;
    v5->_tokenAgentUUID = (NSUUID *)v10;

    v5->_tokenFetchRetryAttempt = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxyTokenFetchRetryAttempt"));
    v5->_tokenFetchRetryOnKeyOrNetworkChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyTokenFetchRetryOnNetworkOrKeyChange"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("proxyTokenFetchRetryDate"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    tokenFetchRetryDate = v5->_tokenFetchRetryDate;
    v5->_tokenFetchRetryDate = (NSDate *)v13;

    v5->_useDefaultInterface = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyTokenUseDefaultInterface"));
    v5->_subscriber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyTokenSubscriber"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("proxyTokenNetworkSignature"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    networkSignature = v5->_networkSignature;
    v5->_networkSignature = (NSData *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *networkSignature;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_proxyInfo, CFSTR("proxyInfo"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_tokenAgentUUID, CFSTR("proxyTokenAgentUUID"));
    objc_msgSend(v5, "encodeInteger:forKey:", self->_tokenFetchRetryAttempt, CFSTR("proxyTokenFetchRetryAttempt"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_tokenFetchRetryOnKeyOrNetworkChange, CFSTR("proxyTokenFetchRetryOnNetworkOrKeyChange"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_tokenFetchRetryDate, CFSTR("proxyTokenFetchRetryDate"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_useDefaultInterface, CFSTR("proxyTokenUseDefaultInterface"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_subscriber, CFSTR("proxyTokenSubscriber"));
    networkSignature = self->_networkSignature;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("proxyInfo"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("proxyTokenAgentUUID"));
    objc_msgSend(v5, "encodeInteger:forKey:", 0, CFSTR("proxyTokenFetchRetryAttempt"));
    objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("proxyTokenFetchRetryOnNetworkOrKeyChange"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("proxyTokenFetchRetryDate"));
    objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("proxyTokenUseDefaultInterface"));
    objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("proxyTokenSubscriber"));
    networkSignature = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", networkSignature, CFSTR("proxyTokenNetworkSignature"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPProxyTokenInfo *v4;
  uint64_t v5;
  id WeakRetained;
  unint64_t tokenCount;
  NSUUID *tokenAgentUUID;
  NSUUID *v9;
  BOOL tokenRequestPending;
  unint64_t tokenFetchRetryAttempt;
  BOOL tokenFetchRetryOnKeyOrNetworkChange;
  BOOL useDefaultInterface;
  BOOL subscriber;
  unint64_t tokenFetchSuccessCount;
  unint64_t tokenConsumedCount;
  unint64_t tokenExpiredCount;
  unint64_t tokenFetchFailedCount;
  unint64_t agentLowWaterMarkHitCount;
  unint64_t cacheLowWaterMarkHitCount;
  unint64_t badTokenCount;
  unint64_t missingTokenCount;
  NSPProxyTokenInfo *v23;
  id v24;

  v4 = -[NSPProxyTokenInfo init](+[NSPProxyTokenInfo allocWithZone:](NSPProxyTokenInfo, "allocWithZone:", a3), "init");
  v5 = (uint64_t)v4;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  WeakRetained = 0;
  if (v4)
LABEL_3:
    objc_storeWeak((id *)(v5 + 16), WeakRetained);
LABEL_4:

  if (self)
  {
    sub_10000D344(v5, self->_proxyInfo);
    tokenCount = self->_tokenCount;
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  sub_10000D344(v5, 0);
  tokenCount = 0;
  if (v5)
LABEL_6:
    *(_QWORD *)(v5 + 32) = tokenCount;
LABEL_7:
  if (self)
  {
    sub_10000D354(v5, self->_tokenRegistration);
    tokenAgentUUID = self->_tokenAgentUUID;
  }
  else
  {
    sub_10000D354(v5, 0);
    tokenAgentUUID = 0;
  }
  v9 = tokenAgentUUID;
  if (v5)
    objc_storeStrong((id *)(v5 + 48), tokenAgentUUID);

  if (self)
  {
    sub_10000D364(v5, self->_tokenPath);
    tokenRequestPending = self->_tokenRequestPending;
    if (!v5)
      goto LABEL_14;
    goto LABEL_13;
  }
  sub_10000D364(v5, 0);
  tokenRequestPending = 0;
  if (v5)
LABEL_13:
    *(_BYTE *)(v5 + 8) = tokenRequestPending;
LABEL_14:
  if (self)
  {
    sub_10000BB1C(v5, self->_tokenFetchRetryTimer);
    tokenFetchRetryAttempt = self->_tokenFetchRetryAttempt;
    if (!v5)
      goto LABEL_17;
    goto LABEL_16;
  }
  sub_10000BB1C(v5, 0);
  tokenFetchRetryAttempt = 0;
  if (v5)
LABEL_16:
    *(_QWORD *)(v5 + 72) = tokenFetchRetryAttempt;
LABEL_17:
  if (self)
  {
    tokenFetchRetryOnKeyOrNetworkChange = self->_tokenFetchRetryOnKeyOrNetworkChange;
    if (!v5)
      goto LABEL_20;
    goto LABEL_19;
  }
  tokenFetchRetryOnKeyOrNetworkChange = 0;
  if (v5)
LABEL_19:
    *(_BYTE *)(v5 + 9) = tokenFetchRetryOnKeyOrNetworkChange;
LABEL_20:
  if (self)
  {
    sub_10000BB2C(v5, self->_tokenFetchRetryDate);
    useDefaultInterface = self->_useDefaultInterface;
    if (!v5)
      goto LABEL_23;
    goto LABEL_22;
  }
  sub_10000BB2C(v5, 0);
  useDefaultInterface = 0;
  if (v5)
LABEL_22:
    *(_BYTE *)(v5 + 10) = useDefaultInterface;
LABEL_23:
  if (self)
  {
    subscriber = self->_subscriber;
    if (!v5)
      goto LABEL_26;
    goto LABEL_25;
  }
  subscriber = 0;
  if (v5)
LABEL_25:
    *(_BYTE *)(v5 + 11) = subscriber;
LABEL_26:
  if (self)
  {
    tokenFetchSuccessCount = self->_tokenFetchSuccessCount;
    if (!v5)
      goto LABEL_29;
    goto LABEL_28;
  }
  tokenFetchSuccessCount = 0;
  if (v5)
LABEL_28:
    *(_QWORD *)(v5 + 88) = tokenFetchSuccessCount;
LABEL_29:
  if (self)
  {
    tokenConsumedCount = self->_tokenConsumedCount;
    if (!v5)
      goto LABEL_32;
    goto LABEL_31;
  }
  tokenConsumedCount = 0;
  if (v5)
LABEL_31:
    *(_QWORD *)(v5 + 96) = tokenConsumedCount;
LABEL_32:
  if (self)
  {
    tokenExpiredCount = self->_tokenExpiredCount;
    if (!v5)
      goto LABEL_35;
    goto LABEL_34;
  }
  tokenExpiredCount = 0;
  if (v5)
LABEL_34:
    *(_QWORD *)(v5 + 104) = tokenExpiredCount;
LABEL_35:
  if (self)
  {
    tokenFetchFailedCount = self->_tokenFetchFailedCount;
    if (!v5)
      goto LABEL_38;
    goto LABEL_37;
  }
  tokenFetchFailedCount = 0;
  if (v5)
LABEL_37:
    *(_QWORD *)(v5 + 112) = tokenFetchFailedCount;
LABEL_38:
  if (self)
  {
    agentLowWaterMarkHitCount = self->_agentLowWaterMarkHitCount;
    if (!v5)
      goto LABEL_41;
    goto LABEL_40;
  }
  agentLowWaterMarkHitCount = 0;
  if (v5)
LABEL_40:
    *(_QWORD *)(v5 + 120) = agentLowWaterMarkHitCount;
LABEL_41:
  if (self)
  {
    cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    if (!v5)
      goto LABEL_44;
    goto LABEL_43;
  }
  cacheLowWaterMarkHitCount = 0;
  if (v5)
LABEL_43:
    *(_QWORD *)(v5 + 128) = cacheLowWaterMarkHitCount;
LABEL_44:
  if (self)
  {
    badTokenCount = self->_badTokenCount;
    if (!v5)
      goto LABEL_47;
    goto LABEL_46;
  }
  badTokenCount = 0;
  if (v5)
LABEL_46:
    *(_QWORD *)(v5 + 136) = badTokenCount;
LABEL_47:
  if (self)
  {
    missingTokenCount = self->_missingTokenCount;
    if (!v5)
      goto LABEL_50;
    goto LABEL_49;
  }
  missingTokenCount = 0;
  if (v5)
LABEL_49:
    *(_QWORD *)(v5 + 144) = missingTokenCount;
LABEL_50:
  if (self)
    self = (NSPProxyTokenInfo *)self->_networkSignature;
  v23 = self;
  if (v5)
    objc_storeStrong((id *)(v5 + 152), self);

  v24 = (id)v5;
  return v24;
}

- (void)tokenLowWaterMarkReached
{
  void *v3;
  NSPPrivacyProxyProxyInfo *proxyInfo;
  NSPPrivacyProxyProxyInfo *v5;
  void *v6;
  uint64_t v7;

  if (self)
    ++self->_agentLowWaterMarkHitCount;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (self)
    proxyInfo = self->_proxyInfo;
  else
    proxyInfo = 0;
  v5 = proxyInfo;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo vendor](v5, "vendor"));
  v7 = sub_10000D9B0((uint64_t)self);

  +[NSPCoreData saveTokenEvent:eventType:vendor:tokenCount:](NSPCoreData, "saveTokenEvent:eventType:vendor:tokenCount:", v3, 0, v6, v7);
  sub_10000C8EC((uint64_t)self);
  sub_10000E8D0((uint64_t)self);
}

- (void)reportErrorForTokenRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSPPrivacyProxyProxyInfo *proxyInfo;
  NSPPrivacyProxyProxyInfo *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id WeakRetained;
  int v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int128 buffer;
  _OWORD v40[3];

  v8 = (id *)a3;
  buffer = 0u;
  memset(v40, 0, sizeof(v40));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NWNetworkAgentStartOptionClientUUID));
  v12 = (void *)v9;
  if (!v9)
  {
    v22 = 0;
    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](NWPath, "pathForClientID:", v9));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interface"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parameters"));
    v17 = objc_msgSend(v16, "pid");
    if (v17)
    {
      v18 = v17;
      v19 = proc_pidinfo(v17, 13, 1uLL, &buffer, 64);
      if ((_DWORD)v19 == 64)
      {
        v22 = (const char *)v40;
LABEL_12:

        goto LABEL_13;
      }
      v23 = nplog_obj(v19, v20, v21);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v33 = 67109120;
        v34 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v33, 8u);
      }

    }
    v22 = 0;
    goto LABEL_12;
  }
  v22 = 0;
LABEL_13:

LABEL_14:
  v25 = nplog_obj(v9, v10, v11);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    if (!v22)
      v22 = "none";
    if (self)
      proxyInfo = self->_proxyInfo;
    else
      proxyInfo = 0;
    v28 = proxyInfo;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo vendor](v28, "vendor"));
    v33 = 67109634;
    v34 = a4;
    v35 = 2080;
    v36 = v22;
    v37 = 2112;
    v38 = v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Received error (%d) from %s for \"%@\" agent", (uint8_t *)&v33, 0x1Cu);

  }
  if (a4 == 81)
  {
    if (self)
      ++self->_missingTokenCount;
    sub_10000C8EC((uint64_t)self);
    sub_10000E8D0((uint64_t)self);
    sub_10000DBDC((uint64_t)self);
  }
  else if (a4 == 80)
  {
    if (self)
    {
      ++self->_badTokenCount;
      if (v8)
        objc_msgSend(v8[3], "flushTokens");
      sub_10000DA40((uint64_t)self, v30, v31);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      if (v8)
        objc_msgSend(v8[3], "flushTokens");
      WeakRetained = 0;
    }
    objc_msgSend(WeakRetained, "tokenInfoInvalid:", self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSignature, 0);
  objc_storeStrong((id *)&self->_tokenFetchRetryDate, 0);
  objc_storeStrong((id *)&self->_tokenFetchRetryTimer, 0);
  objc_storeStrong((id *)&self->_tokenPath, 0);
  objc_storeStrong((id *)&self->_tokenAgentUUID, 0);
  objc_storeStrong((id *)&self->_tokenRegistration, 0);
  objc_storeStrong((id *)&self->_proxyInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
