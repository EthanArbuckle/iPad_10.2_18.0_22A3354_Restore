@implementation SBHLibraryCategoryMap

- (BOOL)isEqualToCategoryMap:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4
    && objc_msgSend(*((id *)v4 + 1), "isEqual:", self->_categoryIdentifiers)
    && -[NSMutableDictionary isEqualToDictionary:](self->_sortedApplicationIdentifiersByCategoryIdentifier, "isEqualToDictionary:", v5[2]))
  {
    v6 = -[NSMutableDictionary isEqualToDictionary:](self->_localizedCategoryNameByCategoryIdentifier, "isEqualToDictionary:", v5[3]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
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

  v4 = (void *)objc_opt_new();
  -[SBHLibraryCategoryMap categoryIdentifiers](self, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategoryIdentifiers:", v5);

  -[SBHLibraryCategoryMap sortedApplicationIdentifiersByCategoryIdentifier](self, "sortedApplicationIdentifiersByCategoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortedApplicationIdentifiersByCategoryIdentifier:", v6);

  -[SBHLibraryCategoryMap localizedCategoryNameByCategoryIdentifier](self, "localizedCategoryNameByCategoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedCategoryNameByCategoryIdentifier:", v7);

  -[SBHLibraryCategoryMap metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v8);

  objc_msgSend(v4, "setLoadedFromDisk:", -[SBHLibraryCategoryMap loadedFromDisk](self, "loadedFromDisk"));
  -[SBHLibraryCategoryMap uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueIdentifier:", v9);

  -[SBHLibraryCategoryMap generatedDate](self, "generatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeneratedDate:", v10);

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  -[SBHLibraryCategoryMap categoryIdentifiers](self, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategoryIdentifiers:", v5);

  -[SBHLibraryCategoryMap sortedApplicationIdentifiersByCategoryIdentifier](self, "sortedApplicationIdentifiersByCategoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortedApplicationIdentifiersByCategoryIdentifier:", v6);

  -[SBHLibraryCategoryMap localizedCategoryNameByCategoryIdentifier](self, "localizedCategoryNameByCategoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedCategoryNameByCategoryIdentifier:", v7);

  -[SBHLibraryCategoryMap metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v8);

  objc_msgSend(v4, "setLoadedFromDisk:", -[SBHLibraryCategoryMap loadedFromDisk](self, "loadedFromDisk"));
  -[SBHLibraryCategoryMap uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueIdentifier:", v9);

  -[SBHLibraryCategoryMap generatedDate](self, "generatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeneratedDate:", v10);

  return v4;
}

- (NSArray)categoryIdentifiers
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_categoryIdentifiers, "array");
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setCategoryIdentifiers:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *categoryIdentifiers;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", a3);
  v4 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  categoryIdentifiers = self->_categoryIdentifiers;
  self->_categoryIdentifiers = v4;

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDictionary)sortedApplicationIdentifiersByCategoryIdentifier
{
  return &self->_sortedApplicationIdentifiersByCategoryIdentifier->super;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSortedApplicationIdentifiersByCategoryIdentifier:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *sortedApplicationIdentifiersByCategoryIdentifier;
  id v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = v4;
  if (v4)
    v5 = v4;
  else
    v5 = (NSMutableDictionary *)objc_opt_new();
  sortedApplicationIdentifiersByCategoryIdentifier = self->_sortedApplicationIdentifiersByCategoryIdentifier;
  self->_sortedApplicationIdentifiersByCategoryIdentifier = v5;

}

- (void)setLocalizedCategoryNameByCategoryIdentifier:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *localizedCategoryNameByCategoryIdentifier;
  id v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = v4;
  if (v4)
    v5 = v4;
  else
    v5 = (NSMutableDictionary *)objc_opt_new();
  localizedCategoryNameByCategoryIdentifier = self->_localizedCategoryNameByCategoryIdentifier;
  self->_localizedCategoryNameByCategoryIdentifier = v5;

}

- (void)setLoadedFromDisk:(BOOL)a3
{
  self->_loadedFromDisk = a3;
}

- (void)setGeneratedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDictionary)localizedCategoryNameByCategoryIdentifier
{
  return &self->_localizedCategoryNameByCategoryIdentifier->super;
}

- (BOOL)loadedFromDisk
{
  return self->_loadedFromDisk;
}

- (SBHLibraryCategoryMap)init
{
  SBHLibraryCategoryMap *v2;
  uint64_t v3;
  NSMutableOrderedSet *categoryIdentifiers;
  uint64_t v5;
  NSMutableDictionary *sortedApplicationIdentifiersByCategoryIdentifier;
  uint64_t v7;
  NSMutableDictionary *localizedCategoryNameByCategoryIdentifier;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  uint64_t v12;
  NSDate *generatedDate;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBHLibraryCategoryMap;
  v2 = -[SBHLibraryCategoryMap init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    categoryIdentifiers = v2->_categoryIdentifiers;
    v2->_categoryIdentifiers = (NSMutableOrderedSet *)v3;

    v5 = objc_opt_new();
    sortedApplicationIdentifiersByCategoryIdentifier = v2->_sortedApplicationIdentifiersByCategoryIdentifier;
    v2->_sortedApplicationIdentifiersByCategoryIdentifier = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    localizedCategoryNameByCategoryIdentifier = v2->_localizedCategoryNameByCategoryIdentifier;
    v2->_localizedCategoryNameByCategoryIdentifier = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    generatedDate = v2->_generatedDate;
    v2->_generatedDate = (NSDate *)v12;

    v2->_loadedFromDisk = 0;
  }
  return v2;
}

- (NSDate)generatedDate
{
  return self->_generatedDate;
}

- (id)sortedApplicationIdentifiersForCategoryIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_sortedApplicationIdentifiersByCategoryIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_generatedDate, 0);
  objc_storeStrong((id *)&self->_localizedCategoryNameByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_sortedApplicationIdentifiersByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBHLibraryCategoryMap)initWithCoder:(id)a3
{
  id v4;
  SBHLibraryCategoryMap *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSMutableOrderedSet *categoryIdentifiers;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSString *v33;
  void *v34;
  NSString *uniqueIdentifier;
  NSString *v36;
  uint64_t v37;
  NSDate *generatedDate;
  char v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SBHLibraryCategoryMap;
  v5 = -[SBHLibraryCategoryMap init](&v41, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_categoryIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E0C9AA60];
    if (v10)
      v12 = (void *)v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    categoryIdentifiers = v5->_categoryIdentifiers;
    v5->_categoryIdentifiers = (NSMutableOrderedSet *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("_sortedApplicationIdentifiersByCategoryIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = (id)objc_opt_new();
    v24 = v23;

    objc_storeStrong((id *)&v5->_sortedApplicationIdentifiersByCategoryIdentifier, v24);
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("_localizedCategoryNameByCategoryIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      v31 = v29;
    else
      v31 = (id)objc_opt_new();
    v32 = v31;

    objc_storeStrong((id *)&v5->_localizedCategoryNameByCategoryIdentifier, v32);
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("_uniqueIdentifier")) & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueIdentifier"));
      v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "UUIDString");
      v33 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = v33;
    v36 = v33;

    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("_generatedDate")) & 1) != 0)
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_generatedDate"));
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = objc_claimAutoreleasedReturnValue();
    generatedDate = v5->_generatedDate;
    v5->_generatedDate = (NSDate *)v37;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_loadedFromDisk")))
      v39 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_loadedFromDisk"));
    else
      v39 = 1;
    v5->_loadedFromDisk = v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableOrderedSet *categoryIdentifiers;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  categoryIdentifiers = self->_categoryIdentifiers;
  v8 = a3;
  -[NSMutableOrderedSet array](categoryIdentifiers, "array");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("_categoryIdentifiers"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_sortedApplicationIdentifiersByCategoryIdentifier, CFSTR("_sortedApplicationIdentifiersByCategoryIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_localizedCategoryNameByCategoryIdentifier, CFSTR("_localizedCategoryNameByCategoryIdentifier"));
  objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("_loadedFromDisk"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("_uniqueIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_generatedDate, CFSTR("_generatedDate"));

}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBHLibraryCategoryMap categoryIdentifiers](self, "categoryIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SBHLibraryCategoryMap sortedApplicationIdentifiersForCategoryIdentifier:](self, "sortedApplicationIdentifiersForCategoryIdentifier:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = v9;
        else
          v11 = MEMORY[0x1E0C9AA60];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "predictionCategoryID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  SBHLibraryCategoryMap *v4;
  BOOL v5;

  v4 = (SBHLibraryCategoryMap *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SBHLibraryCategoryMap isEqualToCategoryMap:](self, "isEqualToCategoryMap:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_generatedDate, CFSTR("generatedDate"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_loadedFromDisk, CFSTR("loadedFromDisk"));
  -[NSMutableOrderedSet valueForKey:](self->_categoryIdentifiers, "valueForKey:", CFSTR("predictionCategoryID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("categoryIdentifiers"), 0);

  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_sortedApplicationIdentifiersByCategoryIdentifier, CFSTR("sortedApplicationIdentifiersByCategoryIdentifier"), 0);
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_localizedCategoryNameByCategoryIdentifier, CFSTR("_localizedCategoryNameByCategoryIdentifier"), 0);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)diffMap:(id)a3 withMap:(id)a4
{
  id *v5;
  id *v6;
  void *v7;
  void (**v8)(void *, uint64_t, void *, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  const __CFString *v24;
  BOOL v25;
  id *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v34;
  id obj;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD aBlock[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v6 = (id *)a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("LHS: %p\nRHS: %p\n"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SBHLibraryCategoryMap_diffMap_withMap___block_invoke;
  aBlock[3] = &unk_1E8D88128;
  v37 = v7;
  v43 = v37;
  v8 = (void (**)(void *, uint64_t, void *, void *))_Block_copy(aBlock);
  +[SBHLibraryCategoryIdentifier categoryWithLocalizedDisplayName:categoryID:categoryIndex:](SBHLibraryCategoryIdentifier, "categoryWithLocalizedDisplayName:categoryID:categoryIndex:", CFSTR("CategoryIdentifiers"), 31337, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[1], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6[1], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v9;
  v8[2](v8, v9, v10, v11);

  v12 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v5[1], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6[1], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v16)
  {
    v17 = v16;
    v36 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v39 != v36)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v5[3], "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6[3], "objectForKeyedSubscript:", v19);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v20)
          v23 = v21 == 0;
        else
          v23 = 0;
        v24 = CFSTR("\t--> ADD %@: ");
        if (v23 || (!v20 ? (v25 = v21 == 0) : (v25 = 1), v24 = CFSTR("\t--> DELETE %@: "), !v25))
          objc_msgSend(v37, "appendFormat:", v24, v19);
        if ((objc_msgSend(v20, "isEqualToString:", v22) & 1) == 0)
          objc_msgSend(v37, "appendFormat:", CFSTR("Category id '%@' name change from '%@'->'%@'"), v19, v20, v22);
        objc_msgSend(v5[2], "objectForKeyedSubscript:", v19);
        v26 = v5;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6[2], "objectForKeyedSubscript:", v19);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        if (v27)
          v30 = v27;
        else
          v30 = (void *)MEMORY[0x1E0C9AA60];
        if (v28)
          v31 = v28;
        else
          v31 = MEMORY[0x1E0C9AA60];
        v8[2](v8, v19, v30, (void *)v31);

        v5 = v26;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v17);
  }

  v32 = v37;
  return v32;
}

void __41__SBHLibraryCategoryMap_diffMap_withMap___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a3 | a4)
  {
    objc_msgSend((id)a3, "differenceFromArray:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasChanges"))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v7, "localizedDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendFormat:", CFSTR("\t-->%@: "), v10);

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v8, "removals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v15), "object");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendFormat:", CFSTR("\n\t\tDELETION %@"), v17);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v13);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v8, "insertions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "object");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "appendFormat:", CFSTR("\n\t\tINSERT %@"), v24);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v20);
      }

      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
    }

  }
}

- (id)localizedCategoryNameForCategoryIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_localizedCategoryNameByCategoryIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)categoriesContainApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBHLibraryCategoryMap categoryIdentifiers](self, "categoryIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[SBHLibraryCategoryMap sortedApplicationIdentifiersForCategoryIdentifier:](self, "sortedApplicationIdentifiersForCategoryIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)categoryIdentifiersForApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_sortedApplicationIdentifiersByCategoryIdentifier;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_sortedApplicationIdentifiersByCategoryIdentifier, "objectForKey:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)categoryIdentifierForProactiveCategoryIdentifier:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBHLibraryCategoryMap categoryIdentifiers](self, "categoryIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "predictionCategoryID") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

@end
