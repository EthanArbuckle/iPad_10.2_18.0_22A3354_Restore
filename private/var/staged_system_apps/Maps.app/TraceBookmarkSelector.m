@implementation TraceBookmarkSelector

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TraceBookmarkSelector)initWithStyle:(int64_t)a3
{
  TraceBookmarkSelector *v3;
  TraceBookmarkSelector *v4;
  void *v5;
  NSCache *v6;
  NSCache *bookmarkImageCache;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TraceBookmarkSelector;
  v3 = -[TraceBookmarkSelector initWithStyle:](&v11, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TraceBookmarkSelector navigationItem](v3, "navigationItem"));
    objc_msgSend(v5, "setTitle:", CFSTR("Bookmarks"));

    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    bookmarkImageCache = v4->_bookmarkImageCache;
    v4->_bookmarkImageCache = v6;

    -[NSCache setCountLimit:](v4->_bookmarkImageCache, "setCountLimit:", 10);
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v4, "_done");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TraceBookmarkSelector navigationItem](v4, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  return v4;
}

- (void)dealloc
{
  NSCache *bookmarkImageCache;
  objc_super v4;

  -[TraceBookmarkSelector setTracePlayer:](self, "setTracePlayer:", 0);
  bookmarkImageCache = self->_bookmarkImageCache;
  self->_bookmarkImageCache = 0;

  v4.receiver = self;
  v4.super_class = (Class)TraceBookmarkSelector;
  -[TraceBookmarkSelector dealloc](&v4, "dealloc");
}

- (void)reloadBookmarks
{
  NSArray *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  TraceNavBookmarkRow *v10;
  TraceNavBookmarkRow *v11;
  TraceNoBookmarksRow *v12;
  NSArray *bookmarks;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "traceBookmarks"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = [TraceNavBookmarkRow alloc];
        objc_msgSend(v9, "timestamp");
        v11 = -[TraceNavBookmarkRow initWithBookmarkIndex:time:](v10, "initWithBookmarkIndex:time:", (char *)v8 + v6);
        -[NSArray addObject:](v2, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 += (uint64_t)v8;
    }
    while (v5);
  }

  if (!-[NSArray count](v2, "count"))
  {
    v12 = -[TraceBookmarkRow initWithName:detail:]([TraceNoBookmarksRow alloc], "initWithName:detail:", CFSTR("No bookmarks."), &stru_1011EB268);
    -[NSArray addObject:](v2, "addObject:", v12);

  }
  bookmarks = self->_bookmarks;
  self->_bookmarks = v2;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TraceBookmarkSelector tableView](self, "tableView"));
  objc_msgSend(v14, "reloadData");

}

- (void)setTracePlayer:(id)a3
{
  MNTracePlayer *v5;
  MNTracePlayer *v6;

  v5 = (MNTracePlayer *)a3;
  if (self->_tracePlayer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tracePlayer, a3);
    -[NSCache removeAllObjects](self->_bookmarkImageCache, "removeAllObjects");
    -[TraceBookmarkSelector reloadBookmarks](self, "reloadBookmarks");
    v5 = v6;
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_bookmarks, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", objc_msgSend(a4, "row")));
  v8 = objc_opt_class(TraceNavBookmarkRow);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v14 = objc_opt_class(TraceGuideMeBookmarkRow);
    if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TraceGuideMeBookmarkCell")));
      if (v9)
      {
LABEL_12:
        objc_msgSend(v7, "configureCell:", v9);
        goto LABEL_17;
      }
      v15 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("TraceGuideMeBookmarkCell"));
    }
    else
    {
      v16 = objc_opt_class(TraceNoBookmarksRow);
      if ((objc_opt_isKindOfClass(v7, v16) & 1) == 0)
      {
        v9 = 0;
        goto LABEL_17;
      }
      v15 = (id)objc_claimAutoreleasedReturnValue(-[TraceBookmarkSelector _noBookmarksCell](self, "_noBookmarksCell"));
    }
    v9 = v15;
    goto LABEL_12;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TraceNavBookmarkCell")));
  if (!v9)
    v9 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("TraceNavBookmarkCell"));
  v10 = objc_msgSend(v7, "bookmarkIndex");
  objc_msgSend(v7, "configureCell:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_bookmarkImageCache, "objectForKey:", v7));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_bookmarkImageCache, "objectForKey:", v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageView"));
    objc_msgSend(v13, "setImage:", v12);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "traceBookmarks"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v10));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageData"));
    if (objc_msgSend(v20, "length"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v20));
      -[NSCache setObject:forKey:](self->_bookmarkImageCache, "setObject:forKey:", v21, v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageView"));
      objc_msgSend(v22, "setImage:", v21);

    }
  }
LABEL_17:

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  v9 = objc_opt_class(TraceGuideMeBookmarkRow);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
    || (v10 = objc_opt_class(TraceNavBookmarkRow), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    v11 = 100.0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TraceBookmarkSelector;
    -[TraceBookmarkSelector tableView:heightForRowAtIndexPath:](&v14, "tableView:heightForRowAtIndexPath:", v6, v7);
    v11 = v12;
  }

  return v11;
}

- (UITableViewCell)_noBookmarksCell
{
  UITableViewCell *noBookmarksCell;
  UITableViewCell *v4;
  UITableViewCell *v5;

  noBookmarksCell = self->_noBookmarksCell;
  if (!noBookmarksCell)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_noBookmarksCell;
    self->_noBookmarksCell = v4;

    noBookmarksCell = self->_noBookmarksCell;
  }
  return noBookmarksCell;
}

- (void)_done
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TraceBookmarkSelector presentingViewController](self, "presentingViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3)));
  v5 = objc_opt_class(TraceNavBookmarkRow);
  if ((objc_opt_isKindOfClass(v11, v5) & 1) != 0)
  {
    v6 = v11;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traceBookmarks"));
    v9 = objc_msgSend(v6, "bookmarkIndex");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
    objc_msgSend(v10, "timestamp");
    objc_msgSend(v7, "setTracePosition:");

  }
  -[TraceBookmarkSelector _done](self, "_done");

}

- (MNTracePlayer)tracePlayer
{
  return self->_tracePlayer;
}

- (MNTraceBookmarkSelectorDelegate)delegate
{
  return (MNTraceBookmarkSelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmarkImageCache, 0);
  objc_storeStrong((id *)&self->_noBookmarksCell, 0);
  objc_storeStrong((id *)&self->_tracePlayer, 0);
}

@end
