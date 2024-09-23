@implementation MTConditionalNullResultsController

- (void)_initializeFrc
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTConditionalNullResultsController;
  -[MTCoreDataResultsController _initializeFrc](&v5, "_initializeFrc");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));
  -[MTConditionalNullResultsController setHasResults:](self, "setHasResults:", objc_msgSend(v4, "count") != 0);

}

- (id)allObjects
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    v6 = &__NSArray0__struct;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTConditionalNullResultsController _extraObjects](self, "_extraObjects"));
  return v6;
}

- (id)_extraObjects
{
  NSMutableArray *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = objc_opt_new(NSMutableArray);
  v4 = -[MTConditionalNullResultsController numberOfPlaceholderObjects](self, "numberOfPlaceholderObjects");
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));

  v7 = objc_msgSend(v6, "count");
  if ((v7 != 0) != -[MTConditionalNullResultsController hasResults](self, "hasResults"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MTConditionalNullResultsController _extraObjects](self, "_extraObjects"));
    if (v7)
      v9 = &__NSArray0__struct;
    else
      v9 = (void *)v8;
    if (v7)
      v10 = (void *)v8;
    else
      v10 = &__NSArray0__struct;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTConditionalNullResultsController changeGenerator](self, "changeGenerator"));
    objc_msgSend(v11, "generateChangesForExistingObjects:newObjects:inSection:", v10, v9, 0);

  }
  v12.receiver = self;
  v12.super_class = (Class)MTConditionalNullResultsController;
  -[MTCoreDataResultsController controllerDidChangeContent:](&v12, "controllerDidChangeContent:", v4);
  -[MTConditionalNullResultsController setHasResults:](self, "setHasResults:", v7 != 0);

}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v15.receiver = self;
  v15.super_class = (Class)MTConditionalNullResultsController;
  -[MTCoreDataResultsController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:](&v15, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v14, v13, v12, a6, v11);

}

- (unint64_t)numberOfPlaceholderObjects
{
  return self->_numberOfPlaceholderObjects;
}

- (void)setNumberOfPlaceholderObjects:(unint64_t)a3
{
  self->_numberOfPlaceholderObjects = a3;
}

- (void)setChangeGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_changeGenerator, a3);
}

- (BOOL)hasResults
{
  return self->_hasResults;
}

- (void)setHasResults:(BOOL)a3
{
  self->_hasResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeGenerator, 0);
}

@end
