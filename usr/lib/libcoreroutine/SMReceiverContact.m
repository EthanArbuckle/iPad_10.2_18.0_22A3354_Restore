@implementation SMReceiverContact

void __74__SMReceiverContact_RTCoreDataTransformable__createWithReceiverContactMO___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;

  v29 = objc_alloc(MEMORY[0x1E0D8B9B8]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D8B8F8];
  objc_msgSend(*(id *)(a1 + 32), "phoneCache");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createWithManagedObject:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D8B8F8];
  objc_msgSend(*(id *)(a1 + 32), "watchCache");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createWithManagedObject:", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D8B9C8];
  objc_msgSend(*(id *)(a1 + 32), "sessionStatus");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createWithManagedObject:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allowReadToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safetyCacheKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "shareURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "participantID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sharingInvitationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(*(id *)(a1 + 32), "numCacheDownloads");
  v19 = objc_msgSend(*(id *)(a1 + 32), "numSuccessfulCacheDownloads");
  v6 = objc_msgSend(*(id *)(a1 + 32), "maxPhoneCacheSize");
  v7 = objc_msgSend(*(id *)(a1 + 32), "maxWatchCacheSize");
  v8 = objc_msgSend(*(id *)(a1 + 32), "maxLocationsInPhoneCacheTrace");
  v9 = objc_msgSend(*(id *)(a1 + 32), "maxLocationsInWatchCacheTrace");
  objc_msgSend(*(id *)(a1 + 32), "timeTillCacheRelease");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "timeTillFirstSuccessfulCacheDownload");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v29, "initWithIdentifier:syncDate:phoneCache:watchCache:sessionStatus:allowReadToken:safetyCacheKey:shareURL:participantID:sharingInvitationData:numCacheDownloads:numSuccessfulCacheDownloads:maxPhoneCacheSize:maxWatchCacheSize:maxLocationsInPhoneCacheTrace:maxLocationsInWatchCacheTrace:timeTillCacheRelease:timeTillFirstSuccessfulCacheDownload:sessionID:firstDetailViewSessionState:lastDetailViewSessionState:phoneMaxWorkoutEvents:watchMaxWorkoutEvents:", v32, v27, v26, v25, v24, v23, v11, v13, v22, v21, v20, v5, v18, v19,
          v6,
          v7,
          v8,
          v9,
          v17,
          objc_msgSend(*(id *)(a1 + 32), "firstDetailViewSessionState"),
          objc_msgSend(*(id *)(a1 + 32), "lastDetailViewSessionState"),
          objc_msgSend(*(id *)(a1 + 32), "phoneMaxWorkoutEvents"),
          objc_msgSend(*(id *)(a1 + 32), "watchMaxWorkoutEvents"));
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

@end
