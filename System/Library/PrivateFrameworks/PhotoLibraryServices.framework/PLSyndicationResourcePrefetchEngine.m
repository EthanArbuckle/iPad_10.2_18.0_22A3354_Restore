@implementation PLSyndicationResourcePrefetchEngine

- (PLSyndicationResourcePrefetchEngine)initWithDelegate:(id)a3
{
  id v4;
  PLSyndicationResourcePrefetchEngine *v5;
  PLSyndicationResourcePrefetchEngine *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLSyndicationResourcePrefetchEngine;
  v5 = -[PLSyndicationResourcePrefetchEngine init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)_resourcesForPrefetchWithManagedObjectContext:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  PLSyndicationResourcePrefetchEngine *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__79471;
  v21 = __Block_byref_object_dispose__79472;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PLSyndicationResourcePrefetchEngine__resourcesForPrefetchWithManagedObjectContext_predicate___block_invoke;
  v12[3] = &unk_1E3676EC8;
  v8 = v7;
  v13 = v8;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v15 = self;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)_fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadThrottlingDateForPrefetchManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceNow");
    if (v7 <= 0.0)
    {
      PLSyndicationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v10;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[resource.sync.throttle] %{public}@ server time limit for disabling network prefetch has expired (%{public}@), allowing network prefetch", (uint8_t *)&v13, 0x16u);

      }
      -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "prefetchManager:receivedNewDownloadThrottlingDate:managedObjectContext:", self, 0, v4);

      v6 = 0;
    }
  }

  return v6;
}

- (void)_prepareResourceForPrefetch:(id)a3
{
  int v3;
  __int16 v4;
  double v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "clearRequiresSanitizationFlag");
  v3 = objc_msgSend(v8, "cloudPrefetchCount");
  v4 = v3;
  v5 = 86400.0;
  if (v3)
  {
    v6 = v3;
    do
    {
      v5 = v5 + v5;
      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCloudLastPrefetchDate:", v7);
  objc_msgSend(v8, "setCloudPrefetchCount:", (__int16)(v4 + 1));

}

- (void)_handleDownloadFinishedWithSuccess:(BOOL)a3 error:(id)a4 resource:(id)a5 downloadThrottlingDate:(id)a6 networkAccessAllowed:(BOOL)a7 managedObjectContext:(id)a8
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v12 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCloudLastPrefetchDate:", v18);

    objc_msgSend(v15, "setCloudPrefetchCount:", 0);
  }
  else
  {
    if (PLErrorOrUnderlyingErrorHasDomainAndCode())
      objc_msgSend(v15, "setSyndicationLocalAvailabilityWithAvailable:additionalFlags:", 0, 4);
    if (PLUnderlyingErrorIsSyndicationMessagesNeedsDownload(v14) && !a7)
    {
      if (v16)
      {
        objc_msgSend(v15, "setCloudLastPrefetchDate:", v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCloudLastPrefetchDate:", v19);

      }
      objc_msgSend(v15, "setCloudPrefetchCount:", 0);
      PLSyndicationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v22;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "[resource.sync] %{public}@ downloads not permitted, will try again when network access allowed", buf, 0xCu);

      }
    }
    v30 = 0;
    PLUnderlyingErrorIsSyndicationMessagesRetry(v14, &v30);
    v24 = v23;
    v25 = v30;
    if (v24)
    {
      -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "prefetchManager:receivedNewDownloadThrottlingDate:managedObjectContext:", self, v25, v17);

      PLSyndicationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v29;
        v33 = 2114;
        v34 = v25;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "[resource.sync.throttle] %{public}@ server has indicated that network prefetch should be disabled until: %{public}@", buf, 0x16u);

      }
      objc_msgSend(v15, "setCloudLastPrefetchDate:", v25);
      objc_msgSend(v15, "setCloudPrefetchCount:", 0);
    }

  }
}

- (id)highPriorityResourcesForPrefetchWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PLInternalResource predicateForSyndicationResourcesRequiringSanitization](PLInternalResource, "predicateForSyndicationResourcesRequiringSanitization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSyndicationResourcePrefetchEngine _resourcesForPrefetchWithManagedObjectContext:predicate:](self, "_resourcesForPrefetchWithManagedObjectContext:predicate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lowPriorityResourcesForPrefetchWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PLInternalResource predicateForSyndicationResourcesRequiringBackgroundDownload](PLInternalResource, "predicateForSyndicationResourcesRequiringBackgroundDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSyndicationResourcePrefetchEngine _resourcesForPrefetchWithManagedObjectContext:predicate:](self, "_resourcesForPrefetchWithManagedObjectContext:predicate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prefetchResourceWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PLSyndicationResourcePrefetchEngine *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__79471;
  v22[4] = __Block_byref_object_dispose__79472;
  v23 = 0;
  -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke;
  v19[3] = &unk_1E3671E68;
  v21 = v22;
  v19[4] = self;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v8, "performTransactionForPrefetchManager:synchronous:block:", self, 1, v19);

  -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_2;
  v14[3] = &unk_1E3671EE0;
  v12 = v10;
  v15 = v12;
  v16 = self;
  v18 = v22;
  v13 = v7;
  v17 = v13;
  objc_msgSend(v11, "performTransactionForPrefetchManager:synchronous:block:", self, 0, v14);

  _Block_object_dispose(v22, 8);
}

- (void)prefetchResourceWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  qos_class_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  PLResourceLocalAvailabilityRequestOptions *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  dispatch_queue_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  NSObject *v37;
  PLSyndicationResourcePrefetchEngine *v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  NSObject *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD v47[4];
  _QWORD v48[5];
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD v56[5];
  id v57;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v9 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(0, v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.photos.syndicationPrefetch", v10);

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__79471;
  v56[4] = __Block_byref_object_dispose__79472;
  v57 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = v11;
  v33 = v7;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke;
  v48[3] = &unk_1E3671F58;
  v55 = v56;
  v48[4] = self;
  v18 = v6;
  v49 = v18;
  v31 = v15;
  v50 = v31;
  v19 = v8;
  v51 = v19;
  v20 = v12;
  v52 = v20;
  v34 = v13;
  v53 = v34;
  v21 = v14;
  v54 = v21;
  objc_msgSend(v16, "performTransactionForPrefetchManager:synchronous:block:", self, 1, v48);

  v22 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
  -[PLResourceLocalAvailabilityRequestOptions setNetworkAccessAllowed:](v22, "setNetworkAccessAllowed:", 1);
  v30 = v18;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11458]), "initWithIntent:priority:", 5, 2);
  -[PLResourceLocalAvailabilityRequestOptions setDownloadOptions:](v22, "setDownloadOptions:", v23);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v24 = objc_msgSend(v20, "count");
  -[PLSyndicationResourcePrefetchEngine delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  v42[1] = 3221225472;
  v42[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_41;
  v42[3] = &unk_1E3671FF8;
  v42[4] = self;
  v26 = v21;
  v43 = v26;
  v44 = v19;
  v45 = v47;
  v46 = v56;
  v35[0] = v17;
  v35[1] = 3221225472;
  v35[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_53;
  v35[3] = &unk_1E3672048;
  v27 = v44;
  v36 = v27;
  v28 = v32;
  v37 = v28;
  v38 = self;
  v40 = v47;
  v41 = v24;
  v29 = v33;
  v39 = v29;
  objc_msgSend(v25, "batchRequestResourcesForPrefetchManager:itemIdentifiersWithBundleIDs:destURLs:options:resultHandler:completionHandler:", self, v20, v34, v22, v42, v35);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v56, 8);

}

- (PLSyndicationResourcePrefetchEngineDelegate)delegate
{
  return (PLSyndicationResourcePrefetchEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  PLResourceLocalAvailabilityRequestOptions *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  _QWORD v60[5];
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  NSObject *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  _QWORD v76[2];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "_fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *((_QWORD *)a1[11] + 1);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v7 = a1[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v8)
  {
    v9 = v8;
    v57 = *(_QWORD *)v67;
    v52 = (void *)*MEMORY[0x1E0CEC5B0];
    v55 = v7;
    v53 = a1;
    v54 = v3;
    do
    {
      v10 = 0;
      v56 = v9;
      do
      {
        if (*(_QWORD *)v67 != v57)
          objc_enumerationMutation(v7);
        v11 = *(NSObject **)(*((_QWORD *)&v66 + 1) + 8 * v10);
        v65 = 0;
        objc_msgSend(v3, "existingObjectWithID:error:", v11, &v65);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v65;
        v14 = v13;
        if (v12)
        {
          v58 = v13;
          objc_msgSend(v12, "asset");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "additionalAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "syndicationIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "asset");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "additionalAttributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "importedByBundleIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();

          v59 = (void *)v20;
          if (v17)
            v21 = v20 == 0;
          else
            v21 = 1;
          if (v21)
          {
            PLSyndicationGetLog();
            v22 = (PLResourceLocalAvailabilityRequestOptions *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v22->super, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v12, "objectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v71 = v17;
              v72 = 2114;
              v73 = v59;
              v74 = 2114;
              v75 = v23;
              _os_log_impl(&dword_199541000, &v22->super, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset missing syndicationIdentifier (%{public}@) or bundleID (%{public}@), skipping resource with object id: %{public}@", buf, 0x20u);

            }
LABEL_20:
            v14 = v58;
          }
          else
          {
            objc_msgSend(a1[4], "_prepareResourceForPrefetch:", v12);
            objc_msgSend(v12, "asset");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "syndicationOriginalResourcesAreLocal");

            if (v25)
            {
              v26 = a1[6];
              objc_msgSend(v12, "objectID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v27);

              objc_msgSend(v12, "asset");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "uuid");
              v29 = objc_claimAutoreleasedReturnValue();

              PLSyndicationGetLog();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v71 = v29;
                _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] attempting to generate derivative for asset with local originals: %{public}@", buf, 0xCu);
              }

              dispatch_group_enter((dispatch_group_t)a1[7]);
              v22 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
              objc_msgSend(a1[4], "delegate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = a1[4];
              v60[0] = MEMORY[0x1E0C809B0];
              v60[1] = 3221225472;
              v60[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_39;
              v60[3] = &unk_1E3671F30;
              v60[4] = v32;
              v61 = v29;
              v33 = v12;
              v34 = a1[11];
              v62 = v33;
              v64 = v34;
              v63 = a1[7];
              v35 = v29;
              v36 = (id)objc_msgSend(v31, "requestLocalAvailabilityChangeForPrefetchManager:resource:options:completion:", v32, v33, v22, v60);

              v7 = v55;
              v9 = v56;
              goto LABEL_20;
            }
            objc_msgSend(v12, "asset");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "syndicationOriginalResource");
            v22 = (PLResourceLocalAvailabilityRequestOptions *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v12, "asset");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[PLResourceLocalAvailabilityRequestOptions resourceType](v22, "resourceType");
              v40 = -[PLResourceLocalAvailabilityRequestOptions version](v22, "version");
              v41 = -[PLResourceLocalAvailabilityRequestOptions recipeID](v22, "recipeID");
              -[PLResourceLocalAvailabilityRequestOptions uniformTypeIdentifier](v22, "uniformTypeIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "identifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "syndicationResourceURLForResourceType:version:recipeID:utiString:error:", v39, v40, v41, v43, 0);
              v44 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "asset");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "identifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "syndicationResourceURLForResourceType:version:recipeID:utiString:error:", 3, 0, 0, v46, 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44 && v47)
              {
                a1 = v53;
                objc_msgSend(v53[8], "setObject:forKey:", v59, v17);
                v76[0] = v44;
                v76[1] = v47;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53[9], "setObject:forKeyedSubscript:", v48, v17);

                objc_msgSend(v12, "objectID");
                v49 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53[10], "setObject:forKeyedSubscript:", v49, v17);
              }
              else
              {
                PLSyndicationGetLog();
                v49 = objc_claimAutoreleasedReturnValue();
                a1 = v53;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v12, "objectID");
                  v51 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v71 = v51;
                  _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset has malformed original URL, skipping resource with object id: %{public}@", buf, 0xCu);

                }
              }
              v3 = v54;
              v7 = v55;

            }
            else
            {
              PLSyndicationGetLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v12, "objectID");
                v50 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v71 = v50;
                _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset missing original resource, skipping resource with object id: %{public}@", buf, 0xCu);

              }
            }
            v14 = v58;

            v9 = v56;
          }

          goto LABEL_32;
        }
        PLSyndicationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v71 = v11;
          v72 = 2112;
          v73 = v14;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "[resource.prefetch] unable to fetch resource with object id: %{public}@, error: %@", buf, 0x16u);
        }
LABEL_32:

        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v9);
  }

}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_41(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  PLSyndicationGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v19;
      v37 = 2114;
      v38 = v11;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] %{public}@ prefetched file for identifier: %{public}@, fileURL: %@, secondary fileURL: %@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_42;
    v26[3] = &unk_1E3671FD0;
    v21 = *(_QWORD *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    v28 = v11;
    v29 = v12;
    v30 = v13;
    v31 = v14;
    v22 = *(id *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 32);
    v32 = v22;
    v33 = v23;
    v34 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v20, "performTransactionForPrefetchManager:synchronous:block:", v21, 1, v26);

    v17 = v27;
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v25;
    v37 = 2114;
    v38 = v11;
    v39 = 2112;
    v40 = v15;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "[resource.prefetch] %{public}@ failed to prefetch file with identifier: %{public}@, error: %@", buf, 0x20u);

  }
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_2;
  block[3] = &unk_1E3672020;
  v6 = *(_QWORD *)(a1 + 48);
  v11 = v3;
  v12 = v6;
  v9 = *(_OWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 72);
  v7 = (id)v9;
  v13 = v9;
  v8 = v3;
  dispatch_group_notify(v4, v5, block);

}

uint64_t __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PLSyndicationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v8 = "[resource.prefetch] %{public}@ batch download request failed with error: %@";
      v9 = v4;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v9, v10, v8, (uint8_t *)&v17, v11);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v17 = 138543874;
    v18 = v6;
    v19 = 2048;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v8 = "[resource.prefetch] %{public}@ batch download request completed, %tu out of %tu items generated successfully";
    v9 = v4;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 32;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v14, v15);
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  char v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  char v40;
  PLResourceLocalAvailabilityRequestOptions *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  void *v48;
  uint64_t v49;
  BOOL v50;
  id v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  char v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  int v71;
  NSObject *v72;
  void *v73;
  _QWORD v74[4];
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint8_t buf[4];
  id v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  objc_msgSend(v5, "existingObjectWithID:error:", v6, &v88);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v88;
  v73 = v8;
  if (v7)
  {
    objc_msgSend(v7, "asset");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      PLSyndicationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        v90 = v10;
        v91 = 2112;
        v92 = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] setting filename and directory for asset: %{public}@ with original filename: %@", buf, 0x16u);
      }

      objc_msgSend(v9, "setSyndicationFilenameAndDirectoryWithOriginalFilename:", *(_QWORD *)(a1 + 64));
    }
    if (!objc_msgSend(v9, "isPhoto")
      || (objc_msgSend(v9, "isPhotoIris") & 1) != 0
      || (v14 = *(void **)(a1 + 56)) == 0)
    {
      v21 = 0;
      goto LABEL_15;
    }
    v15 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v14, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "typeWithFilenameExtension:conformingToType:", v16, *MEMORY[0x1E0CEC568]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && (objc_msgSend(v17, "isDynamic") & 1) == 0)
    {
      v71 = objc_msgSend(v9, "becomeSyndicationLivePhotoWithVideoComplementContentType:", v17);
      PLSyndicationGetLog();
      v72 = objc_claimAutoreleasedReturnValue();
      v18 = v72;
      if (v71)
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v90 = v10;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] found video complement URL, promoted asset (%{public}@) to live photo", buf, 0xCu);
        }
        v21 = 1;
        goto LABEL_69;
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v90 = v10;
        v91 = 2114;
        v92 = v19;
        v20 = "[resource.prefetch] failed to promote asset to live photo: %{public}@, content type: %{public}@";
        goto LABEL_13;
      }
    }
    else
    {
      PLSyndicationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 56), "pathExtension");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v90 = v19;
        v91 = 2114;
        v92 = v10;
        v20 = "[resource.prefetch] ignoring video complement with unexpected uti for file extension: %{public}@, asset: %{public}@";
LABEL_13:
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);

      }
    }
    v21 = 0;
LABEL_69:

LABEL_15:
    if (!*(_QWORD *)(a1 + 48))
      goto LABEL_38;
    objc_msgSend(v9, "syndicationOriginalResource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v9, "syndicationOriginalResource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 48);
      v85 = 0;
      v25 = +[PLSyndicationResourceDataStore markResource:purgeableAndLocallyAvailableWithFileURL:error:](PLSyndicationResourceDataStore, "markResource:purgeableAndLocallyAvailableWithFileURL:error:", v23, v24, &v85);
      v26 = v85;

      if (v25)
      {
LABEL_37:

LABEL_38:
        if (!*(_QWORD *)(a1 + 56))
        {
LABEL_59:
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 72));
          v41 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
          objc_msgSend(*(id *)(a1 + 80), "delegate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_46;
          v74[3] = &unk_1E3671FA8;
          v66 = *(_QWORD *)(a1 + 88);
          v75 = *(_QWORD *)(a1 + 80);
          v76 = v10;
          v79 = v66;
          v67 = v7;
          v68 = *(_QWORD *)(a1 + 96);
          v77 = v67;
          v80 = v68;
          v78 = *(id *)(a1 + 72);
          v69 = v10;
          v70 = (id)objc_msgSend(v65, "requestLocalAvailabilityChangeForPrefetchManager:resource:options:completion:", v75, v67, v41, v74);

          goto LABEL_60;
        }
        if ((v21 & 1) != 0 || objc_msgSend(v9, "isPhotoIris"))
        {
          objc_msgSend(v9, "syndicationOriginalVideoComplementResource");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_msgSend(v9, "syndicationOriginalVideoComplementResource");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = *(_QWORD *)(a1 + 56);
            v83 = 0;
            v50 = +[PLSyndicationResourceDataStore markResource:purgeableAndLocallyAvailableWithFileURL:error:](PLSyndicationResourceDataStore, "markResource:purgeableAndLocallyAvailableWithFileURL:error:", v48, v49, &v83);
            v51 = v83;

            if (v50)
            {
LABEL_58:

              goto LABEL_59;
            }
            PLSyndicationGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
LABEL_57:

              goto LABEL_58;
            }
            *(_DWORD *)buf = 138543618;
            v90 = v10;
            v91 = 2112;
            v92 = v51;
            v53 = "[resource.prefetch] failed to mark video complement resource as locally available for asset: %{public}@, error: %@";
            v54 = v52;
            v55 = 22;
LABEL_56:
            _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
            goto LABEL_57;
          }
          PLSyndicationGetLog();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v57 = *(void **)(a1 + 56);
            *(_DWORD *)buf = 138543618;
            v90 = v10;
            v91 = 2112;
            v92 = v57;
            _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset %{public}@ does not have a video complement resource, cannot ingest file at url: %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = *(_QWORD *)(a1 + 56);
          v82 = 0;
          v60 = objc_msgSend(v58, "removeItemAtURL:error:", v59, &v82);
          v51 = v82;

          if ((v60 & 1) != 0)
            goto LABEL_58;
          PLSyndicationGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            goto LABEL_57;
          *(_DWORD *)buf = 138412290;
          v90 = v51;
          v53 = "[resource.prefetch] failed to remove erroneous video complement file: %@";
        }
        else
        {
          PLSyndicationGetLog();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v90 = v10;
            _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "[resource.prefetch] received video complement file for non-live photo asset: %{public}@, removing", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = *(_QWORD *)(a1 + 56);
          v81 = 0;
          v64 = objc_msgSend(v62, "removeItemAtURL:error:", v63, &v81);
          v51 = v81;

          if ((v64 & 1) != 0)
            goto LABEL_58;
          PLSyndicationGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            goto LABEL_57;
          *(_DWORD *)buf = 138412290;
          v90 = v51;
          v53 = "[resource.prefetch] failed to remove erroneous video complement file: %@";
        }
        v54 = v52;
        v55 = 12;
        goto LABEL_56;
      }
      PLSyndicationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

        goto LABEL_37;
      }
      *(_DWORD *)buf = 138543618;
      v90 = v10;
      v91 = 2112;
      v92 = v26;
      v28 = "[resource.prefetch] failed to mark original resource as locally available for asset: %{public}@, error: %@";
      v29 = v27;
      v30 = 22;
    }
    else
    {
      PLSyndicationGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v90 = v10;
        v91 = 2112;
        v92 = v43;
        _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "[resource.prefetch] asset %{public}@ does not have an original resource, cannot ingest file at url: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = *(_QWORD *)(a1 + 48);
      v84 = 0;
      v46 = objc_msgSend(v44, "removeItemAtURL:error:", v45, &v84);
      v26 = v84;

      if ((v46 & 1) != 0)
        goto LABEL_37;
      PLSyndicationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_DWORD *)buf = 138412290;
      v90 = v26;
      v28 = "[resource.prefetch] failed to remove erroneous original file: %@";
      v29 = v27;
      v30 = 12;
    }
    _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_36;
  }
  v31 = v8;
  PLSyndicationGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v90 = v6;
    v91 = 2112;
    v92 = v31;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "[resource.prefetch] unable to fetch resource with object id: %{public}@, error: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *(_QWORD *)(a1 + 48);
  v87 = 0;
  v35 = objc_msgSend(v33, "removeItemAtURL:error:", v34, &v87);
  v36 = v87;

  if ((v35 & 1) == 0)
  {
    PLSyndicationGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v90 = v36;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "[resource.prefetch] failed to clean up file after resource fetch failure: %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(a1 + 56);
    v86 = v36;
    v40 = objc_msgSend(v38, "removeItemAtURL:error:", v39, &v86);
    v9 = v86;

    if ((v40 & 1) != 0)
    {
LABEL_61:
      v36 = v9;
      goto LABEL_62;
    }
    PLSyndicationGetLog();
    v41 = (PLResourceLocalAvailabilityRequestOptions *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v41->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v90 = v9;
      _os_log_impl(&dword_199541000, &v41->super, OS_LOG_TYPE_ERROR, "[resource.prefetch] failed to clean up file after resource fetch failure: %@", buf, 0xCu);
    }
LABEL_60:

    goto LABEL_61;
  }
LABEL_62:

}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_46(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  PLSyndicationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = CFSTR("N");
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    if (v7)
      v12 = CFSTR("Y");
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] %{public}@ finished generating derivative for asset: %{public}@ with success: %{public}@", buf, 0x20u);

  }
  if (v7)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_51;
  v18[3] = &unk_1E3671F80;
  v22 = v7 != 0;
  v18[4] = v14;
  v19 = v6;
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 72);
  v20 = v15;
  v21 = v16;
  v17 = v6;
  objc_msgSend(v13, "performTransactionForPrefetchManager:synchronous:block:", v14, 1, v18);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_51(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDownloadFinishedWithSuccess:error:resource:downloadThrottlingDate:networkAccessAllowed:managedObjectContext:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1, a2);
}

void __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_39(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  PLSyndicationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[resource.prefetch] %{public}@ finished generating derivative for asset: %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_40;
  v18[3] = &unk_1E3671F08;
  v18[4] = v13;
  v19 = v7;
  v20 = v6;
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 64);
  v21 = v14;
  v22 = v15;
  v16 = v6;
  v17 = v7;
  objc_msgSend(v12, "performTransactionForPrefetchManager:synchronous:block:", v13, 1, v18);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __80__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectIDs_completion___block_invoke_40(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDownloadFinishedWithSuccess:error:resource:downloadThrottlingDate:networkAccessAllowed:managedObjectContext:", *(_QWORD *)(a1 + 40) != 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 1, a2);
}

void __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_fetchDownloadThrottlingDateAndClearIfNeededWithManagedObjectContext:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v4, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_prepareResourceForPrefetch:", v8);
}

void __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  PLResourceLocalAvailabilityRequestOptions *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  BOOL v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v27 = 0;
  objc_msgSend(a2, "existingObjectWithID:error:", v3, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  PLSyndicationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "singleLineDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[resource.sync] %{public}@ performing work on resource: %@", buf, 0x16u);

    }
    v11 = objc_alloc_init(PLResourceLocalAvailabilityRequestOptions);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isNetworkAccessAllowed"))
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == 0;
    else
      v13 = 0;

    -[PLResourceLocalAvailabilityRequestOptions setNetworkAccessAllowed:](v11, "setNetworkAccessAllowed:", v13);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11458]), "initWithIntent:priority:", 0, 2);
    -[PLResourceLocalAvailabilityRequestOptions setDownloadOptions:](v11, "setDownloadOptions:", v17);

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_27;
    v23[3] = &unk_1E3671EB8;
    v23[4] = v19;
    v24 = v4;
    v26 = v13;
    v22 = *(_OWORD *)(a1 + 48);
    v20 = (id)v22;
    v25 = v22;
    v21 = (id)objc_msgSend(v18, "requestLocalAvailabilityChangeForPrefetchManager:resource:options:completion:", v19, v24, v11, v23);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "[resource.sync] %{public}@ failed to fetch resource with object ID: %{public}@, error: %@", buf, 0x20u);

    }
    v11 = (PLResourceLocalAvailabilityRequestOptions *)PLErrorCreate();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_27(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = (unint64_t)v6;
  v9 = (void *)v8;
  if (v8 | v7)
  {
    v10 = (void *)v8;
    if (v7)
    {
      PLSyndicationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v13;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[resource.sync] %{public}@ generated image derivative", buf, 0xCu);

      }
      v10 = v9;
      goto LABEL_9;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v39 = *MEMORY[0x1E0CB2938];
    v40[0] = CFSTR("unknown error sanitizing syndication resource");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 47001, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  PLSyndicationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v18;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[resource.sync] %{public}@ error generating image derivative: %@", buf, 0x16u);

  }
LABEL_9:

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_32;
  v28[3] = &unk_1E3671E90;
  v20 = *(void **)(a1 + 40);
  v29 = *(_QWORD *)(a1 + 32);
  v30 = (id)v7;
  v31 = v10;
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 56);
  v32 = v21;
  v33 = v22;
  v34 = *(_BYTE *)(a1 + 64);
  v23 = v10;
  v24 = (id)v7;
  objc_msgSend(v19, "performTransactionForPrefetchManager:synchronous:block:", v29, 1, v28);

  (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v23, v25, v26, v27);
}

uint64_t __79__PLSyndicationResourcePrefetchEngine_prefetchResourceWithObjectID_completion___block_invoke_32(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDownloadFinishedWithSuccess:error:resource:downloadThrottlingDate:networkAccessAllowed:managedObjectContext:", *(_QWORD *)(a1 + 40) != 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(unsigned __int8 *)(a1 + 72), a2);
}

void __95__PLSyndicationResourcePrefetchEngine__resourcesForPrefetchWithManagedObjectContext_predicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(v4, "setFetchLimit:", 100);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.addedDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v4, &v15);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "[resource.sync] %{public}@ failed to fetch work items with error: %@", buf, 0x16u);

    }
  }

}

@end
