@implementation CRLiOSDragAndDropInfo

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDragAndDropInfo promisedUTIs](self, "promisedUTIs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>: platform dragging info %@ promised UTIs %@"), v5, self, v6, v7));

  return v8;
}

- (unint64_t)dragOperationMask
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo"));
  v3 = objc_msgSend(v2, "allowsMoveOperation");

  if (v3)
    return 3;
  else
    return 1;
}

- (unint64_t)numberOfDraggingItems
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "items"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)inProcessDraggingSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localDragSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localContext"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localContext"));
    objc_msgSend(v3, "addObject:", v9);

  }
  return v3;
}

- (id)promisedUTIs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "itemProvider"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "registeredTypeIdentifiers"));
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)canCreateItemsOfClass:(Class)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo itemSource](self, "itemSource"));
  LOBYTE(a3) = objc_msgSend(v4, "canLoadItemsOfClass:", a3);

  return (char)a3;
}

- (id)createItemsOfClass:(Class)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___NSItemProviderReading))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self, "platformDraggingInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loadObjectsOfClass:completion:", a3, v6));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
