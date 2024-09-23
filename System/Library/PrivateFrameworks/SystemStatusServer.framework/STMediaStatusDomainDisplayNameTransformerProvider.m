@implementation STMediaStatusDomainDisplayNameTransformerProvider

- (STMediaStatusDomainDisplayNameTransformerProvider)init
{
  STMediaStatusDomainDisplayNameTransformerProvider *v2;
  uint64_t v3;
  NSMutableDictionary *entityResolversByLocalization;
  uint64_t v5;
  NSMutableDictionary *transformersByLocalization;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STMediaStatusDomainDisplayNameTransformerProvider;
  v2 = -[STMediaStatusDomainDisplayNameTransformerProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    entityResolversByLocalization = v2->_entityResolversByLocalization;
    v2->_entityResolversByLocalization = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    transformersByLocalization = v2->_transformersByLocalization;
    v2->_transformersByLocalization = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setDynamicAttributions:(id)a3
{
  NSArray *v4;
  NSArray *dynamicAttributions;
  NSMutableDictionary *entityResolversByLocalization;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_dynamicAttributions, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    dynamicAttributions = self->_dynamicAttributions;
    self->_dynamicAttributions = v4;

    entityResolversByLocalization = self->_entityResolversByLocalization;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__STMediaStatusDomainDisplayNameTransformerProvider_setDynamicAttributions___block_invoke;
    v8[3] = &unk_1E8E189E8;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entityResolversByLocalization, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __76__STMediaStatusDomainDisplayNameTransformerProvider_setDynamicAttributions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setDynamicAttributions:", *(_QWORD *)(a1 + 32));
}

- (id)dataTransformerForClient:(id)a3
{
  void *v4;
  NSMutableDictionary *transformersByLocalization;
  NSMutableDictionary *v6;
  STMediaStatusDomainDisplayNameTransformer *v7;
  STAttributedEntityResolver *v8;
  NSMutableDictionary *entityResolversByLocalization;
  STMediaStatusDomainDisplayNameTransformer *v10;
  void *v11;
  NSMutableDictionary *v12;

  objc_msgSend(a3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    transformersByLocalization = self->_transformersByLocalization;
  else
    transformersByLocalization = 0;
  v6 = transformersByLocalization;
  -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v4);
  v7 = (STMediaStatusDomainDisplayNameTransformer *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = -[STAttributedEntityResolver initWithPreferredLocalizations:]([STAttributedEntityResolver alloc], "initWithPreferredLocalizations:", v4);
    if (self)
      entityResolversByLocalization = self->_entityResolversByLocalization;
    else
      entityResolversByLocalization = 0;
    -[NSMutableDictionary setObject:forKey:](entityResolversByLocalization, "setObject:forKey:", v8, v4);
    v10 = [STMediaStatusDomainDisplayNameTransformer alloc];
    -[STAttributedEntityResolver beginBatchResolutionSession](v8, "beginBatchResolutionSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[STMediaStatusDomainDisplayNameTransformer initWithEntityResolver:](v10, "initWithEntityResolver:", v11);

    if (self)
      v12 = self->_transformersByLocalization;
    else
      v12 = 0;
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v7, v4);

  }
  return v7;
}

- (NSArray)dynamicAttributions
{
  return self->_dynamicAttributions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformersByLocalization, 0);
  objc_storeStrong((id *)&self->_entityResolversByLocalization, 0);
  objc_storeStrong((id *)&self->_dynamicAttributions, 0);
}

@end
