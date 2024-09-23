@implementation BKBookmarkThumbnailDirectory

- (void)releaseViews
{
  BKTOCBookmarksDescription *noBookmarksView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKBookmarkThumbnailDirectory;
  -[BKThumbnailDirectory releaseViews](&v4, "releaseViews");
  noBookmarksView = self->_noBookmarksView;
  self->_noBookmarksView = 0;

}

- (void)dealloc
{
  NSFetchedResultsController *fetchedResultsController;
  objc_super v4;

  -[BKBookmarkThumbnailDirectory releaseViews](self, "releaseViews");
  -[NSFetchedResultsController setDelegate:](self->_fetchedResultsController, "setDelegate:", 0);
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKBookmarkThumbnailDirectory;
  -[BKThumbnailDirectory dealloc](&v4, "dealloc");
}

- (id)locationAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory fetchedResultsController](self, "fetchedResultsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchedObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  return v7;
}

- (unint64_t)indexForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory fetchedResultsController](self, "fetchedResultsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("location")));
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  return (unint64_t)v8;
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory locationAtIndex:](self, "locationAtIndex:", a3));
  v5 = -[BKDirectoryContent pageNumberForLocation:](self, "pageNumberForLocation:", v4);

  return v5;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  int64_t v4;
  void *v6;

  v4 = -[BKBookmarkThumbnailDirectory pageNumberForCellIndex:](self, "pageNumberForCellIndex:", a3);
  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    if ((v4 & 1) == 0 && v4 > 1)
      ++v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent locationForPageNumber:](self, "locationForPageNumber:", v4));

    if (v6)
      return v4;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4) >= 2)
  {
    return v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4);
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  int64_t v4;
  void *v7;

  v4 = -[BKBookmarkThumbnailDirectory pageNumberForCellIndex:](self, "pageNumberForCellIndex:", a3);
  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    if (v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4) >= 2)
      return v4 - ((v4 != 0x7FFFFFFFFFFFFFFFLL) & v4);
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if ((v4 & 1) == 0 && v4 > 1)
      ++v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent locationForPageNumber:](self, "locationForPageNumber:", v4));

    if (v7)
      return v4;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKBookmarkThumbnailDirectory;
  -[BKThumbnailDirectory configureCell:atIndex:](&v12, "configureCell:atIndex:", v6, a4);
  objc_msgSend(v6, "setHasRibbon:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v8 = objc_opt_respondsToSelector(v7, "thumbnailDirectoryWantsPageNumber:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    v10 = objc_msgSend(v9, "thumbnailDirectoryWantsPageNumber:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageView"));
    objc_msgSend(v11, "setShowsPageNumber:", v10);

  }
}

- (id)fetchedResultsController
{
  NSFetchedResultsController *fetchedResultsController;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSFetchedResultsController *v16;
  NSFetchedResultsController *v17;
  NSFetchedResultsController *v18;
  unsigned __int8 v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v24;
  id v25;

  fetchedResultsController = self->_fetchedResultsController;
  if (!fetchedResultsController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v5 = objc_alloc_init((Class)NSFetchRequest);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "databaseKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation pageBookmarksPredicate:](AEAnnotation, "pageBookmarksPredicate:", v6));
    objc_msgSend(v5, "setPredicate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uiManagedObjectContext"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v9));
    objc_msgSend(v5, "setEntity:", v10);

    v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("plLocationRangeStart"), 1);
    v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("annotationCreationDate"), 1);
    v13 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v11, v12, 0);
    objc_msgSend(v5, "setSortDescriptors:", v13);
    v24 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "databaseKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-bm"), v14));

    v16 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)IMUbiquitousFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v9, 0, v15);
    v17 = self->_fetchedResultsController;
    self->_fetchedResultsController = v16;

    -[NSFetchedResultsController setDelegate:](self->_fetchedResultsController, "setDelegate:", self);
    v18 = self->_fetchedResultsController;
    v25 = 0;
    v19 = -[NSFetchedResultsController performFetch:](v18, "performFetch:", &v25);
    v20 = v25;
    if ((v19 & 1) == 0)
    {
      v21 = BCIMLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_11CB30((uint64_t)v20, v22);

    }
    fetchedResultsController = self->_fetchedResultsController;
  }
  return fetchedResultsController;
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory fetchedResultsController](self, "fetchedResultsController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)_noBookmarksView
{
  BKTOCBookmarksDescription *noBookmarksView;
  BKTOCBookmarksDescription *v4;
  BKTOCBookmarksDescription *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;

  noBookmarksView = self->_noBookmarksView;
  if (!noBookmarksView)
  {
    v4 = -[BKTOCBookmarksDescription initWithFrame:]([BKTOCBookmarksDescription alloc], "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
    v5 = self->_noBookmarksView;
    self->_noBookmarksView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BKTOCBookmarksDescription setBackgroundColor:](self->_noBookmarksView, "setBackgroundColor:", v6);

    v7 = -[BKTOCBookmarksDescription setAutoresizingMask:](self->_noBookmarksView, "setAutoresizingMask:", 18);
    v9 = isPad(v7, v8);
    v10 = 27.0;
    if (!v9)
      v10 = 17.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](self->_noBookmarksView, "titleLabel"));
    objc_msgSend(v12, "setFont:", v11);

    v15 = isPad(v13, v14);
    v16 = 13.0;
    if (v15)
      v16 = 17.0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](self->_noBookmarksView, "descriptionLabel"));
    objc_msgSend(v18, "setFont:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](self->_noBookmarksView, "titleLabel"));
    v20 = AEBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Adding Bookmarks…"), &stru_1C3088, 0));
    objc_msgSend(v19, "setText:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
    objc_msgSend(v19, "setTextColor:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    LODWORD(v22) = objc_msgSend(v24, "contentType");

    v25 = AEBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = v26;
    if ((_DWORD)v22 == 2)
      v28 = CFSTR("When you’re reading a PDF,\ntap the Bookmark button to\nmark the current page.");
    else
      v28 = CFSTR("When you’re reading a book, tap the Bookmark button to mark the current page.");
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1C3088, 0));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](self->_noBookmarksView, "descriptionLabel"));
    objc_msgSend(v30, "setText:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
    objc_msgSend(v30, "setTextColor:", v31);

    objc_msgSend(v30, "setNumberOfLines:", 0);
    noBookmarksView = self->_noBookmarksView;
  }
  return noBookmarksView;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  id v5;
  BKTOCBookmarksDescription *noBookmarksView;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKBookmarkThumbnailDirectory;
  -[BKThumbnailDirectory reloadData](&v9, "reloadData");
  if (-[BKBookmarkThumbnailDirectory isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory fetchedResultsController](self, "fetchedResultsController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[BKTOCBookmarksDescription removeFromSuperview](self->_noBookmarksView, "removeFromSuperview");
      noBookmarksView = self->_noBookmarksView;
      self->_noBookmarksView = 0;
    }
    else
    {
      noBookmarksView = (BKTOCBookmarksDescription *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory _noBookmarksView](self, "_noBookmarksView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory view](self, "view"));
      objc_msgSend(v7, "bounds");
      -[BKTOCBookmarksDescription setFrame:](noBookmarksView, "setFrame:");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookmarkThumbnailDirectory view](self, "view"));
      objc_msgSend(v8, "addSubview:", noBookmarksView);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBookmarksView, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
}

@end
