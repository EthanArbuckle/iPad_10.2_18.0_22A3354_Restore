@implementation NSPPvDConfigurationFetcher

- (void)dealloc
{
  NSURLSession *session;
  objc_super v4;

  if (self)
  {
    session = self->_session;
    if (session)
    {
      -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
      objc_storeStrong((id *)&self->_session, 0);
    }
    objc_storeStrong((id *)&self->_queue, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPPvDConfigurationFetcher;
  -[NSPPvDConfigurationFetcher dealloc](&v4, "dealloc");
}

- (BOOL)isIdentifier:(id)a3 presentIn:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "host"));
  if (v6)
    v7 = objc_msgSend(v5, "isEqualToString:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)formatExpirationDateFrom:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v4, "setTimeZone:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v3));
  return v7;
}

- (BOOL)configurationValidated:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("expires")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPvDConfigurationFetcher formatExpirationDateFrom:](self, "formatExpirationDateFrom:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v11 = objc_msgSend(v10, "compare:", v9);

  v15 = v11 == (id)-1;
  if (v11 != (id)-1)
  {
    v16 = nplog_obj(v12, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Configuration is expired", (uint8_t *)&v26, 2u);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("identifier")));
  v19 = -[NSPPvDConfigurationFetcher isIdentifier:presentIn:](self, "isIdentifier:presentIn:", v18, v7);

  if ((v19 & 1) == 0)
  {
    v23 = nplog_obj(v20, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Matching identifier was not found in response: %@", (uint8_t *)&v26, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

- (void)didReceiveProxyConfig:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  char v51;
  id WeakRetained;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  void *v62;
  id *p_delegate;
  id v64;
  void *v65;
  id v66;
  char v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  NSPPvDConfigurationFetcher *v72;
  id v73;
  char v74;
  void *v75;
  unsigned int v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  _BYTE v85[128];

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_64;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("identifier")));
  if (!v8)
    goto LABEL_64;
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("expires")));

  if (!v10)
    goto LABEL_64;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("identifier")));
  if (!-[NSPPvDConfigurationFetcher configurationValidated:withURL:](self, "configurationValidated:withURL:", v6, v7))
    goto LABEL_63;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("proxies")));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  v77 = v12;
  if (!v13)
  {

    v37 = 0;
LABEL_37:
    v38 = nplog_obj(v34, v35, v36);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Did not find a masque proxy config in the list", buf, 2u);
    }
    goto LABEL_62;
  }
  v14 = v13;
  v72 = self;
  v73 = v7;
  v75 = 0;
  v74 = 0;
  v15 = *(_QWORD *)v80;
  v78 = v11;
  v16 = v12;
  while (2)
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v80 != v15)
        objc_enumerationMutation(v16);
      v18 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
      v19 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
      {
        v30 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v18, v30) & 1) == 0)
          continue;
        v22 = v18;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));
        v20 = v31;
        if (v31)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "host"));
          if (!objc_msgSend(v21, "isEqualToString:", v11))
            goto LABEL_30;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
          v33 = objc_msgSend(v32, "containsString:", CFSTR("/.well-known/masque/udp"));

          if (v33)
          {
            v37 = v20;

            v7 = v73;
            v11 = v78;
            goto LABEL_40;
          }
          v11 = v78;
        }
LABEL_31:

        continue;
      }
      v20 = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("protocol")));
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("proxy")));
      if (!v21)
        goto LABEL_30;
      v23 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v21, v23) & 1) == 0)
        goto LABEL_30;
      if (!v22)
        goto LABEL_30;
      v24 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
        goto LABEL_30;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));
      v26 = v25;
      if (v25)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "host"));
        if (!objc_msgSend(v27, "isEqualToString:", v11))
          goto LABEL_28;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
        if ((objc_msgSend(v28, "containsString:", CFSTR("masque")) & 1) == 0)
        {

          v11 = v78;
LABEL_28:

LABEL_29:
          v16 = v77;
LABEL_30:

          goto LABEL_31;
        }
        v76 = objc_msgSend(v21, "isEqualToString:", CFSTR("connect-udp"));

        v11 = v78;
        if (!v76)
          goto LABEL_29;
        v29 = v26;

        v74 = 1;
        v75 = v29;
        v16 = v77;
        v11 = v78;
      }

      if (v26)
        goto LABEL_34;
    }
    v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v14)
      continue;
    break;
  }
LABEL_34:

  v7 = v73;
  v37 = v75;
  if ((v74 & 1) == 0)
    goto LABEL_37;
LABEL_40:
  v40 = v37;
  v39 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@:443"), v11));
  v41 = v11;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "port"));

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "port"));
    v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@:%@"), v41, v43));

    v39 = v44;
  }
  v45 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v39));
  v48 = v45;
  if (v45)
  {
    if (v72
      && (v45 = objc_loadWeakRetained((id *)&v72->_serverDelegate)) != 0
      && (v49 = v45,
          v50 = objc_loadWeakRetained((id *)&v72->_serverDelegate),
          v51 = objc_opt_respondsToSelector(v50, "networkDiscoveredProxyInTrustedProxyList:"),
          v50,
          v49,
          (v51 & 1) != 0))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v72->_serverDelegate);
      v53 = objc_msgSend(WeakRetained, "networkDiscoveredProxyInTrustedProxyList:", v48);

      v57 = nplog_obj(v54, v55, v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      v59 = v58;
      if (v53)
      {
        v11 = v78;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "proxyURL found, setting up configuration", buf, 2u);
        }

        v37 = v40;
        v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
        v59 = v60;
        v7 = v73;
        if (v60
          && ((-[NSObject containsString:](v60, "containsString:", CFSTR("/.well-known/masque/udp")) & 1) != 0
           || -[NSObject containsString:](v59, "containsString:", CFSTR("masque"))))
        {
          v61 = objc_alloc_init((Class)NSPPrivacyProxyProxyInfo);
          objc_msgSend(v61, "setProxyURL:", v39);
          objc_msgSend(v61, "setProxyVersion:", CFSTR("RFC9298"));
          objc_msgSend(v61, "setProxyHop:", 1);
          objc_msgSend(v61, "setSupportsFallback:", 0);
          objc_msgSend(v61, "setVendor:", v78);
          objc_msgSend(v61, "setTcpProxyFqdn:", v39);
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
          objc_msgSend(v61, "setTokenKeyInfo:", v62);

          p_delegate = (id *)&v72->_delegate;
          v64 = objc_loadWeakRetained((id *)&v72->_delegate);
          if (v64)
          {
            v65 = v64;
            v66 = objc_loadWeakRetained(p_delegate);
            v67 = objc_opt_respondsToSelector(v66, "setupMasqueProxyWith:");

            if ((v67 & 1) != 0)
            {
              v68 = objc_loadWeakRetained(p_delegate);
              objc_msgSend(v68, "setupMasqueProxyWith:", v61);

            }
          }

          v7 = v73;
LABEL_59:
          v11 = v78;
          goto LABEL_60;
        }
        goto LABEL_61;
      }
      v11 = v78;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = v48;
        v71 = "proxyURL not found in the allow list: %@";
        goto LABEL_68;
      }
    }
    else
    {
      v69 = nplog_obj(v45, v46, v47);
      v59 = objc_claimAutoreleasedReturnValue(v69);
      v11 = v78;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = v48;
        v71 = "Something went wrong. Could not confirm the proxyURL: %@";
LABEL_68:
        _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, v71, buf, 0xCu);
      }
    }
    v7 = v73;
    goto LABEL_60;
  }
  v70 = nplog_obj(0, v46, v47);
  v59 = objc_claimAutoreleasedReturnValue(v70);
  if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    goto LABEL_59;
  *(_DWORD *)buf = 138412290;
  v11 = v78;
  v84 = v78;
  _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Could not create a proxyURL from identifier: %@", buf, 0xCu);
LABEL_60:
  v37 = v40;
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:
}

- (void)fetchIndividualProxyConfig:(id)a3 completionHander:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSURLSession *session;
  NSURLSession *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10000310C;
  v18[4] = sub_100049470;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v6, 1, 30.0));
  if (self)
    session = self->_session;
  else
    session = 0;
  v10 = session;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049478;
  v14[3] = &unk_1000F5E00;
  v11 = v6;
  v15 = v11;
  v17 = v18;
  v12 = v7;
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:completionHandler:](v10, "dataTaskWithRequest:completionHandler:", v8, v14));

  objc_msgSend(v13, "resume");
  _Block_object_dispose(v18, 8);

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  BOOL v11;
  NSPPrivacyProxyAgentManagerDelegate **p_serverDelegate;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a5;
  v8 = (void (**)(id, uint64_t, _QWORD))a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "protectionSpace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authenticationMethod"));
  if (objc_msgSend(v10, "isEqualToString:", NSURLAuthenticationMethodServerTrust))
    v11 = self == 0;
  else
    v11 = 1;
  if (v11)
    goto LABEL_10;
  p_serverDelegate = &self->_serverDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  if (!WeakRetained)
    goto LABEL_10;
  v14 = WeakRetained;
  v15 = objc_loadWeakRetained((id *)p_serverDelegate);
  if ((objc_opt_respondsToSelector(v15, "canIgnoreInvalidCertsOnInternalBuild") & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  v16 = objc_loadWeakRetained((id *)p_serverDelegate);
  v17 = objc_msgSend(v16, "canIgnoreInvalidCertsOnInternalBuild");

  if (!v17)
  {
LABEL_11:
    v8[2](v8, 1, 0);
    goto LABEL_12;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "protectionSpace"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v18, "serverTrust")));
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v19);

LABEL_12:
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PvD configuration fetch is waiting for connectivity", v6, 2u);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
