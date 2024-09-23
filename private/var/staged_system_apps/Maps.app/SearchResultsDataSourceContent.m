@implementation SearchResultsDataSourceContent

- (SearchResultsDataSourceContent)initWithOrderedDataSource:(id)a3
{
  id v5;
  SearchResultsDataSourceContent *v6;
  SearchResultsDataSourceContent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultsDataSourceContent;
  v6 = -[SearchResultsDataSourceContent init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_orderedDataSource, a3);

  return v7;
}

- (NSArray)objects
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "orderedObjects"));

  return (NSArray *)v3;
}

- (unint64_t)count
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "orderedObjects"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (int64_t)numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v3 = objc_msgSend(v2, "numberOfSections");

  return (int64_t)v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v5 = objc_msgSend(v4, "numberOfRowsInSection:", a3);

  return (int64_t)v5;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexPath:", v4));

  return v6;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleForHeaderInSection:", a3));

  return v5;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent orderedDataSource](self, "orderedDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewForHeaderInSection:isFirstNonEmptySection:", a3, v4));

  return v7;
}

- (OrderedDataSource)orderedDataSource
{
  return self->_orderedDataSource;
}

- (void)setOrderedDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedDataSource, 0);
}

@end
