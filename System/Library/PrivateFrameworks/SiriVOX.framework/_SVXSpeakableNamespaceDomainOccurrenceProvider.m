@implementation _SVXSpeakableNamespaceDomainOccurrenceProvider

- (id)stringForExpression:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[_SVXSpeakableNamespaceDomainOccurrenceProvider deferredMessageKeys](self, "deferredMessageKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
    ++self->_count;
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSSet)deferredMessageKeys
{
  return self->_deferredMessageKeys;
}

- (void)setDeferredMessageKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredMessageKeys, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

+ (id)providerForDomain:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x24BE824F8];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE824F8]))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setDomain:", v3);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE82508], *MEMORY[0x24BE82510], *MEMORY[0x24BE82518], *MEMORY[0x24BE82520], *MEMORY[0x24BE82528], *MEMORY[0x24BE82530], 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeferredMessageKeys:", v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
