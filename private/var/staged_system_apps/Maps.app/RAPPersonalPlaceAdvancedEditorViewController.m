@implementation RAPPersonalPlaceAdvancedEditorViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  ACAccount *v14;
  ACAccount *account;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RAPPersonalPlaceAdvancedEditorViewController;
  -[RAPPersonalPlaceAdvancedEditorViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController tableView](self, "tableView"));
  objc_msgSend(v4, "_maps_initializeRAPAppearance");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion localizedTitle](self->_question, "localizedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Submit"), CFSTR("localized string not found"), 0));
  v10 = objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 2, self, "_send");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancel");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  v14 = (ACAccount *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
  account = self->_account;
  self->_account = v14;

}

- (void)_cancel
{
  void (**completion)(id, RAPPersonalPlaceAdvancedEditorViewController *, _QWORD);

  completion = (void (**)(id, RAPPersonalPlaceAdvancedEditorViewController *, _QWORD))self->_completion;
  if (completion)
    completion[2](completion, self, 0);
}

- (void)_send
{
  void (**completion)(id, RAPPersonalPlaceAdvancedEditorViewController *, uint64_t);

  completion = (void (**)(id, RAPPersonalPlaceAdvancedEditorViewController *, uint64_t))self->_completion;
  if (completion)
    completion[2](completion, self, 1);
}

- (void)_presentPrivacyView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.mapsrap")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (RAPPersonalPlaceAdvancedEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPPersonalPlaceAdvancedEditorViewController *v12;
  RAPPersonalPlaceAdvancedEditorViewController *v13;
  id v14;
  id completion;
  UGCPhotoCarouselController *v16;
  void *v17;
  UGCPhotoCarouselController *v18;
  UGCPhotoCarouselController *photoCarouselController;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RAPPersonalPlaceAdvancedEditorViewController;
  v12 = -[RAPPersonalPlaceAdvancedEditorViewController initWithStyle:](&v21, "initWithStyle:", 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_question, a4);
    objc_storeStrong((id *)&v13->_report, a3);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = v14;

    v16 = [UGCPhotoCarouselController alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion commentQuestion](v13->_question, "commentQuestion"));
    v18 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:](v16, "initWithDelegate:maximumNumberOfPhotos:", v13, objc_msgSend(v17, "maximumNumberOfPhotos"));
    photoCarouselController = v13->_photoCarouselController;
    v13->_photoCarouselController = v18;

    -[RAPPersonalPlaceAdvancedEditorViewController _initPhotoPicker](v13, "_initPhotoPicker");
  }

  return v13;
}

- (void)_initPhotoPicker
{
  RAPPhotoPickerController *v3;
  RAPPhotoPickerController *photoPicker;
  UGCPhotoCarouselController *v5;
  void *v6;
  RAPPhotoPickerController *v7;
  UGCPhotoCarouselController *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  UGCPhotoCarouselController *v12;

  v3 = objc_alloc_init(RAPPhotoPickerController);
  photoPicker = self->_photoPicker;
  self->_photoPicker = v3;

  v5 = self->_photoCarouselController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion commentQuestion](self->_question, "commentQuestion"));
  v7 = self->_photoPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10090669C;
  v10[3] = &unk_1011DBAB0;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  -[RAPPhotoPickerController addObserver:changeHandler:](v7, "addObserver:changeHandler:", self, v10);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_account)
    return 3;
  else
    return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = objc_msgSend(a4, "section", a3);
  if (!self->_account)
  {
    if (v5 != (id)1)
    {
      if (v5)
        goto LABEL_10;
LABEL_8:
      v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController _commentCell](self, "_commentCell"));
      return v6;
    }
LABEL_9:
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController _photoTableViewCell](self, "_photoTableViewCell"));
    return v6;
  }
  if (v5 == (id)2)
    goto LABEL_9;
  if (v5 == (id)1)
    goto LABEL_8;
  if (v5)
  {
LABEL_10:
    v6 = objc_alloc_init((Class)UITableViewCell);
    return v6;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController _userInfoCell](self, "_userInfoCell"));
  return v6;
}

- (id)_userInfoCell
{
  RAPDisplayUserContentTableViewCell *userInfoCell;
  RAPDisplayUserContentTableViewCell *v4;
  RAPDisplayUserContentTableViewCell *v5;

  userInfoCell = self->_userInfoCell;
  if (!userInfoCell)
  {
    v4 = -[RAPDisplayUserContentTableViewCell initWithStyle:reuseIdentifier:]([RAPDisplayUserContentTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_userInfoCell;
    self->_userInfoCell = v4;

    userInfoCell = self->_userInfoCell;
  }
  return userInfoCell;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  ACAccount *account;
  void *v5;

  account = self->_account;
  if (!a4 && account || (v5 = 0, a4 == 1) && !account)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController _userContentFooterView](self, "_userContentFooterView", a3));
  return v5;
}

- (id)_userContentFooterView
{
  TableViewSelectableFooterView *userContentFooterView;
  void *v4;
  TableViewSelectableFooterView *v5;
  TableViewSelectableFooterView *v6;
  void *v7;

  userContentFooterView = self->_userContentFooterView;
  if (!userContentFooterView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TableViewFooterOptions defaultRAPUserContentOptions](TableViewFooterOptions, "defaultRAPUserContentOptions"));
    v5 = -[TableViewSelectableFooterView initWithReuseIdentifier:options:]([TableViewSelectableFooterView alloc], "initWithReuseIdentifier:options:", CFSTR("RAPUserContentTableViewFooterView"), v4);
    v6 = self->_userContentFooterView;
    self->_userContentFooterView = v5;

    -[TableViewSelectableFooterView setTarget:action:](self->_userContentFooterView, "setTarget:action:", self, "_presentPrivacyView");
    if (sub_1002A8AA0(self) == 5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      -[TableViewSelectableFooterView setBackgroundColor:](self->_userContentFooterView, "setBackgroundColor:", v7);

    }
    -[TableViewSelectableFooterView sizeToFit](self->_userContentFooterView, "sizeToFit");

    userContentFooterView = self->_userContentFooterView;
  }
  return userContentFooterView;
}

- (id)_commentCell
{
  RAPReportComposerCommentTableViewCell *commentCell;
  RAPReportComposerCommentTableViewCell *v4;
  RAPReportComposerCommentTableViewCell *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  commentCell = self->_commentCell;
  if (!commentCell)
  {
    v4 = -[RAPReportComposerCommentTableViewCell initWithStyle:reuseIdentifier:]([RAPReportComposerCommentTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_commentCell;
    self->_commentCell = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion commentQuestion](self->_question, "commentQuestion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commentsPlaceholderText"));
    -[RAPReportComposerCommentTableViewCell setPlaceholderText:](self->_commentCell, "setPlaceholderText:", v7);

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100906AAC;
    v9[3] = &unk_1011C8038;
    objc_copyWeak(&v10, &location);
    -[RAPReportComposerCommentTableViewCell setTextDidChange:](self->_commentCell, "setTextDidChange:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    commentCell = self->_commentCell;
  }
  return commentCell;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  ACAccount *account;
  void *v5;

  account = self->_account;
  if (!a4 && !account || (v5 = 0, a4 == 1) && account)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceAdvancedEditorViewController _commentsHeaderView](self, "_commentsHeaderView", a3));
  return v5;
}

- (id)_commentsHeaderView
{
  RAPCommentPartHeaderView *commentsHeaderView;
  RAPCommentPartHeaderView *v4;
  void *v5;
  RAPCommentPartHeaderView *v6;
  RAPCommentPartHeaderView *v7;

  commentsHeaderView = self->_commentsHeaderView;
  if (!commentsHeaderView)
  {
    v4 = [RAPCommentPartHeaderView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion commentQuestion](self->_question, "commentQuestion"));
    v6 = -[RAPCommentPartHeaderView initWithQuestion:reuseIdentifier:](v4, "initWithQuestion:reuseIdentifier:", v5, CFSTR("RAPCommentPartHeaderView"));
    v7 = self->_commentsHeaderView;
    self->_commentsHeaderView = v6;

    -[RAPCommentPartHeaderView sizeToFit](self->_commentsHeaderView, "sizeToFit");
    commentsHeaderView = self->_commentsHeaderView;
  }
  return commentsHeaderView;
}

- (id)_photoTableViewCell
{
  RAPPhotoCarouselTableViewCell *photoCell;
  RAPPhotoCarouselTableViewCell *v4;
  RAPPhotoCarouselTableViewCell *v5;

  photoCell = self->_photoCell;
  if (!photoCell)
  {
    v4 = -[RAPPhotoCarouselTableViewCell initWithStyle:reuseIdentifier:]([RAPPhotoCarouselTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_photoCell;
    self->_photoCell = v4;

    -[RAPPhotoCarouselTableViewCell setPhotoCarouselController:](self->_photoCell, "setPhotoCarouselController:", self->_photoCarouselController);
    photoCell = self->_photoCell;
  }
  return photoCell;
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anchoringView"));
  -[RAPPhotoPickerController setAnchoringView:](self->_photoPicker, "setAnchoringView:", v4);

  -[RAPPhotoPickerController setPresentingViewController:](self->_photoPicker, "setPresentingViewController:", self);
  -[RAPPhotoPickerController startPicking](self->_photoPicker, "startPicking");
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  RAPPersonalPlaceCorrectionsQuestion *question;
  id v7;
  void *v8;
  id v9;
  void (**v10)(id, id);

  question = self->_question;
  v10 = (void (**)(id, id))a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion commentQuestion](question, "commentQuestion"));
  v9 = objc_msgSend(v8, "removePhotoForIdentifier:", v7);

  v10[2](v10, v9);
}

- (int)analyticTarget
{
  return 1302;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_userContentFooterView, 0);
  objc_storeStrong((id *)&self->_userInfoCell, 0);
  objc_storeStrong((id *)&self->_commentsHeaderView, 0);
  objc_storeStrong((id *)&self->_commentCell, 0);
  objc_storeStrong((id *)&self->_photoCell, 0);
  objc_storeStrong((id *)&self->_photoCarouselController, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
