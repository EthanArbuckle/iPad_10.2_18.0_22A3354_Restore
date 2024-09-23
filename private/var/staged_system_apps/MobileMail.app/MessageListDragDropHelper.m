@implementation MessageListDragDropHelper

- (MessageListDragDropHelper)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MessageListDragDropHelper *v8;
  MessageListDragDropHelper *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MessageListDragDropHelper;
  v8 = -[MessageListDragDropHelper init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E3C0;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9F98 != -1)
    dispatch_once(&qword_1005A9F98, block);
  return (OS_os_log *)(id)qword_1005A9F90;
}

- (id)_dragItemsForDragSession:(id)a3 atIndexPath:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  id v32;

  v28 = a3;
  v29 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[MessageListDragDropHelper log](MessageListDragDropHelper, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v29;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Drag source items requested for indexpath: %{public}@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageDragDropHelper:itemContextForIndexPath:", self, v29));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "items"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageListItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "undoManagerForMessageListDragDropHelper:", self));
    if (-[NSObject count](v10, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v10, "firstObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localObject"));
      v16 = objc_opt_class(MFMoveMessageTriageInteraction);
      isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if ((isKindOfClass & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localObject"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageListItemSelection"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "messageListItems"));
        objc_msgSend(v12, "addObjectsFromArray:", v20);

      }
      objc_msgSend(v14, "setLocalObject:", 0);

    }
    v21 = objc_claimAutoreleasedReturnValue(+[MessageListDragDropHelper log](MessageListDragDropHelper, "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will begin dragging %lu message list items", buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dragItem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MFTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFMoveMessageTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v24, v13, 2, 2));
    objc_msgSend(v23, "setLocalObject:", v25);

    v30 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MessageListDragDropHelper log](MessageListDragDropHelper, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v29;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Context is nil. Cancel drag for item at indexPath: %{public}@", buf, 0xCu);
    }
    v26 = 0;
  }

  return v26;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper _dragItemsForDragSession:atIndexPath:](self, "_dragItemsForDragSession:atIndexPath:", a4, a5));
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper delegate](self, "delegate"));
  objc_msgSend(v6, "dragItemCornerRadius:", self);

  v7 = objc_alloc_init((Class)UIDragPreviewParameters);
  objc_msgSend(v5, "bounds");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
  objc_msgSend(v7, "setVisiblePath:", v8);

  return v7;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper _dragItemsForDragSession:atIndexPath:](self, "_dragItemsForDragSession:atIndexPath:", a4, a5, a6.x, a6.y));
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "willBeginDragForMessageListDragDropHelper:", self);

}

- (BOOL)_canMoveDragItems:(id)a3 toMailboxes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  id v17;
  BOOL v18;
  uint64_t v20;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v5 = a3;
  v6 = a4;
  v23 = v5;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_compactMap:", &stru_10051F080));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(obj);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "localObject", v20));
          v11 = objc_opt_class(MFMoveMessageTriageInteraction);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            v12 = v21;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v25;
              while (2)
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v25 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
                  v17 = v10;
                  LODWORD(v16) = objc_msgSend(v17, "isPermittedWithTargetAccount:", v16);

                  if (!(_DWORD)v16)
                  {

                    v18 = 0;
                    goto LABEL_23;
                  }
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                if (v13)
                  continue;
                break;
              }
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        v18 = 1;
      }
      while (v8);
    }
    else
    {
      v18 = 1;
    }
LABEL_23:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dropMailboxesForMessageListDragDropHelper:", self));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  LODWORD(self) = -[MessageListDragDropHelper _canMoveDragItems:toMailboxes:](self, "_canMoveDragItems:toMailboxes:", v9, v8);

  v10 = objc_alloc((Class)UICollectionViewDropProposal);
  if ((_DWORD)self)
    v11 = 3;
  else
    v11 = 1;
  v12 = objc_msgSend(v10, "initWithDropOperation:dropLocation:", v11, 2);

  return v12;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  unsigned __int8 v24;
  char v25;
  void *v27;
  void *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];
  _BYTE v41[128];

  v29 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dropMailboxesForMessageListDragDropHelper:", self));

  if (!v6)
    goto LABEL_21;
  v28 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "items"));
  v8 = +[MessageListItemDragContext dragItemsAreAllMessageListItems:](MessageListItemDragContext, "dragItemsAreAllMessageListItems:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_21;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v10 = objc_msgSend(v9, "type");

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10010F26C;
  v39[3] = &unk_10051F0A0;
  v39[4] = v10;
  if ((objc_msgSend(v6, "ef_all:", v39) & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v11 = objc_alloc_init((Class)NSMutableSet);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "items"));
    obj = v12;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "localObject", v27));
          v17 = objc_opt_class(MFMoveMessageTriageInteraction);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageListItemSelection"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageListItems"));

            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v32 != v21)
                    objc_enumerationMutation(v19);
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1)
                                                                                     + 8 * (_QWORD)j), "mailboxes"));
                  objc_msgSend(v11, "addObjectsFromArray:", v23);

                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v20);
            }

          }
        }
        v12 = obj;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v13);
    }

    v24 = objc_msgSend(v27, "intersectsSet:", v11);
    v25 = v24 ^ 1;
    v6 = v28;
  }
  else
  {
LABEL_21:
    v25 = 0;
  }

  return v25;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v6;
  id v7;
  double MidX;
  double MidY;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGAffineTransform v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;

  v23 = a3;
  v24 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "session"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));

  v7 = objc_alloc((Class)UIDragPreviewTarget);
  objc_msgSend(v23, "bounds");
  MidX = CGRectGetMidX(v32);
  objc_msgSend(v23, "bounds");
  MidY = CGRectGetMidY(v33);
  CGAffineTransformMakeScale(&v30, 0.0, 0.0);
  v25 = objc_msgSend(v7, "initWithContainer:center:transform:", v23, &v30, MidX, MidY);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dropMailboxesForMessageListDragDropHelper:", self));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v22;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localObject", v22));
        v18 = objc_opt_class(MFMoveMessageTriageInteraction);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          v19 = v17;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
          objc_msgSend(v19, "setTargetMailbox:", v20);

          objc_msgSend(v19, "performInteraction");
          v21 = objc_msgSend(v24, "dropItem:toTarget:", v16, v25);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

}

- (int64_t)_dataOwnerForMailboxes:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "ef_any:", &stru_10051F0C0))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageDragDropHelper:itemContextForIndexPath:", self, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageListItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxes"));
  v11 = -[MessageListDragDropHelper _dataOwnerForMailboxes:](self, "_dataOwnerForMailboxes:", v10);

  return v11;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  void *v6;
  void *v7;
  int64_t v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListDragDropHelper dataSource](self, "dataSource", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dropMailboxesForMessageListDragDropHelper:", self));

  v8 = -[MessageListDragDropHelper _dataOwnerForMailboxes:](self, "_dataOwnerForMailboxes:", v7);
  return v8;
}

- (MessageListDragDropHelperDataSource)dataSource
{
  return (MessageListDragDropHelperDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (MessageListDragDropHelperDelegate)delegate
{
  return (MessageListDragDropHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
