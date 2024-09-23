@implementation MTResultsChangeGenerator

- (void)generateChangesForExistingObjects:(id)a3 newObjects:(id)a4 inSection:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  _UNKNOWN **v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  unint64_t v44;
  void *v45;
  id obj;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator objectsToIndexPathDictionary:inSection:](self, "objectsToIndexPathDictionary:inSection:", v8, a5));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator objectsToIndexPathDictionary:inSection:](self, "objectsToIndexPathDictionary:inSection:", v10, a5));
    v11 = objc_msgSend(v41, "mutableCopy");
    v42 = v10;
    if (objc_msgSend(v8, "count"))
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v12, a5));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator bestIndexPathForObject:atIndex:fromMap:autoremove:](self, "bestIndexPathForObject:atIndex:fromMap:autoremove:", v13, v12, v11, 0));
        if (v15)
        {
          -[MTResultsChangeGenerator removeIndexPath:forObject:fromMap:](self, "removeIndexPath:forObject:fromMap:", v15, v13, v11);
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator delegate](self, "delegate"));
          objc_msgSend(v16, "generator:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v13, v14, 2, 0);

        }
        ++v12;
      }
      while (v12 < (unint64_t)objc_msgSend(v8, "count"));
    }
    v43 = v8;
    v44 = a5;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    v48 = v11;
    if (v17)
    {
      v18 = v17;
      v47 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v47)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator unbox:](self, "unbox:", v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v20));
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(_QWORD *)v50 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator delegate](self, "delegate"));
                objc_msgSend(v28, "generator:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v21, 0, 1, v27);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            }
            while (v24);
          }

          v11 = v48;
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v18);
    }

    v10 = v42;
    v8 = v43;
    v29 = v44;
    v30 = CPInterfaceController_ptr;
    if (objc_msgSend(v42, "count"))
    {
      v31 = 0;
      do
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndex:", v31));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[211], "indexPathForRow:inSection:", v31, v29));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator bestIndexPathForObject:atIndex:fromMap:](self, "bestIndexPathForObject:atIndex:fromMap:", v32, v31, v45));
        v35 = v34;
        if (v34)
        {
          v36 = objc_msgSend(v34, "isEqual:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator delegate](self, "delegate"));
          v38 = v37;
          v39 = v36 == 0;
          v29 = v44;
          if (v39)
            v40 = 3;
          else
            v40 = 4;
          objc_msgSend(v37, "generator:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v32, v35, v40, v33);

          v30 = CPInterfaceController_ptr;
        }

        ++v31;
      }
      while (v31 < (unint64_t)objc_msgSend(v42, "count"));
    }

  }
}

- (MTResultsChangeGenerator)initWithDelegate:(id)a3
{
  id v4;
  MTResultsChangeGenerator *v5;
  MTResultsChangeGenerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTResultsChangeGenerator;
  v5 = -[MTResultsChangeGenerator init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTResultsChangeGenerator setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)objectsToIndexPathDictionary:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator box:](self, "box:", v9));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v10));
      if (!v11)
      {
        v11 = objc_alloc_init((Class)NSMutableSet);
        objc_msgSend(v7, "setObject:forKey:", v11, v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, a4));
      objc_msgSend(v11, "addObject:", v12);

      ++v8;
    }
    while (v8 < (unint64_t)objc_msgSend(v6, "count"));
  }

  return v7;
}

- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5
{
  return -[MTResultsChangeGenerator bestIndexPathForObject:atIndex:fromMap:autoremove:](self, "bestIndexPathForObject:atIndex:fromMap:autoremove:", a3, a4, a5, 1);
}

- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5 autoremove:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = a6;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator box:](self, "box:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "count"))
  {
    if (objc_msgSend(v13, "count") == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
      if (v6)
        objc_msgSend(v10, "removeObjectForKey:", v11);
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator closestIndexPathToRow:forIndexPaths:](self, "closestIndexPathToRow:forIndexPaths:", a4, v13));
      v14 = (void *)v16;
      if (v6 && v16)
        objc_msgSend(v13, "removeObject:", v16);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)removeIndexPath:(id)a3 forObject:(id)a4 fromMap:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  if (a3 && a4)
  {
    if (a5)
    {
      v8 = a5;
      v9 = a3;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator box:](self, "box:", a4));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v11));

      objc_msgSend(v10, "removeObject:", v9);
    }
  }
}

- (id)closestIndexPathToRow:(unint64_t)a3 forIndexPaths:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *i;
  void *v12;
  char *v13;
  char *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    v10 = -1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (char *)objc_msgSend(v12, "row");
        if ((uint64_t)&v13[-a3] >= 0)
          v14 = &v13[-a3];
        else
          v14 = (char *)(a3 - (_QWORD)v13);
        if (!v8 || (unint64_t)v14 < v10)
        {
          v15 = v12;

          v10 = (unint64_t)v14;
          v8 = v15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)box:(id)a3
{
  id v3;
  MTResultsChangeWrapper *v4;

  v3 = a3;
  v4 = -[MTResultsChangeWrapper initWithObject:]([MTResultsChangeWrapper alloc], "initWithObject:", v3);

  return v4;
}

- (id)unbox:(id)a3
{
  return objc_msgSend(a3, "object");
}

- (MTResultsChangeGeneratorDelegate)delegate
{
  return (MTResultsChangeGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
