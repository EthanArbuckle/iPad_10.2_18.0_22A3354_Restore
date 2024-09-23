@implementation SingleResultSearchHistoryRecorder

- (SingleResultSearchHistoryRecorder)initWithSearchResult:(id)a3
{
  id v5;
  SingleResultSearchHistoryRecorder *v6;
  SingleResultSearchHistoryRecorder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SingleResultSearchHistoryRecorder;
  v6 = -[SingleResultSearchHistoryRecorder init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchResult, a3);

  return v7;
}

- (void)recordItemInHistory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SingleResultSearchHistoryRecorder searchResult](self, "searchResult"));
  objc_msgSend(v3, "setSearchToSupersedeIfRecordedInHistory:", v6);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SingleResultSearchHistoryRecorder searchResult](self, "searchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  if (v5)
    +[HistoryEntryRecentsItem saveMapItem:superseedUUID:](HistoryEntryRecentsItem, "saveMapItem:superseedUUID:", v5, v6);

}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
