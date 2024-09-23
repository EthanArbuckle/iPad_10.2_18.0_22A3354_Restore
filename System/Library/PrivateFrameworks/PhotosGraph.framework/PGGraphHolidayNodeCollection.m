@implementation PGGraphHolidayNodeCollection

- (PGGraphMomentNodeCollection)celebratingMomentNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphCelebratingEdge filter](PGGraphCelebratingEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphDateNodeCollection)dateNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphHolidayEdge filter](PGGraphHolidayEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphDateNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphDateNodeCollection *)v5;
}

- (NSSet)holidayNames
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphHolidayNodeCollection_holidayNames__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSSet *)v4;
}

- (NSSet)localizedHolidayNames
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphHolidayNodeCollection_localizedHolidayNames__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSSet *)v4;
}

- (void)enumerateHolidayNamesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphHolidayNodeCollection_enumerateHolidayNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

uint64_t __64__PGGraphHolidayNodeCollection_enumerateHolidayNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PGGraphHolidayNodeCollection_localizedHolidayNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

void __44__PGGraphHolidayNodeCollection_holidayNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

+ (id)holidayNodesWithName:(id)a3 inGraph:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "holidayNodesWithNames:inGraph:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)holidayNodesWithNames:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHolidayNode holidayNodeFilterWithNames:](PGGraphHolidayNode, "holidayNodeFilterWithNames:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)holidayNodesWithCategory:(unint64_t)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHolidayNode holidayNodeFilterWithCategory:](PGGraphHolidayNode, "holidayNodeFilterWithCategory:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
