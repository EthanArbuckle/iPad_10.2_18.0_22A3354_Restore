@implementation PXPeopleProgressDataSource

- (PXPeopleProgressDataSource)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXPeopleProgressDataSource *v6;
  PXPeopleProgressDataSource *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *scanningProgressQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *personPromoterQueue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleProgressDataSource;
  v6 = -[PXPeopleProgressDataSource init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC4860];
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__logFaceCounts, *MEMORY[0x1E0DC4850], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_appWillEnterForeground, v9, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.people.progressDataSource.scanningProgress", v10);
    scanningProgressQueue = v7->_scanningProgressQueue;
    v7->_scanningProgressQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.people.progressDataSource.personPromoter", v13);
    personPromoterQueue = v7->_personPromoterQueue;
    v7->_personPromoterQueue = (OS_dispatch_queue *)v14;

    v7->_progressLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleProgressDataSource;
  -[PXPeopleProgressDataSource dealloc](&v4, sel_dealloc);
}

- (BOOL)isReadyForAnalysis
{
  -[PXPeopleProgressDataSource updateProgressIfNeededWithReportBlock:](self, "updateProgressIfNeededWithReportBlock:", 0);
  return self->_isReadyForAnalysis;
}

- (int64_t)allowedAssetCount
{
  -[PXPeopleProgressDataSource updateProgressIfNeededWithReportBlock:](self, "updateProgressIfNeededWithReportBlock:", 0);
  return self->_allowedAssetCount;
}

- (int64_t)processedToLatestVersionAssetCount
{
  -[PXPeopleProgressDataSource updateProgressIfNeededWithReportBlock:](self, "updateProgressIfNeededWithReportBlock:", 0);
  return self->_processedToLatestVersionAssetCount;
}

- (int64_t)processedToAnyVersionAssetCount
{
  -[PXPeopleProgressDataSource updateProgressIfNeededWithReportBlock:](self, "updateProgressIfNeededWithReportBlock:", 0);
  return self->_processedToAnyVersionAssetCount;
}

- (int64_t)pendingToLatestVersionAssetCount
{
  -[PXPeopleProgressDataSource updateProgressIfNeededWithReportBlock:](self, "updateProgressIfNeededWithReportBlock:", 0);
  return self->_pendingToLatestVersionAssetCount;
}

- (int64_t)pendingToAnyVersionAssetCount
{
  -[PXPeopleProgressDataSource updateProgressIfNeededWithReportBlock:](self, "updateProgressIfNeededWithReportBlock:", 0);
  return self->_pendingToAnyVersionAssetCount;
}

- (BOOL)hasHomePeople
{
  void *v3;
  BOOL v4;
  os_unfair_lock_s lock;

  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressDataSource progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  -[PXPeopleProgressDataSource homeResult](self, "homeResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&lock);
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)loadQueryData
{
  void *v3;
  void *v4;
  os_unfair_lock_s lock;

  -[PXPeopleProgressDataSource photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_registerChangeObserver:", self);

  -[PXPeopleProgressDataSource _fetchPeople](self, "_fetchPeople");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressDataSource progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  -[PXPeopleProgressDataSource setHomeResult:](self, "setHomeResult:", v4);
  os_unfair_lock_unlock(&lock);

}

- (void)updateProgressIfNeededWithReportBlock:(id)a3
{
  id v4;
  BOOL v5;
  os_unfair_lock_s lock;

  v4 = a3;
  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressDataSource progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  v5 = -[PXPeopleProgressDataSource countCacheValid](self, "countCacheValid");
  os_unfair_lock_unlock(&lock);
  if (!v5)
    -[PXPeopleProgressDataSource syncUpdateProgressWithReportBlock:](self, "syncUpdateProgressWithReportBlock:", v4);

}

- (void)asyncUpdateProgressWithReportBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXPeopleProgressDataSource scanningProgressQueue](self, "scanningProgressQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PXPeopleProgressDataSource_asyncUpdateProgressWithReportBlock___block_invoke;
  v7[3] = &unk_1E5148CE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)requestPersonPromoterStatusWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleProgressDataSource.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  objc_initWeak(&location, self);
  -[PXPeopleProgressDataSource personPromoterQueue](self, "personPromoterQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v11, &location);
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- ($DF4FB41D2F0E3F59E20087ACD782DC9D)progressReportForLibrary:(SEL)a3
{
  return ($DF4FB41D2F0E3F59E20087ACD782DC9D *)objc_msgSend(MEMORY[0x1E0D77E90], "faceProcessingProgressForLibrary:", a4);
}

- (void)syncUpdateProgressWithReportBlock:(id)a3
{
  void (**v4)(id, _BOOL8, int64_t, int64_t, double, double);
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  __int128 v11;
  uint64_t v12;
  double v13;
  double v14;
  __int128 v15;
  uint64_t v16;

  v4 = (void (**)(id, _BOOL8, int64_t, int64_t, double, double))a3;
  v5 = -[PXPeopleProgressDataSource isPhotoLibraryReadyForAnalysis](self, "isPhotoLibraryReadyForAnalysis");
  if (v5)
  {
    -[PXPeopleProgressDataSource photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleProgressDataSource progressReportForLibrary:](self, "progressReportForLibrary:", v6);
    v15 = v11;
    v16 = v12;
    v7 = v13;
    v8 = v14;

  }
  else
  {
    +[PXPeopleProgressDataSource _invalidProgressReport](PXPeopleProgressDataSource, "_invalidProgressReport");
    v15 = v11;
    v16 = v12;
    v7 = v13;
    v8 = v14;
  }
  v11 = v15;
  v12 = v16;
  v13 = v7;
  v14 = v8;
  -[PXPeopleProgressDataSource updateProgressFromIsReadyForAnalysis:progressReport:](self, "updateProgressFromIsReadyForAnalysis:progressReport:", v5, &v11);
  if (v4)
  {
    LODWORD(v11) = -[PXPeopleProgressDataSource progressLock](self, "progressLock");
    os_unfair_lock_lock((os_unfair_lock_t)&v11);
    v9 = -[PXPeopleProgressDataSource processedToLatestVersionAssetCount](self, "processedToLatestVersionAssetCount");
    v10 = -[PXPeopleProgressDataSource processedToAnyVersionAssetCount](self, "processedToAnyVersionAssetCount");
    os_unfair_lock_unlock((os_unfair_lock_t)&v11);
    v4[2](v4, v5, v9, v10, v7, v8);
  }

}

- (BOOL)isPhotoLibraryReadyForAnalysis
{
  void *v2;
  char v3;

  -[PXPeopleProgressDataSource photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadyForAnalysis_FOR_UI_USE_ONLY");

  return v3;
}

- (id)_fetchPeople
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXPeopleProgressDataSource photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v4);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateProgressFromIsReadyForAnalysis:(BOOL)a3 progressReport:(id *)a4
{
  _BOOL8 v4;
  int64_t var0;
  int64_t var1;
  int64_t var2;
  os_unfair_lock_s lock;

  v4 = a3;
  var0 = a4->var0;
  var1 = a4->var1;
  var2 = a4->var2;
  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressDataSource progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  -[PXPeopleProgressDataSource setAllowedAssetCount:](self, "setAllowedAssetCount:", var0);
  -[PXPeopleProgressDataSource setProcessedToLatestVersionAssetCount:](self, "setProcessedToLatestVersionAssetCount:", var1);
  -[PXPeopleProgressDataSource setProcessedToAnyVersionAssetCount:](self, "setProcessedToAnyVersionAssetCount:", var2);
  -[PXPeopleProgressDataSource setPendingToLatestVersionAssetCount:](self, "setPendingToLatestVersionAssetCount:", +[PXPeopleProgressDataSource pendingCountForAllowedCount:processedCount:](PXPeopleProgressDataSource, "pendingCountForAllowedCount:processedCount:", var0, var1));
  -[PXPeopleProgressDataSource setPendingToAnyVersionAssetCount:](self, "setPendingToAnyVersionAssetCount:", +[PXPeopleProgressDataSource pendingCountForAllowedCount:processedCount:](PXPeopleProgressDataSource, "pendingCountForAllowedCount:processedCount:", var0, var2));
  -[PXPeopleProgressDataSource setIsReadyForAnalysis:](self, "setIsReadyForAnalysis:", v4);
  -[PXPeopleProgressDataSource setCountCacheValid:](self, "setCountCacheValid:", 1);
  os_unfair_lock_unlock(&lock);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  os_unfair_lock_s lock;

  v5 = a3;
  -[PXPeopleProgressDataSource homeResult](self, "homeResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForFetchResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "fetchResultAfterChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressDataSource progressLock](self, "progressLock");
    os_unfair_lock_lock(&lock);
    -[PXPeopleProgressDataSource setHomeResult:](self, "setHomeResult:", v8);
    -[PXPeopleProgressDataSource setCountCacheValid:](self, "setCountCacheValid:", 0);
    os_unfair_lock_unlock(&lock);
    if (!objc_msgSend(v8, "count"))
    {
      v9 = dispatch_time(0, 200000000);
      dispatch_after(v9, MEMORY[0x1E0C80D38], &__block_literal_global_152763);
    }

  }
}

- (void)appWillEnterForeground
{
  os_unfair_lock_s lock;

  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressDataSource progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  -[PXPeopleProgressDataSource setAllowedAssetCount:](self, "setAllowedAssetCount:", 0);
  -[PXPeopleProgressDataSource setProcessedToLatestVersionAssetCount:](self, "setProcessedToLatestVersionAssetCount:", 0);
  -[PXPeopleProgressDataSource setProcessedToAnyVersionAssetCount:](self, "setProcessedToAnyVersionAssetCount:", 0);
  -[PXPeopleProgressDataSource setPendingToLatestVersionAssetCount:](self, "setPendingToLatestVersionAssetCount:", 0);
  -[PXPeopleProgressDataSource setPendingToAnyVersionAssetCount:](self, "setPendingToAnyVersionAssetCount:", 0);
  -[PXPeopleProgressDataSource setCountCacheValid:](self, "setCountCacheValid:", 0);
  os_unfair_lock_unlock(&lock);
}

- (void)_logFaceCounts
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PXPeopleProgressDataSource__logFaceCounts__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setIsReadyForAnalysis:(BOOL)a3
{
  self->_isReadyForAnalysis = a3;
}

- (void)setAllowedAssetCount:(int64_t)a3
{
  self->_allowedAssetCount = a3;
}

- (void)setProcessedToLatestVersionAssetCount:(int64_t)a3
{
  self->_processedToLatestVersionAssetCount = a3;
}

- (void)setProcessedToAnyVersionAssetCount:(int64_t)a3
{
  self->_processedToAnyVersionAssetCount = a3;
}

- (void)setPendingToLatestVersionAssetCount:(int64_t)a3
{
  self->_pendingToLatestVersionAssetCount = a3;
}

- (void)setPendingToAnyVersionAssetCount:(int64_t)a3
{
  self->_pendingToAnyVersionAssetCount = a3;
}

- (OS_dispatch_queue)scanningProgressQueue
{
  return self->_scanningProgressQueue;
}

- (OS_dispatch_queue)personPromoterQueue
{
  return self->_personPromoterQueue;
}

- (PHFetchResult)homeResult
{
  return self->_homeResult;
}

- (void)setHomeResult:(id)a3
{
  objc_storeStrong((id *)&self->_homeResult, a3);
}

- (os_unfair_lock_s)progressLock
{
  return self->_progressLock;
}

- (BOOL)countCacheValid
{
  return self->_countCacheValid;
}

- (void)setCountCacheValid:(BOOL)a3
{
  self->_countCacheValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeResult, 0);
  objc_storeStrong((id *)&self->_personPromoterQueue, 0);
  objc_storeStrong((id *)&self->_scanningProgressQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __44__PXPeopleProgressDataSource__logFaceCounts__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  os_unfair_lock_s lock;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  int64_t v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadyForAnalysis_FOR_UI_USE_ONLY");
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "progressReportForLibrary:", v2);
    v6 = *((_QWORD *)&v29 + 1);
    v5 = v29;
    v7 = v30;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
  }
  v27 = +[PXPeopleProgressDataSource pendingCountForAllowedCount:processedCount:](PXPeopleProgressDataSource, "pendingCountForAllowedCount:processedCount:", v5, v6);
  v8 = +[PXPeopleProgressDataSource pendingCountForAllowedCount:processedCount:](PXPeopleProgressDataSource, "pendingCountForAllowedCount:processedCount:", v5, v7);
  lock._os_unfair_lock_opaque = objc_msgSend(*(id *)(a1 + 32), "progressLock");
  os_unfair_lock_lock(&lock);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(unsigned __int8 *)(v9 + 8);
  v22 = *(_QWORD *)(v9 + 24);
  v23 = *(_QWORD *)(v9 + 32);
  v24 = *(_QWORD *)(v9 + 40);
  v25 = *(_QWORD *)(v9 + 48);
  v26 = *(_QWORD *)(v9 + 56);
  os_unfair_lock_unlock(&lock);
  v11 = objc_msgSend(*(id *)(a1 + 32), "hasHomePeople");
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v3)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v20 = v6;
    v14 = v13;
    if (v10)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v16 = v15;
    v21 = v14;
    if (v11)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = v17;
    v19 = v16;
    *(_DWORD *)buf = 136318466;
    v33 = "-[PXPeopleProgressDataSource _logFaceCounts]_block_invoke";
    v34 = 2112;
    v35 = v14;
    v36 = 2048;
    v37 = v5;
    v38 = 2048;
    v39 = v20;
    v40 = 2048;
    v41 = v7;
    v42 = 2048;
    v43 = v27;
    v44 = 2048;
    v45 = v8;
    v46 = 2112;
    v47 = v16;
    v48 = 2048;
    v49 = v22;
    v50 = 2048;
    v51 = v23;
    v52 = 2048;
    v53 = v24;
    v54 = 2048;
    v55 = v25;
    v56 = 2048;
    v57 = v26;
    v58 = 2112;
    v59 = v18;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "%s, libraryIsReadyForAnalysis: %@, reportAllowedCount: %ld, reportProcessedToLatestVersionCount: %ld, reportProcessedToAnyVersionCount: %ld, reportPendingToLatestVersionAssetCount: %ld, reportPendingToAnyVersionAssetCount: %ld, cachedIsReadyForAnalysis: %@, cachedAllowedCount: %ld, cachedProcessedToLatestVersionCount: %ld, cachedProcessedToAnyVersionCount: %ld, cachedPendingToLatestVersionCount: %ld, cachedPendingToAnyVersionCount: %ld, hasHomePeople: %@", buf, 0x8Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "requestPersonPromoterStatusWithCompletionBlock:", &__block_literal_global_174_152757);

}

void __44__PXPeopleProgressDataSource__logFaceCounts__block_invoke_172(uint64_t a1, int a2, void *a3)
{
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = v6;
    v8 = v7;
    v9 = CFSTR("nil");
    v10 = 136315650;
    v11 = "-[PXPeopleProgressDataSource _logFaceCounts]_block_invoke";
    v12 = 2112;
    if (v4)
      v9 = v4;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "%s, isPersonPromoterDone: %@, error: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __80__PXPeopleProgressDataSource_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PXPeopleProgressDidChangeNotification"), 0);

}

void __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E51471A0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "personPromotionProcessingStatusForUserInterface:", v4);

}

void __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BOOLValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = "-[PXPeopleProgressDataSource requestPersonPromoterStatusWithCompletionBlock:]_block_invoke_2";
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%s - error checking person promotion status: %@, results: %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

uint64_t __65__PXPeopleProgressDataSource_asyncUpdateProgressWithReportBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncUpdateProgressWithReportBlock:", *(_QWORD *)(a1 + 40));
}

+ ($DF4FB41D2F0E3F59E20087ACD782DC9D)_invalidProgressReport
{
  retstr->var1 = -1;
  retstr->var2 = -1;
  retstr->var0 = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&retstr->var3 = _Q0;
  return result;
}

+ (int64_t)pendingCountForAllowedCount:(int64_t)a3 processedCount:(int64_t)a4
{
  if (a3 <= a4)
    return 0;
  else
    return a3 - a4;
}

@end
