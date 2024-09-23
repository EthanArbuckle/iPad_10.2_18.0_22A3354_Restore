@implementation PLBackgroundJobFeatureAvailabilityWorker

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker](PLBackgroundJobCriteria, "criteriaForDiscretionaryResourceWorker");
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  PLBackgroundJobWorkerPendingWorkItems *v8;
  void *v9;
  PLBackgroundJobWorkerPendingWorkItems *v10;
  NSObject *v11;
  uint64_t v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "globalValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeOfLastFeatureAvailabilityJob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;
  if (v6 >= 43200.0)
  {

LABEL_4:
    +[PLBackgroundJobCriteria criteriaForFeatureAvailabilityWorker](PLBackgroundJobCriteria, "criteriaForFeatureAvailabilityWorker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v13 = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v8, "initWithCriteria:workItemsNeedingProcessing:", v5, v9);

    goto LABEL_8;
  }
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v7;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - Job ran recently (%f seconds ago), no need to run again", buf, 0xCu);
  }

  v10 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
LABEL_8:

  return v10;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a4;
  v7 = a5;
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - starting feature availability computation", buf, 2u);
  }

  objc_msgSend(v6, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availabilityComputer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PLBackgroundJobFeatureAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v13[3] = &unk_1E366B078;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "computeAvailabilityForPhotoLibrary:shouldPersist:completionHandler:", v12, 1, v13);

}

void __83__PLBackgroundJobFeatureAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "PLBackgroundJobFeatureAvailabilityWorker - failed to compute availability, error: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeOfLastFeatureAvailabilityJob:", v6);

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  PLBackendGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - finished feature availability computation", (uint8_t *)&v11, 2u);
  }

}

@end
