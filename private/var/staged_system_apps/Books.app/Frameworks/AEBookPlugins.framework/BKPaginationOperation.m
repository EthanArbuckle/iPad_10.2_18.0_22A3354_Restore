@implementation BKPaginationOperation

- (id)init:(id)a3 paginationOperationController:(id)a4 annotationProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKPaginationOperation *v12;
  BKPaginationOperation *v13;
  uint64_t v14;
  NSPersistentStoreCoordinator *psc;
  uint64_t v16;
  NSManagedObjectID *bookObjectID;
  void *v18;
  NSString *v19;
  NSString *bookDatabaseKey;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[BKPaginationOperation init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_job, a3);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentStoreCoordinator"));
    psc = v13->_psc;
    v13->_psc = (NSPersistentStoreCoordinator *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookObjectID"));
    bookObjectID = v13->_bookObjectID;
    v13->_bookObjectID = (NSManagedObjectID *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookDatabaseKey"));
    v19 = (NSString *)objc_msgSend(v18, "copy");
    bookDatabaseKey = v13->_bookDatabaseKey;
    v13->_bookDatabaseKey = v19;

    objc_storeWeak((id *)&v13->_paginationOperationController, v10);
    objc_storeStrong((id *)&v13->_annotationProvider, a5);
  }

  return v13;
}

- (BOOL)isJobGenerationValid
{
  BKPaginationOperation *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
  v4 = objc_msgSend(v3, "jobGeneration");
  LOBYTE(v2) = v4 == (id)-[BKPaginationJob jobGeneration](v2->_job, "jobGeneration");

  return (char)v2;
}

- (void)performBlockAndWait:(id)a3
{
  NSManagedObjectContext *v4;
  NSManagedObjectContext *v5;
  id v6;
  _QWORD v7[4];
  NSManagedObjectContext *v8;
  id v9;

  v6 = a3;
  if (v6)
  {
    v4 = self->_operationMoc;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_81DE8;
    v7[3] = &unk_1BF0C0;
    v8 = v4;
    v9 = v6;
    v5 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v5, "performBlockAndWait:", v7);

  }
}

- (void)performBackgroundAnnotationsBlockAndWait:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation annotationProvider](self, "annotationProvider"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_81EAC;
    v6[3] = &unk_1C0AD8;
    v7 = v4;
    objc_msgSend(v5, "performBlockOnUserSideQueueAndWait:", v6);

  }
}

- (void)cancel
{
  objc_super v3;

  objc_storeWeak((id *)&self->_paginationOperationController, 0);
  v3.receiver = self;
  v3.super_class = (Class)BKPaginationOperation;
  -[BKPaginationOperation cancel](&v3, "cancel");
}

- (BOOL)needsBookManagedObjectContext
{
  return 1;
}

- (void)main
{
  void *v3;
  NSManagedObjectContext *v4;
  NSManagedObjectContext *operationMoc;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *v7;
  _QWORD v8[5];

  v3 = objc_autoreleasePoolPush();
  if (-[BKPaginationOperation needsBookManagedObjectContext](self, "needsBookManagedObjectContext"))
  {
    v4 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    operationMoc = self->_operationMoc;
    self->_operationMoc = v4;

    -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_operationMoc, "setPersistentStoreCoordinator:", self->_psc);
    -[NSManagedObjectContext setMergePolicy:](self->_operationMoc, "setMergePolicy:", NSRollbackMergePolicy);
  }
  if ((-[BKPaginationOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[BKPaginationOperation execute](self, "execute");
  v6 = self->_operationMoc;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_82068;
  v8[3] = &unk_1BEA38;
  v8[4] = self;
  -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v8);
  v7 = self->_operationMoc;
  self->_operationMoc = 0;

  objc_storeWeak((id *)&self->_paginationOperationController, 0);
  objc_autoreleasePoolPop(v3);
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_annotationProvider, a3);
}

- (BKPaginationJob)job
{
  return self->_job;
}

- (NSString)bookDatabaseKey
{
  return self->_bookDatabaseKey;
}

- (void)setBookDatabaseKey:(id)a3
{
  objc_storeStrong((id *)&self->_bookDatabaseKey, a3);
}

- (BKPaginationOperationController)paginationOperationController
{
  return (BKPaginationOperationController *)objc_loadWeakRetained((id *)&self->_paginationOperationController);
}

- (void)setPaginationOperationController:(id)a3
{
  objc_storeWeak((id *)&self->_paginationOperationController, a3);
}

- (NSManagedObjectID)bookObjectID
{
  return self->_bookObjectID;
}

- (void)setBookObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_bookObjectID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_destroyWeak((id *)&self->_paginationOperationController);
  objc_storeStrong((id *)&self->_bookDatabaseKey, 0);
  objc_storeStrong((id *)&self->_bookObjectID, 0);
  objc_storeStrong((id *)&self->_operationMoc, 0);
  objc_storeStrong((id *)&self->_psc, 0);
  objc_storeStrong((id *)&self->_job, 0);
}

@end
