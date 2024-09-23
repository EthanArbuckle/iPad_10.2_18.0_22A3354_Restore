@implementation CuratedCollectionProvider

- (CuratedCollectionProvider)initWithTableView:(id)a3 curatedCollectionIdentifier:(id)a4
{
  id v6;
  id v7;
  CuratedCollectionProvider *v8;
  CuratedCollectionResolver *v9;
  CuratedCollectionResolver *resolver;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionProvider;
  v8 = -[DataSource initWithTableView:updateLocation:](&v12, "initWithTableView:updateLocation:", v6, 1);
  if (v8)
  {
    v9 = -[CuratedCollectionResolver initWithCuratedCollectionIdentifier:delegate:]([CuratedCollectionResolver alloc], "initWithCuratedCollectionIdentifier:delegate:", v7, v8);
    resolver = v8->_resolver;
    v8->_resolver = v9;

    -[CuratedCollectionProvider _commonInitWithTableView:](v8, "_commonInitWithTableView:", v6);
  }

  return v8;
}

- (CuratedCollectionProvider)initWithTableView:(id)a3 fullyClientizedCuratedCollection:(id)a4
{
  id v6;
  id v7;
  CuratedCollectionProvider *v8;
  CuratedCollectionResolver *v9;
  CuratedCollectionResolver *resolver;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionProvider;
  v8 = -[DataSource initWithTableView:updateLocation:](&v12, "initWithTableView:updateLocation:", v6, 1);
  if (v8)
  {
    v9 = -[CuratedCollectionResolver initWithFullyClientizedCuratedCollection:delegate:]([CuratedCollectionResolver alloc], "initWithFullyClientizedCuratedCollection:delegate:", v7, v8);
    resolver = v8->_resolver;
    v8->_resolver = v9;

    -[CuratedCollectionProvider _commonInitWithTableView:](v8, "_commonInitWithTableView:", v6);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mapsSyncStore](self, "mapsSyncStore"));
    objc_msgSend(v3, "unsubscribe:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionProvider;
  -[CuratedCollectionProvider dealloc](&v4, "dealloc");
}

- (void)_commonInitWithTableView:(id)a3
{
  NSArray *v4;
  NSArray *storeSubscriptionTypes;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  UITableViewDiffableDataSource *v31;
  UITableViewDiffableDataSource *dataSource;
  _QWORD v33[2];

  v33[0] = objc_opt_class(MSFavoriteItem);
  v33[1] = objc_opt_class(MSCollectionPlaceItem);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
  storeSubscriptionTypes = self->_storeSubscriptionTypes;
  self->_storeSubscriptionTypes = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  -[CuratedCollectionProvider setMapsSyncStore:](self, "setMapsSyncStore:", v6);

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mapsSyncStore](self, "mapsSyncStore"));
    objc_msgSend(v7, "subscribe:", self);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    objc_msgSend(v7, "addObserver:", self);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v10 = objc_opt_class(CuratedCollectionDescriptionTableViewCell);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionDescriptionTableViewCell reuseIdentifier](CuratedCollectionDescriptionTableViewCell, "reuseIdentifier"));
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v13 = objc_opt_class(CuratedCollectionActionTableViewCell);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionActionTableViewCell reuseIdentifier](CuratedCollectionActionTableViewCell, "reuseIdentifier"));
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", v13, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v16 = objc_opt_class(CuratedCollectionItemTableViewCell);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionItemTableViewCell reuseIdentifier](CuratedCollectionItemTableViewCell, "reuseIdentifier"));
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", v16, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v19 = objc_opt_class(TwoLinesTableViewCell);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", v19, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v22 = objc_opt_class(CuratedCollectionFooterActionTableViewCell);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionFooterActionTableViewCell reuseIdentifier](CuratedCollectionFooterActionTableViewCell, "reuseIdentifier"));
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", v22, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v25 = objc_opt_class(CuratedCollectionMediaIntegrationTableViewCell);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionMediaIntegrationTableViewCell reuseIdentifier](CuratedCollectionMediaIntegrationTableViewCell, "reuseIdentifier"));
  objc_msgSend(v24, "registerClass:forCellReuseIdentifier:", v25, v26);

  v27 = objc_alloc((Class)UITableViewDiffableDataSource);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v29 = sub_10046D908(self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (UITableViewDiffableDataSource *)objc_msgSend(v27, "initWithTableView:cellProvider:", v28, v30);
  dataSource = self->_dataSource;
  self->_dataSource = v31;

}

- (void)startResolvingCollection
{
  -[CuratedCollectionResolver setShouldResolveAppClips:](self->_resolver, "setShouldResolveAppClips:", MapsFeature_IsEnabled_Maps269(self, a2));
  -[CuratedCollectionResolver resolveCollection](self->_resolver, "resolveCollection");
}

- (void)addToUserCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cell_IndexPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForRowAtIndexPath:", v5));

  v7 = objc_opt_class(CuratedCollectionItemTableViewCell);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    objc_msgSend(v6, "addToUserCollection:", v8);

}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSArray *v10;
  NSArray *keyCommands;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v6 = sub_1002A8AA0(v5);

  v7 = &__NSArray0__struct;
  if (v4 && v6 != 5)
  {
    v8 = sub_100905C50((uint64_t)"addToUserCollection:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12 = v9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  }
  v10 = (NSArray *)objc_msgSend(v7, "copy");
  keyCommands = self->_keyCommands;
  self->_keyCommands = v10;

}

- (CGRect)subheaderFrame
{
  void *v3;
  UITableViewDiffableDataSource *dataSource;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider descriptionModel](self, "descriptionModel"));

  if (v3
    && (dataSource = self->_dataSource,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider descriptionModel](self, "descriptionModel")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v5)), v5, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v7, "rectForRowAtIndexPath:", v6);
    x = v8;
    y = v10;
    width = v12;
    height = v14;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setSubheaderTransitionFraction:(double)a3
{
  if (self->_subheaderTransitionFraction != a3)
  {
    self->_subheaderTransitionFraction = a3;
    -[CuratedCollectionProvider _updateSubheaderColors](self, "_updateSubheaderColors");
  }
}

- (void)_updateSubheaderColors
{
  void *v3;
  UITableViewDiffableDataSource *dataSource;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITableViewDiffableDataSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider descriptionModel](self, "descriptionModel"));

  if (v3)
  {
    dataSource = self->_dataSource;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider descriptionModel](self, "descriptionModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v5));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

      if (v8)
        -[CuratedCollectionProvider _updateDescriptionColorsInCell:animated:](self, "_updateDescriptionColorsInCell:animated:", v8, 1);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider actionModel](self, "actionModel"));

  if (v9)
  {
    v10 = self->_dataSource;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider actionModel](self, "actionModel"));
    v15 = (id)objc_claimAutoreleasedReturnValue(-[UITableViewDiffableDataSource indexPathForItemIdentifier:](v10, "indexPathForItemIdentifier:", v11));

    v12 = v15;
    if (v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v15));

      if (v14)
        -[CuratedCollectionProvider _updateActionColorsInCell:animated:](self, "_updateActionColorsInCell:animated:", v14, 1);

      v12 = v15;
    }

  }
}

- (void)_updateDescriptionColorsInCell:(id)a3 animated:(BOOL)a4
{
  _objc_msgSend(a3, "setAlwaysUseLightForegroundColors:animated:", 1, a4);
}

- (void)_updateActionColorsInCell:(id)a3 animated:(BOOL)a4
{
  _objc_msgSend(a3, "setAlwaysUseLightForegroundColors:animated:", 1, a4);
}

- (void)didResolveCollection:(id)a3 resolverInfo:(id)a4
{
  id v6;
  id v7;
  CuratedCollectionRichTextParser *v8;
  void *v9;
  void *v10;
  void *v11;
  CuratedCollectionRichTextParser *v12;
  CuratedCollectionRichTextParser *parser;
  CuratedCollectionRichTextParser *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [CuratedCollectionRichTextParser alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
  v12 = -[CuratedCollectionRichTextParser initWithCollection:collectionItems:traitCollection:](v8, "initWithCollection:collectionItems:traitCollection:", v6, v9, v11);
  parser = self->_parser;
  self->_parser = v12;

  v14 = self->_parser;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100A7FDAC;
  v17[3] = &unk_1011B0E90;
  objc_copyWeak(&v20, &location);
  v15 = v6;
  v18 = v15;
  v16 = v7;
  v19 = v16;
  -[CuratedCollectionRichTextParser parseRichTextDescriptionsWithCompletion:](v14, "parseRichTextDescriptionsWithCompletion:", v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_updateSnapshotWithCollection:(id)a3 resolverInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CuratedCollectionActionCellModel *v21;
  void *v22;
  CuratedCollectionActionCellModel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CuratedCollectionDescriptionCellModel *v29;
  void *v30;
  void *v31;
  CuratedCollectionDescriptionCellModel *v32;
  void *v33;
  void *v34;
  void *v35;
  void *i;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _TtC4Maps29LibraryDataOperationsProvider *v51;
  void *v52;
  _TtC4Maps29LibraryDataOperationsProvider *v53;
  _TtC4Maps39CuratedCollectionItemLibraryCoordinator *v54;
  void *v55;
  _TtC4Maps39CuratedCollectionItemLibraryCoordinator *v56;
  CuratedCollectionItemCellModel *v57;
  void *v58;
  CuratedCollectionItemCellModel *v59;
  void *v60;
  CuratedCollectionMediaIntegrationViewModel *v61;
  void *v62;
  CuratedCollectionMediaIntegrationViewModel *v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL8 v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  CuratedCollectionFooterActionItem *v80;
  void *v81;
  void *v82;
  CuratedCollectionFooterActionItem *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  NSObject *v96;
  void *v97;
  unint64_t v98;
  os_signpost_id_t v99;
  void *v100;
  id obj;
  uint64_t v102;
  void *v103;
  CuratedCollectionProvider *v104;
  void *v105;
  id v106;
  id v107;
  _QWORD v108[5];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t buf[8];
  const __CFString *v114;
  const __CFString *v115;
  const __CFString *v116;
  _BYTE v117[128];
  void *v118;
  const __CFString *v119;
  void *v120;
  const __CFString *v121;

  v106 = a3;
  v6 = a4;
  v7 = sub_100A80930();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = sub_100A80930();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  v13 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ResolvedCollectionWithItems", ", buf, 2u);
  }

  v14 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  -[CuratedCollectionProvider setCuratedCollection:](self, "setCuratedCollection:", v106);
  -[CuratedCollectionProvider setResolverInfo:](self, "setResolverInfo:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionItems"));
  -[CuratedCollectionProvider setCollectionItems:](self, "setCollectionItems:", v15);

  if ((objc_msgSend(v106, "isSuppressed") & 1) != 0
    || (objc_msgSend(v106, "isBlocked") & 1) != 0)
  {
    v16 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v17, "setTableFooterView:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v18, "setScrollEnabled:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v20, "setSeparatorColor:", v19);
  }
  else
  {
    v98 = v9 - 1;
    v99 = v9;
    v100 = v6;
    v21 = [CuratedCollectionActionCellModel alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
    v23 = -[CuratedCollectionActionCellModel initWithCollection:](v21, "initWithCollection:", v22);
    -[CuratedCollectionProvider setActionModel:](self, "setActionModel:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider actionModel](self, "actionModel"));
    objc_msgSend(v25, "setActionDelegate:", v24);

    v121 = CFSTR("CollectionActionSection");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v121, 1));
    objc_msgSend(v14, "appendSectionsWithIdentifiers:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider actionModel](self, "actionModel"));
    v120 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v120, 1));
    objc_msgSend(v14, "appendItemsWithIdentifiers:", v28);

    v29 = [CuratedCollectionDescriptionCellModel alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionRichTextParser collectionDescription](self->_parser, "collectionDescription"));
    v32 = -[CuratedCollectionDescriptionCellModel initWithCollection:collectionDescription:](v29, "initWithCollection:collectionDescription:", v30, v31);
    -[CuratedCollectionProvider setDescriptionModel:](self, "setDescriptionModel:", v32);

    v119 = CFSTR("CollectionDescriptionSection");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v119, 1));
    objc_msgSend(v14, "appendSectionsWithIdentifiers:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider descriptionModel](self, "descriptionModel"));
    v118 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v118, 1));
    v97 = v14;
    objc_msgSend(v14, "appendItemsWithIdentifiers:", v35);

    v103 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider collectionItems](self, "collectionItems"));
    v104 = self;
    v107 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
    if (v107)
    {
      v102 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v107; i = (char *)i + 1)
        {
          if (*(_QWORD *)v110 != v102)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
          v38 = objc_alloc((Class)MKMapItemIdentifier);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "placeCollectionItem"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "itemIdentifier"));
          v41 = objc_msgSend(v38, "initWithGEOMapItemIdentifier:", v40);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionRichTextParser collectionItemDescriptions](self->_parser, "collectionItemDescriptions"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v41));

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mapItem"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "firstUserGuideContainingMapItem:requiresOrdering:", v44, 0));
          v46 = v45 != 0;

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver appClips](self->_resolver, "appClips"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "placeCollectionItem"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "itemIdentifier"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v49));

          v51 = [_TtC4Maps29LibraryDataOperationsProvider alloc];
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mapsSyncStore](self, "mapsSyncStore"));
          v53 = -[LibraryDataOperationsProvider initWithMapsSyncStore:](v51, "initWithMapsSyncStore:", v52);

          v54 = [_TtC4Maps39CuratedCollectionItemLibraryCoordinator alloc];
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mapItem"));
          v56 = -[CuratedCollectionItemLibraryCoordinator initWithInitialMapItem:dataOperationsProvider:](v54, "initWithInitialMapItem:dataOperationsProvider:", v55, v53);

          v57 = [CuratedCollectionItemCellModel alloc];
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "publisherAttribution"));
          v59 = -[CuratedCollectionItemCellModel initWithMKPlaceCollectionMapItem:usingAttribution:itemDescription:itemInUserCollection:libraryOperationsCoordinator:appClip:](v57, "initWithMKPlaceCollectionMapItem:usingAttribution:itemDescription:itemInUserCollection:libraryOperationsCoordinator:appClip:", v37, v58, v43, v46, v56, v50);
          objc_msgSend(v105, "addObject:", v59);

          self = v104;
        }
        v107 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
      }
      while (v107);
    }

    v6 = v100;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "mediaIntegration"));
    v14 = v97;
    v13 = v98;
    if (v60)
    {
      if (objc_msgSend(v100, "mediaIntegrationCollectionItemIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v61 = [CuratedCollectionMediaIntegrationViewModel alloc];
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "thirdPartyLinks"));
        v63 = -[CuratedCollectionMediaIntegrationViewModel initWithAppleMediaServicesResult:thirdPartyLinks:](v61, "initWithAppleMediaServicesResult:thirdPartyLinks:", v60, v62);
        -[CuratedCollectionProvider setMediaIntegrationModel:](self, "setMediaIntegrationModel:", v63);

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mediaIntegrationModel](self, "mediaIntegrationModel"));
        if (v64)
        {
          v65 = objc_msgSend(v100, "mediaIntegrationPosition");
          if (!v65 || v65 == (id)2)
          {
            v66 = (uint64_t)objc_msgSend(v100, "mediaIntegrationCollectionItemIndex") + 1;
          }
          else if (v65 == (id)1)
          {
            v66 = (uint64_t)objc_msgSend(v100, "mediaIntegrationCollectionItemIndex");
          }
          else
          {
            v66 = 0;
          }
          v67 = (id)(v66 & ~(v66 >> 63));
          if ((uint64_t)v67 >= (uint64_t)objc_msgSend(v105, "count"))
            v67 = objc_msgSend(v105, "count");
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mediaIntegrationModel](self, "mediaIntegrationModel"));
          objc_msgSend(v105, "insertObject:atIndex:", v68, v67);

        }
      }
    }
    v69 = objc_msgSend(v105, "copy");
    -[CuratedCollectionProvider setModels:](self, "setModels:", v69);

    v116 = CFSTR("CollectionItemSection");
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v116, 1));
    objc_msgSend(v97, "appendSectionsWithIdentifiers:", v70);

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider models](self, "models"));
    objc_msgSend(v97, "appendItemsWithIdentifiers:", v71);

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v74 = objc_msgSend(v73, "userInterfaceIdiom") != (id)5;

    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "publisher"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForPublisher:showDisclosureIndicator:](TwoLinesContentViewModelComposer, "cellModelForPublisher:showDisclosureIndicator:", v75, v74));
    objc_msgSend(v72, "addObject:", v76);

    v77 = objc_msgSend(v72, "copy");
    -[CuratedCollectionProvider setPublisherModel:](self, "setPublisherModel:", v77);

    v115 = CFSTR("CollectionPublisherItemSection");
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v115, 1));
    objc_msgSend(v97, "appendSectionsWithIdentifiers:", v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider publisherModel](self, "publisherModel"));
    objc_msgSend(v97, "appendItemsWithIdentifiers:", v79);

    v80 = [CuratedCollectionFooterActionItem alloc];
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("Report an Issue"), CFSTR("localized string not found"), 0));
    v83 = -[CuratedCollectionFooterActionItem initWithType:title:glyph:](v80, "initWithType:title:glyph:", 0, v82, CFSTR("exclamationmark.bubble.fill"));

    self = v104;
    if (_MKRAPIsAvailable(-[CuratedCollectionProvider setFooterActionItems:](v104, "setFooterActionItems:", &__NSArray0__struct))&& (sub_1003DDB84() & 1) == 0)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider footerActionItems](v104, "footerActionItems"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "arrayByAddingObject:", v83));
      -[CuratedCollectionProvider setFooterActionItems:](v104, "setFooterActionItems:", v85);

    }
    v114 = CFSTR("ActionsItemSection");
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v114, 1));
    objc_msgSend(v97, "appendSectionsWithIdentifiers:", v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider footerActionItems](v104, "footerActionItems"));
    objc_msgSend(v97, "appendItemsWithIdentifiers:", v87);

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v104, "tableView"));
    objc_msgSend(v88, "setScrollEnabled:", 1);

    v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v104, "tableView"));
    objc_msgSend(v90, "setSeparatorColor:", v89);

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v104, "tableView"));
    objc_msgSend(v91, "setTableFooterView:", 0);

    v9 = v99;
    v19 = v103;
    v20 = v105;
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_100A80970;
  v108[3] = &unk_1011AC860;
  v108[4] = self;
  objc_msgSend(v92, "applySnapshot:animatingDifferences:completion:", v14, 0, v108);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v93, "dataSourceUpdated:", self);

  v94 = sub_100A80930();
  v95 = objc_claimAutoreleasedReturnValue(v94);
  v96 = v95;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v96, OS_SIGNPOST_INTERVAL_END, v9, "ResolvedCollectionWithItems", ", buf, 2u);
  }

}

- (void)didFailToResolveCollectionWithError:(id)a3 withFetchedCollection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  int v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_100A80930();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to resolve collection with error %@", (uint8_t *)&v20, 0xCu);
  }

  v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v11, "setTableFooterView:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v12, "setScrollEnabled:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v14, "setSeparatorColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v16 = v7;
  if ((objc_msgSend(v16, "isBlocked") & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v18 = objc_msgSend(v16, "isSuppressed");
    if ((v18 & 1) != 0)
    {
      v17 = 2;
    }
    else if (MKCurrentNetworkConnectionFailureDiagnosis(v18, v19))
    {
      v17 = 3;
    }
    else
    {
      v17 = 0;
    }
  }

  objc_msgSend(v15, "dataSource:didFailWithErrorState:", self, v17);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
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
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  char *v33;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sectionIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v9, "section")));

  if (objc_msgSend(v14, "isEqualToString:", CFSTR("CollectionActionSection")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionActionTableViewCell reuseIdentifier](CuratedCollectionActionTableViewCell, "reuseIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v15, v9));

    objc_msgSend(v16, "configureWithModel:", v10);
    -[CuratedCollectionProvider _updateActionColorsInCell:animated:](self, "_updateActionColorsInCell:animated:", v16, 0);
    goto LABEL_20;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("CollectionDescriptionSection")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionDescriptionTableViewCell reuseIdentifier](CuratedCollectionDescriptionTableViewCell, "reuseIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v17, v9));

    objc_msgSend(v16, "setDelegate:", self);
    objc_msgSend(v16, "bounds");
    objc_msgSend(v16, "setSeparatorInset:", 0.0, CGRectGetWidth(v35), 0.0, 0.0);
    objc_msgSend(v16, "configureWithModel:", v10);
    -[CuratedCollectionProvider _updateDescriptionColorsInCell:animated:](self, "_updateDescriptionColorsInCell:animated:", v16, 0);
    goto LABEL_20;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("CollectionItemSection")))
  {
    v18 = objc_opt_class(CuratedCollectionItemCellModel);
    if ((objc_opt_isKindOfClass(v10, v18) & 1) != 0)
    {
      v19 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
      objc_msgSend(v19, "setCurrentLocation:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionItemTableViewCell reuseIdentifier](CuratedCollectionItemTableViewCell, "reuseIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v21, v9));

      objc_msgSend(v16, "setDelegate:", self);
      objc_msgSend(v16, "configureWithModel:", v19);
      v22 = objc_msgSend(v9, "row");
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider resolverInfo](self, "resolverInfo"));
      if (v22 == objc_msgSend(v23, "mediaIntegrationCollectionItemIndex"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider resolverInfo](self, "resolverInfo"));
        v25 = objc_msgSend(v24, "mediaIntegrationPosition");

        if (v25 == (id)2)
        {
          objc_msgSend(v16, "bounds");
          objc_msgSend(v16, "setSeparatorInset:", 0.0, CGRectGetWidth(v36), 0.0, 0.0);
        }
      }
      else
      {

      }
      goto LABEL_19;
    }
    v27 = objc_opt_class(CuratedCollectionMediaIntegrationViewModel);
    if ((objc_opt_isKindOfClass(v10, v27) & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionMediaIntegrationTableViewCell reuseIdentifier](CuratedCollectionMediaIntegrationTableViewCell, "reuseIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v28, v9));

      objc_msgSend(v16, "setViewModel:", v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider resolverInfo](self, "resolverInfo"));
      objc_msgSend(v16, "setPosition:", objc_msgSend(v29, "mediaIntegrationPosition"));

      objc_msgSend(v16, "setDelegate:", self);
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("CollectionPublisherItemSection")))
  {
    v19 = v10;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v26));

    objc_msgSend(v16, "setViewModel:", v19);
LABEL_19:

    goto LABEL_20;
  }
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("ActionsItemSection")))
  {
LABEL_17:
    v16 = 0;
    goto LABEL_20;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionFooterActionTableViewCell reuseIdentifier](CuratedCollectionFooterActionTableViewCell, "reuseIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v30, v9));

  objc_msgSend(v16, "setActionItem:", v10);
  v31 = (char *)objc_msgSend(v9, "row");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider footerActionItems](self, "footerActionItems"));
  v33 = (char *)objc_msgSend(v32, "count") - 1;

  if (v31 == v33)
  {
    objc_msgSend(v16, "bounds");
    objc_msgSend(v16, "setSeparatorInset:", 0.0, CGRectGetWidth(v37), 0.0, 0.0);
  }
LABEL_20:

  return v16;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __objc2_class *v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifiers"));
  v9 = objc_msgSend(v5, "section");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v9));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CollectionDescriptionSection")))
  {
    v11 = CuratedCollectionDescriptionTableViewCell;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("CollectionItemSection")))
    {
      v13 = UITableViewAutomaticDimension;
      goto LABEL_7;
    }
    v11 = CuratedCollectionItemTableViewCell;
  }
  -[__objc2_class estimatedCellHeight](v11, "estimatedCellHeight");
  v13 = v12;
LABEL_7:

  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionIdentifiers"));
  v11 = objc_msgSend(v7, "section");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v11));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("CollectionActionSection")))
  {
    v13 = v20;
    v14 = objc_opt_class(CuratedCollectionActionTableViewCell);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    -[CuratedCollectionProvider _updateActionColorsInCell:animated:](self, "_updateActionColorsInCell:animated:", v16, 0);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("CollectionDescriptionSection")))
  {
    v17 = v20;
    v18 = objc_opt_class(CuratedCollectionDescriptionTableViewCell);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      v19 = v17;
    else
      v19 = 0;
    v16 = v19;

    -[CuratedCollectionProvider _updateDescriptionColorsInCell:animated:](self, "_updateDescriptionColorsInCell:animated:", v16, 0);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedItem"));
  v8 = objc_opt_class(UITableViewCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    goto LABEL_9;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "indexPathForCell:", v7));
  if (!v9)
  {
LABEL_8:

LABEL_9:
    -[CuratedCollectionProvider _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v9, "dataSource:itemFocused:", self, 0);
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshot"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionIdentifiers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v9, "section")));

  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("CollectionItemSection")))
  {
LABEL_7:

    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider models](self, "models"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "row")));

  v16 = objc_opt_class(CuratedCollectionItemCellModel);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {

    goto LABEL_7;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collectionItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v18, "dataSource:itemFocused:", self, v17);

  -[CuratedCollectionProvider _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", v9);
LABEL_10:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "section")));

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CollectionItemSection")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider models](self, "models"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row")));

    v13 = objc_opt_class(CuratedCollectionItemCellModel);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionItem"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v15, "dataSource:itemTapped:", self, v14);

LABEL_12:
      goto LABEL_13;
    }
    v18 = objc_opt_class(CuratedCollectionMediaIntegrationViewModel);
    if ((objc_opt_isKindOfClass(v12, v18) & 1) != 0)
    {
      objc_msgSend(v21, "deselectRowAtIndexPath:animated:", v6, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mediaIntegrationModel](self, "mediaIntegrationModel"));
      objc_msgSend(v19, "logTapMediaIntegrationWithType:verticalIndex:", objc_msgSend(v20, "mediaType"), objc_msgSend(v6, "row"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider mediaIntegrationModel](self, "mediaIntegrationModel"));
      -[CuratedCollectionProvider _punchoutToViewModel:](self, "_punchoutToViewModel:", v14);
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("ActionsItemSection")))
  {
    objc_msgSend(v21, "deselectRowAtIndexPath:animated:", v6, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider footerActionItems](self, "footerActionItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v6, "row")));

    if (objc_msgSend(v12, "type"))
      goto LABEL_13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cellForRowAtIndexPath:", v6));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v17, "presentRAPWithSourceView:", v14);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CollectionPublisherItemSection")))
  {
    objc_msgSend(v21, "deselectRowAtIndexPath:animated:", v6, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "publisher"));
    objc_msgSend(v12, "showPublisherView:", v17);
    goto LABEL_11;
  }
LABEL_14:

}

- (void)_openURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "_maps_openURL:options:completionHandler:", v3, 0, 0);

}

- (void)didSelectAddOrRemoveFromLibrary:(BOOL)a3 forModel:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryOperationsCoordinator"));

  if (v4)
    objc_msgSend(v8, "dataSource:addPlaceToLibraryUsingCoordinator:", self, v7);
  else
    objc_msgSend(v8, "dataSource:removePlaceFromLibraryUsingCoordinator:", self, v7);

}

- (void)didSelectAddToUserCollection:(id)a3 forMapItem:(id)a4 sourceView:(id)a5 onSaveCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v14, "dataSource:addToUserCollection:forMapItem:sourceView:onSaveCompletion:", self, v13, v12, v11, v10);

}

- (void)willPunchOutToPublisherWebpageForPlaceCollectionItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSource:willPunchOuToPublisherWebpageForPlaceCollectionItem:", self, v4);

}

- (void)openAppClip:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSource:openAppClip:", self, v4);

}

- (void)cellPublisherLogoTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisher"));
  objc_msgSend(v6, "showPublisherView:", v5);

}

- (void)cellExpansionOccured:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  v4 = objc_msgSend(a3, "expanded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "logTapShowMoreDescription");
  else
    objc_msgSend(v5, "logTapShowLessDescription");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A81A98;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)refresh
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v4, "setSeparatorColor:", v3);

  -[CuratedCollectionResolver resolveCollection](self->_resolver, "resolveCollection");
}

- (void)_updateLibraryStatusForModels
{
  void *v3;
  void *v4;
  dispatch_group_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[4];
  dispatch_group_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));

  if (objc_msgSend(v4, "indexOfSectionIdentifier:", CFSTR("CollectionItemSection")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = dispatch_group_create();
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", CFSTR("CollectionItemSection")));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A81CC0;
    v12[3] = &unk_1011E1120;
    v13 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A81D94;
    v9[3] = &unk_1011AD238;
    v9[4] = self;
    v10 = v4;
    v11 = v6;
    v8 = v6;
    dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

  }
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  v5 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    -[CuratedCollectionProvider _updateLibraryStatusForModels](self, "_updateLibraryStatusForModels");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));

    if (objc_msgSend(v7, "indexOfSectionIdentifier:", CFSTR("CollectionItemSection")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = sub_100A80930();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
        v12 = sub_10039E4FC((int)objc_msgSend(v11, "isSuppressed"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider curatedCollection](self, "curatedCollection"));
        v15 = sub_10039E4FC((int)objc_msgSend(v14, "isBlocked"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifiers"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifiers"));
        *(_DWORD *)buf = 138413314;
        v22 = v10;
        v23 = 2112;
        v24 = v13;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to find collection items section during contentDidChange.                         Collection: %@. isSuppressed/isBlocked: %@/%@. Sections: %@. Identifiers: %@", buf, 0x34u);

      }
    }
    else
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifiersInSectionWithIdentifier:", CFSTR("CollectionItemSection")));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100A81FF0;
      v19[3] = &unk_1011E1120;
      v20 = v5;
      -[NSObject enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v19);
      -[CuratedCollectionProvider _reconfigureSnapshot:updatedModels:](self, "_reconfigureSnapshot:updatedModels:", v7, v9);

    }
  }

}

- (void)_reconfigureSnapshot:(id)a3 updatedModels:(id)a4
{
  id v6;
  UITableViewDiffableDataSource *dataSource;
  _QWORD v8[5];

  v6 = a3;
  objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", a4);
  self->_isApplyingSnapshot = 1;
  dataSource = self->_dataSource;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A82140;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  -[UITableViewDiffableDataSource applySnapshotUsingReloadData:completion:](dataSource, "applySnapshotUsingReloadData:completion:", v6, v8);

}

- (void)mediaIntegrationCellDidDisplayChildLinks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", v9));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
    objc_msgSend(v6, "logTapMediaIntegrationWithType:verticalIndex:", objc_msgSend(v7, "mediaType"), objc_msgSend(v5, "row"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
    objc_msgSend(v8, "logShowMediaAppMenu");

  }
}

- (void)mediaIntegrationCell:(id)a3 didSelectChildLink:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetAppIdentifier"));
  objc_msgSend(v5, "logTapMediaAppWithIdentifier:", v6);

  -[CuratedCollectionProvider _punchoutToViewModel:](self, "_punchoutToViewModel:", v7);
}

- (void)_punchoutToViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetAppIdentifier"));
  objc_msgSend(v5, "logPunchOutUsingAppWithIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider analyticsController](self, "analyticsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  objc_msgSend(v7, "logPunchOutToURL:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  -[CuratedCollectionProvider _openURL:](self, "_openURL:", v9);

}

- (void)storeDidChangeWithTypes:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A823B0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (NSArray)storeSubscriptionTypes
{
  return self->_storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollection, a3);
}

- (NSArray)collectionItems
{
  return self->_collectionItems;
}

- (void)setCollectionItems:(id)a3
{
  objc_storeStrong((id *)&self->_collectionItems, a3);
}

- (CuratedCollectionViewAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsController, a3);
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (double)subheaderTransitionFraction
{
  return self->_subheaderTransitionFraction;
}

- (CuratedCollectionActionCellModel)actionModel
{
  return self->_actionModel;
}

- (void)setActionModel:(id)a3
{
  objc_storeStrong((id *)&self->_actionModel, a3);
}

- (CuratedCollectionDescriptionCellModel)descriptionModel
{
  return self->_descriptionModel;
}

- (void)setDescriptionModel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionModel, a3);
}

- (CuratedCollectionMediaIntegrationViewModel)mediaIntegrationModel
{
  return self->_mediaIntegrationModel;
}

- (void)setMediaIntegrationModel:(id)a3
{
  objc_storeStrong((id *)&self->_mediaIntegrationModel, a3);
}

- (CuratedCollectionResolverInfo)resolverInfo
{
  return self->_resolverInfo;
}

- (void)setResolverInfo:(id)a3
{
  objc_storeStrong((id *)&self->_resolverInfo, a3);
}

- (NSArray)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
  objc_storeStrong((id *)&self->_models, a3);
}

- (TwoLinesContentViewModel)publisherModel
{
  return self->_publisherModel;
}

- (void)setPublisherModel:(id)a3
{
  objc_storeStrong((id *)&self->_publisherModel, a3);
}

- (NSArray)footerActionItems
{
  return self->_footerActionItems;
}

- (void)setFooterActionItems:(id)a3
{
  objc_storeStrong((id *)&self->_footerActionItems, a3);
}

- (CuratedCollectionResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (CuratedCollectionRichTextParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (_TtC8MapsSync13MapsSyncStore)mapsSyncStore
{
  return self->_mapsSyncStore;
}

- (void)setMapsSyncStore:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSyncStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSyncStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_footerActionItems, 0);
  objc_storeStrong((id *)&self->_publisherModel, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_resolverInfo, 0);
  objc_storeStrong((id *)&self->_mediaIntegrationModel, 0);
  objc_storeStrong((id *)&self->_descriptionModel, 0);
  objc_storeStrong((id *)&self->_actionModel, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_collectionItems, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_keyCommands, 0);
}

@end
