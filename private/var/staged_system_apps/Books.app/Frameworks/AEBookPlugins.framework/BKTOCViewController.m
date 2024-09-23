@implementation BKTOCViewController

- (void)releaseViews
{
  objc_super v3;

  -[BKTOCViewController destroyFetchedResultsController](self, "destroyFetchedResultsController");
  v3.receiver = self;
  v3.super_class = (Class)BKTOCViewController;
  -[BKContentViewController releaseViews](&v3, "releaseViews");
}

- (void)dealloc
{
  objc_super v3;

  -[BKTOCViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKTOCViewController;
  -[BKContentViewController dealloc](&v3, "dealloc");
}

- (BKTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKTOCViewController;
  return -[BKViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKTOCViewController;
  -[BKTOCViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController fetchedResultsController](self, "fetchedResultsController"));
  v12 = 0;
  v5 = objc_msgSend(v4, "performFetch:", &v12);
  v6 = v12;

  if ((v5 & 1) == 0)
  {
    v7 = BCIMLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_11C588(self, v6, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = BKPaginationDataLoadedNotification;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController paginationController](self, "paginationController"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "paginationDataLoaded:", v10, v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  int v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKTOCViewController;
  -[BKContentViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = *((unsigned __int8 *)&self->_tocFlags + 2);
  if (*((_BYTE *)&self->_tocFlags + 2))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController scrollView](self, "scrollView"));
    objc_msgSend(v5, "flashScrollIndicators");

  }
  -[BKTOCViewController setScrollIndicatorsNeedToBeFlashed:](self, "setScrollIndicatorsNeedToBeFlashed:", v4 == 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKTOCViewController;
  -[BKContentViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = BKPaginationDataLoadedNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController paginationController](self, "paginationController"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKTOCViewController;
  -[BKContentViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BKTOCViewController destroyFetchedResultsController](self, "destroyFetchedResultsController");
}

- (void)preferredContentSizeChanged:(id)a3
{
  -[BKTOCViewController setChapterTopLevelFont:](self, "setChapterTopLevelFont:", 0);
  -[BKTOCViewController setChapterSubLevelFont:](self, "setChapterSubLevelFont:", 0);
  -[BKTOCViewController establishChapterFonts](self, "establishChapterFonts");
  -[BKTOCViewController reload](self, "reload");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKTOCViewController;
  -[BKTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v9 = objc_opt_respondsToSelector(v8, "tocViewController:willTransitionToSize:withTransitionCoordinator:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v10, "tocViewController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_36A48;
  v11[3] = &unk_1BE8C8;
  v11[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v11);

}

- (void)setTheme:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController theme](self, "theme"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKTOCViewController;
    -[BKContentViewController setTheme:](&v7, "setTheme:", v4);
    -[BKTOCViewController invalidateFollowingThemeChange](self, "invalidateFollowingThemeChange");
  }

}

- (id)title
{
  int64_t v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  id v8;
  void *v9;

  v2 = -[BKTOCViewController tocContentType](self, "tocContentType");
  if (v2 == 1)
  {
    v7 = AEBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = v4;
    v6 = CFSTR("Bookmarks");
  }
  else if (v2)
  {
    v8 = AEBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5 = v4;
    v6 = CFSTR("Notes");
  }
  else
  {
    v3 = AEBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    v6 = CFSTR("Contents");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1C3088, 0));

  return v9;
}

- (BOOL)isThemeFlowingBook
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController theme](self, "theme"));
  objc_opt_class(IMThemePage);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController theme](self, "theme"));
    objc_opt_class(IMThemePageNight);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  }
  return isKindOfClass & 1;
}

- (void)setDirectoryDelegate:(id)a3
{
  id v4;
  BKDirectoryContentDelegate *v5;
  id v6;
  char v7;
  char v8;
  char v9;
  char v10;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKTOCViewController;
  v5 = -[BKDirectoryContent directoryDelegate](&v12, "directoryDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (v6 != v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BKTOCViewController;
    -[BKDirectoryContent setDirectoryDelegate:](&v11, "setDirectoryDelegate:", v4);
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xFE | objc_opt_respondsToSelector(v4, "tocViewController:didSelectChapter:") & 1;
    if ((objc_opt_respondsToSelector(v4, "tocViewController:pageTitleForChapter:") & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xFD | v7;
    if ((objc_opt_respondsToSelector(v4, "tocViewController:pageTitleForAnnotation:") & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xFB | v8;
    if ((objc_opt_respondsToSelector(v4, "tocViewController:chapterTitleForAnnotation:") & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xF7 | v9;
    if ((objc_opt_respondsToSelector(v4, "tocViewControllerContentDidChange:") & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xEF | v10;
  }

}

- (id)tocFetchedResultsController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BKPaginationController *v14;
  void *v15;
  id v16;

  v3 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    if (v5)
    {
      v6 = objc_alloc_init((Class)NSFetchRequest);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookInfo == %@"), v7, 0));

      objc_msgSend(v6, "setPredicate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKNavigationInfo"), v5));
      objc_msgSend(v6, "setEntity:", v9);

      v10 = objc_alloc((Class)NSArray);
      v11 = objc_msgSend(v10, "initWithObjects:", BKNavigationInfoPropertyIndentationLevel, BKNavigationInfoPropertyName, BKNavigationInfoPropertyHref, BKNavigationInfoPropertyHTMLName, 0);
      objc_msgSend(v6, "setPropertiesToFetch:", v11);
      objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
      v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("absoluteOrder"), -[BKTOCViewController fetchedResultsControllerAscendingOrder](self, "fetchedResultsControllerAscendingOrder"));
      v13 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v12, 0);
      objc_msgSend(v6, "setSortDescriptors:", v13);
      v14 = (BKPaginationController *)objc_msgSend(objc_alloc((Class)NSFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v5, 0, 0);
      v15 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
      *(BKPaginationController **)((char *)&self->_paginationController + 4) = v14;

      objc_msgSend(*(id *)((char *)&self->_paginationController + 4), "setDelegate:", self);
      v16 = objc_msgSend(v5, "countEntity:withPredicate:", CFSTR("BKNavigationInfo"), v8);
      objc_msgSend(v6, "setFetchLimit:", v16);
      objc_msgSend(v6, "setFetchBatchSize:", v16);

    }
    v3 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
  }
  return v3;
}

- (BOOL)fetchedResultsControllerAscendingOrder
{
  return !-[BKTOCViewController isVertical](self, "isVertical");
}

- (NSFetchedResultsController)fetchedResultsController
{
  return (NSFetchedResultsController *)-[BKTOCViewController tocFetchedResultsController](self, "tocFetchedResultsController");
}

- (void)destroyFetchedResultsController
{
  void *v3;

  objc_msgSend(*(id *)((char *)&self->_paginationController + 4), "setDelegate:", 0);
  v3 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
  *(BKPaginationController **)((char *)&self->_paginationController + 4) = 0;

}

- (void)paginationDataLoaded:(id)a3
{
  -[BKTOCViewController paginationDidLoad](self, "paginationDidLoad", a3);
}

- (BOOL)isLandscape
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController bc_windowForViewController](self, "bc_windowForViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (char *)objc_msgSend(v3, "interfaceOrientation") - 3 < (_BYTE *)&dword_0 + 2;

  return v4;
}

- (double)calculateFontSize
{
  _BOOL8 v3;
  uint64_t v4;
  double result;
  unsigned __int8 v6;
  _BOOL8 v7;
  uint64_t v8;
  BOOL v9;
  double v10;

  v3 = -[BKTOCViewController isThemeFlowingBook](self, "isThemeFlowingBook");
  if (!v3)
  {
    v9 = isPad(v3, v4) == 0;
    result = 16.0;
    v10 = 17.0;
LABEL_7:
    if (!v9)
      return v10;
    return result;
  }
  if (!-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle")
    || (v6 = -[BKTOCViewController isVertical](self, "isVertical"), result = 10.0, (v6 & 1) == 0))
  {
    v7 = -[BKTOCViewController isLandscape](self, "isLandscape", result);
    result = 14.0;
    if (!v7)
    {
      v9 = isPad(v7, v8) == 0;
      result = 14.0;
      v10 = 19.0;
      goto LABEL_7;
    }
  }
  return result;
}

- (void)establishChapterFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterTopLevelFont](self, "chapterTopLevelFont"));
    if (!v3
      || (v4 = (void *)v3,
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterSubLevelFont](self, "chapterSubLevelFont")),
          v5,
          v4,
          !v5))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
      -[BKTOCViewController setChapterTopLevelFont:](self, "setChapterTopLevelFont:", v6);

      v15 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightMedium));
      -[BKTOCViewController setChapterSubLevelFont:](self, "setChapterSubLevelFont:");
LABEL_11:

    }
  }
  else
  {
    -[BKTOCViewController calculateFontSize](self, "calculateFontSize");
    v8 = v7;
    -[BKTOCViewController sizeOfCachedFonts](self, "sizeOfCachedFonts");
    if (v9 != v8)
    {
      -[BKTOCViewController setChapterTopLevelFont:](self, "setChapterTopLevelFont:", 0);
      -[BKTOCViewController setChapterSubLevelFont:](self, "setChapterSubLevelFont:", 0);
      -[BKTOCViewController setSizeOfCachedFonts:](self, "setSizeOfCachedFonts:", v8);
    }
    v10 = objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterTopLevelFont](self, "chapterTopLevelFont"));
    if (!v10
      || (v11 = (void *)v10,
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterSubLevelFont](self, "chapterSubLevelFont")),
          v12,
          v11,
          !v12))
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      objc_msgSend(v15, "_scaledValueForValue:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
      -[BKTOCViewController setChapterTopLevelFont:](self, "setChapterTopLevelFont:", v13);

      objc_msgSend(v15, "_scaledValueForValue:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
      -[BKTOCViewController setChapterSubLevelFont:](self, "setChapterSubLevelFont:", v14);

      goto LABEL_11;
    }
  }
}

- (UIFont)pageLabelFont
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  if (!-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
  {
    -[BKTOCViewController calculateFontSize](self, "calculateFontSize");
    objc_msgSend(v3, "_scaledValueForValue:");
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));

    v3 = (void *)v4;
  }
  return (UIFont *)v3;
}

- (UIScrollView)scrollView
{
  return *(UIScrollView **)&self->_shouldIgnoreViewLayoutUpdates;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (UIEdgeInsets)centeringInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)(&self->_vertical + 4);
  v3 = *(double *)((char *)&self->_centeringInsets.top + 4);
  v4 = *(double *)((char *)&self->_centeringInsets.left + 4);
  v5 = *(double *)((char *)&self->_centeringInsets.bottom + 4);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setCenteringInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)(&self->_vertical + 4) = a3;
}

- (int64_t)tocContentType
{
  return *(_QWORD *)((char *)&self->_centeringInsets.right + 4);
}

- (void)setTocContentType:(int64_t)a3
{
  *(_QWORD *)((char *)&self->_centeringInsets.right + 4) = a3;
}

- (BKPaginationController)paginationController
{
  return *(BKPaginationController **)((char *)&self->_tocContentType + 4);
}

- (void)setPaginationController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_tocContentType + 4), a3);
}

- (BOOL)shouldIgnoreViewLayoutUpdates
{
  return (BOOL)self->_tocFlags;
}

- (void)setShouldIgnoreViewLayoutUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_tocFlags = a3;
}

- (BOOL)usesPopoverStyle
{
  return *((_BYTE *)&self->_tocFlags + 1);
}

- (void)setUsesPopoverStyle:(BOOL)a3
{
  *((_BYTE *)&self->_tocFlags + 1) = a3;
}

- (UIEdgeInsets)verticalCenteringInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->_sizeOfCachedFonts + 4);
  v3 = *(double *)((char *)&self->_verticalCenteringInsets.top + 4);
  v4 = *(double *)((char *)&self->_verticalCenteringInsets.left + 4);
  v5 = *(double *)((char *)&self->_verticalCenteringInsets.bottom + 4);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setVerticalCenteringInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->_sizeOfCachedFonts + 4) = a3;
}

- (BKTOCEventEngagementProtocol)eventEngagement
{
  return *(BKTOCEventEngagementProtocol **)((char *)&self->_scrollView + 4);
}

- (void)setEventEngagement:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_scrollView + 4), a3);
}

- (BOOL)scrollIndicatorsNeedToBeFlashed
{
  return *((_BYTE *)&self->_tocFlags + 2);
}

- (void)setScrollIndicatorsNeedToBeFlashed:(BOOL)a3
{
  *((_BYTE *)&self->_tocFlags + 2) = a3;
}

- (UIFont)chapterTopLevelFont
{
  return *(UIFont **)((char *)&self->_eventEngagement + 4);
}

- (void)setChapterTopLevelFont:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_eventEngagement + 4), a3);
}

- (UIFont)chapterSubLevelFont
{
  return *(UIFont **)((char *)&self->_chapterTopLevelFont + 4);
}

- (void)setChapterSubLevelFont:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_chapterTopLevelFont + 4), a3);
}

- (double)sizeOfCachedFonts
{
  return *(double *)((char *)&self->_chapterSubLevelFont + 4);
}

- (void)setSizeOfCachedFonts:(double)a3
{
  *(double *)((char *)&self->_chapterSubLevelFont + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_chapterTopLevelFont + 4), 0);
  objc_storeStrong((id *)((char *)&self->_eventEngagement + 4), 0);
  objc_storeStrong((id *)((char *)&self->_scrollView + 4), 0);
  objc_storeStrong((id *)&self->_shouldIgnoreViewLayoutUpdates, 0);
  objc_storeStrong((id *)((char *)&self->_paginationController + 4), 0);
  objc_storeStrong((id *)((char *)&self->_tocContentType + 4), 0);
}

@end
