@implementation CustomSearchResultHistoryItem

- (CustomSearchResultHistoryItem)initWithSearchResult:(id)a3
{
  id v5;
  CustomSearchResultHistoryItem *v6;
  CustomSearchResultHistoryItem *v7;
  CustomSearchResultHistoryItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CustomSearchResultHistoryItem;
  v6 = -[CustomSearchResultHistoryItem init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customSearchResult, a3);
    v8 = v7;
  }

  return v7;
}

- (double)timestamp
{
  double result;

  -[SearchResultRepr timestamp](self->_customSearchResult, "timestamp");
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CustomSearchResultHistoryItem *v5;
  uint64_t v6;
  BOOL v7;

  v5 = (CustomSearchResultHistoryItem *)a3;
  if (self == v5)
  {
    v7 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    v7 = (objc_opt_isKindOfClass(v5, v6) & 1) != 0 && v5->_customSearchResult == self->_customSearchResult;
  }

  return v7;
}

- (SearchResult)customSearchResult
{
  return self->_customSearchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSearchResult, 0);
}

@end
