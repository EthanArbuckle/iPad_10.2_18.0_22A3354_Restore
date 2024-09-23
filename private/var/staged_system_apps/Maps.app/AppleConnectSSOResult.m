@implementation AppleConnectSSOResult

- (AppleConnectSSOResult)initWithResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AppleConnectSSOResult *v19;
  id *p_isa;
  void *v21;
  AppleConnectSSOResult *v22;
  uint64_t v23;
  NSObject *v24;
  id obj;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];

  v4 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("username")));
  v5 = objc_alloc_init((Class)NSURLComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherInfo")));
  objc_msgSend(v5, "setQuery:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryItems"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dawToken")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personId")));
  if (objc_msgSend(v17, "length") && objc_msgSend(v18, "length"))
  {
    v27.receiver = self;
    v27.super_class = (Class)AppleConnectSSOResult;
    v19 = -[AppleConnectSSOResult init](&v27, "init");
    p_isa = (id *)&v19->super.isa;
    v21 = obj;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_username, obj);
      objc_storeStrong(p_isa + 2, v17);
      objc_storeStrong(p_isa + 3, v18);
    }
    self = p_isa;
    v22 = self;
  }
  else
  {
    v23 = GEOGetMapsProxyAuthLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v21 = obj;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v33 = obj;
      v34 = 2112;
      v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Apple Connect Authentication Failed User: %@ <%@>", buf, 0x16u);
    }

    v22 = 0;
  }

  return v22;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)personId
{
  return self->_personId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
