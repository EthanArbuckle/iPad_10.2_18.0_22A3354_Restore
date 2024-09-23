@implementation PGGraphContactNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)contactNodeForContactIdentifier:(id)a3 inGraph:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphContactNode filterWithContactIdentifiers:](PGGraphContactNode, "filterWithContactIdentifiers:", v9, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)contactNodesForContactIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphContactNode filterWithContactIdentifiers:](PGGraphContactNode, "filterWithContactIdentifiers:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
