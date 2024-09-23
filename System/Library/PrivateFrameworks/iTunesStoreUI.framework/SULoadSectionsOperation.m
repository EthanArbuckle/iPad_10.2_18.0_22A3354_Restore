@implementation SULoadSectionsOperation

- (SULoadSectionsOperation)init
{
  return -[SULoadSectionsOperation initWithClientInterface:](self, "initWithClientInterface:", +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
}

- (SULoadSectionsOperation)initWithClientInterface:(id)a3
{
  SULoadSectionsOperation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SULoadSectionsOperation;
  v4 = -[SULoadSectionsOperation init](&v6, sel_init);
  if (v4)
  {
    v4->_clientInterface = (SUClientInterface *)a3;
    v4->_shouldUseCache = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SULoadSectionsOperation;
  -[SULoadSectionsOperation dealloc](&v3, sel_dealloc);
}

- (NSString)activeSectionVersionString
{
  NSString *v3;

  -[SULoadSectionsOperation lock](self, "lock");
  v3 = self->_activeSectionVersionString;
  -[SULoadSectionsOperation unlock](self, "unlock");
  return v3;
}

- (SUSectionsResponse)sectionsResponse
{
  SUSectionsResponse *v3;

  -[SULoadSectionsOperation lock](self, "lock");
  v3 = self->_sectionsResponse;
  -[SULoadSectionsOperation unlock](self, "unlock");
  return v3;
}

- (void)setActiveSectionVersionString:(id)a3
{
  NSString *activeSectionVersionString;

  -[SULoadSectionsOperation lock](self, "lock");
  activeSectionVersionString = self->_activeSectionVersionString;
  if (activeSectionVersionString != a3)
  {

    self->_activeSectionVersionString = (NSString *)objc_msgSend(a3, "copy");
  }
  -[SULoadSectionsOperation unlock](self, "unlock");
}

- (void)setShouldUseCache:(BOOL)a3
{
  -[SULoadSectionsOperation lock](self, "lock");
  self->_shouldUseCache = a3;
  -[SULoadSectionsOperation unlock](self, "unlock");
}

- (BOOL)shouldUseCache
{
  BOOL shouldUseCache;

  -[SULoadSectionsOperation lock](self, "lock");
  shouldUseCache = self->_shouldUseCache;
  -[SULoadSectionsOperation unlock](self, "unlock");
  return shouldUseCache;
}

- (void)run
{
  uint64_t v3;
  double Current;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int *v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v3 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  if ((-[SULoadSectionsOperation loadURLBagWithContext:returningError:](self, "loadURLBagWithContext:returningError:", v3, &v34) & 1) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      v8 = objc_opt_class();
      v35 = 138412546;
      v36 = v8;
      v37 = 2048;
      v38 = Current;
      LODWORD(v33) = 22;
      v31 = &v35;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v35, v33);
        free(v10);
        v31 = (int *)v11;
        SSFileLog();
      }
    }
    v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache", v31), "URLBagForContext:", v3), "valueForKey:", CFSTR("mobile-tab-bars"));
    objc_opt_class();
    v15 = (objc_opt_isKindOfClass() & 1) == 0
       || (v13 = -[SUClientInterface clientIdentifier](self->_clientInterface, "clientIdentifier")) == 0
       || (v14 = objc_msgSend(v12, "objectForKey:", v13)) == 0
       || -[SULoadSectionsOperation _loadSectionsFromNetworkWithDictionary:](self, "_loadSectionsFromNetworkWithDictionary:", v14);
    v23 = CFAbsoluteTimeGetCurrent();
    v24 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v25 = objc_msgSend(v24, "shouldLog");
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v26 = v25 | 2;
    else
      v26 = v25;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v24, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v26 &= 2u;
    if (v26)
    {
      v27 = objc_opt_class();
      v35 = 138412802;
      v36 = v27;
      v37 = 2048;
      v38 = v23;
      v39 = 2048;
      v40 = v23 - Current;
      LODWORD(v33) = 32;
      v32 = &v35;
      v28 = _os_log_send_and_compose_impl();
      if (v28)
      {
        v29 = (void *)v28;
        v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v35, v33);
        free(v29);
        v32 = (int *)v30;
        SSFileLog();
      }
    }
  }
  else
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v18 &= 2u;
    if (v18)
    {
      v19 = objc_opt_class();
      v35 = 138412290;
      v36 = v19;
      LODWORD(v33) = 12;
      v31 = &v35;
      v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v35, v33);
        free(v21);
        v31 = (int *)v22;
        SSFileLog();
      }
    }
    -[SULoadSectionsOperation setError:](self, "setError:", v34, v31);
    v15 = 0;
  }
  -[SULoadSectionsOperation setSuccess:](self, "setSuccess:", v15, v32);
}

- (id)_cachePathForVersion:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = +[SUSectionsResponse sectionsCacheDirectory](SUSectionsResponse, "sectionsCacheDirectory");
  if (!v6)
    return 0;
  v7 = (void *)objc_msgSend(v6, "stringByAppendingPathComponent:", a3);
  if (v4 && !objc_msgSend(MEMORY[0x24BDD1580], "ensureDirectoryExists:", v7))
    return 0;
  return v7;
}

- (BOOL)_loadSectionsFromCacheForVersion:(id)a3
{
  id v4;
  SUSectionsResponse *v5;
  BOOL v6;

  v4 = -[SULoadSectionsOperation _cachePathForVersion:create:](self, "_cachePathForVersion:create:", a3, 0);
  if (!v4)
    return 0;
  v5 = -[SUSectionsResponse initWithClientInterface:cacheDirectory:]([SUSectionsResponse alloc], "initWithClientInterface:cacheDirectory:", self->_clientInterface, v4);
  -[SULoadSectionsOperation _setSectionsResponse:](self, "_setSectionsResponse:", v5);
  v6 = v5 != 0;
  if (v5)
    +[SUSectionsResponse setLastCachedVersionIdentifier:](SUSectionsResponse, "setLastCachedVersionIdentifier:", -[SUSectionsResponse versionString](v5, "versionString"));

  return v6;
}

- (BOOL)_loadSectionsFromNetworkWithDictionary:(id)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  SULoadNetworkSectionsOperation *v16;
  SUSectionsResponse *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  int *v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  NSString *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("version"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v5, "stringValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_9;
    }
  }
  if (!v5)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_11;
  }
  if (-[SULoadSectionsOperation shouldUseCache](self, "shouldUseCache"))
  {
    v6 = 1;
    if (-[SULoadSectionsOperation _loadSectionsFromCacheForVersion:](self, "_loadSectionsFromCacheForVersion:", v5))
      return v6;
  }
  else
  {
    v6 = 1;
  }
LABEL_11:
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    v44 = 138412290;
    v45 = objc_opt_class();
    LODWORD(v40) = 12;
    v38 = &v44;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v44, v40);
      free(v11);
      v38 = (int *)v12;
      SSFileLog();
    }
  }
  v13 = objc_msgSend(a3, "objectForKey:", CFSTR("url"), v38);
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v13);
    if (v14)
    {
      v15 = (void *)v14;
      v16 = -[SULoadNetworkSectionsOperation initWithURL:clientInterface:]([SULoadNetworkSectionsOperation alloc], "initWithURL:clientInterface:", v14, self->_clientInterface);
      -[SULoadNetworkSectionsOperation setExpectedVersionString:](v16, "setExpectedVersionString:", v5);
      v43 = 0;
      if ((-[SULoadSectionsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v16, &v43) & 1) != 0)
      {
        v17 = -[SULoadNetworkSectionsOperation sectionsResponse](v16, "sectionsResponse");
        v18 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v42 = -[SUSectionsResponse versionString](v17, "versionString");
        if (-[NSString isEqualToString:](v42, "isEqualToString:", +[SUSectionsResponse lastCachedVersionIdentifier](SUSectionsResponse, "lastCachedVersionIdentifier")))
        {
          v19 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v20 = objc_msgSend(v19, "shouldLog");
          if (objc_msgSend(v19, "shouldLogToDisk"))
            v20 |= 2u;
          if (os_log_type_enabled((os_log_t)objc_msgSend(v19, "OSLogObject"), OS_LOG_TYPE_DEBUG))
            v21 = v20;
          else
            v21 = v20 & 2;
          if (v21)
          {
            v22 = objc_opt_class();
            v44 = 138412290;
            v45 = v22;
            LODWORD(v40) = 12;
            v39 = &v44;
            v23 = _os_log_send_and_compose_impl();
            if (v23)
            {
              v24 = (void *)v23;
              v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v44, v40);
              free(v24);
              v39 = (int *)v25;
              SSFileLog();
            }
          }
          -[SUSectionsResponse setShouldResetUserOrdering:](v17, "setShouldResetUserOrdering:", 0, v39);
          v26 = v42;
        }
        else
        {
          v27 = -[SUSectionsResponse shouldResetUserOrdering](v17, "shouldResetUserOrdering");
          v28 = (void *)objc_msgSend(v18, "stringForKey:", CFSTR("SULastSectionsStoreFront"));
          v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "storeFrontIdentifier");
          v41 = v29;
          if (v28 && (objc_msgSend(v28, "isEqualToString:", v29) & 1) == 0)
          {
            v30 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
            v31 = objc_msgSend(v30, "shouldLog");
            if (objc_msgSend(v30, "shouldLogToDisk"))
              v31 |= 2u;
            if (os_log_type_enabled((os_log_t)objc_msgSend(v30, "OSLogObject"), OS_LOG_TYPE_DEBUG))
              v32 = v31;
            else
              v32 = v31 & 2;
            if (v32)
            {
              v33 = objc_opt_class();
              v44 = 138412290;
              v45 = v33;
              LODWORD(v40) = 12;
              v39 = &v44;
              v34 = _os_log_send_and_compose_impl();
              if (v34)
              {
                v35 = (void *)v34;
                v36 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v34, 4, &v44, v40);
                free(v35);
                v39 = (int *)v36;
                SSFileLog();
              }
            }
            v27 = 1;
          }
          -[SUSectionsResponse setShouldResetUserOrdering:](v17, "setShouldResetUserOrdering:", v27, v39);
          v26 = v42;
          if (v42)
            +[SUSectionsResponse setLastCachedVersionIdentifier:](SUSectionsResponse, "setLastCachedVersionIdentifier:", v42);
          if (v41)
            objc_msgSend(v18, "setObject:forKey:", v41, CFSTR("SULastSectionsStoreFront"));
          objc_msgSend(v18, "synchronize");
        }
        -[SULoadSectionsOperation _setSectionsResponse:](self, "_setSectionsResponse:", v17);
        if (-[NSArray count](-[SUSectionsResponse allSections](v17, "allSections"), "count"))
        {
          if ((v6 & -[SUSectionsResponse isCacheable](v17, "isCacheable")) == 1
            && (!v26 || objc_msgSend(v5, "isEqualToString:", v26)))
          {
            -[SULoadSectionsOperation _writeSectionsResponseToCache:forVersion:](self, "_writeSectionsResponseToCache:forVersion:", v17, v5);
          }
          LOBYTE(v6) = 1;
          goto LABEL_57;
        }
      }
      else
      {
        -[SULoadSectionsOperation setError:](self, "setError:", v43);
      }
      LOBYTE(v6) = 0;
LABEL_57:

      return v6;
    }
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (void)_setSectionsResponse:(id)a3
{
  SUSectionsResponse *sectionsResponse;

  -[SULoadSectionsOperation lock](self, "lock");
  sectionsResponse = self->_sectionsResponse;
  if (sectionsResponse != a3)
  {

    self->_sectionsResponse = (SUSectionsResponse *)a3;
  }
  -[SULoadSectionsOperation unlock](self, "unlock");
}

- (void)_writeSectionsResponseToCache:(id)a3 forVersion:(id)a4
{
  id v5;
  NSString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  SULoadSectionsOperation *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v26 = self;
  v6 = -[SULoadSectionsOperation activeSectionVersionString](self, "activeSectionVersionString");
  v7 = +[SUSectionsResponse sectionsCacheDirectory](SUSectionsResponse, "sectionsCacheDirectory");
  v27 = v5;
  v8 = (void *)objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v7, 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", v6) & 1) == 0)
        {
          v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v15 = objc_msgSend(v14, "shouldLog");
          if (objc_msgSend(v14, "shouldLogToDisk"))
            v16 = v15 | 2;
          else
            v16 = v15;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEBUG))
            v16 &= 2u;
          if (v16)
          {
            v17 = objc_opt_class();
            v32 = 138412546;
            v33 = v17;
            v34 = 2112;
            v35 = v13;
            LODWORD(v23) = 22;
            v22 = &v32;
            v18 = _os_log_send_and_compose_impl();
            if (v18)
            {
              v19 = (void *)v18;
              v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v32, v23);
              free(v19);
              v22 = (int *)v20;
              SSFileLog();
            }
          }
          objc_msgSend(v27, "removeItemAtPath:error:", objc_msgSend(v7, "stringByAppendingPathComponent:", v13, v22), 0);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v10);
  }
  v21 = -[SULoadSectionsOperation _cachePathForVersion:create:](v26, "_cachePathForVersion:create:", a4, 1);
  if (v21)
    objc_msgSend(a3, "writeToCacheDirectory:error:", v21, 0);

}

@end
