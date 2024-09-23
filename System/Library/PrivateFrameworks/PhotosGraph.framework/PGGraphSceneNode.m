@implementation PGGraphSceneNode

- (PGGraphSceneNode)initWithSceneTaxonomyNode:(id)a3 level:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  PGGraphSceneNode *v16;

  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "capitalizedString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v6, "localizedSynonyms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = -[PGGraphSceneNode initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:](self, "initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:", v7, objc_msgSend(v6, "identifier"), a4, objc_msgSend(v6, "isIndexed"), v11, v15);
  return v16;
}

- (PGGraphSceneNode)initWithSceneName:(id)a3 sceneIdentifier:(unint64_t)a4 level:(unint64_t)a5 isIndexed:(BOOL)a6 localizedName:(id)a7 localizedSynonyms:(id)a8
{
  char v11;
  id v14;
  id v15;
  id v16;
  PGGraphSceneNode *v17;
  uint64_t v18;
  NSString *label;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *localizedSynonyms;
  objc_super v26;
  _QWORD v27[2];

  v11 = a5;
  v27[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PGGraphSceneNode;
  v17 = -[PGGraphNode init](&v26, sel_init);
  if (v17)
  {
    objc_msgSend(v14, "capitalizedString");
    v18 = objc_claimAutoreleasedReturnValue();
    label = v17->_label;
    v17->_label = (NSString *)v18;

    v17->_sceneIdentifier = a4;
    *((_BYTE *)v17 + 32) = v11;
    v17->_isIndexed = a6;
    objc_storeStrong((id *)&v17->_localizedName, a7);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingDescriptors:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
    v23 = objc_claimAutoreleasedReturnValue();
    localizedSynonyms = v17->_localizedSynonyms;
    v17->_localizedSynonyms = (NSString *)v23;

  }
  return v17;
}

- (PGGraphSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  PGGraphSceneNode *v24;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("level"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isIndexed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localizedName"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v8;
  v18 = v17;

  v19 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localizedSynonyms"));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = v20;
  else
    v21 = &stru_1E8436F28;
  -[__CFString componentsSeparatedByString:](v21, "componentsSeparatedByString:", CFSTR(","));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithArray:", v22);

  v24 = -[PGGraphSceneNode initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:](self, "initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:", v8, v10, v12, v14, v18, v23);
  return v24;
}

- (PGGraphSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphSceneNode *v14;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lvl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lvl"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("level"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("lvl"));
    v10 = v12;
  }
  v14 = -[PGGraphSceneNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v9, v7, v10);

  return v14;
}

- (id)initForTestingWithSceneName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PGGraphSceneNode *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphSceneNode initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:](self, "initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:", v5, 1, 1, 1, v5, v6);

  return v7;
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
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "unsignedLongLongValue") != self->_sceneIdentifier)
      goto LABEL_15;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("level"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "unsignedIntegerValue") != *((unsigned __int8 *)self + 32))
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isIndexed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (self->_isIndexed != objc_msgSend(v9, "BOOLValue"))
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localizedName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      if (!objc_msgSend(v10, "isEqual:", self->_localizedName))
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localizedSynonyms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11 && !objc_msgSend(v11, "isEqual:", self->_localizedSynonyms))
LABEL_15:
      v12 = 0;
    else
      v12 = 1;

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSString *localizedName;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("sceneIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sceneIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("level");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned __int8 *)self + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("isIndexed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIndexed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  localizedName = self->_localizedName;
  v10[2] = v5;
  v10[3] = localizedName;
  v9[3] = CFSTR("localizedName");
  v9[4] = CFSTR("localizedSynonyms");
  v10[4] = self->_localizedSynonyms;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphSceneNode (%@, %d)"), self->_label, *((unsigned __int8 *)self + 32));
}

- (NSString)sceneName
{
  return -[NSString lowercaseString](self->_label, "lowercaseString");
}

- (unsigned)domain
{
  return objc_msgSend((id)objc_opt_class(), "domain");
}

- (PGGraphSceneNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphSceneNodeCollection alloc], "initWithNode:", self);
}

- (BOOL)isSuitableForSuggestions
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  _QWORD v8[6];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  objc_msgSend((id)objc_opt_class(), "suggestableSceneNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSceneNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (!v5)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PGGraphSceneNode_isSuitableForSuggestions__block_invoke;
  v8[3] = &unk_1E842B200;
  v8[4] = v9;
  v8[5] = &v10;
  -[PGGraphSceneNode enumerateMomentEdgesAndNodesUsingBlock:](self, "enumerateMomentEdgesAndNodesUsingBlock:", v8);
  v6 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (unint64_t)numberOfAssets
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PGGraphSceneNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesToNodes:](PGGraphSceneEdgeCollection, "edgesToNodes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphSceneNode_numberOfAssets__block_invoke;
  v6[3] = &unk_1E842B228;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateEdgesUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)numberOfHighConfidenceAssets
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PGGraphSceneNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesToNodes:](PGGraphSceneEdgeCollection, "edgesToNodes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphSceneNode_numberOfHighConfidenceAssets__block_invoke;
  v6[3] = &unk_1E842B228;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateEdgesUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)numberOfSearchConfidenceAssets
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PGGraphSceneNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesToNodes:](PGGraphSceneEdgeCollection, "edgesToNodes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphSceneNode_numberOfSearchConfidenceAssets__block_invoke;
  v6[3] = &unk_1E842B228;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateEdgesUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)numberOfDominantSceneAssets
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PGGraphSceneNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesToNodes:](PGGraphSceneEdgeCollection, "edgesToNodes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphSceneNode_numberOfDominantSceneAssets__block_invoke;
  v6[3] = &unk_1E842B228;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateEdgesUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSArray)localizedSynonyms
{
  return -[NSString componentsSeparatedByString:](self->_localizedSynonyms, "componentsSeparatedByString:", CFSTR(","));
}

- (id)momentNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphSceneNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SCENE"), 600, a3);
}

- (unint64_t)featureType
{
  return 18;
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
  -[PGGraphSceneNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)label
{
  return self->_label;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (unint64_t)level
{
  return *((unsigned __int8 *)self + 32);
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_localizedSynonyms, 0);
}

uint64_t __47__PGGraphSceneNode_numberOfDominantSceneAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfDominantSceneAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __50__PGGraphSceneNode_numberOfSearchConfidenceAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfSearchConfidenceAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __48__PGGraphSceneNode_numberOfHighConfidenceAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfHighConfidenceAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __34__PGGraphSceneNode_numberOfAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __44__PGGraphSceneNode_isSuitableForSuggestions__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isSearchableForEvent");
  if ((_DWORD)result)
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, objc_msgSend(a1, "domain"));
}

+ (id)filterForSceneName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "capitalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", v4, objc_msgSend(a1, "domain"));

  return v5;
}

+ (id)filterForSceneNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "capitalizedString", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v12 = objc_alloc(MEMORY[0x1E0D42A50]);
  v13 = objc_msgSend(a1, "domain");
  v14 = (void *)objc_msgSend(v12, "initWithLabels:domain:properties:", v5, v13, MEMORY[0x1E0C9AA70]);

  return v14;
}

+ (id)filterWithSceneIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("sceneIdentifier");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unsigned)domain
{
  return 600;
}

+ (id)suggestableSceneNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PGGraphSceneNode_suggestableSceneNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (suggestableSceneNames_onceToken != -1)
    dispatch_once(&suggestableSceneNames_onceToken, block);
  return (id)suggestableSceneNames_suggestableSceneNames;
}

+ (MARelation)momentOfScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphSceneEdge filter](PGGraphSceneEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)momentOfReliableScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphSceneEdge isReliableFilter](PGGraphSceneEdge, "isReliableFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)momentOfSceneWithHighConfidenceAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphSceneEdge highConfidenceAssetsFilter](PGGraphSceneEdge, "highConfidenceAssetsFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (id)momentOfSceneWithSearchConfidenceAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphSceneEdge searchConfidenceAssetsFilter](PGGraphSceneEdge, "searchConfidenceAssetsFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)momentOfSceneWithDominantSceneAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphSceneEdge dominantSceneAssetsFilter](PGGraphSceneEdge, "dominantSceneAssetsFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __41__PGGraphSceneNode_suggestableSceneNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("SuggestableSceneNames"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E60];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:error:", v1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  objc_msgSend(v2, "setWithArray:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)suggestableSceneNames_suggestableSceneNames;
  suggestableSceneNames_suggestableSceneNames = v5;

  if (v4)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("SuggestableSceneNames");
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Couldn't load %@.plist", buf, 0xCu);
    }

  }
}

@end
