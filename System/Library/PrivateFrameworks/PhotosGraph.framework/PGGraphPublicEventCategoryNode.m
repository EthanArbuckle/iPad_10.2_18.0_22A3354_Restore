@implementation PGGraphPublicEventCategoryNode

- (PGGraphPublicEventCategoryNode)initWithLabel:(id)a3 localizedName:(id)a4
{
  id v6;
  id v7;
  PGGraphPublicEventCategoryNode *v8;
  uint64_t v9;
  NSString *label;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPublicEventCategoryNode;
  v8 = -[PGGraphNode init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

    objc_storeStrong((id *)&v8->_localizedName, a4);
  }

  return v8;
}

- (PGGraphPublicEventCategoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  void *v8;
  PGGraphPublicEventCategoryNode *v9;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("lcln"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGGraphPublicEventCategoryNode initWithLabel:localizedName:](self, "initWithLabel:localizedName:", v7, v8);

  return v9;
}

- (PGGraphPublicEventCategoryNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPublicEventCategoryNodeCollection alloc], "initWithNode:", self);
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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lcln"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "isEqual:", self->_localizedName);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  NSString *localizedName;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  localizedName = self->_localizedName;
  if (localizedName)
  {
    v5 = CFSTR("lcln");
    v6[0] = localizedName;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPublicEventCategoryNode;
  -[PGGraphOptimizedNode description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, self->_localizedName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unsigned)domain
{
  return 901;
}

- (NSArray)localizedSynonyms
{
  return (NSArray *)+[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", self->_label);
}

- (id)associatedNodesForRemoval
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PGGraphPublicEventCategoryNode_associatedNodesForRemoval__block_invoke;
  v6[3] = &unk_1E84366E8;
  v4 = v3;
  v7 = v4;
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("LOCALIZED_SUBCATEGORY"), 902, v6);

  return v4;
}

- (id)label
{
  return self->_label;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

void __59__PGGraphPublicEventCategoryNode_associatedNodesForRemoval__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "countOfEdgesWithLabel:domain:", CFSTR("LOCALIZED_SUBCATEGORY"), 902) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 901);
}

+ (id)filterWithCategory:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLabel:domain:", v4, 901);

  return v5;
}

+ (id)filterWithCategories:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithLabels:domain:properties:", v4, 901, MEMORY[0x1E0C9AA70]);

  return v6;
}

+ (MARelation)publicEventOfCategory
{
  void *v2;
  void *v3;

  +[PGGraphPublicEventCategoryEdge filter](PGGraphPublicEventCategoryEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
