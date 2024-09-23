@implementation BKLibraryBookshelfMetrics

+ (id)_manager
{
  if (qword_1009F4DA8 != -1)
    dispatch_once(&qword_1009F4DA8, &stru_1008E7438);
  return (id)qword_1009F4DA0;
}

+ (id)_templatePackageURL
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("BKLibraryBookshelfConfiguration"), CFSTR("tpkg")));

  return v4;
}

+ (id)_templateFactory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000783DC;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F4DB8 != -1)
    dispatch_once(&qword_1009F4DB8, block);
  return (id)qword_1009F4DB0;
}

+ (id)_metricsTemplateURL
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078514;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F4DC8 != -1)
    dispatch_once(&qword_1009F4DC8, block);
  return (id)qword_1009F4DC0;
}

- (BKLibraryBookshelfMetrics)initWithObserver:(id)a3
{
  id v4;
  BKLibraryBookshelfMetrics *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BCLayoutMetrics *v11;
  BCLayoutMetrics *metrics;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfMetrics;
  v5 = -[BKLibraryBookshelfMetrics init](&v14, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)BCLayoutMetrics);
    v7 = objc_msgSend((id)objc_opt_class(v5), "_templateFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend((id)objc_opt_class(v5), "_manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (BCLayoutMetrics *)objc_msgSend(v6, "initWithObserver:factory:manager:delegate:", v4, v8, v10, v5);
    metrics = v5->_metrics;
    v5->_metrics = v11;

  }
  return v5;
}

- (NSDictionary)computedMetrics
{
  return (NSDictionary *)-[BCLayoutMetrics metrics](self->_metrics, "metrics");
}

- (BOOL)updateIfNeededWithEnvironment:(id)a3 bookshelfLayoutMode:(unint64_t)a4 editMode:(BOOL)a5 isPopover:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  if (self->_bookshelfLayoutMode != a4 || self->_editMode != v7 || self->_isPopover != v6)
  {
    self->_bookshelfLayoutMode = a4;
    self->_editMode = v7;
    self->_isPopover = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfMetrics metrics](self, "metrics"));
    objc_msgSend(v11, "invalidate");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfMetrics metrics](self, "metrics"));
  v13 = objc_msgSend(v12, "updateIfNeededWithEnvironment:", v10);

  return v13;
}

- (void)invalidate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfMetrics metrics](self, "metrics"));
  objc_msgSend(v2, "invalidate");

}

- (BOOL)compactWidth
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfMetrics metrics](self, "metrics"));
  v3 = objc_msgSend(v2, "compactWidth");

  return v3;
}

- (id)metricsTemplateURL
{
  void *v2;

  v2 = (void *)objc_opt_class(self);
  return _objc_msgSend(v2, "_metricsTemplateURL");
}

- (void)addSymbolsToMetricsEnvironment:(id)a3 package:(id)a4
{
  id v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;
  unsigned __int16 v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v7 = objc_msgSend(v6, "nameForString:", CFSTR("libraryEnv::layoutMode"));
  if ((id)-[BKLibraryBookshelfMetrics bookshelfLayoutMode](self, "bookshelfLayoutMode") == (id)1)
    v8 = CFSTR("grid");
  else
    v8 = CFSTR("list");
  objc_msgSend(v14, "setSymbol:forName:", (unsigned __int16)objc_msgSend(v6, "symbolForString:", v8), v7);
  v9 = objc_msgSend(v6, "nameForString:", CFSTR("libraryEnv::interactionMode"));
  if (-[BKLibraryBookshelfMetrics editMode](self, "editMode"))
    v10 = CFSTR("edit");
  else
    v10 = CFSTR("none");
  objc_msgSend(v14, "setSymbol:forName:", (unsigned __int16)objc_msgSend(v6, "symbolForString:", v10), v9);
  v11 = objc_msgSend(v6, "nameForString:", CFSTR("libraryEnv::popoverMode"));
  if (-[BKLibraryBookshelfMetrics isPopover](self, "isPopover"))
    v12 = CFSTR("popover");
  else
    v12 = CFSTR("none");
  v13 = (unsigned __int16)objc_msgSend(v6, "symbolForString:", v12);

  objc_msgSend(v14, "setSymbol:forName:", v13, v11);
}

+ (id)supportedMetrics
{
  BKLibraryBookshelfColumnMetrics *v2;
  BKLibraryBookshelfMainHeaderMetrics *v3;
  BKLibraryBookshelfBookHeaderMetrics *v4;
  BKLibraryBookshelfActionBarMetrics *v5;
  BKLibraryCollectionsListMetrics *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[5];

  v2 = objc_opt_new(BKLibraryBookshelfColumnMetrics);
  v21[0] = v2;
  v3 = objc_opt_new(BKLibraryBookshelfMainHeaderMetrics);
  v21[1] = v3;
  v4 = objc_opt_new(BKLibraryBookshelfBookHeaderMetrics);
  v21[2] = v4;
  v5 = objc_opt_new(BKLibraryBookshelfActionBarMetrics);
  v21[3] = v5;
  v6 = objc_opt_new(BKLibraryCollectionsListMetrics);
  v21[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 5));
  v8 = objc_msgSend(v7, "mutableCopy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfCellMetrics sectionNames](BKLibraryBookshelfCellMetrics, "sectionNames", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfCellMetrics cellMetricsForSectionName:](BKLibraryBookshelfCellMetrics, "cellMetricsForSectionName:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13)));
        objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (BCLayoutMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (unint64_t)bookshelfLayoutMode
{
  return self->_bookshelfLayoutMode;
}

- (void)setBookshelfLayoutMode:(unint64_t)a3
{
  self->_bookshelfLayoutMode = a3;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(BOOL)a3
{
  self->_editMode = a3;
}

- (BOOL)isPopover
{
  return self->_isPopover;
}

- (void)setIsPopover:(BOOL)a3
{
  self->_isPopover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
