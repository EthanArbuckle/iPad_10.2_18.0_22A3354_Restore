@implementation PXCuratedLibraryVisibleContentSnapshot

- (NSArray)locationNames
{
  return (NSArray *)(*((uint64_t (**)(id, int64_t))self->_locationNamesFuture + 2))(self->_locationNamesFuture, self->_dataSourceIdentifier);
}

- (NSString)localizedPlaceholderText
{
  void *v2;

  if (self->_isFiltering)
  {
    PXLocalizedStringFromTable(CFSTR("PXBrowserSummaryNoFilteringResultsPlaceholderText"), CFSTR("PhotosUICore"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)(*((uint64_t (**)(id, int64_t))self->_dateIntervalFuture + 2))(self->_dateIntervalFuture, self->_dataSourceIdentifier);
}

- (unint64_t)dateIntervalGranularity
{
  return 16;
}

- (PXCuratedLibraryVisibleContentSnapshot)initWithLibraryLayout:(id)a3 dateType:(unint64_t)a4
{
  id v6;
  PXCuratedLibraryVisibleContentSnapshot *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id dateIntervalFuture;
  uint64_t v20;
  id locationNamesFuture;
  void *v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXCuratedLibraryVisibleContentSnapshot;
  v7 = -[PXCuratedLibraryVisibleContentSnapshot init](&v25, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "visibleRect");
    objc_msgSend(v6, "safeAreaInsets");
    PXEdgeInsetsInsetRect();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v6, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_dataSourceIdentifier = objc_msgSend(v17, "identifier");

    objc_msgSend(v6, "dateIntervalFutureForContentInRect:type:", a4, v9, v11, v13, v15);
    v18 = objc_claimAutoreleasedReturnValue();
    dateIntervalFuture = v7->_dateIntervalFuture;
    v7->_dateIntervalFuture = (id)v18;

    objc_msgSend(v6, "locationNamesFutureForContentInRect:", v9, v11, v13, v15);
    v20 = objc_claimAutoreleasedReturnValue();
    locationNamesFuture = v7->_locationNamesFuture;
    v7->_locationNamesFuture = (id)v20;

    objc_msgSend(v16, "currentContentFilterState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isFiltering"))
    {
      v7->_isFiltering = 1;
    }
    else
    {
      objc_msgSend(v16, "libraryFilterState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_isFiltering = objc_msgSend(v23, "isFiltering");

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationNamesFuture, 0);
  objc_storeStrong(&self->_dateIntervalFuture, 0);
}

- (PXCuratedLibraryVisibleContentSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryVisibleContentSnapshot.m"), 27, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryVisibleContentSnapshot init]");

  abort();
}

@end
