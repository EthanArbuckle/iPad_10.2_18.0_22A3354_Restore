@implementation GuidesHomeLogicController

- (GuidesHomeLogicController)initWithGuidesHomeResult:(id)a3 maxWidth:(double)a4 traitEnvironment:(id)a5 guideFetcher:(id)a6 guideConsumer:(id)a7 guideLocation:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  GuidesHomeLogicController *v20;
  GuidesHomeLogicController *v21;
  objc_super v23;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)GuidesHomeLogicController;
  v20 = -[GuidesHomeLogicController init](&v23, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_result, a3);
    v21->_maxWidth = a4;
    objc_storeStrong((id *)&v21->_traitEnvironment, a5);
    objc_storeWeak((id *)&v21->_guideFetcher, v17);
    objc_storeWeak((id *)&v21->_guideConsumer, v18);
    objc_storeStrong((id *)&v21->_guideLocation, a8);
    -[GuidesHomeLogicController initializeFonts](v21, "initializeFonts");
    -[GuidesHomeLogicController initializeSectionsUsingMaxWidth:traitEnvironment:](v21, "initializeSectionsUsingMaxWidth:traitEnvironment:", v16, a4);
  }

  return v21;
}

- (void)initializeFonts
{
  CGFloat v3;
  CTFontRef UIFontForLanguage;
  void *CopyOfSystemUIFontWithGrade;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleTitle3));
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", 22.0);
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0xA9u, v3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade(UIFontForLanguage, 4);
  CFRelease(UIFontForLanguage);
  -[GuidesHomeLogicController setTitleFont:](self, "setTitleFont:", CopyOfSystemUIFontWithGrade);

}

- (void)willDisplayCellAtIndexpath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v8, "section")));
  if (objc_msgSend(v4, "kind") == (id)6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController collectionLogicControllers](self, "collectionLogicControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sectionIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

    objc_msgSend(v7, "willDisplayCellAtIndexpath:", v8);
  }

}

- (void)updateFilteredCollectionsFromResults:(id)a3 collectionIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GuidesHomeSection *v9;
  double v10;
  double v11;
  void *v12;
  GuidesHomeSection *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    -[GuidesHomeLogicController setRecentCollectionFromCollectionResults:](self, "setRecentCollectionFromCollectionResults:", 0);
    -[GuidesHomeLogicController setBatchCollectionIds:](self, "setBatchCollectionIds:", v7);
    -[GuidesHomeLogicController setFilteredGuidesSection:](self, "setFilteredGuidesSection:", 0);
    -[GuidesHomeLogicController maxWidth](self, "maxWidth");
    v22 = v21;
    v16 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController traitEnvironment](self, "traitEnvironment"));
    -[GuidesHomeLogicController initializeSectionsUsingMaxWidth:traitEnvironment:](self, "initializeSectionsUsingMaxWidth:traitEnvironment:", v16, v22);
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filteredGuidesSection](self, "filteredGuidesSection"));

  if (v8)
  {
LABEL_5:
    -[GuidesHomeLogicController setLoadingSection:](self, "setLoadingSection:", 0);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10080B9B8;
    v25[3] = &unk_1011C9BF8;
    v26 = objc_alloc_init((Class)NSMutableArray);
    v16 = v26;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
    v17 = objc_msgSend(v16, "copy");
    -[GuidesHomeLogicController setRecentCollectionFromCollectionResults:](self, "setRecentCollectionFromCollectionResults:", v17);

    -[GuidesHomeLogicController setBatchCollectionIds:](self, "setBatchCollectionIds:", v7);
    -[GuidesHomeLogicController maxWidth](self, "maxWidth");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController traitEnvironment](self, "traitEnvironment"));
    -[GuidesHomeLogicController initializeSectionsUsingMaxWidth:traitEnvironment:](self, "initializeSectionsUsingMaxWidth:traitEnvironment:", v20, v19);

LABEL_7:
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = [GuidesHomeSection alloc];
    -[GuidesHomeLogicController maxWidth](self, "maxWidth");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController traitEnvironment](self, "traitEnvironment"));
    v13 = -[GuidesHomeSection initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:](v9, "initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:", 6, v12, objc_msgSend(v6, "count"), v11);
    -[GuidesHomeLogicController setFilteredGuidesSection:](self, "setFilteredGuidesSection:", v13);

    v14 = objc_alloc_init((Class)NSArray);
    -[GuidesHomeLogicController setRecentCollectionFromCollectionResults:](self, "setRecentCollectionFromCollectionResults:", v14);

    v15 = objc_alloc_init((Class)NSArray);
    -[GuidesHomeLogicController setBatchCollectionIds:](self, "setBatchCollectionIds:", v15);

    goto LABEL_5;
  }
  v23 = sub_1004316CC();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Guides Home section for filteredGuidesSection couldn't build any objects to display in section", buf, 2u);
  }

LABEL_8:
}

- (void)appendBatchOfCollections:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filteredGuidesSection](self, "filteredGuidesSection"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController collectionLogicControllers](self, "collectionLogicControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filteredGuidesSection](self, "filteredGuidesSection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

    objc_msgSend(v8, "appendBatchOfCollections:", v9);
  }

}

- (id)allSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  }
  return v8;
}

- (id)filterValueAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filterLogicController](self, "filterLogicController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filterViewModels"));

  if ((unint64_t)objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filterTitle"));

  }
  return v7;
}

- (id)itemsForSectionAtIndex:(unint64_t)a3
{
  GuidesHomeLogicController *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  void *v29;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return &__NSArray0__struct;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](v4, "sections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  if (v8)
  {
    objc_msgSend(v8, "configuration");

    switch((uint64_t)v27)
    {
      case 0:
        goto LABEL_8;
      case 1:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filterLogicController](v4, "filterLogicController"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filterViewModels"));
        goto LABEL_18;
      case 2:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController compactCollectionLogicControllers](v4, "compactCollectionLogicControllers"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v22));

        if (!v23)
          goto LABEL_14;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController compactCollectionLogicControllers](v4, "compactCollectionLogicControllers"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v25));

        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "compactCollectionsInSection:", 0));
        goto LABEL_13;
      case 3:
      case 4:
      case 6:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController collectionLogicControllers](v4, "collectionLogicControllers"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

        if (!v11)
          goto LABEL_14;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController collectionLogicControllers](v4, "collectionLogicControllers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v13));

        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collections"));
LABEL_13:
        v4 = (GuidesHomeLogicController *)v15;

        break;
      case 5:
        v4 = (GuidesHomeLogicController *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController publishers](v4, "publishers"));
        break;
      case 7:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
        v28 = v18;
        v19 = &v28;
        goto LABEL_17;
      default:
        break;
    }
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
LABEL_8:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController featuredGuideViewModel](v4, "featuredGuideViewModel", v26, v27));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController featuredGuideViewModel](v4, "featuredGuideViewModel"));
      v29 = v18;
      v19 = &v29;
LABEL_17:
      v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 1));
LABEL_18:
      v4 = (GuidesHomeLogicController *)v20;

    }
    else
    {
LABEL_14:
      v4 = (GuidesHomeLogicController *)&__NSArray0__struct;
    }
  }

  return v4;
}

- (void)initializeSectionsUsingMaxWidth:(double)a3 traitEnvironment:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *sections;
  NSMutableDictionary *v9;
  NSMutableDictionary *collectionLogicControllers;
  NSMutableDictionary *v11;
  NSMutableDictionary *compactCollectionLogicControllers;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  GuidesHomeSection *v18;
  GuidesHomeHeaderViewModel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  GuidesHomeHeaderViewModel *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CollectionsFilterLogicController *v29;
  void *v30;
  id v31;
  GuidesHomeSection *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  GuidesHomeLogicController *v54;
  double v55;
  uint8_t buf[16];

  v6 = a4;
  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sections = self->_sections;
  self->_sections = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  collectionLogicControllers = self->_collectionLogicControllers;
  self->_collectionLogicControllers = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  compactCollectionLogicControllers = self->_compactCollectionLogicControllers;
  self->_compactCollectionLogicControllers = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController result](self, "result"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "featuredGuidesSection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featuredGuides"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collection"));

  if (v17)
  {
    v18 = -[GuidesHomeSection initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:]([GuidesHomeSection alloc], "initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:", 0, v6, 1, a3);
    v19 = [GuidesHomeHeaderViewModel alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController guideLocation](self, "guideLocation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController result](self, "result"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featuredGuidesSection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
    v24 = -[GuidesHomeHeaderViewModel initWithGuideLocation:featuredGuide:sectionTitle:](v19, "initWithGuideLocation:featuredGuide:sectionTitle:", v20, v17, v23);
    -[GuidesHomeLogicController setFeaturedGuideViewModel:](self, "setFeaturedGuideViewModel:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
    objc_msgSend(v25, "addObject:", v18);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController result](self, "result"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filtersSection"));

  if (v27)
  {
    v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "filters"));
    if (!objc_msgSend(v28, "count"))
    {
      v49 = sub_1004316CC();
      v36 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Guides Home section for Filters couldn't build any objects to display in section", buf, 2u);
      }
      goto LABEL_8;
    }
    v29 = [CollectionsFilterLogicController alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    v31 = -[CollectionsFilterLogicController initForGuidesHomeViewUsingFilters:withSelectedFilterIndexPath:traitEnvironment:](v29, "initForGuidesHomeViewUsingFilters:withSelectedFilterIndexPath:traitEnvironment:", v28, v30, v6);
    -[GuidesHomeLogicController setFilterLogicController:](self, "setFilterLogicController:", v31);

    v32 = -[GuidesHomeSection initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:]([GuidesHomeSection alloc], "initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:", 1, v6, objc_msgSend(v28, "count"), a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
    -[GuidesHomeSection setSectionTitle:](v32, "setSectionTitle:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
    objc_msgSend(v34, "addObject:", v32);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController loadingSection](self, "loadingSection"));

  if (v35)
  {
    v28 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
    v36 = objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController loadingSection](self, "loadingSection"));
    objc_msgSend(v28, "addObject:", v36);
LABEL_8:

    goto LABEL_11;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filteredGuidesSection](self, "filteredGuidesSection"));

  if (!v37)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController result](self, "result"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "repeatableSections"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10080C3B8;
    v52[3] = &unk_1011C9C48;
    v55 = a3;
    v53 = v6;
    v54 = self;
    objc_msgSend(v51, "enumerateObjectsUsingBlock:", v52);

    goto LABEL_12;
  }
  v38 = objc_alloc((Class)MKPlaceCollectionsLogicController);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController recentCollectionFromCollectionResults](self, "recentCollectionFromCollectionResults"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController batchCollectionIds](self, "batchCollectionIds"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController guideFetcher](self, "guideFetcher"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController guideConsumer](self, "guideConsumer"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v28 = objc_msgSend(v38, "initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:", 0, v39, v40, v41, v42, v43, 9, 10);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController collectionLogicControllers](self, "collectionLogicControllers"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filteredGuidesSection](self, "filteredGuidesSection"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sectionIdentifier"));
  objc_msgSend(v44, "setObject:forKey:", v28, v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController sections](self, "sections"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filteredGuidesSection](self, "filteredGuidesSection"));
  objc_msgSend(v47, "addObject:", v48);

LABEL_11:
LABEL_12:

}

- (id)selectedFilterIndexPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filterLogicController](self, "filterLogicController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedFilterIndexPath"));

  return v3;
}

- (id)routeToSelectedFilterAtIndexPath:(id)a3
{
  return 0;
}

- (id)routeToSelectedAllCollectionsFilterAtIndexPath:(id)a3
{
  return 0;
}

- (id)routeToSelectedGuidesHomeFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GuidesHomeSection *v7;
  double v8;
  double v9;
  void *v10;
  GuidesHomeSection *v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController filterLogicController](self, "filterLogicController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeToSelectedGuidesHomeFilterAtIndexPath:", v4));

  if (v4)
  {
    v7 = [GuidesHomeSection alloc];
    -[GuidesHomeLogicController maxWidth](self, "maxWidth");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController traitEnvironment](self, "traitEnvironment"));
    v11 = -[GuidesHomeSection initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:](v7, "initWithSectionKind:usingMaxWidth:usingTraitEnvironment:count:", 7, v10, 1, v9);
    -[GuidesHomeLogicController setLoadingSection:](self, "setLoadingSection:", v11);

  }
  else
  {
    -[GuidesHomeLogicController setLoadingSection:](self, "setLoadingSection:", 0);
    -[GuidesHomeLogicController setFilteredGuidesSection:](self, "setFilteredGuidesSection:", 0);
  }
  -[GuidesHomeLogicController maxWidth](self, "maxWidth");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeLogicController traitEnvironment](self, "traitEnvironment"));
  -[GuidesHomeLogicController initializeSectionsUsingMaxWidth:traitEnvironment:](self, "initializeSectionsUsingMaxWidth:traitEnvironment:", v14, v13);

  return v6;
}

- (GEOGuidesHomeResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSMutableDictionary)collectionLogicControllers
{
  return self->_collectionLogicControllers;
}

- (void)setCollectionLogicControllers:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLogicControllers, a3);
}

- (NSMutableDictionary)compactCollectionLogicControllers
{
  return self->_compactCollectionLogicControllers;
}

- (void)setCompactCollectionLogicControllers:(id)a3
{
  objc_storeStrong((id *)&self->_compactCollectionLogicControllers, a3);
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void)setPublishers:(id)a3
{
  objc_storeStrong((id *)&self->_publishers, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (UITraitEnvironment)traitEnvironment
{
  return self->_traitEnvironment;
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_traitEnvironment, a3);
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (void)setGuideLocation:(id)a3
{
  objc_storeStrong((id *)&self->_guideLocation, a3);
}

- (GuidesHomeHeaderViewModel)featuredGuideViewModel
{
  return self->_featuredGuideViewModel;
}

- (void)setFeaturedGuideViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_featuredGuideViewModel, a3);
}

- (CollectionsFilterLogicController)filterLogicController
{
  return self->_filterLogicController;
}

- (void)setFilterLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_filterLogicController, a3);
}

- (NSArray)recentCollectionFromCollectionResults
{
  return self->_recentCollectionFromCollectionResults;
}

- (void)setRecentCollectionFromCollectionResults:(id)a3
{
  objc_storeStrong((id *)&self->_recentCollectionFromCollectionResults, a3);
}

- (NSArray)batchCollectionIds
{
  return self->_batchCollectionIds;
}

- (void)setBatchCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_batchCollectionIds, a3);
}

- (GuidesHomeSection)filteredGuidesSection
{
  return self->_filteredGuidesSection;
}

- (void)setFilteredGuidesSection:(id)a3
{
  objc_storeStrong((id *)&self->_filteredGuidesSection, a3);
}

- (GuidesHomeSection)loadingSection
{
  return self->_loadingSection;
}

- (void)setLoadingSection:(id)a3
{
  objc_storeStrong((id *)&self->_loadingSection, a3);
}

- (MKPlaceBatchFetcher)guideFetcher
{
  return (MKPlaceBatchFetcher *)objc_loadWeakRetained((id *)&self->_guideFetcher);
}

- (void)setGuideFetcher:(id)a3
{
  objc_storeWeak((id *)&self->_guideFetcher, a3);
}

- (MKPlaceBatchConsumer)guideConsumer
{
  return (MKPlaceBatchConsumer *)objc_loadWeakRetained((id *)&self->_guideConsumer);
}

- (void)setGuideConsumer:(id)a3
{
  objc_storeWeak((id *)&self->_guideConsumer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_guideConsumer);
  objc_destroyWeak((id *)&self->_guideFetcher);
  objc_storeStrong((id *)&self->_loadingSection, 0);
  objc_storeStrong((id *)&self->_filteredGuidesSection, 0);
  objc_storeStrong((id *)&self->_batchCollectionIds, 0);
  objc_storeStrong((id *)&self->_recentCollectionFromCollectionResults, 0);
  objc_storeStrong((id *)&self->_filterLogicController, 0);
  objc_storeStrong((id *)&self->_featuredGuideViewModel, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_traitEnvironment, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
  objc_storeStrong((id *)&self->_compactCollectionLogicControllers, 0);
  objc_storeStrong((id *)&self->_collectionLogicControllers, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
