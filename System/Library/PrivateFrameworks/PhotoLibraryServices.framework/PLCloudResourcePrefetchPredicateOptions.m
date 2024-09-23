@implementation PLCloudResourcePrefetchPredicateOptions

- (PLCloudResourcePrefetchPredicateOptions)initWithPrefetchMode:(int64_t)a3 prefetchOptimizeMode:(int64_t)a4 excludeDynamicResources:(BOOL)a5 prefetchConfiguration:(id)a6
{
  id v11;
  PLCloudResourcePrefetchPredicateOptions *v12;
  PLCloudResourcePrefetchPredicateOptions *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLCloudResourcePrefetchPredicateOptions;
  v12 = -[PLCloudResourcePrefetchPredicateOptions init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_prefetchMode = a3;
    v12->_prefetchOptimizeMode = a4;
    v12->_excludeDynamicResources = a5;
    objc_storeStrong((id *)&v12->_prefetchConfiguration, a6);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[PLCloudResourcePrefetchPredicateOptions prefetchMode](self, "prefetchMode");
  v6 = -[PLCloudResourcePrefetchPredicateOptions prefetchOptimizeMode](self, "prefetchOptimizeMode");
  v7 = -[PLCloudResourcePrefetchPredicateOptions excludeDynamicResources](self, "excludeDynamicResources");
  -[PLCloudResourcePrefetchPredicateOptions prefetchConfiguration](self, "prefetchConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:", v5, v6, v7, v8);

  return v9;
}

- (int64_t)prefetchMode
{
  return self->_prefetchMode;
}

- (void)setPrefetchMode:(int64_t)a3
{
  self->_prefetchMode = a3;
}

- (int64_t)prefetchOptimizeMode
{
  return self->_prefetchOptimizeMode;
}

- (void)setPrefetchOptimizeMode:(int64_t)a3
{
  self->_prefetchOptimizeMode = a3;
}

- (BOOL)excludeDynamicResources
{
  return self->_excludeDynamicResources;
}

- (void)setExcludeDynamicResources:(BOOL)a3
{
  self->_excludeDynamicResources = a3;
}

- (PLPrefetchConfiguration)prefetchConfiguration
{
  return self->_prefetchConfiguration;
}

- (void)setPrefetchConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchConfiguration, 0);
}

@end
