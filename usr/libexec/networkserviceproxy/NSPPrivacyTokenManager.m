@implementation NSPPrivacyTokenManager

+ (id)sharedTokenManager
{
  if (qword_100112F18 != -1)
    dispatch_once(&qword_100112F18, &stru_1000F6C78);
  return (id)qword_100112F10;
}

- (id)description
{
  return CFSTR("Privacy Token Manager");
}

- (id)tokenFetchURL
{
  return self->_tokenFetchURL;
}

- (BOOL)updateTokenFetchURL:(id)a3 accessTokenURL:(id)a4 accessTokenTypes:(id)a5 accessTokenBlockedIssuers:(id)a6 authenticationType:(int)a7 ignoreInvalidCerts:(BOOL)a8
{
  uint64_t v9;
  char *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  BOOL v31;
  __objc2_class *v32;
  uint64_t v34;
  NSObject *v35;
  id v36;
  BOOL v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  __CFString *v44;

  v9 = *(_QWORD *)&a7;
  v15 = (char *)a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v38 = v18;
  if (!v15)
  {
    v34 = nplog_obj(v18, v19, v20);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[NSPPrivacyTokenManager updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authe"
            "nticationType:ignoreInvalidCerts:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "%s called with null tokenFetchURL", buf, 0xCu);
    }

    goto LABEL_26;
  }
  v37 = a8;
  v21 = nplog_obj(v18, v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (!(_DWORD)v9)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[NSPPrivacyTokenManager updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authe"
            "nticationType:ignoreInvalidCerts:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null (authenticationType != NSPPrivacyProxyAuthenticationInfo_AuthenticationType_UNKNOWN)", buf, 0xCu);
    }

LABEL_26:
    v31 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v16;
    if (v9 >= 5)
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v9));
    else
      v24 = off_1000F6F60[(int)v9 - 1];
    *(_DWORD *)buf = 138412802;
    v40 = v15;
    v41 = 2112;
    v42 = v36;
    v43 = 2112;
    v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updating token fetch url %@ access token url %@ authentication type %@", buf, 0x20u);

    v16 = v36;
  }

  objc_storeStrong((id *)&self->_tokenFetchURL, a3);
  objc_storeStrong((id *)&self->_accessTokenURL, a4);
  objc_storeStrong((id *)&self->_accessTokenTypes, a5);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, a6);
  self->_ignoreInvalidCerts = v37;
  switch((_DWORD)v9)
  {
    case 3:
      if (!sub_100049ED4())
      {
        v32 = NSPBAA_Anisette;
        goto LABEL_18;
      }
      goto LABEL_15;
    case 2:
      v32 = NSPAnisette;
      goto LABEL_18;
    case 1:
LABEL_15:
      v32 = NSPBAA;
LABEL_18:
      self->_authenticationClass = (Class)objc_opt_class(v32);
      v31 = 1;
      goto LABEL_19;
  }
  v28 = v16;
  v29 = nplog_obj(v25, v26, v27);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "invalid authentication type %d", buf, 8u);
  }

  v31 = 0;
  v16 = v28;
LABEL_19:

  return v31;
}

- (void)fetchPrivacyTokensOnInterface:(id)a3 tierType:(id)a4 proxyURL:(id)a5 tokenVendor:(id)a6 tokenIssuancePublicKey:(id)a7 tokenChallenge:(id)a8 tokenCount:(unint64_t)a9 accessToken:(id)a10 retryAttempt:(unint64_t)a11 completionHandler:(id)a12
{
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSPPrivateAccessTokenChallenge *v25;
  NSPPrivacyTokenManager *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  void *v58;
  NSPPrivateAccessTokenRequest *v59;
  void *v60;
  id v61;
  id v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *j;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSPPrivacyTokenManager *v81;
  _BOOL8 ignoreInvalidCerts;
  BOOL v83;
  void *v84;
  void *v85;
  Class authenticationClass;
  id v87;
  id v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  char *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  NSPPrivateAccessTokenChallenge *v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131[3];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  id v140;
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  const char *v144;
  __int16 v145;
  id v146;

  v109 = a3;
  v113 = a4;
  v116 = a5;
  v112 = a6;
  v17 = a7;
  v114 = a8;
  v111 = a10;
  v115 = a12;
  v18 = NPGetInternalQueue(v115);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  dispatch_assert_queue_V2(v19);

  if (!v116)
  {
    v93 = nplog_obj(v20, v21, v22);
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_FAULT, "%s called with null proxyURL", buf, 0xCu);
    }
    goto LABEL_79;
  }
  if (!a9)
  {
    v95 = nplog_obj(v20, v21, v22);
    v94 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_FAULT, "%s called with null (tokenCount > 0)", buf, 0xCu);
    }
    goto LABEL_79;
  }
  if (!v17)
  {
    v96 = nplog_obj(v20, v21, v22);
    v94 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_FAULT, "%s called with null tokenIssuancePublicKey", buf, 0xCu);
    }
LABEL_79:

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v115 + 2))(v115, 0, 0, 0, 0, 0, 0);
    goto LABEL_64;
  }
  if (!v114)
  {
    v25 = 0;
    v26 = self;
LABEL_10:
    if (v26)
      v26->_totalRequestedTokenCount += a9;
    v29 = objc_alloc_init((Class)NSPPrivacyProxyTokenInfo);
    v140 = 0;
    v110 = objc_msgSend(objc_alloc((Class)RSABSSATokenBlinder), "initWithPublicKey:error:", v17, &v140);
    v30 = (char *)v140;
    v107 = v30;
    if (v30)
    {
      v33 = nplog_obj(v30, v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v144 = v107;
        v145 = 2112;
        v146 = v116;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "RSABSSATokenBlinder initWithPublicKey failed with error %@ for %@", buf, 0x16u);
      }
    }
    else
    {
      if (v110)
      {
        if (v25)
        {
          v119 = objc_alloc_init((Class)NSMutableArray);
          v118 = objc_alloc_init((Class)NSMutableArray);
          v35 = a9;
          while (1)
          {
            v36 = sub_1000AB1DC((uint64_t)NSPPrivateAccessTokenRequest);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v36);
            if (!v39)
              break;
            v40 = sub_1000AB420((uint64_t)NSPPrivateAccessTokenRequest, v25, v39, v17);
            v43 = (void *)objc_claimAutoreleasedReturnValue(v40);
            if (!v43)
            {
              v91 = nplog_obj(0, v41, v42);
              v92 = objc_claimAutoreleasedReturnValue(v91);
              if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuanc"
                       "ePublicKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
                _os_log_fault_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_FAULT, "%s called with null messageToBlind", buf, 0xCu);
              }

              (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v115 + 2))(v115, 0, 0, 0, 0, 0, 1);
              goto LABEL_62;
            }
            objc_msgSend(v119, "addObject:", v43);
            objc_msgSend(v118, "addObject:", v39);

            if (!--v35)
            {
              v44 = v119;
              goto LABEL_24;
            }
          }
          v89 = nplog_obj(0, v37, v38);
          v90 = objc_claimAutoreleasedReturnValue(v89);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePub"
                   "licKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
            _os_log_fault_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_FAULT, "%s called with null clientNonce", buf, 0xCu);
          }

          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v115 + 2))(v115, 0, 0, 0, 0, 0, 1);
        }
        else
        {
          v118 = 0;
          v44 = 0;
LABEL_24:
          v119 = v44;
          v45 = sub_10009CBB8((uint64_t)self, v110, v44, (id)a9);
          v108 = (void *)objc_claimAutoreleasedReturnValue(v45);
          if (objc_msgSend(v108, "count"))
          {
            v48 = objc_msgSend(v108, "count");
            if (self)
              self->_totalUnactivatedTokenCount += (unint64_t)v48;
            v51 = nplog_obj(v48, v49, v50);
            v52 = objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = (const char *)objc_msgSend(v108, "count");
              *(_DWORD *)buf = 134218242;
              v144 = v53;
              v145 = 2112;
              v146 = v112;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "generated %lu unactivated tokens for %@", buf, 0x16u);
            }

            if (v25)
            {
              v134 = 0uLL;
              v135 = 0uLL;
              v132 = 0uLL;
              v133 = 0uLL;
              v54 = v108;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
              if (v55)
              {
                v56 = *(_QWORD *)v133;
                while (2)
                {
                  for (i = 0; i != v55; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v133 != v56)
                      objc_enumerationMutation(v54);
                    v58 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)i);
                    v59 = [NSPPrivateAccessTokenRequest alloc];
                    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "blindedMessage"));
                    v61 = sub_1000AB6C4((uint64_t)v59, v25, v17, 0, 0, v60);

                    if (!v61 || (v62 = objc_getProperty(v61, v63, 24, 1)) == 0)
                    {
                      v100 = nplog_obj(v62, v63, v64);
                      v101 = objc_claimAutoreleasedReturnValue(v100);
                      if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315138;
                        v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:toke"
                               "nIssuancePublicKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
                        _os_log_fault_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_FAULT, "%s called with null requestData", buf, 0xCu);
                      }

                      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v115 + 2))(v115, 0, 0, 0, 0, 0, 1);
                      goto LABEL_61;
                    }
                    v65 = v62;
                    objc_msgSend(v29, "addTokenRequestList:", v62);

                  }
                  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
                  if (v55)
                    continue;
                  break;
                }
              }
            }
            else
            {
              v138 = 0uLL;
              v139 = 0uLL;
              v136 = 0uLL;
              v137 = 0uLL;
              v66 = v108;
              v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
              if (v67)
              {
                v68 = *(_QWORD *)v137;
                do
                {
                  for (j = 0; j != v67; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v137 != v68)
                      objc_enumerationMutation(v66);
                    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1)
                                                                                       + 8 * (_QWORD)j), "blindedMessage"));
                    objc_msgSend(v29, "addUnactivatedTokenList:", v70);

                  }
                  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
                }
                while (v67);
              }
            }

            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "keyId"));
            objc_msgSend(v29, "setTokenKeyID:", v71);

            objc_msgSend(v29, "setProxyURL:", v116);
            objc_msgSend(v29, "setVendor:", v112);
            v72 = objc_alloc_init((Class)NSPPrivacyProxyTokenActivationQuery);
            objc_msgSend(v72, "setTokenInfo:", v29);
            v102 = (void *)mach_absolute_time();
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyTokenManager tokenFetchURL](self, "tokenFetchURL"));
            v74 = sub_10009D288((uint64_t)self, v73, v109, 0, 0, a11 != 0);
            v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

            if (v113)
              objc_msgSend(v75, "setValue:forHTTPHeaderField:", v113, CFSTR("X-Mask-User-Tier"));
            if (v111)
              objc_msgSend(v75, "setValue:forHTTPHeaderField:", v111, CFSTR("X-Mask-Subscription-Token"));
            v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a11));
            if (v104)
              objc_msgSend(v75, "setValue:forHTTPHeaderField:", v104, CFSTR("Retry-Attempt"));
            v106 = objc_alloc_init((Class)NSURLSessionDelegate);
            v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "_socketStreamProperties"));
            if (v77)
            {
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "_socketStreamProperties"));
              v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v78));

            }
            else
            {
              v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            }

            objc_msgSend(v105, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, _kCFStreamPropertyPrefersNoProxy);
            objc_msgSend(v76, "set_socketStreamProperties:", v105);
            objc_msgSend(v76, "setTimeoutIntervalForRequest:", 60.0);
            objc_msgSend(v76, "set_loggingPrivacyLevel:", 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyTokenManager tokenFetchURL](self, "tokenFetchURL"));
            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v79));

            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "host"));
            objc_msgSend(v106, "setValidationHostname:", v80);

            if (self)
            {
              v81 = self;
              ignoreInvalidCerts = self->_ignoreInvalidCerts;
            }
            else
            {
              ignoreInvalidCerts = 0;
              v81 = 0;
            }
            v83 = v81 == 0;
            objc_msgSend(v106, "setIgnoreInvalidCerts:", ignoreInvalidCerts);
            v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v76, v106, v84));

            objc_msgSend(v85, "setSessionDescription:", CFSTR("PrivacyProxyTokenFetch"));
            objc_initWeak((id *)buf, self);
            if (v83)
              authenticationClass = 0;
            else
              authenticationClass = self->_authenticationClass;
            v120[0] = _NSConcreteStackBlock;
            v120[1] = 3221225472;
            v120[2] = sub_10009E3DC;
            v120[3] = &unk_1000F6CC8;
            objc_copyWeak(v131, (id *)buf);
            v87 = v85;
            v121 = v87;
            v88 = v75;
            v122 = v88;
            v130 = v115;
            v123 = v108;
            v124 = v25;
            v125 = v17;
            v126 = v118;
            v127 = v112;
            v128 = v116;
            v129 = v113;
            v131[1] = (id)a9;
            v131[2] = v102;
            -[objc_class sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:](authenticationClass, "sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:", v88, v87, v72, v120);

            objc_destroyWeak(v131);
            objc_destroyWeak((id *)buf);

          }
          else
          {
            v98 = nplog_obj(0, v46, v47);
            v99 = objc_claimAutoreleasedReturnValue(v98);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuanceP"
                     "ublicKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
              _os_log_fault_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_FAULT, "%s called with null (tokenWaitingActivationList.count > 0)", buf, 0xCu);
            }

            (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v115 + 2))(v115, 0, 0, 0, 0, 0, 1);
          }
LABEL_61:

        }
LABEL_62:

        goto LABEL_63;
      }
      v97 = nplog_obj(0, v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v144 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicK"
               "ey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "%s called with null tokenBlinder", buf, 0xCu);
      }
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v115 + 2))(v115, 0, 0, 0, 0, 0, 1);
LABEL_63:

    goto LABEL_64;
  }
  v25 = -[NSPPrivateAccessTokenChallenge initWithData:]([NSPPrivateAccessTokenChallenge alloc], "initWithData:", v114);
  v26 = self;
  if (v25)
    goto LABEL_10;
  v27 = nplog_obj(0, v23, v24);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v144 = (const char *)v116;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to parse token challenge for %@", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v115 + 2))(v115, 0, 0, 0, 0, 0, 1);
LABEL_64:

}

- (void)fetchPrivateAccessTokenForChallenge:(id)a3 overrideAttester:(id)a4 customAttester:(id)a5 customAttesterHeaders:(id)a6 tokenKey:(id)a7 originNameKey:(id)a8 selectedOrigin:(id)a9 auditToken:(id)a10 bundleID:(id)a11 allowTools:(BOOL)a12 systemTokenClient:(BOOL)a13 accessToken:(id)a14 completionHandler:(id)a15
{
  id v21;
  NSPPrivacyTokenManager *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSArray *accessTokenTypes;
  NSArray *v44;
  id v45;
  uint64_t v46;
  void *i;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  unsigned int v54;
  NSArray *accessTokenBlockedIssuers;
  NSArray *v56;
  NSArray *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  id v68;
  BOOL v69;
  int v70;
  dispatch_group_t v71;
  NSObject *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  unsigned int v89;
  _BOOL4 v90;
  id v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  id v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  BOOL v102;
  id v103;
  unint64_t v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  _QWORD block[4];
  id v114;
  __int128 *p_buf;
  _QWORD v116[4];
  id v117;
  NSObject *v118;
  _QWORD v119[4];
  id v120;
  NSObject *v121;
  id v122;
  unsigned int v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 buf;
  uint64_t v129;
  uint64_t (*v130)(uint64_t, uint64_t);
  void (*v131)(uint64_t);
  id v132;
  _BYTE v133[128];

  v21 = a3;
  v104 = (unint64_t)a4;
  v111 = a5;
  v105 = a6;
  v107 = a7;
  v106 = a8;
  v109 = a9;
  v22 = self;
  v103 = a10;
  v108 = a11;
  v112 = a14;
  v110 = a15;
  v23 = NPGetInternalQueue(v110);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  dispatch_assert_queue_V2(v24);

  if (!v21)
  {
    v98 = nplog_obj(v25, v26, v27);
    v99 = objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPrivateAccessTokenForChallenge:overrideAttester:cust"
                                      "omAttester:customAttesterHeaders:tokenKey:originNameKey:selectedOrigin:auditToken:"
                                      "bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_FAULT, "%s called with null challenge", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1004, 0);
    goto LABEL_83;
  }
  if (!v110)
  {
    v100 = nplog_obj(v25, v26, v27);
    v101 = objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPrivateAccessTokenForChallenge:overrideAttester:cust"
                                      "omAttester:customAttesterHeaders:tokenKey:originNameKey:selectedOrigin:auditToken:"
                                      "bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", (uint8_t *)&buf, 0xCu);
    }

    MEMORY[0x10](0, 0, 1004, 0);
    goto LABEL_83;
  }
  if (self)
    v28 = self->_accessTokenURL;
  else
    v28 = 0;
  if (v104 | v28)
  {

  }
  else if (!v111)
  {
    v29 = nplog_obj(v28, v26, v27);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Cannot fetch private access token, no attester URL", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1005, 0);
    goto LABEL_83;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "issuerName"));
  if (objc_msgSend(v31, "hasSuffix:", CFSTR("corp.apple.com")))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "issuerName"));
    v33 = objc_msgSend(v32, "containsString:", CFSTR("idms"));

    if (v112 || (v33 & 1) != 0 || a13)
    {
      if (v33)
      {
        v37 = v109;
        if (!v37)
          v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "originName"));
        if ((objc_msgSend(v37, "hasSuffix:", CFSTR(".apple.com")) & 1) == 0)
        {
          v38 = objc_msgSend(v37, "hasSuffix:", CFSTR(".apple"));
          if ((v38 & 1) == 0)
          {
            v96 = nplog_obj(v38, v39, v40);
            v97 = objc_claimAutoreleasedReturnValue(v96);
            if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf) = 0;
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "Bad origin name for IDMS issuer", (uint8_t *)&buf, 2u);
            }

            (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1001, 0);
            goto LABEL_83;
          }
        }

      }
      goto LABEL_26;
    }
LABEL_23:
    v41 = nplog_obj(v34, v35, v36);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "No eligible account found, cannot request token", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1003, 0);
    goto LABEL_83;
  }

  if (!v112 && !a13)
    goto LABEL_23;
LABEL_26:
  if (self)
  {
    accessTokenTypes = self->_accessTokenTypes;
    if (accessTokenTypes)
    {
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v44 = accessTokenTypes;
      v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v125;
        while (2)
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(_QWORD *)v125 != v46)
              objc_enumerationMutation(v44);
            v48 = objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i), "unsignedShortValue");
            if (v48 == objc_msgSend(v21, "tokenType"))
            {

              goto LABEL_40;
            }
          }
          v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
          if (v45)
            continue;
          break;
        }
      }

      v52 = nplog_obj(v49, v50, v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = objc_msgSend(v21, "tokenType");
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Cannot fetch token type %u, not in allowed type list", (uint8_t *)&buf, 8u);
      }
      goto LABEL_38;
    }
LABEL_40:
    accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  }
  else
  {
    accessTokenBlockedIssuers = 0;
  }
  if (-[NSArray count](accessTokenBlockedIssuers, "count"))
  {
    v56 = self ? self->_accessTokenBlockedIssuers : 0;
    v57 = v56;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "issuerName"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lowercaseString"));
    v60 = -[NSArray containsObject:](v57, "containsObject:", v59);

    if (v60)
    {
      v64 = nplog_obj(v61, v62, v63);
      v53 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "issuerName"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v65;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Cannot fetch token from issuer %@, not allowed", (uint8_t *)&buf, 0xCu);

      }
LABEL_38:

      (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1008, 0);
      goto LABEL_83;
    }
  }
  if (a13)
  {
LABEL_49:
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v129 = 0x3032000000;
    v130 = sub_10000317C;
    v131 = sub_1000A34C8;
    v132 = (id)os_transaction_create("com.apple.networkserviceproxy.privateaccesstoken");
    v66 = sub_1000A9C04(v21, a13);
    if (v66)
    {
      v123 = 0;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "key"));
      v68 = sub_10003EAE4((uint64_t)NSPPrivateAccessTokenCache, v21, v67, &v123);

      v102 = v68 == 0;
      if (v68)
      {
        (*((void (**)(id, id, _QWORD, _QWORD))v110 + 2))(v110, v68, 0, 0);
        v69 = v123 >= 2;
      }
      else
      {
        v69 = 0;
      }
      v70 = !v69;

      v71 = dispatch_group_create();
      v72 = v71;
      if (!v70)
      {
        v88 = 0;
LABEL_82:
        v93 = NPGetInternalQueue(v71);
        v94 = objc_claimAutoreleasedReturnValue(v93);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000A3758;
        block[3] = &unk_1000F5428;
        v114 = v88;
        p_buf = &buf;
        v95 = v88;
        dispatch_group_notify(v72, v94, block);

        _Block_object_dispose(&buf, 8);
        goto LABEL_83;
      }
      v73 = 5;
    }
    else
    {
      v102 = 1;
      v72 = dispatch_group_create();
      v73 = 0;
    }
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "_socketStreamProperties"));
    if (v83)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "_socketStreamProperties"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v84));

    }
    else
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    }

    objc_msgSend(v85, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, _kCFStreamPropertyPrefersNoProxy);
    objc_msgSend(v82, "set_socketStreamProperties:", v85);
    objc_msgSend(v82, "setTimeoutIntervalForRequest:", 60.0);
    objc_msgSend(v82, "set_sourceApplicationAuditTokenData:", v103);
    objc_msgSend(v82, "set_sourceApplicationBundleIdentifier:", v108);
    objc_msgSend(v82, "set_usesNWLoader:", 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v82));
    objc_msgSend(v88, "setSessionDescription:", CFSTR("PrivateAccessTokenFetch"));

    if (v102)
    {
      dispatch_group_enter(v72);
      if (v104)
        v89 = v73 + 1;
      else
        v89 = 1;
      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_1000A34D0;
      v119[3] = &unk_1000F6DE0;
      v122 = v110;
      v120 = v21;
      v121 = v72;
      sub_10009FC5C((uint64_t)v22, v120, (void *)v104, v111, v105, v107, v89, v106, v109, v108, v112, 0, v88, 0, v119);

    }
    if (v104)
      v90 = 0;
    else
      v90 = v66;
    if (v90)
    {
      do
      {
        dispatch_group_enter(v72);
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_1000A3654;
        v116[3] = &unk_1000F6E08;
        v91 = v21;
        v117 = v91;
        v92 = v72;
        v118 = v92;
        sub_10009FC5C((uint64_t)v22, v91, 0, v111, v105, v107, 1u, v106, v109, v108, v112, 0, v88, 0, v116);

        --v73;
      }
      while (v73);
      v72 = v92;
    }
    goto LABEL_82;
  }
  v74 = sub_1000A25D8((uint64_t)v22, v103, v21, v109, a12);
  if ((v74 & 1) != 0)
  {
    v77 = sub_1000402E8((uint64_t)NSPPrivateAccessTokenCache, v21, v109);
    if ((v77 & 1) != 0)
      goto LABEL_49;
    v80 = nplog_obj(v77, v78, v79);
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token, rate limited", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1009, 0);
  }
  else
  {
    v86 = nplog_obj(v74, v75, v76);
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token for origin", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v110 + 2))(v110, 0, 1001, 0);
  }
LABEL_83:

}

- (void)fetchPairedPrivateAccessTokensForChallenge:(id)a3 overrideAttester:(id)a4 tokenKey:(id)a5 originNameKey:(id)a6 selectedOrigin:(id)a7 pairedChallenge:(id)a8 overridePairedAttester:(id)a9 pairedTokenKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  BOOL v45;
  int v46;
  int v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  BOOL v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD block[5];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  __int128 *v89;
  _QWORD *v90;
  int v91;
  BOOL v92;
  _QWORD v93[4];
  NSObject *v94;
  NSPPrivacyTokenManager *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  __int128 *p_buf;
  _QWORD v106[5];
  id v107;
  id v108;
  __int128 buf;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v73 = a6;
  v76 = a7;
  v24 = a8;
  v79 = a9;
  v75 = a10;
  v78 = a11;
  v77 = a12;
  v74 = a15;
  v25 = a16;
  v26 = NPGetInternalQueue(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  dispatch_assert_queue_V2(v27);

  if (!v21)
  {
    v66 = nplog_obj(v28, v29, v30);
    v52 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "%s called with null longLivedTokenChallenge", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_45;
  }
  if (!v24)
  {
    v67 = nplog_obj(v28, v29, v30);
    v52 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "%s called with null oneTimeTokenChallenge", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_45;
  }
  if (v25)
  {
    if (v22 && v79)
    {
      if (a14)
      {
LABEL_9:
        v37 = sub_1000A9C04(v21, a14);
        if (v37)
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v110 = 0x3032000000;
          v111 = sub_10000317C;
          v112 = sub_1000A34C8;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "key"));
          v113 = sub_10003EF88((uint64_t)NSPPrivateAccessTokenCache, v21, v40);

          v70 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          if (v70)
          {
            LODWORD(v106[0]) = 0;
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "key"));
            v42 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            v108 = 0;
            v43 = sub_10003F70C((uint64_t)NSPPrivateAccessTokenCache, v24, v41, v21, v42, v106, &v108);
            v44 = v108;

            v72 = v43 == 0;
            if (v43)
            {
              (*((void (**)(id, _QWORD, id, id, _QWORD, _QWORD))v25 + 2))(v25, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v43, v44, 0, 0);
              v45 = LODWORD(v106[0]) >= 9;
            }
            else
            {
              v45 = 0;
            }
            v46 = !v45;

            if (!v46)
            {
              v47 = 0;
              v72 = 0;
              v48 = 0;
              goto LABEL_36;
            }
          }
          else
          {
            sub_100040288((uint64_t)NSPPrivateAccessTokenCache, v24);
            v72 = 1;
          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "_socketStreamProperties"));
          if (v58)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "_socketStreamProperties"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v59));

          }
          else
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          }

          objc_msgSend(v60, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, _kCFStreamPropertyPrefersNoProxy);
          objc_msgSend(v57, "set_socketStreamProperties:", v60);
          objc_msgSend(v57, "setTimeoutIntervalForRequest:", 60.0);
          objc_msgSend(v57, "set_sourceApplicationAuditTokenData:", v78);
          objc_msgSend(v57, "set_sourceApplicationBundleIdentifier:", v77);
          objc_msgSend(v57, "set_usesNWLoader:", 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v57));
          objc_msgSend(v48, "setSessionDescription:", CFSTR("PrivateAccessTokenFetch"));

          v47 = 50;
LABEL_36:
          v106[0] = 0;
          v106[1] = v106;
          v106[2] = 0x3032000000;
          v106[3] = sub_10000317C;
          v106[4] = sub_1000A34C8;
          v107 = (id)os_transaction_create("com.apple.networkserviceproxy.pairedtokens");
          v61 = dispatch_group_create();
          v62 = v61;
          if (!v70)
          {
            dispatch_group_enter(v61);
            v93[0] = _NSConcreteStackBlock;
            v93[1] = 3221225472;
            v93[2] = sub_1000A41BC;
            v93[3] = &unk_1000F6E58;
            v104 = v25;
            v94 = v62;
            v95 = self;
            v96 = v21;
            v97 = v22;
            v98 = v23;
            v99 = v73;
            v100 = v76;
            v101 = v77;
            v102 = v74;
            v103 = v48;
            p_buf = &buf;
            sub_10009EB54((uint64_t)self, v98, v97, v93);

          }
          v63 = NPGetInternalQueue(v61);
          v64 = objc_claimAutoreleasedReturnValue(v63);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000A43F8;
          block[3] = &unk_1000F6EF8;
          v92 = v72;
          v91 = v47;
          v89 = &buf;
          block[4] = self;
          v81 = v75;
          v82 = v79;
          v88 = v25;
          v83 = v24;
          v84 = v77;
          v85 = v74;
          v86 = v48;
          v87 = v21;
          v90 = v106;
          v65 = v48;
          dispatch_group_notify(v62, v64, block);

          _Block_object_dispose(v106, 8);
          _Block_object_dispose(&buf, 8);

          goto LABEL_39;
        }
        v51 = nplog_obj(v37, v38, v39);
        v52 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Long-lived token must be cacheable", (uint8_t *)&buf, 2u);
        }
LABEL_45:

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))v25 + 2))(v25, 0, 0, 0, 1004, 0);
        goto LABEL_39;
      }
      v31 = sub_1000A25D8((uint64_t)self, v78, v21, v76, a13);
      if ((v31 & 1) != 0)
      {
        v34 = sub_1000402E8((uint64_t)NSPPrivateAccessTokenCache, v21, v76);
        if ((v34 & 1) != 0)
          goto LABEL_9;
        v55 = nplog_obj(v34, v35, v36);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token, rate limited", (uint8_t *)&buf, 2u);
        }

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))v25 + 2))(v25, 0, 0, 0, 1009, 0);
      }
      else
      {
        v53 = nplog_obj(v31, v32, v33);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token for origin", (uint8_t *)&buf, 2u);
        }

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))v25 + 2))(v25, 0, 0, 0, 1001, 0);
      }
    }
    else
    {
      v49 = nplog_obj(v28, v29, v30);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Cannot fetch private access token, no attester URLs", (uint8_t *)&buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))v25 + 2))(v25, 0, 0, 0, 1005, 0);
    }
  }
  else
  {
    v68 = nplog_obj(v28, v29, v30);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", (uint8_t *)&buf, 0xCu);
    }

    MEMORY[0x10](0, 0, 0, 0);
  }
LABEL_39:

}

- (void)copyTokenInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t totalActivatedTokenCount;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setDeviceIdentityValidationCount:", dword_100112F64);
    objc_msgSend(v7, "setAnisetteValidationCount:", dword_100112F60);
    if (self)
    {
      objc_msgSend(v7, "setRequestedTokenCount:", self->_totalRequestedTokenCount);
      objc_msgSend(v7, "setUnactivatedTokenCount:", self->_totalUnactivatedTokenCount);
      totalActivatedTokenCount = self->_totalActivatedTokenCount;
    }
    else
    {
      objc_msgSend(v7, "setRequestedTokenCount:", 0);
      objc_msgSend(v7, "setUnactivatedTokenCount:", 0);
      totalActivatedTokenCount = 0;
    }
    objc_msgSend(v7, "setActivatedTokenCount:", totalActivatedTokenCount);
  }
  else
  {
    v9 = nplog_obj(0, v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[NSPPrivacyTokenManager copyTokenInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null proxyInfo", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)getTokenServerIPWithInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  nw_endpoint_t host;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  OS_nw_resolver *tokenEndpointResolver;
  OS_nw_resolver *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD);
  id v32;
  _BYTE location[24];

  v6 = a3;
  v7 = a4;
  v10 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    if (self && self->_tokenEndpointResolver)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyTokenManager tokenFetchURL](self, "tokenFetchURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));

      if (v12)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "host"));
        host = nw_endpoint_create_host((const char *)objc_msgSend(v16, "UTF8String"), "443");
        v18 = nw_parameters_create();
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cInterface"));
        nw_parameters_require_interface(v18, v19);

        v20 = (void *)nw_resolver_create_with_endpoint(host, v18);
        v21 = v20;
        if (self)
        {
          objc_storeStrong((id *)&self->_tokenEndpointResolver, v20);

          objc_initWeak((id *)location, self);
          tokenEndpointResolver = self->_tokenEndpointResolver;
        }
        else
        {

          tokenEndpointResolver = 0;
          *(_QWORD *)location = 0;
        }
        v23 = tokenEndpointResolver;
        v24 = NPGetInternalQueue(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000A5070;
        v30[3] = &unk_1000F6F20;
        objc_copyWeak(&v32, (id *)location);
        v31 = v10;
        nw_resolver_set_update_handler(v23, v25, v30);

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)location);

      }
      else
      {
        v28 = nplog_obj(v13, v14, v15);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)location = 136315138;
          *(_QWORD *)&location[4] = "-[NSPPrivacyTokenManager getTokenServerIPWithInterface:completionHandler:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "%s called with null url", location, 0xCu);
        }

        v10[2](v10, 0);
      }

    }
  }
  else
  {
    v26 = nplog_obj(v7, v8, v9);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[NSPPrivacyTokenManager getTokenServerIPWithInterface:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null interface", location, 0xCu);
    }

    v10[2](v10, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenEndpointResolver, 0);
  objc_storeStrong((id *)&self->_trueClientIPAddress, 0);
  objc_storeStrong((id *)&self->_retryIntervalsForIssuers, 0);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, 0);
  objc_storeStrong((id *)&self->_accessTokenTypes, 0);
  objc_storeStrong((id *)&self->_accessTokenURL, 0);
  objc_storeStrong((id *)&self->_tokenFetchURL, 0);
}

@end
