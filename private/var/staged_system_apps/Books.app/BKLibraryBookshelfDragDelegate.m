@implementation BKLibraryBookshelfDragDelegate

+ (void)initialize
{
  if ((id)objc_opt_class(BKLibraryBookshelfDragDelegate) == a1 && qword_1009F51A0 != -1)
    dispatch_once(&qword_1009F51A0, &stru_1008EDBA0);
}

- (BKLibraryBookshelfDragDelegate)initWithBookDataSource:(id)a3
{
  id v5;
  BKLibraryBookshelfDragDelegate *v6;
  BKLibraryBookshelfDragDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfDragDelegate;
  v6 = -[BKLibraryBookshelfDragDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bookDataSource, a3);

  return v7;
}

- (id)collectionViewCollectionID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataSource"));
  v4 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBooksDataSourceProtocol, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSourceID"));
  return v6;
}

- (BOOL)collectionViewIsReorderable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  v6 = objc_msgSend(v4, "collectionView:canMoveItemAtIndexPath:", v3, v5);

  return v6;
}

- (id)dragItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDragDelegate bookDataSource](self, "bookDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedObjectForIndexPath:", v4));

  v7 = objc_alloc_init((Class)NSItemProvider);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dragInfoFromLibraryAsset:", v6));

  if (objc_msgSend(v6, "isOwned"))
    v10 = objc_msgSend(v6, "isPreorderBook") ^ 1;
  else
    v10 = 0;
  +[BCDragRepresentationFactory registerRepresentationsFromAssetDragInfo:withProvider:canDragToNewCanvas:](BCDragRepresentationFactory, "registerRepresentationsFromAssetDragInfo:withProvider:canDragToNewCanvas:", v9, v7, v10);
  v11 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v7);
  objc_msgSend(v11, "setLocalObject:", v6);

  return v11;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(v7, "hasActiveDrop") & 1) != 0
    || (objc_msgSend(v7, "hasActiveDrag") & 1) != 0
    || (byte_1009F5190 = 1,
        (v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDragDelegate dragItemAtIndexPath:](self, "dragItemAtIndexPath:", v8))) == 0))
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)v9;
    v13 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  }
  return v11;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _BYTE v39[128];

  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(a3, "isEditing") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v31 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDragDelegate dragItemAtIndexPath:](self, "dragItemAtIndexPath:", v10));
    v13 = objc_opt_class(BKLibraryAsset);
    v33 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localObject"));
    v15 = BUDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v23 = objc_opt_class(BKLibraryAsset);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localObject"));
          v25 = BUDynamicCast(v23, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "assetID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
          v29 = objc_msgSend(v27, "isEqualToString:", v28);

          if (v29)
          {

            v11 = 0;
            goto LABEL_14;
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v19)
          continue;
        break;
      }
    }

    v16 = v33;
    if (v33)
    {
      v38 = v33;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
LABEL_14:
      v10 = v31;
      v9 = v32;

    }
    else
    {
      v11 = 0;
      v10 = v31;
      v9 = v32;
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "prepareForDragPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dragPreviewParametersForDrop:", 0));

  return v7;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v9 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfDragObserving, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v11, "dragAndDropSessionDidStart");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDragDelegate collectionViewCollectionID:](self, "collectionViewCollectionID:", v7));

  objc_msgSend(v6, "setLocalContext:", v10);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDragAndDropMonitor sharedInstance](BKDragAndDropMonitor, "sharedInstance"));
  objc_msgSend(v7, "processWithDragSession:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v9 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfDragObserving, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "dragAndDropSessionDidEnd");
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (BKLibraryBookshelfBooksDataSource)bookDataSource
{
  return (BKLibraryBookshelfBooksDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBookDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookDataSource, 0);
}

@end
