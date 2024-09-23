@implementation PGGraphSeasonNode

- (unint64_t)numberOfMomentNodes
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PGGraphSeasonNode_numberOfMomentNodes__block_invoke;
  v4[3] = &unk_1E842FD90;
  v4[4] = &v5;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SEASON"), 400, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (PGGraphSeasonNode)initWithName:(id)a3
{
  id v5;
  PGGraphSeasonNode *v6;
  PGGraphSeasonNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSeasonNode;
  v6 = -[PGGraphNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (PGGraphSeasonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  PGGraphSeasonNode *v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("name"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphSeasonNode initWithName:](self, "initWithName:", v6);

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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "isEqual:", self->_name);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  NSString *name;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  v4 = CFSTR("name");
  v5[0] = name;
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
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = self->_name;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphSeasonNode.", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphSeasonNode (%@)"), self->_name);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Season");
  return CFSTR("Season");
}

- (unsigned)domain
{
  return 400;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D42A50]);
  -[PGGraphSeasonNode propertyDictionary](self, "propertyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLabel:domain:properties:", CFSTR("Season"), 400, v4);

  return (MANodeFilter *)v5;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_localizationKeyForSeasonNode:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)localizedSynonyms
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_localizationKeyForSeasonNode:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (PGGraphSeasonNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphSeasonNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 14;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSeasonNode name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __40__PGGraphSeasonNode_numberOfMomentNodes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "countOfEdgesWithLabel:domain:", CFSTR("DATE"), 400);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Season"), 400);
}

+ (id)_localizationKeyForSeasonNode:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4B080]) & 1) != 0)
  {
    v5 = CFSTR("PGSeasonMemoryTitleFormatSpring");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4B088]) & 1) != 0)
  {
    v5 = CFSTR("PGSeasonMemoryTitleFormatSummer");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4B078]) & 1) != 0)
  {
    v5 = CFSTR("PGSeasonMemoryTitleFormatAutumn");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4B090]) & 1) != 0)
  {
    v5 = CFSTR("PGSeasonMemoryTitleFormatWinter");
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Trying to localize season node with unsupported label: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }

  return (id)v5;
}

+ (id)dateOfSeason
{
  void *v2;
  void *v3;

  +[PGGraphSeasonEdge filter](PGGraphSeasonEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)filterForSeasonName:(id)a3
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
  v9 = CFSTR("name");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLabel:domain:properties:", CFSTR("Season"), 400, v6);
  return v7;
}

@end
