@implementation PXPlacesPhotoAssetsStore

- (PXPlacesPhotoAssetsStore)initWithFetchResults:(id)a3
{
  id v5;
  PXPlacesPhotoAssetsStore *v6;
  PXPlacesPhotoAssetsStore *v7;
  PXPlacesStore *v8;
  PXPlacesStore *store;
  NSMutableArray *v10;
  NSMutableArray *completions;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXPlacesPhotoAssetsStore;
  v6 = -[PXPlacesPhotoAssetsStore init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchResults, a3);
    v8 = objc_alloc_init(PXPlacesStore);
    store = v7->_store;
    v7->_store = v8;

    *(_WORD *)&v7->_didInitiateLoad = 0;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completions = v7->_completions;
    v7->_completions = v10;

    v12 = dispatch_queue_create("completions", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PHPhotoLibrary unregisterChangeObserver:](self->_photoLibrary, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PXPlacesPhotoAssetsStore;
  -[PXPlacesPhotoAssetsStore dealloc](&v3, sel_dealloc);
}

- (void)loadWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD block[5];
  void (**v12)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[PXPlacesPhotoAssetsStore didCompleteLoad](self, "didCompleteLoad"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      -[PXPlacesPhotoAssetsStore serialQueue](self, "serialQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke;
      block[3] = &unk_1E5148CE0;
      block[4] = self;
      v12 = v4;
      dispatch_sync(v6, block);

    }
    if (!-[PXPlacesPhotoAssetsStore didInitiateLoad](self, "didInitiateLoad"))
    {
      -[PXPlacesPhotoAssetsStore setDidInitiateLoad:](self, "setDidInitiateLoad:", 1);
      objc_initWeak(&location, self);
      objc_msgSend((id)objc_opt_class(), "_assetsImportQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke_2;
      v8[3] = &unk_1E5148D30;
      objc_copyWeak(&v9, &location);
      dispatch_async(v7, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_handleAssetsImport
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t spid;
  unint64_t v27;
  NSObject *v28;
  id obj;
  uint64_t v30;
  uint8_t v31[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary unregisterChangeObserver:](self->_photoLibrary, "unregisterChangeObserver:", self);
  PKPlacesKitGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  PKPlacesKitGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  spid = v4;
  v27 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HandleAssetsImport", ", buf, 2u);
  }
  v28 = v6;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXPlacesPhotoAssetsStore fetchResults](self, "fetchResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v9)
  {
    v10 = 0;
    v30 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v44 != v15)
                objc_enumerationMutation(v13);
              objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
              if (v10 < 20000)
              {
                ++v10;
              }
              else
              {
                -[PXPlacesPhotoAssetsStore store](self, "store");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[PXPlacesPhotoAssetsStore _addItems:intoStore:](self, "_addItems:intoStore:", v7, v17);

                objc_msgSend(v7, "removeAllObjects");
                v10 = 0;
              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v14);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
  {
    -[PXPlacesPhotoAssetsStore store](self, "store");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesPhotoAssetsStore _addItems:intoStore:](self, "_addItems:intoStore:", v7, v18);

  }
  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__43460;
  v41 = __Block_byref_object_dispose__43461;
  v42 = 0;
  -[PXPlacesPhotoAssetsStore serialQueue](self, "serialQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXPlacesPhotoAssetsStore__handleAssetsImport__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(v19, block);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = *((id *)v38 + 5);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v51, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v20);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k) + 16))();
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v51, 16);
    }
    while (v21);
  }

  -[PXPlacesPhotoAssetsStore setDidCompleteLoad:](self, "setDidCompleteLoad:", 1);
  -[PHPhotoLibrary registerChangeObserver:](self->_photoLibrary, "registerChangeObserver:", self);
  v24 = v28;
  v25 = v24;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v25, OS_SIGNPOST_INTERVAL_END, spid, "HandleAssetsImport", ", v31, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_addItems:(id)a3 intoStore:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PKPlacesKitGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  PKPlacesKitGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddItemsIntoStore", "%@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(v6, "beginUpdates");
  objc_msgSend(v6, "addItemsFromArray:", v5);
  objc_msgSend(v6, "endUpdates");
  v12 = v10;
  v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_END, v8, "AddItemsIntoStore", ", (uint8_t *)&v14, 2u);
  }

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id obj;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[PXPlacesPhotoAssetsStore fetchResults](self, "fetchResults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v83;
    v55 = v4;
    v58 = *(_QWORD *)v83;
    while (2)
    {
      v8 = 0;
      v59 = v6;
      do
      {
        if (*(_QWORD *)v83 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v65, "changeDetailsForFetchResult:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          if (!objc_msgSend(v9, "hasIncrementalChanges"))
          {

            -[PXPlacesPhotoAssetsStore store](self, "store");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "allItems");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            -[PXPlacesPhotoAssetsStore store](self, "store");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "beginUpdates");

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v4 = v48;
            v50 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v67;
              do
              {
                for (i = 0; i != v51; ++i)
                {
                  if (*(_QWORD *)v67 != v52)
                    objc_enumerationMutation(v4);
                  -[PXPlacesStore removeItem:](self->_store, "removeItem:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
                }
                v51 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
              }
              while (v51);
            }

            -[PXPlacesPhotoAssetsStore store](self, "store");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "endUpdates");

            -[PXPlacesPhotoAssetsStore setDidInitiateLoad:](self, "setDidInitiateLoad:", 0);
            -[PXPlacesPhotoAssetsStore setDidCompleteLoad:](self, "setDidCompleteLoad:", 0);
            -[PXPlacesPhotoAssetsStore loadWithCompletion:](self, "loadWithCompletion:", 0);
            goto LABEL_57;
          }
          objc_msgSend(v10, "removedObjects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "insertedObjects");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v10;
          if (objc_msgSend(v11, "count") || objc_msgSend(v61, "count"))
          {
            -[PXPlacesPhotoAssetsStore store](self, "store");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "beginUpdates");

            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v13 = v11;
            v14 = v11;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v79;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v79 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[PXPlacesStore removeItem:](self->_store, "removeItem:", v19);
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
              }
              while (v16);
            }

            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            v20 = v61;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v75;
              do
              {
                for (k = 0; k != v22; ++k)
                {
                  if (*(_QWORD *)v75 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[PXPlacesStore addItem:](self->_store, "addItem:", v25);
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
              }
              while (v22);
            }

            -[PXPlacesPhotoAssetsStore store](self, "store");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "endUpdates");
            v6 = v59;
            v10 = v60;
            v11 = v13;
            v27 = v26;
            v7 = v58;
          }
          else
          {
            objc_msgSend(v10, "changedObjects");
            v28 = objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v29 = (void *)v28;
              v56 = v11;
              v57 = v8;
              v64 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v63 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v27 = v29;
              v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v71;
                obj = v27;
                do
                {
                  for (m = 0; m != v31; ++m)
                  {
                    if (*(_QWORD *)v71 != v32)
                      objc_enumerationMutation(obj);
                    v34 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
                    objc_msgSend(v65, "changeDetailsForObject:", v34);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "objectBeforeChanges");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = v34;
                    objc_msgSend(v36, "location");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "location");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "coordinate");
                    v41 = v40;
                    objc_msgSend(v39, "coordinate");
                    if (vabdd_f64(v41, v42) >= 2.22044605e-16
                      || (objc_msgSend(v38, "coordinate"),
                          v44 = v43,
                          objc_msgSend(v39, "coordinate"),
                          vabdd_f64(v44, v45) >= 2.22044605e-16))
                    {
                      objc_msgSend(v64, "addObject:", v36);
                      objc_msgSend(v63, "addObject:", v37);
                    }

                  }
                  v27 = obj;
                  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
                }
                while (v31);
              }

              v11 = v56;
              v8 = v57;
              if (objc_msgSend(v64, "count"))
              {
                -[PXPlacesStore beginUpdates](self->_store, "beginUpdates");
                -[PXPlacesStore removeItems:](self->_store, "removeItems:", v64);
                -[PXPlacesStore addItems:](self->_store, "addItems:", v63);
                -[PXPlacesStore endUpdates](self->_store, "endUpdates");
              }

              v4 = v55;
              v7 = v58;
              v6 = v59;
              v10 = v60;
            }
            else
            {
              v27 = 0;
            }
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v46 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      v6 = v46;
      if (v46)
        continue;
      break;
    }
  }
LABEL_57:

}

- (NSArray)fetchResults
{
  return self->_fetchResults;
}

- (void)setFetchResults:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResults, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PXPlacesStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (BOOL)didInitiateLoad
{
  return self->_didInitiateLoad;
}

- (void)setDidInitiateLoad:(BOOL)a3
{
  self->_didInitiateLoad = a3;
}

- (BOOL)didCompleteLoad
{
  return self->_didCompleteLoad;
}

- (void)setDidCompleteLoad:(BOOL)a3
{
  self->_didCompleteLoad = a3;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
}

void __47__PXPlacesPhotoAssetsStore__handleAssetsImport__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "completions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "completions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

void __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "addObject:", v2);

}

void __47__PXPlacesPhotoAssetsStore_loadWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAssetsImport");

}

+ (id)_assetsImportQueue
{
  if (_assetsImportQueue_onceToken != -1)
    dispatch_once(&_assetsImportQueue_onceToken, &__block_literal_global_43471);
  return (id)_assetsImportQueue_assetsImportQueue;
}

void __46__PXPlacesPhotoAssetsStore__assetsImportQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.places.assetsImport", v2);
  v1 = (void *)_assetsImportQueue_assetsImportQueue;
  _assetsImportQueue_assetsImportQueue = (uint64_t)v0;

}

@end
