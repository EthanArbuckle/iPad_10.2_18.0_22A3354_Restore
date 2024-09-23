@implementation THSearchTableViewDataSource

- (THSearchTableViewDataSource)initWithSearchController:(id)a3 searchViewMode:(int)a4
{
  id v7;
  THSearchTableViewDataSource *v8;
  THSearchTableViewDataSource *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)THSearchTableViewDataSource;
  v8 = -[THSearchTableViewDataSource init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchController, a3);
    v9->_searchViewMode = a4;
    *(_WORD *)&v9->_showTextResults = 257;
  }

  return v9;
}

- (void)updateForResultsKind:(int)a3
{
  BOOL v3;
  BOOL v4;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = 0;
    v4 = 1;
  }
  else
  {
    v4 = 0;
    v3 = 1;
  }
  self->_showTextResults = v3;
  self->_showMediaResults = v4;
}

- (int64_t)p_numberOfSections
{
  if (-[THSearchTableViewDataSource searchViewMode](self, "searchViewMode") == 2)
    return self->_showMediaResults + (unint64_t)self->_showTextResults;
  else
    return 1;
}

- (BOOL)p_onlyTopResults
{
  return self->_showTextResults && self->_showMediaResults;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[THSearchTableViewDataSource p_numberOfSections](self, "p_numberOfSections", a3);
}

- (int)p_resultKindForSection:(int64_t)a3
{
  return a3 || !self->_showTextResults;
}

- (id)p_resultsForSection:(int64_t)a3 onlyTop:(BOOL)a4
{
  unsigned int v7;
  void *v8;
  void *v9;
  char *v10;
  char *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = -[THSearchTableViewDataSource searchViewMode](self, "searchViewMode");
  if (v7 == 2)
  {
    v14 = -[THSearchTableViewDataSource p_resultKindForSection:](self, "p_resultKindForSection:", a3);
    if (v14 == 1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchController](self, "searchController"));
      v16 = v18;
      if (a4)
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topMediaSearchResults"));
      else
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mediaSearchResults"));
    }
    else
    {
      if (v14)
      {
LABEL_12:
        v8 = 0;
        return v8;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchController](self, "searchController"));
      v16 = v15;
      if (a4)
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topTextSearchResults"));
      else
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textSearchResults"));
    }
    v8 = (void *)v17;

    return v8;
  }
  if (v7 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource suggestions](self, "suggestions"));
    return v8;
  }
  if (v7)
    goto LABEL_12;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchController](self, "searchController"));
  v10 = (char *)objc_msgSend(v9, "recentSearchCount");

  if ((uint64_t)v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchController](self, "searchController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recentSearchQueryAtIndex:", i));
      objc_msgSend(v8, "addObject:", v13);

    }
  }
  return v8;
}

- (id)p_resultsForSection:(int64_t)a3
{
  return -[THSearchTableViewDataSource p_resultsForSection:onlyTop:](self, "p_resultsForSection:onlyTop:", a3, -[THSearchTableViewDataSource p_onlyTopResults](self, "p_onlyTopResults"));
}

- (unint64_t)numberOfResultsInSection:(int64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = -[THSearchTableViewDataSource searchViewMode](self, "searchViewMode");
  switch(v5)
  {
    case 2u:
      v10 = -[THSearchTableViewDataSource p_resultKindForSection:](self, "p_resultKindForSection:", a3);
      if (v10 == 1)
      {
        v14 = THBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v8 = v7;
        v9 = CFSTR("Media");
        goto LABEL_11;
      }
      if (!v10)
      {
        v11 = THBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v8 = v7;
        v9 = CFSTR("Text");
        goto LABEL_11;
      }
      break;
    case 1u:
      v13 = THBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v8 = v7;
      v9 = CFSTR("Suggestions");
      goto LABEL_11;
    case 0u:
      v6 = THBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = v7;
      v9 = CFSTR("Recent Searches");
LABEL_11:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_43D7D8, 0));

      return v12;
  }
  v12 = 0;
  return v12;
}

- (id)searchResultForTableIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", objc_msgSend(v4, "section")));
  v6 = objc_msgSend(v5, "count");

  if ((uint64_t)objc_msgSend(v4, "row") >= (uint64_t)v6)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", objc_msgSend(v4, "section")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "row")));

  }
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  unsigned int v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  unsigned int v12;
  BOOL v13;
  void *v14;
  void *v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchController](self, "searchController", a3));
  v7 = -[THSearchTableViewDataSource searchViewMode](self, "searchViewMode");
  if (v7 == 2)
  {
    v9 = -[THSearchTableViewDataSource numberOfResultsInSection:](self, "numberOfResultsInSection:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:onlyTop:](self, "p_resultsForSection:onlyTop:", a4, 0));
    v11 = objc_msgSend(v10, "count");

    v12 = -[THSearchTableViewDataSource p_onlyTopResults](self, "p_onlyTopResults");
    if (v9)
      v13 = v9 >= (unint64_t)v11;
    else
      v13 = 0;
    if (v13)
      v14 = (void *)v9;
    else
      v14 = (void *)(v9 + 1);
    if (v12)
      v8 = v14;
    else
      v8 = (id)v9;
  }
  else if (v7 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource suggestions](self, "suggestions"));
    v8 = objc_msgSend(v15, "count");

  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "recentSearchCount");
  }

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return objc_alloc_init((Class)UITableViewCell);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 searchViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchController](self, "searchController"));
  v12 = -[THSearchTableViewDataSource searchViewMode](self, "searchViewMode");
  if (v12 == 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", objc_msgSend(v9, "section")));
    v15 = objc_msgSend(v14, "count");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchResultForTableIndexPath:](self, "searchResultForTableIndexPath:", v9));
    if (v13)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView:cellForSearchResult:", v8, v13));
    }
    else
    {
      v26 = -[THSearchTableViewDataSource p_resultKindForSection:](self, "p_resultKindForSection:", objc_msgSend(v9, "section"));
      if (v15)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:onlyTop:](self, "p_resultsForSection:onlyTop:", objc_msgSend(v9, "section"), 0));
        v28 = objc_msgSend(v27, "count");

        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView:seeAllResultsCellWithKind:count:", v8, v26, v28));
      }
      else
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView:noResultsCellWithKind:", v8, v26));
      }
    }
  }
  else
  {
    if (v12 == 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource suggestions](self, "suggestions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v9, "row")));

      if (objc_msgSend(v11, "isEncodedResultForPageNumber:", v13))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNumberStringFromEncodedPageNumberResult:", v13));
        v19 = THBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_43D7D8, 0));

        v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v18));
        v13 = (void *)v22;
      }
    }
    else
    {
      if (v12)
      {
        v23 = 0;
        goto LABEL_12;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recentSearchQueryAtIndex:", objc_msgSend(v9, "row")));
    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView:cellForPlainString:", v8, v13));
  }
  v23 = (void *)v16;

LABEL_12:
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
  objc_msgSend(v23, "setBackgroundColor:", v24);

  return v23;
}

- (BOOL)indexPathCorrespondsToSeeAllResultsRow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", objc_msgSend(v4, "section")));
  v6 = objc_msgSend(v5, "count");

  if ((uint64_t)objc_msgSend(v4, "row") >= (uint64_t)v6)
  {
    v8 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchResultForTableIndexPath:](self, "searchResultForTableIndexPath:", v4));

    v8 = v7 == 0;
  }
  if (v6)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (BOOL)indexPathCorrespondsToSearchResultRow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", objc_msgSend(v4, "section")));
  v6 = objc_msgSend(v5, "count");

  if ((uint64_t)objc_msgSend(v4, "row") >= (uint64_t)v6)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THSearchTableViewDataSource searchResultForTableIndexPath:](self, "searchResultForTableIndexPath:", v4));

    v8 = v7 != 0;
  }

  return v8;
}

- (THSearchController)searchController
{
  return self->_searchController;
}

- (int)searchViewMode
{
  return self->_searchViewMode;
}

- (BOOL)showTextResults
{
  return self->_showTextResults;
}

- (BOOL)showMediaResults
{
  return self->_showMediaResults;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
