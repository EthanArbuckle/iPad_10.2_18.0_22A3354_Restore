@implementation MTExtensionNotifier

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MTExtensionNotifier workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048460;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v3, block);

}

- (MTExtensionNotifier)init
{
  MTExtensionNotifier *v2;
  dispatch_queue_global_t global_queue;
  uint64_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTExtensionNotifier;
  v2 = -[MTExtensionNotifier init](&v7, "init");
  if (v2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)libraryDidChange:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v12 = a3;
  if (!objc_msgSend(v12, "hasChanges"))
    goto LABEL_13;
  v3 = kMTPodcastEntityName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changesForEntityName:", kMTPodcastEntityName));
  if ((objc_msgSend(v4, "hasInserts") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changesForEntityName:", v3));
    if ((objc_msgSend(v5, "hasDeletes") & 1) == 0)
    {
      v6 = kMTPlaylistEntityName;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changesForEntityName:", kMTPlaylistEntityName));
      if (!objc_msgSend(v7, "hasInserts"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changesForEntityName:", v6));
        v11 = objc_msgSend(v10, "hasDeletes");

        if ((v11 & 1) == 0)
          goto LABEL_13;
        goto LABEL_8;
      }

    }
  }

LABEL_8:
  if ((+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, MTExtensionPodcastsDidUpdateNotification, 0, 0, 1u);
  }
  if (!os_feature_enabled_homepod_siri_donation_from_apns()
    || (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", MTExtensionPodcastsDidUpdateNotification, 0);

  }
LABEL_13:

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
