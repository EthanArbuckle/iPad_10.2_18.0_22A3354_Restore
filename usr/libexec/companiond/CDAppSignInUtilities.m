@implementation CDAppSignInUtilities

+ (void)approvedWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  sub_1000174A4((uint64_t)a1, a3, a4);
}

+ (void)allWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  sub_100017604((uint64_t)a1, a3, a4);
}

+ (void)canPerformAuthKitRequest:(id)a3 withAuthKitAccount:(id)a4 clientBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  sub_100017788((uint64_t)a1, a3, a4, a5, a6);
}

+ (void)sendSessionActivatedMetricsWithRequest:(id)a3 approvedAssociatedDomains:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  char v17;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2810000000;
  v16 = &unk_100029217;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appleIDRequest"));

  if (v7)
    *((_BYTE *)v14 + 32) |= 1u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "passwordRequest"));

  if (v8)
    *((_BYTE *)v14 + 32) |= 2u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customAuthenticationMethods"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000179C4;
  v12[3] = &unk_100030FC8;
  v12[4] = &v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  v10 = objc_msgSend(v6, "count");
  v11 = *((unsigned __int8 *)v14 + 32);
  if (v10)
  {
    v11 |= 0x20u;
    *((_BYTE *)v14 + 32) = v11;
  }
  +[CPSMetrics sendAppSignInSessionActivatedEvent:](CPSMetrics, "sendAppSignInSessionActivatedEvent:", v11);
  _Block_object_dispose(&v13, 8);

}

+ (void)sendSessionCompletedMetricsWithError:(id)a3
{
  uint64_t CustomAuthenticationMethod;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  CustomAuthenticationMethod = CPSErrorGetCustomAuthenticationMethod();
  v4 = objc_claimAutoreleasedReturnValue(CustomAuthenticationMethod);
  v5 = (void *)v4;
  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    if (objc_msgSend(v7, "isEqualToString:", CPSErrorDomain))
    {
      v8 = objc_msgSend(v9, "code");

      if (v8 == (id)104)
      {
        v6 = 2;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v6 = 3;
    goto LABEL_8;
  }
  v6 = CPSMetricsSessionResultWithCustomMethod(v4);
LABEL_8:
  +[CPSMetrics sendAppSignInSessionCompletedEvent:](CPSMetrics, "sendAppSignInSessionCompletedEvent:", v6);

}

+ (id)credentialRequestFromClientAuthenticationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appleIDRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformKeyCredentialAssertionOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformKeyCredentialRegistrationOptions"));
  v8 = sub_100017D78((uint64_t)a1, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passwordRequest"));
  v11 = v10 != 0;

  v12 = v11 | (2 * (v5 != 0));
  if (v6)
    v12 |= 8uLL;
  if (v7)
    v13 = v12 | 4;
  else
    v13 = v12;
  v14 = objc_msgSend(objc_alloc((Class)ASCCredentialRequestContext), "initWithRequestTypes:", v13);
  objc_msgSend(v14, "setAppleIDAuthorizationRequest:", v5);
  objc_msgSend(v14, "setPlatformKeyCredentialAssertionOptions:", v6);
  objc_msgSend(v14, "setPlatformKeyCredentialCreationOptions:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appIdentifier"));
  objc_msgSend(v14, "setProxiedAppIdentifier:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appName"));
  objc_msgSend(v14, "setProxiedAppName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appDomains"));
  objc_msgSend(v14, "setProxiedAssociatedDomains:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appBundleIdentifier"));
  objc_msgSend(v14, "setProxiedBundleIdentifier:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appIconData"));
  objc_msgSend(v14, "setProxiedIconData:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appIconScale"));
  objc_msgSend(v14, "setProxiedIconScale:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceName"));
  objc_msgSend(v14, "setProxiedOriginDeviceName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appTeamIdentifier"));
  objc_msgSend(v14, "setProxiedTeamIdentifier:", v22);

  objc_msgSend(v14, "setRelyingPartyIdentifier:", v9);
  return v14;
}

+ (void)preparePasskeyRequestsWithRequest:(id)a3 applicationIdentifier:(id)a4 approvedWebCredentialsDomains:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSErrorUserInfoKey v27;
  void *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformKeyCredentialAssertionOptions"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformKeyCredentialRegistrationOptions"));
  if (!(v14 | v15))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("passkeyAssertionOptions || passkeyRegistrationOptions")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001F11C(a2);
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v26), "UTF8String"));
    __break(0);
    JUMPOUT(0x100018190);
  }
  v16 = (void *)v15;
  if (!objc_msgSend(v11, "length"))
  {
    v19 = CPSErrorDomain;
    v31 = NSLocalizedDescriptionKey;
    v32 = CFSTR("Missing application identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, 205, v18));
    v13[2](v13, v20);

    goto LABEL_10;
  }
  v17 = sub_100017D78((uint64_t)CDAppSignInUtilities, (void *)v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (!objc_msgSend(v18, "length"))
  {
    v21 = CPSErrorDomain;
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Missing relying party identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 205, v22));
    v13[2](v13, v23);
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v12, "containsObject:", v18) & 1) == 0)
  {
    v24 = CPSErrorDomain;
    v27 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Application (%@) is not associated with relying party identifier (%@)"), v11, v18));
    v28 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, 205, v23));
    v13[2](v13, v25);

    goto LABEL_9;
  }
  v13[2](v13, 0);
LABEL_10:

}

@end
