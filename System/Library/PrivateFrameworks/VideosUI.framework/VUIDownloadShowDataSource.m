@implementation VUIDownloadShowDataSource

- (VUIDownloadShowDataSource)initWithMediaEntity:(id)a3
{
  id v5;
  void *v6;
  VUIDownloadShowDataSource *v7;
  objc_super v9;

  v5 = a3;
  -[VUIDownloadShowDataSource fetchRequestForMediaEntity:](self, "fetchRequestForMediaEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadShowDataSource;
  v7 = -[VUIMediaEntitiesDataSource initWithFetchRequest:](&v9, sel_initWithFetchRequest_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_showEntity, a3);

  return v7;
}

- (id)fetchRequestForMediaEntity:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "showIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityFetchRequest episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)startFetch
{
  VUIMediaEntitiesFetchController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VUIMediaEntitiesFetchController *v8;
  VUIMediaEntitiesFetchController *fetchController;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = [VUIMediaEntitiesFetchController alloc];
  -[VUIDownloadShowDataSource showEntity](self, "showEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntitiesDataSource fetchRequest](self, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIMediaEntitiesFetchController initWithMediaLibrary:fetchRequests:](v3, "initWithMediaLibrary:fetchRequests:", v5, v7);
  fetchController = self->_fetchController;
  self->_fetchController = v8;

  -[VUIMediaEntitiesFetchController setDelegate:](self->_fetchController, "setDelegate:", self);
  -[VUIMediaLibraryFetchController setLogNameSuffix:](self->_fetchController, "setLogNameSuffix:", CFSTR("ShowDownloaded"));
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "aggregateMediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addFetchController:", self->_fetchController);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_fetchController)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aggregateMediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFetchController:", self->_fetchController);

    -[VUIMediaEntitiesFetchController setDelegate:](self->_fetchController, "setDelegate:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadShowDataSource;
  -[VUIDownloadShowDataSource dealloc](&v6, sel_dealloc);
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD *v18;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "fetchResponses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "grouping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__VUIDownloadShowDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke;
  v24[3] = &unk_1E9FA40F8;
  v16 = v14;
  v25 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v24);
  v17 = (void *)objc_msgSend(v16, "copy");
  -[VUIMediaEntitiesDataSource setGrouping:](self, "setGrouping:", v17);

  -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 1);
  objc_initWeak(&location, self);
  v19[0] = v15;
  v19[1] = 3221225472;
  v20 = __76__VUIDownloadShowDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke_3;
  v21 = &unk_1E9F99C98;
  objc_copyWeak(&v22, &location);
  v18 = v19;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v20((uint64_t)v18);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __76__VUIDownloadShowDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "mediaEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__VUIDownloadShowDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke_2;
  v7[3] = &unk_1E9F9A730;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __76__VUIDownloadShowDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "assetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
    objc_msgSend(v3, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "status"))
    {

    }
    else
    {
      if (objc_msgSend(v4, "markedAsDeleted"))
      {

        goto LABEL_8;
      }
      objc_msgSend(v4, "downloadExpirationDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
LABEL_8:

  }
}

void __76__VUIDownloadShowDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", MEMORY[0x1E0C9AA60]);
  -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 1);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __71__VUIDownloadShowDataSource_controller_fetchRequests_didFailWithError___block_invoke;
  v15 = &unk_1E9F99C98;
  objc_copyWeak(&v16, &location);
  v11 = &v12;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v12, v13))
    v14((uint64_t)v11);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __71__VUIDownloadShowDataSource_controller_fetchRequests_didFailWithError___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (VUIMediaEntity)showEntity
{
  return self->_showEntity;
}

- (void)setShowEntity:(id)a3
{
  objc_storeStrong((id *)&self->_showEntity, a3);
}

- (VUIMediaEntitiesFetchController)fetchController
{
  return self->_fetchController;
}

- (void)setFetchController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_showEntity, 0);
}

@end
