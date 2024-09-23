@implementation _TUICoreDataProvider

- (_TUICoreDataProvider)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  _TUICoreDataProvider *v8;
  id v9;
  id v10;
  NSFetchedResultsController *v11;
  NSFetchedResultsController *controller;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_TUICoreDataProvider;
  v8 = -[_TUICoreDataProvider init](&v18, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");

    v10 = objc_msgSend(v9, "fetchLimit");
    v8->_fetchLimit = (unint64_t)v10;
    if (v10)
    {
      objc_msgSend(v9, "setFetchLimit:", 0);
      objc_msgSend(v9, "setFetchBatchSize:", v8->_fetchLimit);
    }
    v11 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)NSFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v9, v7, 0, 0);
    controller = v8->_controller;
    v8->_controller = v11;

    -[NSFetchedResultsController setDelegate:](v8->_controller, "setDelegate:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](v8->_controller, "managedObjectContext"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, "_contextDidSave:", NSManagedObjectContextDidSaveNotification, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](v8->_controller, "managedObjectContext"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, "_contextDidMergeChanges:", NSManagedObjectContextDidMergeChangesObjectIDsNotification, v16);

  }
  else
  {
    v9 = v6;
  }

  return v8;
}

- (unint64_t)countForGeneration:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "count");
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  _QWORD v9[4];
  id v10;
  NSUInteger v11;
  NSUInteger v12;

  length = a3.length;
  location = a3.location;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3386C;
  v9[3] = &unk_23E5D0;
  v10 = a5;
  v11 = location;
  v12 = length;
  v8 = v10;
  objc_msgSend(a4, "performBlockAndWait:", v9);

}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_33A2C;
  v9[3] = &unk_23E5F8;
  v10 = a3;
  v11 = a5;
  v7 = v10;
  v8 = v11;
  objc_msgSend(a4, "performBlockAndWait:", v9);

}

- (id)_startObserving
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](self->_controller, "managedObjectContext"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_33C20;
  v14 = sub_33C30;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_33C38;
  v7[3] = &unk_23D7A8;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)_updatePredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchRequest](self->_controller, "fetchRequest"));
  v6 = objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setFetchBatchSize:", 0);
  objc_msgSend(v6, "setFetchLimit:", self->_fetchLimit);
  objc_msgSend(v6, "setResultType:", 1);
  v7 = objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setPredicate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](self->_controller, "managedObjectContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_33ED0;
  v12[3] = &unk_23E620;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = v4;
  v9 = v4;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v12);

}

- (void)controllerWillChangeContent:(id)a3
{
  _TUICoreDataGeneration *v4;
  void *v5;
  void *v6;
  _TUICoreDataGeneration *v7;
  _TUICoreDataGeneration *captureGeneration;
  void *v9;
  TUITransaction *v10;
  TUITransaction *transaction;
  id WeakRetained;

  v4 = [_TUICoreDataGeneration alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](self->_controller, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchRequest](self->_controller, "fetchRequest"));
  v7 = -[_TUICoreDataGeneration initWithContext:fetchRequest:](v4, "initWithContext:fetchRequest:", v5, v6);
  captureGeneration = self->_captureGeneration;
  self->_captureGeneration = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions defaultImplicitOptions](TUITransactionOptions, "defaultImplicitOptions"));
  v10 = (TUITransaction *)objc_claimAutoreleasedReturnValue(+[TUITransaction transactionWithOptions:](TUITransaction, "transactionWithOptions:", v9));
  transaction = self->_transaction;
  self->_transaction = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
  objc_msgSend(WeakRetained, "_beginBatchUpdatesWithTransaction:generation:", self->_transaction, self->_captureGeneration);

}

- (void)_contextDidSave:(id)a3
{
  _TUICoreDataGeneration *captureGeneration;
  void *v5;
  _TUICoreDataGeneration *v6;
  void *v7;
  _TUICoreDataGeneration *v8;
  id WeakRetained;
  TUITransaction *transaction;

  captureGeneration = self->_captureGeneration;
  if (captureGeneration)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_controller, "fetchedObjects", a3));
    -[_TUICoreDataGeneration updateCount:](captureGeneration, "updateCount:", objc_msgSend(v5, "count"));

    v6 = self->_captureGeneration;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](self->_controller, "managedObjectContext"));
    -[_TUICoreDataGeneration captureTokenFromContext:](v6, "captureTokenFromContext:", v7);

    v8 = self->_captureGeneration;
    self->_captureGeneration = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
    objc_msgSend(WeakRetained, "_endBatchUpdates");

    -[TUITransaction commit](self->_transaction, "commit");
    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

- (void)_contextDidMergeChanges:(id)a3
{
  _TUICoreDataGeneration *captureGeneration;
  void *v5;
  _TUICoreDataGeneration *v6;
  void *v7;
  _TUICoreDataGeneration *v8;
  id WeakRetained;
  TUITransaction *transaction;

  captureGeneration = self->_captureGeneration;
  if (captureGeneration)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_controller, "fetchedObjects", a3));
    -[_TUICoreDataGeneration updateCount:](captureGeneration, "updateCount:", objc_msgSend(v5, "count"));

    v6 = self->_captureGeneration;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController managedObjectContext](self->_controller, "managedObjectContext"));
    -[_TUICoreDataGeneration captureTokenFromContext:](v6, "captureTokenFromContext:", v7);

    v8 = self->_captureGeneration;
    self->_captureGeneration = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
    objc_msgSend(WeakRetained, "_endBatchUpdates");

    -[TUITransaction commit](self->_transaction, "commit");
    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  switch(a6)
  {
    case 1uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      objc_msgSend(WeakRetained, "insertItemAtIndex:", objc_msgSend(v14, "tui_row"));
      goto LABEL_6;
    case 2uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      objc_msgSend(WeakRetained, "deleteItemAtIndex:", objc_msgSend(v13, "tui_row"));
      goto LABEL_6;
    case 3uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      objc_msgSend(WeakRetained, "moveItemFromIndex:toIndex:", objc_msgSend(v13, "tui_row"), objc_msgSend(v14, "tui_row"));
      goto LABEL_6;
    case 4uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      objc_msgSend(WeakRetained, "updateItemAtIndex:", objc_msgSend(v13, "tui_row"));
LABEL_6:

      break;
    default:
      break;
  }

}

- (TUIMutableDynamicArray)rootArray
{
  return (TUIMutableDynamicArray *)objc_loadWeakRetained((id *)&self->_rootArray);
}

- (TUIDynamicArray)limitedArray
{
  return (TUIDynamicArray *)objc_loadWeakRetained((id *)&self->_limitedArray);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (NSFetchedResultsController)controller
{
  return self->_controller;
}

- (_TUICoreDataGeneration)captureGeneration
{
  return self->_captureGeneration;
}

- (TUITransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_captureGeneration, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_limitedArray);
  objc_destroyWeak((id *)&self->_rootArray);
}

@end
