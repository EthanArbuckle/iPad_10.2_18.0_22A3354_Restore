@implementation ICBrowseAttachmentsCollectionController

- (BOOL)accessibilityPerformEscape
{
  -[ICBrowseAttachmentsCollectionController icaxDismissAttachmentBrowser](self, "icaxDismissAttachmentBrowser");
  return 1;
}

- (ICBrowseAttachmentsCollectionController)initWithAttachmentSection:(signed __int16)a3
{
  ICBrowseAttachmentsCollectionViewLayout *v5;
  ICBrowseAttachmentsCollectionController *v6;
  objc_super v8;

  v5 = objc_alloc_init(ICBrowseAttachmentsCollectionViewLayout);
  v8.receiver = self;
  v8.super_class = (Class)ICBrowseAttachmentsCollectionController;
  v6 = -[ICBrowseAttachmentsCollectionController initWithCollectionViewLayout:](&v8, "initWithCollectionViewLayout:", v5);

  if (v6)
    v6->_attachmentSection = a3;
  return v6;
}

- (ICBrowseAttachmentsCollectionController)init
{
  return -[ICBrowseAttachmentsCollectionController initWithAttachmentSection:](self, "initWithAttachmentSection:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  ICBrowseAttachmentsBrickCell *v18;
  ICBrowseAttachmentsBrickCell *defaultSizingBrickCell;
  objc_class *v20;
  NSString *v21;
  void *v22;
  NSBundle *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  objc_super v37;
  id v38;

  v37.receiver = self;
  v37.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewDidLoad](&v37, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));
  objc_msgSend(v4, "setPrefersLargeTitles:", 1);

  if (-[ICBrowseAttachmentsCollectionController displayAllSections](self, "displayAllSections"))
    v5 = 1;
  else
    v5 = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setLargeTitleDisplayMode:", v5);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setStyle:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController segmentedControl](self, "segmentedControl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setTitleView:", v8);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICBackgroundColor](UIColor, "ICBackgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(UICollectionViewCell), CFSTR("ICBrowseAttachmentsImagesAndMoviesCell"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v13, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(UICollectionViewCell), CFSTR("ICBrowseAttachmentsScannedPagesCell"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICBrowseAttachmentsBrickCell), CFSTR("ICBrowseAttachmentsBrickCell"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICImageCollectionViewCell), CFSTR("kICBrowseAttachmentsImageCell"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICMovieCollectionViewCell), CFSTR("kICBrowseAttachmentsMovieCell"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v17, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ICDrawingCollectionViewCell), CFSTR("kICBrowseAttachmentsDrawingCell"));

  v18 = -[ICBrowseAttachmentsBrickCell initWithFrame:]([ICBrowseAttachmentsBrickCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  defaultSizingBrickCell = self->_defaultSizingBrickCell;
  self->_defaultSizingBrickCell = v18;

  v20 = (objc_class *)objc_opt_class(ICBrowseAttachmentsHeaderView);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v22, v24));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v26, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v25, UICollectionElementKindSectionHeader, CFSTR("ICBrowseAttachmentsHeaderView"));

  v27 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneAction:");
  v38 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
  objc_msgSend(v29, "setRightBarButtonItems:", v28);

  v30 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "respondToTapGesture:");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v31, "addGestureRecognizer:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICBrowseAttachmentsDragAndDropDelegate sharedInstance](ICBrowseAttachmentsDragAndDropDelegate, "sharedInstance"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v33, "setDragDelegate:", v32);

  v34 = objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
  -[ICBrowseAttachmentsCollectionController setContextInteraction:](self, "setContextInteraction:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController contextInteraction](self, "contextInteraction"));
  objc_msgSend(v35, "addInteraction:", v36);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewWillLayoutSubviews](&v16, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
  {
    v8 = 32.0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v11 = objc_msgSend(v10, "horizontalSizeClass");

    if (v11 == (id)2)
      v8 = 28.0;
    else
      v8 = 16.0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v12, "setDirectionalLayoutMargins:", v5, v8, v7, v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLargeTitleInsets:", 0.0, v8, 0.0, v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationController](self, "navigationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationBar"));
  objc_msgSend(v15, "layoutSubviews");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewWillAppear:](&v8, "viewWillAppear:", a3);
  -[ICBrowseAttachmentsCollectionController reload](self, "reload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "notesContextRefreshNotification:", ICNotesContextRefreshNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "accountsWillChange", ICAccountsWillChangeNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "accountsDidChange", ICAccountsDidChangeNotification, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewDidAppear:](&v3, "viewDidAppear:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, ICNotesContextRefreshNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, ICAccountsWillChangeNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, ICAccountsDidChangeNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  objc_msgSend(v4, "setDelegate:", 0);

  -[ICBrowseAttachmentsCollectionController setFetchedResultsController:](self, "setFetchedResultsController:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController browserDidCloseHandler](self, "browserDidCloseHandler"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController browserDidCloseHandler](self, "browserDidCloseHandler"));
    v6[2](v6, 0);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v8, "invalidateLayout");

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FC278;
  v10[3] = &unk_1005500E8;
  v10[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);
  v9.receiver = self;
  v9.super_class = (Class)ICBrowseAttachmentsCollectionController;
  -[ICBrowseAttachmentsCollectionController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  self->_attachmentSection = a3;
  -[ICBrowseAttachmentsCollectionController reload](self, "reload");
}

- (void)reload
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];

  v3 = +[ICAttachment newFetchRequestForAttachments](ICAttachment, "newFetchRequestForAttachments");
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("section"), 1);
  v35[0] = v4;
  v5 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v35[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  objc_msgSend(v3, "setSortDescriptors:", v6);

  if (-[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("section == %d"), -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection")));
    if (-[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection") == 6)
    {
      v34[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("typeUTI == %@"), ICAttachmentUTTypePaperDocumentScan));
      v34[1] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
      v10 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v9));

      v7 = (void *)v10;
    }
    v33[0] = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachment predicateForAttachmentBrowserWithContext:](ICAttachment, "predicateForAttachmentBrowserWithContext:", v12));
    v33[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));

    v15 = objc_msgSend(objc_alloc((Class)NSCompoundPredicate), "initWithType:subpredicates:", 1, v14);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("section != %d"), 0));
    v32[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "managedObjectContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachment predicateForAttachmentBrowserWithContext:](ICAttachment, "predicateForAttachmentBrowserWithContext:", v18));
    v32[1] = v19;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));

    v15 = objc_msgSend(objc_alloc((Class)NSCompoundPredicate), "initWithType:subpredicates:", 1, v7);
  }

  objc_msgSend(v3, "setPredicate:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fetchedResultsControllerForFetchRequest:sectionNameKeyPath:", v3, CFSTR("section")));
  -[ICBrowseAttachmentsCollectionController setFetchedResultsController:](self, "setFetchedResultsController:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[ICBrowseAttachmentsCollectionController setSortedSections:](self, "setSortedSections:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  objc_msgSend(v23, "setDelegate:", self);

  -[ICBrowseAttachmentsCollectionController sortFetchedResultsSections](self, "sortFetchedResultsSections");
  if (-[ICBrowseAttachmentsCollectionController displayAllSections](self, "displayAllSections"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1005704B8, 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
    objc_msgSend(v26, "setTitle:", v25);

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController titleForAttachmentSection:](self, "titleForAttachmentSection:", -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationItem](self, "navigationItem"));
    objc_msgSend(v25, "setTitle:", v24);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachment attachmentSectionSortOrder](ICAttachment, "attachmentSectionSortOrder"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection")));
  v29 = objc_msgSend(v27, "indexOfObject:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController segmentedControl](self, "segmentedControl"));
  objc_msgSend(v30, "setSelectedSegmentIndex:", v29);

  -[ICBrowseAttachmentsCollectionController updateEmptyView](self, "updateEmptyView");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  -[ICBrowseAttachmentsCollectionController controllerDidChangeContent:](self, "controllerDidChangeContent:", v31);

  -[ICBrowseAttachmentsCollectionController applyAccessibilityInfo](self, "applyAccessibilityInfo");
}

- (BOOL)displayAllSections
{
  return -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection") == 0;
}

- (id)attachmentAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));

  if (v5)
  {
    v6 = objc_msgSend(v4, "section");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
    v8 = objc_msgSend(v7, "count");

    if (v6 >= v8)
    {
      v10 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10040BBA8((uint64_t)v4, self);

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

      v11 = objc_msgSend(v4, "row");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objects](v10, "objects"));
      v13 = objc_msgSend(v12, "count");

      if (v11 < v13)
      {
        v14 = objc_opt_class(ICAttachment);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objects](v10, "objects"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
        v17 = ICCheckedDynamicCast(v14, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

LABEL_13:
        goto LABEL_14;
      }
      v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10040BBA8((uint64_t)v4, self);

    }
    v18 = 0;
    goto LABEL_13;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)useImagesAndMoviesScrollViewForSection:(signed __int16)a3
{
  int v3;
  unsigned __int8 v4;
  BOOL v6;

  v3 = a3;
  v4 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v6 = v3 == 1 || v3 == 7;
  return (v4 & 1) == 0 && v6;
}

- (BOOL)useImagesAndMoviesScrollViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v6 = objc_msgSend(v4, "section");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  LOWORD(v6) = (unsigned __int16)objc_msgSend(v8, "intValue");

  LOBYTE(self) = -[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewForSection:](self, "useImagesAndMoviesScrollViewForSection:", (__int16)v6);
  return (char)self;
}

- (UISegmentedControl)segmentedControl
{
  UISegmentedControl *segmentedControl;
  void *v4;
  void *v5;
  void *v6;
  UISegmentedControl *v7;
  UISegmentedControl *v8;
  _QWORD v10[5];

  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachment attachmentSectionSortOrder](ICAttachment, "attachmentSectionSortOrder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000FCB28;
    v10[3] = &unk_100554E08;
    v10[4] = self;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_compactMap:", v10));

    v7 = (UISegmentedControl *)objc_msgSend(objc_alloc((Class)UISegmentedControl), "initWithItems:", v6);
    v8 = self->_segmentedControl;
    self->_segmentedControl = v7;

    -[UISegmentedControl setApportionsSegmentWidthsByContent:](self->_segmentedControl, "setApportionsSegmentWidthsByContent:", 1);
    -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, "segmentedControlValueDidChange:", 4096);

    segmentedControl = self->_segmentedControl;
  }
  return segmentedControl;
}

- (void)segmentedControlValueDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[ICAttachment attachmentSectionSortOrder](ICAttachment, "attachmentSectionSortOrder"));
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v5));
  -[ICBrowseAttachmentsCollectionController setAttachmentSection:](self, "setAttachmentSection:", (__int16)objc_msgSend(v6, "integerValue"));

}

- (void)doneAction:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController browserDidCloseHandler](self, "browserDidCloseHandler", a3));
  v5 = objc_msgSend(v4, "copy");

  -[ICBrowseAttachmentsCollectionController setBrowserDidCloseHandler:](self, "setBrowserDidCloseHandler:", 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FCC9C;
  v8[3] = &unk_10054FFA8;
  v9 = v5;
  v6 = v5;
  -[ICBrowseAttachmentsCollectionController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController eventReporter](self, "eventReporter"));
  objc_msgSend(v7, "submitAttachmentBrowserActionEventForType:", 1);

}

- (void)respondToTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9));

  if (v13)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController attachmentAtIndexPath:](self, "attachmentAtIndexPath:", v13));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
    -[ICBrowseAttachmentsCollectionController browseAttachmentsCollectionView:didSelectAttachment:indexPath:](self, "browseAttachmentsCollectionView:didSelectAttachment:indexPath:", v12, v11, v13);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v5;
  id v6;

  if (-[ICBrowseAttachmentsCollectionController updatingAccounts](self, "updatingAccounts", a3))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
  v8 = -[ICBrowseAttachmentsCollectionController numberOfItemsToDisplayInSection:withTraitCollection:](self, "numberOfItemsToDisplayInSection:withTraitCollection:", a4, v7);

  return v8;
}

- (id)nonScrollingCellIdentifierForAttachmentType:(signed __int16)a3
{
  __CFString *v3;
  __CFString *v5;

  v3 = CFSTR("kICBrowseAttachmentsImageCell");
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 6:
    case 7:
    case 8:
    case 11:
    case 12:
    case 14:
      v3 = CFSTR("ICBrowseAttachmentsBrickCell");
      break;
    case 5:
      v3 = CFSTR("kICBrowseAttachmentsMovieCell");
      break;
    case 9:
    case 10:
    case 13:
      v3 = CFSTR("kICBrowseAttachmentsDrawingCell");
      break;
    case 15:
      v3 = CFSTR("ICBrowseAttachmentsBrickCell");
      if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
      {
        if (-[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection") == 7)
          v5 = CFSTR("kICBrowseAttachmentsImageCell");
        else
          v5 = CFSTR("ICBrowseAttachmentsBrickCell");
        v3 = v5;
      }
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  signed __int16 v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  ICImagesAndMoviesScrollView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  ICImagesAndMoviesScrollView *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v11 = (unsigned __int16)objc_msgSend(v10, "intValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController attachmentAtIndexPath:](self, "attachmentAtIndexPath:", v7));
  if (-[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewAtIndexPath:](self, "useImagesAndMoviesScrollViewAtIndexPath:", v7))
  {
    v37 = v6;
    v13 = v11;
    if (v11 == 1)
    {
      v14 = CFSTR("ICBrowseAttachmentsImagesAndMoviesCell");
    }
    else if ((_DWORD)v13 == 7)
    {
      v14 = CFSTR("ICBrowseAttachmentsScannedPagesCell");
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICBrowseAttachmentsCollectionController collectionView:cellForItemAtIndexPath:]", 1, 0, CFSTR("Unhandled cell key case"));
      v14 = &stru_1005704B8;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v7));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subviews"));
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      v21 = objc_opt_class(ICImagesAndMoviesScrollView);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subviews"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
      v25 = ICCheckedDynamicCast(v21, v24);
      v15 = (ICImagesAndMoviesScrollView *)objc_claimAutoreleasedReturnValue(v25);

      -[ICImagesAndMoviesScrollView setAttachmentSection:](v15, "setAttachmentSection:", v13);
    }
    else
    {
      v26 = [ICImagesAndMoviesScrollView alloc];
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
      objc_msgSend(v27, "bounds");
      v15 = -[ICImagesAndMoviesScrollView initWithFrame:forAttachmentSection:](v26, "initWithFrame:forAttachmentSection:", v13);

      -[ICImagesAndMoviesScrollView setViewController:](v15, "setViewController:", self);
      -[ICImagesAndMoviesScrollView setDelegate:](v15, "setDelegate:", self);
      -[ICImagesAndMoviesScrollView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesScrollView collectionView](v15, "collectionView"));
      objc_msgSend(v28, "setContentInsetAdjustmentBehavior:", 2);

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
      objc_msgSend(v29, "addSubview:", v15);

    }
    -[ICBrowseAttachmentsCollectionController adjustContentInsetOfImageScroller:](self, "adjustContentInsetOfImageScroller:", v15);
    v6 = v37;
  }
  else
  {
    v15 = (ICImagesAndMoviesScrollView *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController nonScrollingCellIdentifierForAttachmentType:](self, "nonScrollingCellIdentifierForAttachmentType:", objc_msgSend(v12, "attachmentType")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7));
  }

  v30 = objc_opt_class(ICBrowseAttachmentsBaseCell);
  v31 = ICDynamicCast(v30, v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v32, "setAttachment:", v12);
  objc_msgSend(v32, "setDelegate:", self);
  objc_msgSend(v32, "setCollectionController:", self);
  v33 = objc_opt_class(ICImagesAndMoviesBaseCell);
  v34 = ICDynamicCast(v33, v16);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  objc_msgSend(v35, "setThumbnailLayout:", 2);

  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  signed __int16 v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
  v14 = (unsigned __int16)objc_msgSend(v13, "intValue");

  v15 = objc_msgSend(v10, "isEqualToString:", UICollectionElementKindSectionHeader);
  if (v15)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, CFSTR("ICBrowseAttachmentsHeaderView"), v9));
    v17 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController titleForAttachmentSection:](self, "titleForAttachmentSection:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sectionLabel"));
    objc_msgSend(v19, "setText:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
    objc_msgSend(v20, "directionalLayoutMargins");
    objc_msgSend(v16, "setLeadingMargin:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
    objc_msgSend(v22, "directionalLayoutMargins");
    objc_msgSend(v16, "setTrailingMargin:", v23);

    objc_msgSend(v16, "setAttachmentSection:", v17);
    objc_msgSend(v16, "setDelegate:", self);
    objc_msgSend(v16, "contentSizeCategoryDidChange");
  }
  else
  {
    v16 = objc_alloc_init((Class)UICollectionReusableView);
  }

  return v16;
}

- (unint64_t)cellsPerRow
{
  unsigned int v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v3 = -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection");
    if (v3 < 8)
      return qword_100451B60[v3];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_msgSend(v6, "verticalSizeClass");

  if (v7 == (id)1)
    return 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  -[ICBrowseAttachmentsCollectionController leadingMargin](self, "leadingMargin");
  v12 = v10 - v11;
  -[ICBrowseAttachmentsCollectionController trailingMargin](self, "trailingMargin");
  v4 = vcvtmd_u64_f64((v12 - v13) / 310.0);

  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  CGSize result;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "frame");
  v10 = v9;
  if (-[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewAtIndexPath:](self, "useImagesAndMoviesScrollViewAtIndexPath:", v8))
  {
    *(double *)&v11 = 128.0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController attachmentAtIndexPath:](self, "attachmentAtIndexPath:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
    v14 = objc_msgSend(v13, "horizontalSizeClass");

    if (v14 == (id)1
      && (+[ICDeviceSupport isLargerCompactHorizontalWidthDevice](ICDeviceSupport, "isLargerCompactHorizontalWidthDevice") & 1) == 0)
    {
      -[ICBrowseAttachmentsCollectionController leadingMargin](self, "leadingMargin");
      v23 = v10 - v22;
      -[ICBrowseAttachmentsCollectionController trailingMargin](self, "trailingMargin");
      v10 = v23 - v24;
    }
    else
    {
      v15 = (double)-[ICBrowseAttachmentsCollectionController cellsPerRow](self, "cellsPerRow");
      v16 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
      v17 = 28.0;
      if (v16)
        v17 = 20.0;
      v18 = v10 - v17 * (v15 + -1.0);
      -[ICBrowseAttachmentsCollectionController leadingMargin](self, "leadingMargin");
      v20 = v18 - v19;
      -[ICBrowseAttachmentsCollectionController trailingMargin](self, "trailingMargin");
      v10 = floor((v20 - v21) / v15);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController nonScrollingCellIdentifierForAttachmentType:](self, "nonScrollingCellIdentifierForAttachmentType:", objc_msgSend(v12, "attachmentType")));
    *(double *)&v11 = v10;
    if (objc_msgSend(v25, "isEqual:", CFSTR("ICBrowseAttachmentsBrickCell")))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController attachmentAtIndexPath:](self, "attachmentAtIndexPath:", v8));
      -[ICBrowseAttachmentsBrickCell setAttachment:](self->_defaultSizingBrickCell, "setAttachment:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell attachmentBrickView](self->_defaultSizingBrickCell, "attachmentBrickView"));
      objc_msgSend(v27, "computedSize");
      v11 = v28;

    }
  }

  v29 = v10;
  v30 = *(double *)&v11;
  result.height = v30;
  result.width = v29;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  signed __int16 v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a5));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v11 = (unsigned __int16)objc_msgSend(v10, "intValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  v13 = objc_msgSend(v12, "horizontalSizeClass");

  if (-[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewForSection:](self, "useImagesAndMoviesScrollViewForSection:", v11))
  {
    if (v13 == (id)1)
      v14 = 16.0;
    else
      v14 = 19.0;
    v15 = 0.0;
    v16 = 0.0;
  }
  else
  {
    -[ICBrowseAttachmentsCollectionController leadingMargin](self, "leadingMargin");
    v15 = v17;
    if (v13 == (id)1)
      v14 = 16.0;
    else
      v14 = 19.0;
    -[ICBrowseAttachmentsCollectionController trailingMargin](self, "trailingMargin");
    v16 = v18;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  v20 = objc_msgSend(v19, "effectiveUserInterfaceLayoutDirection");

  if (v20 == (id)1)
    v21 = v15;
  else
    v21 = v16;
  if (v20 == (id)1)
    v15 = v16;

  v22 = 15.0;
  v23 = v15;
  v24 = v14;
  v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  unsigned int v5;
  double result;

  v5 = +[UIDevice ic_isVision](UIDevice, "ic_isVision", a3, a4, a5);
  result = 16.0;
  if (v5)
    return 20.0;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  double height;
  CGFloat width;
  double v21;
  double v22;
  CGSize result;

  v7 = a3;
  if (-[ICBrowseAttachmentsCollectionController displayAllSections](self, "displayAllSections"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_attachmentBrowserTitleFont](UIFont, "ic_attachmentBrowserTitleFont"));
    objc_msgSend(v8, "lineHeight");
    v10 = round(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
    v13 = (char *)objc_msgSend(v12, "interfaceOrientation");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
    v15 = objc_msgSend(v14, "horizontalSizeClass");

    if (ICAccessibilityAccessibilityLargerTextSizesEnabled(v16)
      && (unint64_t)(v13 - 3) >= 0xFFFFFFFFFFFFFFFELL
      && v15 == (id)1)
    {
      -[ICBrowseAttachmentsCollectionController estimatedHeightForAXLargerTextSizesForSection:](self, "estimatedHeightForAXLargerTextSizesForSection:", a5);
      v10 = v10 + v17;
    }
    v18 = 15.0;
    if (a5 > 0)
      v18 = 14.0;
    height = v18 + v10;
    width = 0.0;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v21 = width;
  v22 = height;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)sortFetchedResultsSections
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  ICBrowseAttachmentsSectionInfo *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  ICBrowseAttachmentsSectionInfo *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sections"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FDBFC;
  v16[3] = &unk_100554E30;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v17 = v6;
  v18 = &v20;
  v19 = &v24;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  if (!objc_msgSend(v6, "count")
    || -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection") == 7)
  {
    goto LABEL_16;
  }
  v7 = [ICBrowseAttachmentsSectionInfo alloc];
  v8 = v25[3];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v25[3]));
    if (v25[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
      v10 = 0;
      goto LABEL_8;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10057C538, "stringValue"));
  v11 = 1;
LABEL_8:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0));
  v28 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v14 = -[ICBrowseAttachmentsSectionInfo initWithSectionInfo:name:additionalObjects:sortDescriptors:](v7, "initWithSectionInfo:name:additionalObjects:sortDescriptors:", v9, v10, v6, v13);

  if (v11)
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)

  if (v25[3] == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "addObject:", v14);
  else
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v14);

LABEL_16:
  if (-[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection") == 6
    && v21[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "removeObjectAtIndex:");
  }
  objc_msgSend(v5, "sortUsingComparator:", &stru_100554E70);
  v15 = objc_msgSend(v5, "copy");
  -[ICBrowseAttachmentsCollectionController setSortedSections:](self, "setSortedSections:", v15);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)controllerDidChangeContent:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FDF84;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notesContextRefreshNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController", a3));
  objc_msgSend(v3, "performFetch:", 0);

}

- (void)accountsWillChange
{
  void *v3;
  void *v4;
  void *v5;

  -[ICBrowseAttachmentsCollectionController setUpdatingAccounts:](self, "setUpdatingAccounts:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v4, "reloadData");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v5, "invalidateLayout");

  -[ICBrowseAttachmentsCollectionController updateEmptyView](self, "updateEmptyView");
}

- (void)accountsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICBrowseAttachmentsCollectionController setUpdatingAccounts:](self, "setUpdatingAccounts:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  objc_msgSend(v4, "performFetch:", 0);

  -[ICBrowseAttachmentsCollectionController sortFetchedResultsSections](self, "sortFetchedResultsSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v5, "reloadData");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v6, "invalidateLayout");

  -[ICBrowseAttachmentsCollectionController updateEmptyView](self, "updateEmptyView");
}

- (id)viewControllerForAttachmentSection:(signed __int16)a3
{
  uint64_t v3;
  unsigned int v4;
  __objc2_class **v5;

  v3 = a3;
  v4 = -[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewForSection:](self, "useImagesAndMoviesScrollViewForSection:");
  v5 = &off_10054DE28;
  if (!v4)
    v5 = &off_10054DC60;
  return objc_msgSend(objc_alloc(*v5), "initWithAttachmentSection:", v3);
}

- (void)showAllForAttachmentSection:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController viewControllerForAttachmentSection:](self, "viewControllerForAttachmentSection:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController titleForAttachmentSection:](self, "titleForAttachmentSection:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController navigationController](self, "navigationController"));
  objc_msgSend(v7, "showViewController:sender:", v9, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController eventReporter](self, "eventReporter"));
  objc_msgSend(v8, "submitAttachmentBrowserActionEventForType:", 2);

}

- (BOOL)browseAttachmentsCell:(id)a3 didSelectAttachment:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  -[ICBrowseAttachmentsCollectionController browseAttachmentsCollectionView:didSelectAttachment:indexPath:](self, "browseAttachmentsCollectionView:didSelectAttachment:indexPath:", v6, v5, 0);

  return 1;
}

- (void)browseAttachmentsCell:(id)a3 shouldShareAttachment:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  -[ICBrowseAttachmentsCollectionController browseAttachmentsCollectionView:cell:shouldShareAttachment:](self, "browseAttachmentsCollectionView:cell:shouldShareAttachment:", v8, v7, v6);

}

- (void)browseAttachmentsCell:(id)a3 shouldInspectAttachment:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  -[ICBrowseAttachmentsCollectionController browseAttachmentsCollectionView:shouldInspectAttachment:](self, "browseAttachmentsCollectionView:shouldInspectAttachment:", v6, v5);

}

- (void)browseAttachmentsCollectionView:(id)a3 didSelectAttachment:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v7 = a4;
  -[ICBrowseAttachmentsCollectionController setSelectedIndexPath:](self, "setSelectedIndexPath:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController attachmentsToPreviewWhenSelectingAttachment:](self, "attachmentsToPreviewWhenSelectingAttachment:", v7));
  v9 = objc_msgSend(v8, "indexOfObject:", v7);
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortLoggingDescription"));
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Could not find attachment %@ in list of attachments in attachment browser. Falling back to single attachment", buf, 0xCu);

    }
    v16 = v7;
    v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

    v13 = 0;
    v8 = (void *)v12;
  }
  else
  {
    v13 = v9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController eventReporter](self, "eventReporter"));
  objc_msgSend(v14, "submitAttachmentBrowserActionEventForType:", 4);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController ic_viewControllerManager](self, "ic_viewControllerManager"));
  objc_msgSend(v15, "presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v8, v13, self, 1, 0, 0, self);

}

- (void)browseAttachmentsCollectionView:(id)a3 cell:(id)a4 shouldShareAttachment:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[ICAttachmentActivityViewController makeWithAttachment:quickLookItemDelegate:completion:](ICAttachmentActivityViewController, "makeWithAttachment:quickLookItemDelegate:completion:", a5, 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
  objc_msgSend(v8, "setSourceView:", v7);

  -[ICBrowseAttachmentsCollectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)browseAttachmentsCollectionView:(id)a3 shouldInspectAttachment:(id)a4
{
  id v5;
  void *v6;
  ICAttachmentInspectorViewController *v7;

  v5 = a4;
  v7 = -[ICAttachmentInspectorViewController initWithAttachment:]([ICAttachmentInspectorViewController alloc], "initWithAttachment:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController ic_embedInNavigationControllerForModalPresentation](v7, "ic_embedInNavigationControllerForModalPresentation"));
  -[ICBrowseAttachmentsCollectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController selectedIndexPath](self, "selectedIndexPath"));

  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController selectedIndexPath](self, "selectedIndexPath"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForObject:", v7));

    v9 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionViewIndexPathFromFetchedResultsControllerIndexPath:](self, "collectionViewIndexPathFromFetchedResultsControllerIndexPath:", v11));
    if (!v9)
      v9 = v11;

  }
  if ((uint64_t)objc_msgSend(v9, "item") >= 1
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView")),
        v13 = objc_msgSend(v12, "numberOfItemsInSection:", objc_msgSend(v9, "section")),
        v12,
        v13 == (id)1))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, objc_msgSend(v9, "section")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForItemAtIndexPath:", v14));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v9));
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subviews"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  v20 = objc_opt_class(ICImagesAndMoviesScrollView);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "attachmentPresenter:transitionViewForAttachment:", v6, v7));
LABEL_15:
    v27 = (void *)v21;
    goto LABEL_16;
  }
  v22 = objc_opt_class(ICBrowseAttachmentsBrickCell);
  if ((objc_opt_isKindOfClass(v16, v22) & 1) == 0)
  {
    v21 = objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
    goto LABEL_15;
  }
  v23 = objc_opt_class(ICBrowseAttachmentsBrickCell);
  v24 = ICDynamicCast(v23, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "attachmentBrickView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "quickLookTransitionView"));

LABEL_16:
  return v27;
}

- (BOOL)isAttachmentBrowser
{
  return 1;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  ICBrowseAttachmentsCollectionController *v32;
  _QWORD v33[4];
  id v34;
  void *v35;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_cellAtLocation:", v9, v11));
  if (v12 && objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___ICNotePreviewingActions))
  {
    v13 = v12;
    v14 = objc_opt_class(ICBrowseAttachmentsBaseCell);
    v15 = ICDynamicCast(v14, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attachment"));
    if (objc_msgSend(v17, "attachmentType") == 11)
    {
      v18 = objc_opt_class(ICAttachmentGalleryModel);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attachmentModel"));
      v20 = ICDynamicCast(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      if (v21)
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstSubAttachment"));

        v17 = (void *)v22;
      }

    }
    if (v17)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController ic_viewControllerManager](self, "ic_viewControllerManager"));
      v35 = v17;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPresenter previewViewControllerWithViewControllerManager:attachments:startingAtIndex:delegate:editable:isFromAttachmentBrowser:](ICAttachmentPresenter, "previewViewControllerWithViewControllerManager:attachments:startingAtIndex:delegate:editable:isFromAttachmentBrowser:", v23, v24, 0, 0, 0, 1));

    }
    else
    {
      v25 = 0;
    }
    v32 = self;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000FEAE4;
    v33[3] = &unk_100553DF0;
    v34 = v25;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000FEAEC;
    v30[3] = &unk_100554E98;
    v31 = v13;
    v27 = v13;
    v28 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v33, v30));

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_cellAtLocation:", v10, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentView"));
  v15 = objc_opt_class(ICBrowseAttachmentsBrickCell);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    v16 = objc_opt_class(ICBrowseAttachmentsBrickCell);
    v17 = ICDynamicCast(v16, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attachmentBrickView"));

    v14 = (void *)v19;
  }
  if (v14)
    v20 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v14);
  else
    v20 = 0;

  return v20;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  objc_msgSend(v8, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForItemAtPoint:", v12, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController attachmentAtIndexPath:](self, "attachmentAtIndexPath:", v15));
  objc_msgSend(v7, "setPreferredCommitStyle:", 1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000FEDD0;
  v19[3] = &unk_100550020;
  v19[4] = self;
  v20 = v16;
  v21 = v15;
  v17 = v15;
  v18 = v16;
  objc_msgSend(v7, "addCompletion:", v19);

}

- (void)performCmd3:(id)a3
{
  -[ICBrowseAttachmentsCollectionController doneAction:](self, "doneAction:", a3);
}

- (id)collectionViewIndexPathFromFetchedResultsControllerIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v10));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
        break;

      ++v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
      v17 = objc_msgSend(v16, "count");

      if (v10 >= (unint64_t)v17)
        goto LABEL_5;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", objc_msgSend(v4, "item"), v10));

  }
  else
  {
LABEL_5:
    v18 = 0;
  }

  return v18;
}

- (int64_t)numberOfItemsToDisplayInSection:(int64_t)a3 withTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  signed __int16 v10;
  int64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v10 = (unsigned __int16)objc_msgSend(v9, "intValue");

  if (-[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewForSection:](self, "useImagesAndMoviesScrollViewForSection:", v10))
  {
    v11 = 1;
  }
  else
  {
    v11 = (int64_t)objc_msgSend(v8, "numberOfObjects");
    if (-[ICBrowseAttachmentsCollectionController displayAllSections](self, "displayAllSections"))
    {
      v12 = objc_msgSend(v6, "horizontalSizeClass");
      v13 = objc_msgSend(v6, "verticalSizeClass");
      v14 = 6;
      if (v11 < 6)
        v14 = v11;
      v15 = 4;
      if (v11 < 4)
        v15 = v11;
      if (v13 == (id)1)
        v14 = v15;
      v16 = 3;
      if (v11 == 4)
        v16 = 4;
      if (v11 < 4)
        v16 = v11;
      if (v12 == (id)1)
        v11 = v16;
      else
        v11 = v14;
    }
  }

  return v11;
}

- (id)titleForAttachmentSection:(signed __int16)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Photos and Videos");
      goto LABEL_8;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Maps");
      goto LABEL_8;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Websites");
      goto LABEL_8;
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Audio");
      goto LABEL_8;
    case 6:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Documents");
      goto LABEL_8;
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Scans");
LABEL_8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  self->_brickCellSize = CGSizeZero;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_visibleSupplementaryViewsOfKind:", UICollectionElementKindSectionHeader));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(ICBrowseAttachmentsHeaderView);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          objc_msgSend(v9, "contentSizeCategoryDidChange");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v11, "invalidateLayout");

  -[ICBrowseAttachmentsCollectionController updateEmptyViewFonts](self, "updateEmptyViewFonts");
}

- (void)updateHeaderViewMargins
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_visibleSupplementaryViewsOfKind:", UICollectionElementKindSectionHeader));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(ICBrowseAttachmentsHeaderView);
        v11 = ICDynamicCast(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
          objc_msgSend(v13, "directionalLayoutMargins");
          objc_msgSend(v12, "setLeadingMargin:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
          objc_msgSend(v15, "directionalLayoutMargins");
          objc_msgSend(v12, "setTrailingMargin:", v16);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)updateImagesAndMoviesScrollViewContentInset
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleItems"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (-[ICBrowseAttachmentsCollectionController useImagesAndMoviesScrollViewAtIndexPath:](self, "useImagesAndMoviesScrollViewAtIndexPath:", v9))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v9));

          v12 = objc_opt_class(ICImagesAndMoviesScrollView);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subviews"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
          v16 = ICCheckedDynamicCast(v12, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

          -[ICBrowseAttachmentsCollectionController adjustContentInsetOfImageScroller:](self, "adjustContentInsetOfImageScroller:", v17);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (id)emptyTextForAttachmentSection:(signed __int16)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Photos, maps, and other items added to your notes appear here.");
      goto LABEL_10;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Photos and videos added to your notes appear here.");
      goto LABEL_10;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Drawings added to your notes appear here.");
      goto LABEL_10;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Map attachments added to your notes appear here.");
      goto LABEL_10;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Websites added to your notes appear here.");
      goto LABEL_10;
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Audio files added to your notes appear here.");
      goto LABEL_10;
    case 6:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Documents added to your notes appear here.");
      goto LABEL_10;
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Scans added to your notes appear here.");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)updateEmptyView
{
  void *v3;
  int64_t v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
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
  id v27;
  const __CFString *v28;
  void *v29;
  NSAttributedStringKey v30;
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v4 = -[ICBrowseAttachmentsCollectionController numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyView](self, "emptyView"));
  v27 = v5;
  if (v4)
  {
    objc_msgSend(v5, "removeFromSuperview");

  }
  else
  {

    if (!v27)
    {
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("ICBrowseAttachmentsEmpty"), v7));

      v9 = objc_msgSend(v8, "instantiateWithOwner:options:", self, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyView](self, "emptyView"));
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    }
    v11 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v11, "setLineSpacing:", 2.0);
    objc_msgSend(v11, "setParagraphSpacing:", 2.0);
    objc_msgSend(v11, "setAlignment:", 1);
    v30 = NSParagraphStyleAttributeName;
    v31 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v13 = objc_alloc((Class)NSAttributedString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyTextForAttachmentSection:](self, "emptyTextForAttachmentSection:", -[ICBrowseAttachmentsCollectionController attachmentSection](self, "attachmentSection")));
    v15 = objc_msgSend(v13, "initWithString:attributes:", v14, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyDetailsLabel](self, "emptyDetailsLabel"));
    objc_msgSend(v16, "setAttributedText:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyView](self, "emptyView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyView](self, "emptyView"));
      objc_msgSend(v19, "addSubview:", v20);

      v28 = CFSTR("emptyView");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyView](self, "emptyView"));
      v29 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[emptyView]|"), 0, 0, v22));
      objc_msgSend(v23, "addConstraints:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[emptyView]|"), 0, 0, v22));
      objc_msgSend(v25, "addConstraints:", v26);

    }
    -[ICBrowseAttachmentsCollectionController updateEmptyViewFonts](self, "updateEmptyViewFonts", v27);

  }
}

- (id)attachmentsToPreviewWhenSelectingAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForObject:", v4));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionViewIndexPathFromFetchedResultsControllerIndexPath:](self, "collectionViewIndexPathFromFetchedResultsControllerIndexPath:", v6));
  if (!v7)
    v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, objc_msgSend(v7, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForItemAtIndexPath:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subviews"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  v14 = objc_opt_class(ICImagesAndMoviesScrollView);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attachments"));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController fetchedResultsController](self, "fetchedResultsController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sections"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objects"));
  }

  return v15;
}

- (double)leadingMargin
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v2, "directionalLayoutMargins");
  v4 = v3;

  return v4;
}

- (double)trailingMargin
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v2, "directionalLayoutMargins");
  v4 = v3;

  return v4;
}

- (void)adjustContentInsetOfImageScroller:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = objc_msgSend(v4, "userInterfaceLayoutDirection");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "collectionView"));
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "collectionView"));
  objc_msgSend(v15, "contentOffset");
  v17 = v16;
  v19 = v18;

  v20 = -v17;
  if (v5 == (id)1)
    v21 = v14;
  else
    v21 = v10;
  v22 = v21 == v20 || vabdd_f64(v20, v21) < fabs(v21 * 0.000000999999997);
  if (v5 == (id)1)
  {
    -[ICBrowseAttachmentsCollectionController trailingMargin](self, "trailingMargin");
    v24 = v23;
    -[ICBrowseAttachmentsCollectionController leadingMargin](self, "leadingMargin");
    v26 = v25;
    v27 = v25;
  }
  else
  {
    -[ICBrowseAttachmentsCollectionController leadingMargin](self, "leadingMargin");
    v24 = v28;
    -[ICBrowseAttachmentsCollectionController trailingMargin](self, "trailingMargin");
    v27 = v29;
    v26 = v24;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "collectionView"));
  objc_msgSend(v30, "setContentInset:", v8, v24, v12, v27);

  if (v22)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "collectionView"));
    objc_msgSend(v31, "setContentOffset:", -v26, v19);

  }
}

- (void)icaxDismissAttachmentBrowser
{
  -[ICBrowseAttachmentsCollectionController doneAction:](self, "doneAction:", 0);
}

- (void)applyAccessibilityInfo
{
  unint64_t v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController noAttachmentsLabel](self, "noAttachmentsLabel"));
  v2 = (unint64_t)objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", UIAccessibilityTraitHeader | v2);

}

- (double)estimatedHeightForAXLargerTextSizesForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  signed __int16 v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  NSAttributedStringKey v21;
  void *v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController sortedSections](self, "sortedSections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (unsigned __int16)objc_msgSend(v7, "intValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController titleForAttachmentSection:](self, "titleForAttachmentSection:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_attachmentBrowserTitleFont](UIFont, "ic_attachmentBrowserTitleFont"));
  if (UIAccessibilityIsBoldTextEnabled())
  {
    objc_msgSend(v10, "pointSize");
    *(float *)&v11 = v11 * 1.1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", roundf(*(float *)&v11), UIFontWeightHeavy));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_fontWithSingleLineA"));

    v10 = (void *)v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
  objc_msgSend(v14, "frame");
  v16 = v15;
  v21 = NSFontAttributeName;
  v22 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 3, v17, 0, v16, 1.79769313e308);
  v19 = v18;

  return v19;
}

- (void)updateEmptyViewFonts
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
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyView](self, "emptyView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:](UIFont, "ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", UIFontTextStyleBody, 28.0, 53.0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController noAttachmentsLabel](self, "noAttachmentsLabel"));
    objc_msgSend(v5, "setFont:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:](UIFont, "ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", UIFontTextStyleBody, 17.0, 44.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyDetailsLabel](self, "emptyDetailsLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController noAttachmentsLabel](self, "noAttachmentsLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyDetailsLabel](self, "emptyDetailsLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "font"));
    NSLog(CFSTR("Setting fonts:\n\t%@\n\t%@"), v9, v11);

    v16 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.6, 1.0));
    if (ICAccessibilityAccessibilityLargerTextSizesEnabled(v16))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ic_darkerAccessibilityColorForColor:](UIColor, "ic_darkerAccessibilityColorForColor:", v16));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController noAttachmentsLabel](self, "noAttachmentsLabel"));
      objc_msgSend(v13, "setTextColor:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyDetailsLabel](self, "emptyDetailsLabel"));
      objc_msgSend(v14, "setTextColor:", v12);

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController noAttachmentsLabel](self, "noAttachmentsLabel"));
      objc_msgSend(v15, "setTextColor:", v16);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController emptyDetailsLabel](self, "emptyDetailsLabel"));
      objc_msgSend(v12, "setTextColor:", v16);
    }

  }
}

- (ICNAEventReporter)eventReporter
{
  void *v3;
  id v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  ICNAEventReporter *v9;
  ICNAEventReporter *eventReporter;
  void *v11;

  if (!self->_eventReporter)
  {
    if (+[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController viewIfLoaded](self, "viewIfLoaded"));

      if (v3)
      {
        v4 = objc_alloc((Class)ICNAEventReporter);
        v5 = (objc_class *)objc_opt_class(self);
        v6 = NSStringFromClass(v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsCollectionController view](self, "view"));
        v9 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:view:", v7, v8);
        eventReporter = self->_eventReporter;
        self->_eventReporter = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v11, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

      }
    }
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

- (id)browserDidCloseHandler
{
  return self->_browserDidCloseHandler;
}

- (void)setBrowserDidCloseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIView)emptyView
{
  return self->_emptyView;
}

- (void)setEmptyView:(id)a3
{
  objc_storeStrong((id *)&self->_emptyView, a3);
}

- (UILabel)noAttachmentsLabel
{
  return self->_noAttachmentsLabel;
}

- (void)setNoAttachmentsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noAttachmentsLabel, a3);
}

- (UILabel)emptyDetailsLabel
{
  return self->_emptyDetailsLabel;
}

- (void)setEmptyDetailsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_emptyDetailsLabel, a3);
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (BOOL)updatingAccounts
{
  return self->_updatingAccounts;
}

- (void)setUpdatingAccounts:(BOOL)a3
{
  self->_updatingAccounts = a3;
}

- (NSArray)sortedSections
{
  return self->_sortedSections;
}

- (void)setSortedSections:(id)a3
{
  objc_storeStrong((id *)&self->_sortedSections, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setContextInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextInteraction, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_sortedSections, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_emptyDetailsLabel, 0);
  objc_storeStrong((id *)&self->_noAttachmentsLabel, 0);
  objc_storeStrong((id *)&self->_emptyView, 0);
  objc_storeStrong(&self->_browserDidCloseHandler, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_defaultSizingBrickCell, 0);
  objc_storeStrong((id *)&self->_itemChanges, 0);
  objc_storeStrong((id *)&self->_sectionChanges, 0);
}

@end
