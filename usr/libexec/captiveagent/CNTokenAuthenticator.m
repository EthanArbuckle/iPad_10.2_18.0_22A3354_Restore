@implementation CNTokenAuthenticator

- (CNTokenAuthenticator)initWithURLString:(id)a3 token:(id)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNTokenAuthenticator *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CNTokenAuthenticator *v19;
  id v20;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNTokenAuthenticator;
  v14 = -[CNTokenAuthenticator init](&v23, "init");
  if (!v14)
    goto LABEL_4;
  if (!v10)
    goto LABEL_5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
  -[CNTokenAuthenticator setUrl:](v14, "setUrl:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](v14, "url"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheme"));
  v18 = objc_msgSend(v17, "compare:options:", CFSTR("https"), 1);

  if (v18)
  {
LABEL_4:
    v19 = 0;
  }
  else
  {
LABEL_5:
    -[CNTokenAuthenticator setToken:](v14, "setToken:", v11);
    v20 = objc_alloc_init((Class)NSOperationQueue);
    -[CNTokenAuthenticator setOpQueue:](v14, "setOpQueue:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](v14, "opQueue"));
    objc_msgSend(v21, "setUnderlyingQueue:", v12);

    -[CNTokenAuthenticator setResponseHandler:](v14, "setResponseHandler:", v13);
    *(_WORD *)&v14->_isAuthorized = 0;
    v19 = v14;
  }

  return v19;
}

- (void)dealloc
{
  os_log_t v3;
  NSObject *v4;
  os_log_type_t v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = sub_100002100();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "dealloced", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CNTokenAuthenticator;
  -[CNTokenAuthenticator dealloc](&v6, "dealloc");
}

- (void)login
{
  void *v3;
  void *v4;
  NSURLSession *v5;
  NSURLSession *session;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSURLSessionDataTask *v12;
  NSURLSessionDataTask *loginDataTask;
  os_log_t v14;
  void *v15;
  os_log_type_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  CNTokenAuthenticator *v21;
  __int16 v22;
  void *v23;

  if (!self->_session)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNTokenAuthenticator sessionConfiguration](CNTokenAuthenticator, "sessionConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, self, v4));
    session = self->_session;
    self->_session = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
  if (-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds"))
    v8 = (double)-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds");
  else
    v8 = 60.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v7, 4, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator userAgent](self, "userAgent"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("User-Agent"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator interfaceName](self, "interfaceName"));
  objc_msgSend(v9, "setBoundInterfaceIdentifier:", v11);

  v12 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v9));
  loginDataTask = self->_loginDataTask;
  self->_loginDataTask = v12;

  v14 = sub_100002100();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = _SC_syslog_os_log_mapping(7);
  v17 = v15;
  if (os_log_type_enabled(v17, v16))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
    v20 = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, v16, "%@ starting token based captive portal authentication with url: [%@]", (uint8_t *)&v20, 0x16u);

  }
  -[NSURLSessionDataTask resume](self->_loginDataTask, "resume");

}

- (void)start
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[CNTokenAuthenticator tokenAuthServerDiscoveryURL](CNTokenAuthenticator, "tokenAuthServerDiscoveryURL"));
  v5 = (void *)v4;
  -[CNTokenAuthenticator setUrl:](self, "setUrl:", v4);

  -[CNTokenAuthenticator login](self, "login");
}

- (void)cancel
{
  NSURLSession *session;
  NSURLSession *v4;
  NSURLSessionDataTask *loginDataTask;

  session = self->_session;
  if (session)
  {
    -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
    v4 = self->_session;
    self->_session = 0;

  }
  loginDataTask = self->_loginDataTask;
  self->_loginDataTask = 0;

}

+ (id)sessionConfiguration
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v2, "setHTTPCookieStorage:", 0);
  objc_msgSend(v2, "setURLCache:", 0);
  objc_msgSend(v2, "setURLCredentialStorage:", 0);
  objc_msgSend(v2, "set_enableOAuthBearerTokenChallenges:", 1);
  return v2;
}

+ (id)tokenAuthServerDiscoveryURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("http://captive.apple.com/hotspot-detect.html"));
}

- (id)locationFromResponse:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allHeaderFields"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Location")));

  return v4;
}

- (void)handleRedirectResponse:(id)a3
{
  void *v4;
  os_log_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  os_log_type_t v12;
  os_log_type_t v13;
  int v14;
  CNTokenAuthenticator *v15;
  __int16 v16;
  void *v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator locationFromResponse:](self, "locationFromResponse:", a3));
  v5 = sub_100002100();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v4)
  {
    v7 = _SC_syslog_os_log_mapping(7);
    if (os_log_type_enabled(v6, v7))
    {
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ task received HTTP Redirect with location header: [%@]", (uint8_t *)&v14, 0x16u);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject scheme](v6, "scheme"));
    v9 = objc_msgSend(v8, "compare:options:", CFSTR("https"), 1);

    if (v9)
    {
      v10 = sub_100002100();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = _SC_syslog_os_log_mapping(7);
      if (os_log_type_enabled(v11, v12))
      {
        v14 = 138412290;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ task found location without https scheme", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    v13 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v6, v13))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, v13, "%@ task received HTTP Redirect without location header", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (unsigned)resultCodeFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  unsigned int v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", NSURLErrorDomain);

    if (v6)
    {
      v7 = objc_msgSend(v4, "code");
      switch((unint64_t)v7)
      {
        case 0xFFFFFFFFFFFFFC0FLL:
        case 0xFFFFFFFFFFFFFC13:
          v8 = 8;
          break;
        case 0xFFFFFFFFFFFFFC10:
        case 0xFFFFFFFFFFFFFC11:
        case 0xFFFFFFFFFFFFFC14:
        case 0xFFFFFFFFFFFFFC16:
          goto LABEL_9;
        case 0xFFFFFFFFFFFFFC12:
        case 0xFFFFFFFFFFFFFC15:
          v8 = 7;
          break;
        case 0xFFFFFFFFFFFFFC17:
          v8 = 6;
          break;
        default:
          if (v7 != (id)-1202)
            goto LABEL_9;
          v8 = 15;
          break;
      }
    }
    else
    {
LABEL_9:
      v8 = 13;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4
{
  uint64_t v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator responseHandler](self, "responseHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator responseHandler](self, "responseHandler"));
    ((void (**)(_QWORD, uint64_t, id))v7)[2](v7, v4, v8);

  }
  -[CNTokenAuthenticator cancel](self, "cancel");

}

- (void)handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  CNTokenAuthenticator *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  CNTokenAuthenticator *v24;
  unsigned int v25;
  os_log_t v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  NSURL *v30;
  NSURL *url;
  os_log_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  os_log_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  int v40;
  os_log_t v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  _QWORD block[4];
  id v49;
  int v50;
  uint8_t buf[4];
  CNTokenAuthenticator *v52;
  __int16 v53;
  void *v54;

  v8 = a3;
  v47 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v46 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "protectionSpace"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authenticationMethod"));
  v12 = sub_100002100();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = _SC_syslog_os_log_mapping(7);
  v15 = v13;
  if (os_log_type_enabled(v15, v14))
  {
    *(_DWORD *)buf = 138412546;
    v52 = (CNTokenAuthenticator *)objc_opt_class(self);
    v53 = 2114;
    v54 = v11;
    v16 = v52;
    _os_log_impl((void *)&_mh_execute_header, v15, v14, "%@ received authentication challenege with %{public}@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "currentRequest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scheme"));
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("https"));

  v21 = objc_msgSend(v11, "isEqualToString:", NSURLAuthenticationMethodOAuthBearerToken);
  v22 = v21 ^ 1;
  if (!self->_tokenAuthAttempted && (v22 & 1) == 0 && ((v20 ^ 1) & 1) == 0)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator credentialForBearerChallenge:](self, "credentialForBearerChallenge:", v46));
    goto LABEL_7;
  }
  if (!objc_msgSend(v11, "isEqualToString:", NSURLAuthenticationMethodServerTrust))
  {
    v40 = 17;
    goto LABEL_28;
  }
  v32 = sub_100002100();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v33, v34))
  {
    *(_DWORD *)buf = 138412290;
    v52 = self;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ received authentication challenege to trust server certificate", buf, 0xCu);
  }

  v35 = SecTrustEvaluateWithError((SecTrustRef)objc_msgSend(v10, "serverTrust"), 0);
  v36 = sub_100002100();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = _SC_syslog_os_log_mapping(7);
  v39 = os_log_type_enabled(v37, v38);
  if (!v35)
  {
    if (v39)
    {
      *(_DWORD *)buf = 138412290;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ failed to trust server certificate", buf, 0xCu);
    }

    v40 = 15;
LABEL_28:
    v24 = 0;
    if (((v20 | v22) & 1) != 0)
    {
LABEL_32:
      v9[2](v9, 2, 0);
      objc_initWeak((id *)buf, self);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "underlyingQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004A08;
      block[3] = &unk_100010750;
      objc_copyWeak(&v49, (id *)buf);
      v50 = v40;
      dispatch_async(v45, block);

      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)buf);
      goto LABEL_33;
    }
LABEL_29:
    v41 = sub_100002100();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v43 = _SC_syslog_os_log_mapping(6);
    if (os_log_type_enabled(v42, v43))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "insecure token based authentication is not supported", buf, 2u);
    }

    v40 = 18;
    goto LABEL_32;
  }
  if (v39)
  {
    *(_DWORD *)buf = 138412290;
    v52 = self;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ server certificate is trusted", buf, 0xCu);
  }

  v23 = objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v10, "serverTrust")));
LABEL_7:
  v24 = (CNTokenAuthenticator *)v23;
  if (v23)
    v25 = v20;
  else
    v25 = 0;
  if (v25 != 1)
  {
    if (((v20 | v22) & 1) != 0)
    {
      v9[2](v9, 1, 0);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  v26 = sub_100002100();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = _SC_syslog_os_log_mapping(6);
  if (os_log_type_enabled(v27, v28))
  {
    *(_DWORD *)buf = 138477827;
    v52 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "responding to challenge using credential %{private}@ for challenge", buf, 0xCu);
  }

  ((void (**)(id, uint64_t, CNTokenAuthenticator *))v9)[2](v9, 0, v24);
  if (v21)
  {
    self->_tokenAuthAttempted = 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "currentRequest"));
    v30 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URL"));
    url = self->_url;
    self->_url = v30;

  }
LABEL_33:

}

- (id)credentialForBearerChallenge:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  const void *OAuth2;
  id v10;

  v4 = a3;
  if (!-[NSData length](self->_token, "length"))
    goto LABEL_4;
  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator token](self, "token"));
  v7 = objc_msgSend(v5, "initWithData:encoding:", v6, 4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protectionSpace"));
  OAuth2 = (const void *)_CFURLCredentialCreateOAuth2(0, v7, objc_msgSend(v8, "realm"));

  if (OAuth2)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSURLCredential), "_initWithCFURLCredential:", OAuth2);
    CFRelease(OAuth2);
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (void)handleResponse:(unsigned int)a3 result:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  unsigned int v13;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "underlyingQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004C1C;
  v10[3] = &unk_100010778;
  objc_copyWeak(&v12, &location);
  v13 = a3;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)parseChallenge:(id)a3 outRealm:(id *)a4 outErrorCode:(id *)a5 outErrorDescription:(id *)a6
{
  id v9;
  void *v10;
  BOOL v11;
  _BYTE *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _BYTE *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  v9 = a3;
  v10 = v9;
  if (!v9
    || (unint64_t)objc_msgSend(v9, "length") < 0xE
    || objc_msgSend(v10, "rangeOfString:", CFSTR("Bearer")) == (id)0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v10, "rangeOfString:", CFSTR("realm=")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    *a6 = 0;
    *a5 = 0;
    *a4 = 0;
    v13 = objc_msgSend(v10, "rangeOfString:", CFSTR("realm="));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", &v13[v14], (_BYTE *)objc_msgSend(v10, "length") - &v13[v14]));
    if ((unint64_t)objc_msgSend(v15, "length") >= 3)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^(\").*(\")"), 1, 0));
      if (v16)
      {
        v18 = objc_msgSend(v16, "rangeOfFirstMatchInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
        if (v18 != (id)0x7FFFFFFFFFFFFFFFLL || (v19 = 0, v17))
          v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v18, v17));
        if ((unint64_t)objc_msgSend(v19, "length", v18) >= 3)
        {
          v19 = objc_retainAutorelease(v19);
          *a4 = v19;
          v20 = objc_msgSend(v15, "rangeOfString:", CFSTR("error="));
          if (v20 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
          {
            v11 = 1;
          }
          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", &v20[v21], (_BYTE *)objc_msgSend(v15, "length") - &v20[v21]));
            if ((unint64_t)objc_msgSend(v22, "length") < 3)
              goto LABEL_23;
            v23 = objc_msgSend(v16, "rangeOfFirstMatchInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length"));
            v25 = v24;

            if (v23 != (id)0x7FFFFFFFFFFFFFFFLL || (v19 = 0, v25))
            {
              v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", v23, v25));
              NSLog(CFSTR("substringForFirstMatch: [%@]"), v19);
            }
            if ((unint64_t)objc_msgSend(v19, "length") >= 3)
            {
              v19 = objc_retainAutorelease(v19);
              *a5 = v19;
              v26 = objc_msgSend(v22, "rangeOfString:", CFSTR("error_description="));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", &v26[v27], (_BYTE *)objc_msgSend(v22, "length") - &v26[v27]));
              if ((unint64_t)objc_msgSend(v28, "length") < 3)
                goto LABEL_29;
              v29 = objc_msgSend(v16, "rangeOfFirstMatchInString:options:range:", v28, 0, 0, objc_msgSend(v28, "length"));
              v31 = v30;

              if (v29 != (id)0x7FFFFFFFFFFFFFFFLL || (v19 = 0, v31))
              {
                v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringWithRange:", v29, v31));
                NSLog(CFSTR("substringForFirstMatch: [%@]"), v19);
              }
              if ((unint64_t)objc_msgSend(v19, "length") >= 3)
              {
                v19 = objc_retainAutorelease(v19);
                *a6 = v19;
                v11 = 1;
              }
              else
              {
LABEL_29:
                v11 = 0;
              }

            }
            else
            {
LABEL_23:
              v11 = 0;
            }

          }
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)handleChallengeResponse:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  os_log_t v11;
  NSObject *v12;
  os_log_type_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  os_log_t v20;
  os_log_type_t v21;
  os_log_t v22;
  os_log_type_t v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  CNTokenAuthenticator *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allHeaderFields"));
  if (!objc_msgSend(v4, "count")
    || (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("WWW-Authenticate")))) == 0)
  {
    v20 = sub_100002100();
    v12 = objc_claimAutoreleasedReturnValue(v20);
    v21 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v12, v21))
    {
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = CFSTR("WWW-Authenticate");
      _os_log_impl((void *)&_mh_execute_header, v12, v21, "%@ login data task did not receive response with [%@] header", buf, 0x16u);
    }
    v6 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    goto LABEL_18;
  }
  v6 = (void *)v5;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v7 = -[CNTokenAuthenticator parseChallenge:outRealm:outErrorCode:outErrorDescription:](self, "parseChallenge:outRealm:outErrorCode:outErrorDescription:", v5, &v26, &v25, &v24);
  v8 = v26;
  v9 = (__CFString *)v25;
  v10 = (__CFString *)v24;
  if ((v7 & 1) == 0)
  {
    v22 = sub_100002100();
    v12 = objc_claimAutoreleasedReturnValue(v22);
    v23 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v12, v23))
    {
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = CFSTR("WWW-Authenticate");
      v16 = "%@ login data task received response with invalid [%@] header";
      v17 = v12;
      v18 = v23;
      v19 = 22;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (self->_tokenAuthAttempted)
  {
    v11 = sub_100002100();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v12, v13))
    {
      v14 = CFSTR("none");
      if (v9)
        v15 = v9;
      else
        v15 = CFSTR("none");
      *(_DWORD *)buf = 138412802;
      v28 = self;
      v29 = 2112;
      if (v10)
        v14 = v10;
      v30 = v15;
      v31 = 2112;
      v32 = v14;
      v16 = "%@ token authentication failed error code: [%@], error description:[%@]";
      v17 = v12;
      v18 = v13;
      v19 = 32;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_19:

}

- (id)authResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSURL *url;
  void *v13;

  v4 = a3;
  if (v4 && self->_isAuthorized)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_tokenAuthAttempted));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, off_100014FD0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100014FE8));
    v8 = v7;
    if (self->_tokenAuthAttempted && objc_msgSend(v7, "length"))
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
    else
      v9 = 0;
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, off_100014FD8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100014FF0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, off_100014FE0);

    url = self->_url;
    if (url)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](url, "absoluteString"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, off_100014FC8);

    }
    v10 = v5;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)handleTaskCompletion
{
  NSUInteger v3;
  os_log_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  NSMutableData *receivedData;
  CNTokenAuthenticator *v9;
  os_log_t v10;
  NSObject *v11;
  os_log_type_t v12;
  CNTokenAuthenticator *v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t v16;
  NSObject *v17;
  os_log_type_t v18;
  os_log_t v19;
  os_log_type_t v20;
  id v21;
  uint8_t buf[4];
  CNTokenAuthenticator *v23;

  v3 = -[NSMutableData length](self->_receivedData, "length");
  v4 = sub_100002100();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = _SC_syslog_os_log_mapping(7);
  v7 = os_log_type_enabled(v5, v6);
  if (v3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ handleTaskCompletion: received non-zero data", buf, 0xCu);
    }

    receivedData = self->_receivedData;
    v21 = 0;
    v9 = (CNTokenAuthenticator *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", receivedData, 0, &v21));
    v5 = v21;
    if (v5)
    {
      v10 = sub_100002100();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        v23 = (CNTokenAuthenticator *)v5;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "JSON parsing failed, error: %@", buf, 0xCu);
      }
      v13 = 0;
    }
    else
    {
      v15 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0)
      {
        v13 = 0;
        goto LABEL_9;
      }
      v16 = sub_100002100();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = _SC_syslog_os_log_mapping(6);
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Token Authentication server sent : %{public}@", buf, 0xCu);
      }

      v13 = (CNTokenAuthenticator *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator authResult:](self, "authResult:", v9));
      v19 = sub_100002100();
      v11 = objc_claimAutoreleasedReturnValue(v19);
      v20 = _SC_syslog_os_log_mapping(6);
      if (os_log_type_enabled(v11, v20))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, v20, "Token Authentication Result : %{public}@", buf, 0xCu);
      }
    }

LABEL_9:
    goto LABEL_13;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ handleTaskCompletion: did not receive data", buf, 0xCu);
  }
  v13 = 0;
LABEL_13:

  if (self->_isAuthorized)
    v14 = 0;
  else
    v14 = 19;
  -[CNTokenAuthenticator handleResponse:result:](self, "handleResponse:result:", v14, v13);

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  CNTokenAuthenticator *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100002100();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138412290;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ didReceiveChallenge", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "underlyingQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000058A4;
  v22[3] = &unk_1000107A0;
  objc_copyWeak(&v26, (id *)buf);
  v23 = v12;
  v24 = v11;
  v25 = v13;
  v19 = v13;
  v20 = v11;
  v21 = v12;
  dispatch_async(v18, v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  os_log_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  id v14;
  os_log_t v15;
  void *v16;
  os_log_type_t v17;
  NSObject *v18;
  CNTokenAuthenticator *v19;
  os_log_t v20;
  NSObject *v21;
  os_log_type_t v22;
  os_log_t v23;
  NSObject *v24;
  os_log_type_t v25;
  CNTokenAuthenticator *v26;
  uint64_t v27;
  os_log_t v28;
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  CNTokenAuthenticator *v32;

  v8 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  v10 = sub_100002100();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v11, v12))
  {
    v31 = 138412290;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ didReceiveResponse", (uint8_t *)&v31, 0xCu);
  }

  v13 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    v14 = v8;
    v15 = sub_100002100();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = _SC_syslog_os_log_mapping(7);
    v18 = v16;
    if (os_log_type_enabled(v18, v17))
    {
      v19 = (CNTokenAuthenticator *)objc_msgSend(v14, "statusCode");
      v31 = 134217984;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, v17, "login data task received response with status code %lu", (uint8_t *)&v31, 0xCu);
    }

    if (objc_msgSend(v14, "statusCode") == (id)200)
    {
      self->_isAuthorized = 1;
LABEL_17:
      v9[2](v9, 1);
LABEL_22:

      goto LABEL_23;
    }
    if (self->_tokenAuthAttempted && objc_msgSend(v14, "statusCode") == (id)401)
    {
      v23 = sub_100002100();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v24, v25))
      {
        v31 = 138412290;
        v32 = self;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ token authentication failed", (uint8_t *)&v31, 0xCu);
      }

      self->_isAuthorized = 0;
      -[CNTokenAuthenticator handleChallengeResponse:](self, "handleChallengeResponse:", v14);
      v9[2](v9, 0);
      v26 = self;
      v27 = 19;
    }
    else
    {
      if (objc_msgSend(v14, "statusCode") == (id)401)
        goto LABEL_17;
      v28 = sub_100002100();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = _SC_syslog_os_log_mapping(3);
      if (os_log_type_enabled(v29, v30))
      {
        v31 = 138412290;
        v32 = self;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%@ login data task received response with unexpected status code", (uint8_t *)&v31, 0xCu);
      }

      v9[2](v9, 0);
      v26 = self;
      v27 = 1;
    }
    -[CNTokenAuthenticator handleResponse:result:](v26, "handleResponse:result:", v27, 0);
    goto LABEL_22;
  }
  v20 = sub_100002100();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = _SC_syslog_os_log_mapping(3);
  if (os_log_type_enabled(v21, v22))
  {
    v31 = 138412290;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ login data task received invalid response", (uint8_t *)&v31, 0xCu);
  }

  v9[2](v9, 0);
  -[CNTokenAuthenticator handleResponse:result:](self, "handleResponse:result:", 1, 0);
LABEL_23:

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  os_log_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  os_log_t v22;
  void *v23;
  os_log_type_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  os_log_t v35;
  void *v36;
  os_log_type_t v37;
  NSObject *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  CNTokenAuthenticator *v44;
  __int16 v45;
  void *v46;

  v10 = a6;
  v11 = (void (**)(id, void *))a7;
  v12 = a5;
  v13 = sub_100002100();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v14, v15))
  {
    v43 = 138412290;
    v44 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ willPerformHTTPRedirection", (uint8_t *)&v43, 0xCu);
  }

  -[CNTokenAuthenticator handleRedirectResponse:](self, "handleRedirectResponse:", v12);
  v16 = v10;
  v17 = v16;
  if (!self->_tokenAuthAttempted)
  {
    v18 = objc_alloc((Class)NSURLComponents);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "absoluteString"));
    v21 = objc_msgSend(v18, "initWithString:", v20);

    v17 = v16;
    if (!v21)
    {
LABEL_18:

      goto LABEL_19;
    }
    v22 = sub_100002100();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = _SC_syslog_os_log_mapping(7);
    v25 = v23;
    if (os_log_type_enabled(v25, v24))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));
      v43 = 138412546;
      v44 = self;
      v45 = 2112;
      v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, v24, "%@ Current URL String: [%@]", (uint8_t *)&v43, 0x16u);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "queryItems"));
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "queryItems"));
      v30 = objc_msgSend(v29, "mutableCopy");

      v17 = v16;
      if (objc_msgSend(v30, "indexOfObjectPassingTest:", &stru_1000107E0) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v30 = objc_alloc_init((Class)NSMutableArray);
    }
    v31 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("authorized"), CFSTR("true"));
    objc_msgSend(v30, "addObject:", v31);
    objc_msgSend(v21, "setQueryItems:", v30);
    v32 = objc_alloc((Class)NSURL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));
    v34 = objc_msgSend(v32, "initWithString:", v33);

    v35 = sub_100002100();
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = _SC_syslog_os_log_mapping(7);
    v38 = v36;
    if (os_log_type_enabled(v38, v37))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));
      v43 = 138412546;
      v44 = self;
      v45 = 2112;
      v46 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, v37, "%@ New URL String: [%@]", (uint8_t *)&v43, 0x16u);

    }
    if (-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds"))
      v40 = (double)-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds");
    else
      v40 = 60.0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v34, 4, v40));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator userAgent](self, "userAgent"));
    objc_msgSend(v17, "setValue:forHTTPHeaderField:", v41, CFSTR("User-Agent"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator interfaceName](self, "interfaceName"));
    objc_msgSend(v17, "setBoundInterfaceIdentifier:", v42);

    goto LABEL_17;
  }
LABEL_19:
  v11[2](v11, v17);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  os_log_type_t v9;
  NSMutableData *receivedData;
  NSMutableData *v11;
  NSMutableData *v12;
  int v13;
  CNTokenAuthenticator *v14;

  v6 = a5;
  v7 = sub_100002100();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v8, v9))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ didReceiveData", (uint8_t *)&v13, 0xCu);
  }

  if (self->_isAuthorized && objc_msgSend(v6, "length"))
  {
    receivedData = self->_receivedData;
    if (!receivedData)
    {
      v11 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
      v12 = self->_receivedData;
      self->_receivedData = v11;

      receivedData = self->_receivedData;
    }
    -[NSMutableData appendData:](receivedData, "appendData:", v6);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  os_log_t v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  unsigned int v11;
  os_log_t v12;
  NSObject *v13;
  os_log_type_t v14;
  CNTokenAuthenticator *v15;
  uint64_t v16;
  int v17;
  CNTokenAuthenticator *v18;
  __int16 v19;
  id v20;

  v6 = a5;
  v7 = sub_100002100();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v8, v9))
  {
    v17 = 138412290;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ didCompleteWithError", (uint8_t *)&v17, 0xCu);
  }

  if (v6
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain")),
        v11 = objc_msgSend(v10, "isEqualToString:", NSURLErrorDomain),
        v10,
        v11))
  {
    v12 = sub_100002100();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v13, v14))
    {
      v17 = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ session task completed with error %@", (uint8_t *)&v17, 0x16u);
    }

    switch((unint64_t)objc_msgSend(v6, "code"))
    {
      case 0xFFFFFFFFFFFFFC0FLL:
      case 0xFFFFFFFFFFFFFC13:
        v15 = self;
        v16 = 8;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC12:
      case 0xFFFFFFFFFFFFFC15:
        v15 = self;
        v16 = 7;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC17:
        v15 = self;
        v16 = 6;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC19:
        break;
      default:
        v15 = self;
        v16 = 13;
LABEL_13:
        -[CNTokenAuthenticator handleResponse:result:](v15, "handleResponse:result:", v16, 0);
        break;
    }
  }
  else
  {
    -[CNTokenAuthenticator handleTaskCompletion](self, "handleTaskCompletion");
  }

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  os_log_t v6;
  NSObject *v7;
  os_log_type_t v8;
  os_log_t v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  CNTokenAuthenticator *v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = sub_100002100();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = _SC_syslog_os_log_mapping(7);
  if (os_log_type_enabled(v7, v8))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ didBecomeInvalidWithError", (uint8_t *)&v12, 0xCu);
  }

  if (v5)
  {
    v9 = sub_100002100();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = _SC_syslog_os_log_mapping(3);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ session invalidated with error %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (unsigned)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(unsigned int)a3
{
  self->_timeoutSeconds = a3;
}

- (NSOperationQueue)opQueue
{
  return self->_opQueue;
}

- (void)setOpQueue:(id)a3
{
  objc_storeStrong((id *)&self->_opQueue, a3);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLSessionDataTask)loginDataTask
{
  return self->_loginDataTask;
}

- (void)setLoginDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_loginDataTask, a3);
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
  objc_storeStrong((id *)&self->_receivedData, a3);
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_loginDataTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
