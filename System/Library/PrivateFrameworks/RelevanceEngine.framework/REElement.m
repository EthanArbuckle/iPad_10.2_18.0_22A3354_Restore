@implementation REElement

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 idealizedContent:(id)a5 action:(id)a6 relevanceProviders:(id)a7
{
  return -[REElement initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:](self, "initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:", a3, a4, a5, a6, a7, 1);
}

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 action:(id)a5 relevanceProviders:(id)a6
{
  return -[REElement initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:](self, "initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:", a3, a4, 0, a5, a6, 1);
}

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 action:(id)a5 relevanceProviders:(id)a6 privacyBehavior:(unint64_t)a7
{
  return -[REElement initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:](self, "initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:", a3, a4, 0, a5, a6, a7);
}

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 idealizedContent:(id)a5 action:(id)a6 relevanceProviders:(id)a7 privacyBehavior:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  REElement *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  REContent *content;
  uint64_t v24;
  REContent *idealizedContent;
  id v26;
  id v27;
  uint64_t v28;
  NSArray *relevanceProviders;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)REElement;
  v19 = -[REElement init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    content = v19->_content;
    v19->_content = (REContent *)v22;

    v24 = objc_msgSend(v16, "copy");
    idealizedContent = v19->_idealizedContent;
    v19->_idealizedContent = (REContent *)v24;

    objc_storeStrong((id *)&v19->_action, a6);
    v26 = objc_alloc(MEMORY[0x24BDBCE30]);
    if (v18)
      v27 = v18;
    else
      v27 = (id)MEMORY[0x24BDBD1A8];
    v28 = objc_msgSend(v26, "initWithArray:copyItems:", v27, 0);
    relevanceProviders = v19->_relevanceProviders;
    v19->_relevanceProviders = (NSArray *)v28;

    v19->_privacyBehavior = a8;
  }

  return v19;
}

+ (id)_supportedDictionaryEncodingKeys
{
  if (_supportedDictionaryEncodingKeys_onceToken != -1)
    dispatch_once(&_supportedDictionaryEncodingKeys_onceToken, &__block_literal_global_64);
  return (id)_supportedDictionaryEncodingKeys_EncodingKeys;
}

void __45__REElement__supportedDictionaryEncodingKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CFC1D30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_supportedDictionaryEncodingKeys_EncodingKeys;
  _supportedDictionaryEncodingKeys_EncodingKeys = v0;

}

- (REElement)initWithDictionary:(id)a3 relevanceProviderGenerator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  REContent *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  REElement *v35;
  id *p_isa;
  REElement *v37;
  void *v39;
  id obj;
  _QWORD v41[4];
  id v42;
  id v43;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interaction"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("REElementInteractionDefault");
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("app_bundle_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("namespaced_identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    obj = v8;
    v16 = objc_alloc_init(REContent);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithString:", v19);
      -[REContent setHeaderText:](v16, "setHeaderText:", v20);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description1"), v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description1"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithString:", v23);
      -[REContent setDescription1Text:](v16, "setDescription1Text:", v24);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description2"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description2"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithString:", v27);
      -[REContent setDescription2Text:](v16, "setDescription2Text:", v28);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description3"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description3"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithString:", v31);
      -[REContent setDescription3Text:](v16, "setDescription3Text:", v32);

    }
    -[REContent setObject:forKey:](v16, "setObject:forKey:", v13, CFSTR("REContentInteractionKey"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke;
    v41[3] = &unk_24CF8FF38;
    v7 = v39;
    v42 = v39;
    v34 = v33;
    v43 = v34;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v41);
    v35 = -[REElement initWithIdentifier:content:action:relevanceProviders:](self, "initWithIdentifier:content:action:relevanceProviders:", v9, v16, 0, v34);
    p_isa = (id *)&v35->super.isa;
    v8 = obj;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_bundleIdentifier, obj);
      objc_storeStrong(p_isa + 9, v14);
      objc_storeStrong(p_isa + 8, v15);
    }
    self = p_isa;

    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

void __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_supportedDictionaryEncodingKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "createRelevaneProviderWithType:withOptions:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    }
    else
    {
      RELogForDomain(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke_cold_1((uint64_t)v5, v10);

    }
  }

}

- (id)dictionaryEncodingWithRelevanceProviderGenerator:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __62__REElement_dictionaryEncodingWithRelevanceProviderGenerator___block_invoke;
  v32[3] = &unk_24CF8FF60;
  v32[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v32);
  v37[0] = CFSTR("REContentHeaderTextKey");
  v37[1] = CFSTR("REContentCLKHeaderTextKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

  v36[0] = CFSTR("REContentDescription1TextKey");
  v36[1] = CFSTR("REContentCLKDescription1TextKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("description1"));

  v35[0] = CFSTR("REContentDescription2TextKey");
  v35[1] = CFSTR("REContentCLKDescription2TextKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("description2"));

  v34[0] = CFSTR("REContentDescription3TextKey");
  v34[1] = CFSTR("REContentCLKDescription3TextKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("description3"));

  -[REElement bundleIdentifier](self, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("bundle_id"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("id"));
  -[REElement content](self, "content");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("REContentInteractionKey"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("REElementInteractionDefault");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("interaction"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_applicationBundleIdentifier, CFSTR("app_bundle_id"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_namespacedIdentifier, CFSTR("namespaced_identifier"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = self->_relevanceProviders;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v4, "encodeRelevaneProvider:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v5, "addEntriesFromDictionary:", v25);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

  v26 = (void *)objc_msgSend(v5, "copy");
  return v26;
}

id __62__REElement_dictionaryEncodingWithRelevanceProviderGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "content", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "contentEncodedString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {

            goto LABEL_13;
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)finalizeContent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[REContent headerTextProvider](self->_content, "headerTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finalize");

  -[REContent description1TextProvider](self->_content, "description1TextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalize");

  -[REContent description2TextProvider](self->_content, "description2TextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalize");

  -[REContent description3TextProvider](self->_content, "description3TextProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finalize");

}

- (id)copyElementWithUpdatedRelevanceProviders:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[REElement shallowCopy](self, "shallowCopy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (REElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  REElement *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSString *applicationBundleIdentifier;
  uint64_t v15;
  NSString *namespacedIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_idealizedContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_relevanceProviders"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REElement initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:](self, "initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:", v5, v6, v7, v8, v9, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_privacyBehavior")));
  if (v10)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_bundleIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_applicationBundleIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v10->_applicationBundleIdentifier;
    v10->_applicationBundleIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_namespacedIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    namespacedIdentifier = v10->_namespacedIdentifier;
    v10->_namespacedIdentifier = (NSString *)v15;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  -[REElement bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_bundleIdentifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_privacyBehavior, CFSTR("_privacyBehavior"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_content, CFSTR("_content"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_idealizedContent, CFSTR("_idealizedContent"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_action, CFSTR("_action"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("_applicationBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_namespacedIdentifier, CFSTR("_namespacedIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_identifier);
  *(_QWORD *)(v4 + 16) = self->_privacyBehavior;
  objc_storeStrong((id *)(v4 + 24), self->_content);
  objc_storeStrong((id *)(v4 + 32), self->_idealizedContent);
  objc_storeStrong((id *)(v4 + 48), self->_action);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_relevanceProviders, 1);
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v5;

  objc_storeStrong((id *)(v4 + 56), self->_bundleIdentifier);
  objc_storeStrong((id *)(v4 + 72), self->_applicationBundleIdentifier);
  objc_storeStrong((id *)(v4 + 64), self->_namespacedIdentifier);
  return (id)v4;
}

- (id)shallowCopy
{
  id *v3;

  v3 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v3 + 1, self->_identifier);
  v3[2] = (id)self->_privacyBehavior;
  objc_storeStrong(v3 + 3, self->_content);
  objc_storeStrong(v3 + 4, self->_idealizedContent);
  objc_storeStrong(v3 + 6, self->_action);
  objc_storeStrong(v3 + 5, self->_relevanceProviders);
  objc_storeStrong(v3 + 7, self->_bundleIdentifier);
  objc_storeStrong(v3 + 9, self->_applicationBundleIdentifier);
  objc_storeStrong(v3 + 8, self->_namespacedIdentifier);
  return v3;
}

- (BOOL)isNoContentElement
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_relevanceProviders;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_updateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_updateNamespacedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_namespacedIdentifier, a3);
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = self->_privacyBehavior ^ -[NSString hash](self->_identifier, "hash");
  v4 = -[REContent hash](self->_content, "hash");
  v5 = v3 ^ v4 ^ -[REContent hash](self->_idealizedContent, "hash");
  v6 = -[REElementAction hash](self->_action, "hash");
  v7 = v6 ^ -[NSArray hash](self->_relevanceProviders, "hash");
  return v5 ^ v7 ^ -[NSString hash](self->_applicationBundleIdentifier, "hash");
}

- (BOOL)_relevanceProvidersEqualToElement:(id)a3
{
  void *v4;
  NSUInteger v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "relevanceProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray count](self->_relevanceProviders, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_relevanceProviders;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13))
          {
            v11 = 0;
            goto LABEL_13;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  REElement *v4;
  REElement *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  char v11;
  REContent *content;
  REContent *v13;
  REContent *v14;
  REContent *v15;
  _BOOL4 v16;
  REContent *idealizedContent;
  REContent *v18;
  REContent *v19;
  REContent *v20;
  _BOOL4 v21;
  REElementAction *action;
  REElementAction *v23;
  REElementAction *v24;
  REElementAction *v25;
  int v26;
  NSString *applicationBundleIdentifier;
  NSString *v28;
  NSString *v29;
  NSString *v30;

  v4 = (REElement *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_25;
      }
      if (self->_privacyBehavior == v5->_privacyBehavior)
      {
        content = self->_content;
        v13 = v5->_content;
        if (content == v13)
        {

        }
        else
        {
          v14 = v13;
          v15 = content;
          v16 = -[REContent isEqual:](v15, "isEqual:", v14);

          if (!v16)
            goto LABEL_25;
        }
        idealizedContent = self->_idealizedContent;
        v18 = v5->_idealizedContent;
        if (idealizedContent == v18)
        {

        }
        else
        {
          v19 = v18;
          v20 = idealizedContent;
          v21 = -[REContent isEqual:](v20, "isEqual:", v19);

          if (!v21)
            goto LABEL_25;
        }
        action = self->_action;
        v23 = v5->_action;
        if (action == v23)
        {

        }
        else
        {
          v24 = v23;
          v25 = action;
          v26 = -[REElementAction isEqual:](v25, "isEqual:", v24);

          if (!v26)
            goto LABEL_25;
        }
        if (-[REElement _relevanceProvidersEqualToElement:](self, "_relevanceProvidersEqualToElement:", v5))
        {
          applicationBundleIdentifier = self->_applicationBundleIdentifier;
          v28 = v5->_applicationBundleIdentifier;
          v29 = applicationBundleIdentifier;
          v30 = v29;
          if (v29 == v28)
            v11 = 1;
          else
            v11 = -[NSString isEqual:](v29, "isEqual:", v28);

          goto LABEL_26;
        }
      }
LABEL_25:
      v11 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v11 = 0;
  }
LABEL_27:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)privacyBehavior
{
  return self->_privacyBehavior;
}

- (REContent)content
{
  return self->_content;
}

- (REContent)idealizedContent
{
  return self->_idealizedContent;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (REElementAction)action
{
  return self->_action;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)namespacedIdentifier
{
  return self->_namespacedIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_namespacedIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
  objc_storeStrong((id *)&self->_idealizedContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Unable to create relevance provider with type: %@", (uint8_t *)&v2, 0xCu);
}

@end
