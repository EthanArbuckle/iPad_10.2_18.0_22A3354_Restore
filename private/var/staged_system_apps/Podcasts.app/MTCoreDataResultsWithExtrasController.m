@implementation MTCoreDataResultsWithExtrasController

- (void)_initializeFrc
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTCoreDataResultsWithExtrasController;
  -[MTCoreDataResultsController _initializeFrc](&v5, "_initializeFrc");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));
  -[MTCoreDataResultsWithExtrasController setNumberOfResults:](self, "setNumberOfResults:", objc_msgSend(v4, "count"));

}

- (id)allObjects
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTCoreDataResultsWithExtrasController;
  v3 = -[MTCoreDataResultsController allObjects](&v8, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsWithExtrasController _extraObjects](self, "_extraObjects"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));

      v4 = (void *)v6;
    }

  }
  return v4;
}

- (id)_extraObjects
{
  NSMutableArray *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = objc_opt_new(NSMutableArray);
  v4 = -[MTCoreDataResultsWithExtrasController numberOfExtraObjects](self, "numberOfExtraObjects");
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[NSMutableArray addObject:](v3, "addObject:", v6);

      --v5;
    }
    while (v5);
  }
  v7 = -[NSMutableArray copy](v3, "copy");

  return v7;
}

- (BOOL)_hasResults
{
  return -[MTCoreDataResultsWithExtrasController numberOfResults](self, "numberOfResults") != 0;
}

- (MTResultsChangeGenerator)changeGenerator
{
  MTResultsChangeGenerator *changeGenerator;
  MTResultsChangeGenerator *v4;
  MTResultsChangeGenerator *v5;

  changeGenerator = self->_changeGenerator;
  if (!changeGenerator)
  {
    v4 = -[MTResultsChangeGenerator initWithDelegate:]([MTResultsChangeGenerator alloc], "initWithDelegate:", self);
    v5 = self->_changeGenerator;
    self->_changeGenerator = v4;

    changeGenerator = self->_changeGenerator;
  }
  return changeGenerator;
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));

  v7 = objc_msgSend(v6, "count");
  if ((v7 != 0) != -[MTCoreDataResultsWithExtrasController _hasResults](self, "_hasResults"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsWithExtrasController _extraObjects](self, "_extraObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8));

    if (v7)
      v10 = v6;
    else
      v10 = v9;
    if (v7)
      v11 = v9;
    else
      v11 = v6;
    v12 = v11;
    v13 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsWithExtrasController changeGenerator](self, "changeGenerator"));
    objc_msgSend(v14, "generateChangesForExistingObjects:newObjects:inSection:", v13, v12, 0);

  }
  v15.receiver = self;
  v15.super_class = (Class)MTCoreDataResultsWithExtrasController;
  -[MTCoreDataResultsController controllerDidChangeContent:](&v15, "controllerDidChangeContent:", v4);
  -[MTCoreDataResultsWithExtrasController setNumberOfResults:](self, "setNumberOfResults:", v7);

}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v11 = a5;
  v12 = a7;
  if (v11 && a6 == 2 && -[MTCoreDataResultsWithExtrasController _hasResults](self, "_hasResults"))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v11, "row")+ -[MTCoreDataResultsWithExtrasController numberOfResults](self, "numberOfResults"), objc_msgSend(v11, "section")));

    v11 = (id)v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  -[MTCoreDataResultsController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:](self, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v14, v15, v11, a6, v12);

}

- (unint64_t)numberOfExtraObjects
{
  return self->_numberOfExtraObjects;
}

- (void)setNumberOfExtraObjects:(unint64_t)a3
{
  self->_numberOfExtraObjects = a3;
}

- (void)setChangeGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_changeGenerator, a3);
}

- (unint64_t)numberOfResults
{
  return self->_numberOfResults;
}

- (void)setNumberOfResults:(unint64_t)a3
{
  self->_numberOfResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeGenerator, 0);
}

@end
