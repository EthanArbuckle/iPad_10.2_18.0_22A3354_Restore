@implementation RatingsHistoryDataSource

- (RatingsHistoryDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  RatingsHistoryDataSource *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RatingsHistoryDataSource;
  v4 = -[DataSource initWithCollectionView:updateLocation:](&v7, "initWithCollectionView:updateLocation:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UGCReviewedPlaceMapsSync sharedInstance](UGCReviewedPlaceMapsSync, "sharedInstance"));
    objc_msgSend(v5, "registerObserver:", v4);

    -[RatingsHistoryDataSource _fetchReviewedPlaces](v4, "_fetchReviewedPlaces");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[RatingsHistoryDataSource _cancelMapItemTicket](self, "_cancelMapItemTicket");
  v3.receiver = self;
  v3.super_class = (Class)RatingsHistoryDataSource;
  -[RatingsHistoryDataSource dealloc](&v3, "dealloc");
}

- (void)_loadContent
{
  id v3;

  -[RatingsHistoryDataSource _buildContent](self, "_buildContent");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v3, "dataSourceUpdated:", self);

}

- (void)_buildContent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  RatingsBucketSection *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  RatingsBucketSection *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  RatingsBucketSection *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSArray *v36;
  NSArray *sections;
  RatingsHistoryDataSource *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = self;
  v6 = -[NSArray copy](self->_reviewedPlaces, "copy");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reviewedPlace"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateOfLastEdit"));

        v15 = objc_msgSend(v7, "isDateInToday:", v14);
        v16 = v3;
        if ((v15 & 1) == 0)
        {
          if (objc_msgSend(v7, "compareDate:toDate:toUnitGranularity:", v39, v14, 0x2000))
            v16 = v5;
          else
            v16 = v4;
        }
        objc_msgSend(v16, "addObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v3, "count"))
  {
    v18 = objc_alloc_init(RatingsBucketSection);
    v19 = objc_alloc((Class)NSAttributedString);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Ratings History] Today"), CFSTR("localized string not found"), 0));
    v22 = objc_msgSend(v19, "initWithString:", v21);
    -[RatingsBucketSection setTitle:](v18, "setTitle:", v22);

    v23 = objc_msgSend(v3, "copy");
    -[RatingsBucketSection setObjects:](v18, "setObjects:", v23);

    objc_msgSend(v17, "addObject:", v18);
  }
  if (objc_msgSend(v4, "count"))
  {
    v24 = objc_alloc_init(RatingsBucketSection);
    v25 = objc_alloc((Class)NSAttributedString);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Ratings History] This Week"), CFSTR("localized string not found"), 0));
    v28 = objc_msgSend(v25, "initWithString:", v27);
    -[RatingsBucketSection setTitle:](v24, "setTitle:", v28);

    v29 = objc_msgSend(v4, "copy");
    -[RatingsBucketSection setObjects:](v24, "setObjects:", v29);

    objc_msgSend(v17, "addObject:", v24);
  }
  if (objc_msgSend(v5, "count"))
  {
    v30 = objc_alloc_init(RatingsBucketSection);
    v31 = objc_alloc((Class)NSAttributedString);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("[Ratings History] Older"), CFSTR("localized string not found"), 0));
    v34 = objc_msgSend(v31, "initWithString:", v33);
    -[RatingsBucketSection setTitle:](v30, "setTitle:", v34);

    v35 = objc_msgSend(v5, "copy");
    -[RatingsBucketSection setObjects:](v30, "setObjects:", v35);

    objc_msgSend(v17, "addObject:", v30);
  }
  v36 = (NSArray *)objc_msgSend(v17, "copy");
  sections = v38->_sections;
  v38->_sections = v36;

}

- (id)_footerText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Ratings History] Your photos are associated with your Apple Account."), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_footerLinkText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Ratings History] See How Your Data is Managed"), CFSTR("localized string not found"), 0));

  return v3;
}

- (double)footerHeightForSection:(int64_t)a3 collectionView:(id)a4
{
  double v6;
  double v7;
  double height;
  UserProfileSectionFooterView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UserProfileSectionFooterViewModel *v15;
  id v16;
  UserProfileSectionFooterViewModel *v17;
  double v18;
  double v19;
  double v20;
  double v21;

  objc_msgSend(a4, "frame");
  v7 = v6;
  height = UILayoutFittingExpandedSize.height;
  v9 = -[MapsThemeCollectionReusableView initWithFrame:]([UserProfileSectionFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource _footerText](self, "_footerText"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource _footerLinkText](self, "_footerLinkText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_sections, "lastObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource sectionAtIndex:](self, "sectionAtIndex:", a3));
  if (objc_msgSend(v13, "isEqual:", v14))
  {
    v15 = [UserProfileSectionFooterViewModel alloc];
    v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v12);
    v17 = -[UserProfileSectionFooterViewModel initWithContentString:](v15, "initWithContentString:", v16);

  }
  else
  {
    v17 = 0;
  }
  -[UserProfileSectionFooterView configureWithViewModel:](v9, "configureWithViewModel:", v17);
  LODWORD(v18) = 1148846080;
  LODWORD(v19) = 1132068864;
  -[UserProfileSectionFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7 + -32.0, height, v18, v19);
  v21 = v20;

  return v21;
}

- (id)sectionAtIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSArray count](self->_sections, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  }
  return v5;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v4, "section")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objects"));
  if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
    || (v7 = objc_msgSend(v4, "row"), v7 >= objc_msgSend(v6, "count")))
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
  }

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objects"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRatingsHistory:](TwoLinesContentViewModelComposer, "cellModelForRatingsHistory:", v10));
  objc_msgSend(v9, "setViewModel:", v11);

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  RatingsHistoryDataSource *v40;
  NSAttributedStringKey v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v10, "section")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_sections, "lastObject"));
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionHeader))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v13, v10));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
    objc_msgSend(v14, "setAccessibilityIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
    objc_msgSend(v14, "setTitle:", v17);

    objc_msgSend(v14, "setShowsBottomHairline:", 0);
    objc_msgSend(v14, "setFirstNonEmptySection:", 1);
    objc_msgSend(v14, "setAccessibilityIdentifiersWithBaseString:", CFSTR("RatingsHistory"));
    objc_msgSend(v14, "setNeedsLayout");
    objc_msgSend(v14, "layoutIfNeeded");
  }
  else
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100461A08;
    v35[3] = &unk_1011B7530;
    v36 = v8;
    v37 = v10;
    v18 = v12;
    v38 = v18;
    v19 = v11;
    v39 = v19;
    v40 = self;
    v20 = objc_retainBlock(v35);
    if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionFooter)
      && objc_msgSend(v18, "isEqual:", v19))
    {
      v34 = objc_alloc_init((Class)NSMutableParagraphStyle);
      objc_msgSend(v34, "setLineBreakMode:", 0);
      v44[0] = v34;
      v43[0] = NSParagraphStyleAttributeName;
      v43[1] = NSForegroundColorAttributeName;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v44[1] = v21;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));

      v41 = NSForegroundColorAttributeName;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v42 = v22;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));

      v23 = objc_alloc((Class)NSMutableAttributedString);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource _footerText](self, "_footerText"));
      v25 = objc_msgSend(v23, "initWithString:attributes:", v24, v33);

      v26 = objc_alloc((Class)NSMutableAttributedString);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource _footerLinkText](self, "_footerLinkText"));
      v28 = objc_msgSend(v26, "initWithString:attributes:", v27, v32);

      objc_msgSend(v25, "appendAttributedString:", v28);
      v29 = ((uint64_t (*)(_QWORD *, id, uint64_t))v20[2])(v20, v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v29);

    }
    else
    {
      v30 = ((uint64_t (*)(_QWORD *, _QWORD, _QWORD))v20[2])(v20, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v30);
    }

  }
  return v14;
}

- (void)privacyTextTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource privacyDelegate](self, "privacyDelegate"));
  objc_msgSend(v2, "didTapOnPrivacyText");

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RatingsHistoryDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v8, "dataSource:itemTapped:", self, v9);

  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 1);
}

- (void)_fetchReviewedPlaces
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;

  v4 = sub_10043261C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100461D70;
  v11[3] = &unk_1011B07A0;
  objc_copyWeak(&v12, (id *)buf);
  +[UGCReviewedPlaceManager fetchAllHistoryObjectsFromStorageWithCompletion:](UGCReviewedPlaceManager, "fetchAllHistoryObjectsFromStorageWithCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)_fetchMapItemsForReviewedPlaces:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  MKMapServiceTicket *mapItemTicket;
  MKMapServiceTicket *v30;
  id v31;
  RatingsHistoryDataSource *v32;
  void *v33;
  id v34;
  id obj;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  unsigned int v50;

  v7 = a3;
  v8 = a4;
  v9 = sub_10043261C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412802;
    v46 = v13;
    v47 = 2112;
    v48 = v15;
    v49 = 1024;
    v50 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@, # reviewed places = %d", buf, 0x1Cu);

  }
  -[RatingsHistoryDataSource _cancelMapItemTicket](self, "_cancelMapItemTicket");
  if (objc_msgSend(v7, "count"))
  {
    v32 = self;
    v33 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v7;
    obj = v7;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      v21 = MKCoordinateInvalid[0];
      v22 = MKCoordinateInvalid[1];
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v23);
          v25 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", objc_msgSend(v24, "muid"), 0, v21, v22);
          objc_msgSend(v16, "addObject:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v24, "muid")));
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v26);

          v23 = (char *)v23 + 1;
        }
        while (v19 != v23);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v19);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ticketForIdentifiers:traits:", v16, 0));
    mapItemTicket = v32->_mapItemTicket;
    v32->_mapItemTicket = (MKMapServiceTicket *)v28;

    v30 = v32->_mapItemTicket;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1004621F4;
    v36[3] = &unk_1011B7580;
    v37 = obj;
    v38 = v17;
    v8 = v33;
    v39 = v33;
    v31 = v17;
    -[MKMapServiceTicket submitWithHandler:networkActivity:](v30, "submitWithHandler:networkActivity:", v36, 0);

    v7 = v34;
  }
  else
  {
    (*((void (**)(id, void *))v8 + 2))(v8, &__NSArray0__struct);
  }

}

- (void)_cancelMapItemTicket
{
  MKMapServiceTicket *mapItemTicket;
  MKMapServiceTicket *v4;

  mapItemTicket = self->_mapItemTicket;
  if (mapItemTicket)
  {
    -[MKMapServiceTicket cancel](mapItemTicket, "cancel");
    v4 = self->_mapItemTicket;
    self->_mapItemTicket = 0;

  }
}

- (SupplementaryElementsDataSourceDelegate)privacyDelegate
{
  return (SupplementaryElementsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_privacyDelegate);
}

- (void)setPrivacyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privacyDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_mapItemTicket, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_reviewedPlaces, 0);
}

@end
