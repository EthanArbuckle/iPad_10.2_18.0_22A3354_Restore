@implementation SXMapSnapShotter

- (SXMapSnapShotter)init
{
  SXMapSnapShotter *v2;
  uint64_t v3;
  NSMutableArray *snapshotters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXMapSnapShotter;
  v2 = -[SXMapSnapShotter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    snapshotters = v2->_snapshotters;
    v2->_snapshotters = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)snapShotWithOptions:(id)a3 annotations:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  id v43;
  id location;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[3];
  char v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v33 = a5;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v46;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
        v16 = objc_alloc(MEMORY[0x24BDDB118]);
        objc_msgSend(v15, "coordinate");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v15, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v16, "initWithCoordinate:title:representation:", v21, 1, v18, v20);

        objc_msgSend(v10, "addObject:", v22);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "_setCustomFeatureAnnotations:", v10);
  objc_initWeak(&location, self);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB128]), "initWithOptions:", v8);
  objc_msgSend((id)objc_opt_class(), "serialQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke;
  v38[3] = &unk_24D688BE8;
  objc_copyWeak(&v43, &location);
  v26 = v33;
  v41 = v26;
  v42 = v49;
  v27 = v8;
  v39 = v27;
  v28 = v23;
  v40 = v28;
  objc_msgSend(v28, "startWithQueue:completionHandler:", v24, v38);

  -[SXMapSnapShotter snapshotters](self, "snapshotters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v28);

  v34[0] = v25;
  v34[1] = 3221225472;
  v34[2] = __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_3;
  v34[3] = &unk_24D688C10;
  objc_copyWeak(&v37, &location);
  v35 = v28;
  v36 = v49;
  v30 = v28;
  v31 = (void *)MEMORY[0x219A070A8](v34);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  _Block_object_dispose(v49, 8);
  return v31;
}

void __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_2;
  v7[3] = &unk_24D688BC0;
  objc_copyWeak(&v13, (id *)(a1 + 64));
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v13);
}

void __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (*(_QWORD *)(a1 + 56))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v2 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "image");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  objc_msgSend(WeakRetained, "snapshotters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 48));

}

void __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_msgSend(WeakRetained, "snapshotters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

+ (id)serialQueue
{
  if (serialQueue_onceToken != -1)
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_7);
  return (id)serialQueue___serialQueue;
}

void __31__SXMapSnapShotter_serialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.news.maps", v2);
  v1 = (void *)serialQueue___serialQueue;
  serialQueue___serialQueue = (uint64_t)v0;

}

- (NSMutableArray)snapshotters
{
  return self->_snapshotters;
}

- (void)setSnapshotters:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotters, 0);
}

@end
