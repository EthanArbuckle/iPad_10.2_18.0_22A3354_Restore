@implementation MSDContentServerURLRetryPolicy

- (MSDContentServerURLRetryPolicy)initWithContext:(id)a3
{
  id v4;
  MSDContentServerURLRetryPolicy *v5;
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
  MSDContentServerURLRetryPolicy *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSDContentServerURLRetryPolicy;
  v5 = -[MSDContentServerURLRetryPolicy init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fdc"));
    -[MSDContentServerURLRetryPolicy setFdc:](v5, "setFdc:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fdc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originServer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localCredentialForOriginServer:", v8));
    -[MSDContentServerURLRetryPolicy setLocalCredential:](v5, "setLocalCredential:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fdc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originServer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteCredentialForOriginServer:", v11));
    -[MSDContentServerURLRetryPolicy setRemoteCredential:](v5, "setRemoteCredential:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localCredential](v5, "localCredential"));
    -[MSDContentServerURLRetryPolicy setCachingHubAvailable:](v5, "setCachingHubAvailable:", v13 != 0);

    -[MSDContentServerURLRetryPolicy setServerType:](v5, "setServerType:", CFSTR("remoteCDN"));
    if (objc_msgSend(v4, "tryCachingHub")
      && -[MSDContentServerURLRetryPolicy cachingHubAvailable](v5, "cachingHubAvailable"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy buildLocalURLListFromContext:](v5, "buildLocalURLListFromContext:", v4));
      -[MSDContentServerURLRetryPolicy setLocalURLList:](v5, "setLocalURLList:", v14);

      -[MSDContentServerURLRetryPolicy setServerType:](v5, "setServerType:", CFSTR("localCachingHub"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteCredential](v5, "remoteCredential"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteCredential](v5, "remoteCredential"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy getURLSchemaList:](v5, "getURLSchemaList:", v16));
      -[MSDContentServerURLRetryPolicy setRemoteURLList:](v5, "setRemoteURLList:", v17);

    }
    -[MSDContentServerURLRetryPolicy setCurrentTry:](v5, "setCurrentTry:", 0);
    -[MSDContentServerURLRetryPolicy setLocalHubReachable:](v5, "setLocalHubReachable:", objc_msgSend(v4, "tryCachingHub"));
    v18 = v5;
  }

  return v5;
}

- (id)nextTry
{
  void *v3;
  unsigned int v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  MSDServerRetryInfo *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("localCachingHub"));

  if (v4)
  {
    v5 = -[MSDContentServerURLRetryPolicy currentTry](self, "currentTry");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localURLList](self, "localURLList"));
    v7 = objc_msgSend(v6, "count");

    if (v5 < (unint64_t)v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localURLList](self, "localURLList"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", -[MSDContentServerURLRetryPolicy currentTry](self, "currentTry")));

      goto LABEL_8;
    }
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C2588((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);

    -[MSDContentServerURLRetryPolicy setLocalHubReachable:](self, "setLocalHubReachable:", 0);
    -[MSDContentServerURLRetryPolicy setServerType:](self, "setServerType:", CFSTR("remoteCDN"));
    -[MSDContentServerURLRetryPolicy setCurrentTry:](self, "setCurrentTry:", 0);
  }
  v9 = 0;
LABEL_8:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("remoteCDN"));

  if (v19)
  {
    if (-[MSDContentServerURLRetryPolicy currentTry](self, "currentTry")
      || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteURLList](self, "remoteURLList")),
          v29 = objc_msgSend(v28, "count"),
          v28,
          !v29))
    {
      v20 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000C2524((uint64_t)self, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteURLList](self, "remoteURLList"));
      v30 = objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndex:](v21, "objectAtIndex:", 0));

      v9 = (void *)v30;
    }

  }
  if (v9)
  {
    v31 = objc_alloc_init(MSDServerRetryInfo);
    -[MSDServerRetryInfo setUrlSchema:](v31, "setUrlSchema:", v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
    -[MSDServerRetryInfo setServerType:](v31, "setServerType:", v32);

    -[MSDServerRetryInfo setLocalHubReachable:](v31, "setLocalHubReachable:", -[MSDContentServerURLRetryPolicy localHubReachable](self, "localHubReachable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy getCredential](self, "getCredential"));
    -[MSDServerRetryInfo setCredential:](v31, "setCredential:", v33);

  }
  else
  {
    v31 = 0;
  }
  -[MSDContentServerURLRetryPolicy setCurrentTry:](self, "setCurrentTry:", (char *)-[MSDContentServerURLRetryPolicy currentTry](self, "currentTry") + 1);

  return v31;
}

- (id)getCredential
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("localCachingHub")) & 1) != 0)
    v4 = objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localCredential](self, "localCredential"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteCredential](self, "remoteCredential"));
  v5 = (void *)v4;

  return v5;
}

- (id)buildLocalURLListFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localCredential](self, "localCredential"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy getURLSchemaList:](self, "getURLSchemaList:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedLocalURL"));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedLocalURL"));
    objc_msgSend(v6, "removeObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedLocalURL"));
    objc_msgSend(v6, "insertObject:atIndex:", v10, 0);

  }
  return v6;
}

- (id)getURLSchemaList:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v16;
  id v17;
  int v18;
  MSDContentServerURLRetryPolicy *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("URLSchema")));
  if (!v7)
  {
    v17 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C25EC((uint64_t)self, (uint64_t)v4, v13);
    goto LABEL_9;
  }
  v8 = objc_opt_class(NSArray, v6);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v10 = objc_opt_class(NSString, v9);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      objc_msgSend(v5, "addObject:", v7);
      goto LABEL_6;
    }
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543874;
      v19 = self;
      v20 = 2114;
      v21 = (id)objc_opt_class(v7, v14);
      v22 = 2114;
      v23 = v4;
      v16 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Unrecognized URL Scheme type :%{public}@ from download credential %{public}@", (uint8_t *)&v18, 0x20u);

    }
LABEL_9:

    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "addObjectsFromArray:", v7);
LABEL_6:
  v11 = v5;
LABEL_10:

  return v11;
}

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (MSDFileDownloadCredentials)fdc
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFdc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)localURLList
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalURLList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)remoteURLList
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRemoteURLList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)currentTry
{
  return self->_currentTry;
}

- (void)setCurrentTry:(unint64_t)a3
{
  self->_currentTry = a3;
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServerType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)cachingHubAvailable
{
  return self->_cachingHubAvailable;
}

- (void)setCachingHubAvailable:(BOOL)a3
{
  self->_cachingHubAvailable = a3;
}

- (NSDictionary)localCredential
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)remoteCredential
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_localCredential, 0);
  objc_storeStrong((id *)&self->_serverType, 0);
  objc_storeStrong((id *)&self->_remoteURLList, 0);
  objc_storeStrong((id *)&self->_localURLList, 0);
  objc_storeStrong((id *)&self->_fdc, 0);
}

@end
