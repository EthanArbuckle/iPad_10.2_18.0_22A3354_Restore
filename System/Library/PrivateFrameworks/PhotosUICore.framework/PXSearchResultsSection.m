@implementation PXSearchResultsSection

- (PXSearchResultsSection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsSection.m"), 312, CFSTR("%s is not available as initializer"), "-[PXSearchResultsSection init]");

  abort();
}

- (PXSearchResultsSection)initWithTitle:(id)a3 withSectionType:(unint64_t)a4
{
  id v6;
  PXSearchResultsSection *v7;
  NSObject *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSMutableArray *mutableSearchResults;
  uint64_t v13;
  NSMutableSet *mutableSearchResultUUIDs;
  uint8_t v16[16];
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchResultsSection;
  v7 = -[PXSearchResultsSection init](&v17, sel_init);
  if (!a4)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Expected section type for search result section", v16, 2u);
    }

  }
  if (v7)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v9;

    v7->_sectionType = a4;
    v11 = objc_opt_new();
    mutableSearchResults = v7->_mutableSearchResults;
    v7->_mutableSearchResults = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    mutableSearchResultUUIDs = v7->_mutableSearchResultUUIDs;
    v7->_mutableSearchResultUUIDs = (NSMutableSet *)v13;

  }
  return v7;
}

- (unint64_t)maxVisibleItemsInCollapsedSection
{
  return 3;
}

- (NSArray)searchResults
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[PXSearchResultsSection isSorted](self, "isSorted") && -[NSArray count](self->_sortDescriptors, "count"))
  {
    -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortUsingDescriptors:", self->_sortDescriptors);

    -[PXSearchResultsSection setSorted:](self, "setSorted:", 1);
  }
  -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (void)addSearchResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "itemType") == 2)
  {
    objc_msgSend(v13, "assetUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "collectionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v13, "assetUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0;
      goto LABEL_7;
    }
    v5 = v6;
    v4 = v5;
  }
  v7 = v5;
LABEL_7:

  if (objc_msgSend(v7, "length"))
  {
    -[PXSearchResultsSection mutableSearchResultUUIDs](self, "mutableSearchResultUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if ((v10 & 1) == 0)
    {
      -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      -[PXSearchResultsSection mutableSearchResultUUIDs](self, "mutableSearchResultUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v7);

      -[PXSearchResultsSection setSorted:](self, "setSorted:", 0);
    }
  }

}

- (void)removeSearchResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "itemType") == 2)
  {
    objc_msgSend(v11, "assetUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v5;
    goto LABEL_7;
  }
  objc_msgSend(v11, "collectionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5 = v6;
    v4 = v5;
    goto LABEL_5;
  }
  objc_msgSend(v11, "assetUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
LABEL_7:

  if (objc_msgSend(v7, "length"))
  {
    -[PXSearchResultsSection mutableSearchResultUUIDs](self, "mutableSearchResultUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v7);

    -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v11);

  }
}

- (BOOL)isExpandable
{
  unint64_t v3;
  void *v4;

  v3 = -[PXSearchResultsSection maxVisibleItemsInCollapsedSection](self, "maxVisibleItemsInCollapsedSection");
  -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "count") > v3;

  return v3;
}

- (unint64_t)visibleCount
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  unint64_t v7;

  -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[PXSearchResultsSection maxVisibleItemsInCollapsedSection](self, "maxVisibleItemsInCollapsedSection");
  v6 = -[PXSearchResultsSection isExpanded](self, "isExpanded");
  if (v4 >= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v6)
    return v4;
  else
    return v7;
}

- (unint64_t)totalCount
{
  void *v2;
  unint64_t v3;

  -[PXSearchResultsSection mutableSearchResults](self, "mutableSearchResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSDictionary)debugDictionary
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%p"), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("self"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXSearchResultsSection isExpandable](self, "isExpandable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expandable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_expanded);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isExpanded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXSearchResultsSection visibleCount](self, "visibleCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("visibleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXSearchResultsSection totalCount](self, "totalCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalCount"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PXSearchResultsSection searchResults](self, "searchResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "debugDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("searchResults"));
  return (NSDictionary *)v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PXSearchResultsSection debugDictionary](self, "debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (NSMutableArray)mutableSearchResults
{
  return self->_mutableSearchResults;
}

- (BOOL)isSorted
{
  return self->_sorted;
}

- (void)setSorted:(BOOL)a3
{
  self->_sorted = a3;
}

- (NSMutableSet)mutableSearchResultUUIDs
{
  return self->_mutableSearchResultUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSearchResultUUIDs, 0);
  objc_storeStrong((id *)&self->_mutableSearchResults, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)sectionTitleForCategoryMask:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  PLSearchIndexCategoriesForCategoryMask();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PXSearchResultsSection_sectionTitleForCategoryMask___block_invoke;
  v12[3] = &unk_1E5120968;
  v14 = a1;
  v15 = a2;
  v13 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v12);
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_69511);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("SEARCH_CATEGORY_DELIMITER"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_stringForCategory:(unint64_t)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  char v6;

  v3 = 0;
  if ((uint64_t)a3 > 1400)
  {
    if ((uint64_t)a3 <= 1999)
    {
      if (a3 - 1900 >= 0x14)
      {
        if (a3 - 1500 <= 0x29 && ((1 << (a3 + 36)) & 0x300C0300C03) != 0)
        {
          v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_SCENE");
        }
        else
        {
          if (a3 != 1401)
            return v3;
          v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_MEMORIES");
        }
      }
      else
      {
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_MEDIA_TYPES");
      }
      goto LABEL_36;
    }
    if ((uint64_t)a3 > 2399)
    {
      if (a3 - 2400 >= 2)
        return v3;
      v5 = CFSTR("PXSharedLibrary_SearchResultSectionTitle_Library");
      goto LABEL_19;
    }
    switch(a3)
    {
      case 0x7D0uLL:
LABEL_35:
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_ALBUMS");
        break;
      case 0x834uLL:
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_FILENAME");
        break;
      case 0x898uLL:
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_SAVED_FROM_APP");
        break;
      default:
        return v3;
    }
LABEL_36:
    PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if ((uint64_t)a3 <= 1099)
  {
    if (a3 - 1 >= 0xE && a3 - 1000 >= 3)
      return v3;
    v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PLACES");
    goto LABEL_36;
  }
  if ((uint64_t)a3 > 1299)
  {
    v6 = a3 - 20;
    if (a3 - 1300 > 0x1F)
    {
LABEL_34:
      if (a3 != 1400)
        return v3;
      goto LABEL_35;
    }
    if (((1 << v6) & 3) != 0)
    {
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PEOPLE");
      goto LABEL_36;
    }
    if (((1 << v6) & 0x300000) == 0)
    {
      if (((1 << v6) & 0xC0000000) != 0)
      {
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PETS");
        goto LABEL_36;
      }
      goto LABEL_34;
    }
    v5 = CFSTR("PXSharedLibrary_SearchResultSectionTitle_SharedBy");
LABEL_19:
    PXLocalizedSharedLibraryString(v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 - 1100 < 6)
  {
    v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_DATES");
    goto LABEL_36;
  }
  switch(a3)
  {
    case 0x4B0uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_KEYWORDS");
      goto LABEL_36;
    case 0x4B1uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_TITLES");
      goto LABEL_36;
    case 0x4B2uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_DESCRIPTIONS");
      goto LABEL_36;
    case 0x4B3uLL:
    case 0x4B4uLL:
    case 0x4B5uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_OCR_TEXT");
      goto LABEL_36;
    default:
      return v3;
  }
  return v3;
}

+ (unint64_t)sectionTypeForCategoryMask:(unint64_t)a3 isMomentSection:(BOOL)a4 isTopAssetSection:(BOOL)a5
{
  unint64_t v5;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (a5)
    v5 = 1;
  else
    v5 = 5;
  if (!a4 && !a5)
  {
    switch(a3)
    {
      case 0x100uLL:
        return 6;
      case 0x8000000uLL:
        return 21;
      case 0x1000uLL:
        return 15;
      default:
        PLSearchIndexCategoriesForCategoryMask();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v11 = &v10;
        v12 = 0x2020000000;
        v13 = 0;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __87__PXSearchResultsSection_sectionTypeForCategoryMask_isMomentSection_isTopAssetSection___block_invoke;
        v9[3] = &unk_1E51209B0;
        v9[4] = &v10;
        v9[5] = a1;
        objc_msgSend(v7, "enumerateIndexesUsingBlock:", v9);
        v5 = v11[3];
        _Block_object_dispose(&v10, 8);

        break;
    }
  }
  return v5;
}

+ (unint64_t)_sectionTypeForCategory:(unint64_t)a3
{
  unint64_t result;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;

  result = 16;
  if ((uint64_t)a3 <= 1699)
  {
    if ((uint64_t)a3 > 1309)
    {
      if ((uint64_t)a3 <= 1400)
      {
        if ((uint64_t)a3 > 1329)
        {
          v9 = 6;
          if (a3 != 1400)
            v9 = 16;
          if (a3 - 1330 >= 2)
            return v9;
          else
            return 3;
        }
        else
        {
          if (a3 - 1320 < 2)
            return 4;
          if (a3 == 1310)
            return 0;
        }
      }
      else
      {
        if (a3 - 1500 <= 0x29 && ((1 << (a3 + 36)) & 0x300C0300C03) != 0)
          return 7;
        if (a3 - 1600 <= 0xB && ((1 << (a3 - 64)) & 0xC03) != 0)
          return 0;
        if (a3 == 1401)
          return 15;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 1099)
      {
        if ((uint64_t)a3 > 1002)
        {
          if (a3 - 1003 >= 4)
            return result;
          return 0;
        }
        if (!a3)
          return 0;
        v4 = 11;
        v5 = 18;
        if (a3 != 1001)
          v5 = 16;
        v7 = a3 == 1000;
        goto LABEL_38;
      }
      if (a3 - 1100 <= 5)
      {
        if (a3 != 1103)
          return 8;
        return 0;
      }
      switch(a3)
      {
        case 0x4B0uLL:
          result = 12;
          break;
        case 0x4B1uLL:
          result = 17;
          break;
        case 0x4B2uLL:
          result = 9;
          break;
        case 0x4B3uLL:
        case 0x4B4uLL:
        case 0x4B5uLL:
          result = 10;
          break;
        default:
          if (a3 - 1300 < 2)
            result = 2;
          break;
      }
    }
    return result;
  }
  if ((uint64_t)a3 <= 1999)
  {
    if (a3 - 1900 < 0x14)
      return 14;
    if (a3 - 1800 < 4)
      return 0;
    v8 = a3 - 1700;
LABEL_32:
    if (v8 < 2)
      return 0;
    return result;
  }
  if ((uint64_t)a3 > 2499)
  {
    if ((uint64_t)a3 > 2699)
    {
      if (a3 == 2700 || a3 == 2800)
        return 0;
      return result;
    }
    if (a3 - 2500 < 2)
      return 0;
    v8 = a3 - 2600;
    goto LABEL_32;
  }
  if ((uint64_t)a3 <= 2299)
  {
    v4 = 6;
    v5 = 20;
    v6 = 13;
    if (a3 != 2200)
      v6 = 16;
    if (a3 != 2100)
      v5 = v6;
    v7 = a3 == 2000;
LABEL_38:
    if (v7)
      return v4;
    else
      return v5;
  }
  if (a3 - 2400 < 2)
    return 19;
  if (a3 == 2300)
    return 0;
  return result;
}

uint64_t __87__PXSearchResultsSection_sectionTypeForCategoryMask_isMomentSection_isTopAssetSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "_sectionTypeForCategory:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __54__PXSearchResultsSection_sectionTitleForCategoryMask___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 40), "_stringForCategory:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Expected string for display", v5, 2u);
    }

  }
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __54__PXSearchResultsSection_sectionTitleForCategoryMask___block_invoke_128(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

@end
