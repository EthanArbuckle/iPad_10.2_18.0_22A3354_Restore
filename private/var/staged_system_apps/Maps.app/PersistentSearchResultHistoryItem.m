@implementation PersistentSearchResultHistoryItem

- (BOOL)hasSearchResult
{
  return self->_searchResult != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentSearchResultHistoryItem;
  v3 = -[PersistentSearchResultHistoryItem description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentSearchResultHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SearchResult *searchResult;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  searchResult = self->_searchResult;
  if (searchResult)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](searchResult, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("searchResult"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A9646C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  SearchResult *searchResult;

  searchResult = self->_searchResult;
  if (searchResult)
    PBDataWriterWriteSubmessage(a3, searchResult, 1);
}

- (void)copyTo:(id)a3
{
  SearchResult *searchResult;

  searchResult = self->_searchResult;
  if (searchResult)
    objc_msgSend(a3, "setSearchResult:", searchResult);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[SearchResult copyWithZone:](self->_searchResult, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SearchResult *searchResult;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    searchResult = self->_searchResult;
    if ((unint64_t)searchResult | v4[1])
      v6 = -[SearchResult isEqual:](searchResult, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[SearchResult hash](self->_searchResult, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SearchResult *searchResult;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  searchResult = self->_searchResult;
  v6 = v4[1];
  if (searchResult)
  {
    if (v6)
    {
      v7 = v4;
      -[SearchResultRepr mergeFrom:](searchResult, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[PersistentSearchResultHistoryItem setSearchResult:](self, "setSearchResult:");
    goto LABEL_6;
  }

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
