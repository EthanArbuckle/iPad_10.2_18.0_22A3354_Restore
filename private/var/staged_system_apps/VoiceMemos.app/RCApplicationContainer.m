@implementation RCApplicationContainer

+ (id)sharedContainer
{
  if (qword_1001ED928 != -1)
    dispatch_once(&qword_1001ED928, &stru_1001ACCA0);
  return (id)qword_1001ED920;
}

- (RCApplicationContainer)initWithURL:(id)a3
{
  RCApplicationContainer *v3;
  RCApplicationContainer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RCRemoteChangeMerger *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RCRemoteChangeMerger *v14;
  RCRemoteChangeMerger *remoteChangeMerger;
  objc_super v17;
  void *v18;

  v17.receiver = self;
  v17.super_class = (Class)RCApplicationContainer;
  v3 = -[RCApplicationContainer initWithURL:](&v17, "initWithURL:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationContainer persistentContainer](v3, "persistentContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStores"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    v9 = [RCRemoteChangeMerger alloc];
    v18 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationContainer persistentContainer](v4, "persistentContainer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationContainer transactionAuthor](v4, "transactionAuthor"));
    v14 = -[RCRemoteChangeMerger initWithStores:viewContext:transactionAuthorToIgnore:](v9, "initWithStores:viewContext:transactionAuthorToIgnore:", v10, v12, v13);
    remoteChangeMerger = v4->_remoteChangeMerger;
    v4->_remoteChangeMerger = v14;

  }
  return v4;
}

- (id)newChangeTrackingBackgroundModel
{
  void *v3;
  id v4;
  void *v5;
  RCRemoteChangeMerger *remoteChangeMerger;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationContainer sharedContainer](RCApplicationContainer, "sharedContainer"));
  v4 = objc_msgSend(v3, "newBackgroundModel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  objc_msgSend(v5, "setAutomaticallyMergesChangesFromParent:", 1);

  remoteChangeMerger = self->_remoteChangeMerger;
  if (remoteChangeMerger)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
    -[RCRemoteChangeMerger addContextToMergeChangesInto:](remoteChangeMerger, "addContextToMergeChangesInto:", v7);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteChangeMerger, 0);
}

@end
