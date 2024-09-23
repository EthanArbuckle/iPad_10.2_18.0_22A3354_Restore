@implementation VUIAggregateMediaLibrary

- (VUIAggregateMediaLibrary)initWithManager:(id)a3 deviceMediaLibrary:(id)a4 sidebandMediaLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIAggregateLibraryIdentifier *v12;
  VUIAggregateMediaLibrary *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(VUIAggregateLibraryIdentifier);
  v17.receiver = self;
  v17.super_class = (Class)VUIAggregateMediaLibrary;
  v13 = -[VUIMediaLibrary initWithIdentifier:type:manager:](&v17, sel_initWithIdentifier_type_manager_, v12, 0, v11);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_deviceMediaLibrary, a4);
    objc_storeStrong((id *)&v13->_sidebandMediaLibrary, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__deviceMediaLibraryContentsDidChange_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__sidebandMediaLibraryContentsDidChangeNotification_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v10);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIAggregateMediaLibrary;
  -[VUIMediaLibraryImageLoader dealloc](&v4, sel_dealloc);
}

- (BOOL)isUpdating
{
  void *v3;
  char v4;
  void *v5;

  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isUpdating") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[VUIAggregateMediaLibrary sidebandMediaLibrary](self, "sidebandMediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isUpdating");

  }
  return v4;
}

- (BOOL)isInitialUpdateInProgress
{
  void *v3;
  char v4;
  void *v5;

  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInitialUpdateInProgress") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[VUIAggregateMediaLibrary sidebandMediaLibrary](self, "sidebandMediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isInitialUpdateInProgress");

  }
  return v4;
}

- (void)updateProgressWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProgressWithCompletionHandler:", v4);

}

- (void)updateFromCloudWithReason:(int64_t)a3
{
  id v4;

  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFromCloudWithReason:", a3);

}

- (id)title
{
  void *v2;
  void *v3;

  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)connectionState
{
  void *v2;
  unint64_t v3;

  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionState");

  return v3;
}

- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectWithCompletionHandler:progressHandler:", v7, v6);

}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;

  v4 = a3;
  v5 = dispatch_group_create();
  -[VUIMediaLibrary manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__36;
  v33[4] = __Block_byref_object_dispose__36;
  v34 = 0;
  dispatch_group_enter(v5);
  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E9FA4E30;
  v10 = v7;
  v30 = v10;
  v32 = v33;
  v11 = v5;
  v31 = v11;
  objc_msgSend(v8, "enqueueMediaItemEntityTypesFetchWithCompletionHandler:", v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIAggregateMediaLibrary sidebandMediaLibrary](self, "sidebandMediaLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
  v25[3] = &unk_1E9FA4E30;
  v14 = v10;
  v26 = v14;
  v28 = v33;
  v15 = v11;
  v27 = v15;
  v16 = (id)objc_msgSend(v13, "enqueueMediaItemEntityTypesFetchWithCompletionHandler:", v25);

  objc_msgSend(v6, "completionDispatchQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E9FA4E58;
  v22 = v14;
  v23 = v4;
  v24 = v33;
  v18 = v14;
  v19 = v4;
  dispatch_group_notify(v15, v17, block);

  _Block_object_dispose(v33, 8);
  return v12;
}

void __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__VUIAggregateMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  VUIMediaItemEntityTypesFetchResponse *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = a1;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v8, "mediaItemEntityTypes", v15);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v18 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v11);
          }

          v5 |= objc_msgSend(v8, "areLocalMediaItemsAvailable");
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v4);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

    v14 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
    -[VUIMediaItemEntityTypesFetchResponse setMediaItemEntityTypes:](v14, "setMediaItemEntityTypes:", v2);
    -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](v14, "setLocalMediaItemsAvailable:", v5 & 1);
    (*(void (**)(void))(*(_QWORD *)(v15 + 40) + 16))();

  }
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  -[VUIMediaLibrary manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__36;
  v39[4] = __Block_byref_object_dispose__36;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__36;
  v37[4] = __Block_byref_object_dispose__36;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__36;
  v35[4] = __Block_byref_object_dispose__36;
  v36 = 0;
  dispatch_group_enter(v8);
  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  v31[3] = &unk_1E9FA4E80;
  v33 = v39;
  v34 = v35;
  v12 = v8;
  v32 = v12;
  objc_msgSend(v10, "enqueueFetchRequests:completionHandler:", v6, v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v12);
  -[VUIAggregateMediaLibrary sidebandMediaLibrary](self, "sidebandMediaLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
  v27[3] = &unk_1E9FA4E80;
  v29 = v37;
  v30 = v35;
  v15 = v12;
  v28 = v15;
  v16 = (id)objc_msgSend(v14, "enqueueFetchRequests:completionHandler:", v6, v27);

  objc_msgSend(v9, "completionDispatchQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
  v21[3] = &unk_1E9FA4ED0;
  v24 = v37;
  v25 = v39;
  v22 = v6;
  v23 = v7;
  v26 = v35;
  v18 = v7;
  v19 = v6;
  dispatch_group_notify(v15, v17, v21);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  return v13;
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4;
  v7[3] = &unk_1E9FA4EA8;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v7[1] = 3221225472;
  v10 = v3;
  v8 = *(id *)(a1 + 32);
  v6 = v2;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __67__VUIAggregateMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  VUIMediaEntityFetchResponse *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;

  v37 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v37, "mediaEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "mediaEntities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
        objc_msgSend(v5, "addObjectsFromArray:", v9);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3)
  {
    v35 = v6;
    v36 = v5;
    v10 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "range");
    v14 = v13;
    objc_msgSend(v11, "predicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v11, "predicate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filteredArrayUsingPredicate:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v17;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || !v14)
    {
      v18 = v10;
    }
    else
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v12 < v12 + v14)
      {
        do
        {
          if (v12 >= objc_msgSend(v10, "count"))
            break;
          objc_msgSend(v10, "objectAtIndex:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v19);

          ++v12;
          --v14;
        }
        while (v14);
      }

    }
    v20 = v18;
    VUISidebandMediaItemKind();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "_isItemsFetch"))
    {
      VUISidebandMediaItemKind();
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v11, "_isShowsFetch"))
    {
      VUISidebandSeriesMediaCollectionKind();
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v11, "_isSeasonsFetch"))
        goto LABEL_26;
      VUISidebandSeasonMediaCollectionKind();
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;

    v21 = v23;
LABEL_26:
    objc_msgSend(v11, "_manualSortDescriptorsWithMediaEntityKind:propertiesRequiredForSort:", v21, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v20;
    if (v24)
    {
      objc_msgSend(v20, "sortedArrayUsingDescriptors:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "_sortIndexPropertyKeyWithMediaEntityKind:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v24;
    if (v26)
    {
      +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "sortIndexesForMediaEntities:sortIndexPropertyKey:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v34 = v20;
    objc_msgSend(v11, "groupingKeyPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v11, "groupingSortComparator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaLibraryUtilities groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:", v25, v28, v29, 1, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "_shouldGenerateGroupingSortIndexes"))
      {
        +[VUIMediaLibraryUtilities sortIndexesForGrouping:](VUIMediaLibraryUtilities, "sortIndexesForGrouping:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v32 = objc_alloc_init(VUIMediaEntityFetchResponse);
        -[VUIMediaEntityFetchResponse setMediaEntities:](v32, "setMediaEntities:", v25);
        -[VUIMediaEntityFetchResponse setSortIndexes:](v32, "setSortIndexes:", v27);
        -[VUIMediaEntityFetchResponse setGrouping:](v32, "setGrouping:", v30);
        -[VUIMediaEntityFetchResponse setGroupingSortIndexes:](v32, "setGroupingSortIndexes:", v31);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v32);

        v6 = v35;
        v5 = v36;
        goto LABEL_37;
      }
    }
    else
    {
      v30 = 0;
    }
    v31 = 0;
    goto LABEL_36;
  }
LABEL_37:

}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  if (v5)
  {
    -[VUIMediaLibrary manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__VUIAggregateMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E9F98E68;
    v10 = v5;
    objc_msgSend(v6, "_enqueueCompletionQueueBlock:", v9);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);

  return v7;
}

uint64_t __62__VUIAggregateMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_imageLoaderIdentifier
{
  void *v2;
  void *v3;

  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_imageLoaderIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_imageLoadParamsForImageLoaderObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[VUIAggregateMediaLibrary deviceMediaLibrary](self, "deviceMediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_imageLoadOperationWithParams:scaleToSize:cropToFit:", v9, v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)keyPathsForValuesAffectingConnectionState
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("connectionState"));
}

- (VUIDeviceMediaLibrary)deviceMediaLibrary
{
  return self->_deviceMediaLibrary;
}

- (VUISidebandMediaLibrary)sidebandMediaLibrary
{
  return self->_sidebandMediaLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebandMediaLibrary, 0);
  objc_storeStrong((id *)&self->_deviceMediaLibrary, 0);
}

@end
