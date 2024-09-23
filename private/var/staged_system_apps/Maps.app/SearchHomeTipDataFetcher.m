@implementation SearchHomeTipDataFetcher

- (SearchHomeTipDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v5;
  SearchHomeTipDataFetcher *v6;
  SearchHomeTipDataFetcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeTipDataFetcher;
  v6 = -[SearchHomeTipDataFetcher init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_isFetchingDataComplete = 1;
    objc_storeWeak((id *)&v6->_delegate, v5);
  }

  return v7;
}

- (void)fetchContent
{
  void *v3;
  SearchHomeTipDataProvider *v4;
  void *v5;
  SearchHomeTipDataProvider *v6;
  void *v7;
  void *v8;
  SearchHomeTipDataProvider *v9;
  const __CFString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipDataFetcher dataProviders](self, "dataProviders"));

  if (!v3)
  {
    v4 = [SearchHomeTipDataProvider alloc];
    v10 = CFSTR("SearchHomeTip");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    v6 = -[SearchHomeTipDataProvider initWithObjects:type:identifier:title:](v4, "initWithObjects:type:identifier:title:", v5, 6, CFSTR("SearchHomeTip"), &stru_1011EB268);

    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    -[SearchHomeTipDataFetcher setDataProviders:](self, "setDataProviders:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipDataFetcher delegate](self, "delegate"));
  objc_msgSend(v8, "didUpdateDataFetcher:", self);

}

- (SearchHomeDataFetcherDelegate)delegate
{
  return (SearchHomeDataFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
  objc_storeStrong((id *)&self->_dataProviders, a3);
}

- (BOOL)isFetchingDataComplete
{
  return self->_isFetchingDataComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
