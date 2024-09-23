@implementation SKUIResourceRequest

- (SKUIResourceRequest)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIResourceRequest *result;
  unsigned int v12;
  signed int v13;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIResourceRequest init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIResourceRequest;
  result = -[SKUIResourceRequest init](&v14, sel_init);
  if (result)
  {
    do
    {
      v12 = __ldxr((unsigned int *)&init_sRequestID);
      v13 = v12 + 1;
    }
    while (__stxr(v13, (unsigned int *)&init_sRequestID));
    result->_requestID = v13;
  }
  return result;
}

- (id)_initSKUIResourceRequest
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIResourceRequest _initSKUIResourceRequest].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIResourceRequest;
  return -[SKUIResourceRequest init](&v12, sel_init);
}

- (BOOL)cachesInMemory
{
  return 0;
}

- (id)newLoadOperation
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIResourceRequest;
  -[SKUIResourceRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%lu]"), v4, self->_requestID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return self->_requestID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[SKUIResourceRequest requestIdentifier](self, "requestIdentifier");
    v6 = v7 == objc_msgSend(v4, "requestIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initSKUIResourceRequest");
  objc_storeStrong((id *)(v4 + 8), self->_cacheKey);
  *(_QWORD *)(v4 + 16) = self->_requestID;
  return (id)v4;
}

- (id)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong(&self->_cacheKey, a3);
}

- (unint64_t)requestIdentifier
{
  return self->_requestID;
}

- (void)setRequestIdentifier:(unint64_t)a3
{
  self->_requestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cacheKey, 0);
}

- (void)init
{
}

- (void)_initSKUIResourceRequest
{
}

@end
