@implementation MTCoreDataResultsController

- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:propertyKeys:](self, "initWithEntityName:predicate:sortDescriptors:propertyKeys:", a3, a4, a5, 0);
}

- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MTCoreDataResultsController *v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", v10);
  if ((id)kMTPodcastEntityName == v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", 0));
  }
  else
  {
    if ((id)kMTEpisodeEntityName != v10)
      goto LABEL_6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRSSEpisodes](MTEpisode, "predicateForRSSEpisodes"));
  }
  v16 = v15;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "AND:", v11));

  v11 = (id)v17;
LABEL_6:
  objc_msgSend(v14, "setPredicate:", v11);
  if (v13)
    v18 = v13;
  else
    v18 = &__NSArray0__struct;
  objc_msgSend(v14, "setSortDescriptors:", v18);

  v19 = -[MTCoreDataResultsController initWithFetchRequest:propertyKeys:](self, "initWithFetchRequest:propertyKeys:", v14, v12);
  return v19;
}

- (MTCoreDataResultsController)initWithFetchRequest:(id)a3
{
  return -[MTCoreDataResultsController initWithFetchRequest:propertyKeys:](self, "initWithFetchRequest:propertyKeys:", a3, 0);
}

- (MTCoreDataResultsController)initWithFetchRequest:(id)a3 propertyKeys:(id)a4
{
  id v6;
  id v7;
  MTCoreDataResultsController *v8;
  MTCoreDataResultsController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTCoreDataResultsController;
  v8 = -[MTCoreDataResultsController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MTCoreDataResultsController setFetchRequest:](v8, "setFetchRequest:", v6);
    -[MTCoreDataResultsController setPropertyKeys:](v9, "setPropertyKeys:", v7);
    -[MTCoreDataResultsController _initializeFrc](v9, "_initializeFrc");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MTCoreDataResultsController _setFrc:](self, "_setFrc:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTCoreDataResultsController;
  -[MTCoreDataResultsController dealloc](&v3, "dealloc");
}

- (void)setPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  objc_msgSend(v5, "setPredicate:", v4);

}

- (NSPredicate)predicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "predicate"));

  return (NSPredicate *)v3;
}

- (void)setSortDescriptors:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = &__NSArray0__struct;
  if (a3)
    v4 = a3;
  v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  objc_msgSend(v6, "setSortDescriptors:", v5);

}

- (NSArray)sortDescriptors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortDescriptors"));

  return (NSArray *)v3;
}

- (void)reloadData
{
  -[MTCoreDataResultsController setFrc:](self, "setFrc:", 0);
  -[MTCoreDataResultsController _initializeFrc](self, "_initializeFrc");
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));
    v7 = objc_msgSend(v6, "count");

    if (objc_msgSend(v4, "section") || objc_msgSend(v4, "row") >= v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
      objc_msgSend(v8, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/FRC/MTCoreDataResultsController.m", 111, CFSTR("Unable to retrieve object for index path %@ with total number of objects %ld"), v4, v7);
      v9 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v4));
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)indexPathForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForObject:", v4));

  return v6;
}

- (id)allObjects
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedObjects"));

  return v3;
}

- (void)_initializeFrc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;

  if (!self->_frc)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController propertyKeys](self, "propertyKeys"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = objc_alloc((Class)MTFetchedResultsController);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
      v9 = objc_msgSend(v7, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v8, v4, 0, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController propertyKeys](self, "propertyKeys"));
      objc_msgSend(v9, "setPropertyKeys:", v10);
    }
    else
    {
      v11 = objc_alloc((Class)NSFetchedResultsController);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
      v9 = objc_msgSend(v11, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v10, v4, 0, 0);
    }

    objc_msgSend(v9, "setDelegate:", self);
    v15 = 0;
    v12 = objc_msgSend(v9, "performFetch:", &v15);
    v13 = v15;
    v14 = v13;
    if (v12)
      -[MTCoreDataResultsController setFrc:](self, "setFrc:", v9);
    else
      objc_msgSend(v13, "logAndThrow:", 1);

  }
}

- (void)_setFrc:(id)a3
{
  MTFetchedResultsControllerProtocol *v5;
  MTFetchedResultsControllerProtocol *frc;
  MTFetchedResultsControllerProtocol *v7;

  v5 = (MTFetchedResultsControllerProtocol *)a3;
  frc = self->_frc;
  v7 = v5;
  if (frc != v5)
  {
    -[MTFetchedResultsControllerProtocol setDelegate:](frc, "setDelegate:", 0);
    -[MTFetchedResultsControllerProtocol setDelegate:](v7, "setDelegate:", self);
    objc_storeStrong((id *)&self->_frc, a3);
  }

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  objc_msgSend(v14, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v13, v12, a6, v11);

}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate", a3));
  objc_msgSend(v4, "controllerWillChangeContent:", self);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate", a3));
  objc_msgSend(v4, "controllerDidChangeContent:", self);

}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_propertyKeys, a3);
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (MTFetchedResultsControllerProtocol)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
  objc_storeStrong((id *)&self->_frc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
}

@end
