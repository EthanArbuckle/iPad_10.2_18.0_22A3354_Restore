@implementation PGGraphSeasonNodeCollection

- (PGGraphDateNodeCollection)dateNodes
{
  void *v3;
  void *v4;

  +[PGGraphSeasonNode dateOfSeason](PGGraphSeasonNode, "dateOfSeason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphDateNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphDateNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (NSSet)names
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphSeasonNodeCollection_names__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSSet *)v4;
}

- (void)enumerateNamesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphSeasonNodeCollection_enumerateNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

}

uint64_t __56__PGGraphSeasonNodeCollection_enumerateNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__PGGraphSeasonNodeCollection_names__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)seasonNodesForSeasonName:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphSeasonNode filterForSeasonName:](PGGraphSeasonNode, "filterForSeasonName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphSeasonNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
