@implementation SBHLibraryCategoryMapProviderRefreshRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescription, 0);
  objc_storeStrong((id *)&self->_requestReason, 0);
  objc_storeStrong((id *)&self->_failures, 0);
}

- (SBHLibraryCategoryMapProviderRefreshRequest)initWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  SBHLibraryCategoryMapProviderRefreshRequest *v7;
  SBHLibraryCategoryMapProviderRefreshRequest *v8;
  uint64_t v9;
  NSString *requestReason;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryCategoryMapProviderRefreshRequest;
  v7 = -[SBHLibraryCategoryMapProviderRefreshRequest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    v9 = objc_msgSend(v6, "copy");
    requestReason = v8->_requestReason;
    v8->_requestReason = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBHLibraryCategoryMapProviderRefreshRequest *v4;
  uint64_t v5;
  NSMutableDictionary *failures;

  v4 = -[SBHLibraryCategoryMapProviderRefreshRequest initWithOptions:reason:](+[SBHLibraryCategoryMapProviderRefreshRequest allocWithZone:](SBHLibraryCategoryMapProviderRefreshRequest, "allocWithZone:", a3), "initWithOptions:reason:", self->_options, self->_requestReason);
  v5 = -[NSMutableDictionary mutableCopy](self->_failures, "mutableCopy");
  failures = v4->_failures;
  v4->_failures = (NSMutableDictionary *)v5;

  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_requestReason, CFSTR("requestReason"));
  NSDictionaryFromSBHLibraryCategoryMapRefreshOptions(self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v5, CFSTR("options"), 0);

  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_failures, CFSTR("failures"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)accumulateFailure:(id)a3 forSession:(unint64_t)a4
{
  NSMutableDictionary *failures;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  failures = self->_failures;
  if (!failures)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->_failures;
    self->_failures = v7;

    failures = self->_failures;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](failures, "setObject:forKeyedSubscript:", v10, v9);

}

- (unint64_t)failureCount
{
  return -[NSMutableDictionary count](self->_failures, "count");
}

- (id)failureForSessionIdentifier:(int64_t)a3
{
  NSMutableDictionary *failures;
  void *v4;
  void *v5;

  failures = self->_failures;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](failures, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasFailedSeveralTimes
{
  return (unint64_t)-[NSMutableDictionary count](self->_failures, "count") > 2;
}

- (NSString)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)senderDescription
{
  return self->_senderDescription;
}

- (void)setSenderDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
