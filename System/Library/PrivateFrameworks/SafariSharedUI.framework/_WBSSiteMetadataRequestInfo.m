@implementation _WBSSiteMetadataRequestInfo

- (NSSet)requestTokens
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_requestTokens, "copy");
}

- (_WBSSiteMetadataRequestInfo)initWithProvider:(id)a3
{
  id v5;
  _WBSSiteMetadataRequestInfo *v6;
  _WBSSiteMetadataRequestInfo *v7;
  uint64_t v8;
  NSMutableSet *tokens;
  uint64_t v10;
  NSMutableSet *requestTokens;
  uint64_t v12;
  NSMutableSet *cacheRequestTokens;
  _WBSSiteMetadataRequestInfo *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_WBSSiteMetadataRequestInfo;
  v6 = -[_WBSSiteMetadataRequestInfo init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provider, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    tokens = v7->_tokens;
    v7->_tokens = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    requestTokens = v7->_requestTokens;
    v7->_requestTokens = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    cacheRequestTokens = v7->_cacheRequestTokens;
    v7->_cacheRequestTokens = (NSMutableSet *)v12;

    v14 = v7;
  }

  return v7;
}

- (NSOperation)operation
{
  return (NSOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)addRequestToken:(id)a3
{
  NSMutableSet *tokens;
  id v5;

  tokens = self->_tokens;
  v5 = a3;
  -[NSMutableSet addObject:](tokens, "addObject:", v5);
  -[NSMutableSet addObject:](self->_requestTokens, "addObject:", v5);

}

- (NSSet)tokens
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_tokens, "copy");
}

- (BOOL)canStopWatchingRequestAfterRemovingToken:(id)a3
{
  NSMutableSet *tokens;
  id v5;

  tokens = self->_tokens;
  v5 = a3;
  -[NSMutableSet removeObject:](tokens, "removeObject:", v5);
  if (-[NSMutableSet containsObject:](self->_requestTokens, "containsObject:", v5))
  {
    -[NSMutableSet removeObject:](self->_requestTokens, "removeObject:", v5);

    return -[NSMutableSet count](self->_requestTokens, "count") == 0;
  }
  else
  {
    -[NSMutableSet removeObject:](self->_cacheRequestTokens, "removeObject:", v5);

    return 0;
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_WBSSiteMetadataRequestInfo;
  -[_WBSSiteMetadataRequestInfo dealloc](&v2, sel_dealloc);
}

- (void)addCacheRequestToken:(id)a3
{
  NSMutableSet *tokens;
  id v5;

  tokens = self->_tokens;
  v5 = a3;
  -[NSMutableSet addObject:](tokens, "addObject:", v5);
  -[NSMutableSet addObject:](self->_cacheRequestTokens, "addObject:", v5);

}

- (WBSSiteMetadataProvider)provider
{
  return self->_provider;
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_cacheRequestTokens, 0);
  objc_storeStrong((id *)&self->_requestTokens, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
