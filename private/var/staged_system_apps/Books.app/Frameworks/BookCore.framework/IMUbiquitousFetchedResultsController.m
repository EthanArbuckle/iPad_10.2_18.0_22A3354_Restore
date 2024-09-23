@implementation IMUbiquitousFetchedResultsController

- (IMUbiquitousFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4 sectionNameKeyPath:(id)a5 cacheName:(id)a6
{
  IMUbiquitousFetchedResultsController *v6;
  uint64_t v7;
  NSOperationQueue *queue;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMUbiquitousFetchedResultsController;
  v6 = -[IMUbiquitousFetchedResultsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:](&v11, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", a3, a4, a5, a6);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue"));
    queue = v6->_queue;
    v6->_queue = (NSOperationQueue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "coordinatorWillRemoveStore:", NSPersistentStoreCoordinatorStoresDidChangeNotification, 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSPersistentStoreCoordinatorStoresDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMUbiquitousFetchedResultsController;
  -[IMUbiquitousFetchedResultsController dealloc](&v4, "dealloc");
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousFetchedResultsController managedObjectContext](self, "managedObjectContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStoreCoordinator"));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_15E69C;
    v15[3] = &unk_28B960;
    v15[4] = self;
    v9 = objc_retainBlock(v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousFetchedResultsController queue](self, "queue"));

    if (v10 == v11)
    {
      ((void (*)(_QWORD *))v9[2])(v9);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
      objc_msgSend(v12, "setQueuePriority:", 8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousFetchedResultsController queue](self, "queue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12));
      objc_msgSend(v13, "addOperations:waitUntilFinished:", v14, 1);

    }
  }

}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
