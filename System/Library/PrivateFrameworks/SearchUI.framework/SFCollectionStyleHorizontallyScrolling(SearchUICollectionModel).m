@implementation SFCollectionStyleHorizontallyScrolling(SearchUICollectionModel)

- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;

  v6 = a4;
  v7 = a3;
  +[SearchUISectionModel sectionModelWithScrollingRowModels:numberOfRows:section:](SearchUISectionModel, "sectionModelWithScrollingRowModels:numberOfRows:section:", v7, (int)objc_msgSend(a1, "numberOfRows"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rowModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = v8;
  }
  else
  {
    SearchUIGeneralLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[SFCollectionStyleHorizontallyScrolling(SearchUICollectionModel) searchUISectionModelForCardRowModels:section:expandedCollectionSections:].cold.1(v6, v12);

    v11 = 0;
  }

  return v11;
}

- (void)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "collectionSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_fault_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_FAULT, "failed to generate scrollable card section for %@", (uint8_t *)&v6, 0xCu);

}

@end
