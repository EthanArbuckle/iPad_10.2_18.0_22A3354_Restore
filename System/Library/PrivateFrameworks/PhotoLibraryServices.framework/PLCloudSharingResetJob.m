@implementation PLCloudSharingResetJob

- (int64_t)daemonOperation
{
  return 10;
}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharingResetJob runDaemonSide]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lowPriorityOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PLCloudSharingResetJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v6);

}

void __39__PLCloudSharingResetJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  objc_super v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_2;
  v7[3] = &unk_1E3677AA0;
  v8 = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_3;
  v6[3] = &unk_1E3677AA0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  objc_msgSend(v4, "performTransactionAndWait:completionHandler:", v7, v6);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudSharingResetJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

  objc_autoreleasePoolPop(v2);
}

void __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_2(uint64_t a1)
{
  id v2;

  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[PLCloudSharingResetJob]Resetting Shared Streams."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharingEnablingJob deleteAllLocalSharedAlbumsInLibrary:keepPendingAlbums:withReason:](PLCloudSharingEnablingJob, "deleteAllLocalSharedAlbumsInLibrary:keepPendingAlbums:withReason:", *(_QWORD *)(a1 + 32), 0, v2);

}

void __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_3(uint64_t a1)
{
  void *v2;
  PLCloudFeedEntriesManager *v3;
  void *v4;
  PLCloudFeedEntriesManager *v5;

  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discardAllNotifications");

  v3 = [PLCloudFeedEntriesManager alloc];
  objc_msgSend(*(id *)(a1 + 32), "transientPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLCloudFeedEntriesManager initWithPhotoLibrary:](v3, "initWithPhotoLibrary:", v4);

  -[PLCloudFeedEntriesManager rebuildAllEntries:](v5, "rebuildAllEntries:", 0);
}

+ (void)resetAllLocalState
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "runAndWaitForMessageToBeSent");

}

@end
