@implementation ICBrowseAttachmentsDragAndDropDelegate

+ (id)sharedInstance
{
  if (qword_1005DDE20 != -1)
    dispatch_once(&qword_1005DDE20, &stru_100552AF8);
  return (id)qword_1005DDE18;
}

- (id)dragItemsForItemAtIndexPath:(id)a3 collectionView:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class(ICBrowseAttachmentsBaseCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v6));

  v9 = ICDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dragItemForAttachment"));
  v12 = (void *)v11;
  if (v11)
  {
    v15 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  else
  {
    v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[ICBrowseAttachmentsDragAndDropDelegate dragItemsForItemAtIndexPath:collectionView:](self, "dragItemsForItemAtIndexPath:collectionView:", a5, a3);
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v9;
  id v10;
  ICBrowseAttachmentsDragAndDropDelegate *v11;
  void *v12;

  v9 = a3;
  v10 = a5;
  v11 = (ICBrowseAttachmentsDragAndDropDelegate *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "localContext"));

  if (v11 == self)
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsDragAndDropDelegate dragItemsForItemAtIndexPath:collectionView:](self, "dragItemsForItemAtIndexPath:collectionView:", v10, v9));
  else
    v12 = &__NSArray0__struct;

  return v12;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  objc_msgSend(a4, "setLocalContext:", self);
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  v5 = objc_opt_class(ICBrowseAttachmentsBrickCell);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_opt_class(ICBrowseAttachmentsBrickCell);
    v7 = ICDynamicCast(v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_alloc_init((Class)UIDragPreviewParameters);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachmentBrickView"));
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
    objc_msgSend(v19, "cornerRadius");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v12, v14, v16, v18, v20));

    objc_msgSend(v9, "setVisiblePath:", v21);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
