@implementation RAPHomeDataSource

- (RAPHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RAPHomeDataSource *v7;
  void *v8;
  uint64_t v9;
  NSArray *allReports;
  void *v11;
  void *v12;
  void *v13;
  RAPReportMenuProvider *v14;
  RAPReportMenuProvider *reportMenuProvider;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a4;
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)RAPHomeDataSource;
  v7 = -[DataSource initWithCollectionView:updateLocation:](&v26, "initWithCollectionView:updateLocation:", v6, v4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rapHistory"));
    allReports = v7->_allReports;
    v7->_allReports = (NSArray *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    objc_msgSend(v11, "refineRAPHistory");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "observers"));
    objc_msgSend(v13, "registerObserver:", v7);

    v14 = objc_alloc_init(RAPReportMenuProvider);
    reportMenuProvider = v7->_reportMenuProvider;
    v7->_reportMenuProvider = v14;

    -[RAPHomeDataSource _loadReportHistoryContent](v7, "_loadReportHistoryContent");
    -[RAPHomeDataSource _populateActionSection](v7, "_populateActionSection");
    -[RAPHomeDataSource _populateIncidentsSection](v7, "_populateIncidentsSection");
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(ReportLinkCell), CFSTR("ReportLinkCell"));
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(IncidentsCell), CFSTR("IncidentsCell"));
    v16 = objc_opt_class(TwoLinesCollectionViewInsetGroupedListCell);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v16, v17);

    v18 = objc_opt_class(UserProfileSectionFooterView);
    v19 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v18, UICollectionElementKindSectionFooter, v21);

    v22 = objc_opt_class(SectionHeaderCollectionReusableView);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
    objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v22, UICollectionElementKindSectionHeader, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v7, "collectionView"));
    objc_msgSend(v24, "reloadData");

  }
  return v7;
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_homeViewSections, "count") == 0;
}

- (void)_populateActionSection
{
  NSMutableArray *v3;
  NSMutableArray *reportActionSections;
  void *v5;
  unsigned int v6;
  void *v7;
  _QWORD v8[5];

  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", &off_101273350));
  reportActionSections = self->_reportActionSections;
  self->_reportActionSections = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v6 = objc_msgSend(v5, "supportsNavigation");

  if (v6)
  {
    -[NSMutableArray addObject:](self->_reportActionSections, "addObject:", &off_10126D540);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100476DFC;
    v8[3] = &unk_1011B7B30;
    v8[4] = self;
    objc_msgSend(v7, "fetchTrafficIncidentsLayout:", v8);

  }
}

- (void)_populateIncidentsSection
{
  NSMutableArray *v3;
  NSMutableArray *incidentsSections;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  _UNKNOWN **v14;
  uint64_t v15;

  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  incidentsSections = self->_incidentsSections;
  self->_incidentsSections = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v6 = (uint64_t)objc_msgSend(v5, "crashesCount");

  if (v6 >= 1)
    -[NSMutableArray addObject:](self->_incidentsSections, "addObject:", &off_10126D4F8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v8 = (uint64_t)objc_msgSend(v7, "hazardsCount");

  if (v8 >= 1)
    -[NSMutableArray addObject:](self->_incidentsSections, "addObject:", &off_10126D558);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v10 = objc_msgSend(v9, "inChina");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "roadWorkCount");

    if ((uint64_t)v13 <= 0)
      return;
    v14 = &off_10126D528;
  }
  else
  {
    v15 = (uint64_t)objc_msgSend(v11, "speedChecksCount");

    if (v15 < 1)
      return;
    v14 = &off_10126D510;
  }
  -[NSMutableArray addObject:](self->_incidentsSections, "addObject:", v14);
}

- (void)_loadReportHistoryContent
{
  id v3;

  -[RAPHomeDataSource _buildReportHistoryContent](self, "_buildReportHistoryContent");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v3, "dataSourceUpdated:", self);

}

- (void)_buildReportHistoryContent
{
  NSArray *v3;
  NSArray *reportsInReview;
  NSArray *v5;
  NSArray *reportsAlreadyReviewed;
  NSArray *v7;
  NSArray *reportsTellUsMore;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  objc_class *v26;
  void *v27;
  NSArray *v28;
  NSArray *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  reportsInReview = self->_reportsInReview;
  self->_reportsInReview = v3;

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  reportsAlreadyReviewed = self->_reportsAlreadyReviewed;
  v30 = 136;
  self->_reportsAlreadyReviewed = v5;

  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  reportsTellUsMore = self->_reportsTellUsMore;
  self->_reportsTellUsMore = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapHistory"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v20 = objc_msgSend(v19, "reportStatus", v30);
        v21 = v11;
        if (!v20)
          goto LABEL_11;
        if (v20 == 2)
        {
          v21 = v13;
LABEL_11:
          objc_msgSend(v21, "addObject:", v19);
          continue;
        }
        v21 = v12;
        if (v20 == 1)
          goto LABEL_11;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }

  v22 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("dateOfReportCreation"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v22));
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingDescriptors:", v23));
  v25 = self->_reportsInReview;
  self->_reportsInReview = v24;

  v26 = (objc_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingDescriptors:", v23));
  v27 = *(Class *)((char *)&self->super.super.isa + v30);
  *(Class *)((char *)&self->super.super.isa + v30) = v26;

  v28 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingDescriptors:", v23));
  v29 = self->_reportsTellUsMore;
  self->_reportsTellUsMore = v28;

  -[RAPHomeDataSource _addSections](self, "_addSections");
}

- (void)_addSections
{
  NSMutableArray *v3;
  NSMutableArray *homeViewSections;
  _BOOL8 v5;
  void *v6;
  unsigned int v7;
  _UNKNOWN **v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  id v17;

  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  homeViewSections = self->_homeViewSections;
  self->_homeViewSections = v3;

  v5 = -[RAPHomeDataSource _isRAPNewUI](self, "_isRAPNewUI");
  if (!v5 && _MKRAPIsAvailable(v5) && (sub_1003DDB84() & 1) == 0)
    -[NSMutableArray addObject:](self->_homeViewSections, "addObject:", &off_10126D570);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v7 = objc_msgSend(v6, "inChina");

  if (v7)
  {
    if (!-[NSArray count](self->_allReports, "count"))
      goto LABEL_16;
    v8 = &off_10126D588;
    goto LABEL_15;
  }
  if (-[RAPHomeDataSource _isRAPNewUI](self, "_isRAPNewUI"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
    v10 = objc_msgSend(v9, "hasTellUsMoreRAPs");

    if (v10)
      -[NSMutableArray addObject:](self->_homeViewSections, "addObject:", &off_10126D5A0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v12 = objc_msgSend(v11, "hasInReviewRAPs");

  if (v12)
    -[NSMutableArray addObject:](self->_homeViewSections, "addObject:", &off_10126D5B8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v14 = objc_msgSend(v13, "hasReviewedRAPs");

  if (v14)
  {
    v8 = &off_10126D5D0;
LABEL_15:
    -[NSMutableArray addObject:](self->_homeViewSections, "addObject:", v8);
  }
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v16 = objc_msgSend(v15, "hasIncidentReports");

  if (v16)
    -[NSMutableArray addObject:](self->_homeViewSections, "addObject:", &off_10126D5E8);
  v17 = (id)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  objc_msgSend(v17, "reloadData");

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (int64_t)-[NSMutableArray count](self->_homeViewSections, "count", a3);
}

- (int64_t)sectionForIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  if ((unint64_t)-[NSMutableArray count](self->_homeViewSections, "count") <= a3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_homeViewSections, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "integerValue");

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;
  ReportLinkFactory *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  v9 = objc_msgSend(v7, "row");
  v10 = objc_alloc_init(ReportLinkFactory);
  switch(v8)
  {
    case 0:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ReportLinkCell"), v7));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_reportActionSections, "objectAtIndexedSubscript:", v9));
      v13 = objc_msgSend(v12, "integerValue");

      if ((unint64_t)v13 > 4)
        v14 = 0;
      else
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReportLinkFactory createModelForType:](v10, "createModelForType:", v13));
      objc_msgSend(v11, "setReportLink:", v14);
      goto LABEL_19;
    case 1:
      v15 = 144;
      goto LABEL_8;
    case 2:
      v15 = 128;
      goto LABEL_8;
    case 3:
      v15 = 136;
      goto LABEL_8;
    case 4:
      v15 = 120;
LABEL_8:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v15), "objectAtIndexedSubscript:", v9));
      goto LABEL_18;
    case 5:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("IncidentsCell"), v7));
      if (sub_1002A8AA0(v11) == 5)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        objc_msgSend(v11, "setBackgroundColor:", v16);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundColor"));
        objc_msgSend(v11, "setBackgroundColor:", v17);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_incidentsSections, "objectAtIndexedSubscript:", v9));
      v19 = objc_msgSend(v18, "integerValue");

      switch((unint64_t)v19)
      {
        case 0uLL:
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[RAP History] Crashes"), CFSTR("localized string not found"), 0));
          objc_msgSend(v11, "setTitle:", v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v22, "crashesCount")));
          v24 = CFSTR("user-profile-crashes");
          break;
        case 1uLL:
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[RAP History] Hazards"), CFSTR("localized string not found"), 0));
          objc_msgSend(v11, "setTitle:", v29);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v22, "hazardsCount")));
          v24 = CFSTR("user-profile-hazards");
          break;
        case 2uLL:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("[RAP History] Speed Checks"), CFSTR("localized string not found"), 0));
          objc_msgSend(v11, "setTitle:", v31);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v22, "speedChecksCount")));
          v24 = CFSTR("user-profile-speed-checks");
          break;
        case 3uLL:
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("[RAP History] Road Work"), CFSTR("localized string not found"), 0));
          objc_msgSend(v11, "setTitle:", v33);

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v22, "roadWorkCount")));
          v24 = CFSTR("user-profile-road-work");
          break;
        default:

          goto LABEL_17;
      }
      objc_msgSend(v11, "setSubtitle:", v23);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v24));
      objc_msgSend(v11, "setIcon:", v14);
      goto LABEL_19;
    default:
LABEL_17:
      v14 = 0;
LABEL_18:
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v25, v7));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRAPReportsHistory:allowDisclosureIndicator:](TwoLinesContentViewModelComposer, "cellModelForRAPReportsHistory:allowDisclosureIndicator:", v14, 1));
      objc_msgSend(v11, "setViewModel:", v26);

LABEL_19:
      return v11;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  switch(-[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 0:
      v5 = 168;
      goto LABEL_14;
    case 1:
      v5 = 144;
      goto LABEL_14;
    case 2:
      v6 = 128;
      if (-[NSArray count](self->_reportsInReview, "count") < 4)
        goto LABEL_10;
      v7 = 184;
      goto LABEL_9;
    case 3:
      v6 = 136;
      if (-[NSArray count](self->_reportsAlreadyReviewed, "count") < 4)
        goto LABEL_10;
      v7 = 185;
      goto LABEL_9;
    case 4:
      v6 = 120;
      if (-[NSArray count](self->_allReports, "count") < 4)
      {
LABEL_10:
        v9 = *(Class *)((char *)&self->super.super.isa + v6);
        return (int64_t)objc_msgSend(v9, "count");
      }
      else
      {
        v7 = 186;
LABEL_9:
        *((_BYTE *)&self->super.super.isa + v7) = 1;
        return 3;
      }
    case 5:
      v5 = 176;
LABEL_14:
      v9 = *(Class *)((char *)&self->super.super.isa + v5);
      return (int64_t)objc_msgSend(v9, "count");
    default:
      return 1;
  }
}

- (id)RAPHomeReportMenu
{
  RAPReportMenuProvider *reportMenuProvider;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  reportMenuProvider = self->_reportMenuProvider;
  v4 = -[RAPHomeDataSource entryPoint](self, "entryPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_mapsSceneDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportMenuProvider getReportMenuFromEntryPoint:sceneDelegate:](reportMenuProvider, "getReportMenuFromEntryPoint:sceneDelegate:", v4, v6));

  return v7;
}

- (id)_headerStringTellUsMoreSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] Tell Us More"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_headerStringInReviewSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] In Review"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_headerStringReviewedSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] Reviewed"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_headerStringIssuesReportedSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] Issues Reported"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_headerStringIncidentsReportedSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] Incidents Reported"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_footerStringActionsSection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[RAP History] Issues you report are associated with your Apple Account. Incidents you report are not associated with your Apple Account"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_headerStringActionsSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] Report an Issue"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_footerString90Days
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] From the past 90 days."), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_footerStringReviewedSection
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)NSAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RAP History] From the past 90 days. Reports about issues with information from Apple partners can take some time to get updated in Maps"), CFSTR("localized string not found"), 0));
  v5 = objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_footerLinkText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[RAP History] See How Your Data is Managed"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  RAPHomeDataSource *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  RAPHomeDataSource *v41;
  uint64_t *v42;
  id v43[2];
  id location;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  NSAttributedStringKey v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v10, "section"));
  switch((unint64_t)v11)
  {
    case 0uLL:
      if (sub_1002A8AA0(v8) == 5)
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringActionsSection](self, "_headerStringActionsSection"));
      else
        v12 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
      v22 = objc_msgSend(v21, "inChina");

      if ((v22 & 1) != 0)
        goto LABEL_12;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerStringActionsSection](self, "_footerStringActionsSection"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerLinkText](self, "_footerLinkText"));
      v23 = objc_alloc_init((Class)NSMutableParagraphStyle);
      objc_msgSend(v23, "setLineBreakMode:", 0);
      v28 = v23;
      v53[0] = NSParagraphStyleAttributeName;
      v53[1] = NSForegroundColorAttributeName;
      v54[0] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v54[1] = v24;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 2));

      v51 = NSForegroundColorAttributeName;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v52 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));

      v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v31, v30);
      v27 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v29, v26);
      objc_msgSend(v13, "appendAttributedString:", v27);

      break;
    case 1uLL:
      v14 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringTellUsMoreSection](self, "_headerStringTellUsMoreSection"));
      goto LABEL_11;
    case 2uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringInReviewSection](self, "_headerStringInReviewSection"));
      v15 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerString90Days](self, "_footerString90Days"));
      goto LABEL_9;
    case 3uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringReviewedSection](self, "_headerStringReviewedSection"));
      v15 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerStringReviewedSection](self, "_footerStringReviewedSection"));
      goto LABEL_9;
    case 4uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringIssuesReportedSection](self, "_headerStringIssuesReportedSection"));
      v15 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerString90Days](self, "_footerString90Days"));
LABEL_9:
      v13 = (id)v15;
      break;
    case 5uLL:
      v14 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringIncidentsReportedSection](self, "_headerStringIncidentsReportedSection"));
LABEL_11:
      v12 = (void *)v14;
LABEL_12:
      v13 = 0;
      break;
    default:
      v13 = 0;
      v12 = 0;
      break;
  }
  if (objc_msgSend(v9, "isEqualToString:", _UICollectionViewListLayoutElementKindSectionHeader))
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = sub_1004784A4;
    v49 = sub_1004784B4;
    v50 = 0;
    objc_initWeak(&location, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1004784BC;
    v37[3] = &unk_1011B7B58;
    objc_copyWeak(v43, &location);
    v42 = &v45;
    v38 = v8;
    v39 = v10;
    v16 = v12;
    v43[1] = v11;
    v40 = v16;
    v41 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v37);
    v17 = (id)v46[5];

    objc_destroyWeak(v43);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v45, 8);

  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1004786C0;
    v32[3] = &unk_1011B7B80;
    v33 = v8;
    v35 = self;
    v36 = v11;
    v34 = v10;
    v18 = objc_retainBlock(v32);
    v19 = ((uint64_t (*)(_QWORD *, id, uint64_t))v18[2])(v18, v13, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue(v19);

  }
  return v17;
}

- (void)privacyTextTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource supplementaryElementsDelegate](self, "supplementaryElementsDelegate"));
  objc_msgSend(v2, "didTapOnPrivacyText");

}

- (void)seeAllTappedForReportForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  switch(a3)
  {
    case 4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringIssuesReportedSection](self, "_headerStringIssuesReportedSection"));
      break;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringReviewedSection](self, "_headerStringReviewedSection"));
      break;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringInReviewSection](self, "_headerStringInReviewSection"));
      break;
    default:
      v8 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));

LABEL_9:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource supplementaryElementsDelegate](self, "supplementaryElementsDelegate"));
  objc_msgSend(v7, "didTapOnMoreButtonForSectionType:sectionTitle:", a3, v8);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  id v10;
  RAPReportMenuProvider *reportMenuProvider;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v6, "section"));
  switch(v8)
  {
    case 3:
      v15 = 136;
LABEL_7:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v15), "objectAtIndexedSubscript:", v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v14, "dataSource:itemTapped:", self, v13);
      goto LABEL_8;
    case 1:
      v15 = 144;
      goto LABEL_7;
    case 0:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_reportActionSections, "objectAtIndexedSubscript:", v7));
      v10 = objc_msgSend(v9, "integerValue");

      reportMenuProvider = self->_reportMenuProvider;
      v12 = -[RAPHomeDataSource entryPoint](self, "entryPoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_mapsSceneDelegate"));
      -[RAPReportMenuProvider handleMenuActionWithLinkType:entryPoint:sceneDelegate:](reportMenuProvider, "handleMenuActionWithLinkType:entryPoint:sceneDelegate:", v10, v12, v14);
LABEL_8:

      break;
  }
  objc_msgSend(v16, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  unint64_t v5;
  void *v6;
  unsigned int v7;

  v5 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3));
  if (-[RAPHomeDataSource _isInternalInstall](self, "_isInternalInstall"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("__internal__EnableTapRAPForReportID"));

    if (v7)
      return v5 != 5;
  }
  if (v5 <= 3)
    return (0xBu >> (v5 & 0xF)) & 1;
  return 0;
}

- (double)footerHeightForSection:(int64_t)a3 collectionView:(id)a4
{
  double v6;
  double v7;
  double height;
  UserProfileSectionFooterView *v9;
  UserProfileSectionFooterViewModel *v10;
  UserProfileSectionFooterViewModel *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  UserProfileSectionFooterViewModel *v23;
  id v24;

  objc_msgSend(a4, "frame");
  v7 = v6;
  height = UILayoutFittingExpandedSize.height;
  v9 = objc_alloc_init(UserProfileSectionFooterView);
  v10 = 0;
  switch(a3)
  {
    case 0:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
      v14 = objc_msgSend(v13, "inChina");

      if ((v14 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerStringActionsSection](self, "_footerStringActionsSection"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerLinkText](self, "_footerLinkText"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", v22));

        v23 = [UserProfileSectionFooterViewModel alloc];
        v24 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v15);
        v10 = -[UserProfileSectionFooterViewModel initWithContentString:](v23, "initWithContentString:", v24);

        goto LABEL_7;
      }
      v10 = 0;
      break;
    case 2:
    case 4:
      v11 = [UserProfileSectionFooterViewModel alloc];
      v12 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerString90Days](self, "_footerString90Days"));
      goto LABEL_6;
    case 3:
      v11 = [UserProfileSectionFooterViewModel alloc];
      v12 = objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _footerStringReviewedSection](self, "_footerStringReviewedSection"));
LABEL_6:
      v15 = (void *)v12;
      v10 = -[UserProfileSectionFooterViewModel initWithContentString:](v11, "initWithContentString:", v12);
LABEL_7:

      break;
    default:
      break;
  }
  -[UserProfileSectionFooterView configureWithViewModel:](v9, "configureWithViewModel:", v10);
  LODWORD(v16) = 1148846080;
  LODWORD(v17) = 1132068864;
  -[UserProfileSectionFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7 + -32.0, height, v16, v17);
  v19 = v18;

  return v19;
}

- (double)headerHeightForSection:(int64_t)a3 collectionView:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double Width;
  void *v13;
  void *v14;
  double v15;
  CGRect v17;

  v6 = a4;
  v7 = 0;
  v8 = 0.0;
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 2:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringInReviewSection](self, "_headerStringInReviewSection"));
      goto LABEL_6;
    case 3:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringReviewedSection](self, "_headerStringReviewedSection"));
      goto LABEL_6;
    case 4:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringIssuesReportedSection](self, "_headerStringIssuesReportedSection"));
      goto LABEL_6;
    case 5:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHomeDataSource _headerStringIncidentsReportedSection](self, "_headerStringIncidentsReportedSection"));
LABEL_6:
      v10 = v9;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));

      break;
    default:
      break;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));
  +[SectionHeaderCollectionReusableView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderCollectionReusableView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v7 == 0, v7, 0, v14, Width);
  v8 = v15;

LABEL_8:
  return v8;
}

- (void)reportHistoryManagerDidUpdate:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v5 = sub_10043261C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);

  }
  -[RAPHomeDataSource _loadReportHistoryContent](self, "_loadReportHistoryContent");
}

- (int)analyticsTarget
{
  return 39;
}

- (BOOL)_isInternalInstall
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v3 = objc_msgSend(v2, "isInternalInstall");

  return v3;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  if (-[RAPHomeDataSource _isInternalInstall](self, "_isInternalInstall")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("__internal__EnableTapRAPForReportID")),
        v7,
        v8)
    && objc_msgSend(v6, "count") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v10 = objc_msgSend(v9, "row");
    v11 = -[RAPHomeDataSource sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v9, "section"));
    if ((unint64_t)(v11 - 2) <= 2
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + **(&off_1011B7BE0 + v11 - 2)), "objectAtIndexedSubscript:", v10))) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10047904C;
      v16[3] = &unk_1011B7BA8;
      v17 = v12;
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v16));

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (SupplementaryElementsDataSourceDelegate)supplementaryElementsDelegate
{
  return (SupplementaryElementsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_supplementaryElementsDelegate);
}

- (void)setSupplementaryElementsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_supplementaryElementsDelegate, a3);
}

- (int)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int)a3
{
  self->_entryPoint = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_supplementaryElementsDelegate);
  objc_storeStrong((id *)&self->_reportMenuProvider, 0);
  objc_storeStrong((id *)&self->_incidentsSections, 0);
  objc_storeStrong((id *)&self->_reportActionSections, 0);
  objc_storeStrong((id *)&self->_homeViewSections, 0);
  objc_storeStrong((id *)&self->_incidentReports, 0);
  objc_storeStrong((id *)&self->_reportsTellUsMore, 0);
  objc_storeStrong((id *)&self->_reportsAlreadyReviewed, 0);
  objc_storeStrong((id *)&self->_reportsInReview, 0);
  objc_storeStrong((id *)&self->_allReports, 0);
}

@end
