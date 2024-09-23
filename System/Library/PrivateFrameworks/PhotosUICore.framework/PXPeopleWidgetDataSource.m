@implementation PXPeopleWidgetDataSource

- (PXPeopleWidgetDataSource)initWithPhotoLibrary:(id)a3 name:(id)a4 objectsReloadBlock:(id)a5
{
  id v9;
  PXPeopleWidgetDataSource *v10;
  PXPeopleWidgetDataSource *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *fetchQueue;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleWidgetDataSource;
  v10 = -[PXPeopleDataSource initWithName:objectsReloadBlock:asynchronousLoad:callbackDelegate:](&v16, sel_initWithName_objectsReloadBlock_asynchronousLoad_callbackDelegate_, a4, a5, 1, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.photos.peopleWidgetFetchQueue", v12);
    fetchQueue = v11->_fetchQueue;
    v11->_fetchQueue = (OS_dispatch_queue *)v13;

    v11->_prefetchingStarted = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPeopleWidgetDataSource stopListeningForChanges](self, "stopListeningForChanges");
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleWidgetDataSource;
  -[PXPeopleDataSource dealloc](&v3, sel_dealloc);
}

- (void)startListeningForChanges
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_imageCacheDidChanged_, CFSTR("PXPeopleFaceCropManagerDidInvalidateCacheNotification"), v4);

  -[PXPeopleWidgetDataSource photoLibrary](self, "photoLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerChangeObserver:", self);

}

- (void)stopListeningForChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PXPeopleWidgetDataSource photoLibrary](self, "photoLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterChangeObserver:", self);

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXPeopleDataSource objects](self, "objects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "fetchResultAfterChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDataSource setObjects:](self, "setObjects:", v6);
    -[PXPeopleWidgetDataSource loadMembersWithCompletionBlock:](self, "loadMembersWithCompletionBlock:", 0);

  }
}

- (void)imageCacheDidChanged:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(void *, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void);
  void *v19;
  id v20;
  id v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD aBlock[4];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXPeopleWidgetDataSource_imageCacheDidChanged___block_invoke;
  aBlock[3] = &unk_1E512A460;
  v20 = v4;
  v33 = v20;
  v34 = &v35;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXPeopleDataSource members](self, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    v9 = 0x1E0CD1000uLL;
LABEL_3:
    v10 = 0;
    v23 = v7;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5[2](v5, v11);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v8;
          v13 = v9;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v14 = v11;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v39, 16, v20);
          if (v15)
          {
            v16 = *(_QWORD *)v25;
LABEL_11:
            v17 = 0;
            while (1)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v14);
              v5[2](v5, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17));
              if (*((_BYTE *)v36 + 24))
                break;
              if (v15 == ++v17)
              {
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
                if (v15)
                  goto LABEL_11;
                break;
              }
            }
          }

          v9 = v13;
          v8 = v12;
          v7 = v23;
        }
      }
      if (*((_BYTE *)v36 + 24))
        break;
      if (++v10 == v7)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  if (*((_BYTE *)v36 + 24))
  {
    -[PXPeopleDataSource reloadBlock](self, "reloadBlock");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDataSource setObjects:](self, "setObjects:", v19);

    -[PXPeopleWidgetDataSource loadMembersWithCompletionBlock:](self, "loadMembersWithCompletionBlock:", 0);
  }

  _Block_object_dispose(&v35, 8);
}

- (id)titleAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PXPeopleDataSource memberAtIndex:](self, "memberAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v12 = objc_opt_class();
          if (v12 == objc_opt_class() || !objc_msgSend(v11, "length", (_QWORD)v20))
          {
            objc_msgSend(v5, "removeAllObjects", (_QWORD)v20);
            goto LABEL_17;
          }
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v14);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_17:

    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = &stru_1E5149688;
      if (v15)
        v17 = (__CFString *)v15;
      v18 = v17;

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (void)prefetchThumbnailsForTargetSize:(CGSize)a3 displayScale:(double)a4 maxFetchCount:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  NSObject *fetchQueue;
  _QWORD block[9];

  height = a3.height;
  width = a3.width;
  if (!-[PXPeopleWidgetDataSource prefetchingStarted](self, "prefetchingStarted"))
  {
    -[PXPeopleWidgetDataSource setPrefetchingStarted:](self, "setPrefetchingStarted:", 1);
    fetchQueue = self->_fetchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PXPeopleWidgetDataSource_prefetchThumbnailsForTargetSize_displayScale_maxFetchCount___block_invoke;
    block[3] = &unk_1E51490B0;
    block[4] = self;
    *(double *)&block[5] = a4;
    *(CGFloat *)&block[6] = width;
    *(CGFloat *)&block[7] = height;
    block[8] = a5;
    dispatch_async(fetchQueue, block);
  }
}

- (void)loadMembersWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *fetchQueue;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[PXPeopleDataSource objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    fetchQueue = self->_fetchQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E5145688;
    v10[4] = self;
    v11 = v6;
    v12 = v4;
    dispatch_async(fetchQueue, v10);

    v8 = v11;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    objc_msgSend(off_1E50B4758, "sharedScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke;
    v13[3] = &unk_1E5148A40;
    v14 = v4;
    objc_msgSend(v9, "dispatchInMainTransaction:", v13);

    v8 = v14;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_socialGroupsForPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleWidgetDataSource photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleWidgetDataSource context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXPeopleWidgetDataSource context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "people");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(v5, "allSocialGroupsForMemberLocalIdentifier:options:error:", v10, 0, &v36);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v36;

    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    if (!v11)
      goto LABEL_20;
  }
  else
  {
    v35 = 0;
    objc_msgSend(v5, "socialGroupsOverlappingMemberLocalIdentifiers:error:", v4, &v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v35;
    if (!v11)
      goto LABEL_20;
  }
  if (objc_msgSend(v11, "count"))
  {
    v29 = (id)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v11;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v14)
    {
      v15 = v14;
      v27 = v12;
      v28 = v4;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v18, "count") >= 2 && (unint64_t)objc_msgSend(v18, "count") <= 9)
          {
            objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v5, 0);
            v19 = v5;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setIncludedDetectionTypes:", v21);

            objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v18, v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "fetchedObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __67__PXPeopleWidgetDataSource__socialGroupsForPersonLocalIdentifiers___block_invoke_2;
            v30[3] = &unk_1E512D3D8;
            v30[4] = v18;
            objc_msgSend(v23, "sortedArrayUsingComparator:", v30);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v24);

            v5 = v19;
          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v15);
      v4 = v28;
      v12 = v27;
    }
    goto LABEL_24;
  }
LABEL_20:
  if (!v12)
  {
    v29 = 0;
    goto LABEL_26;
  }
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v25;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Error: Cannot get social groups (%@)", buf, 0xCu);

  }
  v29 = 0;
LABEL_24:

LABEL_26:
  return v29;
}

- (BOOL)containsSocialGroups
{
  return self->_containsSocialGroups;
}

- (void)setContainsSocialGroups:(BOOL)a3
{
  self->_containsSocialGroups = a3;
}

- (PXPeopleDetailsContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)isForOneUp
{
  return self->_isForOneUp;
}

- (void)setIsForOneUp:(BOOL)a3
{
  self->_isForOneUp = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)prefetchingStarted
{
  return self->_prefetchingStarted;
}

- (void)setPrefetchingStarted:(BOOL)a3
{
  self->_prefetchingStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
}

uint64_t __67__PXPeopleWidgetDataSource__socialGroupsForPersonLocalIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return v8 > v11;
}

uint64_t __67__PXPeopleWidgetDataSource__socialGroupsForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isForOneUp");
  v3 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PXPeopleWidgetUtilities verifiedPersonsFromMergeCandidatesForPersons:](PXPeopleWidgetUtilities, "verifiedPersonsFromMergeCandidatesForPersons:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "mutableCopy");

  }
  v6 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_155);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v16 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v17 = MEMORY[0x1E0C809B0];
  if (v16 || (objc_msgSend(*(id *)(a1 + 32), "isForOneUp") & 1) != 0 || !objc_msgSend(v6, "count"))
  {
    v39 = 0;
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "_socialGroupsForPersonLocalIdentifiers:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t)v18;
  if (v18)
  {
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v15, "addObjectsFromArray:", v19);
      v20 = (void *)v19;
      v21 = v17;
      v22 = (void *)MEMORY[0x1E0CB3880];
      v42[0] = v21;
      v42[1] = 3221225472;
      v42[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_4;
      v42[3] = &unk_1E512A508;
      v39 = v20;
      v43 = v39;
      objc_msgSend(v22, "predicateWithBlock:", v42);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPeopleWidgetUtilities widgetOrderedMembersFromSortedArray:inSocialGroupPredicate:maximumNumberOfMembersNotInSocialGroupForFront:](PXPeopleWidgetUtilities, "widgetOrderedMembersFromSortedArray:inSocialGroupPredicate:maximumNumberOfMembersNotInSocialGroupForFront:", v14, v23, 4);
      v24 = objc_claimAutoreleasedReturnValue();

      v17 = v21;
      v19 = 1;
      v14 = (void *)v24;
      goto LABEL_19;
    }
    v39 = (id)v19;
    goto LABEL_18;
  }
  v39 = 0;
LABEL_19:
  objc_msgSend(v15, "addObjectsFromArray:", v14);
  objc_msgSend(*(id *)(a1 + 32), "filterPredicate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v15, "filterUsingPredicate:", v25);
  if (v16)
  {
    v26 = v15;
  }
  else
  {
    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "useMockSocialGroupData");

    if (v28)
    {
      v38 = v14;
      v29 = (void *)MEMORY[0x1E0CD1570];
      objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fetchOptionsWithPhotoLibrary:orObject:", v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "setFetchLimit:", 9);
      objc_msgSend(v31, "setPersonContext:", 1);
      +[PXPeopleUtilities sortDescriptorsForManualSort](PXPeopleUtilities, "sortDescriptorsForManualSort");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSortDescriptors:", v32);

      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fetchedObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v34, "count"))
      {
        v35 = 0;
        do
        {
          objc_msgSend(v34, "subarrayWithRange:", 0, ++v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v36);

        }
        while (v35 < objc_msgSend(v34, "count"));
      }

      v19 = 1;
      v14 = v38;
    }
    else
    {
      v26 = v15;
    }
    v17 = MEMORY[0x1E0C809B0];
  }
  objc_msgSend(*(id *)(a1 + 32), "setContainsSocialGroups:", v19);
  objc_msgSend(*(id *)(a1 + 32), "setMembers:", v26);
  objc_msgSend(off_1E50B4758, "sharedScheduler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v17;
  v40[1] = 3221225472;
  v40[2] = __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_5;
  v40[3] = &unk_1E5148CE0;
  v40[4] = *(_QWORD *)(a1 + 32);
  v41 = *(id *)(a1 + 48);
  objc_msgSend(v37, "dispatchInMainTransaction:", v40);

}

uint64_t __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "containsObject:", v3, (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleDataSourceMembersChanged:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);

}

uint64_t __59__PXPeopleWidgetDataSource_loadMembersWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 && !v9)
    goto LABEL_6;
  if (!v7 && v9)
  {
LABEL_8:
    v12 = 1;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v4, "faceCount");
  v11 = objc_msgSend(v5, "faceCount");
  if (v10 <= v11)
  {
    if (v10 >= v11)
    {
      objc_msgSend(v4, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "compare:", v15);

      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_6:
  v12 = -1;
LABEL_9:

  return v12;
}

void __87__PXPeopleWidgetDataSource_prefetchThumbnailsForTargetSize_displayScale_maxFetchCount___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PXPeopleFaceCropFetchOptions *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 40);
  if (v3 < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3 = v5;

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v14 = 0;
    v9 = *(_QWORD *)v16;
LABEL_5:
    v10 = 0;
    v11 = v14 + 1;
    v14 += v8;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, *(double *)(a1 + 48), *(double *)(a1 + 56), v3);
        objc_msgSend(v2, "requestFaceCropForOptions:resultHandler:", v13, &__block_literal_global_126618);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          +[PXPeopleSocialGroupViewGenerator prefetchForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "prefetchForSocialGroup:withSize:displayScale:", v12, *(double *)(a1 + 48), *(double *)(a1 + 56), v3);
      }
      if ((unint64_t)(v11 + v10) >= *(_QWORD *)(a1 + 64))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

void __49__PXPeopleWidgetDataSource_imageCacheDidChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

  if ((_DWORD)v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

@end
