@implementation RequestTemplateURL

- (id)urlFromTemplate:(id)a3 account:(id)a4 udid:(id)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL _substituteStandardURLPlaceholders:account:udid:](self, "_substituteStandardURLPlaceholders:account:udid:", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlWithString:](self, "urlWithString:", v6));

  return v7;
}

- (id)unauthenticatedURLFromTemplate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL _substituteNonAuthenticatedURLPlaceholders:](self, "_substituteNonAuthenticatedURLPlaceholders:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlWithString:](self, "urlWithString:", v4));

  return v5;
}

- (RequestTemplateURL)urlWithString:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v3);
  if (!v4)
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not create an NSURL from the url string %@", (uint8_t *)&v8, 0xCu);
    }

  }
  return (RequestTemplateURL *)v4;
}

- (id)_substituteNonAuthenticatedURLPlaceholders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL nonAuthenticatedSchemeInURL](self, "nonAuthenticatedSchemeInURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL nonAuthenticatedHostNameInURL](self, "nonAuthenticatedHostNameInURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL nonAuthenticatedServiceInURL](self, "nonAuthenticatedServiceInURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${service}"), v9));

  return v10;
}

- (id)_substituteStandardURLPlaceholders:(id)a3 account:(id)a4 udid:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr hostportOverride](FMDPreferencesMgr, "hostportOverride"));
  if (objc_msgSend(v11, "length"))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v11));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverHost"));

    if (!v13)
      goto LABEL_6;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverHost"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v14));

    v8 = (id)v14;
  }

  v8 = (id)v12;
LABEL_6:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr protocolSchemeOverride](FMDPreferencesMgr, "protocolSchemeOverride"));
  if (objc_msgSend(v15, "length"))
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v15));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverProtocolScheme"));

    if (!v17)
      goto LABEL_11;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverProtocolScheme"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v18));

    v8 = (id)v18;
  }

  v8 = (id)v16;
LABEL_11:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL serviceIdentifierInURL](self, "serviceIdentifierInURL"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL serviceIdentifierInURL](self, "serviceIdentifierInURL"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${service}"), v20));

    v8 = (id)v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authId"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authId"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${dsid}"), v23));

    v8 = (id)v24;
  }
  if (v10)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${udid}"), v10));

    v8 = (id)v25;
  }

  return v8;
}

- (id)serviceIdentifierInURL
{
  return CFSTR("findme");
}

- (id)nonAuthenticatedServiceInURL
{
  return CFSTR("turmeric");
}

- (id)nonAuthenticatedHostNameInURL
{
  return CFSTR("cadmium.icloud.com");
}

- (id)nonAuthenticatedSchemeInURL
{
  return CFSTR("https");
}

@end
