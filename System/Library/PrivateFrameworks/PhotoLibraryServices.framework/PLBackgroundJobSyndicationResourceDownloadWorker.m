@implementation PLBackgroundJobSyndicationResourceDownloadWorker

+ (id)syndicationWorkerCriteria
{
  return +[PLBackgroundJobCriteria criteriaForHubbleNetworkDownloadWorker](PLBackgroundJobCriteria, "criteriaForHubbleNetworkDownloadWorker");
}

- (BOOL)isNetworkAccessAllowed
{
  return 1;
}

- (unint64_t)batchSize
{
  return 20;
}

- (id)resourceIDsForPrefetchWithLibrary:(id)a3
{
  PLSyndicationResourcePrefetchEngine *prefetchManager;
  void *v4;
  void *v5;

  prefetchManager = self->super._prefetchManager;
  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSyndicationResourcePrefetchEngine lowPriorityResourcesForPrefetchWithManagedObjectContext:](prefetchManager, "lowPriorityResourcesForPrefetchWithManagedObjectContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
