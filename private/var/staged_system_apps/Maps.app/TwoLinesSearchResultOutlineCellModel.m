@implementation TwoLinesSearchResultOutlineCellModel

- (TwoLinesSearchResultOutlineCellModel)initWithSearchResult:(id)a3 backgroundModel:(id)a4
{
  id v7;
  id v8;
  TwoLinesSearchResultOutlineCellModel *v9;
  TwoLinesSearchResultOutlineCellModel *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BFE2D4;
  v13[3] = &unk_1011E8FE8;
  objc_copyWeak(&v14, &location);
  v12.receiver = self;
  v12.super_class = (Class)TwoLinesSearchResultOutlineCellModel;
  v9 = -[TwoLinesBasicOutlineCellModel initWithBackgroundModel:contentModelBlock:](&v12, "initWithBackgroundModel:contentModelBlock:", v8, v13);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_searchResult, a3);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

- (unint64_t)hash
{
  return -[SearchResult hash](self->_searchResult, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesSearchResultOutlineCellModel *v4;
  TwoLinesSearchResultOutlineCellModel *v5;
  uint64_t v6;
  TwoLinesSearchResultOutlineCellModel *v7;
  SearchResult *v8;
  SearchResult *v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = (TwoLinesSearchResultOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)TwoLinesSearchResultOutlineCellModel;
    if (-[TwoLinesBasicOutlineCellModel isEqual:](&v12, "isEqual:", v7))
    {
      v8 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[TwoLinesSearchResultOutlineCellModel searchResult](v7, "searchResult"));
      v9 = v8;
      if (v8 == self->_searchResult)
        v10 = 1;
      else
        v10 = -[SearchResult isEqual:](v8, "isEqual:");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
