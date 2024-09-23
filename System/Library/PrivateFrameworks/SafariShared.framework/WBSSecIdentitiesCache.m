@implementation WBSSecIdentitiesCache

- (WBSSecIdentitiesCache)init
{
  WBSSecIdentitiesCache *v2;
  uint64_t v3;
  NSMutableDictionary *domainsToIdentities;
  WBSSecIdentitiesCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSSecIdentitiesCache;
  v2 = -[WBSSecIdentitiesCache init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    domainsToIdentities = v2->_domainsToIdentities;
    v2->_domainsToIdentities = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (__SecIdentity)secIdentityForDomain:(id)a3
{
  void *v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainsToIdentities, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__SecIdentity *)v3;
}

- (void)setSecIdentity:(__SecIdentity *)a3 forDomain:(id)a4
{
  NSMutableDictionary *domainsToIdentities;

  domainsToIdentities = self->_domainsToIdentities;
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](domainsToIdentities, "setObject:forKeyedSubscript:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](domainsToIdentities, "removeObjectForKey:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsToIdentities, 0);
}

@end
