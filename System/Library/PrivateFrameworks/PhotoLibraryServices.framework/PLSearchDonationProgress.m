@implementation PLSearchDonationProgress

- (PLSearchDonationProgress)initWithPathManager:(id)a3 contextProviderBlock:(id)a4
{
  id v7;
  id v8;
  PLSearchDonationProgress *v9;
  PLSearchDonationProgress *v10;
  uint64_t v11;
  id contextProviderBlock;
  PLSearchDonationProgressVersionProvider *v13;
  PLSearchDonationProgressVersionProvider *versionProvider;
  NSMutableDictionary *v15;
  NSMutableDictionary *progressByTaskID;
  NSMutableDictionary *v17;
  NSMutableDictionary *queryByTaskID;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLSearchDonationProgress;
  v9 = -[PLSearchDonationProgress init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pathManager, a3);
    v11 = MEMORY[0x19AEC174C](v8);
    contextProviderBlock = v10->_contextProviderBlock;
    v10->_contextProviderBlock = (id)v11;

    v13 = objc_alloc_init(PLSearchDonationProgressVersionProvider);
    versionProvider = v10->_versionProvider;
    v10->_versionProvider = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressByTaskID = v10->_progressByTaskID;
    v10->_progressByTaskID = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryByTaskID = v10->_queryByTaskID;
    v10->_queryByTaskID = v17;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)invalidate
{
  PLRunWithUnfairLock();
}

- (id)donationProgressForMediaProcessingTaskIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v19;
  id obj;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v7 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__53050;
  v33[4] = __Block_byref_object_dispose__53051;
  v34 = 0;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "unsignedIntegerValue", v19);
        dispatch_group_enter(v7);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke;
        v26[3] = &unk_1E3674C90;
        v28 = v33;
        v27 = v7;
        -[PLSearchDonationProgress donationProgressForMediaProcessingTaskID:completionHandler:](self, "donationProgressForMediaProcessingTaskID:completionHandler:", v12, v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v14 = dispatch_queue_create("-[PLSearchDonationProgress donationProgressForMediaProcessingTaskIDs:completionHandler:]", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke_2;
  block[3] = &unk_1E3676F20;
  v15 = v19;
  v24 = v15;
  v16 = v21;
  v23 = v16;
  v25 = v33;
  dispatch_group_notify(v7, v14, block);
  v17 = (void *)objc_msgSend(v16, "copy");

  _Block_object_dispose(v33, 8);
  return v17;
}

- (id)_newSearchQueryForTaskID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  id v25[2];
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = 0;
  v8 = 0;
  switch(a3)
  {
    case 1uLL:
      v7 = (id)*MEMORY[0x1E0CA6608];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLSearchDonationProgressVersionProvider mediaAnalysisVersion](self->_versionProvider, "mediaAnalysisVersion"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
      v7 = (id)*MEMORY[0x1E0CA6658];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLSearchDonationProgressVersionProvider sceneAnalysisVersion](self->_versionProvider, "sceneAnalysisVersion"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      v7 = (id)*MEMORY[0x1E0CA65C0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLSearchDonationProgressVersionProvider faceAnalysisVersion](self->_versionProvider, "faceAnalysisVersion"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_13;
    case 0xAuLL:
      v7 = (id)*MEMORY[0x1E0CA6590];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLSearchDonationProgressVersionProvider characterRecognitionAlgorithmVersion](self->_versionProvider, "characterRecognitionAlgorithmVersion"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    default:
      v8 = 0;
      if (a3 != 17)
        goto LABEL_13;
      v7 = (id)*MEMORY[0x1E0CA6600];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLSearchDonationProgressVersionProvider mediaAnalysisImageVersion](self->_versionProvider, "mediaAnalysisImageVersion"));
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v9;
      if (v7)
        v10 = v9 == 0;
      else
        v10 = 1;
      if (v10)
      {
LABEL_13:
        PLSearchBackendDonationProgressGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v11;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "No search query for taskID %@", buf, 0xCu);

        }
        v12 = 0;
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ == %@ && %@ >= %@"), *MEMORY[0x1E0CA6060], v14, v7, v8);
        v15 = objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("PLSearchDonationProgress:%@:%@"), v18, v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setReason:", v19);

        objc_msgSend(v16, "setDisableBlockingOnIndex:", 1);
        if (+[PLSpotlightDonationUtilities spotlightPrivateIndexEnabled](PLSpotlightDonationUtilities, "spotlightPrivateIndexEnabled"))
        {
          -[PLPhotoLibraryPathManager spotlightSearchIndexPath](self->_pathManager, "spotlightSearchIndexPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AF0]), "initWithPath:queryString:context:", v20, v15, v16);

        }
        else
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v15, v16);
        }
        v21 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke;
        v26[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
        v26[4] = a3;
        objc_msgSend(v12, "setFoundItemsHandler:", v26);
        objc_initWeak((id *)buf, self);
        v23[0] = v21;
        v23[1] = 3221225472;
        v23[2] = __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke_35;
        v23[3] = &unk_1E366BFE8;
        v25[1] = (id)a3;
        objc_copyWeak(v25, (id *)buf);
        v24 = v6;
        objc_msgSend(v12, "setCompletionHandler:", v23);

        objc_destroyWeak(v25);
        objc_destroyWeak((id *)buf);

      }
      return v12;
  }
}

- (id)_setupProgressForTaskID:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PLSearchDonationProgress *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLInternalPredicateForMediaProcessingTaskID(a3, 0, 0, 0, 0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0x7FFFFFFFFFFFFFFFLL;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__53050;
  v59 = __Block_byref_object_dispose__53051;
  v60 = 0;
  v11 = MEMORY[0x19AEC174C](self->_contextProviderBlock);
  v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_12;
  }
  else
  {
    PLSearchBackendDonationProgressGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Context provider block is nil", buf, 2u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0CB2938];
    v70[0] = CFSTR("Context provider block is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v56[5];
    v56[5] = v17;

  }
  if (!v56[5])
  {
    PLSearchBackendDonationProgressGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "MOC returned from context provider block is nil", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v67 = *MEMORY[0x1E0CB2938];
    v68 = CFSTR("MOC returned from context provider block is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v56[5];
    v56[5] = v22;

  }
  v13 = 0;
LABEL_12:
  v24 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke;
  v49[3] = &unk_1E366C010;
  v52 = &v61;
  v25 = v13;
  v50 = v25;
  v26 = v9;
  v51 = v26;
  v53 = &v55;
  v54 = a3;
  objc_msgSend(v25, "performBlockAndWait:", v49);
  if (v62[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6[2](v6, 0, v56[5]);
    v27 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v44 = buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__53050;
    v47 = __Block_byref_object_dispose__53051;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__53050;
    v41 = __Block_byref_object_dispose__53051;
    v42 = 0;
    v34 = self;
    v36 = a3;
    v28 = v6;
    PLRunWithUnfairLock();
    v29 = (void *)v38[5];
    if (v29)
    {
      objc_msgSend(v29, "start", v24, 3221225472, __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke_43, &unk_1E366C038, self, v28, buf, &v61, &v37, v36);
      v27 = *((id *)v44 + 5);
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2938];
      v66 = CFSTR("nil CSSearchQuery");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1, v24, 3221225472, __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke_43, &unk_1E366C038, v34, v28, buf, &v61, &v37, v36);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v28[2](v28, 0, v32);
      v27 = 0;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);

  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v27;
}

- (id)_updateProgressForTaskID:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__53050;
  v9 = __Block_byref_object_dispose__53051;
  v10 = 0;
  PLRunWithUnfairLock();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryByTaskID, 0);
  objc_storeStrong((id *)&self->_progressByTaskID, 0);
  objc_storeStrong((id *)&self->_versionProvider, 0);
  objc_storeStrong(&self->_contextProviderBlock, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

void __53__PLSearchDonationProgress__updateProgressForTaskID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1[4] + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (v4 && *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    PLSearchBackendDonationProgressGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "completedUnitCount");
      v15 = 138412802;
      v16 = v11;
      v17 = 2048;
      v18 = v12;
      v19 = 2048;
      v20 = objc_msgSend(v4, "foundItemCount");
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "taskID %@ updating completed count %lld to %llu", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setCompletedUnitCount:", objc_msgSend(v4, "foundItemCount"));
  }
  else
  {
    PLSearchBackendDonationProgressGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Unable to update progress for taskID %@", (uint8_t *)&v15, 0xCu);

    }
  }

}

void __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "countForFetchRequest:error:", v3, &v9);
  v5 = v9;
  v6 = v9;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLSearchBackendDonationProgressGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failure to get count of allowed assets for taskID %@: %@", buf, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
  }

}

void __70__PLSearchDonationProgress__setupProgressForTaskID_completionHandler___block_invoke_43(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v7)
  {
    objc_msgSend(v7, "setTotalUnitCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "_newSearchQueryForTaskID:completionHandler:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v17)
  {
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

  }
}

void __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendDonationProgressGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Query for taskID %@ found %@ items", (uint8_t *)&v7, 0x16u);

  }
}

void __71__PLSearchDonationProgress__newSearchQueryForTaskID_completionHandler___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLSearchBackendDonationProgressGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Query for taskID %@ completed with error: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateProgressForTaskID:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v3);

}

void __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __88__PLSearchDonationProgress_donationProgressForMediaProcessingTaskIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count") && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v2 = (void *)MEMORY[0x1E0CB35C8];
      v3 = *MEMORY[0x1E0D74498];
      v10 = *MEMORY[0x1E0CB2938];
      v11[0] = CFSTR("No valid child progress objects");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 41008, v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

void __38__PLSearchDonationProgress_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

}

@end
