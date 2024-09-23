@implementation MTCompositeResultsController

+ (id)controllerWithControllers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithControllers:", v4);

  return v5;
}

- (MTCompositeResultsController)initWithControllers:(id)a3
{
  id v4;
  MTCompositeResultsController *v5;
  MTCompositeResultsController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTCompositeResultsController;
  v5 = -[MTCompositeResultsController init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTCompositeResultsController _setControllers:](v5, "_setControllers:", v4);

  return v6;
}

- (void)_setControllers:(id)a3
{
  NSArray *v5;
  NSArray *controllers;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v5 = (NSArray *)a3;
  controllers = self->_controllers;
  if (controllers != v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = controllers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11), "setDelegate:", 0);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v5;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "setDelegate:", self, (_QWORD)v17);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_controllers, a3);
  }

}

- (void)reloadData
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "reloadData");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)indexPathForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000465E4;
  v16 = sub_100046974;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100064EF0;
  v9[3] = &unk_1004A73C0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllerAtIndex:](self, "controllerAtIndex:", objc_msgSend(v4, "section")));
    if (v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "row")));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllerAtIndex:](self, "controllerAtIndex:", a3));
  v4 = objc_msgSend(v3, "numberOfObjects");

  return (unint64_t)v4;
}

- (id)indexPathsForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100065118;
  v14 = &unk_1004A73E8;
  v7 = v4;
  v15 = v7;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v11);

  if (objc_msgSend(v8, "count", v11, v12, v13, v14))
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
  else
    v9 = 0;

  return v9;
}

- (id)controllerAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (unint64_t)indexOfController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return (unint64_t)v6;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController delegate](self, "delegate"));
  objc_msgSend(v5, "controllerWillChangeContent:", v4);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController delegate](self, "delegate"));
  objc_msgSend(v5, "controllerDidChangeContent:", v4);

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = -[MTCompositeResultsController indexOfController:](self, "indexOfController:", v14);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v16, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/FRC/MTCompositeResultsController.m", 142, CFSTR("Observed change for object %@ in section %@ but can't find the section index"), v13, v14);
  }
  else
  {
    v17 = v15;
    v18 = v21;
    if (v21)
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v21, "row"), v17));

      v18 = (id)v19;
    }
    v21 = v18;
    if (v12)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v12, "row"), v17));

      v12 = (id)v20;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController delegate](self, "delegate"));
    objc_msgSend(v16, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v14, v13, v21, a6, v12);
  }

}

- (id)allObjects
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "allObjects"));
        if (v9)
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return v10;
}

- (BOOL)hasObjects
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "hasObjects") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSArray)controllers
{
  return self->_controllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
