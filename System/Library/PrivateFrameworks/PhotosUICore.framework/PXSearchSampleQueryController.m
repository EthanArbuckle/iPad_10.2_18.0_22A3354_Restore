@implementation PXSearchSampleQueryController

- (PXSearchSampleQueryController)initWithResultsHandler:(id)a3
{
  id v4;
  PXSearchSampleQueryController *v5;
  void *v6;
  id sampleResultsHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSearchSampleQueryController;
  v5 = -[PXSearchSampleQueryController init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    sampleResultsHandler = v5->_sampleResultsHandler;
    v5->_sampleResultsHandler = v6;

  }
  return v5;
}

- (void)performSearch:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXSearchQueryResult *v12;
  PXSearchQueryResult *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v15 = objc_alloc_init(v4);
  +[PXSearchSampleResultsFactory sampleAssetResults](PXSearchSampleResultsFactory, "sampleAssetResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v6);

  +[PXSearchSampleResultsFactory samplePersonResults](PXSearchSampleResultsFactory, "samplePersonResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v7);

  +[PXSearchSampleResultsFactory sampleMemoryResults](PXSearchSampleResultsFactory, "sampleMemoryResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v8);

  +[PXSearchSampleResultsFactory sampleAlbumResults](PXSearchSampleResultsFactory, "sampleAlbumResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v9);

  +[PXSearchSampleResultsFactory samplePlaceResults](PXSearchSampleResultsFactory, "samplePlaceResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v10);

  +[PXSearchSampleResultsFactory sampleSceneResults](PXSearchSampleResultsFactory, "sampleSceneResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v11);

  v12 = [PXSearchQueryResult alloc];
  v13 = -[PXSearchQueryResult initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:](v12, "initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:", v5, v15, MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60]);

  -[PXSearchSampleQueryController sampleResultsHandler](self, "sampleResultsHandler");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, PXSearchQueryResult *))v14)[2](v14, 1, v13);

}

- (id)sampleResultsHandler
{
  return self->_sampleResultsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sampleResultsHandler, 0);
}

@end
