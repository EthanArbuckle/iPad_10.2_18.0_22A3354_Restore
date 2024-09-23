@implementation HomeSearchResultsFilterItem

- (HomeSearchResultsFilterItem)initWithSuggestions:(id)a3 currentSuggestion:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HomeSearchResultsFilterItem *v11;
  NSArray *v12;
  NSArray *suggestions;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HomeSearchResultsFilterItem;
  v11 = -[HomeSearchResultsFilterItem init](&v15, "init");
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    suggestions = v11->_suggestions;
    v11->_suggestions = v12;

    objc_storeStrong((id *)&v11->_currentSuggestion, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSArray hash](self->_suggestions, "hash");
  return (unint64_t)-[GEORelatedSearchSuggestion hash](self->_currentSuggestion, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HomeSearchResultsFilterItem *v4;
  uint64_t v5;
  HomeSearchResultsFilterItem *v6;
  NSArray *v7;
  NSArray *v8;
  GEORelatedSearchSuggestion *v9;
  GEORelatedSearchSuggestion *v10;
  id v11;
  id WeakRetained;
  unsigned __int8 v13;

  v4 = (HomeSearchResultsFilterItem *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[HomeSearchResultsFilterItem suggestions](v6, "suggestions"));
      v8 = v7;
      if (v7 == self->_suggestions || -[NSArray isEqual:](v7, "isEqual:"))
      {
        v9 = (GEORelatedSearchSuggestion *)objc_claimAutoreleasedReturnValue(-[HomeSearchResultsFilterItem currentSuggestion](v6, "currentSuggestion"));
        v10 = v9;
        if (v9 == self->_currentSuggestion || -[GEORelatedSearchSuggestion isEqual:](v9, "isEqual:"))
        {
          v11 = (id)objc_claimAutoreleasedReturnValue(-[HomeSearchResultsFilterItem delegate](v6, "delegate"));
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (v11 == WeakRetained)
            v13 = 1;
          else
            v13 = objc_msgSend(v11, "isEqual:", WeakRetained);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)CFSTR("HomeSearchFilterItem");
}

- (SmallDropDownOutlineCellModel)cellModel
{
  void *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SmallDropDownOutlineCellModel *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEORelatedSearchSuggestion displayString](self->_currentSuggestion, "displayString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_suggestions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "displayString", (_QWORD)v13));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = -[SmallDropDownOutlineCellModel initWithButtonTitle:dropDownTitles:selectedIndex:delegate:backgroundModel:]([SmallDropDownOutlineCellModel alloc], "initWithButtonTitle:dropDownTitles:selectedIndex:delegate:backgroundModel:", v3, v4, -[NSArray indexOfObject:](self->_suggestions, "indexOfObject:", self->_currentSuggestion), self, 0);
  return v11;
}

- (void)smallDropDownOutlineCell:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id WeakRetained;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", a4));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchResultsFilterItem:didSelectSuggestion:", self, v6);

}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (GEORelatedSearchSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (HomeSearchResultsFilterItemDelegate)delegate
{
  return (HomeSearchResultsFilterItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
