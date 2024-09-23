@implementation PGGraphLanguageNode

- (PGGraphLanguageNode)initWithLocaleIdentifier:(id)a3
{
  id v5;
  PGGraphLanguageNode *v6;
  PGGraphLanguageNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphLanguageNode;
  v6 = -[PGGraphNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);

  return v7;
}

- (PGGraphLanguageNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  PGGraphLanguageNode *v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("localeIdentifier"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphLanguageNode initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", v6);

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "isEqual:", self->_localeIdentifier);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  NSString *localeIdentifier;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  localeIdentifier = self->_localeIdentifier;
  v4 = CFSTR("localeIdentifier");
  v5[0] = localeIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyForKey:(id)a3
{
  id v4;
  NSString *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("localeIdentifier")))
  {
    v5 = self->_localeIdentifier;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphLanguageNode.", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphLanguageNode (%@)"), self->_localeIdentifier);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Language");
  return CFSTR("Language");
}

- (unsigned)domain
{
  return 205;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Language"), 205);
}

+ (id)filterWithLocaleIdentifiers:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = CFSTR("localeIdentifier");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLabel:domain:properties:", CFSTR("Language"), 205, v6);
  return v7;
}

@end
