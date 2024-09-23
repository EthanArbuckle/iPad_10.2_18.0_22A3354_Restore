@implementation RCSavedRecordingSearchIndexExtensionRequestHandler

- (id)container
{
  RCSavedRecordingSearchIndexExtensionRequestHandler *v2;
  id v3;
  uint64_t v4;
  void *v5;
  RCPersistentContainer *v6;
  RCPersistentContainer *container;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_container)
  {
    v3 = objc_alloc((Class)RCPersistentContainer);
    v4 = RCCloudRecordingsStoreURL();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (RCPersistentContainer *)objc_msgSend(v3, "initWithURL:", v5);
    container = v2->_container;
    v2->_container = v6;

  }
  objc_sync_exit(v2);

  return v2->_container;
}

- (void)reindexAllSearchableItemsForIndex:(id)a3 acknowledgementHandler:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000196C;
  v7[3] = &unk_1000042A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "reloadExistingSearchMetadataWithCompletionBlock:", v7);

}

- (void)index:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = dispatch_queue_create(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001AA4;
  block[3] = &unk_1000042F0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_sync(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
