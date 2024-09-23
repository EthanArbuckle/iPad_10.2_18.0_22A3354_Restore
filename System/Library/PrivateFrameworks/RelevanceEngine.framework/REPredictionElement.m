@implementation REPredictionElement

+ (id)predictionElementFromElement:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  char isKindOfClass;
  __CFString *v16;
  __CFString *v17;
  void *v18;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  objc_msgSend(v3, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = objc_msgSend(v3, "privacyBehavior");
  objc_msgSend(v3, "relevanceProviders");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[3];
  v4[3] = v7;

  objc_msgSend(v3, "bundleIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[4];
  v4[4] = v9;

  objc_msgSend(v3, "applicationBundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v4[5];
  v4[5] = v11;

  objc_msgSend(v3, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", CFSTR("REContentInteractionKey"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v16 = CFSTR("REElementInteractionDefault");
  if ((isKindOfClass & 1) != 0)
    v16 = v14;
  v17 = v16;
  v18 = (void *)v4[6];
  v4[6] = v17;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REPredictionElement)initWithCoder:(id)a3
{
  id v4;
  REPredictionElement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *applicationBundleIdentifier;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  RECustomRelevanceProvider *v24;
  uint64_t v25;
  NSArray *relevanceProviders;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)REPredictionElement;
  v5 = -[REPredictionElement init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v5->_interaction, CFSTR("REElementInteractionDefault"));
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("relevanceProviders"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = -[RECustomRelevanceProvider initWithDictionary:]([RECustomRelevanceProvider alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23));
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);
    }

    v25 = objc_msgSend(v18, "copy");
    relevanceProviders = v5->_relevanceProviders;
    v5->_relevanceProviders = (NSArray *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_relevanceProviders;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "dictionaryEncoding", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("relevanceProviders"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)privacyBehavior
{
  return self->_privacyBehavior;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)interaction
{
  return self->_interaction;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)predictionElementWithIdentifier:(id)a3 relevanceProviders:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new();
  objc_storeStrong((id *)(v11 + 8), a3);
  objc_storeStrong((id *)(v11 + 32), a5);
  objc_storeStrong((id *)(v11 + 48), CFSTR("REElementInteractionDefault"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v12, "addObject:", v18, (_QWORD)v22);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  v19 = objc_msgSend(v12, "copy");
  v20 = *(void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v19;

  return (id)v11;
}

@end
