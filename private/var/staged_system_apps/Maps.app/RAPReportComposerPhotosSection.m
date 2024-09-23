@implementation RAPReportComposerPhotosSection

- (RAPReportComposerPhotosSection)initWithQuestion:(id)a3
{
  id v5;
  RAPReportComposerPhotosSection *v6;
  RAPReportComposerPhotosSection *v7;
  id *p_question;
  UGCPhotoCarouselController *v9;
  UGCPhotoCarouselController *carouselViewModel;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  UGCPhotoCarouselController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RAPReportComposerPhotosSection;
  v6 = -[RAPTablePartSection init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    v23 = v5;
    p_question = (id *)&v6->_question;
    objc_storeStrong((id *)&v6->_question, a3);
    v9 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:prefersMenu:]([UGCPhotoCarouselController alloc], "initWithDelegate:maximumNumberOfPhotos:prefersMenu:", v7, objc_msgSend(*p_question, "maximumNumberOfPhotos"), 1);
    carouselViewModel = v7->_carouselViewModel;
    v7->_carouselViewModel = v9;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_question, "photos"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v17 = v7->_carouselViewModel;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "photo"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_diffableDataSourceIdentifier"));
          -[UGCPhotoCarouselController addImage:forIdentifier:](v17, "addImage:forIdentifier:", v18, v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    v5 = v23;
    if (objc_msgSend(*p_question, "emphasis") == (id)1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedPhotosPickerLabel"));
      -[RAPTablePartSection setHeaderTitle:](v7, "setHeaderTitle:", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedPhotosPickerExplanation"));
    -[RAPTablePartSection setFooterTitle:](v7, "setFooterTitle:", v21);

  }
  return v7;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Photos [Add Photos Section]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  RAPPhotoCarouselTableViewCell *v4;
  void *v5;

  v4 = (RAPPhotoCarouselTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:](self, "dequeueCellWithNamespacedReuseIdentifier:", CFSTR("PhotoCell")));
  if (!v4)
  {
    v4 = -[RAPPhotoCarouselTableViewCell initWithStyle:reuseIdentifier:]([RAPPhotoCarouselTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PhotoCell"));
    -[RAPPhotoCarouselTableViewCell setPhotoCarouselController:](v4, "setPhotoCarouselController:", self->_carouselViewModel);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection presentingViewController](self, "presentingViewController"));
    -[UGCPhotoCarouselController setPresentingViewController:](self->_carouselViewModel, "setPresentingViewController:", v5);

  }
  return v4;
}

- (void)_startPickingPhotoFromView:(id)a3 sourceType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection presentingViewController](self, "presentingViewController"));
  -[RAPPhotoPickerController setPresentingViewController:](self->_picker, "setPresentingViewController:", v7);

  -[RAPPhotoPickerController setAnchoringView:](self->_picker, "setAnchoringView:", v6);
  -[RAPPhotoPickerController startPickingWithSourceType:](self->_picker, "startPickingWithSourceType:", a4);
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
  -[RAPReportComposerPhotosSection photoCarouselControllerRequestsAddingNewPhoto:forSourceType:](self, "photoCarouselControllerRequestsAddingNewPhoto:forSourceType:", a3, 0);
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3 forSourceType:(int64_t)a4
{
  id v6;
  RAPPhotoPickerController *picker;
  RAPPhotoPickerController *v8;
  void *v9;
  void *v10;
  RAPPhotoPickerController *v11;
  RAPPhotoPickerController *v12;
  UGCPhotoCarouselController *v13;
  RAPCommentQuestion *v14;
  RAPPhotoPickerController *v15;
  UGCPhotoCarouselController *v16;
  RAPCommentQuestion *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  RAPCommentQuestion *v23;
  UGCPhotoCarouselController *v24;

  v6 = a3;
  picker = self->_picker;
  if (!picker)
  {
    v8 = [RAPPhotoPickerController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion photos](self->_question, "photos"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = -[RAPPhotoPickerController initWithInitialPhoto:](v8, "initWithInitialPhoto:", v10);
    v12 = self->_picker;
    self->_picker = v11;

    v13 = self->_carouselViewModel;
    v14 = self->_question;
    v15 = self->_picker;
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10098E160;
    v22 = &unk_1011DD5D0;
    v23 = v14;
    v24 = v13;
    v16 = v13;
    v17 = v14;
    -[RAPPhotoPickerController addObserver:changeHandler:](v15, "addObserver:changeHandler:", self, &v19);

    picker = self->_picker;
  }
  -[RAPPhotoPickerController clearSelectedPhoto](picker, "clearSelectedPhoto", v19, v20, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchoringView"));
  -[RAPReportComposerPhotosSection _startPickingPhotoFromView:sourceType:](self, "_startPickingPhotoFromView:sourceType:", v18, a4);

}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  RAPCommentQuestion *question;
  void (**v7)(id, id);

  question = self->_question;
  v7 = (void (**)(id, id))a5;
  v7[2](v7, (id)-[RAPCommentQuestion removePhotoForIdentifier:](question, "removePhotoForIdentifier:", a4));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselViewModel, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
