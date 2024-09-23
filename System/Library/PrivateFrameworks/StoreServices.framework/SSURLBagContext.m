@implementation SSURLBagContext

- (SSURLBagContext)init
{
  SSURLBagContext *result;

  result = -[SSURLBagContext _init](self, "_init");
  if (result)
    result->_allowedRetryCount = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSURLBagContext;
  -[SSURLBagContext dealloc](&v3, sel_dealloc);
}

+ (SSURLBagContext)contextWithBagType:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setBagType:", a3);
  return (SSURLBagContext *)v4;
}

- (NSDictionary)allHTTPHeaders
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_httpHeaders, "copy");
}

- (NSString)cacheKey
{
  const __CFString *v3;
  const __CFString *v4;
  NSNumber *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;

  v3 = (const __CFString *)-[NSMutableDictionary objectForKey:](self->_httpHeaders, "objectForKey:", CFSTR("X-Apple-Store-Front"));
  v4 = (const __CFString *)-[NSMutableDictionary objectForKey:](self->_httpHeaders, "objectForKey:", CFSTR("User-Agent"));
  v5 = -[SSURLBagContext userIdentifier](self, "userIdentifier");
  if (v3)
  {
    if (v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v10 = v9;
  if (v5)
  {
    v11 = (void *)objc_msgSend(v9, "accountWithUniqueIdentifier:", v5);
    if (v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = (void *)objc_msgSend(v9, "activeAccount");
  if (!v11)
LABEL_8:
    v11 = (void *)objc_msgSend(v10, "localiTunesAccount");
LABEL_9:
  v3 = (const __CFString *)SSVStoreFrontIdentifierForAccount(v11);
  if (!v4)
LABEL_3:
    v4 = (const __CFString *)SSVDefaultUserAgent();
LABEL_4:
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[SSURLBagContext bagType](self, "bagType");
  if (v5)
    v8 = -[NSNumber stringValue](v5, "stringValue");
  else
    v8 = CFSTR("nil");
  if (v4)
    v12 = v4;
  else
    v12 = CFSTR("nil");
  if (v3)
    v13 = v3;
  else
    v13 = CFSTR("nil");
  return (NSString *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld-%@-%@-%@"), v7, v8, v12, v13);
}

- (NSString)clientBundleIdentifier
{
  const void *v3;
  __int128 v5;

  if (-[NSData length](-[SSURLBagContext clientAuditTokenData](self, "clientAuditTokenData"), "length") != 32)
    return 0;
  -[NSData getBytes:length:](-[SSURLBagContext clientAuditTokenData](self, "clientAuditTokenData", 0, 0, 0, 0), "getBytes:length:", &v5, 32);
  v3 = (const void *)CPCopyBundleIdentifierFromAuditToken();
  return (NSString *)(id)CFMakeCollectable(v3);
}

- (void)setAllHTTPHeaders:(id)a3
{
  NSMutableDictionary *httpHeaders;

  httpHeaders = self->_httpHeaders;
  if (httpHeaders != a3)
  {

    self->_httpHeaders = (NSMutableDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  NSMutableDictionary *httpHeaders;

  httpHeaders = self->_httpHeaders;
  if (a3)
  {
    if (!httpHeaders)
    {
      httpHeaders = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_httpHeaders = httpHeaders;
    }
    -[NSMutableDictionary setObject:forKey:](httpHeaders, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](httpHeaders, "removeObjectForKey:", a4);
  }
}

- (id)valueForHTTPHeaderField:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_httpHeaders, "objectForKey:", a3);
}

- (NSNumber)userIdentifier
{
  NSNumber *userIdentifier;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  userIdentifier = self->_userIdentifier;
  if (!userIdentifier)
  {
    if (-[SSURLBagContext bagType](self, "bagType") == 1)
      v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]), "ams_activeiTunesAccount"), "ams_DSID");
    else
      v4 = (void *)objc_msgSend((id)objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    userIdentifier = v4;
    self->_userIdentifier = userIdentifier;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  NSNumber *userIdentifier;

  -[NSLock lock](self->_lock, "lock");
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {

    self->_userIdentifier = 0;
  }
  self->_userIdentifier = (NSNumber *)a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSURLBagContext;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: [%@]"), -[SSURLBagContext description](&v3, sel_description), -[SSURLBagContext cacheKey](self, "cacheKey"));
}

- (unint64_t)hash
{
  int64_t bagType;
  uint64_t v4;
  uint64_t v5;

  bagType = self->_bagType;
  v4 = -[NSData hash](self->_clientAuditTokenData, "hash");
  v5 = v4 + bagType + -[NSNumber hash](-[SSURLBagContext userIdentifier](self, "userIdentifier"), "hash");
  return v5 + -[NSMutableDictionary hash](self->_httpHeaders, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSData *clientAuditTokenData;
  int v7;
  NSNumber *v8;
  NSMutableDictionary *httpHeaders;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && self->_allowedRetryCount == *((_QWORD *)a3 + 1)
    && self->_allowsBootstrapCellularData == *((unsigned __int8 *)a3 + 16)
    && self->_allowsExpiredBags == *((unsigned __int8 *)a3 + 17)
    && self->_bagType == *((_QWORD *)a3 + 3)
    && self->_ignoresCaches == *((unsigned __int8 *)a3 + 48)
    && self->_usesCachedBagsOnly == *((unsigned __int8 *)a3 + 72))
  {
    clientAuditTokenData = self->_clientAuditTokenData;
    if (clientAuditTokenData == *((NSData **)a3 + 4)
      || (v7 = -[NSData isEqual:](clientAuditTokenData, "isEqual:")) != 0)
    {
      v8 = -[SSURLBagContext userIdentifier](self, "userIdentifier");
      if (v8 == (NSNumber *)objc_msgSend(a3, "userIdentifier")
        || (v7 = -[NSNumber isEqual:](-[SSURLBagContext userIdentifier](self, "userIdentifier"), "isEqual:", objc_msgSend(a3, "userIdentifier"))) != 0)
      {
        httpHeaders = self->_httpHeaders;
        if (httpHeaders == *((NSMutableDictionary **)a3 + 5))
          LOBYTE(v7) = 1;
        else
          LOBYTE(v7) = -[NSMutableDictionary isEqualToDictionary:](httpHeaders, "isEqualToDictionary:");
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_allowedRetryCount;
  *(_BYTE *)(v5 + 16) = self->_allowsBootstrapCellularData;
  *(_BYTE *)(v5 + 17) = self->_allowsExpiredBags;
  *(_QWORD *)(v5 + 24) = self->_bagType;
  *(_QWORD *)(v5 + 32) = -[NSData copyWithZone:](self->_clientAuditTokenData, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[NSMutableDictionary mutableCopyWithZone:](self->_httpHeaders, "mutableCopyWithZone:", a3);
  *(_BYTE *)(v5 + 48) = self->_ignoresCaches;
  *(_QWORD *)(v5 + 64) = -[NSNumber copyWithZone:](self->_userIdentifier, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 72) = self->_usesCachedBagsOnly;
  return (id)v5;
}

- (SSURLBagContext)initWithXPCEncoding:(id)a3
{
  SSURLBagContext *v5;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v5 = -[SSURLBagContext _init](self, "_init");
    if (!v5)
      return v5;
    v5->_allowedRetryCount = xpc_dictionary_get_int64(a3, "4");
    v5->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(a3, "7");
    v5->_allowsExpiredBags = xpc_dictionary_get_BOOL(a3, "5");
    v5->_bagType = xpc_dictionary_get_int64(a3, "0");
    objc_opt_class();
    v5->_clientAuditTokenData = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "8");
    v5->_ignoresCaches = xpc_dictionary_get_BOOL(a3, "3");
    objc_opt_class();
    v5->_userIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
    v5->_usesCachedBagsOnly = xpc_dictionary_get_BOOL(a3, "6");
    objc_opt_class();
    self = (SSURLBagContext *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    v5->_httpHeaders = (NSMutableDictionary *)-[SSURLBagContext mutableCopy](self, "mutableCopy");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "4", self->_allowedRetryCount);
  xpc_dictionary_set_BOOL(v3, "7", self->_allowsBootstrapCellularData);
  xpc_dictionary_set_BOOL(v3, "5", self->_allowsExpiredBags);
  xpc_dictionary_set_int64(v3, "0", self->_bagType);
  SSXPCDictionarySetCFObject(v3, "8", (__CFString *)self->_clientAuditTokenData);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_httpHeaders);
  xpc_dictionary_set_BOOL(v3, "3", self->_ignoresCaches);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_userIdentifier);
  xpc_dictionary_set_BOOL(v3, "6", self->_usesCachedBagsOnly);
  return v3;
}

- (id)_init
{
  SSURLBagContext *v2;
  NSLock *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSURLBagContext;
  v2 = -[SSURLBagContext init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_lock = v3;
    -[NSLock setName:](v3, "setName:", CFSTR("com.apple.StoreServices.SSURLBagContext"));
  }
  return v2;
}

- (int64_t)allowedRetryCount
{
  return self->_allowedRetryCount;
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  self->_allowedRetryCount = a3;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (BOOL)allowsExpiredBags
{
  return self->_allowsExpiredBags;
}

- (void)setAllowsExpiredBags:(BOOL)a3
{
  self->_allowsExpiredBags = a3;
}

- (int64_t)bagType
{
  return self->_bagType;
}

- (void)setBagType:(int64_t)a3
{
  self->_bagType = a3;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)ignoresCaches
{
  return self->_ignoresCaches;
}

- (void)setIgnoresCaches:(BOOL)a3
{
  self->_ignoresCaches = a3;
}

- (BOOL)usesCachedBagsOnly
{
  return self->_usesCachedBagsOnly;
}

- (void)setUsesCachedBagsOnly:(BOOL)a3
{
  self->_usesCachedBagsOnly = a3;
}

@end
