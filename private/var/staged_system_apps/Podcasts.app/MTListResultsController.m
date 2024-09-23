@implementation MTListResultsController

- (MTListResultsController)init
{
  MTListResultsController *v2;
  MTResultsChangeGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTListResultsController;
  v2 = -[MTListResultsController init](&v5, "init");
  if (v2)
  {
    v3 = -[MTResultsChangeGenerator initWithDelegate:]([MTResultsChangeGenerator alloc], "initWithDelegate:", v2);
    -[MTListResultsController setChangeGenerator:](v2, "setChangeGenerator:", v3);

  }
  return v2;
}

- (void)setObjects:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *objects;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToArray:", self->_objects) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
    objc_msgSend(v4, "controllerWillChangeContent:", self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController changeGenerator](self, "changeGenerator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects"));
    objc_msgSend(v5, "generateChangesForExistingObjects:newObjects:inSection:", v6, v10, 0);

    v7 = (NSArray *)objc_msgSend(v10, "copy");
    objects = self->_objects;
    self->_objects = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
    objc_msgSend(v9, "controllerDidChangeContent:", self);

  }
}

- (void)setChangeGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_changeGenerator, a3);
}

- (NSArray)objects
{
  return self->_objects;
}

- (MTResultsChangeGenerator)changeGenerator
{
  return self->_changeGenerator;
}

- (unint64_t)startingIndexForDisplay
{
  return 0;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  return v7;
}

- (id)indexPathForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0);
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeGenerator, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
