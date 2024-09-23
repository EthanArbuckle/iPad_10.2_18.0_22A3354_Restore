@implementation PLLibraryContentsEnumerator

- (PLLibraryContentsEnumerator)initWithSourceManagedObjectContext:(id)a3 concurrent:(BOOL)a4
{
  id v8;
  PLLibraryContentsEnumerator *v9;
  uint64_t v10;
  NSMutableArray *assetHandlerBlocks;
  uint64_t v12;
  NSMutableArray *albumHandlerBlocks;
  uint64_t v14;
  NSMutableArray *resourceHandlerBlocks;
  uint64_t v16;
  NSMutableArray *conversationHandlerBlocks;
  uint64_t v18;
  NSMutableArray *faceHandlerBlocks;
  uint64_t v20;
  NSMutableArray *personHandlerBlocks;
  uint64_t v22;
  NSMutableArray *endOfListHandlerBlocks;
  void *v25;
  objc_super v26;

  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PLLibraryContentsEnumerator;
  v9 = -[PLLibraryContentsEnumerator init](&v26, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PLLibraryContentsEnumerator.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceContext"));

    }
    objc_storeStrong((id *)&v9->_sourceContext, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    assetHandlerBlocks = v9->_assetHandlerBlocks;
    v9->_assetHandlerBlocks = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    albumHandlerBlocks = v9->_albumHandlerBlocks;
    v9->_albumHandlerBlocks = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    resourceHandlerBlocks = v9->_resourceHandlerBlocks;
    v9->_resourceHandlerBlocks = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    conversationHandlerBlocks = v9->_conversationHandlerBlocks;
    v9->_conversationHandlerBlocks = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    faceHandlerBlocks = v9->_faceHandlerBlocks;
    v9->_faceHandlerBlocks = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    personHandlerBlocks = v9->_personHandlerBlocks;
    v9->_personHandlerBlocks = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    endOfListHandlerBlocks = v9->_endOfListHandlerBlocks;
    v9->_endOfListHandlerBlocks = (NSMutableArray *)v22;

    v9->_concurrent = a4;
  }

  return v9;
}

- (void)addAssetVisitor:(id)a3
{
  NSMutableArray *assetHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetHandler"));

  }
  assetHandlerBlocks = self->_assetHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](assetHandlerBlocks, "addObject:", v6);

}

- (void)addAlbumVisitor:(id)a3
{
  NSMutableArray *albumHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumHandler"));

  }
  albumHandlerBlocks = self->_albumHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](albumHandlerBlocks, "addObject:", v6);

}

- (void)addResourceVisitor:(id)a3
{
  NSMutableArray *resourceHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceHandler"));

  }
  resourceHandlerBlocks = self->_resourceHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](resourceHandlerBlocks, "addObject:", v6);

}

- (void)addConversationVisitor:(id)a3
{
  NSMutableArray *conversationHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conversationHandler"));

  }
  conversationHandlerBlocks = self->_conversationHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](conversationHandlerBlocks, "addObject:", v6);

}

- (void)addFaceVisitor:(id)a3
{
  NSMutableArray *faceHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("faceHandler"));

  }
  faceHandlerBlocks = self->_faceHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](faceHandlerBlocks, "addObject:", v6);

}

- (void)addPersonVisitor:(id)a3
{
  NSMutableArray *personHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personHandler"));

  }
  personHandlerBlocks = self->_personHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](personHandlerBlocks, "addObject:", v6);

}

- (void)addEndOfListVisitor:(id)a3
{
  NSMutableArray *endOfListHandlerBlocks;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryContentsEnumerator.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endOfListHandler"));

  }
  endOfListHandlerBlocks = self->_endOfListHandlerBlocks;
  v6 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](endOfListHandlerBlocks, "addObject:", v6);

}

- (id)_setupAssetResourceFaceController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  NSManagedObjectContext *sourceContext;
  void *v14;
  _BOOL8 concurrent;
  id v16;
  id v17;
  PLEnumerateAndSaveController *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSManagedObjectContext name](self->_sourceContext, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-AssetResourceFaceEnumerator"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("additionalAttributes");
  v24[1] = CFSTR("modernResources");
  v24[2] = CFSTR("detectedFaces");
  v24[3] = CFSTR("extendedAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  -[PLLibraryContentsEnumerator sourceContext](self, "sourceContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionAuthor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  -[NSManagedObjectContext pathManager](sourceContext, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  concurrent = self->_concurrent;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke;
  v21[3] = &unk_1E3672FF8;
  v21[4] = self;
  v22 = v5;
  v23 = v11;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke_2;
  v20[3] = &unk_1E3673020;
  v20[4] = self;
  v16 = v11;
  v17 = v5;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v17, v8, sourceContext, v14, concurrent, 1, v21, 0, v20);

  return v18;
}

- (id)_setupAlbumController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEnumerateAndSaveController *v11;
  NSManagedObjectContext *sourceContext;
  void *v13;
  _BOOL8 concurrent;
  id v15;
  id v16;
  PLEnumerateAndSaveController *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSManagedObjectContext name](self->_sourceContext, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-ManagedAlbumEnumerator"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLLibraryContentsEnumerator sourceContext](self, "sourceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transactionAuthor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  -[NSManagedObjectContext pathManager](sourceContext, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  concurrent = self->_concurrent;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke;
  v20[3] = &unk_1E3672FF8;
  v20[4] = self;
  v21 = v5;
  v22 = v10;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke_2;
  v19[3] = &unk_1E3673048;
  v19[4] = self;
  v15 = v10;
  v16 = v5;
  v17 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v11, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v16, v8, sourceContext, v13, concurrent, 1, v20, 0, v19);

  return v17;
}

- (id)_setupConversationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  NSManagedObjectContext *sourceContext;
  void *v14;
  _BOOL8 concurrent;
  id v16;
  id v17;
  PLEnumerateAndSaveController *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSManagedObjectContext name](self->_sourceContext, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-ConversationEnumerator"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLConversation entityName](PLConversation, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("assets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  -[PLLibraryContentsEnumerator sourceContext](self, "sourceContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionAuthor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  -[NSManagedObjectContext pathManager](sourceContext, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  concurrent = self->_concurrent;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke;
  v21[3] = &unk_1E3672FF8;
  v21[4] = self;
  v22 = v5;
  v23 = v11;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke_2;
  v20[3] = &unk_1E3673070;
  v20[4] = self;
  v16 = v11;
  v17 = v5;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v17, v8, sourceContext, v14, concurrent, 1, v21, 0, v20);

  return v18;
}

- (id)_setupPersonController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  NSManagedObjectContext *sourceContext;
  void *v14;
  _BOOL8 concurrent;
  id v16;
  id v17;
  PLEnumerateAndSaveController *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSManagedObjectContext name](self->_sourceContext, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-PersonEnumerator"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("userFeedbacks");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  -[PLLibraryContentsEnumerator sourceContext](self, "sourceContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionAuthor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  -[NSManagedObjectContext pathManager](sourceContext, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  concurrent = self->_concurrent;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke;
  v21[3] = &unk_1E3672FF8;
  v21[4] = self;
  v22 = v5;
  v23 = v11;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke_2;
  v20[3] = &unk_1E3673098;
  v20[4] = self;
  v16 = v11;
  v17 = v5;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v17, v8, sourceContext, v14, concurrent, 1, v21, 0, v20);

  return v18;
}

- (BOOL)processObjectsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v24;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_conversationHandlerBlocks, "count"))
  {
    -[PLLibraryContentsEnumerator _setupConversationController](self, "_setupConversationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[NSMutableArray count](self->_assetHandlerBlocks, "count")
    || -[NSMutableArray count](self->_resourceHandlerBlocks, "count")
    || -[NSMutableArray count](self->_faceHandlerBlocks, "count"))
  {
    -[PLLibraryContentsEnumerator _setupAssetResourceFaceController](self, "_setupAssetResourceFaceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[NSMutableArray count](self->_albumHandlerBlocks, "count"))
  {
    -[PLLibraryContentsEnumerator _setupAlbumController](self, "_setupAlbumController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_15;
  }
  else
  {
    v7 = 0;
    if (v5)
      goto LABEL_15;
  }
  if (!v6 && !v7)
  {
    LOBYTE(v8) = 1;
    goto LABEL_37;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v11 = 0;
    v10 = 0;
    v8 = 1;
LABEL_19:
    if (v6)
    {
      v31 = v10;
      v8 = objc_msgSend(v6, "processObjectsWithError:", &v31);
      v12 = v31;

      v11 = CFSTR("PLLibraryContentsEnumerator");
      v10 = v12;
    }
    goto LABEL_21;
  }
  v32 = 0;
  v8 = objc_msgSend(v5, "processObjectsWithError:", &v32);
  v10 = v32;
  v11 = CFSTR("PLConversationEnumerator");
  if (v8)
    goto LABEL_19;
LABEL_21:
  v25 = a3;
  if (v8 && v7)
  {
    v30 = v10;
    LOBYTE(v8) = objc_msgSend(v7, "processObjectsWithError:", &v30);
    v13 = v30;

    v24 = CFSTR("PLLibraryContentsAlbumEnumerator");
    v10 = v13;
  }
  else
  {
    v24 = v11;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = self->_endOfListHandlerBlocks;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i) + 16))();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v9);
  v21 = v20;

  PLBackendGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v24;
    v35 = 2048;
    v36 = v21;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "%@ enumerator duration: %g", buf, 0x16u);
  }

  if (v25)
    *v25 = objc_retainAutorelease(v10);

LABEL_37:
  return v8;
}

- (NSManagedObjectContext)sourceContext
{
  return self->_sourceContext;
}

- (BOOL)concurrent
{
  return self->_concurrent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContext, 0);
  objc_storeStrong((id *)&self->_endOfListHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_personHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_faceHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_conversationHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_resourceHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_albumHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_assetHandlerBlocks, 0);
}

id __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(_QWORD *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

id __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(_QWORD *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

id __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(_QWORD *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

id __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(_QWORD *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  id obja;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "modernResources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v43;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(obj);
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v14 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v39;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v39 != v17)
                  objc_enumerationMutation(v14);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v18++) + 16))();
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
            }
            while (v16);
          }

          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v11);
    }

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "detectedFaces");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(obja);
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v23 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v31;
            do
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v31 != v26)
                  objc_enumerationMutation(v23);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v27++) + 16))();
              }
              while (v25 != v27);
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
            }
            while (v25);
          }

          ++v22;
        }
        while (v22 != v20);
        v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      }
      while (v20);
    }

  }
}

@end
