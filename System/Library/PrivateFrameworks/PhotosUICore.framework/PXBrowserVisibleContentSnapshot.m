@implementation PXBrowserVisibleContentSnapshot

- (PXBrowserVisibleContentSnapshot)initWithDateIntervalGranularity:(unint64_t)a3
{
  PXBrowserVisibleContentSnapshot *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXBrowserVisibleContentSnapshot;
  result = -[PXBrowserVisibleContentSnapshot init](&v5, sel_init);
  if (result)
    result->_dateIntervalGranularity = a3;
  return result;
}

- (PXBrowserVisibleContentSnapshot)init
{
  return -[PXBrowserVisibleContentSnapshot initWithDateIntervalGranularity:](self, "initWithDateIntervalGranularity:", 8);
}

- (NSDateInterval)dateInterval
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 52, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserVisibleContentSnapshot dateInterval]", v6);

  abort();
}

- (unint64_t)dateIntervalGranularity
{
  return self->_dateIntervalGranularity;
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNames, 0);
}

+ (PXBrowserVisibleContentSnapshot)snapshotWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5
{
  return (PXBrowserVisibleContentSnapshot *)objc_msgSend(a1, "snapshotWithIndexPaths:dataSource:dateIntervalGranularity:dateType:", a3, a4, a5, 0);
}

+ (PXBrowserVisibleContentSnapshot)snapshotWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5 dateType:(unint64_t)a6
{
  id v9;
  id v10;
  _PXBrowserDataSourceVisibleContentSnapshot *v11;

  v9 = a4;
  v10 = a3;
  v11 = -[_PXBrowserDataSourceVisibleContentSnapshot initWithIndexPaths:dataSource:dateIntervalGranularity:dateType:]([_PXBrowserDataSourceVisibleContentSnapshot alloc], "initWithIndexPaths:dataSource:dateIntervalGranularity:dateType:", v10, v9, a5, a6);

  return (PXBrowserVisibleContentSnapshot *)v11;
}

@end
