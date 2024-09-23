@implementation PXPhotosVisibleContentSnapshot

- (PXPhotosVisibleContentSnapshot)initWithPhotosLayout:(id)a3 dateType:(unint64_t)a4 dateIntervalGranularity:(unint64_t)a5
{
  id v8;
  PXPhotosVisibleContentSnapshot *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id dateIntervalFuture;
  uint64_t v22;
  id locationNamesFuture;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXPhotosVisibleContentSnapshot;
  v9 = -[PXPhotosVisibleContentSnapshot init](&v28, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "visibleRect");
    objc_msgSend(v8, "safeAreaInsets");
    PXEdgeInsetsInsetRect();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v8, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_dataSourceIdentifier = objc_msgSend(v19, "identifier");

    v9->_dateIntervalGranularity = a5;
    objc_msgSend(v8, "dateIntervalFutureForContentInRect:type:", a4, v11, v13, v15, v17);
    v20 = objc_claimAutoreleasedReturnValue();
    dateIntervalFuture = v9->_dateIntervalFuture;
    v9->_dateIntervalFuture = (id)v20;

    objc_msgSend(v8, "locationNamesFutureForContentInRect:", v11, v13, v15, v17);
    v22 = objc_claimAutoreleasedReturnValue();
    locationNamesFuture = v9->_locationNamesFuture;
    v9->_locationNamesFuture = (id)v22;

    objc_msgSend(v8, "viewModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dataSourceManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "filterPredicate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isFiltering = v26 != 0;

  }
  return v9;
}

- (PXPhotosVisibleContentSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosVisibleContentSnapshot.m"), 37, CFSTR("%s is not available as initializer"), "-[PXPhotosVisibleContentSnapshot init]");

  abort();
}

- (NSDateInterval)dateInterval
{
  void (**dateIntervalFuture)(_QWORD, _QWORD);

  dateIntervalFuture = (void (**)(_QWORD, _QWORD))self->_dateIntervalFuture;
  if (dateIntervalFuture)
  {
    dateIntervalFuture[2](dateIntervalFuture, self->_dataSourceIdentifier);
    dateIntervalFuture = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return (NSDateInterval *)dateIntervalFuture;
}

- (NSArray)locationNames
{
  void (**locationNamesFuture)(_QWORD, _QWORD);

  locationNamesFuture = (void (**)(_QWORD, _QWORD))self->_locationNamesFuture;
  if (locationNamesFuture)
  {
    locationNamesFuture[2](locationNamesFuture, self->_dataSourceIdentifier);
    locationNamesFuture = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)locationNamesFuture;
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

- (unint64_t)dateIntervalGranularity
{
  return self->_dateIntervalGranularity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationNamesFuture, 0);
  objc_storeStrong(&self->_dateIntervalFuture, 0);
}

@end
