@implementation BKPDFTOCViewController

- (BKPDFTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKPDFTOCViewController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKPDFTOCViewController;
  v4 = -[BKTOCViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BKPDFTOCViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)releaseViews
{
  PDFOutline *currentOutline;
  objc_super v4;

  -[PDFOutline setDelegate:](self->_currentOutline, "setDelegate:", 0);
  -[PDFOutline setDataSource:](self->_currentOutline, "setDataSource:", 0);
  currentOutline = self->_currentOutline;
  self->_currentOutline = 0;

  -[BKPDFTOCViewController setRecenteredIndexPath:](self, "setRecenteredIndexPath:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BKPDFTOCViewController;
  -[BKTOCViewController releaseViews](&v4, "releaseViews");
}

- (void)dealloc
{
  objc_super v3;

  -[BKPDFTOCViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKPDFTOCViewController;
  -[BKTOCViewController dealloc](&v3, "dealloc");
}

- (void)setPdfDocument:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (*(id *)&self->_preferredFontSize != v6)
  {
    objc_storeStrong((id *)&self->_preferredFontSize, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outlineRoot"));
    -[BKPDFTOCViewController setPdfOutlineRoot:](self, "setPdfOutlineRoot:", v5);

  }
}

- (id)scrollView
{
  return self->_currentOutline;
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  PDFOutline *v13;
  PDFOutline *currentOutline;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PDFOutline *v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  id v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  objc_super v45;
  _QWORD v46[4];

  v45.receiver = self;
  v45.super_class = (Class)BKPDFTOCViewController;
  -[BKPDFTOCViewController loadView](&v45, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[BKTOCViewController isVertical](self, "isVertical");
  if (v12)
  {
    CGAffineTransformMakeRotation(&v44, -1.57079633);
    v43 = v44;
    objc_msgSend(v3, "setTransform:", &v43);
  }
  v13 = (PDFOutline *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, v5, v7, v9, v11);
  currentOutline = self->_currentOutline;
  self->_currentOutline = v13;

  -[PDFOutline setClipsToBounds:](self->_currentOutline, "setClipsToBounds:", v12);
  -[PDFOutline setDelegate:](self->_currentOutline, "setDelegate:", self);
  -[PDFOutline setDataSource:](self->_currentOutline, "setDataSource:", self);
  -[PDFOutline setSeparatorStyle:](self->_currentOutline, "setSeparatorStyle:", 1);
  -[PDFOutline setTranslatesAutoresizingMaskIntoConstraints:](self->_currentOutline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v42 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v5, v7, v9, 0.0);
  -[PDFOutline setTableFooterView:](self->_currentOutline, "setTableFooterView:");
  if (-[BKTOCViewController isVertical](self, "isVertical"))
  {
    -[BKTOCViewController verticalCenteringInsets](self, "verticalCenteringInsets");
    v16 = v15;
    -[BKTOCViewController verticalCenteringInsets](self, "verticalCenteringInsets");
    -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", v16, 0.0, v17, 0.0);
    -[BKTOCViewController centeringInsets](self, "centeringInsets");
    v19 = -v18;
    v20 = self->_currentOutline;
    v21 = 0.0;
  }
  else
  {
    -[BKTOCViewController centeringInsets](self, "centeringInsets");
    v23 = v22;
    -[BKTOCViewController centeringInsets](self, "centeringInsets");
    -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", v23, 0.0);
    -[BKTOCViewController centeringInsets](self, "centeringInsets");
    v21 = -v24;
    v20 = self->_currentOutline;
    v19 = 0.0;
  }
  -[PDFOutline setContentOffset:](v20, "setContentOffset:", v19, v21);
  objc_msgSend(v3, "addSubview:", self->_currentOutline);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline leadingAnchor](self->_currentOutline, "leadingAnchor"));
  v41 = v25;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v46[0] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline trailingAnchor](self->_currentOutline, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v26));
  v46[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline topAnchor](self->_currentOutline, "topAnchor"));
  v38 = v3;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  v46[2] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline bottomAnchor](self->_currentOutline, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v46[3] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v35, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  -[BKPDFTOCViewController _updateColors](self, "_updateColors");
}

- (void)_updateContentInsets
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController layoutDelegate](self, "layoutDelegate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController layoutDelegate](self, "layoutDelegate"));
    objc_msgSend(v4, "edgeInsetsForContentViewController:", self);
    -[BKContentViewController setContentInsets:](self, "setContentInsets:");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController layoutDelegate](self, "layoutDelegate"));
    objc_msgSend(v5, "separatorInsetsForContentViewController:", self);
    -[BKContentViewController setSeparatorInsets:](self, "setSeparatorInsets:");

  }
}

- (void)updateView
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Height;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  CGRect v39;
  CGRect v40;

  if (-[BKPDFTOCViewController isViewLoaded](self, "isViewLoaded")
    && -[BKPDFTOCViewController isVisible](self, "isVisible"))
  {
    -[BKPDFTOCViewController _updateContentInsets](self, "_updateContentInsets");
    -[PDFOutline contentInset](self->_currentOutline, "contentInset");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    -[BKContentViewController contentInsets](self, "contentInsets");
    v10 = v9;
    if (-[BKTOCViewController isVertical](self, "isVertical"))
    {
      -[BKContentViewController contentInsets](self, "contentInsets");
      v12 = v11;
      -[BKContentViewController contentInsets](self, "contentInsets");
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController view](self, "view"));
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v12 + v18;
      v21 = v20 + 0.0;
      v23 = v22 - (v12 + v14);

      -[PDFOutline contentSize](self->_currentOutline, "contentSize");
      if (v24 > 0.0)
      {
        -[PDFOutline contentSize](self->_currentOutline, "contentSize");
        v26 = v25;
        v39.origin.x = v19;
        v39.origin.y = v21;
        v39.size.width = v23;
        v39.size.height = v17;
        if (v26 < CGRectGetHeight(v39))
        {
          v40.origin.x = v19;
          v40.origin.y = v21;
          v40.size.width = v23;
          v40.size.height = v17;
          Height = CGRectGetHeight(v40);
          -[PDFOutline contentSize](self->_currentOutline, "contentSize");
          -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", round(Height - v28), 0.0, 0.0, 0.0);
        }
      }
      -[PDFOutline setFrame:](self->_currentOutline, "setFrame:", v19, v21, v23, v17);
    }
    else
    {
      -[PDFOutline setContentInset:](self->_currentOutline, "setContentInset:", v10, v4, v6, v8);
    }
    -[BKContentViewController separatorInsets](self, "separatorInsets");
    -[PDFOutline setSeparatorInset:](self->_currentOutline, "setSeparatorInset:");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController view](self, "view"));
    v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "viewWithTag:", 9999));

    objc_msgSend(v38, "removeFromSuperview");
    -[PDFOutline setAlpha:](self->_currentOutline, "setAlpha:", 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline tableFooterView](self->_currentOutline, "tableFooterView"));
    objc_msgSend(v30, "frame");
    v32 = v31;
    v34 = v33;

    -[PDFOutline frame](self->_currentOutline, "frame");
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline tableFooterView](self->_currentOutline, "tableFooterView"));
    objc_msgSend(v37, "setFrame:", v32, v34, v36, 0.0);

  }
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController themePage](self, "themePage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColorForTraitEnvironment:", self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline tableFooterView](self->_currentOutline, "tableFooterView"));
  objc_msgSend(v5, "setBackgroundColor:", v3);

  -[PDFOutline setBackgroundColor:](self->_currentOutline, "setBackgroundColor:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline tableFooterView](self->_currentOutline, "tableFooterView"));
  objc_msgSend(v6, "setBackgroundColor:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableViewSeparatorColor"));
  -[PDFOutline setSeparatorColor:](self->_currentOutline, "setSeparatorColor:", v7);

  -[PDFOutline reloadData](self->_currentOutline, "reloadData");
}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFTOCViewController;
  -[BKTOCViewController setTheme:](&v4, "setTheme:", a3);
  -[BKPDFTOCViewController _updateColors](self, "_updateColors");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPDFTOCViewController;
  -[BKTOCViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BKPDFTOCViewController updateView](self, "updateView");
  -[BKTOCViewController reload](self, "reload");
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (-[BKTOCViewController isVertical](self, "isVertical", a3))
  {
    v4 = -[PDFOutline visibleCells](self->_currentOutline, "visibleCells");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PDFOutline indexPathsForVisibleRows](self->_currentOutline, "indexPathsForVisibleRows"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    -[BKPDFTOCViewController setRecenteredIndexPath:](self, "setRecenteredIndexPath:", v5);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFTOCViewController;
  v7 = a4;
  -[BKTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9C318;
  v8[3] = &unk_1BE8C8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewDidLayoutSubviews
{
  unsigned int v3;
  PDFOutline *currentOutline;
  double v5;
  PDFOutline *v6;
  double v7;
  char v8;
  char *v9;
  BOOL v10;
  void *v11;
  objc_super v12;
  CGRect v13;

  -[BKPDFTOCViewController updateView](self, "updateView");
  v3 = -[BKTOCViewController isVertical](self, "isVertical");
  currentOutline = self->_currentOutline;
  if (currentOutline)
  {
    if (v3)
    {
      -[PDFOutline frame](currentOutline, "frame");
      v5 = CGRectGetWidth(v13) + -8.0;
      v6 = self->_currentOutline;
      v7 = 0.0;
    }
    else
    {
      -[PDFOutline contentInset](currentOutline, "contentInset");
      v6 = self->_currentOutline;
      v5 = 0.0;
    }
    -[PDFOutline setScrollIndicatorInsets:](v6, "setScrollIndicatorInsets:", v7, 0.0, 0.0, v5);
  }
  if (BYTE5(self->super._verticalCenteringInsets.right))
  {
    -[PDFOutline flashScrollIndicators](self->_currentOutline, "flashScrollIndicators");
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  BYTE5(self->super._verticalCenteringInsets.right) = v8;
  if (!BYTE4(self->super._verticalCenteringInsets.right))
  {
    if (v3)
    {
      v9 = (char *)-[PDFOutline numberOfRowsInSection:](self->_currentOutline, "numberOfRowsInSection:", 0);
      if (v9)
        v10 = v9 == (char *)0x7FFFFFFFFFFFFFFFLL;
      else
        v10 = 1;
      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9 - 1, 0));
        -[PDFOutline scrollToRowAtIndexPath:atScrollPosition:animated:](self->_currentOutline, "scrollToRowAtIndexPath:atScrollPosition:animated:", v11, 1, 0);

      }
    }
    BYTE4(self->super._verticalCenteringInsets.right) = 1;
  }
  v12.receiver = self;
  v12.super_class = (Class)BKPDFTOCViewController;
  -[BKPDFTOCViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
}

- (unint64_t)pageIndexFromChapter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "page"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfDocument](self, "pdfDocument"));
  v7 = objc_msgSend(v6, "indexForPage:", v5);

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = (unint64_t)v7;

  return v8;
}

- (int64_t)pageNumberFromChapter:(id)a3
{
  return +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", -[BKPDFTOCViewController pageIndexFromChapter:](self, "pageIndexFromChapter:", a3));
}

- (id)fontFamily
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "familyName"));

  return v3;
}

- (double)calculateFontSize
{
  double v3;
  double result;
  objc_super v5;

  -[BKPDFTOCViewController preferredFontSize](self, "preferredFontSize");
  if (v3 == 0.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKPDFTOCViewController;
    -[BKTOCViewController calculateFontSize](&v5, "calculateFontSize");
  }
  else
  {
    -[BKPDFTOCViewController preferredFontSize](self, "preferredFontSize");
  }
  return result;
}

- (int64_t)indentationLevelForChapter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = v4;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfOutlineRoot](self, "pdfOutlineRoot"));

      if (v9 == v10)
        break;
      ++v7;
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
      v8 = v4;
      if (!v6)
        goto LABEL_8;
    }
    v4 = v8;
  }
  else
  {
    v7 = 0;
  }
LABEL_8:

  return v7;
}

- (id)fontForChapter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  -[BKTOCViewController establishChapterFonts](self, "establishChapterFonts");
  v5 = -[BKPDFTOCViewController indentationLevelForChapter:](self, "indentationLevelForChapter:", v4);

  if (v5 < 2)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterTopLevelFont](self, "chapterTopLevelFont"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterSubLevelFont](self, "chapterSubLevelFont"));
  return v6;
}

- (id)chapterForIndexPath:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "row");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfOutlineRoot](self, "pdfOutlineRoot"));
  -[BKPDFTOCViewController findOutlineForRow:fromRowCount:fromOutline:](self, "findOutlineForRow:fromRowCount:fromOutline:", v4, 0, v5);

  return -[BKPDFTOCViewController currentOutline](self, "currentOutline");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)countRowsOfChildren:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = 0;
  if (objc_msgSend(v4, "numberOfChildren"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childAtIndex:", v6));
      objc_msgSend(v7, "setIsOpen:", 1);
      if (objc_msgSend(v7, "numberOfChildren"))
        v8 = -[BKPDFTOCViewController countRowsOfChildren:](self, "countRowsOfChildren:", v7) + 1;
      else
        v8 = 1;
      v5 += v8;

      ++v6;
    }
    while (v6 < (unint64_t)objc_msgSend(v4, "numberOfChildren"));
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfOutlineRoot](self, "pdfOutlineRoot", a3, a4));
  v6 = objc_msgSend(v5, "numberOfChildren");

  v7 = 0;
  if (v6)
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfOutlineRoot](self, "pdfOutlineRoot"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childAtIndex:", v8));

      objc_msgSend(v10, "setIsOpen:", 1);
      if (objc_msgSend(v10, "numberOfChildren"))
        v11 = -[BKPDFTOCViewController countRowsOfChildren:](self, "countRowsOfChildren:", v10) + 1;
      else
        v11 = 1;
      v7 += v11;

      ++v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfOutlineRoot](self, "pdfOutlineRoot"));
      v13 = objc_msgSend(v12, "numberOfChildren");

    }
    while (v8 < (unint64_t)v13);
  }
  return v7;
}

- (id)reuseIdentifier
{
  return CFSTR("tocCell");
}

- (int64_t)findOutlineForRow:(int64_t)a3 fromRowCount:(int64_t)a4 fromOutline:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v8 = a5;
  if (objc_msgSend(v8, "numberOfChildren"))
  {
    v9 = 0;
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childAtIndex:", v9));
      v11 = v10;
      if (a4 == a3)
        break;
      ++a4;
      if (objc_msgSend(v10, "numberOfChildren"))
      {
        if (objc_msgSend(v11, "isOpen"))
        {
          a4 = -[BKPDFTOCViewController findOutlineForRow:fromRowCount:fromOutline:](self, "findOutlineForRow:fromRowCount:fromOutline:", a3, a4, v11);
          if (a4 < 0)
            goto LABEL_10;
        }
      }

      if (++v9 >= (unint64_t)objc_msgSend(v8, "numberOfChildren"))
        goto LABEL_11;
    }
    -[BKPDFTOCViewController setCurrentOutline:](self, "setCurrentOutline:", v10);
LABEL_10:

    a4 = -1;
  }
LABEL_11:

  return a4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BKPDFTOCTableViewCell *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController reuseIdentifier](self, "reuseIdentifier"));
  *(_QWORD *)&v9 = objc_opt_class(BKPDFTOCTableViewCell).n128_u64[0];
  v11 = v10;
  v62 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8, v9));
  v13 = BUDynamicCast(v11, v12);
  v14 = (BKPDFTOCTableViewCell *)objc_claimAutoreleasedReturnValue(v13);

  if (!v14)
    v14 = -[BKTOCTableViewCell initWithStyle:reuseIdentifier:]([BKPDFTOCTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v8);
  v61 = v7;
  v15 = objc_msgSend(v7, "row");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController pdfOutlineRoot](self, "pdfOutlineRoot"));
  -[BKPDFTOCViewController findOutlineForRow:fromRowCount:fromOutline:](self, "findOutlineForRow:fromRowCount:fromOutline:", v15, 0, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController currentOutline](self, "currentOutline"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell contentView](v14, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subviews"));

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
        objc_opt_class(UIButton);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
          objc_msgSend(v24, "removeFromSuperview");
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v21);
  }

  objc_msgSend(v17, "setIsOpen:", 1);
  -[BKTOCTableViewCell setVertical:](v14, "setVertical:", -[BKTOCViewController isVertical](self, "isVertical"));
  -[BKPDFTOCTableViewCell setPdfChapter:](v14, "setPdfChapter:", v17);
  if (-[BKTOCViewController isVertical](self, "isVertical"))
  {
    CGAffineTransformMakeRotation(&v66, 1.57079633);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
    v65 = v66;
    objc_msgSend(v26, "setTransform:", &v65);

    CGAffineTransformMakeRotation(&v64, 1.57079633);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](v14, "pageLabel"));
    v63 = v64;
    objc_msgSend(v27, "setTransform:", &v63);

    -[BKPDFTOCTableViewCell setSelectionStyle:](v14, "setSelectionStyle:", 2);
  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "label"));
  v29 = (void *)v28;
  v30 = CFSTR(" ");
  if (v28)
    v30 = (__CFString *)v28;
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BKPDFTOCViewController pageNumberFromChapter:](self, "pageNumberFromChapter:", v17)));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v32));

  -[BKTOCTableViewCell setupSelectedBackgroundNil](v14, "setupSelectedBackgroundNil");
  -[BKContentViewController contentInsets](self, "contentInsets");
  v35 = v34;
  -[BKContentViewController contentInsets](self, "contentInsets");
  -[BKTOCTableViewCell setContentInsets:](v14, "setContentInsets:", 0.0, v35, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
  objc_msgSend(v36, "setText:", v31);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController fontForChapter:](self, "fontForChapter:", v17));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
  objc_msgSend(v38, "setFont:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
  objc_msgSend(v39, "setLineBreakMode:", 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
  objc_msgSend(v40, "setAlpha:", 1.0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
  objc_msgSend(v41, "setNumberOfLines:", 0);

  -[BKPDFTOCTableViewCell setIndentationLevel:](v14, "setIndentationLevel:", -[BKPDFTOCViewController indentationLevelForChapter:](self, "indentationLevelForChapter:", v17));
  -[BKPDFTOCTableViewCell setIndentationWidth:](v14, "setIndentationWidth:", 16.0);
  v42 = (char *)-[BKPDFTOCTableViewCell effectiveUserInterfaceLayoutDirection](v14, "effectiveUserInterfaceLayoutDirection");
  -[BKContentViewController separatorInsets](self, "separatorInsets");
  v44 = v43;
  v45 = (double)(uint64_t)-[BKPDFTOCTableViewCell indentationLevel](v14, "indentationLevel");
  -[BKPDFTOCTableViewCell indentationWidth](v14, "indentationWidth");
  v47 = v44 + v45 * v46;
  -[BKContentViewController separatorInsets](self, "separatorInsets");
  v49 = v48;
  if (v42 == (_BYTE *)&dword_0 + 1 || -[BKTOCViewController isVertical](self, "isVertical"))
  {
    v50 = v47;
  }
  else
  {
    v50 = v49;
    v49 = v47;
  }
  -[BKPDFTOCTableViewCell setSeparatorInset:](v14, "setSeparatorInset:", 0.0, v49, 0.0, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](v14, "pageLabel"));
  v52 = v51;
  if (v33)
  {
    objc_msgSend(v51, "setText:", v33);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController pageLabelFont](self, "pageLabelFont"));
    objc_msgSend(v52, "setFont:", v53);

  }
  objc_msgSend(v52, "setHidden:", v33 == 0);
  -[BKPDFTOCTableViewCell setNeedsLayout](v14, "setNeedsLayout");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController themePage](self, "themePage"));
  -[BKTOCTableViewCell configureSelectedBackgroundView](v14, "configureSelectedBackgroundView");
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline backgroundColor](self->_currentOutline, "backgroundColor"));
  -[BKPDFTOCTableViewCell setBackgroundColor:](v14, "setBackgroundColor:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "primaryTextColor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCTableViewCell textLabel](v14, "textLabel"));
  objc_msgSend(v57, "setTextColor:", v56);

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "tocPageNumberTextColor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](v14, "pageLabel"));
  objc_msgSend(v59, "setTextColor:", v58);

  return v14;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 52.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double Width;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double height;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSAttributedStringKey v28;
  void *v29;
  CGRect v30;

  v5 = a4;
  -[PDFOutline bounds](self->_currentOutline, "bounds");
  Width = CGRectGetWidth(v30);
  -[BKContentViewController contentInsets](self, "contentInsets");
  v9 = Width - (v7 + v8);
  if (v9 <= 0.0)
  {
    height = CGSizeZero.height;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController chapterForIndexPath:](self, "chapterForIndexPath:", v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController fontForChapter:](self, "fontForChapter:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController pageLabelFont](self, "pageLabelFont"));
    if (-[BKTOCViewController isVertical](self, "isVertical"))
    {
      v28 = NSFontAttributeName;
      v29 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      objc_msgSend(CFSTR("8888"), "boundingRectWithSize:options:attributes:context:", 0, v13, 0, 1.79769313e308, 1.79769313e308);
      height = v14 + 15.0;

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BKPDFTOCViewController pageNumberFromChapter:](self, "pageNumberFromChapter:", v10)));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v16));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "label"));
      v19 = (__CFString *)objc_msgSend(v18, "copy");
      v20 = v19;
      v21 = CFSTR(" ");
      if (v19)
        v21 = v19;
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByTrimmingCharactersInSet:](v22, "stringByTrimmingCharactersInSet:", v23));

      +[BKTOCTableViewCell pageLabelFrameForString:font:bounds:layoutDirection:](BKTOCTableViewCell, "pageLabelFrameForString:font:bounds:layoutDirection:", v17, v12, -[BKViewController layoutDirection](self, "layoutDirection"), CGRectZero.origin.x, CGRectZero.origin.y, v9, 52.0);
      +[BKTOCTableViewCell cellHeightForCellWidth:pageLabelWidth:text:indentationLevel:indentationWidth:font:usesPopoverStyle:](BKTOCTableViewCell, "cellHeightForCellWidth:pageLabelWidth:text:indentationLevel:indentationWidth:font:usesPopoverStyle:", v24, -[BKPDFTOCViewController indentationLevelForChapter:](self, "indentationLevelForChapter:", v10), v11, 0, v9, v25, 16.0);
      height = v26;

    }
  }

  return fmax(ceil(height), 52.0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  BKPageLocation *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:"));
  if ((BYTE4(self->super._fetchedResultsController) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFTOCViewController chapterForIndexPath:](self, "chapterForIndexPath:", v10));
    v8 = -[BKPageLocation initWithOrdinal:andOffset:]([BKPageLocation alloc], "initWithOrdinal:andOffset:", -[BKPDFTOCViewController ordinal](self, "ordinal"), -[BKPDFTOCViewController pageIndexFromChapter:](self, "pageIndexFromChapter:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v9, "directoryContent:didSelectLocation:", self, v8);

    objc_msgSend(v6, "setSelected:animated:", 0, 0);
    objc_msgSend(v6, "setSelectionStyle:", 0);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)isReusable
{
  return 0;
}

- (BOOL)isContentLoaded
{
  return 1;
}

- (BOOL)isContentLoadPending
{
  return 0;
}

- (void)setNeedsRestyle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPDFTOCViewController;
  -[BKContentViewController setNeedsRestyle](&v7, "setNeedsRestyle");
  if (-[BKTOCViewController isVertical](self, "isVertical"))
  {
    v3 = -[PDFOutline visibleCells](self->_currentOutline, "visibleCells");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDFOutline indexPathsForVisibleRows](self->_currentOutline, "indexPathsForVisibleRows"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    -[BKPDFTOCViewController setRecenteredIndexPath:](self, "setRecenteredIndexPath:", v6);

  }
  -[BKTOCViewController reload](self, "reload");
}

- (int64_t)ordinal
{
  return -101;
}

- (void)setBook:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPDFTOCViewController;
  -[BKContentViewController setBook:](&v3, "setBook:", a3);
}

- (NSIndexPath)recenteredIndexPath
{
  return *(NSIndexPath **)&self->_setInitialScrollPosition;
}

- (void)setRecenteredIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_setInitialScrollPosition, a3);
}

- (double)preferredFontSize
{
  return *(double *)&self->_changeIsUserDriven;
}

- (void)setPreferredFontSize:(double)a3
{
  *(double *)&self->_changeIsUserDriven = a3;
}

- (PDFDocument)pdfDocument
{
  return *(PDFDocument **)&self->_preferredFontSize;
}

- (PDFOutline)pdfOutlineRoot
{
  return (PDFOutline *)self->_pdfDocument;
}

- (void)setPdfOutlineRoot:(id)a3
{
  objc_storeStrong((id *)&self->_pdfDocument, a3);
}

- (PDFOutline)currentOutline
{
  return self->_pdfOutlineRoot;
}

- (void)setCurrentOutline:(id)a3
{
  objc_storeStrong((id *)&self->_pdfOutlineRoot, a3);
}

- (UITableView)tableView
{
  return (UITableView *)self->_currentOutline;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_currentOutline, a3);
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)self->_tableView;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (BOOL)changeIsUserDriven
{
  return (BOOL)self->_recenteredIndexPath;
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  LOBYTE(self->_recenteredIndexPath) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentOutline, 0);
  objc_storeStrong((id *)&self->_pdfOutlineRoot, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_preferredFontSize, 0);
  objc_storeStrong((id *)&self->_setInitialScrollPosition, 0);
}

@end
