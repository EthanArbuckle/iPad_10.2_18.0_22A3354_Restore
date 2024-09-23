@implementation UGCPhotosSectionController

- (UGCPhotosSectionController)initWithPhotosForm:(id)a3 mapItem:(id)a4 presentingViewController:(id)a5 deferAddPhotoPresentationToParent:(BOOL)a6 analyticsDelegate:(id)a7 showSuggestedPhotos:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  MKMapItem *v16;
  id v17;
  id v18;
  UGCPhotosSectionController *v19;
  UGCPhotosSectionController *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  ActionCoordination *actionCoordinator;
  uint64_t v25;
  uint64_t v26;
  UGCARPPhotoCarouselController *v27;
  id WeakRetained;
  id v29;
  void *v30;
  _BOOL8 v31;
  UGCARPPhotoCarouselController *v32;
  UGCPhotoCarouselController *photoEditorController;
  UGCPhotoCarouselController *v34;
  void *v35;
  UGCPhotoCarouselController *v36;
  UGCPhotoCarouselController *v37;
  MKMapItem *v38;
  MKMapItem *mapItem;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v46;
  objc_super v47;

  v8 = a8;
  v15 = a3;
  v16 = (MKMapItem *)a4;
  v17 = a5;
  v18 = a7;
  v47.receiver = self;
  v47.super_class = (Class)UGCPhotosSectionController;
  v19 = -[UGCPhotosSectionController init](&v47, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_analyticsDelegate, v18);
    objc_storeStrong((id *)&v20->_photosForm, a3);
    objc_storeWeak((id *)&v20->_presentingViewController, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "appCoordinator"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "baseActionCoordinator"));
    actionCoordinator = v20->_actionCoordinator;
    v20->_actionCoordinator = (ActionCoordination *)v23;

    v20->_deferAddPhotoPresentationToParent = a6;
    v46 = v15;
    if (v16 && MapsFeature_IsEnabled_SydneyARP(v25, v26))
    {
      v27 = [UGCARPPhotoCarouselController alloc];
      WeakRetained = objc_loadWeakRetained((id *)&v20->_presentingViewController);
      v29 = objc_msgSend(v15, "maximumNumberOfPhotos");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](v20->_photosForm, "activePhotoList"));
      v31 = objc_msgSend(v30, "count") != 0;
      -[MKMapItem _coordinate](v16, "_coordinate");
      v32 = -[UGCARPPhotoCarouselController initWithDelegate:presentingViewController:maximumNumberOfPhotos:previouslySubmittedPhotosExist:mapItemCoordinate:showPhotoCarousel:](v27, "initWithDelegate:presentingViewController:maximumNumberOfPhotos:previouslySubmittedPhotosExist:mapItemCoordinate:showPhotoCarousel:", v20, WeakRetained, v29, v31, v8);
      photoEditorController = v20->_photoEditorController;
      v20->_photoEditorController = &v32->super;

    }
    else
    {
      v34 = [UGCPhotoCarouselController alloc];
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](v20->_photosForm, "activePhotoList"));
      v36 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:prefersMenu:](v34, "initWithDelegate:maximumNumberOfPhotos:prefersMenu:", v20, (char *)objc_msgSend(v35, "count") + sub_10038D8B0(v20->_photosForm), 1);
      v37 = v20->_photoEditorController;
      v20->_photoEditorController = v36;

      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcAddPhotoCellBackgroundColor](MapsTheme, "ugcAddPhotoCellBackgroundColor"));
      -[UGCPhotoCarouselController setCellBackgroundColor:](v20->_photoEditorController, "setCellBackgroundColor:", WeakRetained);
    }

    v38 = v16;
    mapItem = v20->_mapItem;
    v20->_mapItem = v16;

    -[UGCPhotosSectionController _addPhotosToEditorController](v20, "_addPhotosToEditorController");
    v40 = -[UGCPhotoCarouselController setDelegate:](v20->_photoEditorController, "setDelegate:", v20);
    v15 = v46;
    if (MapsFeature_IsEnabled_SydneyARP(v40, v41))
    {
      if (v20->_deferAddPhotoPresentationToParent)
      {
        v20->_showingAddYourPhotosCell = 1;
      }
      else
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm addedPhotos](v20->_photosForm, "addedPhotos"));
        v43 = objc_msgSend(v42, "count");

        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm addedPhotos](v20->_photosForm, "addedPhotos"));
          v20->_showingAddYourPhotosCell = objc_msgSend(v44, "count") == 0;

        }
        else
        {
          v20->_showingAddYourPhotosCell = 1;
        }
        v15 = v46;
      }
    }
  }

  return v20;
}

- (void)_addPhotosToEditorController
{
  UGCPhotoCarouselController *photoEditorController;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  UGCPhotoCarouselController *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (!self->_deferAddPhotoPresentationToParent)
  {
    photoEditorController = self->_photoEditorController;
    v4 = objc_opt_class(UGCARPPhotoCarouselController);
    isKindOfClass = objc_opt_isKindOfClass(photoEditorController, v4);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self->_photosForm, "activePhotoList", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v7)
      goto LABEL_15;
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));

        v13 = self->_photoEditorController;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          -[UGCPhotoCarouselController addImageURL:forIdentifier:](v13, "addImageURL:forIdentifier:", v14, v15);
        }
        else
        {
          if ((isKindOfClass & 1) != 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
            -[UGCPhotoCarouselController addPhotoWithMetadata:forIdentifier:](v13, "addPhotoWithMetadata:forIdentifier:", v11, v14);
            goto LABEL_13;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "image"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          -[UGCPhotoCarouselController addImage:forIdentifier:](v13, "addImage:forIdentifier:", v14, v15);
        }

LABEL_13:
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v8)
      {
LABEL_15:

        return;
      }
    }
  }
}

- (void)_requestAddingNewPhotoWithSourceType:(int64_t)a3
{
  -[UGCPhotosSectionController photoCarouselControllerRequestsAddingNewPhoto:forSourceType:](self, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:", self->_photoEditorController, a3);
}

- (void)_photoCarouselControllerRequestsPhotoCreditEditor
{
  ActionCoordination *actionCoordinator;
  id WeakRetained;

  actionCoordinator = self->_actionCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  -[ActionCoordination viewControllerShowPhotoCredit:](actionCoordinator, "viewControllerShowPhotoCredit:", WeakRetained);

}

- (void)addPhotosCellRequestsAddingNewPhoto:(id)a3 usingSourceType:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17[2];
  id location;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "photosSectionController:userActionCapturedForAction:value:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController delegate](self, "delegate"));
    objc_msgSend(v9, "photosSectionController:userActionCapturedForAction:value:", self, 2147, CFSTR("business info"));

  }
  v10 = -[UGCPhotosSectionController deferAddPhotoPresentationToParent](self, "deferAddPhotoPresentationToParent");
  if (v10)
  {
    v11 = objc_alloc_init((Class)MUPresentationOptions);
    objc_msgSend(v11, "setSourceView:", v6);
    objc_msgSend(v6, "frame");
    objc_msgSend(v11, "setSourceRect:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController delegate](self, "delegate"));
    v13 = objc_opt_respondsToSelector(v12, "photosSectionController:selectedAddPhotosUsingSourceType:presentationOptions:");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController delegate](self, "delegate"));
      objc_msgSend(v14, "photosSectionController:selectedAddPhotosUsingSourceType:presentationOptions:", self, a4, v11);

    }
  }
  else if (MapsFeature_IsEnabled_ARPCommunityID(v10)
         && GEOConfigGetBOOL(MapsConfig_ARPCommunityIDShouldRemovePrivacyScreenForRatingOnlyFlows, off_1014B4D88))
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1006BE2B0;
    v16[3] = &unk_1011C0570;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a4;
    +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:presentationContext:completion:](UGCInformedConsentViewController, "presentIfNeededWithPresentingViewController:presentationContext:completion:", WeakRetained, 0, v16);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[UGCPhotosSectionController _presentAddPhotosControllerWithSourceType:](self, "_presentAddPhotosControllerWithSourceType:", a4);
  }

}

- (void)_presentAddPhotosControllerWithSourceType:(int64_t)a3
{
  UGCAddPhotosController *v5;
  id WeakRetained;
  int64_t v7;
  void *v8;
  void *v9;
  UGCAddPhotosController *v10;
  UGCAddPhotosController *takePhotoController;

  v5 = [UGCAddPhotosController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7 = sub_10038D8B0(self->_photosForm);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_placeQuestionnaire"));
  v10 = -[UGCAddPhotosController initWithPresentingViewController:sourceType:multipleSelectionLimit:placeQuestionnaire:delegate:](v5, "initWithPresentingViewController:sourceType:multipleSelectionLimit:placeQuestionnaire:delegate:", WeakRetained, a3, v7, v9, self);
  takePhotoController = self->_takePhotoController;
  self->_takePhotoController = v10;

  -[UGCAddPhotosController present](self->_takePhotoController, "present");
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v7;
  UGCPhotosForm *v8;
  void *v9;
  char *v10;
  int64_t v11;
  void (**v12)(id, _BOOL8);

  v12 = (void (**)(id, _BOOL8))a5;
  v7 = -[UGCPhotosForm removePhotoWithIdentifier:](self->_photosForm, "removePhotoWithIdentifier:", a4);
  if (v7)
  {
    v8 = self->_photosForm;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](v8, "activePhotoList"));
    v10 = (char *)objc_msgSend(v9, "count");
    v11 = sub_10038D8B0(v8);

    -[UGCPhotoCarouselController setMaximumNumberOfPhotos:](self->_photoEditorController, "setMaximumNumberOfPhotos:", &v10[v11]);
  }
  v12[2](v12, v7);

}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
  -[UGCPhotosSectionController photoCarouselControllerRequestsAddingNewPhoto:forSourceType:](self, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:", a3, 0);
}

- (void)photoCarouselControllerDidUpdatePhotoCredit:(id)a3
{
  -[UGCPhotosSectionController updatePhotoCreditInCollectionViewHeader](self, "updatePhotoCreditInCollectionViewHeader", a3);
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3 forSourceType:(int64_t)a4
{
  UGCAddPhotosController *v6;
  id WeakRetained;
  int64_t v8;
  void *v9;
  void *v10;
  UGCAddPhotosController *v11;
  UGCAddPhotosController *takePhotoController;

  v6 = [UGCAddPhotosController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v8 = sub_10038D8B0(self->_photosForm);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_placeQuestionnaire"));
  v11 = -[UGCAddPhotosController initWithPresentingViewController:sourceType:multipleSelectionLimit:placeQuestionnaire:delegate:](v6, "initWithPresentingViewController:sourceType:multipleSelectionLimit:placeQuestionnaire:delegate:", WeakRetained, a4, v8, v10, self);
  takePhotoController = self->_takePhotoController;
  self->_takePhotoController = v11;

  -[UGCAddPhotosController present](self->_takePhotoController, "present");
}

- (void)suggestedPhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  UGCPhotosForm *v16;
  void *v17;
  char *v18;
  int64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  -[UGCPhotosForm addPhotoListWithMetadata:](self->_photosForm, "addPhotoListWithMetadata:", v7);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "photoMetadata", (_QWORD)v20));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientImageUuid"));
        objc_msgSend(v6, "addPhotoWithMetadata:forIdentifier:", v13, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v16 = self->_photosForm;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](v16, "activePhotoList"));
  v18 = (char *)objc_msgSend(v17, "count");
  v19 = sub_10038D8B0(v16);

  -[UGCPhotoCarouselController setMaximumNumberOfPhotos:](self->_photoEditorController, "setMaximumNumberOfPhotos:", &v18[v19]);
  -[UGCPhotosSectionController updateSelectedPhotosCountInCollectionViewHeader](self, "updateSelectedPhotosCountInCollectionViewHeader");

}

- (void)takePhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4
{
  UGCPhotosForm *photosForm;
  id v7;
  UGCPhotosForm *v8;
  void *v9;
  char *v10;
  int64_t v11;
  id v12;

  photosForm = self->_photosForm;
  v7 = a4;
  v12 = a3;
  -[UGCPhotosForm addPhotoListWithMetadata:](photosForm, "addPhotoListWithMetadata:", v7);
  -[UGCPhotosSectionController _addPhotosWithMetadataToEditor:](self, "_addPhotosWithMetadataToEditor:", v7);

  -[UGCPhotosSectionController _removeAddPhotosRowItemIfNeeded](self, "_removeAddPhotosRowItemIfNeeded");
  v8 = self->_photosForm;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](v8, "activePhotoList"));
  v10 = (char *)objc_msgSend(v9, "count");
  v11 = sub_10038D8B0(v8);

  -[UGCPhotoCarouselController setMaximumNumberOfPhotos:](self->_photoEditorController, "setMaximumNumberOfPhotos:", &v10[v11]);
  -[UGCPhotosSectionController _dismissTakePhotoController:](self, "_dismissTakePhotoController:", v12);

}

- (void)_addPhotosWithMetadataToEditor:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  UGCPhotoCarouselController *photoEditorController;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_opt_class(self->_photoEditorController);
        v11 = objc_msgSend(v10, "isEqual:", objc_opt_class(UGCARPPhotoCarouselController));
        photoEditorController = self->_photoEditorController;
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "photoMetadata"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientImageUuid"));
          -[UGCPhotoCarouselController addPhotoWithMetadata:forIdentifier:](photoEditorController, "addPhotoWithMetadata:forIdentifier:", v9, v14);

          -[UGCPhotosSectionController updateSelectedPhotosCountInCollectionViewHeader](self, "updateSelectedPhotosCountInCollectionViewHeader");
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "image"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "photoMetadata"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clientImageUuid"));
          -[UGCPhotoCarouselController addImage:forIdentifier:](photoEditorController, "addImage:forIdentifier:", v15, v17);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (id)addPhotosControllerRequestsAnchoringView:(id)a3
{
  void *addPhotosCell;

  addPhotosCell = self->_addPhotosCell;
  if (!addPhotosCell)
    addPhotosCell = self->_photoEditorController;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(addPhotosCell, "anchoringView", a3));
}

- (unint64_t)numberOfSelectedPhotosForAddPhotosController:(id)a3
{
  return -[UGCPhotosForm numberOfAddedPhotos](self->_photosForm, "numberOfAddedPhotos", a3);
}

- (void)_removeAddPhotosRowItemIfNeeded
{
  if (self->_showingAddYourPhotosCell)
  {
    self->_showingAddYourPhotosCell = 0;
    -[UGCPhotosSectionController removeAddPhotosRowItem](self, "removeAddPhotosRowItem");
  }
}

- (void)_dismissTakePhotoController:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1006BE9CC;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

- (id)configureCollectionViewHeader
{
  UGCPhotoCarouselController *v3;
  UGCPhotoCreditSectionHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = self->_photoEditorController;
  v4 = objc_alloc_init(UGCPhotoCreditSectionHeaderView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController collectionViewHeaderTitleForNumberOfSelectedPhotos:](v3, "collectionViewHeaderTitleForNumberOfSelectedPhotos:", -[UGCPhotosForm numberOfAddedPhotos](self->_photosForm, "numberOfAddedPhotos")));
  -[UGCPhotoCreditSectionHeaderView setTitle:](v4, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController collectionViewButtonTitle](v3, "collectionViewButtonTitle"));
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController configurePhotoCreditStringForCollectionViewHeader](v3, "configurePhotoCreditStringForCollectionViewHeader"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006BEB88;
  v11[3] = &unk_1011AD260;
  objc_copyWeak(&v12, &location);
  -[UGCPhotoCreditSectionHeaderView setSubtitleActionTitle:completionHandler:](v4, "setSubtitleActionTitle:completionHandler:", v7, v11);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006BEBB8;
  v9[3] = &unk_1011C0598;
  objc_copyWeak(&v10, &location);
  -[UGCPhotoCreditSectionHeaderView setAccessoryActionTitle:selectionHandler:](v4, "setAccessoryActionTitle:selectionHandler:", v6, v9);
  -[UGCPhotoCreditSectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v4;
}

- (void)updatePhotoCreditInCollectionViewHeader
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController configurePhotoCreditStringForCollectionViewHeader](self->_photoEditorController, "configurePhotoCreditStringForCollectionViewHeader"));
  -[UGCPhotoCreditSectionHeaderView setSubtitle:](self->_headerView, "setSubtitle:", v3);

}

- (void)updateSelectedPhotosCountInCollectionViewHeader
{
  unint64_t v3;
  void *v4;

  v3 = -[UGCPhotosForm numberOfAddedPhotos](self->_photosForm, "numberOfAddedPhotos");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselController collectionViewHeaderTitleForNumberOfSelectedPhotos:](self->_photoEditorController, "collectionViewHeaderTitleForNumberOfSelectedPhotos:", v3));
  -[UGCPhotoCreditSectionHeaderView setTitle:](self->_headerView, "setTitle:", v4);

  -[UGCPhotoCreditSectionHeaderView setAccessoryActionButtonEnabled:](self->_headerView, "setAccessoryActionButtonEnabled:", v3 < -[UGCPhotosForm maximumNumberOfPhotos](self->_photosForm, "maximumNumberOfPhotos"));
}

- (NSArray)rowItems
{
  NSArray *rowItems;
  id v4;
  UGCPOIEnrichmentHeaderCell *v5;
  uint64_t v6;
  char IsEnabled_SydneyARP;
  void *v8;
  void *v9;
  void *v10;
  UGCPhotoCarouselCell *v11;
  double y;
  double width;
  double height;
  UGCPhotoCarouselCell *v15;
  UGCPhotoCarouselController *photoEditorController;
  uint64_t v17;
  UGCPhotoCreditSectionHeaderView *v18;
  UGCPhotoCreditSectionHeaderView *headerView;
  void *v20;
  UGCPOIEnrichmentEditorCell *v21;
  UGCPOIEnrichmentEditorCell *photoEditorContainerCell;
  id v23;
  void *v24;
  uint64_t v25;
  UGCAddPhotosCell *v26;
  UGCAddPhotosCell *addPhotosCell;
  void *v28;
  void *v29;
  _BOOL4 deferAddPhotoPresentationToParent;
  uint64_t v32;
  uint64_t BOOL;
  uint64_t v34;
  NSArray *v35;
  NSArray *v36;
  NSArray *v37;

  if (!self->_photosForm)
    return (NSArray *)&__NSArray0__struct;
  rowItems = self->_rowItems;
  if (!rowItems)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = (UGCPOIEnrichmentHeaderCell *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (-[UGCPOIEnrichmentHeaderCell userInterfaceIdiom](v5, "userInterfaceIdiom") == (id)5)
    {
      IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP(5, v6);

      if ((IsEnabled_SydneyARP & 1) != 0)
      {
LABEL_7:
        v11 = [UGCPhotoCarouselCell alloc];
        y = CGRectZero.origin.y;
        width = CGRectZero.size.width;
        height = CGRectZero.size.height;
        v15 = -[UGCPhotoCarouselCell initWithFrame:](v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
        -[UGCPhotoCarouselCell setCarouselController:](v15, "setCarouselController:", self->_photoEditorController);
        photoEditorController = self->_photoEditorController;
        v17 = objc_opt_class(UGCARPPhotoCarouselController);
        if ((objc_opt_isKindOfClass(photoEditorController, v17) & 1) != 0)
        {
          v18 = (UGCPhotoCreditSectionHeaderView *)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController configureCollectionViewHeader](self, "configureCollectionViewHeader"));
          headerView = self->_headerView;
          self->_headerView = v18;

          -[UGCPhotoCreditSectionHeaderView setPreservesSuperviewLayoutMargins:](self->_headerView, "setPreservesSuperviewLayoutMargins:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:](UGCPOIEnrichmentRowItem, "rowItemWithView:", self->_headerView));
          -[UGCPhotoCreditSectionHeaderView setHidden:](self->_headerView, "setHidden:", self->_showingAddYourPhotosCell);
          objc_msgSend(v4, "addObject:", v20);

        }
        v21 = -[UGCPOIEnrichmentEditorCell initWithFrame:]([UGCPOIEnrichmentEditorCell alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
        photoEditorContainerCell = self->_photoEditorContainerCell;
        self->_photoEditorContainerCell = v21;

        -[UGCPOIEnrichmentEditorCell setHidden:](self->_photoEditorContainerCell, "setHidden:", self->_showingAddYourPhotosCell);
        -[UGCPOIEnrichmentEditorCell addSubview:](self->_photoEditorContainerCell, "addSubview:", v15);
        v23 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", v15, self->_photoEditorContainerCell);
        objc_msgSend(v23, "activate");

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:bottomSpacing:](UGCPOIEnrichmentRowItem, "rowItemWithView:bottomSpacing:", self->_photoEditorContainerCell, 16.0));
        if (MapsFeature_IsEnabled_SydneyARP(v24, v25))
        {
          if (self->_showingAddYourPhotosCell)
          {
            v26 = -[UGCAddPhotosCell initWithDelegate:]([UGCAddPhotosCell alloc], "initWithDelegate:", self);
            addPhotosCell = self->_addPhotosCell;
            self->_addPhotosCell = v26;

            -[UGCAddPhotosCell setClipsToBounds:](self->_addPhotosCell, "setClipsToBounds:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:bottomSpacing:](UGCPOIEnrichmentRowItem, "rowItemWithView:bottomSpacing:", self->_addPhotosCell, 16.0));
            objc_msgSend(v4, "addObject:", v28);

          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self->_photosForm, "activePhotoList"));
          if (objc_msgSend(v29, "count"))
          {

          }
          else
          {
            deferAddPhotoPresentationToParent = self->_deferAddPhotoPresentationToParent;

            if (!deferAddPhotoPresentationToParent)
            {
              if (!MapsFeature_IsEnabled_ARPCommunityID(v32)
                || (BOOL = GEOConfigGetBOOL(MapsConfig_ARPCommunityIDShouldRemovePrivacyScreenForRatingOnlyFlows, off_1014B4D88), !(_DWORD)BOOL)|| MKGetHasUserConsentedToAddingContributions(BOOL, v34) == 1)
              {
                -[UGCPhotosSectionController _checkForNearbyPhotos](self, "_checkForNearbyPhotos");
              }
            }
          }
        }
        objc_msgSend(v4, "addObject:", v24);
        v35 = (NSArray *)objc_msgSend(v4, "copy");
        v36 = self->_rowItems;
        self->_rowItems = v35;

        rowItems = self->_rowItems;
        goto LABEL_21;
      }
      v5 = -[UGCPOIEnrichmentHeaderCell initWithFrame:]([UGCPOIEnrichmentHeaderCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Your Photos Header [UGC]"), CFSTR("localized string not found"), 0));
      -[UGCPOIEnrichmentHeaderCell setHeaderText:](v5, "setHeaderText:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:bottomSpacing:](UGCPOIEnrichmentRowItem, "rowItemWithView:bottomSpacing:", v5, 10.0));
      objc_msgSend(v4, "addObject:", v10);

    }
    goto LABEL_7;
  }
LABEL_21:
  v37 = rowItems;
  return v37;
}

- (void)_checkForNearbyPhotos
{
  MKMapItem *mapItem;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  mapItem = self->_mapItem;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006BF0BC;
  v4[3] = &unk_1011AD4F0;
  objc_copyWeak(&v5, &location);
  +[UGCNearbyPhotosAvailibility hasTakenPhotosForMapItem:completion:](UGCNearbyPhotosAvailibility, "hasTakenPhotosForMapItem:completion:", mapItem, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeAddPhotosRowItem
{
  void *v3;
  id v4;

  self->_showingAddYourPhotosCell = 0;
  -[UGCPOIEnrichmentEditorCell setHidden:](self->_photoEditorContainerCell, "setHidden:", 0);
  -[UGCPhotoCreditSectionHeaderView setHidden:](self->_headerView, "setHidden:", 0);
  -[UGCAddPhotosCell setHidden:](self->_addPhotosCell, "setHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController delegate](self, "delegate"));
  objc_msgSend(v3, "photosSectionController:willShowPhotoCarousel:", self, 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotosSectionController delegate](self, "delegate"));
  objc_msgSend(v4, "sectionControllerDidUpdateRowItems:", self);

}

- (void)_addFakePhoto
{
  NSData *v3;
  void *v4;
  id v5;
  UGCPhotoWithMetadata *v6;
  void *v7;
  UGCPhotoWithMetadata *v8;
  UGCPhotoCarouselController *photoEditorController;
  void *v10;
  UIImage *v11;

  v11 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPNotListed")));
  v3 = UIImageJPEGRepresentation(v11, 0.800000012);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", 33.3, -128.7);
  v6 = [UGCPhotoWithMetadata alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = -[UGCPhotoWithMetadata initWithImageData:date:location:source:](v6, "initWithImageData:date:location:source:", v4, v7, v5, 2);

  -[UGCPhotosForm addPhoto:](self->_photosForm, "addPhoto:", v8);
  photoEditorController = self->_photoEditorController;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata identifier](v8, "identifier"));
  -[UGCPhotoCarouselController addImage:forIdentifier:](photoEditorController, "addImage:forIdentifier:", v11, v10);

}

- (unint64_t)numberOfImagePreviews
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self->_photosForm, "activePhotoList"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)imagePreviewAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self->_photosForm, "activePhotoList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", a3));

  return v5;
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  self->_formInteractionEnabled = a3;
}

- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate
{
  return (UGCPOIEnrichmentAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (UGCPhotoSectionControllerDelegate)delegate
{
  return (UGCPhotoSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)deferAddPhotoPresentationToParent
{
  return self->_deferAddPhotoPresentationToParent;
}

- (void)setDeferAddPhotoPresentationToParent:(BOOL)a3
{
  self->_deferAddPhotoPresentationToParent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_rowItems, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_takePhotoController, 0);
  objc_storeStrong((id *)&self->_photoEditorController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_photoEditorContainerCell, 0);
  objc_storeStrong((id *)&self->_addPhotosCell, 0);
  objc_storeStrong((id *)&self->_photosCollectionView, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_photosForm, 0);
}

@end
