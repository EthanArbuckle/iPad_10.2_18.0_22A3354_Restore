@implementation PXFeedSyntheticDataSourceManager

- (PXFeedSyntheticDataSourceManager)init
{
  return -[PXFeedSyntheticDataSourceManager initWithNumberOfSections:numberOfItemsPerSection:](self, "initWithNumberOfSections:numberOfItemsPerSection:", 0, 0);
}

- (PXFeedSyntheticDataSourceManager)initWithNumberOfSections:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4
{
  PXFeedSyntheticDataSourceManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXFeedSyntheticDataSourceManager;
  result = -[PXSectionedDataSourceManager init](&v7, sel_init);
  if (result)
  {
    result->_initialNumberOfSections = a3;
    result->_initialNumberOfItemsPerSection = a4;
  }
  return result;
}

- (id)createInitialDataSource
{
  return -[_PXFeedSyntheticDataSource initWithNumberOfSections:numberOfItemsPerSection:]([_PXFeedSyntheticDataSource alloc], "initWithNumberOfSections:numberOfItemsPerSection:", self->_initialNumberOfSections, self->_initialNumberOfItemsPerSection);
}

@end
