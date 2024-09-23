@implementation PXNewSearchResultsSection

- (PXNewSearchResultsSection)initWithType:(unint64_t)a3 results:(id)a4
{
  id v7;
  PXNewSearchResultsSection *v8;
  PXNewSearchResultsSection *v9;
  uint64_t v10;
  NSArray *results;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSDictionary *identifierToResultMap;
  void *v21;
  objc_super v22;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultsSection_Internal.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PXNewSearchResultsSection;
  v8 = -[PXNewSearchResultsSection init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v10 = objc_msgSend(v7, "copy");
    results = v9->_results;
    v9->_results = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0CB3940];
    -[PXNewSearchResultsSection _stringForType:](v9, "_stringForType:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("SearchResultsSection/%@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v14;

    -[PXNewSearchResultsSection _titleForSectionType:](v9, "_titleForSectionType:", a3);
    v16 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v16;

    -[PXNewSearchResultsSection _identifierToResultMapWithResults:](v9, "_identifierToResultMapWithResults:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    identifierToResultMap = v9->_identifierToResultMap;
    v9->_identifierToResultMap = (NSDictionary *)v18;

    -[PXNewSearchResultsSection _updateVisibleResultIdentifiers](v9, "_updateVisibleResultIdentifiers");
  }

  return v9;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[PXNewSearchResultsSection _updateVisibleResultIdentifiers](self, "_updateVisibleResultIdentifiers");
  }
}

- (BOOL)isExpandable
{
  unint64_t v3;

  v3 = -[PXNewSearchResultsSection _expandedVisibleResultCount](self, "_expandedVisibleResultCount");
  return v3 > -[PXNewSearchResultsSection _collapsedVisibleResultCount](self, "_collapsedVisibleResultCount");
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[PXNewSearchResultsSection _sortOrder](self, "_sortOrder");
  if (v5 >= objc_msgSend(v4, "_sortOrder"))
  {
    v7 = -[PXNewSearchResultsSection _sortOrder](self, "_sortOrder");
    v6 = v7 > objc_msgSend(v4, "_sortOrder");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (void)_updateVisibleResultIdentifiers
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PXNewSearchResultsSection isExpanded](self, "isExpanded"))
    v3 = -[PXNewSearchResultsSection _expandedVisibleResultCount](self, "_expandedVisibleResultCount");
  else
    v3 = -[PXNewSearchResultsSection _collapsedVisibleResultCount](self, "_collapsedVisibleResultCount");
  v4 = v3;
  -[PXNewSearchResultsSection results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subarrayWithRange:", 0, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PXNewSearchResultsSection _identifiersForResults:](self, "_identifiersForResults:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNewSearchResultsSection setVisibleResultIdentifiers:](self, "setVisibleResultIdentifiers:", v6);

}

- (unint64_t)_expandedVisibleResultCount
{
  void *v2;
  unint64_t v3;

  -[PXNewSearchResultsSection results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)_collapsedVisibleResultCount
{
  void *v2;
  unint64_t v3;

  -[PXNewSearchResultsSection results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 >= 3)
    return 3;
  else
    return v3;
}

- (id)_identifiersForResults:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultsSection_Internal.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results"));

  }
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchResultForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultsSection_Internal.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[PXNewSearchResultsSection identifierToResultMap](self, "identifierToResultMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_identifierToResultMapWithResults:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultsSection_Internal.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results"));

  }
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

- (id)_titleForSectionType:(unint64_t)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v12;

  v3 = self;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PXNewSearchResultsSection_Internal.m"), 134, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_ALBUMS");
      goto LABEL_23;
    case 2uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_DATES");
      goto LABEL_23;
    case 3uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_DESCRIPTIONS");
      goto LABEL_23;
    case 4uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_OCR_TEXT");
      goto LABEL_23;
    case 5uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_FILENAME");
      goto LABEL_23;
    case 6uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_KEYWORDS");
      goto LABEL_23;
    case 7uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_MEDIA_TYPES");
      goto LABEL_23;
    case 8uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_MEMORIES");
      goto LABEL_23;
    case 9uLL:
      if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
      {
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PHOTO_MOMENTS_LEMONADE");
        v5 = CFSTR("LemonadeLocalizable");
      }
      else
      {
        v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PHOTO_MOMENTS");
LABEL_23:
        v5 = CFSTR("PhotosUICore");
      }
      PXLocalizedStringFromTable(v4, v5);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v3 = (void *)v7;
      return v3;
    case 0xAuLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PEOPLE");
      goto LABEL_23;
    case 0xBuLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PETS");
      goto LABEL_23;
    case 0xCuLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PLACES");
      goto LABEL_23;
    case 0xDuLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_SCENE");
      goto LABEL_23;
    case 0xEuLL:
      v6 = CFSTR("PXSharedLibrary_SearchResultSectionTitle_SharedBy");
      goto LABEL_18;
    case 0xFuLL:
      v6 = CFSTR("PXSharedLibrary_SearchResultSectionTitle_Library");
LABEL_18:
      PXLocalizedSharedLibraryString(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 0x10uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_TITLES");
      goto LABEL_23;
    case 0x11uLL:
      -[PXNewSearchResultsSection results](self, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "count");

      PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_SECTION_HEADER_PHOTOS_TITLE"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v9, CFSTR("%lu"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 0x12uLL:
      v4 = CFSTR("SEARCH_RESULT_SECTION_HEADER_SAVED_FROM_APP");
      goto LABEL_23;
    default:
      return v3;
  }
}

- (unint64_t)_sortOrder
{
  unint64_t v4;
  unint64_t result;
  void *v6;

  v4 = -[PXNewSearchResultsSection type](self, "type");
  result = 0;
  switch(v4)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultsSection_Internal.m"), 159, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1uLL:
      result = 7;
      break;
    case 2uLL:
      result = 9;
      break;
    case 3uLL:
      result = 10;
      break;
    case 4uLL:
    case 0x10uLL:
      result = v4;
      break;
    case 5uLL:
      result = 17;
      break;
    case 6uLL:
      result = 11;
      break;
    case 7uLL:
      result = 13;
      break;
    case 8uLL:
      result = 14;
      break;
    case 9uLL:
      result = 6;
      break;
    case 0xAuLL:
      result = 1;
      break;
    case 0xBuLL:
      result = 2;
      break;
    case 0xCuLL:
      result = 15;
      break;
    case 0xDuLL:
      result = 8;
      break;
    case 0xEuLL:
      result = 3;
      break;
    case 0xFuLL:
      result = 5;
      break;
    case 0x12uLL:
      result = 12;
      break;
    default:
      return result;
  }
  return result;
}

- (id)_stringForType:(unint64_t)a3
{
  if (a3 - 1 > 0x11)
    return CFSTR("PXNewSearchResultsSectionTypeInvalid");
  else
    return off_1E5120CB0[a3 - 1];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier: %@"), self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("title: %@"), self->_title);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v5;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PXNewSearchResultsSection _stringForType:](self, "_stringForType:", self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("type: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (self->_expanded)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("isExpanded: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sortOrder: %ld"), -[PXNewSearchResultsSection _sortOrder](self, "_sortOrder"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@>"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSArray)results
{
  return self->_results;
}

- (NSArray)visibleResultIdentifiers
{
  return self->_visibleResultIdentifiers;
}

- (void)setVisibleResultIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)identifierToResultMap
{
  return self->_identifierToResultMap;
}

- (void)setIdentifierToResultMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToResultMap, 0);
  objc_storeStrong((id *)&self->_visibleResultIdentifiers, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __52__PXNewSearchResultsSection__identifiersForResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
