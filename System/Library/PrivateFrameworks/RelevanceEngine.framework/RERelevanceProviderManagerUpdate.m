@implementation RERelevanceProviderManagerUpdate

+ (id)immediateUpdateForAllProviders
{
  return -[RERelevanceProviderManagerUpdate initWithProvider:]([RERelevanceProviderManagerImmediateUpdate alloc], "initWithProvider:", 0);
}

- (RERelevanceProviderManagerUpdate)initWithProvider:(id)a3
{
  id v5;
  RERelevanceProviderManagerUpdate *v6;
  RERelevanceProviderManagerUpdate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RERelevanceProviderManagerUpdate;
  v6 = -[RERelevanceProviderManagerUpdate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_provider, a3);

  return v7;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)allProviders
{
  return self->_provider == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (id)immediateUpdateForProvider:(id)a3
{
  id v3;
  RERelevanceProviderManagerImmediateUpdate *v4;

  v3 = a3;
  v4 = -[RERelevanceProviderManagerUpdate initWithProvider:]([RERelevanceProviderManagerImmediateUpdate alloc], "initWithProvider:", v3);

  return v4;
}

+ (id)scheduledUpdateForProvider:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  RERelevanceProviderManagerScheduledUpdate *v7;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    v7 = -[RERelevanceProviderManagerScheduledUpdate initWithProvider:updateDate:]([RERelevanceProviderManagerScheduledUpdate alloc], "initWithProvider:updateDate:", v6, v5);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)scheduledUpdateForAllProvidersAtDate:(id)a3
{
  id v3;
  RERelevanceProviderManagerScheduledUpdate *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[RERelevanceProviderManagerScheduledUpdate initWithProvider:updateDate:]([RERelevanceProviderManagerScheduledUpdate alloc], "initWithProvider:updateDate:", 0, v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_provider);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceProviderManagerUpdate *v4;
  RERelevanceProvider *provider;
  RERelevanceProvider *v6;
  RERelevanceProvider *v7;
  RERelevanceProvider *v8;
  char v9;

  v4 = (RERelevanceProviderManagerUpdate *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      provider = self->_provider;
      v6 = v4->_provider;
      v7 = provider;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[RERelevanceProvider isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return -[RERelevanceProvider hash](self->_provider, "hash");
}

- (RERelevanceProvider)provider
{
  return self->_provider;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
