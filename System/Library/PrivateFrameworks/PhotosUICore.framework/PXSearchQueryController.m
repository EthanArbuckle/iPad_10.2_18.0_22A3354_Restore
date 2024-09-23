@implementation PXSearchQueryController

- (PXSearchQueryController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryController.m"), 36, CFSTR("%s is not available as initializer"), "-[PXSearchQueryController init]");

  abort();
}

- (PXSearchQueryController)initWithPhotoLibrary:(id)a3 requestSceneAncestryInformation:(BOOL)a4 resultsHandler:(id)a5
{
  id v10;
  id v11;
  PXSearchQueryController *v12;
  PXSearchQueryController *v13;
  void *v14;
  id resultsHandler;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXSearchQueryController;
  v12 = -[PXSearchQueryController init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    v13->_requestSceneAncestryInformation = a4;
    v14 = _Block_copy(v11);
    resultsHandler = v13->_resultsHandler;
    v13->_resultsHandler = v14;

    -[PXSearchQueryController _openQueryConnectionToPSISearchIndex](v13, "_openQueryConnectionToPSISearchIndex");
  }

  return v13;
}

- (void)_openQueryConnectionToPSISearchIndex
{
  void *v4;
  void *v5;
  void *v6;
  PXSearchQueryExecutor *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  PXSearchQueryExecutor *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryController.m"), 62, CFSTR("Expected main thread"));

  }
  -[PXSearchQueryController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "psiSearchIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXSearchQueryController setPsiSearchIndex:](self, "setPsiSearchIndex:", v6);
    v7 = [PXSearchQueryExecutor alloc];
    -[PXSearchQueryController photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXSearchQueryController requestSceneAncestryInformation](self, "requestSceneAncestryInformation");
    -[PXSearchQueryController resultsHandler](self, "resultsHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSearchQueryExecutor initWithPhotoLibrary:requestSceneAncestryInformation:resultsHandler:](v7, "initWithPhotoLibrary:requestSceneAncestryInformation:resultsHandler:", v8, v9, v10);
    -[PXSearchQueryController setSearchQueryExecutor:](self, "setSearchQueryExecutor:", v11);

    -[PXSearchQueryController currentSearchQuery](self, "currentSearchQuery");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      PLSearchUIQueryGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "Executing deferred query: %@", (uint8_t *)&v15, 0xCu);
      }

      -[PXSearchQueryController _performSearch:retry:](self, "_performSearch:retry:", v12, 1);
    }
  }
  else
  {
    PLSearchUIQueryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Connection to PSIDatabase not yet available, unable to execute search queries", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)performSearch:(id)a3
{
  -[PXSearchQueryController _performSearch:retry:](self, "_performSearch:retry:", a3, 0);
}

- (void)_performSearch:(id)a3 retry:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryController.m"), 90, CFSTR("Expected main thread"));

  }
  -[PXSearchQueryController psiSearchIndex](self, "psiSearchIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXSearchQueryController currentSearchQuery](self, "currentSearchQuery");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == v7)
      v11 = 1;
    else
      v11 = objc_msgSend(v9, "isEqual:", v7);

    if (!v11 || v4)
    {
      -[PXSearchQueryController setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v7);
      PLSearchUIQueryGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v7;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_INFO, "Photos Search Query Controller: Search index is available to perform query %@, query will be executed", (uint8_t *)&v20, 0xCu);
      }

      -[PXSearchQueryController searchQueryExecutor](self, "searchQueryExecutor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryController.m"), 113, CFSTR("Photos Search Query Controller: search executor was not initialized after opening the search index - search queries cannot be performed."));

      }
      -[PXSearchQueryController searchQueryExecutor](self, "searchQueryExecutor");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject executeSearchQuery:](v15, "executeSearchQuery:", v7);
    }
    else
    {
      PLSearchUIQueryGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v7;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_INFO, "Photos Search Query Controller: Redundant search query requested, ignoring request to perform query: %@", (uint8_t *)&v20, 0xCu);
      }
    }

  }
  else
  {
    -[PXSearchQueryController setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v7);
    PLSearchUIQueryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Unable to execute search query: %@, search index does not yet exist", (uint8_t *)&v20, 0xCu);
    }

    -[PXSearchQueryController resultsHandler](self, "resultsHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14 = -[PXSearchQueryResult initEmptySearchQueryResultForQuery:]([PXSearchQueryResult alloc], "initEmptySearchQueryResultForQuery:", v7);
    ((void (**)(_QWORD, uint64_t, id))v13)[2](v13, 3, v14);

    -[PXSearchQueryController _openQueryConnectionToPSISearchIndex](self, "_openQueryConnectionToPSISearchIndex");
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (PSIDatabase)psiSearchIndex
{
  return self->_psiSearchIndex;
}

- (void)setPsiSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_psiSearchIndex, a3);
}

- (PXSearchQueryExecutor)searchQueryExecutor
{
  return self->_searchQueryExecutor;
}

- (void)setSearchQueryExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueryExecutor, a3);
}

- (PXSearchQuery)currentSearchQuery
{
  return self->_currentSearchQuery;
}

- (void)setCurrentSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchQuery, a3);
}

- (BOOL)requestSceneAncestryInformation
{
  return self->_requestSceneAncestryInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
  objc_storeStrong((id *)&self->_searchQueryExecutor, 0);
  objc_storeStrong((id *)&self->_psiSearchIndex, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
