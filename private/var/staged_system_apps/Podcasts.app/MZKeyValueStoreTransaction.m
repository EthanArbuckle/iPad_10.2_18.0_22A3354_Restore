@implementation MZKeyValueStoreTransaction

- (MZKeyValueStoreTransaction)initWithType:(int)a3 domain:(id)a4 URL:(id)a5 keys:(id)a6
{
  id v10;
  id v11;
  id v12;
  MZKeyValueStoreTransaction *v13;
  MZKeyValueStoreTransaction *v14;
  NSString *v15;
  NSString *domain;
  NSString *sinceDomainVersion;
  objc_super v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MZKeyValueStoreTransaction;
  v13 = -[MZKeyValueStoreTransaction init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v15 = (NSString *)objc_msgSend(v10, "copy");
    domain = v14->_domain;
    v14->_domain = v15;

    sinceDomainVersion = v14->_sinceDomainVersion;
    v14->_sinceDomainVersion = 0;

    objc_storeStrong((id *)&v14->_URL, a5);
    objc_storeStrong((id *)&v14->_keys, a6);
  }

  return v14;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6;
  MZKeyValueStoreTransaction *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction userInfo](v7, "userInfo"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MZKeyValueStoreTransaction setUserInfo:](v7, "setUserInfo:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction userInfo](v7, "userInfo"));
  objc_msgSend(v10, "setValue:forKey:", v11, v6);

  objc_sync_exit(v7);
}

- (id)userInfoValueForKey:(id)a3
{
  id v4;
  MZKeyValueStoreTransaction *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction userInfo](v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (id)description
{
  unsigned int v3;
  void *v4;
  id v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;

  v3 = -[MZKeyValueStoreTransaction type](self, "type");
  switch(v3)
  {
    case 3u:
      v6 = &stru_1004C6D40;
      v7 = CFSTR("REMOVE");
      break;
    case 2u:
      v6 = &stru_1004C6D40;
      v7 = CFSTR("SET");
      break;
    case 1u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction keys](self, "keys"));
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = &stru_1004C6D40;
        v7 = CFSTR("GET");
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction sinceDomainVersion](self, "sinceDomainVersion"));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" since-domain-version=%@"), v8));

        v7 = CFSTR("GET-ALL");
      }
      break;
    default:
      v6 = &stru_1004C6D40;
      v7 = CFSTR("Unknown");
      break;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction URL](self, "URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
  if (!objc_msgSend(v10, "length"))
  {

    v14 = &stru_1004C6D40;
LABEL_15:

    goto LABEL_16;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction URL](self, "URL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("(null)"));

  if ((v13 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction URL](self, "URL"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" url=%@"), v9));
    goto LABEL_15;
  }
  v14 = &stru_1004C6D40;
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction keys](self, "keys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(",")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" keys=%@"), v16));

  v18 = (objc_class *)objc_opt_class(self);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p type:%@%@%@%@>"), v20, self, v7, v14, v17, v6));

  return v21;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)sinceDomainVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSinceDomainVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MZKeyValueStoreTransactionProcessing)processor
{
  return (MZKeyValueStoreTransactionProcessing *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_sinceDomainVersion, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (NSString)action
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction processor](self, "processor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataForSetTransaction:key:version:", self, CFSTR("action"), 0));

  v14 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSString), v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v14;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    v10 = _MTLogCategoryCloudSync(v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Processor returned data for action that isn't a valid archive. Error: %@", buf, 0xCu);

    }
  }

  return (NSString *)v6;
}

@end
