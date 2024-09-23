@implementation PGGraphPetNode

- (PGGraphPetNode)initWithLocalIdentifier:(id)a3 petSpecies:(unint64_t)a4 name:(id)a5 isFavorite:(BOOL)a6
{
  id v11;
  id v12;
  PGGraphPetNode *v13;
  PGGraphPetNode *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphPetNode;
  v13 = -[PGGraphNode init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_localIdentifier, a3);
    v14->_petSpecies = a4;
    objc_storeStrong((id *)&v14->_name, a5);
    v14->_isFavorite = a6;
  }

  return v14;
}

- (PGGraphPetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PGGraphPetNode *v13;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("anml"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("favorite"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "BOOLValue");
  v13 = -[PGGraphPetNode initWithLocalIdentifier:petSpecies:name:isFavorite:](self, "initWithLocalIdentifier:petSpecies:name:isFavorite:", v7, v9, v10, v12);

  return v13;
}

- (PGGraphPetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphPetNode *v14;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("localIdentifier"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("id"));
    v10 = v12;
  }
  v14 = -[PGGraphPetNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v9, v7, v10);

  return v14;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_name))
      goto LABEL_13;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_localIdentifier))
        goto LABEL_13;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("anml"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "unsignedIntegerValue") != self->_petSpecies)
        goto LABEL_13;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("favorite"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10 && self->_isFavorite != objc_msgSend(v10, "BOOLValue"))
LABEL_13:
      v11 = 0;
    else
      v11 = 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)propertyDictionary
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = self->_localIdentifier;
  v8[0] = CFSTR("localIdentifier");
  v8[1] = CFSTR("anml");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_petSpecies);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v9[1] = v3;
  v9[2] = name;
  v8[2] = CFSTR("name");
  v8[3] = CFSTR("favorite");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFavorite);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  __CFString *v3;
  void *v4;
  unint64_t petSpecies;
  __CFString *v6;
  void *v7;
  void *v8;

  if (self->_isFavorite)
    v3 = CFSTR("True");
  else
    v3 = CFSTR("False");
  v4 = (void *)MEMORY[0x1E0CB37A0];
  petSpecies = self->_petSpecies;
  v6 = v3;
  +[PGGraphPetNode stringFromPetSpecies:](PGGraphPetNode, "stringFromPetSpecies:", petSpecies);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PGGraphPetNode %@ (%@) isFavorite: %@"), v7, self->_localIdentifier, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v8, "appendFormat:", CFSTR(" (%@)"), self->_name);
  return (NSString *)v8;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Pet");
  return CFSTR("Pet");
}

- (unsigned)domain
{
  return 304;
}

- (int64_t)memberType
{
  return 1;
}

- (void)enumerateOwnerNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_OWNER_OF"), 304, a3);
}

- (id)ownerNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PGGraphPetNode_ownerNodes__block_invoke;
  v6[3] = &unk_1E8434020;
  v4 = v3;
  v7 = v4;
  -[PGGraphPetNode enumerateOwnerNodesUsingBlock:](self, "enumerateOwnerNodesUsingBlock:", v6);

  return v4;
}

- (PGGraphPetNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPetNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)petSpecies
{
  return self->_petSpecies;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (NSString)contactIdentifier
{
  return 0;
}

- (unint64_t)featureType
{
  return 35;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, self->_localIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)stringDescription
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  PGGraphPetNode *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PGGraphPetNode name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    return v3;
  -[PGGraphPetNode localIdentifier](self, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    if ((unint64_t)objc_msgSend(v5, "length") < 9)
    {
      return v5;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
  }
  else
  {

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "No identifiers for petNode %@", (uint8_t *)&v9, 0xCu);
    }

    return CFSTR("unknown");
  }
}

- (unint64_t)numberOfMomentNodes
{
  return -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("PET_IS_PRESENT"), 304);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

uint64_t __28__PGGraphPetNode_ownerNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Pet"), 304);
}

+ (MANodeFilter)filterNameNotEmpty
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphPetNode filter](PGGraphPetNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("name");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &stru_1E8436F28);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v5;
}

+ (MARelation)momentOfPet
{
  void *v2;
  void *v3;

  +[PGGraphPetPresentEdge filter](PGGraphPetPresentEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)ownerOfPet
{
  void *v2;
  void *v3;

  +[PGGraphIsOwnerOfPetEdge filter](PGGraphIsOwnerOfPetEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)stringFromPetSpecies:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Pet");
  if (a3 == 1)
    v3 = CFSTR("Cat");
  if (a3 == 2)
    return CFSTR("Dog");
  else
    return (id)v3;
}

+ (signed)detectionTypeFromPetSpecies:(unint64_t)a3
{
  signed __int16 v3;

  if (a3 == 1)
    v3 = 4;
  else
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

@end
