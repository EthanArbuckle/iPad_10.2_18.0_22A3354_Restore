@implementation RAPNotificationDetailsViewController

- (RAPNotificationDetailsViewController)initWithViewModel:(id)a3 report:(id)a4 question:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPNotificationDetailsViewController *v12;
  RAPNotificationDetailsViewController *v13;
  UGCPhotoCarouselController *v14;
  void *v15;
  UGCPhotoCarouselController *v16;
  UGCPhotoCarouselController *photoCarouselController;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPNotificationDetailsViewController;
  v12 = -[RAPNotificationDetailsViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeStrong((id *)&v13->_report, a4);
    objc_storeStrong((id *)&v13->_question, a5);
    v14 = [UGCPhotoCarouselController alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserResponseQuestion commentQuestion](v13->_question, "commentQuestion"));
    v16 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:](v14, "initWithDelegate:maximumNumberOfPhotos:", v13, objc_msgSend(v15, "maximumNumberOfPhotos"));
    photoCarouselController = v13->_photoCarouselController;
    v13->_photoCarouselController = v16;

    -[RAPNotificationDetailsViewController _initPhotoPicker](v13, "_initPhotoPicker");
  }

  return v13;
}

- (BOOL)_supportEdit
{
  return self->_report && self->_question;
}

- (void)_initPhotoPicker
{
  RAPPhotoPickerController *v3;
  RAPPhotoPickerController *photoPicker;
  UGCPhotoCarouselController *v5;
  void *v6;
  RAPPhotoPickerController *v7;
  id v8;
  UGCPhotoCarouselController *v9;
  _QWORD v10[4];
  id v11;
  UGCPhotoCarouselController *v12;
  id v13;
  id location;

  v3 = objc_alloc_init(RAPPhotoPickerController);
  photoPicker = self->_photoPicker;
  self->_photoPicker = v3;

  v5 = self->_photoCarouselController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserResponseQuestion commentQuestion](self->_question, "commentQuestion"));
  objc_initWeak(&location, self);
  v7 = self->_photoPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002DBEDC;
  v10[3] = &unk_1011B0778;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v5;
  v12 = v9;
  -[RAPPhotoPickerController addObserver:changeHandler:](v7, "addObserver:changeHandler:", self, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  -[RAPNotificationDetailsViewController _setupHeaderButtons](self, "_setupHeaderButtons");
  v10.receiver = self;
  v10.super_class = (Class)RAPNotificationDetailsViewController;
  -[RAPNotificationDetailsViewController viewDidLoad](&v10, "viewDidLoad");
  if (sub_1002A8AA0(self) == 5)
    -[RAPNotificationDetailsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 390.0, 520.0);
  -[RAPNotificationDetailsViewController _setupViews](self, "_setupViews");
  -[RAPNotificationDetailsViewController _setupConstraints](self, "_setupConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rapRecord"));

  if (v4)
  {
    -[RAPNotificationDetailsViewController _updateSummarySection](self, "_updateSummarySection");
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportId"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002DC14C;
    v7[3] = &unk_1011B07A0;
    objc_copyWeak(&v8, &location);
    +[RAPRecordManager fetchRAPRecordsMatchingProblemId:completion:](RAPRecordManager, "fetchRAPRecordsMatchingProblemId:completion:", v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsViewController;
  -[RAPNotificationDetailsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsViewController;
  -[RAPNotificationDetailsViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

}

- (void)_setupHeaderButtons
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  v4 = objc_msgSend(v3, "editMode");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Reviewed Reports [RAP]"), CFSTR("localized string not found"), 0));
  -[RAPNotificationDetailsViewController setTitle:](self, "setTitle:", v6);

  v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = v7;
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Not Now [RAP]"), CFSTR("localized string not found"), 0));
    v11 = objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, "_done:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v12, "setLeftBarButtonItem:", v11);

    v13 = objc_alloc((Class)UIBarButtonItem);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Send [RAP]"), CFSTR("localized string not found"), 0));
    v16 = objc_msgSend(v13, "initWithTitle:style:target:action:", v15, 0, self, "_send:");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v17, "setRightBarButtonItem:", v16);

  }
  else
  {
    v14 = objc_msgSend(v7, "initWithBarButtonSystemItem:target:action:", 0, self, "_done:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setRightBarButtonItem:", v14);
  }

  -[RAPNotificationDetailsViewController _updateDoneButton](self, "_updateDoneButton");
}

- (void)_updateDoneButton
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  v4 = objc_msgSend(v3, "editMode");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserResponseQuestion commentQuestion](self->_question, "commentQuestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "comment"));
    if (objc_msgSend(v6, "length"))
    {

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserResponseQuestion commentQuestion](self->_question, "commentQuestion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photos"));
      v9 = objc_msgSend(v8, "count");

      if (!v9)
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController navigationItem](self, "navigationItem"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightBarButtonItem"));
        v11 = v10;
        v12 = 0;
        goto LABEL_6;
      }
    }
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController navigationItem](self, "navigationItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rightBarButtonItem"));
  v11 = v10;
  v12 = 1;
LABEL_6:
  objc_msgSend(v10, "setEnabled:", v12);

}

- (void)_setupViews
{
  UIVisualEffectView *v3;
  UIVisualEffectView *blurView;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double left;
  double bottom;
  double right;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void **v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  id v49;
  id location;

  v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  blurView = self->_blurView;
  self->_blurView = v3;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_blurView);

  v6 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", &stru_1011B07E0);
  v7 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v6, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RAPNotificationDetailsViewController setCollectionView:](self, "setCollectionView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setDataSource:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v11 = objc_opt_class(TwoLinesCollectionViewInsetGroupedListCell);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v14 = objc_opt_class(RAPNotificationDetailsMapCell);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotificationDetailsMapCell identifier](RAPNotificationDetailsMapCell, "identifier"));
  objc_msgSend(v13, "registerClass:forCellWithReuseIdentifier:", v14, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v17 = objc_opt_class(RAPNotificationDescriptionCell);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotificationDescriptionCell identifier](RAPNotificationDescriptionCell, "identifier"));
  objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", v17, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v20 = objc_opt_class(_TtC4Maps34RAPPhotoCarouselCollectionViewCell);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[RAPPhotoCarouselCollectionViewCell reuseIdentifier](_TtC4Maps34RAPPhotoCarouselCollectionViewCell, "reuseIdentifier"));
  objc_msgSend(v19, "registerClass:forCellWithReuseIdentifier:", v20, v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v23 = objc_opt_class(_TtC4Maps29RAPTextViewCollectionViewCell);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTextViewCollectionViewCell reuseIdentifier](_TtC4Maps29RAPTextViewCollectionViewCell, "reuseIdentifier"));
  objc_msgSend(v22, "registerClass:forCellWithReuseIdentifier:", v23, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v29, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v30, "addSubview:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  if ((objc_msgSend(v32, "hasButton") & 1) == 0)
    goto LABEL_4;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "button"));
  v35 = objc_msgSend(v34, "buttonAction");

  if (v35)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration grayButtonConfiguration](UIButtonConfiguration, "grayButtonConfiguration"));
    objc_msgSend(v32, "setButtonSize:", 3);
    objc_initWeak(&location, self);
    v45 = _NSConcreteStackBlock;
    v46 = 3221225472;
    v47 = sub_1002DCC3C;
    v48 = &unk_1011AF8A0;
    objc_copyWeak(&v49, &location);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v45));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v32, v36, v45, v46, v47, v48));
    -[RAPNotificationDetailsViewController setActionButton:](self, "setActionButton:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "button"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedText"));
    objc_msgSend(v39, "setTitle:forState:", v42, 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    objc_msgSend(v43, "addSubview:", v44);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
LABEL_4:

  }
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  _QWORD v66[7];

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_blurView, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v58));
  v66[0] = v56;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_blurView, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v50));
  v66[1] = v48;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_blurView, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v42));
  v66[2] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v66[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "safeAreaLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v31));
  v66[4] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v4));
  v66[5] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v66[6] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 7));
  objc_msgSend(v64, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
  if (v12)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v59, 16.0));
    v65[0] = v49;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v51, 16.0));
    v65[1] = v47;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v14, -16.0));
    v65[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController actionButton](self, "actionButton"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "safeAreaLayoutGuide"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v20));
    v65[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 4));
    objc_msgSend(v64, "addObjectsFromArray:", v22);

    v23 = v45;
    v24 = v53;

    v25 = (void *)v49;
    v26 = v61;

    v27 = (void *)v59;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController view](self, "view"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v27));
    objc_msgSend(v64, "addObject:", v25);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v64);
}

- (void)_done:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel", a3));
  v5 = objc_msgSend(v4, "editMode");

  if (v5)
    +[RAPAnalyticsManager captureRAPCancelActionFromReport:](RAPAnalyticsManager, "captureRAPCancelActionFromReport:", self->_report);
  -[RAPNotificationDetailsViewController _dismissAndOpenReportsHome](self, "_dismissAndOpenReportsHome");
}

- (void)_send:(id)a3
{
  -[RAPNotificationDetailsViewController _submitReport](self, "_submitReport", a3);
}

- (void)_performButtonAction:(int)a3
{
  if (a3 == 1)
    -[RAPNotificationDetailsViewController _dismissAndOpenReportsHome](self, "_dismissAndOpenReportsHome");
}

- (void)_dismissAndOpenReportsHome
{
  void *v3;
  Block_layout *v4;
  id v5;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController navigationController](self, "navigationController"));
    v4 = &stru_1011B0840;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController presentingViewController](self, "presentingViewController"));
    v4 = &stru_1011B0860;
  }
  v5 = v3;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)_updateSummarySection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *notificationSummaryItems;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rapRecord"));

  if (v4)
    objc_msgSend(v11, "addObject:", &off_10126CAD8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
  v6 = objc_msgSend(v5, "displayStyle");

  if (v6 != (id)6)
    objc_msgSend(v11, "addObject:", &off_10126CAF0);
  v7 = (NSArray *)objc_msgSend(v11, "copy");
  notificationSummaryItems = self->_notificationSummaryItems;
  self->_notificationSummaryItems = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
  objc_msgSend(v9, "reloadSections:", v10);

}

- (void)_submitReport
{
  id v3;
  void *v4;
  RAPReport *report;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RAPNotificationDetailsViewController *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (-[RAPNotificationDetailsViewController _supportEdit](self, "_supportEdit"))
  {
    v3 = sub_10085876C();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_initWeak(&location, self);
    report = self->_report;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002DD6E8;
    v12[3] = &unk_1011B08A8;
    v6 = v4;
    v13 = v6;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002DD6F0;
    v8[3] = &unk_1011B08D0;
    objc_copyWeak(&v11, &location);
    v7 = v6;
    v9 = v7;
    v10 = self;
    -[RAPReport submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:](report, "submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:", &stru_1011B0880, v12, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (void)_setRAPRecordAsInReviewWithReportID:(id)a3
{
  +[RAPRecordManager editStatusOfRAPRecordWithReportID:status:completion:](RAPRecordManager, "editStatusOfRAPRecordWithReportID:status:completion:", a3, 0, &stru_1011B08F0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
    if (objc_msgSend(v7, "editMode"))
    {
      if (-[RAPNotificationDetailsViewController _supportEdit](self, "_supportEdit"))
        a4 = 2;
      else
        a4 = 0;
    }
    else
    {
      a4 = 0;
    }

  }
  else if (a4 != 1)
  {
    if (a4)
      a4 = 0;
    else
      a4 = -[NSArray count](self->_notificationSummaryItems, "count");
  }

  return a4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RAPNotificationDescriptionViewModel *v19;
  void *v20;
  RAPNotificationDescriptionViewModel *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 != (id)2)
  {
    if (v8 == (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotificationDescriptionCell identifier](RAPNotificationDescriptionCell, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v18, v7));

      v19 = [RAPNotificationDescriptionViewModel alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
      v21 = -[RAPNotificationDescriptionViewModel initWithRAPNotificationDetailsViewModel:](v19, "initWithRAPNotificationDetailsViewModel:", v20);
      objc_msgSend(v12, "setViewModel:", v21);

      objc_msgSend(v12, "setDelegate:", self);
      goto LABEL_15;
    }
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_notificationSummaryItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      v10 = objc_msgSend(v9, "integerValue");

      if (v10 == (id)1)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotificationDetailsMapCell identifier](RAPNotificationDetailsMapCell, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v23, v7));

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
        objc_msgSend(v12, "setViewModel:", v16);
        goto LABEL_14;
      }
      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v7));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rapRecord"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRAPReportsHistory:allowDisclosureIndicator:](TwoLinesContentViewModelComposer, "cellModelForRAPReportsHistory:allowDisclosureIndicator:", v14, 0));
        objc_msgSend(v12, "setViewModel:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
        objc_msgSend(v12, "setBackgroundColor:", v16);
LABEL_14:

        goto LABEL_15;
      }
    }
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "row"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[RAPPhotoCarouselCollectionViewCell reuseIdentifier](_TtC4Maps34RAPPhotoCarouselCollectionViewCell, "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v22, v7));

    objc_msgSend(v12, "setCarouselController:", self->_photoCarouselController);
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "row") != (id)1)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_15;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTextViewCollectionViewCell reuseIdentifier](_TtC4Maps29RAPTextViewCollectionViewCell, "reuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v17, v7));

  objc_msgSend(v12, "setDelegate:", self);
  objc_storeStrong((id *)&self->_textViewCell, v12);
LABEL_15:

  return v12;
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  _TtC4Maps29RAPTextViewCollectionViewCell *textViewCell;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  id v34;
  CGRect v35;
  CGRect v36;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
  objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v16, v7, v9, v11, v13);
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v19, "setContentInset:", 0.0, 0.0, v18, 0.0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  textViewCell = self->_textViewCell;
  if (textViewCell)
  {
    -[RAPTextViewCollectionViewCell frame](textViewCell, "frame");
    v36.origin.x = v30;
    v36.origin.y = v31;
    v36.size.width = v32;
    v36.size.height = v33;
    v35.origin.x = v22;
    v35.origin.y = v24;
    v35.size.width = v26;
    v35.size.height = v28 - v18;
    if (!CGRectContainsRect(v35, v36))
    {
      v34 = (id)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
      -[RAPTextViewCollectionViewCell frame](self->_textViewCell, "frame");
      objc_msgSend(v34, "scrollRectToVisible:animated:", 1);

    }
  }
}

- (void)keyboardWillHide:(id)a3
{
  double left;
  double bottom;
  double right;
  void *v7;
  id v8;

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v7, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  -[RAPNotificationDetailsViewController _done:](self, "_done:", 0);
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
  RAPUserResponseQuestion *question;
  id v8;
  void *v9;
  id v10;
  void (**v11)(id, id);

  question = self->_question;
  v11 = (void (**)(id, id))a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserResponseQuestion commentQuestion](question, "commentQuestion"));
  v10 = objc_msgSend(v9, "removePhotoForIdentifier:", v8);

  -[RAPNotificationDetailsViewController _updateDoneButton](self, "_updateDoneButton");
  v11[2](v11, v10);

}

- (void)textViewCellDidChangeWithTextViewCell:(id)a3 validatedText:(id)a4
{
  RAPUserResponseQuestion *question;
  id v6;
  void *v7;

  question = self->_question;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserResponseQuestion commentQuestion](question, "commentQuestion"));
  objc_msgSend(v7, "setComment:", v6);

  -[RAPNotificationDetailsViewController _updateDoneButton](self, "_updateDoneButton");
}

- (void)descriptionCellLinkButtonClick:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController viewModel](self, "viewModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "linkButtonLink"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewController delegate](self, "delegate"));
  objc_msgSend(v6, "openURLWithDetailsViewController:URL:", self, v7);

}

- (RAPNotificationDetailsViewControllerDelegate)delegate
{
  return (RAPNotificationDetailsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textViewCell, 0);
  objc_storeStrong((id *)&self->_photoCarouselController, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_notificationSummaryItems, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
