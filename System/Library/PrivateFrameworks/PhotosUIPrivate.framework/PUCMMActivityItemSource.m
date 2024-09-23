@implementation PUCMMActivityItemSource

- (PUCMMActivityItemSource)initWithActivityItemSourceController:(id)a3
{
  id v4;
  PUCMMActivityItemSource *v5;
  PUCMMActivityItemSource *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *externalIsolationQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUCMMActivityItemSource;
  v5 = -[PUCMMActivityItemSource init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemSourceController, v4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.PUCMMActivityItemSource.isolationQueue", v7);
    externalIsolationQueue = v6->_externalIsolationQueue;
    v6->_externalIsolationQueue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (id)placeholderItemsForActivityViewController:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://share.icloud.com/photos/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preparedItems
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PUCMMActivityItemSource individuallyPreparedItems](self, "individuallyPreparedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PUCMMActivityItemSource individuallyPreparedItems](self, "individuallyPreparedItems");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUCMMActivityItemSource momentShareLink](self, "momentShareLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUCMMActivityItemSource momentShareLink](self, "momentShareLink");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    else
    {
      return MEMORY[0x1E0C9AA60];
    }
  }
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  -[PUCMMActivityItemSource placeholderItemsForActivityViewController:](self, "placeholderItemsForActivityViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v4;
  void *v5;

  -[PUCMMActivityItemSource preparedItems](self, "preparedItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activityViewControllerOperation:(id)a3
{
  void *v4;
  void *v5;
  PUActivityItemSourceOperation *v6;

  objc_msgSend(a3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUActivityItemSourceOperation initWithDelegate:activityType:]([PUActivityItemSourceOperation alloc], "initWithDelegate:activityType:", self, v5);
  -[PUCMMActivityItemSource setPreparationOperation:](self, "setPreparationOperation:", v6);

  return v6;
}

- (void)activityItemSourceOperation:(id)a3 prepareItemForActivityType:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[14];
  id v24;
  id v25;
  NSObject *v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  PUCMMActivityItemSource *v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  PUCMMActivityItemSource *v45;
  id v46;
  uint64_t v47;
  _QWORD v48[3];
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD block[5];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  PUCMMActivityItemSource *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUCMMActivityItemSource setActivityType:](self, "setActivityType:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  -[PUCMMActivityItemSource externalIsolationQueue](self, "externalIsolationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_sync(v10, block);

  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__44700;
  v66 = __Block_byref_object_dispose__44701;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__44700;
  v60 = __Block_byref_object_dispose__44701;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__44700;
  v54 = __Block_byref_object_dispose__44701;
  v55 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  LODWORD(v10) = +[PUActivityItemSourceConfiguration isMomentShareLinkSupportedByActivityType:](PUActivityItemSourceConfiguration, "isMomentShareLinkSupportedByActivityType:", v7);
  -[PUCMMActivityItemSource performChanges:](self, "performChanges:", &__block_literal_global_44703);
  objc_msgSend(WeakRetained, "registerChangeObserver:context:", self, &PUCMMActivityItemSourceSourceControllerObserverContext);
  v41 = v11;
  v42 = 3221225472;
  v43 = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_2;
  v44 = &unk_1E58A9DF0;
  v45 = self;
  v12 = v7;
  v46 = v12;
  v47 = v10;
  px_dispatch_on_main_queue();
  if ((_DWORD)v10)
  {
    v30 = v11;
    v31 = 3221225472;
    v32 = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_3;
    v33 = &unk_1E58A1D10;
    v34 = self;
    v35 = WeakRetained;
    v36 = v12;
    v38 = &v62;
    v39 = v48;
    v40 = &v50;
    v37 = v9;
    px_dispatch_on_main_queue();

    dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    if (!v63[5])
    {
      PLShareSheetGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_opt_class();
        v15 = v51[5];
        *(_DWORD *)buf = 138412802;
        v70 = v14;
        v71 = 2048;
        v72 = self;
        v73 = 2114;
        v74 = v15;
        v16 = v14;
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "<%@:%p>: Error in creating moment share link: %{public}@", buf, 0x20u);

      }
LABEL_8:

    }
  }
  else
  {
    v23[9] = v11;
    v23[10] = 3221225472;
    v23[11] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_148;
    v23[12] = &unk_1E58A1D10;
    v23[13] = self;
    v24 = v12;
    v25 = WeakRetained;
    v27 = v48;
    v28 = &v50;
    v29 = &v56;
    v26 = v9;
    px_dispatch_on_main_queue();

    dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    if (!objc_msgSend((id)v57[5], "count"))
    {
      PLShareSheetGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_opt_class();
        v18 = v51[5];
        *(_DWORD *)buf = 138412802;
        v70 = v17;
        v71 = 2048;
        v72 = self;
        v73 = 2114;
        v74 = v18;
        v19 = v17;
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "<%@:%p>: Error in preparing individual items: %{public}@", buf, 0x20u);

      }
      goto LABEL_8;
    }
  }
  -[PUCMMActivityItemSource externalIsolationQueue](self, "externalIsolationQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_151;
  v23[3] = &unk_1E58A1D60;
  v23[4] = self;
  v23[5] = &v62;
  v23[6] = &v56;
  v23[7] = v48;
  v23[8] = &v50;
  dispatch_sync(v20, v23);

  -[PUCMMActivityItemSource performChanges:](self, "performChanges:", &__block_literal_global_153_44706);
  dispatch_group_enter(v9);
  v21 = v12;
  v22 = v9;
  px_dispatch_on_main_queue();
  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

}

- (void)cancel
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCMMActivityItemSource.m"), 231, CFSTR("expect main thread"));

  }
  -[PUCMMActivityItemSource itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUCMMActivityItemSource itemSourceController](self, "itemSourceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
  -[PUCMMActivityItemSource preparationOperation](self, "preparationOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUCMMActivityItemSource preparationOperation](self, "preparationOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pu_cancel");

    -[PUCMMActivityItemSource preparationOperation](self, "preparationOperation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "semaphore");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v8);

  }
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  unint64_t state;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  PUCMMActivityItemSource *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    PLShareSheetGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      state = self->_state;
      if (state > 2)
        v8 = CFSTR("unknown");
      else
        v8 = off_1E58A1DE8[state];
      if (a3 > 2)
        v9 = CFSTR("unknown");
      else
        v9 = off_1E58A1DE8[a3];
      v11 = 138413058;
      v12 = v6;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v10 = v6;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "<%@:%p>: PUCMMActivityItemSource changing state from %{public}@ to %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    self->_state = a3;
    -[PUCMMActivityItemSource signalChange:](self, "signalChange:", 1);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  if ((a4 & 1) != 0 && (void *)PUCMMActivityItemSourceSourceControllerObserverContext == a5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
    v7 = objc_msgSend(WeakRetained, "state");

    v8 = 2 * (v7 == 2);
    if (v7 == 1)
      v8 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PUCMMActivityItemSource_observable_didChange_context___block_invoke;
    v9[3] = &__block_descriptor_40_e42_v16__0___PUMutableCMMActivityItemSource__8l;
    v9[4] = v8;
    -[PUCMMActivityItemSource performChanges:](self, "performChanges:", v9);
  }
}

- (PUActivityItemSourceController)itemSourceController
{
  return (PUActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (PUCMMActivityItemSourceDelegate)delegate
{
  return (PUCMMActivityItemSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (PUActivityItemSourceOperation)preparationOperation
{
  return self->_preparationOperation;
}

- (void)setPreparationOperation:(id)a3
{
  objc_storeStrong((id *)&self->_preparationOperation, a3);
}

- (NSURL)momentShareLink
{
  return self->_momentShareLink;
}

- (void)setMomentShareLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)individuallyPreparedItems
{
  return self->_individuallyPreparedItems;
}

- (void)setIndividuallyPreparedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSError)preparationError
{
  return self->_preparationError;
}

- (void)setPreparationError:(id)a3
{
  objc_storeStrong((id *)&self->_preparationError, a3);
}

- (OS_dispatch_queue)externalIsolationQueue
{
  return self->_externalIsolationQueue;
}

- (void)setExternalIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_externalIsolationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIsolationQueue, 0);
  objc_storeStrong((id *)&self->_preparationError, 0);
  objc_storeStrong((id *)&self->_individuallyPreparedItems, 0);
  objc_storeStrong((id *)&self->_momentShareLink, 0);
  objc_storeStrong((id *)&self->_preparationOperation, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_itemSourceController);
}

uint64_t __56__PUCMMActivityItemSource_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMomentShareLink:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIndividuallyPreparedItems:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPreparationError:", 0);
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmmActivityItemSource:willBeginPreparationWithActivityType:preparationType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PLShareSheetGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v3;
    v16 = 2048;
    v17 = v4;
    v5 = v3;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Preparing moment-sharing link", buf, 0x16u);

  }
  v7 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_146;
  v8[3] = &unk_1E58A1CE8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v7, "publishLinkForActivityType:completionHandler:", v9, v8);

}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_148(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLShareSheetGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v18 = v3;
    v19 = 2048;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v6 = v3;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Preparing individual items (even though a CMM is the preferred output type), for activity: %@", buf, 0x20u);

  }
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_149;
  v11[3] = &unk_1E58A1D38;
  v15 = *(_OWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 80);
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = v10;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v9, "runExplicitly:withActivityType:completionHandler:", 1, v8, v11);

}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_151(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setMomentShareLink:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setIndividuallyPreparedItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v2 = 0;
  else
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setPreparationError:", v2);
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_3_154(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "preparedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(v4, "preparationError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_4;
  v9[3] = &unk_1E58ABD10;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "cmmActivityItemSource:didFinishPreparationForActivityType:preparationType:withItems:didCancel:error:completion:", v4, v5, v6, v2, v7, v8, v9);

}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_2_152(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 0);
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_149(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  objc_msgSend(v7, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (!v8 && (a3 & 1) == 0)
  {
    v12 = objc_msgSend(v15, "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  objc_msgSend(*(id *)(a1 + 32), "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 40), &PUCMMActivityItemSourceSourceControllerObserverContext);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_146(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  PLShareSheetGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v20 = 138412802;
    v21 = v10;
    v22 = 2048;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v13 = v10;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Finished preparing assets for activity: %{public}@", (uint8_t *)&v20, 0x20u);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v7;
  v16 = v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v8;
  v19 = v8;

  objc_msgSend(*(id *)(a1 + 48), "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 32), &PUCMMActivityItemSourceSourceControllerObserverContext);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_144(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 2);
}

@end
