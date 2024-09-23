@implementation APAttributionTokenStore

- (APAttributionTokenStore)initWithStorage:(id)a3
{
  return -[APAttributionTokenStore initWithStorage:andSize:](self, "initWithStorage:andSize:", a3, 0);
}

- (APAttributionTokenStore)initWithStorage:(id)a3 andSize:(unsigned int)a4
{
  id v7;
  APAttributionTokenStore *v8;
  APAttributionTokenStore *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APAttributionTokenStore;
  v8 = -[APAttributionTokenStore init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_storage, a3);
      v9->_size = a4;
    }
    else
    {
      v10 = APLogForCategory(4);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempting to initialize token store without a storage backing", v13, 2u);
      }

    }
  }

  return v9;
}

+ (id)storageLock
{
  if (qword_100268850 != -1)
    dispatch_once(&qword_100268850, &stru_1002133D0);
  return (id)qword_100268848;
}

- (id)getToken:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock", a3, a4));
  objc_msgSend(v6, "lock");

  v7 = CFSTR("com.apple.ap.pc.attribution.tokenCache.standard");
  if (v4)
    v7 = CFSTR("com.apple.ap.pc.attribution.tokenCache.detailed");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenStore storage](self, "storage"));
  v36 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:error:", v8, &v36));
  v11 = v36;

  if (v11 && objc_msgSend(v11, "code") != (id)-25300)
  {
    v12 = APLogForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(v11, "code");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      *(_DWORD *)buf = 136643331;
      v38 = "-[APAttributionTokenStore getToken:error:]";
      v39 = 2048;
      v40 = v14;
      v41 = 2114;
      v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{sensitive}s Error reading tokens from cache code %ld: %{public}@", buf, 0x20u);

    }
    v16 = objc_msgSend(v11, "code");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error reading tokens from cache code %ld: %@"), v16, v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
    CreateDiagnosticReport(v18, v19, CFSTR("com.apple.ap.attribution.token"));

  }
  if (v10 && objc_msgSend(v10, "count"))
  {
    v20 = objc_msgSend(v10, "mutableCopy");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
    objc_msgSend(v20, "removeLastObject");

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenStore storage](self, "storage"));
    v35 = 0;
    objc_msgSend(v22, "setValue:forKey:error:", v20, v8, &v35);
    v11 = v35;

    if (v11)
    {
      v23 = APLogForCategory(4);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (const char *)objc_msgSend(v11, "code");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
        *(_DWORD *)buf = 134218242;
        v38 = v25;
        v39 = 2114;
        v40 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error setting tokens to cache code %ld: %{public}@", buf, 0x16u);

      }
      v27 = objc_msgSend(v11, "code");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error setting tokens to cache code %ld: %@"), v27, v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
      CreateDiagnosticReport(v29, v30, CFSTR("com.apple.ap.attribution.token"));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
      objc_msgSend(v31, "unlock");

      v32 = 0;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
      objc_msgSend(v33, "unlock");

      v32 = v21;
    }

  }
  else
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
    objc_msgSend(v20, "unlock");
    v32 = 0;
  }

  return v32;
}

- (unint64_t)tokenCount:(BOOL)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v16;

  v6 = CFSTR("com.apple.ap.pc.attribution.tokenCache.standard");
  if (a3)
    v6 = CFSTR("com.apple.ap.pc.attribution.tokenCache.detailed");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
  objc_msgSend(v8, "lock");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenStore storage](self, "storage"));
  v16 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:error:", v7, &v16));

  v11 = v16;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
  objc_msgSend(v12, "unlock");

  if (v10)
  {
    v13 = objc_msgSend(v10, "count");
  }
  else
  {
    v14 = objc_msgSend(v11, "code");
    v13 = 0;
    if (a4 && v14 != (id)-25300)
    {
      v13 = 0;
      *a4 = objc_retainAutorelease(v11);
    }
  }

  return (unint64_t)v13;
}

- (BOOL)addTokens:(id)a3 isDetailed:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  NSErrorUserInfoKey v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;

  v6 = a4;
  v8 = a3;
  v9 = CFSTR("com.apple.ap.pc.attribution.tokenCache.standard");
  if (v6)
    v9 = CFSTR("com.apple.ap.pc.attribution.tokenCache.detailed");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
  objc_msgSend(v11, "lock");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenStore storage](self, "storage"));
  v39 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:error:", v10, &v39));
  v14 = v39;

  if (!v14 || objc_msgSend(v14, "code") == (id)-25300)
  {

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v15, "addObjectsFromArray:", v13);
    objc_msgSend(v15, "addObjectsFromArray:", v8);
    v16 = objc_msgSend(v15, "count");
    if ((unint64_t)v16 <= -[APAttributionTokenStore size](self, "size"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionTokenStore storage](self, "storage"));
      v38 = 0;
      objc_msgSend(v22, "setValue:forKey:error:", v15, v10, &v38);
      v14 = v38;

      if (!v14)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
        objc_msgSend(v17, "unlock");
        v31 = 1;
        goto LABEL_16;
      }
      v23 = APLogForCategory(4);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (const char *)objc_msgSend(v14, "code");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
        *(_DWORD *)buf = 134218242;
        v43 = v25;
        v44 = 2114;
        v45 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error setting tokens to refill cache code %ld: %{public}@", buf, 0x16u);

      }
      v27 = objc_msgSend(v14, "code");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error setting tokens to refill cache code %ld: %@"), v27, v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
      CreateDiagnosticReport(v29, v30, CFSTR("com.apple.ap.attribution.token"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
      objc_msgSend(v17, "unlock");
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%{sensitive}s Adding more tokens than space available in cache %lu"), "-[APAttributionTokenStore addTokens:isDetailed:error:]", objc_msgSend(v15, "count")));
      v18 = APLogForCategory(4);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = (const char *)v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (a5)
      {
        v40 = NSLocalizedDescriptionKey;
        v41 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.attribution.token"), 1300, v20));

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
      objc_msgSend(v21, "unlock");

      v14 = 0;
    }
    v31 = 0;
LABEL_16:

    goto LABEL_22;
  }
  v32 = APLogForCategory(4);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = objc_msgSend(v14, "code");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
    *(_DWORD *)buf = 136643331;
    v43 = "-[APAttributionTokenStore addTokens:isDetailed:error:]";
    v44 = 2048;
    v45 = v34;
    v46 = 2114;
    v47 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{sensitive}s Error reading tokens from cache code %ld: %{public}@", buf, 0x20u);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
  CreateDiagnosticReport(CFSTR("Error reading tokens during refill"), v36, CFSTR("com.apple.ap.attribution.token"));

  if (a5)
    *a5 = objc_retainAutorelease(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[APAttributionTokenStore storageLock](APAttributionTokenStore, "storageLock"));
  objc_msgSend(v15, "unlock");
  v31 = 0;
LABEL_22:

  return v31;
}

- (APSettingsStorableProtocol)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
