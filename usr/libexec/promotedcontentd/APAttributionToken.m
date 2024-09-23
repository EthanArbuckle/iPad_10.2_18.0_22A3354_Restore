@implementation APAttributionToken

- (APAttributionToken)initWithKey:(id)a3 payload:(id)a4 token:(id)a5 signature:(id)a6 detailed:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  APAttributionToken *v17;
  APAttributionToken *v18;
  uint64_t v19;
  NSString *signedAttributionToken;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = -[APAttributionToken init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_key, a3);
    objc_storeStrong((id *)&v18->_payload, a4);
    objc_storeStrong((id *)&v18->_token, a5);
    v18->_detailed = a7;
    objc_msgSend(v15, "appendData:", v16);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
    signedAttributionToken = v18->_signedAttributionToken;
    v18->_signedAttributionToken = (NSString *)v19;

  }
  return v18;
}

- (APAttributionToken)initWithKey:(id)a3 payload:(id)a4 token:(id)a5 signature:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  APAttributionToken *v15;
  APAttributionToken *v16;
  uint64_t v17;
  NSString *signedAttributionToken;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[APAttributionToken init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_key, a3);
    objc_storeStrong((id *)&v16->_payload, a4);
    objc_storeStrong((id *)&v16->_token, a5);
    objc_msgSend(v13, "appendData:", v14);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));
    signedAttributionToken = v16->_signedAttributionToken;
    v16->_signedAttributionToken = (NSString *)v17;

  }
  return v16;
}

- (APAttributionToken)initWithCachedToken:(id)a3 detailed:(BOOL)a4
{
  id v7;
  APAttributionToken *v8;
  id v9;
  uint64_t v10;
  NSData *key;
  void *v12;
  uint64_t v13;
  NSData *payload;
  void *v15;
  uint64_t v16;
  NSData *token;

  v7 = a3;
  v8 = -[APAttributionToken init](self, "init");
  if (v8)
  {
    v9 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v7, 0));
    v10 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v9, "bytes"), 32));
    key = v8->_key;
    v8->_key = (NSData *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 32, 8));
    v13 = objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v12));
    payload = v8->_payload;
    v8->_payload = (NSData *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 0, 32));
    v16 = objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v15));
    token = v8->_token;
    v8->_token = (NSData *)v16;

    objc_storeStrong((id *)&v8->_signedAttributionToken, a3);
    v8->_detailed = a4;

  }
  return v8;
}

+ (id)keyChainLock
{
  if (qword_100268870 != -1)
    dispatch_once(&qword_100268870, &stru_100213488);
  return (id)qword_100268868;
}

+ (void)tokenWithDetail:(BOOL)a3 interval:(unint64_t)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  void (**v7)(id, APAttributionToken *, uint64_t, _QWORD);
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  APAttributionToken *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_global_t global_queue;
  NSObject *v29;
  id v30;
  _QWORD block[4];
  id v32;
  unint64_t v33;
  BOOL v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  const __CFString *v38;

  v6 = a3;
  v7 = (void (**)(id, APAttributionToken *, uint64_t, _QWORD))a5;
  v8 = APLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Generating Token", buf, 2u);
    }

    v10 = objc_claimAutoreleasedReturnValue(+[APAttributionToken _getCachedToken:](APAttributionToken, "_getCachedToken:", v6));
    if (v10)
    {
      v11 = APLogForCategory(4);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Using cached Token", buf, 2u);
      }

      v13 = -[APAttributionToken initWithCachedToken:detailed:]([APAttributionToken alloc], "initWithCachedToken:detailed:", v10, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenTracker defaultTracker](APAttributionTokenTracker, "defaultTracker"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionToken signedAttributionToken](v13, "signedAttributionToken"));
      v16 = objc_msgSend(v14, "isTokenUsed:", v15);

      if ((v16 & 1) != 0)
      {
        v17 = APPerfLogForCategory(4);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = v18;
        v20 = a4 - 1;
        if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_DWORD *)buf = 134349314;
          v36 = a4;
          v37 = 2114;
          v38 = CFSTR("keychain");
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, a4, "Duplicate Token Found", "Duplicate Token Found id=%{public, name=id}lld cache=%{public, name=cache}@", buf, 0x16u);
        }

        +[APAttributionAnalytics sendTokenDuplicateAnalytics:](APAttributionAnalytics, "sendTokenDuplicateAnalytics:", CFSTR("TokenDupeKeychain"));
        v21 = APLogForCategory(4);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionToken signedAttributionToken](v13, "signedAttributionToken"));
          *(_DWORD *)buf = 138543362;
          v36 = (unint64_t)v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "cached token has already been used %{public}@", buf, 0xCu);

        }
      }
      else
      {
        v20 = a4 - 1;
      }
      v7[2](v7, v13, 1, 0);
      v24 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.attr-refill-cache");
      v25 = APPerfLogForCategory(4);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = v26;
      if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 134349056;
        v36 = a4;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, a4, "Cache GCD overhead", "id=%{public, name=id}lld", buf, 0xCu);
      }

      global_queue = dispatch_get_global_queue(9, 0);
      v29 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009FC48;
      block[3] = &unk_1002134B0;
      v34 = v6;
      v32 = v24;
      v33 = a4;
      v30 = v24;
      dispatch_async(v29, block);

    }
    else
    {
      +[APAttributionToken _generateOnDemandToken:interval:completionHandler:](APAttributionToken, "_generateOnDemandToken:interval:completionHandler:", v6, a4, v7);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No handler", buf, 2u);
  }

}

+ (id)_getCachedToken:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  APAttributionTokenStore *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionToken keyChainLock](APAttributionToken, "keyChainLock"));
  objc_msgSend(v4, "lock");

  v5 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", 0);
  v6 = -[APAttributionTokenStore initWithStorage:]([APAttributionTokenStore alloc], "initWithStorage:", v5);
  v16 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenStore getToken:error:](v6, "getToken:error:", v3, &v16));
  v8 = v16;
  if (v8)
  {
    v9 = APLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v8, "code");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
      *(_DWORD *)buf = 136643331;
      v18 = "+[APAttributionToken _getCachedToken:]";
      v19 = 2048;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{sensitive}s Error reading token from token store %ld: %{public}@", buf, 0x20u);

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionToken keyChainLock](APAttributionToken, "keyChainLock"));
  objc_msgSend(v13, "unlock");

  if (v7)
    v14 = v7;

  return v7;
}

+ (void)_generateOnDemandToken:(BOOL)a3 interval:(unint64_t)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id RandomBytes;
  void *v9;
  id Payload;
  void *v11;
  id TokenFromKey;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  BOOL v28;
  uint8_t buf[8];
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v6 = a3;
  v7 = a5;
  RandomBytes = generateRandomBytes(0x20uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(RandomBytes);
  Payload = generatePayload(8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(Payload);
  TokenFromKey = createTokenFromKey(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TokenFromKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));

  if (v14)
  {
    v15 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.attr-token-w-detail");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000A0214;
    v21[3] = &unk_1002134D8;
    v26 = v7;
    v22 = v9;
    v23 = v11;
    v27 = a4;
    v28 = v6;
    v24 = v13;
    v25 = v15;
    v17 = v15;
    objc_msgSend(v16, "rawSignatureForData:waitTime:completion:", v24, v21, 10.0);

  }
  else
  {
    v18 = APLogForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Signing Service Not available", buf, 2u);
    }

    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("Error signing token, service not available");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.attribution.token"), 1, v20));

    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v17);
  }

}

+ (void)createDetailed:(BOOL)a3 attributionTokenWithCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v5;
  id RandomBytes;
  void *v7;
  id Payload;
  void *v9;
  id TokenFromKey;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v4 = a3;
  v5 = a4;
  RandomBytes = generateRandomBytes(0x20uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(RandomBytes);
  Payload = generatePayload(8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(Payload);
  TokenFromKey = createTokenFromKey(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TokenFromKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A0764;
  v17[3] = &unk_100213500;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v5;
  v13 = v11;
  v14 = v9;
  v15 = v7;
  v16 = v5;
  objc_msgSend(v12, "rawSignatureForData:waitTime:completion:", v13, v17, 10.0);

}

+ (id)_createTokenDetailed:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  id RandomBytes;
  void *v7;
  id Payload;
  void *v9;
  id TokenFromKey;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  APAttributionToken *v16;
  uint8_t v18[16];

  v5 = a3;
  RandomBytes = generateRandomBytes(0x20uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(RandomBytes);
  Payload = generatePayload(8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(Payload);
  TokenFromKey = createTokenFromKey(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TokenFromKey);
  v12 = APLogForCategory(4);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Mescal signing request for token", v18, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[APMescalSigningService service](APMescalSigningService, "service"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rawSignatureForData:error:", v11, a4));

  if (v15 && !*a4)
    v16 = -[APAttributionToken initWithKey:payload:token:signature:]([APAttributionToken alloc], "initWithKey:payload:token:signature:", v7, v9, v11, v15);
  else
    v16 = 0;

  return v16;
}

+ (void)_refillCacheWithTokensDetail:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  APAttributionTokenStore *v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  char *v28;
  unsigned __int8 v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;

  v3 = a3;
  v4 = APLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refill cache with tokens", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionToken keyChainLock](APAttributionToken, "keyChainLock"));
  objc_msgSend(v6, "lock");

  v7 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", 0);
  v8 = -[APAttributionTokenStore initWithStorage:andSize:]([APAttributionTokenStore alloc], "initWithStorage:andSize:", v7, 5);
  v38 = 0;
  v9 = -[APAttributionTokenStore tokenCount:error:](v8, "tokenCount:error:", v3, &v38);
  v10 = v38;
  if (v10)
  {
    v11 = v10;
    v12 = APLogForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(v11, "code");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      *(_DWORD *)buf = 136315650;
      v40 = "+[APAttributionToken _refillCacheWithTokensDetail:]";
      v41 = 2048;
      v42 = v14;
      v43 = 2114;
      v44 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Error reading token count store code %ld: %{public}@", buf, 0x20u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionToken keyChainLock](APAttributionToken, "keyChainLock"));
    objc_msgSend(v16, "unlock");

  }
  else if (v9 < 5)
  {
    v35 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
    v20 = APLogForCategory(4);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = 5 - v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Attempt to fill (%d) tokens in cache", buf, 8u);
    }

    v22 = 0;
    v23 = v9 - 5;
    do
    {
      v24 = v22;
      v37 = v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionToken _createTokenDetailed:error:](APAttributionToken, "_createTokenDetailed:error:", v3, &v37));
      v22 = v37;

      if (v25)
      {
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "signedAttributionToken"));
        objc_msgSend(v19, "addObject:", v26);
      }
      else
      {
        v27 = APLogForCategory(4);
        v26 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v28 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedDescription"));
          *(_DWORD *)buf = 138543362;
          v40 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error generating token %{public}@", buf, 0xCu);

        }
      }

    }
    while (!__CFADD__(v23++, 1));
    v36 = v22;
    v30 = -[APAttributionTokenStore addTokens:isDetailed:error:](v8, "addTokens:isDetailed:error:", v19, v3, &v36);
    v11 = v36;

    v7 = v35;
    if ((v30 & 1) == 0)
    {
      v31 = APLogForCategory(4);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
        *(_DWORD *)buf = 138543362;
        v40 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error refilling tokens %{public}@", buf, 0xCu);

      }
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionToken keyChainLock](APAttributionToken, "keyChainLock"));
    objc_msgSend(v34, "unlock");

  }
  else
  {
    v17 = APLogForCategory(4);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "token cache full", buf, 2u);
    }

    v11 = (id)objc_claimAutoreleasedReturnValue(+[APAttributionToken keyChainLock](APAttributionToken, "keyChainLock"));
    objc_msgSend(v11, "unlock");
  }

}

- (NSData)token
{
  return self->_token;
}

- (NSData)key
{
  return self->_key;
}

- (NSString)signedAttributionToken
{
  return self->_signedAttributionToken;
}

- (BOOL)isDetailed
{
  return self->_detailed;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_signedAttributionToken, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
