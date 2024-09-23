@implementation ICQActionBasedUniversalLinkSpecification

- (ICQActionBasedUniversalLinkSpecification)initWithServerDictionary:(id)a3
{
  id v5;
  ICQActionBasedUniversalLinkSpecification *v6;
  ICQActionBasedUniversalLinkSpecification *v7;
  uint64_t v8;
  NSDictionary *links;

  v5 = a3;
  v6 = -[ICQActionBasedUniversalLinkSpecification init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverDict, a3);
    _ICQLinksForServerActionBasedUniversalLink(v5);
    v8 = objc_claimAutoreleasedReturnValue();
    links = v7->_links;
    v7->_links = (NSDictionary *)v8;

  }
  return v7;
}

- (ICQLink)defaultLink
{
  void *v2;
  void *v3;

  -[ICQActionBasedUniversalLinkSpecification links](self, "links");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICQLink *)v3;
}

- (NSURL)defaultServerUIURL
{
  return (NSURL *)-[ICQActionBasedUniversalLinkSpecification serverUIURLForKey:](self, "serverUIURLForKey:", CFSTR("default"));
}

- (NSURL)defaultDynamicUIRouteURL
{
  return (NSURL *)-[ICQActionBasedUniversalLinkSpecification dynamicUIRouteURLForKey:](self, "dynamicUIRouteURLForKey:", CFSTR("default"));
}

- (NSString)defaultPurchaseAttribution
{
  return (NSString *)-[ICQActionBasedUniversalLinkSpecification purchaseAttributionForKey:](self, "purchaseAttributionForKey:", CFSTR("default"));
}

- (id)serverUIURLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICQActionBasedUniversalLinkSpecification links](self, "links");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "actionURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dynamicUIRouteURLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICQActionBasedUniversalLinkSpecification links](self, "links");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dynamicUIRouteURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)purchaseAttributionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICQActionBasedUniversalLinkSpecification links](self, "links");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "purchaseAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)icqLinkForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  ICQActionBasedUniversalLinkSpecification *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v4);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "queryItems");
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v19 = self;
        v10 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v12, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("universalLinkAction"));

            if ((v14 & 1) != 0)
            {
              -[ICQActionBasedUniversalLinkSpecification links](v19, "links");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "value");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v17);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v9)
            continue;
          break;
        }
      }
      v15 = 0;
LABEL_14:

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSDictionary)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

@end
