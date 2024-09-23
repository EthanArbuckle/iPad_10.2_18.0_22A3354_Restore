@implementation RERelevanceProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
}

- (RERelevanceProvider)init
{
  RERelevanceProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RERelevanceProvider;
  result = -[RERelevanceProvider init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_cachedHash = xmmword_2133E4EC0;
  return result;
}

+ (id)customRelevanceProviderForFeature:(id)a3 withValue:(id)a4
{
  id v5;
  const void *v6;
  RECustomRelevanceProvider *v7;

  v5 = a3;
  v6 = (const void *)RECreateFeatureValueTaggedPointer(a4);
  v7 = -[RECustomRelevanceProvider initWithFeature:value:]([RECustomRelevanceProvider alloc], "initWithFeature:value:", v5, v6);

  REReleaseFeatureValueTaggedPointer(v6);
  return v7;
}

+ (id)relevanceSimulatorID
{
  return &stru_24CF92178;
}

- (id)dictionaryEncoding
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_cachedHash;
  *((_QWORD *)result + 2) = self->_priority;
  return result;
}

- (unint64_t)relevancePriority
{
  return self->_priority;
}

- (RERelevanceProvider)providerWithPriority:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[RERelevanceProvider copy](self, "copy");
  v4[1] = 0;
  v4[2] = a3;
  return (RERelevanceProvider *)v4;
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceProvider *v4;
  BOOL v5;

  v4 = (RERelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_priority == self->_priority;
  }

  return v5;
}

- (unint64_t)_hash
{
  return 0;
}

- (unint64_t)hash
{
  unint64_t result;
  unint64_t priority;
  unint64_t v5;

  result = self->_cachedHash;
  if (!result)
  {
    priority = self->_priority;
    v5 = -[RERelevanceProvider _hash](self, "_hash");
    if (v5 != priority << 32)
      result = v5 ^ (priority << 32);
    else
      result = -1;
    self->_cachedHash = result;
  }
  return result;
}

- (void)setEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_environment, a3);
}

- (id)environment
{
  return objc_loadWeakRetained((id *)&self->_environment);
}

@end
