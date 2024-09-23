@implementation TPSContentPackage

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[TPSContentPackage orderedCollectionIdentifiers](self, "orderedCollectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("orderedCollectionIdentifiers"));

  -[TPSContentPackage language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("language"));

  -[TPSContentPackage collectionMap](self, "collectionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("collectionMap"));

  -[TPSContentPackage tipMap](self, "tipMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("tipMap"));

  -[TPSContentPackage collectionSections](self, "collectionSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("collectionSections"));

  -[TPSContentPackage userGuides](self, "userGuides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("userGuides"));

  -[TPSContentPackage collectionSectionMap](self, "collectionSectionMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("collectionSectionMap"));

  -[TPSContentPackage assetSizes](self, "assetSizes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("assetSizes"));

  -[TPSContentPackage featuredCollection](self, "featuredCollection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("featuredCollection"));

}

- (NSArray)userGuides
{
  return self->_userGuides;
}

- (NSDictionary)tipMap
{
  return self->_tipMap;
}

- (TPSCollection)featuredCollection
{
  return self->_featuredCollection;
}

- (NSArray)savedTipIdentifiers
{
  return self->_savedTipIdentifiers;
}

- (NSString)language
{
  return self->_language;
}

- (NSArray)collectionSections
{
  return self->_collectionSections;
}

- (NSDictionary)collectionSectionMap
{
  return self->_collectionSectionMap;
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (NSArray)orderedCollections
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[TPSContentPackage orderedCollectionIdentifiers](self, "orderedCollectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[TPSContentPackage collectionMap](self, "collectionMap", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v13;
}

- (NSDictionary)collectionMap
{
  return self->_collectionMap;
}

- (NSArray)orderedCollectionIdentifiers
{
  return self->_orderedCollectionIdentifiers;
}

- (void)setFeaturedCollection:(id)a3
{
  TPSCollection *v5;
  TPSCollection *v6;

  v5 = (TPSCollection *)a3;
  if (self->_featuredCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_featuredCollection, a3);
    -[TPSContentPackage updateOrderedCollectionIdentifiers](self, "updateOrderedCollectionIdentifiers");
    v5 = v6;
  }

}

- (void)setOrderedCollectionIdentifiers:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_orderedCollectionIdentifiers != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_orderedCollectionIdentifiers, a3);
    -[TPSContentPackage updateOrderedCollectionIdentifiers](self, "updateOrderedCollectionIdentifiers");
    v5 = v6;
  }

}

- (void)updateOrderedCollectionIdentifiers
{
  void *v3;
  NSArray *v4;
  NSArray *orderedCollectionIdentifiers;
  id v6;

  v6 = (id)-[NSArray mutableCopy](self->_orderedCollectionIdentifiers, "mutableCopy");
  -[TPSDocument identifier](self->_featuredCollection, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v3);

  v4 = (NSArray *)objc_msgSend(v6, "copy");
  orderedCollectionIdentifiers = self->_orderedCollectionIdentifiers;
  self->_orderedCollectionIdentifiers = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUserGuides:(id)a3
{
  objc_storeStrong((id *)&self->_userGuides, a3);
}

- (void)setTipMap:(id)a3
{
  objc_storeStrong((id *)&self->_tipMap, a3);
}

- (void)setSavedTipIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_savedTipIdentifiers, a3);
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (void)setCollectionSections:(id)a3
{
  objc_storeStrong((id *)&self->_collectionSections, a3);
}

- (void)setCollectionSectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionSectionMap, a3);
}

- (void)setCollectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionMap, a3);
}

- (void)setAssetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_assetSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredCollection, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_tipMap, 0);
  objc_storeStrong((id *)&self->_collectionMap, 0);
  objc_storeStrong((id *)&self->_collectionSectionMap, 0);
  objc_storeStrong((id *)&self->_userGuides, 0);
  objc_storeStrong((id *)&self->_collectionSections, 0);
  objc_storeStrong((id *)&self->_savedTipIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedCollectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (TPSContentPackage)initWithCoder:(id)a3
{
  id v4;
  TPSContentPackage *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *orderedCollectionIdentifiers;
  uint64_t v12;
  NSString *language;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *collectionMap;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *collectionSections;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *userGuides;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSDictionary *collectionSectionMap;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSDictionary *tipMap;
  uint64_t v44;
  TPSAssetSizes *assetSizes;
  uint64_t v46;
  TPSCollection *featuredCollection;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TPSContentPackage;
  v5 = -[TPSContentPackage init](&v49, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("orderedCollectionIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    orderedCollectionIdentifiers = v5->_orderedCollectionIdentifiers;
    v5->_orderedCollectionIdentifiers = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v12 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("collectionMap"));
    v19 = objc_claimAutoreleasedReturnValue();
    collectionMap = v5->_collectionMap;
    v5->_collectionMap = (NSDictionary *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("collectionSections"));
    v24 = objc_claimAutoreleasedReturnValue();
    collectionSections = v5->_collectionSections;
    v5->_collectionSections = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("userGuides"));
    v29 = objc_claimAutoreleasedReturnValue();
    userGuides = v5->_userGuides;
    v5->_userGuides = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("collectionSectionMap"));
    v35 = objc_claimAutoreleasedReturnValue();
    collectionSectionMap = v5->_collectionSectionMap;
    v5->_collectionSectionMap = (NSDictionary *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("tipMap"));
    v42 = objc_claimAutoreleasedReturnValue();
    tipMap = v5->_tipMap;
    v5->_tipMap = (NSDictionary *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSizes"));
    v44 = objc_claimAutoreleasedReturnValue();
    assetSizes = v5->_assetSizes;
    v5->_assetSizes = (TPSAssetSizes *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featuredCollection"));
    v46 = objc_claimAutoreleasedReturnValue();
    featuredCollection = v5->_featuredCollection;
    v5->_featuredCollection = (TPSCollection *)v46;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TPSContentPackage orderedCollectionIdentifiers](self, "orderedCollectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderedCollectionIdentifiers:", v5);

  -[TPSContentPackage language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguage:", v6);

  -[TPSContentPackage collectionMap](self, "collectionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionMap:", v7);

  -[TPSContentPackage collectionSections](self, "collectionSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionSections:", v8);

  -[TPSContentPackage userGuides](self, "userGuides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserGuides:", v9);

  -[TPSContentPackage collectionSectionMap](self, "collectionSectionMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionSectionMap:", v10);

  -[TPSContentPackage tipMap](self, "tipMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTipMap:", v11);

  -[TPSContentPackage assetSizes](self, "assetSizes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetSizes:", v12);

  -[TPSContentPackage featuredCollection](self, "featuredCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFeaturedCollection:", v13);

  return v4;
}

- (BOOL)hasTipContent
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TPSContentPackage collectionMap](self, "collectionMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[TPSContentPackage tipMap](self, "tipMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v25.receiver = self;
  v25.super_class = (Class)TPSContentPackage;
  -[TPSContentPackage debugDescription](&v25, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSContentPackage orderedCollectionIdentifiers](self, "orderedCollectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSContentPackage orderedCollectionIdentifiers](self, "orderedCollectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("orderedCollectionIdentifiers"), v7);

  }
  -[TPSContentPackage language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TPSContentPackage language](self, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("language"), v9);

  }
  -[TPSContentPackage collectionMap](self, "collectionMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSContentPackage collectionMap](self, "collectionMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("collectionMap"), v11);

  }
  -[TPSContentPackage collectionSections](self, "collectionSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSContentPackage collectionSections](self, "collectionSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("collectionSections"), v13);

  }
  -[TPSContentPackage collectionSectionMap](self, "collectionSectionMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TPSContentPackage collectionSectionMap](self, "collectionSectionMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("collectionSectionMap"), v15);

  }
  -[TPSContentPackage userGuides](self, "userGuides");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TPSContentPackage userGuides](self, "userGuides");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("userGuides"), v17);

  }
  -[TPSContentPackage tipMap](self, "tipMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[TPSContentPackage tipMap](self, "tipMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("tipMap"), v19);

  }
  -[TPSContentPackage assetSizes](self, "assetSizes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TPSContentPackage assetSizes](self, "assetSizes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@"), CFSTR("assetSizes"), v21);

  }
  -[TPSContentPackage featuredCollection](self, "featuredCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[TPSContentPackage featuredCollection](self, "featuredCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@"), CFSTR("featuredCollection"), v23);

  }
  return v5;
}

@end
