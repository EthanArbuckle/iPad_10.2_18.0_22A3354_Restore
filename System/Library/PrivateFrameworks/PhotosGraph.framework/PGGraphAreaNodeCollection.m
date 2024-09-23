@implementation PGGraphAreaNodeCollection

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphAreaNode addressOfArea](PGGraphAreaNode, "addressOfArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (id)names
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphAreaNodeCollection_names__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (id)nonBlockedAreaNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphAreaNode nonBlockedFilter](PGGraphAreaNode, "nonBlockedFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAreaNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateIdentifiersSortedByPopularityScoreWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PGGraphAreaNodeCollection_enumerateIdentifiersSortedByPopularityScoreWithBlock___block_invoke;
  v6[3] = &unk_1E84338B0;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateNodesAsCollectionsSortedByDoublePropertyForName:ascending:usingBlock:](self, "enumerateNodesAsCollectionsSortedByDoublePropertyForName:ascending:usingBlock:", CFSTR("popularityScore"), 0, v6);

}

- (void)enumeratePopularityScoresUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PGGraphAreaNodeCollection_enumeratePopularityScoresUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("popularityScore"), v6);

}

uint64_t __65__PGGraphAreaNodeCollection_enumeratePopularityScoresUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__PGGraphAreaNodeCollection_enumerateIdentifiersSortedByPopularityScoreWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "elementIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(v5, "firstElement"), a3);

}

void __34__PGGraphAreaNodeCollection_names__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)areaNodesForNames:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphAreaNode filterWithNames:](PGGraphAreaNode, "filterWithNames:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)areaNodesWithCIDINames:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[PGGraphAreaNode filter](PGGraphAreaNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("name");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 8, v7);

  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterBySettingProperties:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
