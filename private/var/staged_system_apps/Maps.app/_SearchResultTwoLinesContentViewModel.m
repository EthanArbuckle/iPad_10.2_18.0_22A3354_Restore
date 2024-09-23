@implementation _SearchResultTwoLinesContentViewModel

- (void)dealloc
{
  objc_super v3;

  -[_SearchResultTwoLinesContentViewModel setObservedSearchResult:](self, "setObservedSearchResult:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_SearchResultTwoLinesContentViewModel;
  -[_BasicTwoLinesContentViewModel dealloc](&v3, "dealloc");
}

- (void)setObservedSearchResult:(id)a3
{
  SearchResult *v5;
  SearchResult *observedSearchResult;
  SearchResult *v7;

  v5 = (SearchResult *)a3;
  observedSearchResult = self->_observedSearchResult;
  v7 = v5;
  if (observedSearchResult != v5)
  {
    -[SearchResult removeObserver:forKeyPath:](observedSearchResult, "removeObserver:forKeyPath:", self, CFSTR("reverseGeocoded"));
    objc_storeStrong((id *)&self->_observedSearchResult, a3);
    -[SearchResult addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", self, CFSTR("reverseGeocoded"), 0, 0);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  unsigned int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTwoLinesContentViewModel observedSearchResult](self, "observedSearchResult"));
  if (v9 != v8)
    goto LABEL_10;
  v10 = objc_msgSend(v15, "isEqualToString:", CFSTR("reverseGeocoded"));

  if (v10)
  {
    v11 = -[_SearchResultTwoLinesContentViewModel preferredAddressFormat](self, "preferredAddressFormat");
    if (v11 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_observedSearchResult, "mapItem"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_addressFormattedAsCity"));
    }
    else
    {
      if (v11)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_observedSearchResult, "mapItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_addressFormattedAsShortenedAddress"));
      v14 = sub_1008C3208(v13);
      v9 = (id)objc_claimAutoreleasedReturnValue(v14);

    }
LABEL_9:
    -[_BasicTwoLinesContentViewModel setSubtitleText:](self, "setSubtitleText:", v9);
    -[_BasicTwoLinesContentViewModel updateObservers](self, "updateObservers");
LABEL_10:

  }
}

- (SearchResult)observedSearchResult
{
  return self->_observedSearchResult;
}

- (unint64_t)preferredAddressFormat
{
  return self->_preferredAddressFormat;
}

- (void)setPreferredAddressFormat:(unint64_t)a3
{
  self->_preferredAddressFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedSearchResult, 0);
}

@end
