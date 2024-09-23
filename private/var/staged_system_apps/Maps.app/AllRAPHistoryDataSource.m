@implementation AllRAPHistoryDataSource

- (AllRAPHistoryDataSource)initWithCollectionView:(id)a3 reportSection:(unint64_t)a4
{
  AllRAPHistoryDataSource *v5;
  AllRAPHistoryDataSource *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AllRAPHistoryDataSource;
  v5 = -[DataSource initWithCollectionView:updateLocation:](&v11, "initWithCollectionView:updateLocation:", a3, 0);
  v6 = v5;
  if (v5)
  {
    v5->_reportSection = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "observers"));
    objc_msgSend(v8, "registerObserver:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    objc_msgSend(v9, "refineRAPHistory");

    -[AllRAPHistoryDataSource _loadReports](v6, "_loadReports");
  }
  return v6;
}

- (void)_loadReports
{
  NSArray *v3;
  NSArray *reports;
  id v5;

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[AllRAPHistoryDataSource _reportHistoryContentForReportSection:](self, "_reportHistoryContentForReportSection:", self->_reportSection));
  reports = self->_reports;
  self->_reports = v3;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSourceUpdated:", self);

}

- (id)_reportHistoryContentForReportSection:(unint64_t)a3
{
  NSArray *v5;
  NSArray *reports;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  reports = self->_reports;
  self->_reports = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rapHistory"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v17 = objc_msgSend(v16, "reportStatus", (_QWORD)v26);
        v18 = v9;
        if (v17)
        {
          if (v17 != 1)
            continue;
          v18 = v10;
        }
        objc_msgSend(v18, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  v19 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("dateOfReportCreation"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v19));
  switch(a3)
  {
    case 4uLL:
      v22 = (NSArray *)v11;
LABEL_19:
      v23 = self->_reports;
      self->_reports = v22;

      break;
    case 3uLL:
      v21 = v10;
      goto LABEL_18;
    case 2uLL:
      v21 = v9;
LABEL_18:
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sortedArrayUsingDescriptors:", v20, (_QWORD)v26));
      goto LABEL_19;
  }
  v24 = self->_reports;

  return v24;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_reports, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSArray *reports;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  reports = self->_reports;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](reports, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRAPReportsHistory:allowDisclosureIndicator:](TwoLinesContentViewModelComposer, "cellModelForRAPReportsHistory:allowDisclosureIndicator:", v8, 1));
  objc_msgSend(v10, "setViewModel:", v11);

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return self->_reportSection == 3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_reportSection == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_reports, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v9, "dataSource:itemTapped:", self, v8);

  }
  objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v7, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reports, 0);
}

@end
