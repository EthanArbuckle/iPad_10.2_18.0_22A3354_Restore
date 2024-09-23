@implementation PGGraphPublicEventNode

- (PPNamedEntity)pg_namedEntity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[PGGraphPublicEventNode name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    -[PGGraphPublicEventNode categories](self, "categories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (namedEntityCategoryFromPublicEventCategory_onceToken != -1)
      dispatch_once(&namedEntityCategoryFromPublicEventCategory_onceToken, &__block_literal_global_97);
    objc_msgSend((id)namedEntityCategoryFromPublicEventCategory_namedEntityCategoryByPublicEventCategory, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "unsignedIntegerValue");
    else
      v10 = 2;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v4, v10, v13);
  }
  else
  {
    v11 = 0;
  }

  return (PPNamedEntity *)v11;
}

- (PGGraphPublicEventNode)initWithMUID:(unint64_t)a3 name:(id)a4 expectedAttendance:(int64_t)a5
{
  id v9;
  PGGraphPublicEventNode *v10;
  PGGraphPublicEventNode *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphPublicEventNode;
  v10 = -[PGGraphNode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_muid = a3;
    objc_storeStrong((id *)&v10->_name, a4);
    v11->_expectedAttendance = a5;
  }

  return v11;
}

- (PGGraphPublicEventNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PGGraphPublicEventNode *v12;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attdc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "integerValue");
  v12 = -[PGGraphPublicEventNode initWithMUID:name:expectedAttendance:](self, "initWithMUID:name:expectedAttendance:", v8, v9, v11);

  return v12;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "unsignedIntegerValue") != self->_muid)
      goto LABEL_11;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_name))
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attdc"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9 && objc_msgSend(v9, "integerValue") != self->_expectedAttendance)
LABEL_11:
      v10 = 0;
    else
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)propertyDictionary
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v9[0] = v3;
  v9[1] = name;
  v8[1] = CFSTR("name");
  v8[2] = CFSTR("attdc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_expectedAttendance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPublicEventNode;
  -[PGGraphOptimizedNode description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %llu, %d)"), v4, self->_name, self->_muid, self->_expectedAttendance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PublicEvent");
  return CFSTR("PublicEvent");
}

- (unsigned)domain
{
  return 900;
}

- (PGGraphPublicEventNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPublicEventNodeCollection alloc], "initWithNode:", self);
}

- (NSSet)categories
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphPublicEventNode_categories__block_invoke;
  v6[3] = &unk_1E8436458;
  v4 = v3;
  v7 = v4;
  -[PGGraphPublicEventNode enumeratePublicEventCategoryNodesUsingBlock:](self, "enumeratePublicEventCategoryNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (NSSet)localizedCategories
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  NSSet *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__PGGraphPublicEventNode_localizedCategories__block_invoke;
  v12[3] = &unk_1E8436458;
  v5 = v3;
  v13 = v5;
  -[PGGraphPublicEventNode enumeratePublicEventCategoryNodesUsingBlock:](self, "enumeratePublicEventCategoryNodesUsingBlock:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __45__PGGraphPublicEventNode_localizedCategories__block_invoke_2;
  v10[3] = &unk_1E8431528;
  v6 = v5;
  v11 = v6;
  -[PGGraphPublicEventNode enumerateLocalizedSubcategoryNodesUsingBlock:](self, "enumerateLocalizedSubcategoryNodesUsingBlock:", v10);
  v7 = v11;
  v8 = (NSSet *)v6;

  return v8;
}

- (NSSet)performers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPublicEventNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performerNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PGGraphPublicEventNode_performers__block_invoke;
  v8[3] = &unk_1E84364F8;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v8);

  return (NSSet *)v6;
}

- (PGGraphBusinessNode)businessNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphPublicEventNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "businessNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphBusinessNode *)v4;
}

- (NSSet)preciseLocalizedCategoryNames
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke;
  v9[3] = &unk_1E8431550;
  v5 = v3;
  v10 = v5;
  v11 = v12;
  -[PGGraphPublicEventNode enumerateLocalizedSubcategoryNodesUsingBlock:](self, "enumerateLocalizedSubcategoryNodesUsingBlock:", v9);
  if (!objc_msgSend(v5, "count"))
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke_2;
    v7[3] = &unk_1E8436458;
    v8 = v5;
    -[PGGraphPublicEventNode enumeratePublicEventCategoryNodesUsingBlock:](self, "enumeratePublicEventCategoryNodesUsingBlock:", v7);

  }
  _Block_object_dispose(v12, 8);
  return (NSSet *)v5;
}

- (void)enumerateLocalizedSubcategoryNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("LOCALIZED_SUBCATEGORY"), 902, a3);
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PUBLIC_EVENT"), 900, a3);
}

- (void)enumeratePerformerEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PERFORMER"), 900, a3);
}

- (void)enumeratePerformerNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PERFORMER"), 900, a3);
}

- (void)enumeratePublicEventCategoryEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("CATEGORY"), 901, a3);
}

- (void)enumeratePublicEventCategoryNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("CATEGORY"), 901, a3);
}

- (id)keywordDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PGGraphPublicEventNode categories](self, "categories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphPublicEventNode performers](self, "performers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphPublicEventNode name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ [%@] [%@]"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)associatedNodesForRemoval
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke;
  aBlock[3] = &unk_1E8431578;
  v5 = v3;
  v16 = v5;
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_2;
  v13[3] = &unk_1E84315A0;
  v6 = _Block_copy(aBlock);
  v14 = v6;
  -[PGGraphPublicEventNode enumeratePublicEventCategoryNodesUsingBlock:](self, "enumeratePublicEventCategoryNodesUsingBlock:", v13);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_3;
  v11[3] = &unk_1E84315C8;
  v12 = v6;
  v7 = v6;
  -[PGGraphPublicEventNode enumeratePerformerNodesUsingBlock:](self, "enumeratePerformerNodesUsingBlock:", v11);
  v8 = v12;
  v9 = v5;

  return v9;
}

- (unint64_t)featureType
{
  return 21;
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
  -[PGGraphPublicEventNode name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%llu"), v5, v6, -[PGGraphPublicEventNode muid](self, "muid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)expectedAttendance
{
  return self->_expectedAttendance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

void __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (v8 && objc_msgSend(v8, "countOfEdgesWithLabel:domain:", v7, a4) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

uint64_t __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "level");
  if (!objc_msgSend(*(id *)(a1 + 32), "count")
    || (v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v3 > v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
LABEL_5:
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    goto LABEL_6;
  }
  if (v3 == v4)
    goto LABEL_5;
LABEL_6:

}

void __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __36__PGGraphPublicEventNode_performers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v7;
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
      v5 = v7;
    }
  }

}

void __45__PGGraphPublicEventNode_localizedCategories__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __45__PGGraphPublicEventNode_localizedCategories__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __36__PGGraphPublicEventNode_categories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("PublicEvent"), 900);
}

+ (id)unsupportedCategoriesForTitles
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84EA408);
}

+ (MARelation)categoryOfPublicEvent
{
  void *v2;
  void *v3;

  +[PGGraphPublicEventCategoryEdge filter](PGGraphPublicEventCategoryEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentOfPublicEvent
{
  void *v2;
  void *v3;

  +[PGGraphPublicEventEdge filter](PGGraphPublicEventEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)performerOfPublicEvent
{
  void *v2;
  void *v3;

  +[PGGraphPerformerEdge filter](PGGraphPerformerEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)businessOfPublicEvent
{
  void *v2;
  void *v3;

  +[PGGraphPublicEventBusinessEdge filter](PGGraphPublicEventBusinessEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
