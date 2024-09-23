@implementation CollectionAddViewController

- (id)headerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Guide] Save to My Guides"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int)requestSource
{
  return 22;
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v6;
  CollectionSaveSession *editSession;
  id v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  objc_super v17;

  v6 = a4;
  editSession = self->_editSession;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](editSession, "collection"));
  v17.receiver = self;
  v17.super_class = (Class)CollectionAddViewController;
  LOBYTE(self) = -[AddFromACViewController searchDataSource:shouldFilterItem:](&v17, "searchDataSource:shouldFilterItem:", v8, v6);

  if ((self & 1) == 0)
  {
    v11 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoCompletionItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geoMapItem"));

      v14 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v13, 0);
      if (!v14)
      {
LABEL_9:
        v10 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v15 = objc_opt_class(MKMapItem);
      if ((objc_opt_isKindOfClass(v6, v15) & 1) == 0)
        goto LABEL_9;
      v14 = v6;
      if (!v14)
        goto LABEL_9;
    }
    v10 = objc_msgSend(v9, "containsItem:", v14);

    goto LABEL_10;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (void)saveMapItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self->_editSession, "collection"));
  -[CollectionEditSession addSelectedObject:](self->_editSession, "addSelectedObject:", v4);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100757BB0;
  v15[3] = &unk_1011AC8B0;
  v15[4] = self;
  v6 = v5;
  v16 = v6;
  v7 = objc_retainBlock(v15);
  if (-[CollectionSaveSession canRenameSelectedObjectInCollection:](self->_editSession, "canRenameSelectedObjectInCollection:", v6))
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100757D64;
    v12 = &unk_1011AFAB0;
    v13 = v4;
    v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController _maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:](UIViewController, "_maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:", v13, &v9, 0));
    -[CollectionAddViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0, v9, v10, v11, v12);

  }
  else
  {
    ((void (*)(_QWORD *))v7[2])(v7);
  }

}

- (CollectionSaveSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
  objc_storeStrong((id *)&self->_editSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSession, 0);
}

@end
