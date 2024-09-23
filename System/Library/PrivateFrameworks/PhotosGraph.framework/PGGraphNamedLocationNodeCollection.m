@implementation PGGraphNamedLocationNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)locationNodeWithName:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphNamedLocationNode filterWithName:](PGGraphNamedLocationNode, "filterWithName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)locationNodesWithCIDINames:(id)a3 inGraph:(id)a4
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
  +[PGGraphNamedLocationNode filter](PGGraphNamedLocationNode, "filter");
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

- (NSArray)names
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphNamedLocationNodeCollection_names__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSArray *)v4;
}

uint64_t __43__PGGraphNamedLocationNodeCollection_names__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

@end
