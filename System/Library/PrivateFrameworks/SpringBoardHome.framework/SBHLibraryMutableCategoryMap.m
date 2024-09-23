@implementation SBHLibraryMutableCategoryMap

- (void)addCategoryIdentifier:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->super._categoryIdentifiers, "addObject:", a3);
}

- (void)setSortedApplicationIdentifiers:(id)a3 forCategoryIdentifier:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = self->super._sortedApplicationIdentifiersByCategoryIdentifier;
  v7 = a4;
  v8 = objc_msgSend(v7, "predictionCategoryID");
  if (objc_msgSend(v9, "count") || v8 == 7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", v7);

}

- (void)removeCategoryIdentifier:(id)a3
{
  NSMutableDictionary *sortedApplicationIdentifiersByCategoryIdentifier;
  id v5;

  sortedApplicationIdentifiersByCategoryIdentifier = self->super._sortedApplicationIdentifiersByCategoryIdentifier;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](sortedApplicationIdentifiersByCategoryIdentifier, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->super._localizedCategoryNameByCategoryIdentifier, "removeObjectForKey:", v5);
  -[NSMutableOrderedSet removeObject:](self->super._categoryIdentifiers, "removeObject:", v5);

}

- (void)setLocalizedCategoryName:(id)a3 forCategoryIdentifier:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = self->super._localizedCategoryNameByCategoryIdentifier;
  v7 = a4;
  if (objc_msgSend(v8, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", v7);

}

- (void)sortApplicationIdentifiersForCategoryIdentifier:(id)a3 descriptors:(id)a4
{
  NSMutableDictionary *sortedApplicationIdentifiersByCategoryIdentifier;
  id v7;
  id v8;
  void *v9;
  id v10;

  sortedApplicationIdentifiersByCategoryIdentifier = self->super._sortedApplicationIdentifiersByCategoryIdentifier;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](sortedApplicationIdentifiersByCategoryIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "sortUsingDescriptors:", v7);
  -[SBHLibraryMutableCategoryMap setSortedApplicationIdentifiers:forCategoryIdentifier:](self, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v10, v8);

}

- (void)addApplicationIdentifier:(id)a3 forCategoryIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->super._categoryIdentifiers;
  if ((-[NSMutableOrderedSet containsObject:](self->super._categoryIdentifiers, "containsObject:", v7) & 1) == 0)
    -[NSMutableOrderedSet addObject:](v8, "addObject:", v7);
  -[NSMutableDictionary objectForKey:](self->super._sortedApplicationIdentifiersByCategoryIdentifier, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v6) & 1) == 0)
  {
    if (v9)
    {
      objc_msgSend(v9, "arrayByAddingObject:", v6);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    else
    {
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKey:](self->super._sortedApplicationIdentifiersByCategoryIdentifier, "setObject:forKey:", v9, v7);
  }

}

- (void)updateRecentlyAddedCategoryFromMap:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, uint64_t);
  _QWORD v7[4];
  id v8;
  SBHLibraryMutableCategoryMap *v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBHLibraryMutableCategoryMap_updateRecentlyAddedCategoryFromMap___block_invoke;
  v7[3] = &unk_1E8D88150;
  v8 = v4;
  v9 = self;
  v5 = v4;
  v6 = (void (**)(void *, uint64_t))_Block_copy(v7);
  v6[2](v6, 4);

}

void __67__SBHLibraryMutableCategoryMap_updateRecentlyAddedCategoryFromMap___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "categoryIdentifierForProactiveCategoryIdentifier:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "categoryIdentifierForProactiveCategoryIdentifier:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!v4)
    {
      v4 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(*(id *)(a1 + 40), "addCategoryIdentifier:", v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "sortedApplicationIdentifiersForCategoryIdentifier:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSortedApplicationIdentifiers:forCategoryIdentifier:", v5, v4);

    goto LABEL_7;
  }
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeCategoryIdentifier:", v4);
LABEL_7:

  }
}

@end
