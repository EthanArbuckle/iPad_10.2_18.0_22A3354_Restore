@implementation ICBrowseAttachmentsBaseCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("attachment"), &stru_1005704B8, 0));

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to view attachment"), &stru_1005704B8, 0));

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = objc_alloc((Class)UIAccessibilityCustomAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show in Note"), &stru_1005704B8, 0));
  v6 = objc_msgSend(v3, "initWithName:target:selector:", v5, self, "showInNote:");

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

+ (void)initialize
{
  objc_opt_class(ICBrowseAttachmentsBaseCell, a2);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsBaseCell;
  -[ICBrowseAttachmentsBaseCell dealloc](&v4, "dealloc");
}

- (void)prepareForReuse
{
  ICNAEventReporter *eventReporter;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsBaseCell;
  -[ICBrowseAttachmentsBaseCell prepareForReuse](&v4, "prepareForReuse");
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL result;

  if ("showInNote:" == a3 || "openAttachment:" == a3)
    return 1;
  result = ICDebugModeEnabled(self, a2);
  if ("openAttachmentInspector:" != a3)
    return 0;
  return result;
}

- (void)showInNote:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell ic_viewControllerManager](self, "ic_viewControllerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
  objc_msgSend(v4, "selectAttachmentWithObjectID:animated:", v5, 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell eventReporter](self, "eventReporter"));
  objc_msgSend(v6, "submitAttachmentBrowserActionEventForType:", 3);

}

- (void)openAttachment:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  objc_msgSend(v5, "browseAttachmentsCell:didSelectAttachment:", self, v4);

}

- (void)shareAttachment:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  objc_msgSend(v5, "browseAttachmentsCell:shouldShareAttachment:", self, v4);

}

- (void)openAttachmentInspector:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "browseAttachmentsCell:shouldInspectAttachment:");

  if ((v5 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    objc_msgSend(v7, "browseAttachmentsCell:shouldInspectAttachment:", self, v6);

  }
}

- (UICollectionView)collectionView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell collectionController](self, "collectionController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionView"));

  return (UICollectionView *)v3;
}

- (int64_t)indexInSection
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForCell:", self));
  v5 = objc_msgSend(v4, "item");

  return (int64_t)v5;
}

- (int64_t)countOfItemsInSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForCell:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell collectionView](self, "collectionView"));
  v8 = objc_msgSend(v6, "collectionView:numberOfItemsInSection:", v7, objc_msgSend(v4, "section"));

  return (int64_t)v8;
}

- (NSString)itemNumberAccessibilityString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell collectionView](self, "collectionView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%ld of %ld"), &stru_1005704B8, 0));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, (char *)-[ICBrowseAttachmentsBaseCell indexInSection](self, "indexInSection") + 1, -[ICBrowseAttachmentsBaseCell countOfItemsInSection](self, "countOfItemsInSection")));
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setDragging:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[ICBrowseAttachmentsBaseCell isDragging](self, "isDragging");
  v6.receiver = self;
  v6.super_class = (Class)ICBrowseAttachmentsBaseCell;
  -[ICBrowseAttachmentsBaseCell setDragging:](&v6, "setDragging:", v3);
  if (v5 != v3)
    -[ICBrowseAttachmentsBaseCell updateAppearanceForDragging:](self, "updateAppearanceForDragging:", v3);
}

- (id)dragItemForAttachment
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachmentModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemProvider"));

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    v8 = objc_msgSend(v7, "isChildOfDocumentGallery");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachmentModel"));
      objc_msgSend(v6, "setLocalObject:", v10);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)previewActionsForViewControllerManager:(id)a3 fromView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  void *v30;
  id *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = objc_alloc((Class)ICAttachmentView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell window](self, "window"));
  v12 = objc_msgSend(v9, "initWithAttachment:textContainer:actionWindow:", v10, 0, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1005704B8, 0));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000A1C58;
  v38[3] = &unk_100553358;
  v31 = &v40;
  objc_copyWeak(&v40, location);
  v15 = v12;
  v39 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:imageName:handler:](UIAction, "ic_actionWithTitle:imageName:handler:", v14, CFSTR("doc.on.doc"), v38));
  v30 = v7;

  objc_msgSend(v8, "addObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1005704B8, 0));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000A1C98;
  v36[3] = &unk_1005518A8;
  objc_copyWeak(&v37, location);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:imageName:handler:](UIAction, "ic_actionWithTitle:imageName:handler:", v18, CFSTR("square.and.arrow.up"), v36));
  v28 = v6;

  objc_msgSend(v8, "addObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Show in Note"), &stru_1005704B8, 0));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000A1CC8;
  v34[3] = &unk_1005518A8;
  objc_copyWeak(&v35, location);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:imageName:handler:](UIAction, "ic_actionWithTitle:imageName:handler:", v21, CFSTR("arrow.up.backward"), v34));

  v23 = objc_msgSend(v8, "addObject:", v22);
  if (ICDebugModeEnabled(v23, v24))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000A1CF8;
    v32[3] = &unk_1005518A8;
    objc_copyWeak(&v33, location);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_actionWithTitle:imageName:handler:](UIAction, "ic_actionWithTitle:imageName:handler:", CFSTR("Inspect Attachment"), CFSTR("magnifyingglass"), v32, v28, v30, &v40));
    objc_msgSend(v8, "addObject:", v25);

    objc_destroyWeak(&v33);
  }
  v26 = objc_msgSend(v8, "copy", v28);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(v31);
  objc_destroyWeak(location);

  return v26;
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  ICNAEventReporter *v7;
  ICNAEventReporter *eventReporter;
  void *v9;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:view:", v6, self);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (ICBrowseAttachmentsCollectionController)collectionController
{
  return (ICBrowseAttachmentsCollectionController *)objc_loadWeakRetained((id *)&self->_collectionController);
}

- (void)setCollectionController:(id)a3
{
  objc_storeWeak((id *)&self->_collectionController, a3);
}

- (ICBrowseAttachmentsCellDelegate)delegate
{
  return (ICBrowseAttachmentsCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionController);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
