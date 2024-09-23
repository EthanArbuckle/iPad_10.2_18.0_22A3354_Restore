@implementation PXSharedAlbumActivityGadgetProvider

- (PXSharedAlbumActivityGadgetProvider)init
{
  PXSharedAlbumActivityGadgetProvider *v2;
  void *v3;
  int v4;
  PXFeedSectionInfosManager *v5;
  void *v6;
  uint64_t v7;
  PXFeedSectionInfosManager *feedSectionInfosManager;
  uint64_t v9;
  int64_t maxNumberOfSections;
  NSMutableArray *v11;
  NSMutableArray *delayedChanges;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXSharedAlbumActivityGadgetProvider;
  v2 = -[PXGadgetProvider init](&v14, sel_init);
  if (v2)
  {
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "useMockData");

    v5 = [PXFeedSectionInfosManager alloc];
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v7 = -[PXFeedSectionInfosManager initWithPhotoLibraryForTesting:filter:](v5, "initWithPhotoLibraryForTesting:filter:", v6, 3);
    else
      v7 = -[PXFeedSectionInfosManager initWithPhotoLibrary:configurationBlock:](v5, "initWithPhotoLibrary:configurationBlock:", v6, &__block_literal_global_236313);
    feedSectionInfosManager = v2->_feedSectionInfosManager;
    v2->_feedSectionInfosManager = (PXFeedSectionInfosManager *)v7;

    v2->_maxNumberOfSections = 8;
    v9 = -[PXFeedSectionInfosManager numberOfInvitationsReceived](v2->_feedSectionInfosManager, "numberOfInvitationsReceived");
    maxNumberOfSections = -[PXFeedSectionInfosManager numberOfSectionInfos](v2->_feedSectionInfosManager, "numberOfSectionInfos")- v9;
    if (maxNumberOfSections >= v2->_maxNumberOfSections)
      maxNumberOfSections = v2->_maxNumberOfSections;
    v2->_estimatedGadgetCount = maxNumberOfSections + v9;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    delayedChanges = v2->_delayedChanges;
    v2->_delayedChanges = v11;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PXFeedSectionInfosManager setDelegate:](self->_feedSectionInfosManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumActivityGadgetProvider;
  -[PXSharedAlbumActivityGadgetProvider dealloc](&v3, sel_dealloc);
}

- (void)loadDataForGadgets
{
  void *v3;
  uint64_t v4;

  +[PXSharedAlbumActivityGadget preloadResources](PXSharedAlbumActivityGadget, "preloadResources");
  -[PXSharedAlbumActivityGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfInvitationsReceived");

  if (v4 >= 1)
    +[PXSharedAlbumInvitationGadget preloadResources](PXSharedAlbumInvitationGadget, "preloadResources");
}

- (void)generateGadgets
{
  id v3;

  -[PXSharedAlbumActivityGadgetProvider _update:](self, "_update:", 0);
  -[PXSharedAlbumActivityGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

}

- (void)gadget:(id)a3 didAccept:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[PXSharedAlbumActivityGadgetProvider invitationAlbumCloudGUID](self, "invitationAlbumCloudGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v6, "invitationSectionInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sharedAlbum");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudGUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedAlbumActivityGadgetProvider setInvitationAlbumCloudGUID:](self, "setInvitationAlbumCloudGUID:", v10);

      v11 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__PXSharedAlbumActivityGadgetProvider_gadget_didAccept___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);

    }
  }

}

- (void)feedSectionInfosManager:(id)a3 sectionInfosDidChange:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[PXSharedAlbumActivityGadgetProvider invitationAlbumCloudGUID](self, "invitationAlbumCloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXSharedAlbumActivityGadgetProvider delayedChanges](self, "delayedChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    -[PXSharedAlbumActivityGadgetProvider _processDelayedChangesImmediatelyIfNecessary:](self, "_processDelayedChangesImmediatelyIfNecessary:", v7);
  }
  else
  {
    -[PXSharedAlbumActivityGadgetProvider _update:](self, "_update:", v7);
  }

}

- (void)_processDelayedChanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXSharedAlbumActivityGadgetProvider setInvitationAlbumCloudGUID:](self, "setInvitationAlbumCloudGUID:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PXSharedAlbumActivityGadgetProvider delayedChanges](self, "delayedChanges", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[PXSharedAlbumActivityGadgetProvider _update:](self, "_update:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[PXSharedAlbumActivityGadgetProvider delayedChanges](self, "delayedChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_processDelayedChangesImmediatelyIfNecessary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXSharedAlbumActivityGadgetProvider _indexesOfSectionInfosToDisplay:](self, "_indexesOfSectionInfosToDisplay:", -[PXSharedAlbumActivityGadgetProvider maxNumberOfSections](self, "maxNumberOfSections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_msgSend(v5, "shouldReload") & 1) != 0 || !objc_msgSend(v4, "count"))
    -[PXSharedAlbumActivityGadgetProvider _processDelayedChanges](self, "_processDelayedChanges");

}

- (unint64_t)_indexForGadget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PXSharedAlbumActivityGadgetProvider__indexForGadget___block_invoke;
  v9[3] = &unk_1E513B3A0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_indexesOfSectionInfosToDisplay:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[PXSharedAlbumActivityGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSectionInfos");

  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v6 >= 1 && a3)
  {
    v8 = 0;
    do
    {
      -[PXSharedAlbumActivityGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sectionInfoAtIndex:", v6 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "reload");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v10, "numberOfItems"))
        {
          objc_msgSend(v7, "addIndex:", v6 - 1);
          if (objc_msgSend(v10, "sectionType") != 2)
            ++v8;
        }
      }

      if ((unint64_t)v6 < 2)
        break;
      --v6;
    }
    while (v8 < a3);
  }
  return v7;
}

- (id)_gadgetsForSectionIndexes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  PXSharedAlbumActivityGadgetProvider *v15;
  SEL v16;

  v5 = a3;
  -[PXSharedAlbumActivityGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PXSharedAlbumActivityGadgetProvider__gadgetsForSectionIndexes___block_invoke;
  v12[3] = &unk_1E513B3C8;
  v13 = v6;
  v8 = v7;
  v15 = self;
  v16 = a2;
  v14 = v8;
  v9 = v6;
  objc_msgSend(v5, "enumerateIndexesWithOptions:usingBlock:", 2, v12);

  v10 = v8;
  return v10;
}

- (void)_update:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  PXSharedAlbumActivityGadgetProvider *v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  id obja;
  _QWORD v49[4];
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSharedAlbumActivityGadgetProvider _indexesOfSectionInfosToDisplay:](self, "_indexesOfSectionInfosToDisplay:", -[PXSharedAlbumActivityGadgetProvider maxNumberOfSections](self, "maxNumberOfSections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "shouldReload") & 1) == 0 && objc_msgSend(v5, "count"))
  {
    v42 = v4;
    -[PXSharedAlbumActivityGadgetProvider feedSectionInfosManager](self, "feedSectionInfosManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetProvider gadgets](self, "gadgets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = self;
    v41 = v5;
    -[PXSharedAlbumActivityGadgetProvider _gadgetsForSectionIndexes:](self, "_gadgetsForSectionIndexes:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("uniqueGadgetIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v8;
    objc_msgSend(v8, "valueForKey:", CFSTR("uniqueGadgetIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v65 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v16, "uniqueGadgetIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v10, "containsObject:", v17);

          if ((v18 & 1) == 0)
            objc_msgSend(v46, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v46, "count"))
    {
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke_2;
      v62[3] = &unk_1E5145360;
      v63 = v46;
      -[PXGadgetProvider performChanges:](v43, "performChanges:", v62);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v19 = obj;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    obja = v19;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v59 != v22)
            objc_enumerationMutation(obja);
          v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_msgSend(v24, "uniqueGadgetIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v9, "containsObject:", v25);

          if ((v26 & 1) == 0)
            objc_msgSend(v45, "addObject:", v24);
        }
        v19 = obja;
        v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v45, "count"))
    {
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke_3;
      v56[3] = &unk_1E5145360;
      v57 = v45;
      -[PXGadgetProvider performChanges:](v43, "performChanges:", v56);

    }
    -[PXGadgetProvider gadgets](v43, "gadgets");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v42;
    objc_msgSend(v42, "updatedIndexes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v42, "sectionInfosWithCommentChanges");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v53 != v34)
            objc_enumerationMutation(v31);
          v36 = objc_msgSend(v6, "indexOfSectionInfo:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k));
          if ((objc_msgSend(v28, "containsIndex:", v36) & 1) == 0)
            objc_msgSend(v28, "addIndex:", v36);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
      }
      while (v33);
    }

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke_4;
    v49[3] = &unk_1E51460E8;
    v50 = v6;
    v51 = v44;
    v37 = v44;
    v38 = v6;
    objc_msgSend(v28, "enumerateIndexesUsingBlock:", v49);

    v5 = v41;
    v39 = obja;
  }
  else
  {
    -[PXSharedAlbumActivityGadgetProvider _gadgetsForSectionIndexes:](self, "_gadgetsForSectionIndexes:", v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke;
    v68[3] = &unk_1E5145360;
    v69 = v40;
    v39 = v40;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v68);
    v9 = v69;
  }

}

- (PXFeedSectionInfosManager)feedSectionInfosManager
{
  return self->_feedSectionInfosManager;
}

- (void)setFeedSectionInfosManager:(id)a3
{
  objc_storeStrong((id *)&self->_feedSectionInfosManager, a3);
}

- (unint64_t)estimatedGadgetCount
{
  return self->_estimatedGadgetCount;
}

- (void)setEstimatedGadgetCount:(unint64_t)a3
{
  self->_estimatedGadgetCount = a3;
}

- (NSString)invitationAlbumCloudGUID
{
  return self->_invitationAlbumCloudGUID;
}

- (void)setInvitationAlbumCloudGUID:(id)a3
{
  objc_storeStrong((id *)&self->_invitationAlbumCloudGUID, a3);
}

- (NSMutableArray)delayedChanges
{
  return self->_delayedChanges;
}

- (void)setDelayedChanges:(id)a3
{
  objc_storeStrong((id *)&self->_delayedChanges, a3);
}

- (int64_t)maxNumberOfSections
{
  return self->_maxNumberOfSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedChanges, 0);
  objc_storeStrong((id *)&self->_invitationAlbumCloudGUID, 0);
  objc_storeStrong((id *)&self->_feedSectionInfosManager, 0);
}

void __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeAllGadgets");
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v3, "addGadgets:", *(_QWORD *)(a1 + 32));

}

uint64_t __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeGadgets:", *(_QWORD *)(a1 + 32));
}

uint64_t __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addGadgets:", *(_QWORD *)(a1 + 32));
}

void __47__PXSharedAlbumActivityGadgetProvider__update___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sectionInfoAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "uniqueGadgetIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "setInvitationSectionInfo:", v3);
          else
            objc_msgSend(v9, "setAssetsSectionInfo:", v3);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __65__PXSharedAlbumActivityGadgetProvider__gadgetsForSectionIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  BOOL v4;
  PXSharedAlbumActivityGadget *v5;
  PXSharedAlbumActivityGadget *v6;
  PXSharedAlbumInvitationGadget *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "sectionInfoAtIndex:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "sectionType");
  if (v3)
    v4 = v3 == 3;
  else
    v4 = 1;
  if (v4)
  {
    v5 = objc_alloc_init(PXSharedAlbumActivityGadget);
    -[PXSharedAlbumActivityGadget setAssetsSectionInfo:](v5, "setAssetsSectionInfo:", v9);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else
  {
    if (v3 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("PXSharedAlbumActivityGadgetProvider.m"), 217, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v9, "sharedAlbum");
    v6 = (PXSharedAlbumActivityGadget *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v6
      && -[PXSharedAlbumActivityGadget cloudRelationshipStateValue](v6, "cloudRelationshipStateValue") == 1)
    {
      v7 = objc_alloc_init(PXSharedAlbumInvitationGadget);
      -[PXSharedAlbumInvitationGadget setInvitationSectionInfo:](v7, "setInvitationSectionInfo:", v9);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

    }
  }

}

uint64_t __55__PXSharedAlbumActivityGadgetProvider__indexForGadget___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t __56__PXSharedAlbumActivityGadgetProvider_gadget_didAccept___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDelayedChanges");
}

uint64_t __43__PXSharedAlbumActivityGadgetProvider_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEntryFilter:", 3);
}

@end
