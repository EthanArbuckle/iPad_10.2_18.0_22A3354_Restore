@implementation BKPageThumbnailDirectory

- (void)dealloc
{
  objc_super v3;

  -[BKPageThumbnailDirectory stopFetchingAnnotations](self, "stopFetchingAnnotations");
  v3.receiver = self;
  v3.super_class = (Class)BKPageThumbnailDirectory;
  -[BKThumbnailDirectory dealloc](&v3, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKPageThumbnailDirectory startFetchingAnnotations](self, "startFetchingAnnotations");
  v5.receiver = self;
  v5.super_class = (Class)BKPageThumbnailDirectory;
  -[BKThumbnailDirectory viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPageThumbnailDirectory;
  -[BKContentViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BKPageThumbnailDirectory stopFetchingAnnotations](self, "stopFetchingAnnotations");
}

- (void)setPageCount:(int64_t)a3
{
  int64_t v3;

  if (self->_pageCount != a3)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      v3 = 0;
    else
      v3 = a3;
    self->_pageCount = v3;
    -[BKThumbnailDirectory reloadData](self, "reloadData");
  }
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  unsigned int v4;
  int64_t result;

  v4 = -[BKThumbnailDirectory showSpreads](self, "showSpreads", a3);
  result = -[BKPageThumbnailDirectory pageCount](self, "pageCount");
  if (v4)
    return vcvtps_s32_f32((float)(result + 1) * 0.5);
  return result;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  int64_t v5;

  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    v5 = (2 * a3) | 1;
    if (v5 <= -[BKPageThumbnailDirectory pageCount](self, "pageCount"))
      return v5;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a3)
  {
    return 2 * a3;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  int64_t v6;

  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    if (a3)
      return 2 * a3;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = (2 * a3) | 1;
    if (v6 <= -[BKPageThumbnailDirectory pageCount](self, "pageCount"))
      return v6;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  int64_t result;

  if (!-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
    return a3 + 1;
  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    result = -[BKPageThumbnailDirectory rightPageNumberAtIndex:](self, "rightPageNumberAtIndex:", a3);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      return -[BKPageThumbnailDirectory leftPageNumberAtIndex:](self, "leftPageNumberAtIndex:", a3);
  }
  else
  {
    result = -[BKPageThumbnailDirectory leftPageNumberAtIndex:](self, "leftPageNumberAtIndex:", a3);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      return -[BKPageThumbnailDirectory rightPageNumberAtIndex:](self, "rightPageNumberAtIndex:", a3);
  }
  return result;
}

- (unint64_t)indexForPageNumber:(int64_t)a3
{
  unsigned int v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;

  v5 = -[BKThumbnailDirectory showSpreads](self, "showSpreads");
  if (a3 >= 0)
    v6 = a3;
  else
    v6 = a3 + 1;
  v7 = v6 >> 1;
  if (v5)
    v8 = v7;
  else
    v8 = a3 - 1;
  if (v8 < 0
    || v8 >= -[BKPageThumbnailDirectory numberOfCellsInGridView:](self, "numberOfCellsInGridView:", self->super._gridView))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (id)locationAtIndex:(unint64_t)a3
{
  return -[BKDirectoryContent locationForPageNumber:](self, "locationForPageNumber:", -[BKPageThumbnailDirectory pageNumberForCellIndex:](self, "pageNumberForCellIndex:", a3));
}

- (unint64_t)indexForLocation:(id)a3
{
  return -[BKPageThumbnailDirectory indexForPageNumber:](self, "indexForPageNumber:", -[BKDirectoryContent pageNumberForLocation:](self, "pageNumberForLocation:", a3));
}

- (BOOL)isAnnotationVisible:(id)a3 forIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  int64_t v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  v7 = -[BKDirectoryContent pageNumberForLocation:](self, "pageNumberForLocation:", v6);

  if (v7 == (void *)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
  {
    if (v7 == (void *)-[BKPageThumbnailDirectory leftPageNumberAtIndex:](self, "leftPageNumberAtIndex:", a4))
      return 1;
    v9 = -[BKPageThumbnailDirectory rightPageNumberAtIndex:](self, "rightPageNumberAtIndex:", a4);
  }
  else
  {
    v9 = -[BKPageThumbnailDirectory pageNumberForCellIndex:](self, "pageNumberForCellIndex:", a4);
  }
  return v7 == (void *)v9;
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKPageThumbnailDirectory;
  -[BKThumbnailDirectory configureCell:atIndex:](&v16, "configureCell:atIndex:", v6, a4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_annotationsFRC, "fetchedObjects", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if (-[BKPageThumbnailDirectory isAnnotationVisible:forIndex:](self, "isAnnotationVisible:forIndex:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), a4))
        {
          objc_msgSend(v6, "setHasRibbon:", 1);
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)startFetchingAnnotations
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
  NSFetchedResultsController *v12;
  NSFetchedResultsController *annotationsFRC;
  NSFetchedResultsController *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;

  if (!self->_annotationsFRC)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uiManagedObjectContext"));

    v6 = objc_alloc_init((Class)NSFetchRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation pageBookmarksPredicate:](AEAnnotation, "pageBookmarksPredicate:", v7));
    objc_msgSend(v6, "setPredicate:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v5));
    objc_msgSend(v6, "setEntity:", v9);

    v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("plLocationRangeStart"), 1);
    v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v10, 0);
    objc_msgSend(v6, "setSortDescriptors:", v11);
    v12 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)IMUbiquitousFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v5, 0, 0);
    annotationsFRC = self->_annotationsFRC;
    self->_annotationsFRC = v12;

    -[NSFetchedResultsController setDelegate:](self->_annotationsFRC, "setDelegate:", self);
    v14 = self->_annotationsFRC;
    v19 = 0;
    v15 = -[NSFetchedResultsController performFetch:](v14, "performFetch:", &v19);
    v16 = v19;
    if ((v15 & 1) == 0)
    {
      v17 = BCIMLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_11CB30((uint64_t)v16, v18);

    }
  }
}

- (void)stopFetchingAnnotations
{
  NSFetchedResultsController *annotationsFRC;

  -[NSFetchedResultsController setDelegate:](self->_annotationsFRC, "setDelegate:", 0);
  annotationsFRC = self->_annotationsFRC;
  self->_annotationsFRC = 0;

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v9;
  void *v10;
  unint64_t v11;
  id v12;

  v9 = a4;
  if (self->_annotationsFRC == a3)
  {
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location"));
    v11 = -[BKPageThumbnailDirectory indexForLocation:](self, "indexForLocation:", v10);

    -[BKThumbnailDirectory reloadCellAtIndex:](self, "reloadCellAtIndex:", v11);
    v9 = v12;
  }

}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationsFRC, 0);
}

@end
