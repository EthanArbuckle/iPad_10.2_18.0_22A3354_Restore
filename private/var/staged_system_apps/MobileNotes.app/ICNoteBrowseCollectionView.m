@implementation ICNoteBrowseCollectionView

- (BOOL)shouldShowSummaryFooter
{
  return self->_shouldShowSummaryFooter;
}

- (BOOL)shouldShowRecentlyDeletedHeader
{
  return self->_shouldShowRecentlyDeletedHeader;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICNoteBrowseCollectionView frame](self, "frame");
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteBrowseCollectionView;
  -[ICNoteBrowseCollectionView setFrame:](&v11, "setFrame:", x, y, width, height);
  if (v9 != width)
  {
    if (-[ICNoteBrowseCollectionView shouldShowRecentlyDeletedHeader](self, "shouldShowRecentlyDeletedHeader"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView createLayout](self, "createLayout"));
      -[ICNoteBrowseCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v10);

    }
  }
}

- (ICNoteBrowseCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6
{
  ICNoteBrowseCollectionView *v6;
  ICNoteBrowseCollectionView *v7;
  NSArray *numberOfColumnsAdjustmentWidths;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICNoteBrowseCollectionView;
  v6 = -[ICCollectionView initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:](&v12, "initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    numberOfColumnsAdjustmentWidths = v6->_numberOfColumnsAdjustmentWidths;
    v6->_numberOfColumnsAdjustmentWidths = (NSArray *)&off_10057C6A8;

    if (qword_1005DDDE0 != -1)
      dispatch_once(&qword_1005DDDE0, &stru_1005520A0);
    -[ICNoteBrowseCollectionView setPreservesSuperviewLayoutMargins:](v7, "setPreservesSuperviewLayoutMargins:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v10, "ic_addObserver:forKeyPath:context:", v7, CFSTR("ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey"), &off_1005CD518);

  }
  return v7;
}

- (id)createLayout
{
  void ***v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10007C28C;
  v14 = &unk_1005520C8;
  objc_copyWeak(&v15, &location);
  v3 = objc_retainBlock(&v11);
  v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v11, v12, v13, v14));
  if (-[ICNoteBrowseCollectionView shouldShowRecentlyDeletedHeader](self, "shouldShowRecentlyDeletedHeader"))
  {
    +[ICRecentlyDeletedHeaderView heightForSuperview:](ICRecentlyDeletedHeaderView, "heightForSuperview:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView headerLayoutItemWithEstimatedHeight:](self, "headerLayoutItemWithEstimatedHeight:"));
    objc_msgSend(v5, "addObject:", v6);

  }
  if (-[ICNoteBrowseCollectionView shouldShowSummaryFooter](self, "shouldShowSummaryFooter"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView footerLayoutItemWithEstimatedHeight:](self, "footerLayoutItemWithEstimatedHeight:", 100.0));
    objc_msgSend(v5, "addObject:", v7);

  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setBoundarySupplementaryItems:", v8);

  }
  v9 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:configuration:", v3, v4);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey"), &off_1005CD518);

  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseCollectionView;
  -[ICNoteBrowseCollectionView dealloc](&v5, "dealloc");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4;

  if (-[ICNoteBrowseCollectionView shouldShowRecentlyDeletedHeader](self, "shouldShowRecentlyDeletedHeader", a3)
    || -[ICNoteBrowseCollectionView hasTagSection](self, "hasTagSection"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView createLayout](self, "createLayout"));
    -[ICNoteBrowseCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v4);

  }
}

- (void)setShouldShowRecentlyDeletedHeader:(BOOL)a3
{
  id v4;

  if (self->_shouldShowRecentlyDeletedHeader != a3)
  {
    self->_shouldShowRecentlyDeletedHeader = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView createLayout](self, "createLayout"));
    -[ICNoteBrowseCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v4);

  }
}

- (void)setShouldShowSummaryFooter:(BOOL)a3
{
  id v4;

  if (self->_shouldShowSummaryFooter != a3)
  {
    self->_shouldShowSummaryFooter = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView createLayout](self, "createLayout"));
    -[ICNoteBrowseCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v4);

  }
}

- (id)notesSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v6 = a4;
  v7 = -[ICNoteBrowseCollectionView noteContainerViewMode](self, "noteContainerViewMode");
  switch(v7)
  {
    case -1:
      v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        sub_100403A44(v9);

      goto LABEL_8;
    case 1:
      v10 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView notesGallerySectionForSectionIndex:layoutEnvironment:](self, "notesGallerySectionForSectionIndex:layoutEnvironment:", a3, v6));
      goto LABEL_10;
    case 0:
LABEL_8:
      v10 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView notesListSectionForSectionIndex:layoutEnvironment:](self, "notesListSectionForSectionIndex:layoutEnvironment:", a3, v6));
LABEL_10:
      v8 = (void *)v10;
      goto LABEL_11;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)adjustedNumberOfGalleryColumnsForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  double v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  if (objc_msgSend(v5, "hasCompactWidth"))
  {

    v7 = ICAccessibilityAccessibilityLargerTextSizesEnabled(v6);
    goto LABEL_3;
  }
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
    v11 = objc_msgSend(v10, "isMainSplitViewDisplayModeSecondaryOnly");

    v7 = ICAccessibilityAccessibilityLargerTextSizesEnabled(v12);
    if (v11)
    {
LABEL_3:
      if (v7)
        v8 = 2;
      else
        v8 = 3;
      goto LABEL_6;
    }
  }
  else
  {

    ICAccessibilityAccessibilityLargerTextSizesEnabled(v13);
  }
  v8 = -[ICNoteBrowseCollectionView wideModeNumberOfColumns](self, "wideModeNumberOfColumns");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView numberOfColumnsAdjustmentWidths](self, "numberOfColumnsAdjustmentWidths"));
  v15 = objc_msgSend(v14, "count");

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision") && v15)
  {
    v16 = 0;
    while (1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView numberOfColumnsAdjustmentWidths](self, "numberOfColumnsAdjustmentWidths"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v16));
      objc_msgSend(v18, "floatValue");
      v20 = v19;

      if (v20 > a3)
        break;
      if (++v16 == (_QWORD)v15)
        goto LABEL_6;
    }
    v8 = v8 - (_QWORD)v15 + v16 - 1;
  }
LABEL_6:
  if (v8 <= 3)
    return 3;
  else
    return v8;
}

- (id)notesGallerySectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char *v65;
  void *v66;
  int64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));

  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifiers"));
  v67 = a3;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshotForSection:", v9));

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "lastObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifiers"));
  v65 = (char *)objc_msgSend(v13, "count");

  v70 = (void *)v9;
  v57 = objc_msgSend(v8, "numberOfItemsInSection:", v9);
  v69 = v11;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentOfChildItem:", v12));
    v15 = v14 != 0;

  }
  else
  {
    v15 = 0;
  }
  v66 = (void *)v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "container"));
  objc_msgSend(v16, "effectiveContentSize");
  v18 = v17;

  v19 = -[ICNoteBrowseCollectionView adjustedNumberOfGalleryColumnsForWidth:](self, "adjustedNumberOfGalleryColumnsForWidth:", v18);
  v20 = 0.0;
  if (v18 >= 1.0)
    v20 = 1.0 / (double)v19 + -16.0 / v18;
  if (v20 == 0.0)
    v21 = 1.0;
  else
    v21 = v20;
  v22 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", v21));
  +[ICNoteResultsGalleryCollectionViewCell heightForItemWidth:showsParticipantsInfo:showsFolderAndOrAccountName:](ICNoteResultsGalleryCollectionViewCell, "heightForItemWidth:showsParticipantsInfo:showsFolderAndOrAccountName:", -[ICNoteBrowseCollectionView shouldShowCellParticipantsInfo](self, "shouldShowCellParticipantsInfo"), -[ICNoteBrowseCollectionView shouldShowFolderAndOrAccountName](self, "shouldShowFolderAndOrAccountName"), v18 * v21);
  v24 = v23;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
  v64 = (void *)v22;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v22));
  v25 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:"));
  v26 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v24));
  v60 = (void *)v26;
  v27 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v26));
  v61 = (void *)v25;
  v72 = v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
  v58 = (void *)v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v27, v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing flexibleSpacing:](NSCollectionLayoutSpacing, "flexibleSpacing:", 16.0));
  objc_msgSend(v29, "setInterItemSpacing:", v30);

  if (v15)
  {
    v55 = v8;
    v56 = v6;
    v31 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 44.0));
    v54 = (void *)v31;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v31));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v24 + 60.0));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v33, v34));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v32));
    if ((unint64_t)v57 <= 1)
      v37 = 1;
    else
      v37 = (uint64_t)v57;
    do
    {
      objc_msgSend(v36, "addObject:", v29);
      --v37;
    }
    while (v37);
    v38 = objc_msgSend(v36, "copy");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v35, v38));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v39));
    v8 = v55;
    v6 = v56;
  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v29));
  }
  objc_msgSend(v40, "setInterGroupSpacing:", 16.0);
  -[ICNoteBrowseCollectionView directionalLayoutMargins](self, "directionalLayoutMargins");
  v42 = v41;
  -[ICNoteBrowseCollectionView ic_directionalSafeAreaInsets](self, "ic_directionalSafeAreaInsets");
  v44 = v42 - v43;
  -[ICNoteBrowseCollectionView directionalLayoutMargins](self, "directionalLayoutMargins");
  v46 = v45;
  -[ICNoteBrowseCollectionView ic_directionalSafeAreaInsets](self, "ic_directionalSafeAreaInsets");
  v48 = v47;
  v49 = v44 + -2.0;
  if (v65 - 1 != (char *)v67)
    objc_msgSend(v40, "contentInsets");
  v50 = 0.0;
  if (v65 == (char *)1)
    v50 = v44 + -2.0;
  objc_msgSend(v40, "setContentInsets:", v50, v44, v49, v46 - v48);

  return v40;
}

- (BOOL)shouldShowFolderAndOrAccountName
{
  if (-[ICNoteBrowseCollectionView shouldShowFolderName](self, "shouldShowFolderName"))
    return 1;
  else
    return -[ICNoteBrowseCollectionView shouldShowAccountName](self, "shouldShowAccountName");
}

- (id)notesListSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v6 = a4;
  v7 = -[ICNoteBrowseCollectionView ic_behavior](self, "ic_behavior");
  v8 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v9 = v8;
  if (v7 == (id)1)
    v10 = 1;
  else
    v10 = v8;
  if (v10)
    v11 = 0;
  else
    v11 = 2;
  v12 = objc_msgSend(objc_alloc((Class)UICollectionLayoutListConfiguration), "initWithAppearance:", v11);
  if (v7 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    objc_msgSend(v12, "setBackgroundColor:", v13);
    -[ICNoteBrowseCollectionView setBackgroundColor:](self, "setBackgroundColor:", v13);

    objc_msgSend(v12, "setHeaderMode:", -[ICNoteBrowseCollectionView noteListSectionHeaderModeForSectionIndex:](self, "noteListSectionHeaderModeForSectionIndex:", a3));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007CE2C;
    v18[3] = &unk_1005520E8;
    v18[4] = v11;
    objc_msgSend(v12, "setItemSeparatorHandler:", v18);
  }
  else
  {
    objc_msgSend(v12, "setHeaderMode:", -[ICNoteBrowseCollectionView noteListSectionHeaderModeForSectionIndex:](self, "noteListSectionHeaderModeForSectionIndex:", a3));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView leadingSwipeActionsConfigurationProvider](self, "leadingSwipeActionsConfigurationProvider"));
  objc_msgSend(v12, "setLeadingSwipeActionsConfigurationProvider:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView trailingSwipeActionsConfigurationProvider](self, "trailingSwipeActionsConfigurationProvider"));
  objc_msgSend(v12, "setTrailingSwipeActionsConfigurationProvider:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithListConfiguration:layoutEnvironment:](NSCollectionLayoutSection, "sectionWithListConfiguration:layoutEnvironment:", v12, v6));
  if (v9)
  {
    objc_msgSend(v16, "contentInsets");
    objc_msgSend(v16, "setContentInsets:", 0.0, 12.0, 0.0, 12.0);
  }

  return v16;
}

- (int64_t)noteListSectionHeaderModeForSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));

  if ((unint64_t)objc_msgSend(v7, "count") <= a3)
  {
    v11 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
    v9 = objc_opt_class(ICNoteSectionIdentifier);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v10 = (unint64_t)objc_msgSend(v8, "sectionType");
      v11 = 0;
      if (v10 <= 7)
      {
        if (((1 << v10) & 0xEE) != 0)
        {
          v11 = 2;
        }
        else if (v10 == 4)
        {
          if (-[ICNoteBrowseCollectionView hasTagSection](self, "hasTagSection"))
            v13 = 2;
          else
            v13 = 1;
          v11 = 2 * ((unint64_t)objc_msgSend(v7, "count") > v13);
        }
      }
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (id)headerLayoutItemWithAbsoluteHeight:(double)a3
{
  return -[ICNoteBrowseCollectionView headerLayoutItemWithHeight:estimated:](self, "headerLayoutItemWithHeight:estimated:", 0, a3);
}

- (id)headerLayoutItemWithEstimatedHeight:(double)a3
{
  return -[ICNoteBrowseCollectionView headerLayoutItemWithHeight:estimated:](self, "headerLayoutItemWithHeight:estimated:", 1, a3);
}

- (id)footerLayoutItemWithEstimatedHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v4, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v6, UICollectionElementKindSectionFooter, 5));

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICNoteBrowseCollectionView ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Note/Browse/Views/ICNoteBrowseCollectionView.m") & 1) != 0)
  {
    v13 = -[ICNoteBrowseCollectionView ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &off_1005CD518 && (v13 & 1) == 0)
      -[ICNoteBrowseCollectionView reloadLayoutAnimated:](self, "reloadLayoutAnimated:", 1);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteBrowseCollectionView;
    -[ICNoteBrowseCollectionView observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v12, v11, v10, a6);

  }
}

- (BOOL)hasTagSection
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "snapshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionIdentifiers"));
  v5 = objc_msgSend(v4, "ic_containsObjectPassingTest:", &stru_100552108);

  return v5;
}

- (id)headerLayoutItemWithHeight:(double)a3 estimated:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  if (a4)
    v7 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", a3));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", a3));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v6, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v9, UICollectionElementKindSectionHeader, 1));

  return v10;
}

- (unint64_t)wideModeNumberOfColumns
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey"));

  return (unint64_t)v3;
}

- (void)setWideModeNumberOfColumns:(unint64_t)a3
{
  -[ICNoteBrowseCollectionView setWideModeNumberOfColumns:animated:](self, "setWideModeNumberOfColumns:animated:", a3, 0);
}

- (void)setWideModeNumberOfColumns:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setInteger:forKey:", a3, CFSTR("ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey"));

  -[ICNoteBrowseCollectionView reloadLayoutAnimated:](self, "reloadLayoutAnimated:", v4);
}

- (void)reloadLayoutAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView createLayout](self, "createLayout"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteBrowseCollectionViewAnimator animator](ICNoteBrowseCollectionViewAnimator, "animator"));
    -[ICNoteBrowseCollectionView setCollectionViewLayout:withAnimator:](self, "setCollectionViewLayout:withAnimator:", v6, v5);

  }
  else
  {
    -[ICNoteBrowseCollectionView setCollectionViewLayout:](self, "setCollectionViewLayout:", v6);
  }

}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (BOOL)shouldShowCellParticipantsInfo
{
  return self->_shouldShowCellParticipantsInfo;
}

- (void)setShouldShowCellParticipantsInfo:(BOOL)a3
{
  self->_shouldShowCellParticipantsInfo = a3;
}

- (BOOL)shouldShowFolderName
{
  return self->_shouldShowFolderName;
}

- (void)setShouldShowFolderName:(BOOL)a3
{
  self->_shouldShowFolderName = a3;
}

- (BOOL)shouldShowAccountName
{
  return self->_shouldShowAccountName;
}

- (void)setShouldShowAccountName:(BOOL)a3
{
  self->_shouldShowAccountName = a3;
}

- (NSArray)numberOfColumnsAdjustmentWidths
{
  return self->_numberOfColumnsAdjustmentWidths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfColumnsAdjustmentWidths, 0);
}

@end
