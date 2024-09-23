@implementation MFMessageInfoViewController

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017BCE0;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA218 != -1)
    dispatch_once(&qword_1005AA218, block);
  return (id)qword_1005AA210;
}

- (MFMessageInfoViewController)initWithCoder:(id)a3
{
  id v5;

  v5 = a3;
  -[MFMessageInfoViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageInfoViewController initWithCoder:]", "MFMessageInfoViewController.m", 103, "0");
}

- (MFMessageInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[MFMessageInfoViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageInfoViewController initWithNibName:bundle:]", "MFMessageInfoViewController.m", 104, "0");
}

- (MFMessageInfoViewController)initWithViewModel:(id)a3 contactsStore:(id)a4
{
  id v7;
  id v8;
  MFMessageInfoViewController *v9;
  MFMessageInfoViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageInfoViewController;
  v9 = -[MFMessageInfoViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

- (MFMessageInfoViewController)initWithViewModel:(id)a3 contactsStore:(id)a4 attachmentURLs:(id)a5 richLinkURLs:(id)a6 numberOfMessagesInConversation:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MFMessageInfoViewController *v17;
  MFMessageInfoViewController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MFMessageInfoViewController;
  v17 = -[MFMessageInfoViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_viewModel, a3);
    objc_storeStrong((id *)&v18->_contactStore, a4);
    v18->_numberOfMessagesInConversation = a7;
    objc_storeStrong((id *)&v18->_conversationAttachmentURLs, a5);
    objc_storeStrong((id *)&v18->_richLinkURLs, a6);
  }

  return v18;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  UICollectionViewCellRegistration *v16;
  UICollectionViewCellRegistration *v17;
  UICollectionViewCellRegistration *v18;
  UICollectionViewCellRegistration *v19;
  UICollectionViewCellRegistration *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  unint64_t i;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id location;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  objc_super v73;
  void *v74;

  v73.receiver = self;
  v73.super_class = (Class)MFMessageInfoViewController;
  -[MFMessageInfoViewController viewDidLoad](&v73, "viewDidLoad");
  v3 = _EFLocalizedString(CFSTR("Info"), &unk_10059D2A0, &unk_10059D2A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[MFMessageInfoViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setStyle:", 0);

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "_close:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  v8 = objc_alloc_init((Class)NSCache);
  -[MFMessageInfoViewController setImageCache:](self, "setImageCache:", v8);

  v9 = objc_alloc_init((Class)NSCache);
  -[MFMessageInfoViewController setRichLinkCache:](self, "setRichLinkCache:", v9);

  v10 = objc_alloc_init((Class)NSDateFormatter);
  -[MFMessageInfoViewController setDateFormatter:](self, "setDateFormatter:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController dateFormatter](self, "dateFormatter"));
  objc_msgSend(v11, "setDateStyle:", 1);

  v12 = objc_alloc((Class)UICollectionView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController createCollectionViewLayout](self, "createCollectionViewLayout"));
  v14 = objc_msgSend(v12, "initWithFrame:collectionViewLayout:", v13, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  objc_msgSend(v14, "setBackgroundColor:", v15);

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10017C9A4;
  v72[3] = &unk_100521AE8;
  v72[4] = self;
  v16 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(MFContactInfoCell), v72);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10017CBD0;
  v71[3] = &unk_100521B10;
  v71[4] = self;
  v17 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(MFSubjectInfoCell), v71);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10017CC48;
  v70[3] = &unk_100521B38;
  v70[4] = self;
  v18 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(AttachmentPreviewCollectionViewCell), v70);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_10017CF9C;
  v69[3] = &unk_100521B60;
  v69[4] = self;
  v19 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(ImagePreviewCollectionViewCell), v69);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10017D1AC;
  v68[3] = &unk_100521B88;
  v68[4] = self;
  v20 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(LinkPreviewCollectionViewCell), v68);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v21 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10017D268;
  v62[3] = &unk_100521BB0;
  v40 = v50;
  v63 = v40;
  v42 = v48;
  v64 = v42;
  v41 = v49;
  v65 = v41;
  v43 = v47;
  v66 = v43;
  v39 = v51;
  v67 = v39;
  v52 = objc_msgSend(v21, "initWithCollectionView:cellProvider:", v14, v62);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22 = objc_opt_class(MFMessageInfoHeaderSectionView);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10017D4EC;
  v59[3] = &unk_10051B8D8;
  objc_copyWeak(&v60, &location);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v22, UICollectionElementKindSectionHeader, v59));
  v23 = objc_opt_class(MFMessageInfoHeaderSectionView);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10017D648;
  v57[3] = &unk_10051B8D8;
  objc_copyWeak(&v58, &location);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v23, UICollectionElementKindSectionHeader, v57));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10017D7C4;
  v53[3] = &unk_100521BD8;
  v53[4] = self;
  v25 = v14;
  v54 = v25;
  v45 = v24;
  v55 = v45;
  v44 = v46;
  v56 = v44;
  objc_msgSend(v52, "setSupplementaryViewProvider:", v53);
  v26 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  sub_10017D9E4(self);
  for (i = 0; ; ++i)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
    v29 = i < (unint64_t)objc_msgSend(v28, "count");

    if (!v29)
      break;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", i));
    v74 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v74, 1));
    objc_msgSend(v26, "appendSectionsWithIdentifiers:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController items](self, "items"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", i));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", i));
    objc_msgSend(v26, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v34, v36);

  }
  objc_msgSend(v52, "applySnapshotUsingReloadData:", v26);
  objc_msgSend(v25, "setDataSource:", v52);
  objc_msgSend(v25, "setDelegate:", self);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
  objc_msgSend(v37, "addSubview:", v25);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
  objc_msgSend(v25, "mf_pinToView:usingLayoutMargins:", v38, 0);

  -[MFMessageInfoViewController setCollectionView:](self, "setCollectionView:", v25);
  -[MFMessageInfoViewController setDataSource:](self, "setDataSource:", v52);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);

}

- (id)createCollectionViewLayout
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  MFMessageInfoViewController *v13;
  id v14;

  v3 = objc_msgSend(objc_alloc((Class)UICollectionLayoutListConfiguration), "initWithAppearance:", 2);
  objc_msgSend(v3, "setHeaderMode:", 1);
  v4 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10017E89C;
  v12 = &unk_100521C00;
  v13 = self;
  v5 = v3;
  v14 = v5;
  v6 = objc_msgSend(v4, "initWithSectionProvider:", &v9);
  if (_os_feature_enabled_impl("Mail", "AttachmentsSharedWithYou"))
  {
    v7 = objc_opt_class(MFMessageInfoSectionBackgroundDecorationView);
    objc_msgSend(v6, "registerClass:forDecorationViewOfKind:", v7, CFSTR("section-background-element-kind"), v9, v10, v11, v12, v13);
  }

  return v6;
}

- (id)_attachmentSectionLayout
{
  void *v2;
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
  void *v20;
  void *v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 0.333333333));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalHeightDimension:](NSCollectionLayoutDimension, "fractionalHeightDimension:", 0.55));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v2, v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v4));
  objc_msgSend(v5, "setContentInsets:", 5.0, 5.0, 5.0, 5.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 275.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v8, v5, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", 2.0));
  objc_msgSend(v9, "setInterItemSpacing:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v9));
  objc_msgSend(v11, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 275.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v12, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v14, UICollectionElementKindSectionHeader, 1));
  v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v11, "setBoundarySupplementaryItems:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", CFSTR("section-background-element-kind")));
  objc_msgSend(v17, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
  v20 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v11, "setDecorationItems:", v18);

  objc_msgSend(v11, "_setPostBoundaryPadding:", 20.0);
  return v11;
}

- (id)_photoSectionLayout
{
  void *v3;
  void *v4;
  double v5;
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
  void *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 0.333333333));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
  objc_msgSend(v4, "frame");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalHeightDimension:](NSCollectionLayoutDimension, "fractionalHeightDimension:", v5 * 0.4 / 400.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v3, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v7));
  objc_msgSend(v8, "setContentInsets:", 1.0, 1.0, 1.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 275.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v11, v8, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", 1.0));
  objc_msgSend(v12, "setInterItemSpacing:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v12));
  objc_msgSend(v14, "setContentInsets:", 0.0, 35.0, 0.0, 35.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 275.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v15, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v17, UICollectionElementKindSectionHeader, 1));
  objc_msgSend(v18, "setContentInsets:", 0.0, -15.0, 0.0, -15.0);
  v24 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  objc_msgSend(v14, "setBoundarySupplementaryItems:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", CFSTR("section-background-element-kind")));
  objc_msgSend(v20, "setContentInsets:", 0.0, 20.0, -10.0, 20.0);
  v23 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  objc_msgSend(v14, "setDecorationItems:", v21);

  objc_msgSend(v14, "_setPostBoundaryPadding:", 20.0);
  return v14;
}

- (id)_linkSectionLayout
{
  void *v3;
  void *v4;
  double v5;
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
  void *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 0.5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
  objc_msgSend(v4, "frame");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalHeightDimension:](NSCollectionLayoutDimension, "fractionalHeightDimension:", v5 * 0.5 / 400.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v3, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v7));
  objc_msgSend(v8, "setContentInsets:", 1.0, 1.0, 1.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 275.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v11, v8, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", 5.0));
  objc_msgSend(v12, "setInterItemSpacing:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v12));
  objc_msgSend(v14, "setContentInsets:", 0.0, 35.0, 0.0, 35.0);
  objc_msgSend(v14, "setInterGroupSpacing:", 5.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 275.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v15, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v17, UICollectionElementKindSectionHeader, 1));
  objc_msgSend(v18, "setContentInsets:", 0.0, -15.0, 0.0, -15.0);
  v24 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  objc_msgSend(v14, "setBoundarySupplementaryItems:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:](NSCollectionLayoutDecorationItem, "backgroundDecorationItemWithElementKind:", CFSTR("section-background-element-kind")));
  objc_msgSend(v20, "setContentInsets:", 0.0, 20.0, -10.0, 20.0);
  v23 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  objc_msgSend(v14, "setDecorationItems:", v21);

  objc_msgSend(v14, "_setPostBoundaryPadding:", 20.0);
  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("Subject"));

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
    if (objc_msgSend(v9, "isEqual:", CFSTR("Documents")))
    {

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("Photos"));

      if (!v12)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController sections](self, "sections"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
        v20 = objc_msgSend(v19, "isEqual:", CFSTR("Links"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController items](self, "items"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v27, "item")));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "richLink"));

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          objc_msgSend(v14, "openURL:options:completionHandler:", v13, &__NSDictionary0__struct, 0);
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController items](self, "items"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v27, "item")));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "emailAddress"));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController delegate](self, "delegate"));
          if ((objc_opt_respondsToSelector(v14, "messageInfoViewController:didSelectAddress:forAtomType:") & 1) != 0)
            objc_msgSend(v14, "messageInfoViewController:didSelectAddress:forAtomType:", self, v13, 0);
        }
        goto LABEL_6;
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController items](self, "items"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v27, "section")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v27, "item")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attachment"));
    -[MFMessageInfoViewController _openAttachmentWithPreview:](self, "_openAttachmentWithPreview:", v16);

LABEL_6:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController collectionView](self, "collectionView"));
    objc_msgSend(v17, "deselectItemAtIndexPath:animated:", v27, 0);

  }
}

- (void)_generateQuickLookThumbnail:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator"));
  v10 = objc_alloc((Class)QLThumbnailGenerationRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v13, "scale");
  v15 = objc_msgSend(v10, "initWithFileAtURL:size:scale:representationTypes:", v12, -1, 100.0, 100.0, v14);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10017FD38;
  v18[3] = &unk_100521C28;
  v18[4] = self;
  v16 = v8;
  v19 = v16;
  v17 = v7;
  v20 = v17;
  objc_msgSend(v9, "generateBestRepresentationForRequest:completionHandler:", v15, v18);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  AttachmentPreviewItem *v5;
  void *v6;
  void *v7;
  AttachmentPreviewItem *v8;

  v5 = [AttachmentPreviewItem alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController fileURL](self, "fileURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController fileTitle](self, "fileTitle"));
  v8 = -[AttachmentPreviewItem initWithUrl:title:](v5, "initWithUrl:title:", v6, v7);

  return v8;
}

- (void)_openAttachmentWithPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_alloc_init((Class)QLPreviewController);
  objc_msgSend(v4, "setDataSource:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "url"));
  -[MFMessageInfoViewController setFileURL:](self, "setFileURL:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
  -[MFMessageInfoViewController setFileTitle:](self, "setFileTitle:", v6);

  -[MFMessageInfoViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)_openContactCard:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController _contactViewControllerForAddress:](self, "_contactViewControllerForAddress:", a3));
  if (v11)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
    objc_msgSend(v4, "frame");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController navigationController](self, "navigationController"));
    objc_msgSend(v7, "setPreferredContentSize:", 320.0, v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
    objc_msgSend(v8, "frame");
    objc_msgSend(v11, "setPreferredContentSize:", 320.0, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController navigationController](self, "navigationController"));
    objc_msgSend(v10, "pushViewController:animated:", v11, 1);

  }
}

- (id)_contactViewControllerForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController contactStore](self, "contactStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v7 = objc_claimAutoreleasedReturnValue(+[MFMessageInfoViewController log](MFMessageInfoViewController, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Load contact view controller using key descriptors: %@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v24 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v8, v9, 1));

  if (v10)
  {
    if (objc_msgSend(v10, "hasBeenPersisted")
      && +[MFContactsManager isAuthorizedToUseContacts](MFContactsManager, "isAuthorizedToUseContacts"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAddressValue"));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddresses"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1001806A8;
        v20[3] = &unk_100521C50;
        v21 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_firstObjectPassingTest:", v20));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v11, "highlightPropertyWithKey:identifier:", CNContactEmailAddressesKey, v15);

      v16 = v11;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v10));
    }
    if ((+[MFContactsManager isAuthorizedToUseContacts](MFContactsManager, "isAuthorizedToUseContacts") & 1) == 0)objc_msgSend(v16, "setActions:", (unint64_t)objc_msgSend(v16, "actions") & 0xFFFFFFFFFFFFFFDFLL);
    objc_msgSend(v16, "setContactStore:", v5);
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[MFMessageInfoViewController log](MFMessageInfoViewController, "log"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
      sub_100394514(v18, (uint64_t)v6, buf, v17);
    }

    v16 = 0;
  }

  return v16;
}

- (void)_generateRichLink:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;

  v31 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController richLinkCache](self, "richLinkCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

  if (!v9)
  {
    v10 = objc_alloc_init((Class)LPLinkMetadata);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
    objc_msgSend(v10, "setTitle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
    objc_msgSend(v10, "setURL:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphSearchDefaultLink));
    v15 = objc_msgSend(objc_alloc((Class)LPImage), "initWithPlatformImage:", v14);
    objc_msgSend(v10, "setImage:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController richLinkCache](self, "richLinkCache"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
    objc_msgSend(v16, "setObject:forKey:", v10, v17);

  }
  v18 = objc_alloc((Class)LPLinkView);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
  v20 = objc_msgSend(v18, "initWithURL:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController richLinkCache](self, "richLinkCache"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v22));
  objc_msgSend(v20, "setMetadata:", v23);

  objc_msgSend(v20, "_setApplyCornerRadius:", 1);
  objc_msgSend(v20, "_setPreferredSizeClass:", 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
  objc_msgSend(v20, "_setOverrideBackgroundColor:", v24);

  objc_msgSend(v20, "_setDisableTapGesture:", 1);
  objc_msgSend(v31, "setLinkView:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contentView"));
  objc_msgSend(v25, "addSubview:", v20);

  if (-[MFMessageInfoViewController _shouldDisplayContact](self, "_shouldDisplayContact"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "avatarView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "richLink"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController _contactToDisplayForRichLink:](self, "_contactToDisplayForRichLink:", v27));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController contactStore](self, "contactStore"));
    v30 = objc_msgSend(v26, "displayPersonForEmailAddress:brandIndicatorFuture:usingContactStore:", v28, 0, v29);

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "avatarView"));
    objc_msgSend(v26, "setHidden:", 1);
  }

  objc_msgSend(v31, "setNeedsLayout");
}

- (void)_close:(id)a3
{
  -[MFMessageInfoViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)_dataOwnerForPaste
{
  return 3;
}

- (int64_t)_dataOwnerForCopy
{
  return 3;
}

- (void)messageViewControllerDidChooseAddress:(id)a3 contactViewController:(id)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v12 = a4;
  if (v12)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController navigationController](self, "navigationController"));
    objc_msgSend(v8, "setPreferredContentSize:", 320.0, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController view](self, "view"));
    objc_msgSend(v9, "frame");
    objc_msgSend(v12, "setPreferredContentSize:", 320.0, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController navigationController](self, "navigationController"));
    objc_msgSend(v11, "pushViewController:animated:", v12, 1);

    -[MFMessageInfoViewController setContactViewController:](self, "setContactViewController:", v12);
  }

}

- (BOOL)_isConversation
{
  return -[MFMessageInfoViewController numberOfMessagesInConversation](self, "numberOfMessagesInConversation") > 1;
}

- (BOOL)_shouldDisplayContact
{
  void *v3;
  BOOL v4;

  if (!-[MFMessageInfoViewController _isConversation](self, "_isConversation"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController participants](self, "participants"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 2;

  return v4;
}

- (id)_contactToDisplayForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SYDocumentAttributes documentAttributesForFileAtURL:](SYDocumentAttributes, "documentAttributesForFileAtURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));

  return v5;
}

- (id)_contactToDisplayForRichLink:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SYDocumentAttributes documentAttributesForFileAtURL:](SYDocumentAttributes, "documentAttributesForFileAtURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));

  return v5;
}

- (id)_dateToDisplayForURL:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SYDocumentAttributes documentAttributesForFileAtURL:](SYDocumentAttributes, "documentAttributesForFileAtURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receivedDate"));

  return v4;
}

- (id)_URLForAttachmentURL:(id)a3
{
  id v3;
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v5 = (char *)objc_msgSend(v4, "rangeOfString:", CFSTR("Mail/"));
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringToIndex:", &v5[v7]));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("AttachmentData/"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14));
  v16 = objc_msgSend(objc_alloc((Class)EFSandboxedURLWrapper), "initWithFileURL:readOnly:", v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "url"));

  return v17;
}

- (id)_subjectToDisplay
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoViewController viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subjectWithoutPrefix"));

  return v4;
}

- (BOOL)canSearchForContactFromContactCardInteractions:(id)a3
{
  return 0;
}

- (MFMessageInfoViewControllerDelegate)delegate
{
  return (MFMessageInfoViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MessageHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UICollectionViewSupplementaryRegistration)supplementaryRegistration
{
  return self->_supplementaryRegistration;
}

- (void)setSupplementaryRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryRegistration, a3);
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewController, a3);
}

- (int64_t)numberOfMessagesInConversation
{
  return self->_numberOfMessagesInConversation;
}

- (void)setNumberOfMessagesInConversation:(int64_t)a3
{
  self->_numberOfMessagesInConversation = a3;
}

- (NSArray)conversationAttachmentURLs
{
  return self->_conversationAttachmentURLs;
}

- (void)setConversationAttachmentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_conversationAttachmentURLs, a3);
}

- (NSArray)richLinkURLs
{
  return self->_richLinkURLs;
}

- (void)setRichLinkURLs:(id)a3
{
  objc_storeStrong((id *)&self->_richLinkURLs, a3);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSString)fileTitle
{
  return self->_fileTitle;
}

- (void)setFileTitle:(id)a3
{
  objc_storeStrong((id *)&self->_fileTitle, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (NSCache)richLinkCache
{
  return self->_richLinkCache;
}

- (void)setRichLinkCache:(id)a3
{
  objc_storeStrong((id *)&self->_richLinkCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_fileTitle, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_richLinkURLs, 0);
  objc_storeStrong((id *)&self->_conversationAttachmentURLs, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_supplementaryRegistration, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
