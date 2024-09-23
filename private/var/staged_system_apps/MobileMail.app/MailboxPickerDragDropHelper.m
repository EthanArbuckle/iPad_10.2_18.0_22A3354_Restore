@implementation MailboxPickerDragDropHelper

- (MailboxPickerDragDropHelper)initWithDelegate:(id)a3
{
  id v4;
  MailboxPickerDragDropHelper *v5;
  MailboxPickerDragDropHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailboxPickerDragDropHelper;
  v5 = -[MailboxPickerDragDropHelper init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3));
  LOBYTE(self) = -[MailboxPickerDragDropHelper _dragItemsAreAllMessages:](self, "_dragItemsAreAllMessages:", v5);

  return (char)self;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3));
  v5 = v17;
  if (-[MailboxPickerDragDropHelper _dragItemsAreAllMessages:](self, "_dragItemsAreAllMessages:", v17))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MFMailMessageDragPreview")));
    objc_msgSend(v6, "size");
    v8 = v7;
    objc_msgSend(v6, "size");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v8, v9, 4.0));
    v10 = objc_alloc_init((Class)UIDragPreviewParameters);
    objc_msgSend(v10, "setVisiblePath:", v16);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v17;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1000D2954;
          v18[3] = &unk_10051E028;
          v19 = v6;
          v20 = v10;
          objc_msgSend(v15, "setPreviewProvider:", v18, v16);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    v5 = v17;
  }

}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  LODWORD(self) = -[MailboxPickerDragDropHelper _dragItemsAreAllMessages:](self, "_dragItemsAreAllMessages:", v6);

  if ((_DWORD)self)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setPreviewProvider:", 0);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MidX;
  double MidY;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  MailboxPickerDragDropHelper *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;

  v35 = a3;
  v36 = a4;
  v37 = self;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerDragDropHelper delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "destinationIndexPath"));
  if (v6)
  {
    v39 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cellForItemAtIndexPath:"));
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v45.origin.x = v9;
    v45.origin.y = v11;
    v45.size.width = v13;
    v45.size.height = v15;
    MidX = CGRectGetMidX(v45);
    v46.origin.x = v9;
    v46.origin.y = v11;
    v46.size.width = v13;
    v46.size.height = v15;
    MidY = CGRectGetMidY(v46);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "items"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sourceIndexPath"));
          v24 = v23 == 0;

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dragItem"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localObject"));
            v27 = objc_opt_class(MFMoveMessageTriageInteraction);
            if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
            {
              v28 = v26;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mailboxPickerDragDropHelper:favoriteItemAtIndexPath:", v37, v39));
              if (objc_msgSend(v29, "type") == (id)4)
              {
                v30 = objc_msgSend(v29, "mailboxType");
                objc_msgSend(v28, "setTargetMailboxType:", ECMailboxTypeFromMailboxUidType(v30, v31));
              }
              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "representingMailbox"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mailboxPickerDragDropHelper:mailboxForMailboxUid:", v37, v32));
                objc_msgSend(v28, "setTargetMailbox:", v33);

              }
              objc_msgSend(v28, "performInteraction");
              v34 = objc_msgSend(v36, "dropItem:intoItemAtIndexPath:rect:", v25, v39, MidX, MidY, 0.0, 0.0);

            }
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v19);
    }

    v6 = v39;
  }

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    goto LABEL_13;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localDragSession"));

  if (!v11)
    goto LABEL_13;
  if ((objc_msgSend(v8, "hasActiveDrag") & 1) != 0)
  {
    v12 = 1;
    v13 = 3;
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
  v15 = -[MailboxPickerDragDropHelper _dragItemsAreAllMessages:](self, "_dragItemsAreAllMessages:", v14);

  if (!v15)
  {
LABEL_13:
    v12 = 0;
    v13 = 1;
    goto LABEL_14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerDragDropHelper delegate](self, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailboxPickerDragDropHelper:favoriteItemAtIndexPath:", self, v10));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
  v19 = -[MailboxPickerDragDropHelper _canMoveDragItems:toFavoriteItem:](self, "_canMoveDragItems:toFavoriteItem:", v18, v17);

  if (v19)
    v13 = 3;
  else
    v13 = 1;
  if (v19)
    v12 = 2;
  else
    v12 = 0;

LABEL_14:
  v20 = objc_msgSend(objc_alloc((Class)UICollectionViewDropProposal), "initWithDropOperation:intent:", v13, v12);

  return v20;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    goto LABEL_13;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localDragSession"));
  if (!v11 || (objc_msgSend(v8, "hasActiveDrag") & 1) != 0)
    goto LABEL_4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
  v14 = -[MailboxPickerDragDropHelper _dragItemsAreAllMessages:](self, "_dragItemsAreAllMessages:", v13);

  if (!v14)
  {
LABEL_13:
    v12 = 3;
    goto LABEL_14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerDragDropHelper delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mailboxPickerDragDropHelper:favoriteItemAtIndexPath:", self, v10));

  if (objc_msgSend(v11, "acceptsMessageTransfers"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "account"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "account"));
      if (objc_msgSend(v17, "sourceIsManaged"))
        v12 = 2;
      else
        v12 = 1;

      goto LABEL_5;
    }
  }
LABEL_4:
  v12 = 3;
LABEL_5:

LABEL_14:
  return v12;
}

- (BOOL)_dragItemsAreAllMessages:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (+[MessageListItemDragContext dragItemsAreAllMessageListItems:](MessageListItemDragContext, "dragItemsAreAllMessageListItems:", v3))
  {
    v4 = 1;
  }
  else
  {
    v4 = +[MFMailMessage dragItemsAreAllMessages:](MFMailMessage, "dragItemsAreAllMessages:", v3);
  }

  return v4;
}

- (BOOL)_canMoveDragItems:(id)a3 toFavoriteItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  unsigned __int8 v14;
  BOOL v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v17 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "acceptsMessageTransfers") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
    if (v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v17;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "localObject"));
            v12 = objc_opt_class(MFMoveMessageTriageInteraction);
            if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
            {
              v13 = v11;
              v14 = objc_msgSend(v13, "isPermittedWithTargetAccount:", v6);

              if ((v14 & 1) == 0)
              {

                v15 = 0;
                goto LABEL_16;
              }
            }

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            continue;
          break;
        }
      }
      v15 = 1;
LABEL_16:

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MailboxPickerDragDropHelperDelegate)delegate
{
  return (MailboxPickerDragDropHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
