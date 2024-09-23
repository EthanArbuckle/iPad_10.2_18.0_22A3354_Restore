@implementation ASKResourceRequest

+ (id)makeUniqueKey
{
  unint64_t v2;
  unint64_t v3;

  do
    v2 = __ldxr(&makeUniqueKey_counter);
  while (__stxr(v2 + 1, &makeUniqueKey_counter));
  v3 = atomic_load(&makeUniqueKey_counter);
  return +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v3);
}

- (ASKResourceRequest)init
{
  ASKResourceRequest *v2;
  uint64_t v3;
  ASKResourceRequest *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *requestKey;
  NSObject *v9;
  NSObject *cacheKey;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASKResourceRequest;
  v2 = -[ASKResourceRequest init](&v12, "init");
  v4 = v2;
  if (v2)
  {
    v5 = objc_msgSend((id)objc_opt_class(v2, v3), "makeUniqueKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_msgSend(v6, "copyWithZone:", 0);
    requestKey = v4->_requestKey;
    v4->_requestKey = v7;

    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    cacheKey = v4->_cacheKey;
    v4->_cacheKey = v9;

  }
  return v4;
}

- (unint64_t)cacheOptions
{
  return 0;
}

- (id)makeLoadOperation
{
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%s not overriden on %@"), "-[ASKResourceRequest makeLoadOperation]", objc_opt_class(self, a2));
  return 0;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceRequest cacheKey](self, "cacheKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p cacheKey = %@>"), v5, self, v6));

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceRequest requestKey](self, "requestKey"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  v6 = objc_opt_class(ASKResourceRequest, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  v8 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASKResourceRequest cacheKey](self, "cacheKey"));
    v8 = v9 == v10;

  }
  return v8;
}

- (NSObject)requestKey
{
  return self->_requestKey;
}

- (void)setRequestKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSObject)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

@end
