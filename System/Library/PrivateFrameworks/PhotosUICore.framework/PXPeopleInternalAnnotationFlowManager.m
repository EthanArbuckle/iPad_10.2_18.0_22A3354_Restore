@implementation PXPeopleInternalAnnotationFlowManager

- (PXPeopleInternalAnnotationFlowManager)initWithPeopleCollectionViewController:(id)a3 dataSource:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPeopleInternalAnnotationFlowManager *v12;
  PXPeopleInternalAnnotationFlowManager *v13;
  void *v14;
  id completion;
  PXPeopleMetricsActionQueue *v16;
  PXPeopleMetricsActionQueue *metricsActionQueue;
  NSMutableArray *v18;
  NSMutableArray *selectedPersonsForAnnotation;
  NSMutableSet *v20;
  NSMutableSet *graphVerifiedPersonUUIDsAtStartOfAnnotation;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PXPeopleInternalAnnotationFlowManager;
  v12 = -[PXPeopleInternalAnnotationFlowManager init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a4);
    objc_storeStrong((id *)&v13->_viewController, a3);
    v14 = _Block_copy(v11);
    completion = v13->_completion;
    v13->_completion = v14;

    v16 = objc_alloc_init(PXPeopleMetricsActionQueue);
    metricsActionQueue = v13->_metricsActionQueue;
    v13->_metricsActionQueue = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    selectedPersonsForAnnotation = v13->_selectedPersonsForAnnotation;
    v13->_selectedPersonsForAnnotation = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    graphVerifiedPersonUUIDsAtStartOfAnnotation = v13->_graphVerifiedPersonUUIDsAtStartOfAnnotation;
    v13->_graphVerifiedPersonUUIDsAtStartOfAnnotation = v20;

  }
  return v13;
}

- (void)startAnnotationFlowForSelectedPersonIndexPaths:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PXPeopleMetricsActionQueueItem *v19;
  void *v20;
  PXPeopleMetricsActionQueueItem *v21;
  void *v22;
  PXPeopleMetricsActionQueueItem *v23;
  void *v24;
  void *v25;
  void *v26;
  PXPeopleMetricsActionQueueItem *v27;
  void *v28;
  PXPeopleMetricsActionQueueItem *v29;
  void *v30;
  void *v31;
  void *v32;
  PXPeopleMetricsActionQueueItem *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableSet *graphVerifiedPersonUUIDsAtStartOfAnnotation;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[NSMutableArray removeAllObjects](self->_selectedPersonsForAnnotation, "removeAllObjects");
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v47 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v57;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v57 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v9);
          -[PXPeopleInternalAnnotationFlowManager dataSource](self, "dataSource");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "memberAtIndexPath:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](self->_selectedPersonsForAnnotation, "addObject:", v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v7);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v13 = self->_selectedPersonsForAnnotation;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v53;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v53 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v17);
          v19 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:]([PXPeopleMetricsActionQueueItem alloc], "initWithItemType:andPerson:", 1, v18);
          -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addItemToEnd:", v19);

          v21 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:]([PXPeopleMetricsActionQueueItem alloc], "initWithItemType:andPerson:", 0, v18);
          -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addItemToEnd:", v21);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v15);
    }

    v23 = [PXPeopleMetricsActionQueueItem alloc];
    -[PXPeopleInternalAnnotationFlowManager dataSource](self, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "memberAtIndexPath:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:](v23, "initWithItemType:andPerson:", 2, v26);

    -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addItemToEnd:", v27);

    v29 = [PXPeopleMetricsActionQueueItem alloc];
    -[PXPeopleInternalAnnotationFlowManager dataSource](self, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "memberAtIndexPath:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:](v29, "initWithItemType:andPerson:", 3, v32);

    -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addItemToEnd:", v33);

    v35 = (void *)MEMORY[0x1E0CD1570];
    -[NSMutableArray lastObject](self->_selectedPersonsForAnnotation, "lastObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "modelObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fetchOptionsWithPhotoLibrary:orObject:", 0, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType == %d"), 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPredicate:", v39);

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v49;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v49 != v43)
            objc_enumerationMutation(v40);
          graphVerifiedPersonUUIDsAtStartOfAnnotation = self->_graphVerifiedPersonUUIDsAtStartOfAnnotation;
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v44), "uuid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](graphVerifiedPersonUUIDsAtStartOfAnnotation, "addObject:", v46);

          ++v44;
        }
        while (v42 != v44);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v42);
    }
    -[PXPeopleInternalAnnotationFlowManager continueAnnotationFlow](self, "continueAnnotationFlow");

    v4 = v47;
  }

}

- (void)continueAnnotationFlow
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXPeopleInternalAnnotationPersonSummaryViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  PXPeopleInternalAnnotationPersonSummaryViewController *v16;
  _QWORD v17[4];
  PXPeopleInternalAnnotationPersonSummaryViewController *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  id v23;
  id location;

  objc_initWeak(&location, self);
  -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNextItemAndPop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke;
    aBlock[3] = &unk_1E5148D30;
    objc_copyWeak(&v23, &location);
    v6 = _Block_copy(aBlock);
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke_2;
    v20[3] = &unk_1E5148D30;
    objc_copyWeak(&v21, &location);
    v7 = _Block_copy(v20);
    objc_msgSend(v4, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "itemType") == 1)
    {
      v10 = -[PXPeopleInternalAnnotationPersonSummaryViewController initWithPerson:withDismissCompletion:withCancelCompletion:]([PXPeopleInternalAnnotationPersonSummaryViewController alloc], "initWithPerson:withDismissCompletion:withCancelCompletion:", v9, v6, v7);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
      objc_msgSend(v11, "setModalPresentationStyle:", 0);
      -[PXPeopleInternalAnnotationFlowManager viewController](self, "viewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

    }
    else if (objc_msgSend(v4, "itemType"))
    {
      if (objc_msgSend(v4, "itemType") == 2)
      {
        objc_msgSend(v9, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v5;
        v17[1] = 3221225472;
        v17[2] = __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke_3;
        v17[3] = &unk_1E5141338;
        v18 = v7;
        objc_copyWeak(&v19, &location);
        -[PXPeopleInternalAnnotationFlowManager _showFaceProcessingViewForPhotoLibrary:completionHandler:](self, "_showFaceProcessingViewForPhotoLibrary:completionHandler:", v13, v17);

        objc_destroyWeak(&v19);
        v10 = v18;
      }
      else
      {
        if (objc_msgSend(v4, "itemType") != 3)
        {
LABEL_11:

          objc_destroyWeak(&v21);
          objc_destroyWeak(&v23);
          goto LABEL_12;
        }
        v15[0] = v5;
        v15[1] = 3221225472;
        v15[2] = __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke_4;
        v15[3] = &unk_1E51417E8;
        v16 = v7;
        -[PXPeopleInternalAnnotationFlowManager _showAnnotationCompletedWithCompletionHandler:](self, "_showAnnotationCompletedWithCompletionHandler:", v15);
        v10 = v16;
      }
    }
    else
    {
      +[PXPeopleInternalAnnotationViewController peopleAnnotationViewControllerForPerson:withDismissCompletion:withCancelCompletion:](PXPeopleInternalAnnotationViewController, "peopleAnnotationViewControllerForPerson:withDismissCompletion:withCancelCompletion:", v9, v6, v7);
      v10 = (PXPeopleInternalAnnotationPersonSummaryViewController *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleInternalAnnotationPersonSummaryViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 0);
      -[PXPeopleInternalAnnotationFlowManager viewController](self, "viewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentViewController:animated:completion:", v10, 1, 0);

    }
    goto LABEL_11;
  }
LABEL_12:

  objc_destroyWeak(&location);
}

- (BOOL)_shouldRunFaceProcessingForPhotoLibrary:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v30;
  _QWORD v31[5];
  uint8_t v32[4];
  void *v33;
  _BYTE buf[24];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "isFaceProcessingFinished");
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "PXPeopleInternalAnnotationFlowManager: personBuilderDone=%@", buf, 0xCu);

  }
  if (!(_DWORD)v4)
    goto LABEL_9;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v35) = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__PXPeopleInternalAnnotationFlowManager__shouldRunFaceProcessingForPhotoLibrary___block_invoke;
  v31[3] = &unk_1E51402B8;
  v31[4] = buf;
  objc_msgSend(v3, "personPromotionProcessingStatusForUserInterface:", v31);
  v7 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v32 = 138412290;
    v33 = v9;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "PXPeopleInternalAnnotationFlowManager: personPromoterDone=%@", v32, 0xCu);

  }
  _Block_object_dispose(buf, 8);
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0D475C0];
    v30 = 0;
    objc_msgSend(v3, "photoLibraryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryProgressDetail:forPhotoLibraryURL:andTaskID:", &v30, v11, *MEMORY[0x1E0D47680]);
    v12 = v30;

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D475F0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D475E8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D475D8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    v19 = v18 + v16;
    v20 = v14 >= 1 && 100 * v18 / v14 > 5;
    if (v14)
      v22 = v14 == v19;
    else
      v22 = 0;
    v21 = !v22 || v20;
    PLUIGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      v35 = v18;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_INFO, "PXPeopleInternalAnnotationFlowManager: totalCount=%ld processed=%ld failed=%ld", buf, 0x20u);
    }

    PLUIGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14 == v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_INFO, "PXPeopleInternalAnnotationFlowManager: isFaceProcessingDone=%@ tooManyFailed=%@", buf, 0x16u);

    }
  }
  else
  {
LABEL_9:
    v21 = 1;
  }
  PLUIGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v28;
    _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEFAULT, "PXPeopleInternalAnnotationFlowManager: shouldRun face processing: %@", buf, 0xCu);

  }
  return v21;
}

- (void)_showFaceProcessingViewForPhotoLibrary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD aBlock[4];
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[3];
  int v33;

  v6 = a3;
  v7 = a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__256672;
  v30 = __Block_byref_object_dispose__256673;
  v31 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5146800;
  v24 = v32;
  v25 = &v26;
  v9 = v7;
  v23 = v9;
  v10 = _Block_copy(aBlock);
  +[PXAlertController activityAlertControllerWithTitle:cancelHandler:](PXAlertController, "activityAlertControllerWithTitle:cancelHandler:", CFSTR("[INTERNAL ONLY] Scanning for faces to verify"), v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v27[5];
  v27[5] = v11;

  -[PXPeopleInternalAnnotationFlowManager viewController](self, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v27[5], 1, 0);

  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_3;
  v17[3] = &unk_1E5140380;
  v17[4] = self;
  v18 = v6;
  v20 = &v26;
  v21 = v32;
  v19 = v9;
  v15 = v9;
  v16 = v6;
  dispatch_async(v14, v17);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);
}

- (void)_showAnnotationCompletedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("[INTERNAL ONLY] Annotation Completed"), CFSTR("Review the people details of each person to remove any faces of not that person."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File a Radar"), 0, &__block_literal_global_256651);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  v7 = (void *)MEMORY[0x1E0DC3448];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PXPeopleInternalAnnotationFlowManager__showAnnotationCompletedWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5142658;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "actionWithTitle:style:handler:", CFSTR("Done"), 1, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  -[PXPeopleInternalAnnotationFlowManager viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_checkForNewMergeCandidatesAndAddReannotationItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  PXPersonItem *v30;
  void *v31;
  char v32;
  PXPeopleMetricsActionQueueItem *v33;
  PXPeopleMetricsActionQueueItem *v34;
  void *v35;
  PXPeopleMetricsActionQueueItem *v36;
  void *v37;
  PXPeopleMetricsActionQueueItem *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  PXPeopleInternalAnnotationFlowManager *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1570];
  -[NSMutableArray lastObject](self->_selectedPersonsForAnnotation, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v49 = self;
  v7 = self->_selectedPersonsForAnnotation;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)MEMORY[0x1E0CD16C0];
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "modelObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v14, v51);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "fetchedObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v18);

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType == %d or verifiedType == %d"), 2, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setPredicate:", v19);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v51);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  v47 = v21;
  if (v22)
  {
    v23 = v22;
    v50 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v57 != v50)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "count"))
        {
          objc_msgSend(v25, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v6, "containsObject:", v28);

          if (v29)
          {
            v30 = -[PXPersonItem initWithPerson:]([PXPersonItem alloc], "initWithPerson:", v25);
            -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "containsPerson:", v30);

            if ((v32 & 1) == 0)
            {
              v33 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:]([PXPeopleMetricsActionQueueItem alloc], "initWithItemType:andPerson:", 1, v30);
              objc_msgSend(v48, "addObject:", v33);
              v34 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:]([PXPeopleMetricsActionQueueItem alloc], "initWithItemType:andPerson:", 0, v30);
              v21 = v47;
              objc_msgSend(v48, "addObject:", v34);

            }
          }
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v23);
  }

  v35 = v48;
  if (objc_msgSend(v48, "count"))
  {
    v36 = [PXPeopleMetricsActionQueueItem alloc];
    -[NSMutableArray lastObject](self->_selectedPersonsForAnnotation, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:](v36, "initWithItemType:andPerson:", 2, v37);

    -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addItemToFront:", v38);

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v48, "reverseObjectEnumerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v53 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
          -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](v49, "metricsActionQueue");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addItemToFront:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      }
      while (v42);
    }

    v21 = v47;
    v35 = v48;
  }

}

- (void)_checkForNewGraphVerifiedPeopleAndAddReannotationItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableSet *graphVerifiedPersonUUIDsAtStartOfAnnotation;
  void *v15;
  PXPersonItem *v16;
  void *v17;
  char v18;
  PXPeopleMetricsActionQueueItem *v19;
  PXPeopleMetricsActionQueueItem *v20;
  PXPeopleMetricsActionQueueItem *v21;
  void *v22;
  PXPeopleMetricsActionQueueItem *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0CD1570];
  -[NSMutableArray lastObject](self->_selectedPersonsForAnnotation, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType == %d"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  v32 = v6;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        graphVerifiedPersonUUIDsAtStartOfAnnotation = self->_graphVerifiedPersonUUIDsAtStartOfAnnotation;
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(graphVerifiedPersonUUIDsAtStartOfAnnotation) = -[NSMutableSet containsObject:](graphVerifiedPersonUUIDsAtStartOfAnnotation, "containsObject:", v15);

        if ((graphVerifiedPersonUUIDsAtStartOfAnnotation & 1) == 0)
        {
          v16 = -[PXPersonItem initWithPerson:]([PXPersonItem alloc], "initWithPerson:", v13);
          -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsPerson:", v16);

          if ((v18 & 1) == 0)
          {
            v19 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:]([PXPeopleMetricsActionQueueItem alloc], "initWithItemType:andPerson:", 1, v16);
            objc_msgSend(v33, "addObject:", v19);
            v20 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:]([PXPeopleMetricsActionQueueItem alloc], "initWithItemType:andPerson:", 0, v16);
            objc_msgSend(v33, "addObject:", v20);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v33, "count"))
  {
    v21 = [PXPeopleMetricsActionQueueItem alloc];
    -[NSMutableArray lastObject](self->_selectedPersonsForAnnotation, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PXPeopleMetricsActionQueueItem initWithItemType:andPerson:](v21, "initWithItemType:andPerson:", 2, v22);

    -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addItemToFront:", v23);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v33, "reverseObjectEnumerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          -[PXPeopleInternalAnnotationFlowManager metricsActionQueue](self, "metricsActionQueue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addItemToFront:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v27);
    }

  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewController)viewController
{
  return self->_viewController;
}

- (PXPeopleSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableArray)selectedPersonsForAnnotation
{
  return self->_selectedPersonsForAnnotation;
}

- (void)setSelectedPersonsForAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPersonsForAnnotation, a3);
}

- (NSMutableSet)graphVerifiedPersonUUIDsAtStartOfAnnotation
{
  return self->_graphVerifiedPersonUUIDsAtStartOfAnnotation;
}

- (void)setGraphVerifiedPersonUUIDsAtStartOfAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_graphVerifiedPersonUUIDsAtStartOfAnnotation, a3);
}

- (PXPeopleMetricsActionQueue)metricsActionQueue
{
  return self->_metricsActionQueue;
}

- (void)setMetricsActionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metricsActionQueue, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_metricsActionQueue, 0);
  objc_storeStrong((id *)&self->_graphVerifiedPersonUUIDsAtStartOfAnnotation, 0);
  objc_storeStrong((id *)&self->_selectedPersonsForAnnotation, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

uint64_t __87__PXPeopleInternalAnnotationFlowManager__showAnnotationCompletedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PXPeopleInternalAnnotationFlowManager__showAnnotationCompletedWithCompletionHandler___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[PXFeedbackTapToRadarUtilities defaultTitlePrefix](PXFeedbackTapToRadarUtilities, "defaultTitlePrefix");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "appendString:", CFSTR("People Annotation - Annotated Photos Library"));
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "appendString:", CFSTR("This Radar contains a photos library with annotated people.\n\n\n"));
  v5[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v4) = 1;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v1, v2, CFSTR("Other Bug"), CFSTR("630682"), CFSTR("Photos People & Pets"), CFSTR("all"), 0, 0, 0, v4, v3, 0);

}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0D475C0], "sharedAnalysisService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelRequest:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

  }
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5148A40;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, v4);

}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __CFString *v18;
  uint64_t v19;
  _QWORD block[4];
  _QWORD v21[2];

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldRunFaceProcessingForPhotoLibrary:", *(_QWORD *)(a1 + 40)))
  {
    v2 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_4;
    block[3] = &unk_1E5148AA8;
    v3 = *(_QWORD *)(a1 + 56);
    v4 = (id *)v21;
    v21[0] = CFSTR("Please wait. We detected changes in your library that require face analysis. There might be more faces to verify for this person once analysis completes.");
    v21[1] = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D475C0], "sharedAnalysisService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = 3221225472;
    v16[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_157;
    v16[3] = &unk_1E5140308;
    v17 = v5;
    v18 = CFSTR("Please wait. We detected changes in your library that require face analysis. There might be more faces to verify for this person once analysis completes.");
    v19 = *(_QWORD *)(a1 + 56);
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_3_167;
    v13[3] = &unk_1E5140358;
    v15 = v19;
    v16[0] = v2;
    v7 = *(_QWORD *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v8 = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v6, "requestFaceProcessingForPhotoLibrary:withOptions:progressHandler:andCompletionHandler:", v7, &unk_1E53F0F70, v16, v13);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_6;
    v11[3] = &unk_1E5149038;
    v4 = (id *)&v12;
    v10 = *(_OWORD *)(a1 + 48);
    v9 = (id)v10;
    v12 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
  }

}

uint64_t __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitle:", CFSTR("[INTERNAL ONLY] Running face analysis"));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMessage:", *(_QWORD *)(a1 + 32));
}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_157(uint64_t a1, double a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  double v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_2_158;
  v6[3] = &unk_1E51402E0;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v10 = a2;
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_3_167(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_4_168;
  block[3] = &unk_1E5140330;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_7;
  v3[3] = &unk_1E5148A40;
  v4 = v1;
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v3);

}

uint64_t __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_4_168(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_5;
  v4[3] = &unk_1E5148CE0;
  v6 = v2;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, v4);

}

uint64_t __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_2_158(uint64_t a1)
{
  double v2;
  unint64_t v3;
  void *v4;
  const __CFString *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v3 = vcvtpd_s64_f64(-v2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", *(_QWORD *)(a1 + 40));
  v6 = v4;
  v5 = CFSTR("seconds");
  if (v3 == 1)
    v5 = CFSTR("second");
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\nProgress after %ld %@: %.f%% complete."), v3, v5, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setMessage:", v6);

}

uint64_t __98__PXPeopleInternalAnnotationFlowManager__showFaceProcessingViewForPhotoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__PXPeopleInternalAnnotationFlowManager__shouldRunFaceProcessingForPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D47628]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

}

void __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "continueAnnotationFlow");

}

void __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(void);
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "metricsActionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearQueue");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "completion");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

}

void __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke_3(uint64_t a1, int a2)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_checkForNewMergeCandidatesAndAddReannotationItems");

    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_checkForNewGraphVerifiedPeopleAndAddReannotationItems");

    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "continueAnnotationFlow");

  }
}

uint64_t __63__PXPeopleInternalAnnotationFlowManager_continueAnnotationFlow__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
