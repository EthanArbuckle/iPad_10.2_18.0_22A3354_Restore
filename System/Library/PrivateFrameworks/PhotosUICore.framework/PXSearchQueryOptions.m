@implementation PXSearchQueryOptions

- (PXSearchQueryOptions)init
{
  PXSearchQueryOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchQueryOptions;
  result = -[PXSearchQueryOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_wantsCuratedAssetsFetchResult = 257;
    result->_wantsWordEmbeddings = 1;
    result->_libraryScope = 0;
  }
  return result;
}

- (BOOL)wantsCuratedAssetsFetchResult
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_wantsCuratedAssetsFetchResult)
    return 1;
  if (!self->_wantsLibraryChanges)
    return 0;
  PXAssertGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "If library change handling is enabled, a fetch result must be generated.", v5, 2u);
  }

  return self->_wantsCuratedAssetsFetchResult;
}

- (BOOL)wantsLibraryChanges
{
  NSObject *v4;
  uint8_t v5[16];

  if (!self->_wantsLibraryChanges)
    return 0;
  if (self->_wantsCuratedAssetsFetchResult)
    return 1;
  PXAssertGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "If library change handling is enabled, a fetch result must be generated.", v5, 2u);
  }

  return self->_wantsLibraryChanges;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXSearchQueryOptions *v4;

  v4 = objc_alloc_init(PXSearchQueryOptions);
  -[PXSearchQueryOptions setCuratedAssetLimit:](v4, "setCuratedAssetLimit:", self->_curatedAssetLimit);
  -[PXSearchQueryOptions setWantsLibraryChanges:](v4, "setWantsLibraryChanges:", self->_wantsLibraryChanges);
  -[PXSearchQueryOptions setSuggestionLimit:](v4, "setSuggestionLimit:", self->_suggestionLimit);
  -[PXSearchQueryOptions setWantsCuratedAssetsFetchResult:](v4, "setWantsCuratedAssetsFetchResult:", self->_wantsCuratedAssetsFetchResult);
  -[PXSearchQueryOptions setFilterOptions:](v4, "setFilterOptions:", self->_filterOptions);
  -[PXSearchQueryOptions setWantsWordEmbeddings:](v4, "setWantsWordEmbeddings:", self->_wantsWordEmbeddings);
  -[PXSearchQueryOptions setLibraryScope:](v4, "setLibraryScope:", self->_libraryScope);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXSearchQueryOptions *v4;
  PXSearchQueryOptions *v5;
  unint64_t v6;
  _BOOL4 v7;
  int v8;
  unint64_t v9;
  _BOOL4 v10;
  int v11;
  unint64_t v12;
  _BOOL4 v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;

  v4 = (PXSearchQueryOptions *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXSearchQueryOptions curatedAssetLimit](self, "curatedAssetLimit");
      v7 = v6 == -[PXSearchQueryOptions curatedAssetLimit](v5, "curatedAssetLimit");
      LODWORD(v6) = -[PXSearchQueryOptions wantsLibraryChanges](self, "wantsLibraryChanges");
      v8 = v7 & ~(v6 ^ -[PXSearchQueryOptions wantsLibraryChanges](v5, "wantsLibraryChanges"));
      v9 = -[PXSearchQueryOptions suggestionLimit](self, "suggestionLimit");
      if (v9 != -[PXSearchQueryOptions suggestionLimit](v5, "suggestionLimit"))
        v8 = 0;
      v10 = -[PXSearchQueryOptions wantsCuratedAssetsFetchResult](self, "wantsCuratedAssetsFetchResult");
      v11 = v8 & ~(v10 ^ -[PXSearchQueryOptions wantsCuratedAssetsFetchResult](v5, "wantsCuratedAssetsFetchResult"));
      v12 = -[PXSearchQueryOptions filterOptions](self, "filterOptions");
      if (v12 != -[PXSearchQueryOptions filterOptions](v5, "filterOptions"))
        v11 = 0;
      v13 = -[PXSearchQueryOptions wantsWordEmbeddings](self, "wantsWordEmbeddings");
      v14 = v11 & ~(v13 ^ -[PXSearchQueryOptions wantsWordEmbeddings](v5, "wantsWordEmbeddings"));
      v15 = -[PXSearchQueryOptions libraryScope](self, "libraryScope");
      v16 = -[PXSearchQueryOptions libraryScope](v5, "libraryScope");

      if (v15 == v16)
        v17 = v14;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[PXSearchQueryOptions curatedAssetLimit](self, "curatedAssetLimit");
  v4 = -[PXSearchQueryOptions wantsLibraryChanges](self, "wantsLibraryChanges");
  v5 = v3 ^ -[PXSearchQueryOptions suggestionLimit](self, "suggestionLimit") ^ v4;
  v6 = -[PXSearchQueryOptions wantsCuratedAssetsFetchResult](self, "wantsCuratedAssetsFetchResult");
  v7 = v5 ^ v6 ^ -[PXSearchQueryOptions filterOptions](self, "filterOptions");
  v8 = -[PXSearchQueryOptions wantsWordEmbeddings](self, "wantsWordEmbeddings");
  return v7 ^ v8 ^ -[PXSearchQueryOptions libraryScope](self, "libraryScope");
}

- (id)description
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("curatedAssetLimit: %li, "), self->_curatedAssetLimit);
  if (self->_wantsLibraryChanges)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("wantsLibraryChanges: %@ "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("suggestionLimit: %li, "), self->_suggestionLimit);
  if (self->_wantsCuratedAssetsFetchResult)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("wantsCuratedAssetsFetchResult: %@, "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("filterOptions: %li, "), self->_filterOptions);
  if (self->_wantsWordEmbeddings)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("wantsWordEmbeddings: %@, "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("libraryScope: %li, "), self->_libraryScope);
  return v3;
}

- (unint64_t)curatedAssetLimit
{
  return self->_curatedAssetLimit;
}

- (void)setCuratedAssetLimit:(unint64_t)a3
{
  self->_curatedAssetLimit = a3;
}

- (void)setWantsCuratedAssetsFetchResult:(BOOL)a3
{
  self->_wantsCuratedAssetsFetchResult = a3;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (void)setSuggestionLimit:(unint64_t)a3
{
  self->_suggestionLimit = a3;
}

- (void)setWantsLibraryChanges:(BOOL)a3
{
  self->_wantsLibraryChanges = a3;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (BOOL)wantsWordEmbeddings
{
  return self->_wantsWordEmbeddings;
}

- (void)setWantsWordEmbeddings:(BOOL)a3
{
  self->_wantsWordEmbeddings = a3;
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScope:(unint64_t)a3
{
  self->_libraryScope = a3;
}

@end
