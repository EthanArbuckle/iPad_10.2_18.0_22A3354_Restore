@implementation PLFakeCPLLibraryManager

- (id)forwardingTargetForSelector:(SEL)a3
{
  fileTTRForUnimplementedSelector(a3);
  return 0;
}

- (PLFakeCPLLibraryManager)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 options:(unint64_t)a7
{
  id v9;
  PLFakeCPLLibraryManager *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSURL *fakeBaseURL;
  id v17;
  void *v18;
  uint64_t v19;
  CPLStatus *syncStatus;
  uint64_t v21;
  CPLConfiguration *configuration;
  objc_super v24;

  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLFakeCPLLibraryManager;
  v10 = -[PLFakeCPLLibraryManager init](&v24, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("PLFakeCPLLibraryManager", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_baseURL, a3);
    objc_msgSend((id)objc_opt_class(), "fakeCPLStatusBaseURLWithBaseURL:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    fakeBaseURL = v10->_fakeBaseURL;
    v10->_fakeBaseURL = (NSURL *)v15;

    v10->_state = 0;
    v17 = objc_alloc(MEMORY[0x1E0D11498]);
    objc_msgSend((id)objc_opt_class(), "fakeCPLStatusBaseURLWithBaseURL:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithClientLibraryBaseURL:", v18);
    syncStatus = v10->_syncStatus;
    v10->_syncStatus = (CPLStatus *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D11358]), "initWithClientLibraryBaseURL:", v9);
    configuration = v10->_configuration;
    v10->_configuration = (CPLConfiguration *)v21;

  }
  return v10;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLFakeCPLLibraryManager_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)enableMainScopeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PLFakeCPLLibraryManager_enableMainScopeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)disableMainScopeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLFakeCPLLibraryManager_disableMainScopeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PLFakeCPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PLFakeCPLLibraryManager_deactivateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;

  v7 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PLFakeCPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;

  v8 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PLFakeCPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, block);

}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PLFakeCPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PLFakeCPLLibraryManager_createScope_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)createOwnedLibraryShareScopeWithShare:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PLFakeCPLLibraryManager_createOwnedLibraryShareScopeWithShare_title_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLFakeCPLLibraryManager_updateShareForScope_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PLFakeCPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PLFakeCPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PLFakeCPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PLFakeCPLLibraryManager_acceptSharedScope_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PLFakeCPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PLFakeCPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PLFakeCPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)beginPushChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PLFakeCPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke;
  v8[3] = &unk_1E3675C58;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)beginPullChangeSessionWithKnownLibraryVersion:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PLFakeCPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke;
  v8[3] = &unk_1E3675C58;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PLFakeCPLLibraryManager_forceBackupWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__PLFakeCPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E3675C58;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (void)getCloudIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PLFakeCPLLibraryManager_getCloudIdentifiersForLocalIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PLFakeCPLLibraryManager_getStatusForComponents_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PLFakeCPLLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)getCloudScopedIdentifiersForLocalScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PLFakeCPLLibraryManager_getCloudScopedIdentifiersForLocalScopedIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PLFakeCPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PLFakeCPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PLFakeCPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v12[3] = &unk_1E3675C58;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, v12);

}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__PLFakeCPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke;
  v12[3] = &unk_1E3675C58;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, v12);

}

- (void)getStreamingURLOrMediaMakerDataForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;

  v9 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __126__PLFakeCPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, block);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;

  v8 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, block);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 highPriority:(BOOL)a5 completionHandler:(id)a6
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;

  v7 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_highPriority_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PLFakeCPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLFakeCPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CPLStatus)syncStatus
{
  return self->_syncStatus;
}

- (CPLConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)sizeOfResourcesToUpload
{
  return self->_sizeOfResourcesToUpload;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  return self->_sizeOfOriginalResourcesToUpload;
}

- (unint64_t)numberOfImagesToUpload
{
  return self->_numberOfImagesToUpload;
}

- (unint64_t)numberOfVideosToUpload
{
  return self->_numberOfVideosToUpload;
}

- (unint64_t)numberOfOtherItemsToUpload
{
  return self->_numberOfOtherItemsToUpload;
}

- (unint64_t)estimatedInitialSizeForLocalLibrary
{
  return self->_estimatedInitialSizeForLocalLibrary;
}

- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialSizeForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialAssetCountForLocalLibrary
{
  return self->_estimatedInitialAssetCountForLocalLibrary;
}

- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialAssetCountForLocalLibrary = a3;
}

- (CPLLibraryManagerDelegate)delegate
{
  return (CPLLibraryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CPLResourceProgressDelegate)resourceProgressDelegate
{
  return (CPLResourceProgressDelegate *)objc_loadWeakRetained((id *)&self->_resourceProgressDelegate);
}

- (void)setResourceProgressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resourceProgressDelegate, a3);
}

- (CPLLibraryManagerForceSyncDelegate)forceSyncDelegate
{
  return (CPLLibraryManagerForceSyncDelegate *)objc_loadWeakRetained((id *)&self->_forceSyncDelegate);
}

- (void)setForceSyncDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forceSyncDelegate, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)fakeBaseURL
{
  return self->_fakeBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeBaseURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_forceSyncDelegate);
  objc_destroyWeak((id *)&self->_resourceProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__PLFakeCPLLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getSystemBudgetsWithCompletionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

uint64_t __92__PLFakeCPLLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_highPriority_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __116__PLFakeCPLLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __126__PLFakeCPLLibraryManager_getStreamingURLOrMediaMakerDataForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v1 + 16))(v1, 0, 0, 0, 0, v3);

}

void __97__PLFakeCPLLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0D11370];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support resource prune"), "-[PLFakeCPLLibraryManager checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:]_block_invoke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

}

void __84__PLFakeCPLLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0D11370];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support resource deletions"), "-[PLFakeCPLLibraryManager deleteResources:checkServerIfNecessary:completionHandler:]_block_invoke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

}

void __85__PLFakeCPLLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager checkHasBackgroundDownloadOperationsWithCompletionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __100__PLFakeCPLLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __96__PLFakeCPLLibraryManager_getCloudScopedIdentifiersForLocalScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getCloudScopedIdentifiersForLocalScopedIdentifiers:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __88__PLFakeCPLLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getCloudCacheForRecordWithScopedIdentifier:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __68__PLFakeCPLLibraryManager_getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getStatusForComponents:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __84__PLFakeCPLLibraryManager_getCloudIdentifiersForLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getCloudIdentifiersForLocalIdentifiers:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __86__PLFakeCPLLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0D11430]);
        v10 = (void *)objc_msgSend(MEMORY[0x1E0D11410], "newRecordWithScopedIdentifier:", v8);
        v11 = (void *)objc_msgSend(v9, "initWithRecord:generation:", v10, 0);

        objc_msgSend(v11, "setUploaded:", 1);
        objc_msgSend(v2, "setObject:forKey:", v11, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v12 = *(_QWORD *)(v14 + 40);
  v13 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

}

uint64_t __60__PLFakeCPLLibraryManager_forceBackupWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__PLFakeCPLLibraryManager_beginPullChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke(uint64_t a1)
{
  PLFakeCPLPullChangeSession *v2;

  v2 = -[PLFakeCPLPullChangeSession initWithLibraryManager:queue:]([PLFakeCPLPullChangeSession alloc], "initWithLibraryManager:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __91__PLFakeCPLLibraryManager_beginPushChangeSessionWithKnownLibraryVersion_completionHandler___block_invoke(uint64_t a1)
{
  PLFakeCPLPushChangeSession *v2;

  v2 = -[PLFakeCPLPushChangeSession initWithLibraryManager:queue:]([PLFakeCPLPushChangeSession alloc], "initWithLibraryManager:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__PLFakeCPLLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager queryUserDetailsForShareParticipants:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

uint64_t __84__PLFakeCPLLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__PLFakeCPLLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager boostPriorityForScopeWithIdentifier:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

void __63__PLFakeCPLLibraryManager_acceptSharedScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager acceptSharedScope:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

void __74__PLFakeCPLLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager fetchSharedScopeFromShareURL:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __112__PLFakeCPLLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __88__PLFakeCPLLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager getScopeStatusCountsForScopeWithIdentifier:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __65__PLFakeCPLLibraryManager_updateShareForScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager updateShareForScope:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __89__PLFakeCPLLibraryManager_createOwnedLibraryShareScopeWithShare_title_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager createOwnedLibraryShareScopeWithShare:title:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __57__PLFakeCPLLibraryManager_createScope_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager createScope:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

uint64_t __71__PLFakeCPLLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __121__PLFakeCPLLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

void __111__PLFakeCPLLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D11370];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s does not support this action"), "-[PLFakeCPLLibraryManager startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]_block_invoke");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplErrorWithCode:description:", 1002, CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);

}

uint64_t __59__PLFakeCPLLibraryManager_deactivateWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__PLFakeCPLLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__PLFakeCPLLibraryManager_disableMainScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__PLFakeCPLLibraryManager_enableMainScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__PLFakeCPLLibraryManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  fileTTRForUnimplementedSelector(a3);
  return 0;
}

+ (id)fakeCPLStatusBaseURLWithBaseURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("PLFakeCPLLibraryManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
