@implementation WBSWebExtensionMatchPattern

+ (id)allHostsAndSchemesMatchPatternSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPatternSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::onceToken != -1)
    dispatch_once(&+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::onceToken, block);
  return (id)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::allHostsPatternSet;
}

void __64__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPatternSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "allHostsAndSchemesMatchPattern");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithObject:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::allHostsPatternSet;
  +[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::allHostsPatternSet = v2;

}

+ (BOOL)patternSetContainsAllHostsPattern:(id)a3
{
  return objc_msgSend(a3, "safari_containsObjectPassingTest:", &__block_literal_global_65);
}

uint64_t __65__WBSWebExtensionMatchPattern_patternSetContainsAllHostsPattern___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesAllHosts");
}

+ (BOOL)hasPatternMatchingIndividualHost:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "matchesAllHosts", (_QWORD)v8) & 1) == 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)allHostsAndSchemesMatchPattern
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPattern__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::onceToken != -1)
    dispatch_once(&+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::onceToken, block);
  return (id)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::allHostsPattern;
}

void __61__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPattern__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "matchPatternWithString:", CFSTR("*://*/*"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::allHostsPattern;
  +[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::allHostsPattern = v1;

}

+ (id)matchPatternForDomain:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*://*.%@/*"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "matchPatternWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)matchPatternForDomainWithoutSubdomains:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*://%@/*"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "matchPatternWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)matchPatternWithString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEF730], "matchPatternWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_getAssociatedObject(v4, (const void *)webKitPatternAssociationKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "object"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {

      v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWebKitMatchPattern:", v5);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)matchPatternsWtihWebKitPatterns:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__WBSWebExtensionMatchPattern_matchPatternsWtihWebKitPatterns___block_invoke;
      v9[3] = &__block_descriptor_40_e66___WBSWebExtensionMatchPattern_16__0___WKWebExtensionMatchPattern_8l;
      v9[4] = a1;
      objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v9);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __63__WBSWebExtensionMatchPattern_matchPatternsWtihWebKitPatterns___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithWebKitMatchPattern:", v3);

  return v4;
}

+ (id)matchPatternWtihWebKitPattern:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWebKitMatchPattern:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSWebExtensionMatchPattern)initWithString:(id)a3
{
  return -[WBSWebExtensionMatchPattern initWithString:exception:](self, "initWithString:exception:", a3, 0);
}

- (WBSWebExtensionMatchPattern)initWithString:(id)a3 exception:(id *)a4
{
  id v6;
  WBSWebExtensionMatchPattern *v7;
  uint64_t v8;
  id v9;
  _WKWebExtensionMatchPattern *webKitMatchPattern;
  _WKWebExtensionMatchPattern *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSWebExtensionMatchPattern;
  v7 = -[WBSWebExtensionMatchPattern init](&v18, sel_init);
  if (v7)
  {
    v17 = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF730]), "initWithString:error:", v6, &v17);
    v9 = v17;
    webKitMatchPattern = v7->_webKitMatchPattern;
    v7->_webKitMatchPattern = (_WKWebExtensionMatchPattern *)v8;

    v11 = v7->_webKitMatchPattern;
    if (v11)
      v12 = v9 == 0;
    else
      v12 = 0;
    if (v12)
    {
      objc_getAssociatedObject(v11, (const void *)webKitPatternAssociationKey);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && (objc_msgSend(v14, "object"), (a4 = (id *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {

        a4 = v7;
      }
    }
    else if (a4)
    {
      objc_msgSend(v9, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }

  }
  else
  {
    a4 = 0;
  }

  return (WBSWebExtensionMatchPattern *)a4;
}

- (WBSWebExtensionMatchPattern)initWithScheme:(id)a3 host:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSWebExtensionMatchPattern *v11;
  uint64_t v12;
  _WKWebExtensionMatchPattern *webKitMatchPattern;
  WBSWebExtensionMatchPattern *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[WBSWebExtensionMatchPattern init](self, "init");
  if (v11
    && (v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF730]), "initWithScheme:host:path:error:", v8, v9, v10, 0),
        webKitMatchPattern = v11->_webKitMatchPattern,
        v11->_webKitMatchPattern = (_WKWebExtensionMatchPattern *)v12,
        webKitMatchPattern,
        v11->_webKitMatchPattern))
  {
    v14 = v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WBSWebExtensionMatchPattern)initWithWebKitMatchPattern:(id)a3
{
  id v5;
  WBSWebExtensionMatchPattern *v6;
  WBSWebExtensionMatchPattern *v7;
  const void *v8;
  void *v9;
  WBSWebExtensionMatchPattern *v10;

  v5 = a3;
  v6 = -[WBSWebExtensionMatchPattern init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webKitMatchPattern, a3);
    v8 = (const void *)webKitPatternAssociationKey;
    objc_msgSend(MEMORY[0x1E0D8A230], "wrapperWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, v8, v9, (void *)1);

    v10 = v7;
  }

  return v7;
}

- (id)_webKitMatchPattern
{
  return self->_webKitMatchPattern;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_webKitMatchPattern, CFSTR("pattern"));
}

- (WBSWebExtensionMatchPattern)initWithCoder:(id)a3
{
  id v4;
  WBSWebExtensionMatchPattern *v5;
  uint64_t v6;
  _WKWebExtensionMatchPattern *webKitMatchPattern;
  WBSWebExtensionMatchPattern *v8;

  v4 = a3;
  v5 = -[WBSWebExtensionMatchPattern init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pattern"));
    v6 = objc_claimAutoreleasedReturnValue();
    webKitMatchPattern = v5->_webKitMatchPattern;
    v5->_webKitMatchPattern = (_WKWebExtensionMatchPattern *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WBSWebExtensionMatchPattern description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WBSWebExtensionMatchPattern *v4;
  WBSWebExtensionMatchPattern *v5;
  WBSWebExtensionMatchPattern *v6;
  WBSWebExtensionMatchPattern *v7;
  WBSWebExtensionMatchPattern *v8;
  char v9;

  v4 = (WBSWebExtensionMatchPattern *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
      v9 = -[_WKWebExtensionMatchPattern isEqual:](self->_webKitMatchPattern, "isEqual:", v8->_webKitMatchPattern);
    else
      v9 = 0;

  }
  return v9;
}

- (NSArray)expandedMatchPatternStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[WBSWebExtensionMatchPattern matchesAllURLs](self, "matchesAllURLs"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    +[WBSWebExtensionData supportedWebExtensionPatternSchemes](WBSWebExtensionData, "supportedWebExtensionPatternSchemes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("*")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://*/*"), v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v9);

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v5);
    }
  }
  else
  {
    -[WBSWebExtensionMatchPattern description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v3;
}

- (NSString)scheme
{
  return (NSString *)-[_WKWebExtensionMatchPattern scheme](self->_webKitMatchPattern, "scheme");
}

- (NSString)host
{
  return (NSString *)-[_WKWebExtensionMatchPattern host](self->_webKitMatchPattern, "host");
}

- (NSString)path
{
  return (NSString *)-[_WKWebExtensionMatchPattern path](self->_webKitMatchPattern, "path");
}

- (BOOL)matchesAllURLs
{
  return -[_WKWebExtensionMatchPattern matchesAllURLs](self->_webKitMatchPattern, "matchesAllURLs");
}

- (BOOL)matchesAllHosts
{
  return -[_WKWebExtensionMatchPattern matchesAllHosts](self->_webKitMatchPattern, "matchesAllHosts");
}

- (id)description
{
  return (id)-[_WKWebExtensionMatchPattern description](self->_webKitMatchPattern, "description");
}

- (id)_descriptionWithScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[WBSWebExtensionMatchPattern host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionMatchPattern path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@://%@%@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)matchesURL:(id)a3
{
  return -[WBSWebExtensionMatchPattern matchesURL:options:](self, "matchesURL:options:", a3, 0);
}

- (BOOL)matchesURL:(id)a3 options:(unint64_t)a4
{
  return -[_WKWebExtensionMatchPattern matchesURL:options:](self->_webKitMatchPattern, "matchesURL:options:", a3, a4 & 7);
}

- (BOOL)matchesPattern:(id)a3
{
  return -[WBSWebExtensionMatchPattern matchesPattern:options:](self, "matchesPattern:options:", a3, 0);
}

- (BOOL)matchesPattern:(id)a3 options:(unint64_t)a4
{
  char v4;
  _WKWebExtensionMatchPattern *webKitMatchPattern;
  void *v6;
  char v7;

  v4 = a4;
  webKitMatchPattern = self->_webKitMatchPattern;
  objc_msgSend(a3, "_webKitMatchPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_WKWebExtensionMatchPattern matchesPattern:options:](webKitMatchPattern, "matchesPattern:options:", v6, v4 & 7);

  return v7;
}

- (_WKWebExtensionMatchPattern)webKitMatchPattern
{
  return self->_webKitMatchPattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webKitMatchPattern, 0);
}

@end
