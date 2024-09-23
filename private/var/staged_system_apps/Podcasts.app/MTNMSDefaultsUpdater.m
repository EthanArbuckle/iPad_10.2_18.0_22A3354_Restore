@implementation MTNMSDefaultsUpdater

- (MTNMSDefaultsUpdater)init
{
  MTNMSDefaultsUpdater *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTNMSDefaultsUpdater;
  v2 = -[MTNMSDefaultsUpdater init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MTNMSDefaultsUpdater", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)startObservingDownloadedPodcastsChanges
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4170;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)stopObservingDownloadedPodcastsChanges
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E442C;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)updatePodcastSizeEstimation
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E44C8;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_onWorkQueueUpdatePodcastSizeEstimation
{
  void *v3;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNMSDefaultsUpdater downloadedQueryObserver](self, "downloadedQueryObserver"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E465C;
  v4[3] = &unk_1004A8FB0;
  v4[4] = self;
  objc_msgSend(v3, "results:", v4);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (MTPropertyChangeQueryObserver)downloadedQueryObserver
{
  return self->_downloadedQueryObserver;
}

- (void)setDownloadedQueryObserver:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedQueryObserver, a3);
}

- (NSMutableSet)existingDownloadedEpisodes
{
  return self->_existingDownloadedEpisodes;
}

- (void)setExistingDownloadedEpisodes:(id)a3
{
  objc_storeStrong((id *)&self->_existingDownloadedEpisodes, a3);
}

- (MTCoalescableWorkController)updatePodcastSizeEstimationWorkController
{
  return self->_updatePodcastSizeEstimationWorkController;
}

- (void)setUpdatePodcastSizeEstimationWorkController:(id)a3
{
  objc_storeStrong((id *)&self->_updatePodcastSizeEstimationWorkController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePodcastSizeEstimationWorkController, 0);
  objc_storeStrong((id *)&self->_existingDownloadedEpisodes, 0);
  objc_storeStrong((id *)&self->_downloadedQueryObserver, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
