@implementation SearchResultHistoryItem

- (SearchResultHistoryItem)initWithSearchResult:(id)a3
{
  id v4;
  SearchResultHistoryItem *v5;
  id v6;
  SearchResultHistoryItem *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultHistoryItem;
  v5 = -[SearchResultHistoryItem init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    -[PersistentSearchResultHistoryItem setSearchResult:](v5, "setSearchResult:", v6);
    v7 = v5;

  }
  return v5;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentSearchResultHistoryItem searchResult](self, "searchResult"));
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentSearchResultHistoryItem searchResult](self, "searchResult"));
  objc_msgSend(v5, "updateModel:", v4);

  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v9));
  objc_msgSend(v4, "setDebugSubtitle:", v8);

}

@end
