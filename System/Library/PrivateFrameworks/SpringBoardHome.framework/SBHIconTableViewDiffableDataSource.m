@implementation SBHIconTableViewDiffableDataSource

- (SBHIconLibraryQueryResult)queryResult
{
  return self->_queryResult;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v4;

  if (-[SBHIconLibraryQueryResult sortMethodology](self->_queryResult, "sortMethodology", a3) == 1)
  {
    v4 = -[SBHIconLibraryQueryResult totalNumberOfItems](self->_queryResult, "totalNumberOfItems");
    if (v4)
    {
      -[SBHIconLibraryQueryResult sectionIndexTitles](self->_queryResult, "sectionIndexTitles");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return -[SBHIconLibraryQueryResult indexOfSectionForSectionIndexTitleAtIndex:](self->_queryResult, "indexOfSectionForSectionIndexTitleAtIndex:", a5, a4);
}

- (void)applyQueryResult:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  SBHIconLibraryQueryResult *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SBHIconLibraryQueryResult *queryResult;
  SBHIconLibraryQueryResult *v20;
  void *v21;

  v6 = a4;
  v8 = (SBHIconLibraryQueryResult *)a3;
  v9 = (void *)MEMORY[0x1E0CB3978];
  v10 = a5;
  if ((objc_msgSend(v9, "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  queryResult = self->_queryResult;
  self->_queryResult = v8;
  v20 = v8;

  -[SBHIconLibraryQueryResult snapshot](v20, "snapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconTableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](self, "applySnapshot:animatingDifferences:completion:", v21, v6, v10);
}

- (void)applyQueryResult:(id)a3 animatingDifferences:(BOOL)a4
{
  _BOOL8 v4;
  SBHIconLibraryQueryResult *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SBHIconLibraryQueryResult *queryResult;
  SBHIconLibraryQueryResult *v16;
  void *v17;

  v4 = a4;
  v6 = (SBHIconLibraryQueryResult *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  queryResult = self->_queryResult;
  self->_queryResult = v6;
  v16 = v6;

  -[SBHIconLibraryQueryResult snapshot](v16, "snapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self, "applySnapshot:animatingDifferences:", v17, v4);
}

- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  v18.receiver = self;
  v18.super_class = (Class)SBHIconTableViewDiffableDataSource;
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](&v18, sel_applySnapshot_animatingDifferences_completion_, v8, v6, v9);

}

- (SBHTableViewIconLibrary)iconLibrary
{
  return self->_iconLibrary;
}

- (void)setIconLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_iconLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconLibrary, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
}

- (void)applyQueryResult:(uint64_t)a3 animatingDifferences:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CFEF3000, a1, a3, "Library search updates should always be on the main thread (see 62531922)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

@end
