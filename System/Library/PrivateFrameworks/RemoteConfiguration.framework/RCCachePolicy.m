@implementation RCCachePolicy

+ (id)defaultCachePolicy
{
  if (defaultCachePolicy_onceToken != -1)
    dispatch_once(&defaultCachePolicy_onceToken, &__block_literal_global_9);
  return (id)defaultCachePolicy_result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRequestCachePolicy:", -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy"));
  return v4;
}

- (unint64_t)requestCachePolicy
{
  return self->_requestCachePolicy;
}

- (void)setRequestCachePolicy:(unint64_t)a3
{
  self->_requestCachePolicy = a3;
}

uint64_t __35__RCCachePolicy_defaultCachePolicy__block_invoke()
{
  RCCachePolicy *v0;
  void *v1;

  v0 = objc_alloc_init(RCCachePolicy);
  v1 = (void *)defaultCachePolicy_result;
  defaultCachePolicy_result = (uint64_t)v0;

  return objc_msgSend((id)defaultCachePolicy_result, "setRequestCachePolicy:", 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: requestCachePolicy: %lu>"), objc_opt_class(), -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy"));
}

+ (id)ignoreCachePolicy
{
  if (ignoreCachePolicy_onceToken != -1)
    dispatch_once(&ignoreCachePolicy_onceToken, &__block_literal_global_1);
  return (id)ignoreCachePolicy_result;
}

uint64_t __34__RCCachePolicy_ignoreCachePolicy__block_invoke()
{
  RCCachePolicy *v0;
  void *v1;

  v0 = objc_alloc_init(RCCachePolicy);
  v1 = (void *)ignoreCachePolicy_result;
  ignoreCachePolicy_result = (uint64_t)v0;

  return objc_msgSend((id)ignoreCachePolicy_result, "setRequestCachePolicy:", 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy");
    v7 = objc_msgSend(v5, "requestCachePolicy");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

@end
