@implementation BKTOCContentViewController

- (BKTOCContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKTOCContentViewController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKTOCContentViewController;
  v4 = -[BKTOCViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BKTOCContentViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)releaseViews
{
  void *v3;
  objc_super v4;

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setDelegate:", 0);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setDataSource:", 0);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setDragDelegate:", 0);
  v3 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(CGFloat *)((char *)&self->super._verticalCenteringInsets.right + 4) = 0.0;

  -[BKTOCContentViewController setRecenteredIndexPath:](self, "setRecenteredIndexPath:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BKTOCContentViewController;
  -[BKTOCViewController releaseViews](&v4, "releaseViews");
}

- (void)dealloc
{
  objc_super v3;

  -[BKTOCContentViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  -[BKTOCViewController dealloc](&v3, "dealloc");
}

- (id)dateFormatter
{
  id *v3;
  id v4;
  id v5;
  id *v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;

  v3 = (id *)((char *)&self->_tableView + 4);
  if (!*(UITableView **)((char *)&self->_tableView + 4))
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    v5 = *v3;
    *v3 = v4;

    objc_msgSend(*v3, "setDateStyle:", 4);
    objc_msgSend(*v3, "setTimeStyle:", 0);
    objc_msgSend(*v3, "setDoesRelativeDateFormatting:", 1);
  }
  v6 = (id *)((char *)&self->_dateFormatter + 4);
  if (!*(NSDateFormatter **)((char *)&self->_dateFormatter + 4))
  {
    v7 = objc_alloc_init((Class)NSDateFormatter);
    v8 = *v6;
    *v6 = v7;

    objc_msgSend(*v6, "setDateStyle:", 2);
    objc_msgSend(*v6, "setTimeStyle:", 0);
    objc_msgSend(*v6, "setDoesRelativeDateFormatting:", 1);
  }
  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController traitCollection](self, "traitCollection"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory)
      v3 = v6;
  }
  return *v3;
}

- (id)scrollView
{
  return *(id *)((char *)&self->super._verticalCenteringInsets.right + 4);
}

- (int64_t)tableViewSeparatorStyle
{
  int64_t result;

  if (!-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
    return 1;
  result = -[BKTOCViewController tocContentType](self, "tocContentType");
  if (result)
    return 1;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  uint64_t v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  double v47;
  uint64_t v48;
  objc_super v49;
  CGRect v50;

  v49.receiver = self;
  v49.super_class = (Class)BKTOCContentViewController;
  -[BKContentViewController viewDidLoad](&v49, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v8 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, v4, v5, v6, v7);
  v9 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(_QWORD *)((char *)&self->super._verticalCenteringInsets.right + 4) = v8;

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setClipsToBounds:", 0);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setDelegate:", self);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setDataSource:", self);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setSeparatorStyle:", -[BKTOCContentViewController tableViewSeparatorStyle](self, "tableViewSeparatorStyle"));
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setCellLayoutMarginsFollowReadableWidth:", 0);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setDragDelegate:", self);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setAllowsMultipleSelectionDuringEditing:", 1);
  -[BKTOCViewController centeringInsets](self, "centeringInsets");
  v11 = v10;
  -[BKTOCViewController centeringInsets](self, "centeringInsets");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
  objc_msgSend(v14, "safeAreaInsets");
  v16 = v13 + v15;

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setContentInset:", v11, 0.0, v16, 0.0);
  -[BKTOCViewController centeringInsets](self, "centeringInsets");
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setContentOffset:", 0.0, -v17);
  objc_msgSend(v3, "addSubview:", *(_QWORD *)((char *)&self->super._verticalCenteringInsets.right + 4));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "safeAreaInsets");
  v28 = v22 + v27;
  v31 = v24 - (v29 + v30);
  v50.size.height = v26 - (v27 + v32);
  v50.origin.x = v20 + v29;
  v50.origin.y = v28;
  v50.size.width = v31;
  v33 = +[BEWebViewFactory viewConfiguredForWebTOC:](BEWebViewFactory, "viewConfiguredForWebTOC:", 0.0, 0.0, CGRectGetWidth(v50), 52.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[BKTOCContentViewController setSharedWebView:](self, "setSharedWebView:", v34);

  v35 = objc_alloc_init((Class)NSMutableDictionary);
  -[BKTOCContentViewController setRequestToIndexPath:](self, "setRequestToIndexPath:", v35);

  v36 = objc_alloc_init((Class)NSMutableDictionary);
  -[BKTOCContentViewController setCachedRowContents:](self, "setCachedRowContents:", v36);

  v37 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(_QWORD *)&v38 = objc_opt_class(BKTOCWebViewTableViewCell).n128_u64[0];
  objc_msgSend(v37, "registerClass:forCellReuseIdentifier:", v39, CFSTR("tocCell + webView"), v38);
  v40 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(_QWORD *)&v41 = objc_opt_class(BKTOCTableViewCell).n128_u64[0];
  objc_msgSend(v40, "registerClass:forCellReuseIdentifier:", v42, CFSTR("tocCell"), v41);
  v43 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(_QWORD *)&v44 = objc_opt_class(BKTOCPointAnnotationTableCell).n128_u64[0];
  objc_msgSend(v43, "registerClass:forCellReuseIdentifier:", v45, CFSTR("bookmarkCell"), v44);
  v46 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  *(_QWORD *)&v47 = objc_opt_class(BKTOCRangeAnnotationTableCell).n128_u64[0];
  objc_msgSend(v46, "registerClass:forCellReuseIdentifier:", v48, CFSTR("noteCell"), v47);
  -[BKTOCContentViewController _updateColors](self, "_updateColors");

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[BKTOCContentViewController _updateColors](self, "_updateColors", a3, a4);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "reloadData");
  -[BKTOCContentViewController _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
}

- (void)setSharedWebView:(id)a3
{
  BKTOCWebViewCellLoadQueue *v4;
  void *v5;
  void *v6;
  BKTOCWebViewCellLoadQueue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  CGRect v15;

  v4 = (BKTOCWebViewCellLoadQueue *)a3;
  v5 = *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4);
  if (v5)
    objc_msgSend(v5, "removeFromSuperview");
  v6 = *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4);
  *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4) = v4;
  v7 = v4;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "scrollView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "setOpaque:", 0);
  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "setAutoresizingMask:", 0);
  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "setUserInteractionEnabled:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
  objc_msgSend(v12, "sendSubviewToBack:", *(BKTOCWebViewCellLoadQueue **)((char *)&self->_requestQueue + 4));

  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "frame");
  objc_msgSend(*(id *)((char *)&self->_requestQueue + 4), "setFrame:", -CGRectGetWidth(v15), v15.origin.y, v15.size.width, v15.size.height);
  v13 = *(uint64_t *)((char *)&self->_requestQueue + 4);
  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController requestQueue](self, "requestQueue"));
  objc_msgSend(v14, "setWebView:", v13);

}

- (void)_updateColors
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
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController themePage](self, "themePage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setBackgroundColor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tableViewSeparatorColor"));
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setSeparatorColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primaryTextColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_sharedWebView + 4), "titleLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secondaryTextColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_sharedWebView + 4), "descriptionLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primaryTextColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
  objc_msgSend(v11, "setTintColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "secondaryTextColor"));
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setTintColor:", v12);

}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKTOCContentViewController;
  -[BKTOCViewController setTheme:](&v4, "setTheme:", a3);
  -[BKTOCContentViewController _updateColors](self, "_updateColors");
  -[BKTOCContentViewController _dumpCachedWebContentAndReload](self, "_dumpCachedWebContentAndReload");
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "reloadData");
  -[BKTOCContentViewController _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
}

- (BKTOCWebViewCellLoadQueue)requestQueue
{
  void *v3;
  BKTOCWebViewCellLoadQueue *v4;
  void *v5;
  void *v6;

  v3 = *(AEMinimalTemplate **)((char *)&self->_template + 4);
  if (!v3)
  {
    v4 = objc_opt_new(BKTOCWebViewCellLoadQueue);
    v5 = *(AEMinimalTemplate **)((char *)&self->_template + 4);
    *(AEMinimalTemplate **)((char *)&self->_template + 4) = (AEMinimalTemplate *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController imageCache](self, "imageCache"));
    objc_msgSend(*(id *)((char *)&self->_template + 4), "setImageCache:", v6);

    v3 = *(AEMinimalTemplate **)((char *)&self->_template + 4);
  }
  return (BKTOCWebViewCellLoadQueue *)v3;
}

- (AEMinimalTemplate)template
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  AEMinimalTemplate *v7;
  id v8;
  void *v9;
  id v11;

  v3 = *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4);
  if (!v3)
  {
    v4 = AEBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("toc_web_cell.html"), CFSTR("tmpl")));

    v11 = 0;
    v7 = -[AEMinimalTemplate initWithURL:error:]([AEMinimalTemplate alloc], "initWithURL:error:", v6, &v11);
    v8 = v11;
    v9 = *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4);
    *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4) = (BKTOCImageCache2 *)v7;

    v3 = *(BKTOCImageCache2 **)((char *)&self->_imageCache + 4);
  }
  return (AEMinimalTemplate *)v3;
}

- (BKTOCImageCache2)imageCache
{
  void *v3;
  BKTOCImageCache2 *v4;
  void *v5;

  v3 = *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4);
  if (!v3)
  {
    v4 = objc_opt_new(BKTOCImageCache2);
    v5 = *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4);
    *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4) = (NSMutableDictionary *)v4;

    v3 = *(NSMutableDictionary **)((char *)&self->_requestToIndexPath + 4);
  }
  return (BKTOCImageCache2 *)v3;
}

- (id)_bkTableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v16;
  id v17;
  id v18;
  id v19;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sampleContent"));
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
    goto LABEL_6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexPath:", v6));

  objc_opt_class(AEAnnotation);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
    goto LABEL_5;
  v13 = v11;
  if (objc_msgSend(v13, "annotationIsBookmark"))
  {

LABEL_5:
    goto LABEL_6;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationDragItemProvider itemProviderWithAnnotation:propertyProvider:](AEAnnotationDragItemProvider, "itemProviderWithAnnotation:propertyProvider:", v13, self));
  v17 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v16);
  v18 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v17);

  if (v18)
  {
    v19 = v18;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));

    goto LABEL_7;
  }
LABEL_6:
  v14 = &__NSArray0__struct;
LABEL_7:

  return v14;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[BKTOCContentViewController _bkTableView:itemsForBeginningDragSession:atIndexPath:](self, "_bkTableView:itemsForBeginningDragSession:atIndexPath:", a3, a4, a5);
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[BKTOCContentViewController _bkTableView:itemsForBeginningDragSession:atIndexPath:](self, "_bkTableView:itemsForBeginningDragSession:atIndexPath:", a3, a4, a5, a6.x, a6.y);
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BKTOCBookmarksDescription *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  BKTOCBookmarksDescription *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  if (-[BKTOCContentViewController isViewLoaded](self, "isViewLoaded")
    && -[BKTOCContentViewController isVisible](self, "isVisible"))
  {
    -[BKTOCContentViewController _updateContentInsets](self, "_updateContentInsets");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "contentInset");
    -[BKContentViewController contentInsets](self, "contentInsets");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setContentInset:");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    objc_msgSend(v3, "bounds");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setFrame:");

    -[BKContentViewController separatorInsets](self, "separatorInsets");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setSeparatorInset:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewWithTag:", 9999));

    objc_msgSend(v51, "removeFromSuperview");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setAlpha:", 1.0);
    if (!-[BKTOCViewController tocContentType](self, "tocContentType"))
      goto LABEL_13;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
      goto LABEL_13;
    objc_msgSend(*(id *)((char *)&self->_sharedWebView + 4), "removeFromSuperview");
    v8 = objc_alloc_init(BKTOCBookmarksDescription);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BKTOCBookmarksDescription setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle2));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignSerif));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v11, 0.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](v8, "titleLabel"));
    objc_msgSend(v14, "setFont:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](v8, "descriptionLabel"));
    objc_msgSend(v15, "setFont:", v13);

    v49 = (void *)v11;
    v50 = v10;
    if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") == (char *)&dword_0 + 1)
    {
      v16 = AEBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("No Bookmarks"), &stru_1C3088, 0));

      v19 = AEBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      v22 = CFSTR("Tap a page you want to bookmark, tap the menu icon, then tap the bookmark button.");
    }
    else
    {
      if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") != (char *)&dword_0 + 2)
      {
        v26 = 0;
        v18 = 0;
        goto LABEL_12;
      }
      v23 = AEBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("No Highlights or Notes"), &stru_1C3088, 0));

      v25 = AEBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v21 = v20;
      v22 = CFSTR("Tap and hold on a word. You can extend the selection to include an entire passage. Then tap “Highlight” or “Note”. You can add notes to highlighted passages later by tapping the highlight and then “Note”.");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1C3088, 0));

LABEL_12:
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](v8, "titleLabel"));
    objc_msgSend(v27, "setText:", v18);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](v8, "descriptionLabel"));
    objc_msgSend(v28, "setText:", v26);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController themePage](self, "themePage"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "secondaryTextColor"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](v8, "titleLabel"));
    objc_msgSend(v31, "setTextColor:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](v8, "descriptionLabel"));
    objc_msgSend(v32, "setTextColor:", v30);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    objc_msgSend(v33, "bounds");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    -[BKContentViewController contentInsets](self, "contentInsets");
    -[BKTOCBookmarksDescription setFrame:](v8, "setFrame:", v35 + v45, v37 + v42, v39 - (v45 + v43), v41 - (v42 + v44));

    -[BKTOCBookmarksDescription setTag:](v8, "setTag:", 9999);
    v46 = *(WKWebView **)((char *)&self->_sharedWebView + 4);
    *(WKWebView **)((char *)&self->_sharedWebView + 4) = (WKWebView *)v8;
    v47 = v8;

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    objc_msgSend(v48, "addSubview:", v47);

    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setAlpha:", 0.0);
LABEL_13:
    -[BKTOCContentViewController showRowForCurrentLocation](self, "showRowForCurrentLocation");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKTOCContentViewController;
  -[BKTOCViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[BKTOCContentViewController updateView](self, "updateView");
  -[BKTOCContentViewController reload](self, "reload");
  if ((objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathForSelectedRow"));
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "deselectRowAtIndexPath:animated:", v4, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKTOCContentViewController;
  -[BKTOCViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.5));
  v5 = *(void **)(&self->_isProgrammaticScrolling + 4);
  *(_QWORD *)(&self->_isProgrammaticScrolling + 4) = v4;

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  if (!BYTE4(self->_recenteredIndexPath))
  {
    v5 = *(void **)(&self->_isProgrammaticScrolling + 4);
    if (v5)
    {
      v7 = v4;
      objc_msgSend(v5, "timeIntervalSinceNow");
      v4 = v7;
      if (v6 <= 0.0)
        BYTE4(self->_readyForUserScrollDate) = 1;
    }
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BKTOCContentViewController;
  v7 = a4;
  -[BKTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[BKTOCContentViewController _dumpCachedWebContentAndReload](self, "_dumpCachedWebContentAndReload");
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_73818;
  v9[3] = &unk_1BE8C8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_738D0;
  v8[3] = &unk_1BE8C8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)_dumpCachedWebContentAndReload
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController requestToIndexPath](self, "requestToIndexPath"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController cachedRowContents](self, "cachedRowContents"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController imageCache](self, "imageCache"));
  objc_msgSend(v5, "removeAllObjects");

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKTOCContentViewController;
  -[BKTOCContentViewController viewIsAppearing:](&v7, "viewIsAppearing:", a3);
  v4 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  if (v4)
  {
    objc_msgSend(v4, "contentInset");
    v6 = v5;
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "contentInset");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setScrollIndicatorInsets:", v6, 0.0);
    v4 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  }
  objc_msgSend(v4, "flashScrollIndicators");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[BKTOCContentViewController updateView](self, "updateView");
  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  -[BKTOCContentViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
}

- (int64_t)pageNumberForCurrentLocation
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tocViewControllerCurrentLocation:", self));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v6 = (int64_t)objc_msgSend(v5, "directoryContent:pageNumberForLocation:", self, v4);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)indexPathOfLastRow
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "sections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objects"));
        v12 = (char *)objc_msgSend(v11, "count");

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController
                                                                             + 4), "sections"));
          v14 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v12 - 1, objc_msgSend(v13, "indexOfObject:", v10)));

          v7 = (void *)v14;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tocIndexPathForRowNearestPageNumber:(int64_t)a3
{
  char v4;

  v4 = 0;
  return (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController _indexPathForRowNearestPageNumber:pageNumberForObjectSelector:isExactPageMatch:](self, "_indexPathForRowNearestPageNumber:pageNumberForObjectSelector:isExactPageMatch:", a3, "tocViewController:pageNumberForChapter:", &v4));
}

- (id)annotationIndexPathForRowNearestPageNumber:(int64_t)a3 isExactPageMatch:(BOOL *)a4
{
  return -[BKTOCContentViewController _indexPathForRowNearestPageNumber:pageNumberForObjectSelector:isExactPageMatch:](self, "_indexPathForRowNearestPageNumber:pageNumberForObjectSelector:isExactPageMatch:", a3, "tocViewController:pageNumberForAnnotation:", a4);
}

- (id)_indexPathForRowNearestPageNumber:(int64_t)a3 pageNumberForObjectSelector:(SEL)a4 isExactPageMatch:(BOOL *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  char *v18;
  void *v19;
  id v20;
  char *v21;
  char *v22;
  void *v23;
  id obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "sections"));
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v29 = v7;
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v32;
LABEL_8:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
            v16 = objc_msgSend(v15, a4, self, v14);

            if ((uint64_t)v16 >= a3)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
              v18 = (char *)objc_msgSend(v17, "indexOfObject:", v14);

              if (v16 == (id)a3)
              {
                *a5 = 1;
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController
                                                                                   + 4), "sections"));
                v20 = objc_msgSend(v19, "indexOfObject:", v8);
                v21 = v18;
                goto LABEL_22;
              }
              if ((uint64_t)v16 > a3)
                break;
            }
            if (v11 == (id)++v13)
            {
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v11)
                goto LABEL_8;
              goto LABEL_16;
            }
          }
          if (v18)
            v22 = v18 - 1;
          else
            v22 = 0;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController
                                                                             + 4), "sections"));
          v20 = objc_msgSend(v19, "indexOfObject:", v8);
          v21 = v22;
LABEL_22:
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v21, v20));

          if (!v23)
            goto LABEL_23;

          return v23;
        }
LABEL_16:

LABEL_23:
        v7 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v28)
        continue;
      break;
    }
  }

  return (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController indexPathOfLastRow](self, "indexPathOfLastRow"));
}

- (BOOL)showRowForCurrentLocation
{
  void *v3;
  id v4;
  int64_t v5;
  int64_t v6;
  id v7;
  void *v8;
  id v10;
  NSObject *v11;
  char v12;
  uint8_t buf[4];
  id v14;

  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "fetchedObjects"));
  if (!objc_msgSend(v3, "count"))
  {

LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections");

  if ((uint64_t)v4 < 1)
    goto LABEL_8;
  v5 = -[BKTOCContentViewController pageNumberForCurrentLocation](self, "pageNumberForCurrentLocation");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  v6 = v5;
  if (-[BKTOCViewController tocContentType](self, "tocContentType"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController annotationIndexPathForRowNearestPageNumber:isExactPageMatch:](self, "annotationIndexPathForRowNearestPageNumber:isExactPageMatch:", v6, &v12));
    if (!v12)
    {
LABEL_9:
      v8 = 0;
      if (!v7)
        goto LABEL_12;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController tocIndexPathForRowNearestPageNumber:](self, "tocIndexPathForRowNearestPageNumber:", v6));
    v12 = 1;
  }
  v7 = v7;
  if (!v7)
    goto LABEL_9;
  if ((objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing") & 1) == 0)
  {
    v10 = BKTOCCVCLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Highlighting row at %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "selectRowAtIndexPath:animated:scrollPosition:", v7, 1, 0);
  }
  v8 = v7;
LABEL_10:
  if (!BYTE4(self->_readyForUserScrollDate))
  {
    BYTE4(self->_recenteredIndexPath) = 1;
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 2, 0);
    BYTE4(self->_recenteredIndexPath) = 0;
  }
LABEL_12:

  return v7 != 0;
}

- (void)removeHighlightFromCurrentLocation
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "cellForRowAtIndexPath:", v9, v13));
        v11 = BKTOCCVCLog();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v13;
          v19 = v9;
          _os_log_debug_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "Removing highlight from cell at:%@", buf, 0xCu);
        }

        objc_msgSend(v10, "setSelected:animated:", 0, 1);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

}

- (BKActivityIndicatorOverlayView)activityIndicatorOverlayView
{
  void *v3;
  BKActivityIndicatorOverlayView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BKActivityIndicatorOverlayView *v10;
  void *v11;

  v3 = *(void **)((char *)&self->_cellLoadingOperationCount + 4);
  if (!v3)
  {
    v4 = [BKActivityIndicatorOverlayView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController theme](self, "theme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentTextColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.7));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController theme](self, "theme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColorForTraitEnvironment:", self));
    v10 = -[BKActivityIndicatorOverlayView initWithBackgroundColor:foregroundColor:](v4, "initWithBackgroundColor:foregroundColor:", v7, v9);
    v11 = *(void **)((char *)&self->_cellLoadingOperationCount + 4);
    *(int64_t *)((char *)&self->_cellLoadingOperationCount + 4) = (int64_t)v10;

    v3 = *(void **)((char *)&self->_cellLoadingOperationCount + 4);
  }
  return (BKActivityIndicatorOverlayView *)v3;
}

- (void)setCellLoadingOperationCount:(int64_t)a3
{
  *(_QWORD *)((char *)&self->_preferredFontSize + 4) = a3 & ~(a3 >> 63);
  if (a3 < 1)
    -[BKTOCContentViewController _hideActivityIndicator](self, "_hideActivityIndicator");
  else
    -[BKTOCContentViewController _showActivityIndicator](self, "_showActivityIndicator");
}

- (void)_showActivityIndicator
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController activityIndicatorOverlayView](self, "activityIndicatorOverlayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right
                                                                    + 4), "superview"));
  objc_msgSend(v4, "showIndicatorCenteredInView:animated:animationDelay:", v3, 1, 0.0);

}

- (void)_hideActivityIndicator
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 250000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_744A8;
  v3[3] = &unk_1C0788;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)fontFamily
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "familyName"));

  return v3;
}

- (id)pageTitleForChapter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && (BYTE4(self->super._fetchedResultsController) & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tocViewController:pageTitleForChapter:", self, v4));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pageTitleForAnnotation:(id)a3
{
  void *v3;
  id v5;
  void *v6;

  if ((BYTE4(self->super._fetchedResultsController) & 4) != 0)
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tocViewController:pageTitleForAnnotation:", self, v5));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)calculateFontSize
{
  double v3;
  double result;
  objc_super v5;

  -[BKTOCContentViewController preferredFontSize](self, "preferredFontSize");
  if (v3 == 0.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKTOCContentViewController;
    -[BKTOCViewController calculateFontSize](&v5, "calculateFontSize");
  }
  else
  {
    -[BKTOCContentViewController preferredFontSize](self, "preferredFontSize");
  }
  return result;
}

- (id)fontForChapter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[BKTOCViewController establishChapterFonts](self, "establishChapterFonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indentationLevel"));

  v6 = objc_msgSend(v5, "integerValue");
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterSubLevelFont](self, "chapterSubLevelFont"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterTopLevelFont](self, "chapterTopLevelFont"));
  return v7;
}

- (BOOL)p_willUseWebViewForCellWithChapter:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "htmlName"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("<[^/s]"), 0, 0));
    v5 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_configureTOCCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  char *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double Width;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  CGRect v63;

  v62 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchedObjects"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexPath:", v6));

  }
  else
  {
    v10 = 0;
  }
  if ((objc_msgSend(v10, "isExcludedFromSample") & 1) != 0)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController pageTitleForChapter:](self, "pageTitleForChapter:", v10));
  -[BKContentViewController contentInsets](self, "contentInsets");
  v13 = v12;
  -[BKContentViewController contentInsets](self, "contentInsets");
  objc_msgSend(v62, "setContentInsets:", 0.0, v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v15 = objc_msgSend(v14, "length");
  if (v15)
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  else
    v16 = CFSTR(" ");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
  objc_msgSend(v17, "setText:", v16);

  if (v15)
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fontForChapter:](self, "fontForChapter:", v10));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
  objc_msgSend(v19, "setFont:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
  objc_msgSend(v20, "setLineBreakMode:", 0);

  if (objc_msgSend(v10, "isExcludedFromSample"))
    v21 = 0.5;
  else
    v21 = 1.0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
  objc_msgSend(v22, "setAlpha:", v21);

  objc_msgSend(v62, "setBkaxIsExcludedFromSample:", objc_msgSend(v10, "isExcludedFromSample"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
  objc_msgSend(v23, "setNumberOfLines:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indentationLevel"));
  objc_msgSend(v62, "setIndentationLevel:", objc_msgSend(v24, "integerValue"));

  objc_msgSend(v62, "setIndentationWidth:", 16.0);
  v25 = (char *)objc_msgSend(v62, "effectiveUserInterfaceLayoutDirection");
  -[BKContentViewController separatorInsets](self, "separatorInsets");
  v27 = v26;
  v28 = (double)(uint64_t)objc_msgSend(v62, "indentationLevel");
  objc_msgSend(v62, "indentationWidth");
  v30 = v27 + v28 * v29;
  -[BKContentViewController separatorInsets](self, "separatorInsets");
  if (v25 == (_BYTE *)&dword_0 + 1)
    v32 = v30;
  else
    v32 = v31;
  if (v25 == (_BYTE *)&dword_0 + 1)
    v33 = v31;
  else
    v33 = v30;
  objc_msgSend(v62, "setSeparatorInset:", 0.0, v33, 0.0, v32);
  if (-[BKTOCContentViewController p_willUseWebViewForCellWithChapter:](self, "p_willUseWebViewForCellWithChapter:", v10))
  {
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "bounds");
    Width = CGRectGetWidth(v63);
    -[BKContentViewController contentInsets](self, "contentInsets");
    v37 = Width - (v35 + v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indentationLevel"));
    v39 = (int)objc_msgSend(v38, "intValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
    v61 = v8;
    v41 = v6;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "font"));
    +[BKTOCTableViewCell maxSpanForTextWithIndentation:font:width:](BKTOCTableViewCell, "maxSpanForTextWithIndentation:font:width:", v39, v42, v37);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "tocPageHref"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "urlForHref:", v44));

    v46 = BEURLHandleriBooksImgUrlFromiBooksURL(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "htmlName"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "font"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "fontName"));
    -[BKTOCContentViewController calculateFontSize](self, "calculateFontSize");
    objc_msgSend(v62, "displayHTMLWithContents:fontFamily:fontSize:maxSpan:baseURL:", v48, v51, v47);

    v6 = v41;
    v8 = v61;

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "pageLabel"));
  v53 = v52;
  if (v11)
  {
    objc_msgSend(v52, "setText:", v11);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController pageLabelFont](self, "pageLabelFont"));
    objc_msgSend(v53, "setFont:", v54);

  }
  objc_msgSend(v53, "setHidden:", v11 == 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController themePage](self, "themePage"));
  objc_msgSend(v62, "configureSelectedBackgroundView");
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right
                                                                     + 4), "backgroundColor"));
  objc_msgSend(v62, "setBackgroundColor:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "primaryTextColor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "textLabel"));
  objc_msgSend(v58, "setTextColor:", v57);

  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "tocPageNumberTextColor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "pageLabel"));
  objc_msgSend(v60, "setTextColor:", v59);

}

- (void)_configureWebTOCCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double Width;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  CGRect v87;
  CGRect v88;

  v86 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController imageCache](self, "imageCache"));
  objc_msgSend(v86, "setImageCache:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right
                                                                    + 4), "backgroundColor"));
  objc_msgSend(v86, "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fetchedObjects"));

  v83 = (void *)v10;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexPath:", v6));

  }
  else
  {
    v12 = 0;
  }
  if ((objc_msgSend(v12, "isExcludedFromSample") & 1) != 0)
    v13 = 0;
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController pageTitleForChapter:](self, "pageTitleForChapter:", v12));
  v84 = v6;
  -[BKContentViewController separatorInsets](self, "separatorInsets");
  v15 = v14;
  v16 = (double)(uint64_t)objc_msgSend(v86, "indentationLevel");
  objc_msgSend(v86, "indentationWidth");
  v18 = v15 + v16 * v17;
  -[BKContentViewController separatorInsets](self, "separatorInsets");
  v20 = v19;
  v21 = (char *)objc_msgSend(v86, "effectiveUserInterfaceLayoutDirection");
  if (v21 == (_BYTE *)&dword_0 + 1)
    v22 = v18;
  else
    v22 = v20;
  if (v21 == (_BYTE *)&dword_0 + 1)
    v23 = v20;
  else
    v23 = v18;
  objc_msgSend(v86, "setSeparatorInset:", 0.0, v23, 0.0, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "pageLabel"));
  v25 = objc_msgSend(v13, "length");
  if (v25)
  {
    objc_msgSend(v24, "setText:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController pageLabelFont](self, "pageLabelFont"));
    objc_msgSend(v24, "setFont:", v26);

  }
  v81 = v13;
  objc_msgSend(v24, "setHidden:", v25 == 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController themePage](self, "themePage"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tocPageNumberTextColor"));
  v80 = v24;
  objc_msgSend(v24, "setTextColor:", v28);

  v79 = v27;
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "primaryTextColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fontForChapter:](self, "fontForChapter:", v12));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "textLabel"));
  objc_msgSend(v30, "setFont:", v29);

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "safeAreaInsets");
  v40 = v34 + v39;
  v43 = v36 - (v41 + v42);
  v87.size.height = v38 - (v39 + v44);
  v87.origin.x = v32 + v41;
  v87.origin.y = v40;
  v87.size.width = v43;
  Width = CGRectGetWidth(v87);
  -[BKContentViewController contentInsets](self, "contentInsets");
  v48 = Width - (v46 + v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indentationLevel"));
  v50 = (int)objc_msgSend(v49, "intValue");
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "textLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "font"));
  +[BKTOCTableViewCell maxSpanForTextWithIndentation:font:width:](BKTOCTableViewCell, "maxSpanForTextWithIndentation:font:width:", v50, v52, v48);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "pageLabel"));
  objc_msgSend(v53, "sizeToFit");

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "pageLabel"));
  objc_msgSend(v54, "frame");
  CGRectGetWidth(v88);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "tocPageHref"));
  v78 = v55;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "urlForHref:", v56));

  v58 = BEURLHandleriBooksImgUrlFromiBooksURL(v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "contentView"));
  objc_msgSend(v61, "setBackgroundColor:", v60);

  v82 = v12;
  v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "htmlName"));
  v63 = (void *)v62;
  if (v62)
    v64 = (const __CFString *)v62;
  else
    v64 = &stru_1C3088;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController template](self, "template"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "textLabel"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "font"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "fontName"));
  -[BKTOCContentViewController calculateFontSize](self, "calculateFontSize");
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[BKTOCWebViewCellLoadRequest loadRequestWithContents:template:fontFamily:fontSize:maxSpan:textColor:selectedColor:backgroundColor:baseURL:forObject:](BKTOCWebViewCellLoadRequest, "loadRequestWithContents:template:fontFamily:fontSize:maxSpan:textColor:selectedColor:backgroundColor:baseURL:forObject:", v64, v65, v68, v85, v85, v60, v59, self));

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController cachedRowContents](self, "cachedRowContents"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", v84));

  if (!v71
    || (v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController imageCache](self, "imageCache")),
        v73 = objc_msgSend(v72, "entryForRequest:", v69),
        v72,
        (v73 & 1) == 0))
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController requestToIndexPath](self, "requestToIndexPath"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "cacheKey"));
    objc_msgSend(v74, "setObject:forKeyedSubscript:", v84, v75);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController requestQueue](self, "requestQueue"));
    objc_msgSend(v76, "enqueueRequest:", v69);

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "cacheKey"));
  objc_msgSend(v86, "setCacheKey:", v77);

}

- (id)highlightedTextLabelFont
{
  double v3;
  double v4;
  void *v5;
  void *v6;

  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
    +[BKTOCRangeAnnotationTableCell highlightedTextSizeInPopover](BKTOCRangeAnnotationTableCell, "highlightedTextSizeInPopover");
  else
    +[BKTOCRangeAnnotationTableCell pageNumberAndHighlightedTextFontSize](BKTOCRangeAnnotationTableCell, "pageNumberAndHighlightedTextFontSize");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fontFamily](self, "fontFamily"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v5, v4));

  return v6;
}

- (void)_configureRangeAnnotationCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  id v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexPath:", v6));

  -[BKTOCContentViewController _configureAnnotationCell:forAnnotation:forRowAtIndexPath:](self, "_configureAnnotationCell:forAnnotation:forRowAtIndexPath:", v28, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationNote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteLabel"));
  objc_msgSend(v10, "setText:", v9);

  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
  {
    *(_QWORD *)&v11 = objc_opt_class(v28).n128_u64[0];
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteFontForPopover", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteLabel"));
    objc_msgSend(v14, "setFont:", v13);
  }
  else
  {
    v13 = objc_alloc_init((Class)AEAnnotationTheme);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteTextFontInTable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteLabel"));
    objc_msgSend(v15, "setFont:", v14);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteLabel"));
  objc_msgSend(v16, "setLineBreakMode:", 4);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "highlightedTextLabel"));
  objc_msgSend(v17, "setAnnotation:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController highlightedTextLabelFont](self, "highlightedTextLabelFont"));
  objc_msgSend(v17, "setFont:", v18);

  objc_msgSend(v17, "setNeedsLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController themePage](self, "themePage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right
                                                                     + 4), "backgroundColor"));
  objc_msgSend(v28, "configureSelectedBackgroundView");
  objc_msgSend(v28, "setBackgroundColor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "primaryTextColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "textLabel"));
  objc_msgSend(v22, "setTextColor:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteLabel"));
  objc_msgSend(v23, "setTextColor:", v21);

  objc_msgSend(v17, "setTextColor:", v21);
  objc_msgSend(v17, "setHighlightedTextColor:", v21);
  objc_msgSend(v17, "setBackgroundColor:", v20);
  objc_msgSend(v17, "setShouldInvertContent:", objc_msgSend(v19, "shouldInvertContent"));
  objc_msgSend(v17, "setAnnotationBlendMode:", objc_msgSend(v19, "annotationBlendMode"));
  objc_msgSend(v17, "setHighlightedAnnotationBlendMode:", objc_msgSend(v19, "highlightedAnnotationBlendMode"));
  objc_msgSend(v17, "setPageTheme:", objc_msgSend(v19, "annotationPageTheme"));
  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "secondaryTextColor"));
  else
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tocPageNumberTextColor"));
  v25 = (void *)v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pageLabel"));
  objc_msgSend(v26, "setTextColor:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateLabel"));
  objc_msgSend(v27, "setTextColor:", v25);

}

- (void)_configurePointAnnotationCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v6 = a4;
  -[BKContentViewController contentInsets](self, "contentInsets");
  v8 = v7;
  -[BKContentViewController contentInsets](self, "contentInsets");
  objc_msgSend(v32, "setContentInsets:", 0.0, v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexPath:", v6));

  -[BKTOCContentViewController _configureAnnotationCell:forAnnotation:forRowAtIndexPath:](self, "_configureAnnotationCell:forAnnotation:forRowAtIndexPath:", v32, v10, v6);
  if ((BYTE4(self->super._fetchedResultsController) & 8) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tocViewController:chapterTitleForAnnotation:", self, v10));

  }
  else
  {
    v11 = 0;
  }
  if (!objc_msgSend(v11, "length"))
  {
    v13 = AEBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("No title"), &stru_1C3088, 0));

    v11 = (void *)v15;
  }
  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
  {
    *(_QWORD *)&v16 = objc_opt_class(v32).n128_u64[0];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chapterFontForPopover", v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "noteLabel"));
    objc_msgSend(v19, "bkSetText:font:lineBreakMode:", v11, v18, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "noteLabel"));
    objc_msgSend(v20, "setNumberOfLines:", 2);
  }
  else
  {
    *(_QWORD *)&v21 = objc_opt_class(v32).n128_u64[0];
    objc_msgSend(v22, "titleFontSize", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "noteLabel"));
    objc_msgSend(v23, "bkSetText:font:lineBreakMode:", v11, v18, 5);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "noteLabel"));
    objc_msgSend(v24, "setNumberOfLines:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "noteLabel"));
    objc_msgSend(v20, "setLineBreakMode:", 5);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController themePage](self, "themePage"));
  objc_msgSend(v32, "configureSelectedBackgroundView");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right
                                                                     + 4), "backgroundColor"));
  objc_msgSend(v32, "setBackgroundColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "primaryTextColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "noteLabel"));
  objc_msgSend(v28, "setTextColor:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "secondaryTextColor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pageLabel"));
  objc_msgSend(v30, "setTextColor:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dateLabel"));
  objc_msgSend(v31, "setTextColor:", v29);

}

- (void)_configureAnnotationCell:(id)a3 forAnnotation:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v7 = a4;
  v8 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController pageTitleForAnnotation:](self, "pageTitleForAnnotation:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController dateFormatter](self, "dateFormatter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "annotationCreationDate"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));
  -[BKContentViewController contentInsets](self, "contentInsets");
  v13 = v12;
  -[BKContentViewController contentInsets](self, "contentInsets");
  objc_msgSend(v8, "configureWithPageString:dateString:insets:", v14, v11, 0.0, v13, 0.0);

}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    objc_msgSend(v10, "setVertical:", 0);
    objc_opt_class(BKTOCPointAnnotationTableCell);
    if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0)
    {
      -[BKTOCContentViewController _configurePointAnnotationCell:forRowAtIndexPath:](self, "_configurePointAnnotationCell:forRowAtIndexPath:", v10, v6);
    }
    else
    {
      objc_opt_class(BKTOCRangeAnnotationTableCell);
      if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
      {
        -[BKTOCContentViewController _configureRangeAnnotationCell:forRowAtIndexPath:](self, "_configureRangeAnnotationCell:forRowAtIndexPath:", v10, v6);
      }
      else
      {
        objc_opt_class(BKTOCWebViewTableViewCell);
        if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
          -[BKTOCContentViewController _configureWebTOCCell:forRowAtIndexPath:](self, "_configureWebTOCCell:forRowAtIndexPath:", v10, v6);
        else
          -[BKTOCContentViewController _configureTOCCell:forRowAtIndexPath:](self, "_configureTOCCell:forRowAtIndexPath:", v10, v6);
      }
    }
    objc_msgSend(v10, "setNeedsLayout");
  }

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v13;
  _QWORD v14[2];

  v5 = a4;
  if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") == (char *)&dword_0 + 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController deleteSwipeAction:](self, "deleteSwipeAction:", v5));
    v14[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController shareSwipeAction:](self, "shareSwipeAction:", v5));
    v14[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));

  }
  else
  {
    if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") != (char *)&dword_0 + 1)
    {
      v10 = BKTOCCVCLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_11CBA4(v11);

      v8 = 0;
      goto LABEL_10;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController deleteSwipeAction:](self, "deleteSwipeAction:", v5));
    v13 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  }

  if (!v8)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v8));
  objc_msgSend(v9, "setPerformsFirstActionWithFullSwipe:", 0);
LABEL_11:

  return v9;
}

- (id)shareSwipeAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_75D58;
  v10[3] = &unk_1C07B0;
  objc_copyWeak(&v12, &location);
  v5 = v4;
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 0, 0, v10));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
  objc_msgSend(v6, "setImage:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

- (id)deleteSwipeAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_75ED4;
  v9[3] = &unk_1C07B0;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, 0, v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash.fill")));
  objc_msgSend(v6, "setImage:", v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sections"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a4));

  v8 = objc_msgSend(v7, "numberOfObjects");
  return (int64_t)v8;
}

- (id)reuseIdentifier
{
  return -[BKTOCContentViewController reuseIdentifierForCellType:](self, "reuseIdentifierForCellType:", -[BKTOCViewController tocContentType](self, "tocContentType"));
}

- (id)reuseIdentifierForCellType:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1C0870[a3];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  v8 = -[BKTOCViewController tocContentType](self, "tocContentType");
  v9 = v8 == 2;
  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchedObjects"));

      if (v12)
      {
        *(_QWORD *)&v13 = objc_opt_class(BKNavigationInfo).n128_u64[0];
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController", v13));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexPath:", v6));
        v18 = BUDynamicCast(v15, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v18);

      }
    }
    else
    {
      v12 = 0;
    }
    if (-[BKTOCContentViewController p_willUseWebViewForCellWithChapter:](self, "p_willUseWebViewForCellWithChapter:", v12))
    {
      v9 = 3;
    }
    else
    {
      v9 = 2;
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController reuseIdentifierForCellType:](self, "reuseIdentifierForCellType:", v9));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v19));

  objc_msgSend(v20, "setUsesPopoverStyle:", -[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"));
  -[BKTOCContentViewController configureCell:atIndexPath:](self, "configureCell:atIndexPath:", v20, v6);

  return v20;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  int64_t v4;
  double result;

  v4 = -[BKTOCViewController tocContentType](self, "tocContentType", a3, a4);
  result = 67.0;
  if (!v4)
    return 52.0;
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double Width;
  void *v25;
  double v26;
  int64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  void *v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double MaxY;
  double v96;
  double v97;
  double v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat r2;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  void *v123;
  id v124;
  double v125;
  double y;
  void *v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v6 = a3;
  v7 = a4;
  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
    v8 = 0.0;
  else
    v8 = 52.0;
  height = CGSizeZero.height;
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[BKContentViewController contentInsets](self, "contentInsets");
  v19 = v13 + v18;
  v22 = v15 - (v20 + v21);
  v128.size.height = v17 - (v18 + v23);
  v128.origin.x = v11 + v20;
  v128.origin.y = v19;
  v128.size.width = v22;
  Width = CGRectGetWidth(v128);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right
                                                                     + 4), "readableContentGuide"));
  objc_msgSend(v25, "layoutFrame");
  v26 = CGRectGetWidth(v129);

  if (Width >= v26)
    Width = v26;
  v27 = -[BKTOCViewController tocContentType](self, "tocContentType");
  if (v27 == 1)
  {
    v8 = 73.0;
    if (!-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
      goto LABEL_37;
    if (Width <= 0.0)
      goto LABEL_37;
    v34 = objc_msgSend(v7, "row");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "fetchedObjects"));
    v37 = objc_msgSend(v36, "count");

    if (v34 >= v37)
      goto LABEL_37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexPath:", v7));

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "tocViewController:chapterTitleForAnnotation:", self, v33));

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController dateFormatter](self, "dateFormatter"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "annotationCreationDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringFromDate:", v42));

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController pageTitleForAnnotation:](self, "pageTitleForAnnotation:", v33));
    +[BKTOCPointAnnotationTableCell cellHeightForCellWidth:chapterString:dateString:pageString:layoutDirection:](BKTOCPointAnnotationTableCell, "cellHeightForCellWidth:chapterString:dateString:pageString:layoutDirection:", v40, v43, v44, -[BKViewController layoutDirection](self, "layoutDirection"), Width);
    v8 = v45;

  }
  else if (v27)
  {
    if (objc_msgSend(v6, "isEditing"))
      v46 = 38.0;
    else
      v46 = 0.0;
    v47 = objc_msgSend(v7, "row");
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "fetchedObjects"));
    v50 = objc_msgSend(v49, "count");

    if (v47 >= v50)
    {
      v8 = 67.0;
      goto LABEL_37;
    }
    v125 = Width - v46;
    y = CGRectZero.origin.y;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectAtIndexPath:", v7));

    v52 = objc_alloc_init((Class)AEAnnotationTheme);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController pageTitleForAnnotation:](self, "pageTitleForAnnotation:", v33));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController dateFormatter](self, "dateFormatter"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "annotationCreationDate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringFromDate:", v55));

    if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
    {
      v57 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController highlightedTextLabelFont](self, "highlightedTextLabelFont"));
      +[BKTOCRangeAnnotationTableCell cellHeightInPopoverForBounds:highlightFont:annotation:dateString:pageString:layoutDirection:](BKTOCRangeAnnotationTableCell, "cellHeightInPopoverForBounds:highlightFont:annotation:dateString:pageString:layoutDirection:", v57, v33, v56, v53, -[BKViewController layoutDirection](self, "layoutDirection"), CGRectZero.origin.x, y, v125, 67.0);
      height = v58;
    }
    else
    {
      +[BKTOCRangeAnnotationTableCell pageNumberAndHighlightedTextFontSize](BKTOCRangeAnnotationTableCell, "pageNumberAndHighlightedTextFontSize");
      v63 = v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fontFamily](self, "fontFamily"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v64, v63));

      if (!v65)
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v63));
      v57 = v65;
      +[BKTOCTableViewCell pageLabelFrameForString:font:bounds:layoutDirection:](BKTOCRangeAnnotationTableCell, "pageLabelFrameForString:font:bounds:layoutDirection:", v53, v57, -[BKViewController layoutDirection](self, "layoutDirection"), CGRectZero.origin.x, y, v125, 67.0);
      v114 = v66;
      v68 = v67;
      v70 = v69;
      v72 = v71;
      +[BKTOCRangeAnnotationTableCell highlightedTextFrameForAnnotation:font:bounds:pageLabelFrame:layoutDirection:](BKTOCRangeAnnotationTableCell, "highlightedTextFrameForAnnotation:font:bounds:pageLabelFrame:layoutDirection:", v33, v57, -[BKViewController layoutDirection](self, "layoutDirection"), CGRectZero.origin.x, y, v125, 67.0, v66, v67, v69, v71);
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v80 = v79;
      v124 = v52;
      v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "noteTextFontInTable"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "annotationNote"));
      v121 = v76;
      v122 = v74;
      r2 = v80;
      v120 = v78;
      v123 = (void *)v81;
      +[BKTOCRangeAnnotationTableCell noteTextFrameForString:font:bounds:highlightedTextFrame:pageLabelFrame:](BKTOCRangeAnnotationTableCell, "noteTextFrameForString:font:bounds:highlightedTextFrame:pageLabelFrame:", v82, v81, CGRectZero.origin.x, y, v125, 67.0, v74, v76, v78, v80, *(_QWORD *)&v114, *(_QWORD *)&v68, *(_QWORD *)&v70, *(_QWORD *)&v72);
      v84 = v83;
      v86 = v85;
      v88 = v87;
      v90 = v89;

      +[BKTOCAnnotationTableCell dateFontSize](BKTOCRangeAnnotationTableCell, "dateFontSize");
      v92 = v91;
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fontFamily](self, "fontFamily"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v93, v92));

      if (!v94)
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v92));
      v130.origin.x = v84;
      v130.origin.y = v86;
      v130.size.width = v88;
      v130.size.height = v90;
      MaxY = CGRectGetMaxY(v130);
      v131.origin.x = v114;
      v131.origin.y = v68;
      v131.size.width = v70;
      v131.size.height = v72;
      v96 = CGRectGetMaxY(v131);
      if (MaxY >= v96)
        v96 = MaxY;
      v116 = v86;
      v115 = v88;
      +[BKTOCRangeAnnotationTableCell dateLabelFrameForString:font:bounds:minY:layoutDirection:](BKTOCRangeAnnotationTableCell, "dateLabelFrameForString:font:bounds:minY:layoutDirection:", v56, v94, -[BKViewController layoutDirection](self, "layoutDirection"), CGRectZero.origin.x, y, v125, 67.0, v96);
      v117 = v98;
      v118 = v97;
      v100 = v99;
      v132.origin.y = y;
      v102 = v101;
      v132.origin.x = CGRectZero.origin.x;
      v132.size.width = v125;
      v132.size.height = 67.0;
      v138.origin.x = v114;
      v138.origin.y = v68;
      v138.size.width = v70;
      v138.size.height = v72;
      v133 = CGRectUnion(v132, v138);
      v139.origin.x = v122;
      v139.size.width = v120;
      v139.origin.y = v121;
      v139.size.height = r2;
      v134 = CGRectUnion(v133, v139);
      v140.origin.x = v84;
      v140.size.height = v90;
      v140.size.width = v115;
      v140.origin.y = v116;
      v135 = CGRectUnion(v134, v140);
      v141.size.height = v117;
      v141.origin.x = v118;
      v141.origin.y = v100;
      v141.size.width = v102;
      v136 = CGRectUnion(v135, v141);
      v103 = v136.size.height;
      +[BKTOCRangeAnnotationTableCell bottomPadding](BKTOCRangeAnnotationTableCell, "bottomPadding", v136.origin.x, v136.origin.y, v136.size.width);
      height = v103 + v104;

      v52 = v124;
    }

    v8 = 67.0;
  }
  else
  {
    if (Width <= 0.0)
      goto LABEL_37;
    v28 = objc_msgSend(v7, "row");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fetchedObjects"));
    v31 = objc_msgSend(v30, "count");

    if (v28 >= v31)
    {
      v33 = 0;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexPath:", v7));

    }
    if (-[BKTOCContentViewController p_willUseWebViewForCellWithChapter:](self, "p_willUseWebViewForCellWithChapter:", v33))
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController cachedRowContents](self, "cachedRowContents"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v7));
      objc_msgSend(v60, "height");
      v8 = v61;

      if (v8 < 52.0)
        v8 = 52.0;
    }
    else
    {
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fontForChapter:](self, "fontForChapter:", v33));
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController pageLabelFont](self, "pageLabelFont"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController pageTitleForChapter:](self, "pageTitleForChapter:", v33));
      +[BKTOCTableViewCell pageLabelFrameForString:font:bounds:layoutDirection:](BKTOCRangeAnnotationTableCell, "pageLabelFrameForString:font:bounds:layoutDirection:", v106, v105, -[BKViewController layoutDirection](self, "layoutDirection"), CGRectZero.origin.x, CGRectZero.origin.y, Width, v8);
      v107 = CGRectGetWidth(v137);
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "indentationLevel"));
      +[BKTOCTableViewCell cellHeightForCellWidth:pageLabelWidth:text:indentationLevel:indentationWidth:font:usesPopoverStyle:](BKTOCTableViewCell, "cellHeightForCellWidth:pageLabelWidth:text:indentationLevel:indentationWidth:font:usesPopoverStyle:", v108, objc_msgSend(v109, "integerValue"), v127, -[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"), Width, v107, 16.0);
      height = v110;

    }
  }

LABEL_37:
  v111 = ceil(height);
  if (v8 >= v111)
    v112 = v8;
  else
    v112 = v111;

  return v112;
}

- (void)tableView:(id)a3 performPrimaryActionForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  id v20;

  v5 = a4;
  v6 = BKTOCCVCLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v19 = 134217984;
    v20 = objc_msgSend(v5, "row");
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Performing primary action for row %ld", (uint8_t *)&v19, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v5));

  v10 = -[BKTOCViewController tocContentType](self, "tocContentType");
  if (v10 == 2)
  {
    v17 = v9;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "location"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationUuid"));

    -[BKDirectoryContent didSelectHighlightForLocation:annotationUUID:](self, "didSelectHighlightForLocation:annotationUUID:", v11, v16);
    goto LABEL_11;
  }
  if (v10 == 1)
  {
    v18 = v9;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "location"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "annotationUuid"));

    -[BKDirectoryContent didSelectBookmarkForLocation:annotationUUID:](self, "didSelectBookmarkForLocation:annotationUUID:", v11, v16);
    goto LABEL_11;
  }
  if (!v10 && (BYTE4(self->super._fetchedResultsController) & 1) != 0)
  {
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "href"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tocPageHref"));

    if (v12 == v14)
    {
LABEL_12:

      goto LABEL_13;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController eventEngagement](self, "eventEngagement"));
    objc_msgSend(v15, "sendReaderEventNewSectionViaToC");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v16, "tocViewController:didSelectChapter:", self, v11);
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[BKTOCContentViewController notifyBookSharingClientSelectionChanged](self, "notifyBookSharingClientSelectionChanged", a3, a4);
  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing"))
    -[BKTOCContentViewController updateToolbarContent](self, "updateToolbarContent");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  -[BKTOCContentViewController notifyBookSharingClientSelectionChanged](self, "notifyBookSharingClientSelectionChanged", a3, a4);
  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing"))
    -[BKTOCContentViewController updateToolbarContent](self, "updateToolbarContent");
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return -[BKTOCViewController tocContentType](self, "tocContentType", a3, a4) != 0;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  unsigned __int8 v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = BKTOCCVCLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_11CBE4((uint64_t)v6, v9, v10);

  v11 = objc_msgSend(v7, "isEditing");
  if ((v11 & 1) == 0)
  {
    -[BKTOCContentViewController removeHighlightFromCurrentLocation](self, "removeHighlightFromCurrentLocation");
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setEditing:animated:", 1, 1);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  objc_msgSend(v12, "tocViewControllerDidChangeEditing:", 1);

  -[BKTOCContentViewController installEditModeToolbar](self, "installEditModeToolbar");
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isEditing") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v8));
    if (v10)
    {
      v31 = v10;
      v11 = AEBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Select"), &stru_1C3088, 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle")));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_771F0;
      v43[3] = &unk_1C07D8;
      v43[4] = self;
      v15 = v8;
      v44 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v13, v14, CFSTR("context.menu.select"), v43));

      v16 = AEBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1C3088, 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_771FC;
      v41[3] = &unk_1C07D8;
      v41[4] = self;
      v20 = v15;
      v42 = v20;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v18, v19, CFSTR("context.menu.share"), v41));

      v21 = AEBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1C3088, 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_77208;
      v39[3] = &unk_1C07D8;
      v39[4] = self;
      v40 = v20;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v23, v24, CFSTR("context.menu.delete"), v39));

      objc_msgSend(v25, "setAttributes:", (unint64_t)objc_msgSend(v25, "attributes") | 2);
      v9 = 0;
      if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") == (char *)&dword_0 + 1)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_77214;
        v36[3] = &unk_1C0800;
        v37 = v25;
        v38 = v29;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v36));

      }
      if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") == (char *)&dword_0 + 2)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_77310;
        v32[3] = &unk_1C0828;
        v26 = v30;
        v33 = v30;
        v34 = v25;
        v35 = v29;
        v27 = objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v32));

        v9 = (void *)v27;
      }
      else
      {
        v26 = v30;
      }

      v10 = v31;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)beginSelectionStartingWithIndexPath:(id)a3
{
  id v4;

  v4 = a3;
  -[BKTOCContentViewController removeHighlightFromCurrentLocation](self, "removeHighlightFromCurrentLocation");
  -[BKTOCContentViewController beginEditingMode](self, "beginEditingMode");
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "selectRowAtIndexPath:animated:scrollPosition:", v4, 1, 0);

  -[BKTOCContentViewController updateToolbarContent](self, "updateToolbarContent");
}

- (id)bookmarksFetchedResultsController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  BKPaginationController *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  id v23;

  v3 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uiManagedObjectContext"));

    if (!v6)
    {
LABEL_13:

      v3 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
      return v3;
    }
    v7 = objc_alloc_init((Class)NSFetchRequest);
    if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") == (char *)&dword_0 + 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
      v9 = objc_claimAutoreleasedReturnValue(+[AEAnnotation pageBookmarksPredicate:](AEAnnotation, "pageBookmarksPredicate:", v8));
    }
    else
    {
      if ((char *)-[BKTOCViewController tocContentType](self, "tocContentType") != (char *)&dword_0 + 2)
      {
LABEL_8:
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v6));
        objc_msgSend(v7, "setEntity:", v11);

        v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("annotationLocation"), 1, "localizedStandardCompare:");
        v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("annotationCreationDate"), 1);
        v14 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v12, v13, 0);
        objc_msgSend(v7, "setSortDescriptors:", v14);
        v15 = (BKPaginationController *)objc_msgSend(objc_alloc((Class)IMUbiquitousFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v7, v6, 0, 0);
        v16 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
        *(BKPaginationController **)((char *)&self->super._paginationController + 4) = v15;

        objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "setDelegate:", self);
        v17 = *(BKPaginationController **)((char *)&self->super._paginationController + 4);
        v23 = 0;
        v18 = objc_msgSend(v17, "performFetch:", &v23);
        v19 = v23;
        if ((v18 & 1) == 0)
        {
          v20 = BKTOCCVCLog();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            sub_11C588(self, v19, v21);

        }
        goto LABEL_13;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
      v9 = objc_claimAutoreleasedReturnValue(+[AEAnnotation highlightsPredicate:](AEAnnotation, "highlightsPredicate:", v8));
    }
    v10 = (void *)v9;
    objc_msgSend(v7, "setPredicate:", v9);

    goto LABEL_8;
  }
  return v3;
}

- (id)fetchedResultsController
{
  int64_t v3;
  void *v4;
  NSFetchedResultsController *v5;
  objc_super v7;

  v3 = -[BKTOCViewController tocContentType](self, "tocContentType");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)BKTOCContentViewController;
      v5 = -[BKTOCViewController fetchedResultsController](&v7, "fetchedResultsController");
      v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController bookmarksFetchedResultsController](self, "bookmarksFetchedResultsController"));
  }
  return v4;
}

- (int)assetSharingConnectionTypeForClient:(id)a3
{
  unint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = -[BKTOCViewController tocContentType](self, "tocContentType", a3);
  if (v4 < 2)
    return 1;
  if (v4 != 2)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchedObjects"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
    return 2;
  else
    return 1;
}

- (void)beginAssetSharingConnectionWithClient:(id)a3
{
  void *v4;
  id v5;

  v4 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
  v5 = a3;
  objc_msgSend(v4, "setEditing:animated:", 0, 0);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setAllowsMultipleSelectionDuringEditing:", 1);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setEditing:animated:", 1, 1);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "beginUpdates");
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "endUpdates");
  -[BKTOCContentViewController setAssetSharingConnectionClient:](self, "setAssetSharingConnectionClient:", v5);

}

- (void)endAssetSharingConnectionWithClient:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setEditing:animated:", 0, 1);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setAllowsMultipleSelectionDuringEditing:", 0);
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "beginUpdates");
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "endUpdates");
  -[BKTOCContentViewController setAssetSharingConnectionClient:](self, "setAssetSharingConnectionClient:", 0);
}

- (void)assetSharingConnectionClient:(id)a3 performRequest:(int)a4
{
  id v6;
  id v7;

  v6 = a3;
  switch(a4)
  {
    case 3:
      v7 = v6;
      -[BKTOCContentViewController deleteSelected:](self, "deleteSelected:", v6);
      goto LABEL_7;
    case 2:
      v7 = v6;
      -[BKTOCContentViewController selectNone:](self, "selectNone:", v6);
      goto LABEL_7;
    case 1:
      v7 = v6;
      -[BKTOCContentViewController selectAll:](self, "selectAll:", v6);
LABEL_7:
      v6 = v7;
      break;
  }

}

- (unint64_t)bookSharingRequestNumberOfSelectedAnnotations:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)bookSharingRequestClient:(id)a3 selectedAnnotationAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "objectAtIndexPath:", v7));

  return v8;
}

- (unint64_t)bookSharingRequestNumberOfAnnotations:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "fetchedObjects", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)bookSharingRequestClient:(id)a3 annotationAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "fetchedObjects", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a4));

  return v6;
}

- (void)selectAll:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections", a3))
  {
    v4 = 0;
    do
    {
      if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfRowsInSection:", v4))
      {
        v5 = 0;
        do
        {
          v6 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, v4));
          objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v7, 1, 0);

          ++v5;
        }
        while (v5 < (unint64_t)objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfRowsInSection:", v4));
      }
      ++v4;
    }
    while (v4 < (unint64_t)objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections"));
  }
  -[BKTOCContentViewController notifyBookSharingClientSelectionChanged](self, "notifyBookSharingClientSelectionChanged");
}

- (void)selectNone:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections", a3))
  {
    v4 = 0;
    do
    {
      if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfRowsInSection:", v4))
      {
        v5 = 0;
        do
        {
          v6 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, v4));
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

          ++v5;
        }
        while (v5 < (unint64_t)objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfRowsInSection:", v4));
      }
      ++v4;
    }
    while (v4 < (unint64_t)objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "numberOfSections"));
  }
  -[BKTOCContentViewController notifyBookSharingClientSelectionChanged](self, "notifyBookSharingClientSelectionChanged");
}

- (void)notifyBookSharingClientSelectionChanged
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows"));
  v4 = objc_msgSend(v3, "count");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController assetSharingConnectionClient](self, "assetSharingConnectionClient"));
  objc_msgSend(v5, "assetSharingConnectionServer:didChangeSelectedAnnotationsCount:", self, v4);

}

- (void)controllerWillChangeContent:(id)a3
{
  if (!BYTE4(self->_macLargeTextDateFormatter))
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "beginUpdates", a3);
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  if (a6 == 2)
  {
    v13 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5));
    objc_msgSend(v13, "deleteSections:withRowAnimation:", v12, 0);
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    v11 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5));
    objc_msgSend(v11, "insertSections:withRowAnimation:", v12, 0);
LABEL_5:

    -[BKTOCContentViewController _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
  }

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!BYTE4(self->_macLargeTextDateFormatter))
  {
    switch(a6)
    {
      case 1uLL:
        v15 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        goto LABEL_6;
      case 2uLL:
        v16 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v13));
        objc_msgSend(v16, "deleteRowsAtIndexPaths:withRowAnimation:", v17, 0);
        goto LABEL_7;
      case 3uLL:
        v18 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v13));
        objc_msgSend(v18, "deleteRowsAtIndexPaths:withRowAnimation:", v19, 0);

        v15 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
LABEL_6:
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v14));
        objc_msgSend(v15, "insertRowsAtIndexPaths:withRowAnimation:", v17, 0);
LABEL_7:

        -[BKTOCContentViewController _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
        break;
      case 4uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "cellForRowAtIndexPath:", v13));
        -[BKTOCContentViewController configureCell:atIndexPath:](self, "configureCell:atIndexPath:", v20, v13);

        break;
      default:
        break;
    }
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  if (!BYTE4(self->_macLargeTextDateFormatter))
    objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "endUpdates", a3);
  -[BKTOCContentViewController updateView](self, "updateView", a3);
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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  -[BKContentViewController setNeedsRestyle](&v3, "setNeedsRestyle");
  -[BKTOCContentViewController reload](self, "reload");
}

- (int64_t)ordinal
{
  return -101;
}

- (int64_t)totalPages
{
  return 1;
}

- (id)currentLocation
{
  return -[BKLocation initWithOrdinal:]([BKLocation alloc], "initWithOrdinal:", -[BKTOCContentViewController ordinal](self, "ordinal"));
}

- (void)_notifyDelegateContentDidChange
{
  id v3;

  if ((BYTE4(self->super._fetchedResultsController) & 0x10) != 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v3, "tocViewControllerContentDidChange:", self);

  }
}

- (void)reload
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)BKTOCContentViewController;
  -[BKTOCViewController reload](&v13, "reload");
  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows"));
  else
    v3 = 0;
  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "reloadData");
  -[BKTOCContentViewController _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
  if (v3 && objc_msgSend(v3, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), 0, 0, (_QWORD)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setBook:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKTOCContentViewController;
  -[BKContentViewController setBook:](&v3, "setBook:", a3);
}

- (id)bookTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bookTitle"));

  return v3;
}

- (id)author
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bookAuthor"));

  return v3;
}

- (id)storeURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storeId"));

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeShortURLForStoreId:dataSource:", v3, 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  return objc_msgSend(a3, "physicalPageNumber");
}

- (void)contentBeganLoadingForRequest:(id)a3
{
  -[BKTOCContentViewController setCellLoadingOperationCount:](self, "setCellLoadingOperationCount:", (char *)-[BKTOCContentViewController cellLoadingOperationCount](self, "cellLoadingOperationCount", a3) + 1);
}

- (void)contentFinishedLoadingForRequest:(id)a3 preferredHeight:(double)a4 error:(id)a5
{
  id v8;
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

  v8 = a3;
  -[BKTOCContentViewController setCellLoadingOperationCount:](self, "setCellLoadingOperationCount:", (char *)-[BKTOCContentViewController cellLoadingOperationCount](self, "cellLoadingOperationCount") - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController requestToIndexPath](self, "requestToIndexPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cacheKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController cachedRowContents](self, "cachedRowContents"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

    if (!v13)
    {
      if (a5)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController cachedRowContents](self, "cachedRowContents"));
        objc_msgSend(v14, "removeObjectForKey:", v11);

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cacheKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKTOCWebViewCellContent cellContentWithHeight:cacheKey:](BKTOCWebViewCellContent, "cellContentWithHeight:cacheKey:", v15, a4));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController cachedRowContents](self, "cachedRowContents"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v11);

        v18 = *(void **)((char *)&self->super._verticalCenteringInsets.right + 4);
        v20 = v11;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
        objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 100);

      }
    }
  }

}

- (id)p_selectedAnnotations
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController p_annotationsForRowItems:](self, "p_annotationsForRowItems:", v3));

  return v4;
}

- (id)p_annotationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController fetchedResultsController](self, "fetchedResultsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexPath:", v4));

  objc_opt_class(AEAnnotation);
  v8 = BUDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)p_annotationsForRowItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController p_annotationForIndexPath:](self, "p_annotationForIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)deleteAnnotationAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController p_annotationForIndexPath:](self, "p_annotationForIndexPath:", a3));
  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    objc_msgSend(v4, "deleteAnnotation:", v5);

  }
}

- (void)deleteSelectedAnnotations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController p_selectedAnnotations](self, "p_selectedAnnotations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationProvider"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "deleteAnnotation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), (_QWORD)v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._paginationController + 4), "managedObjectContext"));
  objc_msgSend(v5, "saveManagedObjectContext:", v11);

}

- (void)shareSelectedAnnotationsFromSourceView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController p_selectedAnnotations](self, "p_selectedAnnotations"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v5, "tocViewController:shareAnnotations:sourceView:", self, v4, v6);

  }
}

- (BOOL)shareItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController p_annotationForIndexPath:](self, "p_annotationForIndexPath:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "cellForRowAtIndexPath:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v10 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v7, "tocViewController:shareAnnotations:sourceView:", self, v8, v6);

  }
  return v5 != 0;
}

- (void)beginEditingIfNeeded
{
  if ((objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing") & 1) == 0)
    -[BKTOCContentViewController beginEditingMode](self, "beginEditingMode");
}

- (void)endEditingIfNeeded
{
  if (objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "isEditing"))
    -[BKTOCContentViewController endEditingMode](self, "endEditingMode");
}

- (void)beginEditingMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  objc_msgSend(v3, "tocViewControllerDidChangeEditing:", 1);

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setEditing:animated:", 1, 1);
  -[BKTOCContentViewController installEditModeToolbar](self, "installEditModeToolbar");
}

- (void)endEditingMode
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  objc_msgSend(v3, "tocViewControllerDidChangeEditing:", 0);

  objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "setEditing:animated:", 0, 1);
  -[BKTOCContentViewController removeEditModeToolbar](self, "removeEditModeToolbar");
  -[BKTOCContentViewController showRowForCurrentLocation](self, "showRowForCurrentLocation");
}

- (void)installEditModeToolbar
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
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
  id v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  _QWORD v35[3];
  UIEdgeInsets v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
  {
    v5 = BKTOCCVCLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_11CC50(self, v6);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
    objc_msgSend(v7, "addSubview:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v35[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v11));
    v35[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    v35[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    objc_msgSend(v19, "setNeedsLayout");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController view](self, "view"));
    objc_msgSend(v20, "layoutIfNeeded");

    v21 = BKTOCCVCLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      -[BKTOCContentViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
      v23 = NSStringFromUIEdgeInsets(v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138412290;
      v34 = v24;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Adjusting additionalSafeAreaInsets to account for _editingToolbar, before adjustments:%@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(&self->_userDidScroll + 4), "frame");
    -[BKTOCContentViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v25, 0.0);
  }
}

- (void)removeEditModeToolbar
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = BKTOCCVCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_11CCF4(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editingToolbar](self, "editingToolbar"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKTOCContentViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, 0.0, 0.0);
  v6 = *(void **)(&self->_userDidScroll + 4);
  *(_QWORD *)(&self->_userDidScroll + 4) = 0;

  objc_storeWeak((id *)((char *)&self->_editingToolbar + 4), 0);
}

- (UIToolbar)editingToolbar
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[4];

  v3 = *(void **)(&self->_userDidScroll + 4);
  if (!v3)
  {
    v4 = objc_alloc((Class)UIToolbar);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v37 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v8 = AEBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1C3088, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_79314;
    v39[3] = &unk_1C0850;
    v39[4] = self;
    v12 = objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v10, v11, CFSTR("toolbar.share"), v39));

    v36 = (void *)v12;
    v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithPrimaryAction:", v12);
    v14 = AEBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1C3088, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_7931C;
    v38[3] = &unk_1C0850;
    v38[4] = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v16, v17, CFSTR("toolbar.delete"), v38));

    objc_msgSend(v18, "setAttributes:", (unint64_t)objc_msgSend(v18, "attributes") | 2);
    v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:primaryAction:", 16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem flexibleSpaceItem](UIBarButtonItem, "flexibleSpaceItem"));
    v21 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v21, "setTextAlignment:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v21, "setFont:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editToolbarFooterTextWithCount:](self, "editToolbarFooterTextWithCount:", objc_msgSend(v23, "count")));
    objc_msgSend(v21, "setText:", v24);

    v25 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v21);
    objc_storeWeak((id *)((char *)&self->_editingToolbar + 4), v25);
    v26 = *(_QWORD *)((char *)&self->super._centeringInsets.right + 4);
    v34 = v13;
    if (v26 == 2)
    {
      v40[0] = v13;
      v40[1] = v20;
      v40[2] = v25;
      v40[3] = v20;
      v40[4] = v19;
      v28 = v40;
      v29 = 5;
    }
    else
    {
      v27 = 0;
      if (v26 != 1)
      {
LABEL_7:
        v30 = v19;
        objc_msgSend(v37, "setItems:animated:", v27, 1, v34);
        v31 = *(void **)(&self->_userDidScroll + 4);
        *(_QWORD *)(&self->_userDidScroll + 4) = v37;
        v32 = v37;

        v3 = *(void **)(&self->_userDidScroll + 4);
        return (UIToolbar *)v3;
      }
      v41[0] = v20;
      v41[1] = v25;
      v41[2] = v20;
      v41[3] = v19;
      v28 = v41;
      v29 = 4;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, v29, v13));
    goto LABEL_7;
  }
  return (UIToolbar *)v3;
}

- (void)updateToolbarContent
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  -[BKTOCContentViewController installEditModeToolbar](self, "installEditModeToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super._verticalCenteringInsets.right + 4), "indexPathsForSelectedRows"));
  v4 = objc_msgSend(v3, "count");

  v5 = BKTOCCVCLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_11CD34((uint64_t)v4, v6, v7);

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_editingToolbar + 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "customView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCContentViewController editToolbarFooterTextWithCount:](self, "editToolbarFooterTextWithCount:", v4));
  objc_msgSend(v9, "setText:", v10);

  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v9);
  v12 = objc_alloc((Class)NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->_userDidScroll + 4), "items"));
  v14 = objc_msgSend(v12, "initWithArray:", v13);

  v15 = objc_loadWeakRetained((id *)((char *)&self->_editingToolbar + 4));
  v16 = objc_msgSend(v14, "indexOfObject:", v15);

  objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v16, v11);
  objc_storeWeak((id *)((char *)&self->_editingToolbar + 4), v11);
  objc_msgSend(*(id *)(&self->_userDidScroll + 4), "setItems:", v14);

}

- (id)editToolbarFooterTextWithCount:(unint64_t)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;

  v4 = *(_QWORD *)((char *)&self->super._centeringInsets.right + 4);
  if (v4 == 2)
  {
    v9 = AEBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v7 = v6;
    v8 = CFSTR("%lu Highlight(s) Selected");
  }
  else
  {
    if (v4 != 1)
    {
      v11 = CFSTR("Select");
      return v11;
    }
    v5 = AEBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v6;
    v8 = CFSTR("%lu Bookmark(s) Selected");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1C3088, 0));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a3));

  return v11;
}

- (void)deleteFromToolbar
{
  -[BKTOCContentViewController deleteSelectedAnnotations](self, "deleteSelectedAnnotations");
  -[BKTOCContentViewController endEditingMode](self, "endEditingMode");
}

- (void)shareFromToolbar
{
  -[BKTOCContentViewController shareSelectedAnnotationsFromSourceView:](self, "shareSelectedAnnotationsFromSourceView:", *(_QWORD *)(&self->_userDidScroll + 4));
  -[BKTOCContentViewController endEditingMode](self, "endEditingMode");
}

- (NSIndexPath)recenteredIndexPath
{
  return *(NSIndexPath **)(&self->_changeIsUserDriven + 4);
}

- (void)setRecenteredIndexPath:(id)a3
{
  objc_storeStrong((id *)(&self->_changeIsUserDriven + 4), a3);
}

- (AEAssetSharingConnectionClient)assetSharingConnectionClient
{
  return (AEAssetSharingConnectionClient *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->toolbarLabelItem
                                                                                                  + 4)));
}

- (void)setAssetSharingConnectionClient:(id)a3
{
  objc_storeWeak((id *)((char *)&self->toolbarLabelItem + 4), a3);
}

- (double)preferredFontSize
{
  return *(double *)((char *)&self->_assetSharingConnectionClient + 4);
}

- (void)setPreferredFontSize:(double)a3
{
  *(double *)((char *)&self->_assetSharingConnectionClient + 4) = a3;
}

- (int64_t)cellLoadingOperationCount
{
  return *(_QWORD *)((char *)&self->_preferredFontSize + 4);
}

- (void)setActivityIndicatorOverlayView:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_cellLoadingOperationCount + 4), a3);
}

- (NSMutableDictionary)cachedRowContents
{
  return *(NSMutableDictionary **)((char *)&self->_activityIndicatorOverlayView + 4);
}

- (void)setCachedRowContents:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_activityIndicatorOverlayView + 4), a3);
}

- (NSMutableDictionary)requestToIndexPath
{
  return *(NSMutableDictionary **)((char *)&self->_cachedRowContents + 4);
}

- (void)setRequestToIndexPath:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_cachedRowContents + 4), a3);
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_requestToIndexPath + 4), a3);
}

- (void)setTemplate:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_imageCache + 4), a3);
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_template + 4), a3);
}

- (WKWebView)sharedWebView
{
  return *(WKWebView **)((char *)&self->_requestQueue + 4);
}

- (BKTOCBookmarksDescription)descriptionView
{
  return *(BKTOCBookmarksDescription **)((char *)&self->_sharedWebView + 4);
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_sharedWebView + 4), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_sharedWebView + 4), 0);
  objc_storeStrong((id *)((char *)&self->_requestQueue + 4), 0);
  objc_storeStrong((id *)((char *)&self->_template + 4), 0);
  objc_storeStrong((id *)((char *)&self->_imageCache + 4), 0);
  objc_storeStrong((id *)((char *)&self->_requestToIndexPath + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cachedRowContents + 4), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorOverlayView + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cellLoadingOperationCount + 4), 0);
  objc_destroyWeak((id *)((char *)&self->toolbarLabelItem + 4));
  objc_destroyWeak((id *)((char *)&self->_editingToolbar + 4));
  objc_storeStrong((id *)(&self->_userDidScroll + 4), 0);
  objc_storeStrong((id *)(&self->_isProgrammaticScrolling + 4), 0);
  objc_storeStrong((id *)(&self->_changeIsUserDriven + 4), 0);
  objc_storeStrong((id *)((char *)&self->_dateFormatter + 4), 0);
  objc_storeStrong((id *)((char *)&self->_tableView + 4), 0);
  objc_storeStrong((id *)((char *)&self->super._verticalCenteringInsets.right + 4), 0);
}

@end
