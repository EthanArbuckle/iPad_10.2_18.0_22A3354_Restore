@implementation NSHTTPCookie

- (id)jsa_initWithScriptingCookie:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSHTTPCookie *v35;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, NSHTTPCookieName);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, NSHTTPCookieValue);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originURL"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, NSHTTPCookieOriginURL);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "version"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, NSHTTPCookieVersion);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, NSHTTPCookieDomain);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, NSHTTPCookiePath);

  }
  if (objc_msgSend(v4, "isSecure"))
  {
    if (objc_msgSend(v4, "isSecure"))
      v20 = CFSTR("TRUE");
    else
      v20 = CFSTR("FALSE");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, NSHTTPCookieSecure);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "comment"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "comment"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, NSHTTPCookieComment);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commentURL"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commentURL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, NSHTTPCookieCommentURL);

  }
  if (objc_msgSend(v4, "isSessionOnly"))
  {
    if (objc_msgSend(v4, "isSessionOnly"))
      v26 = CFSTR("TRUE");
    else
      v26 = CFSTR("FALSE");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, NSHTTPCookieDiscard);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maximumAge"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maximumAge"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringValue"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, NSHTTPCookieMaximumAge);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "portList"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "portList"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", CFSTR(",")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, NSHTTPCookiePort);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, NSHTTPCookieExpires);

  }
  v35 = -[NSHTTPCookie initWithProperties:](self, "initWithProperties:", v5);

  return v35;
}

- (id)jsa_validURLValueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHTTPCookie properties](self, "properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = objc_opt_class(NSString, v7);
  v9 = BUDynamicCast(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));

    v6 = (void *)v11;
  }

  return v6;
}

- (id)jsa_validIntegerValueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHTTPCookie properties](self, "properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = objc_opt_class(NSString, v7);
  v9 = BUDynamicCast(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = v10;
  if (v10)
  {
    v13 = (uint64_t)objc_msgSend(v10, "integerValue");
  }
  else
  {
    v14 = objc_opt_class(NSNumber, v11);
    v15 = BUDynamicCast(v14, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v16)
      v13 = (uint64_t)objc_msgSend(v16, "integerValue");
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;

  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = 0;
  else
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));

  return v18;
}

- (id)jsa_validBooleanValueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHTTPCookie properties](self, "properties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = objc_opt_class(NSString, v7);
  v9 = BUDynamicCast(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = v10;
  if (v10)
  {
    v13 = objc_msgSend(v10, "BOOLValue");
  }
  else
  {
    v14 = objc_opt_class(NSNumber, v11);
    v15 = BUDynamicCast(v14, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!v16)
    {
      v18 = 0;
      goto LABEL_6;
    }
    v17 = v16;
    v13 = objc_msgSend(v16, "BOOLValue");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
LABEL_6:

  return v18;
}

@end
