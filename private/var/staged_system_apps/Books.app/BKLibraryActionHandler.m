@implementation BKLibraryActionHandler

- (id)menuWithLibraryAsset:(id)a3 sourceView:(id)a4 collection:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001B772C;
  v18[3] = &unk_1008EE6B8;
  objc_copyWeak(&v22, &location);
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDeferredMenuElement elementWithUncachedProvider:](UIDeferredMenuElement, "elementWithUncachedProvider:", v18));
  v24 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_10091C438, v15));

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v16;
}

- (id)tracker
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ba_effectiveAnalyticsTracker"));

  return v3;
}

- (id)analyticsAssetPropertyProviderForLibraryAsset:(id)a3 fromSourceView:(id)a4 inCollection:(id)a5
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler _dataModelForLibraryAsset:fromSourceView:inCollection:](self, "_dataModelForLibraryAsset:fromSourceView:inCollection:", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKContextMenuProvider sharedProvider](BKContextMenuProvider, "sharedProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "analyticsAssetPropertyProviderForDataModel:", v5));

  return v7;
}

- (id)_dataModelForLibraryAsset:(id)a3 fromSourceView:(id)a4 inCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataSourceAdaptor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "booksDataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productInfoForAssetID:", v14));

  v16 = objc_alloc((Class)BSUIContextActionDataModel);
  v17 = objc_msgSend(objc_alloc((Class)BSUIContextActionDataAssetModel), "initWithLibraryAsset:productProfile:", v10, v15);

  v18 = objc_msgSend(v16, "initWithAssetModel:sourceView:", v17, v9);
  objc_msgSend(v18, "setOriginatingLocation:", v8);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "im_ancestorConformingToProtocol:", &OBJC_PROTOCOL___BCTransactionProviding));
  objc_msgSend(v18, "setTransactionProvider:", v20);

  return v18;
}

- (void)showGrid
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v2, "changeViewModeTo:", 1);

}

- (void)showList
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v2, "changeViewModeTo:", 2);

}

- (void)toggleEditMode
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  +[BKLibraryBookshelfController reconfigureBookshelfCollectionViewController:forEditModeState:](BKLibraryBookshelfController, "reconfigureBookshelfCollectionViewController:forEditModeState:", v4, objc_msgSend(v3, "isEditing") ^ 1);

}

- (void)changeSortModeTo:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v4, "changeSortModeTo:", a3);

}

- (void)bookTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v5, "bookTapped:completion:", v4, 0);

}

- (void)bookTapped:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v8, "bookTapped:completion:", v7, v6);

}

- (void)directBuyTapped:(id)a3 buyParameters:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v8, "directBuyTapped:buyParameters:completion:", v7, v6, 0);

}

- (void)directBuyTapped:(id)a3 buyParameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v11, "directBuyTapped:buyParameters:completion:", v10, v9, v8);

}

- (void)showReadingLists
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v3, "showReadingListsForActionHandler:", self);

}

- (void)bookMarkedFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  BKLibraryActionHandler *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readingActivityService"));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001B7DEC;
    v11[3] = &unk_1008ED548;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v13 = v5;
    v14 = v8;
    v15 = v4;
    v16 = self;
    v9 = v8;
    v10 = v12;
    objc_msgSend(v10, "performBlockOnWorkerQueue:", v11);

  }
}

- (void)bookCancelDownload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v5, "cancelDownloadBook:", v4);

}

- (void)bookResumeDownload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v5, "resumeDownloadBook:", v4);

}

- (void)bookWriteReview:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  BKLibraryActionHandler *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001B8234;
    v6[3] = &unk_1008E7D28;
    v7 = v4;
    v8 = self;
    -[BKLibraryActionHandler _checkAudiobookAvailabilityForAsset:completion:](self, "_checkAudiobookAvailabilityForAsset:completion:", v7, v6);

  }
}

- (void)bookUpdateStarRating:(id)a3 rating:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BKLibraryActionHandler *v16;
  id v17;
  double v18;

  v8 = a3;
  v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B838C;
  v13[3] = &unk_1008EE730;
  v18 = a4;
  v14 = v8;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v16 = self;
  v17 = v9;
  v10 = v9;
  v11 = v15;
  v12 = v8;
  -[BKLibraryActionHandler _checkAudiobookAvailabilityForAsset:completion:](self, "_checkAudiobookAvailabilityForAsset:completion:", v12, v13);

}

- (void)descriptionUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ba_effectiveAnalyticsTracker"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v6, "emitCollectionDescriptionEventWithTracker:collectionID:", v7, v5);

}

- (void)_checkAudiobookAvailabilityForAsset:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v9, "isStore")
    && (objc_msgSend(v9, "isContainer") & 1) == 0
    && ((objc_msgSend(v9, "isAudiobook") & 1) != 0
     || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "isStoreAudiobook")),
         v7 = objc_msgSend(v6, "BOOLValue"),
         v6,
         v7)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
    +[BSUIStoreServices checkAudiobookAvailabilityForStoreID:completion:](BSUIStoreServices, "checkAudiobookAvailabilityForStoreID:completion:", v8, v5);

  }
  else
  {
    v5[2](v5, 0);
  }

}

- (void)_showActionNotAvailableBecauseContentNotAvailableAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Audiobook Unavailable"), &stru_10091C438, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("This audiobook can’t be rated or reviewed, because it is no longer available on Apple Books."), &stru_10091C438, 0));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0));

  objc_msgSend(v11, "addAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryActionHandler bookshelfCVC](self, "bookshelfCVC"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

}

- (BKLibraryBookshelfCollectionViewController)bookshelfCVC
{
  return (BKLibraryBookshelfCollectionViewController *)objc_loadWeakRetained((id *)&self->_bookshelfCVC);
}

- (void)setBookshelfCVC:(id)a3
{
  objc_storeWeak((id *)&self->_bookshelfCVC, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bookshelfCVC);
}

@end
