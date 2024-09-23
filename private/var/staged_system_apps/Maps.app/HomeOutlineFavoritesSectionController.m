@implementation HomeOutlineFavoritesSectionController

- (HomeOutlineFavoritesSectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4
{
  id v7;
  HomeOutlineFavoritesSectionController *v8;
  HomeOutlineFavoritesSectionController *v9;
  MeCardDataProvider *v10;
  MeCardDataProvider *meCardDataProvider;
  uint64_t v12;
  NSMutableArray *dropShortcutEditSessions;
  uint64_t v14;
  NSMutableArray *deleteShortcutEditSessions;
  uint64_t v16;
  ShortcutManager *shortcutManager;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HomeOutlineFavoritesSectionController;
  v8 = -[HomeOutlineSectionController initWithConfiguration:](&v19, "initWithConfiguration:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suggestionsDataProvider, a4);
    v10 = objc_alloc_init(MeCardDataProvider);
    meCardDataProvider = v9->_meCardDataProvider;
    v9->_meCardDataProvider = v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    dropShortcutEditSessions = v9->_dropShortcutEditSessions;
    v9->_dropShortcutEditSessions = (NSMutableArray *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    deleteShortcutEditSessions = v9->_deleteShortcutEditSessions;
    v9->_deleteShortcutEditSessions = (NSMutableArray *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    shortcutManager = v9->_shortcutManager;
    v9->_shortcutManager = (ShortcutManager *)v16;

  }
  return v9;
}

- (HomeOutlineFavoritesSectionController)initWithConfiguration:(id)a3 favoritesDataProvider:(id)a4 libraryCountsDataProvider:(id)a5
{
  id v9;
  id v10;
  HomeOutlineFavoritesSectionController *v11;
  HomeOutlineFavoritesSectionController *v12;
  uint64_t v13;
  NSMutableArray *dropShortcutEditSessions;
  uint64_t v15;
  NSMutableArray *deleteShortcutEditSessions;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HomeOutlineFavoritesSectionController;
  v11 = -[HomeOutlineSectionController initWithConfiguration:](&v18, "initWithConfiguration:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_favoritesDataProvider, a4);
    objc_storeStrong((id *)&v12->_libraryCountsDataProvider, a5);
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    dropShortcutEditSessions = v12->_dropShortcutEditSessions;
    v12->_dropShortcutEditSessions = (NSMutableArray *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    deleteShortcutEditSessions = v12->_deleteShortcutEditSessions;
    v12->_deleteShortcutEditSessions = (NSMutableArray *)v15;

  }
  return v12;
}

- (NSArray)dataProviders
{
  int *v3;
  _TtC4Maps20MapsFavoritesManager **p_favoritesDataProvider;
  SuggestionsDataProvider *suggestionsDataProvider;
  _TtC4Maps20MapsFavoritesManager *favoritesDataProvider;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = &OBJC_IVAR___HomeOutlineFavoritesSectionController__libraryCountsDataProvider;
    favoritesDataProvider = self->_favoritesDataProvider;
    p_favoritesDataProvider = &favoritesDataProvider;
  }
  else
  {
    v3 = &OBJC_IVAR___HomeOutlineFavoritesSectionController__meCardDataProvider;
    suggestionsDataProvider = self->_suggestionsDataProvider;
    p_favoritesDataProvider = (_TtC4Maps20MapsFavoritesManager **)&suggestionsDataProvider;
  }
  p_favoritesDataProvider[1] = *(_TtC4Maps20MapsFavoritesManager **)((char *)&self->super.super.isa + *v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:"));
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "home Data ProvidingObject Did Update: %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)HomeOutlineFavoritesSectionController;
  -[HomeOutlineSectionController homeDataProvidingObjectDidUpdate:](&v7, "homeDataProvidingObjectDidUpdate:", v4);

}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  unsigned int v3;
  SectionHeaderAddOutlineCellModel *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  SectionHeaderAddOutlineCellModel *v9;

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = [SectionHeaderAddOutlineCellModel alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v3)
    v7 = CFSTR("[Proactive Tray] Library Section");
  else
    v7 = CFSTR("[Proactive Tray] Favorites Section");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
  v9 = -[SectionHeaderAddOutlineCellModel initWithTitle:accessoryDelegate:](v4, "initWithTitle:accessoryDelegate:", v8, self);

  return (MapsUIDiffableDataSourceViewModel *)v9;
}

- (NSArray)itemSnapshots
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  SmallButtonOutlineCellModel *v14;
  void *v15;
  void *v16;
  SmallButtonOutlineCellModel *v17;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v18;
  void *v19;
  void *v20;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v21;
  uint64_t v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFavoritesManager shortcutsForMapsHome](self->_favoritesDataProvider, "shortcutsForMapsHome"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v3));

    objc_msgSend(v4, "addObject:", CFSTR("kLibraryCellIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionIdentifier"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10091DA14;
    v27[3] = &unk_1011DC040;
    v27[4] = self;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10091DBE4;
    v26[3] = &unk_1011DC068;
    v26[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v4, v6, -[HomeOutlineSectionController expanded](self, "expanded"), v27, v26, &stru_1011DC0A8, &stru_1011DC0E8));

    if (-[HomeOutlineFavoritesSectionController _shouldShowAddButtonForItemSnapshots:](self, "_shouldShowAddButtonForItemSnapshots:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[Proactive Tray Mac] Add Pin");
LABEL_6:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

      v14 = [SmallButtonOutlineCellModel alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle.fill")));
      v17 = -[SmallButtonOutlineCellModel initWithStyle:title:image:hoverImage:delegate:](v14, "initWithStyle:title:image:hoverImage:delegate:", 1, v13, v15, v16, self);

      v18 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifierPathByAppendingIdentifier:", CFSTR("AddButtonIdentifier")));
      v21 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:](v18, "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v20, v17, &__NSArray0__struct, 0);

      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v21));
      v7 = (void *)v22;
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entriesLegacy](self, "_entriesLegacy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionIdentifier"));
    v24[4] = self;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10091DF28;
    v25[3] = &unk_1011DC110;
    v25[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10091DF80;
    v24[3] = &unk_1011DC138;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v4, v12, -[HomeOutlineSectionController expanded](self, "expanded"), v25, v24, &stru_1011DC158, &stru_1011DC178));

    if (-[HomeOutlineFavoritesSectionController _shouldShowAddButtonForItemSnapshots:](self, "_shouldShowAddButtonForItemSnapshots:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[Proactive Tray] Add Favorite");
      goto LABEL_6;
    }
  }

  return (NSArray *)v7;
}

- (BOOL)shouldClearSelectionWithReason:(id)a3
{
  objc_msgSend(a3, "action");
  return 1;
}

- (id)sourceViewForProfileTipPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionController:indexPathForIdentifierPath:", self, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v5));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    -[HomeOutlineSectionController expandElementAtIdentifierPath:](self, "expandElementAtIdentifierPath:", v9);

    v10 = v8;
  }

  return v8;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  id location;
  void *v61;
  _QWORD v62[2];
  void *v63;
  void *v64;
  void *v65;

  v4 = a3;
  v5 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  if (v5)
  {
    v7 = objc_opt_class(TwoLinesMapsFavoriteItemOutlineCellModel);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "item"));
  }
  else
  {
    v11 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
      v12 = v6;
    else
      v12 = 0;
    v13 = v12;

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));
    if (!v9)
      goto LABEL_14;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_shortcutForSuggestionsEntry:", v9));

  }
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_initWeak(&location, self);
    if (objc_msgSend(v10, "isSetupPlaceholder"))
    {
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10091E910;
      v58[3] = &unk_1011AD1E8;
      v16 = v58;
      v43 = &v59;
      objc_copyWeak(&v59, &location);
      v58[4] = v4;
      v17 = HomeDeleteAction(v58);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v65 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v19));

      objc_msgSend(v15, "addObject:", v20);
    }
    else
    {
      if (objc_msgSend(v10, "type") != (id)6)
      {
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10091E988;
        v53[3] = &unk_1011AD1E8;
        v43 = &v55;
        objc_copyWeak(&v55, &location);
        v25 = v4;
        v54 = v25;
        v26 = HomeEditFavoriteAction(v53);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v63 = v18;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v27));

        objc_msgSend(v15, "addObject:", v20);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10091E9C4;
        v50[3] = &unk_1011AD1E8;
        objc_copyWeak(&v52, &location);
        v28 = v25;
        v51 = v28;
        v29 = HomeOpenInNewTabAction(v50);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10091EA04;
        v47[3] = &unk_1011AD1E8;
        objc_copyWeak(&v49, &location);
        v30 = v28;
        v48 = v30;
        v31 = HomeOpenInNewWindowAction(v47);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        v62[0] = v42;
        v62[1] = v32;
        v40 = (void *)v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 2));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v33));

        objc_msgSend(v15, "addObject:", v41);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 1));
        objc_msgSend(v15, "addObject:", v34);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10091EA44;
        v44[3] = &unk_1011AD1E8;
        objc_copyWeak(&v46, &location);
        v45 = v30;
        v35 = HomeRemoveFromFavoritesAction(v44);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v61 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v37));

        objc_msgSend(v15, "addObject:", v38);
        objc_destroyWeak(&v46);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v52);
        v24 = &v54;
        goto LABEL_19;
      }
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10091E94C;
      v56[3] = &unk_1011AD1E8;
      v16 = v56;
      v43 = &v57;
      objc_copyWeak(&v57, &location);
      v56[4] = v4;
      v22 = HomeRemoveFromFavoritesAction(v56);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v64 = v18;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v23));

      objc_msgSend(v15, "addObject:", v20);
    }
    v24 = (id *)(v16 + 4);
LABEL_19:

    objc_destroyWeak(v43);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v15));
    objc_destroyWeak(&location);

    goto LABEL_20;
  }
LABEL_14:
  v21 = 0;
LABEL_20:

  return v21;
}

- (void)_editEntrySnapshot:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v4 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "viewModel"));
  if (v4)
  {
    v6 = objc_opt_class(TwoLinesMapsFavoriteItemOutlineCellModel);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "item"));
  }
  else
  {
    v10 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
    if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
      v11 = v5;
    else
      v11 = 0;
    v12 = v11;

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entry"));
    if (!v8)
      goto LABEL_25;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_shortcutForSuggestionsEntry:", v8));

  }
  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifierPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sectionController:indexPathForIdentifierPath:", self, v15));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cellForItemAtIndexPath:", v16));

      v20 = objc_opt_class(TwoLinesOutlineCell);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        v21 = v19;
      else
        v21 = 0;
      v22 = v21;

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAccessoryConfigurations"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));

        v25 = objc_opt_class(_UICellAccessoryConfigurationCustomView);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
          v26 = v24;
        else
          v26 = 0;
        v27 = v26;

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "customView"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "customView"));
          objc_msgSend(v29, "bounds");
          -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v9, v28);

        }
      }

    }
  }
LABEL_25:

}

- (void)_openSnapshot:(id)a3 inNewTab:(BOOL)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;

  v5 = a3;
  v6 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewModel"));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "item"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItemStorage"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entry"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));
  }
  v10 = (void *)v9;

  v11 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.NewWindow"));
  objc_msgSend(v11, "setEligibleForHandoff:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeActionDelegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeContaineeViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_mapsSceneDelegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapsActivityWithFidelity:", 2));

  objc_msgSend(v16, "setPresentedMapItem:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "data"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bzip2CompressedData"));

  if (v18)
  {
    v26 = CFSTR("bs");
    v27 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    objc_msgSend(v11, "setUserInfo:", v19);

  }
  v20 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "homeActionDelegate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "homeContaineeViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_maps_uiScene"));
  objc_msgSend(v20, "setRequestingScene:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v25, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v11, v20, 0);

}

- (id)shareItemSourceForSnapshot:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  SearchResult *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));

  if (v5)
  {
    v7 = objc_opt_class(TwoLinesMapsFavoriteItemOutlineCellModel);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "item"));
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v11 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
      v12 = v6;
    else
      v12 = 0;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));
    if (!v14)
    {
      v10 = 0;
      goto LABEL_15;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_maps_shortcutForSuggestionsEntry:", v14));

  }
  if ((objc_msgSend(v10, "isSetupPlaceholder") & 1) != 0)
  {
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));
  v17 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v16, 0);
  v18 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult unknownContact](v18, "unknownContact"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v18, v19, 1));

LABEL_16:
  return v20;
}

- (BOOL)_shouldShowAddButtonForItemSnapshots:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

        if (!v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)_addFavorite
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeActionDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeContaineeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSession](ShortcutEditSession, "addSession"));
  objc_msgSend(v4, "viewController:showAddShortcut:", v7, v8);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2044, 8, 0);
}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellModel"));
  v9 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_shortcutForSuggestionsEntry:", v12));

    if (!v14)
      goto LABEL_7;
    objc_msgSend(v7, "bounds");
    -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v14, v7);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellModel"));
  v16 = objc_opt_class(TwoLinesMapsFavoriteItemOutlineCellModel);
  v17 = objc_opt_isKindOfClass(v15, v16);

  if ((v17 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellModel"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
    if (!v18)
    {
LABEL_8:

      goto LABEL_9;
    }
    v12 = (void *)v18;
    objc_msgSend(v7, "bounds");
    -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v12, v7);
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:

}

- (void)sectionHeaderOutlineCell:(id)a3 accessoryTypeTapped:(int64_t)a4
{
  if (a4 == 2)
    -[HomeOutlineFavoritesSectionController _addFavorite](self, "_addFavorite", a3);
}

- (void)smallButtonOutlineCellTapped:(id)a3
{
  -[HomeOutlineFavoritesSectionController _addFavorite](self, "_addFavorite", a3);
}

- (void)_startEditSessionForShortcut:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  ShortcutEditSession *v13;
  ShortcutEditSession *shortcutEditSession;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  if (!self->_shortcutEditSession)
  {
    v13 = (ShortcutEditSession *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v11));
    shortcutEditSession = self->_shortcutEditSession;
    self->_shortcutEditSession = v13;

    objc_initWeak(&location, self);
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_10091F66C;
    v24 = &unk_1011AD260;
    objc_copyWeak(&v25, &location);
    -[ShortcutEditSession setCompletionHandler:](self->_shortcutEditSession, "setCompletionHandler:", &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate", v21, v22, v23, v24));
    objc_msgSend(v15, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionCoordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "homeActionDelegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "homeContaineeViewController"));
    objc_msgSend(v17, "viewController:editShortcut:sourceView:sourceRect:", v20, self->_shortcutEditSession, v12, x, y, width, height);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

- (void)_endEditSession
{
  ShortcutEditSession *shortcutEditSession;
  id v4;

  shortcutEditSession = self->_shortcutEditSession;
  if (shortcutEditSession)
  {
    self->_shortcutEditSession = 0;

    v4 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v4, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  }
}

- (BOOL)_accessoryVisiblityForEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_shortcutForSuggestionsEntry:", v4));

  if (self->_shortcutEditSession)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    if (v7 == v9 || objc_msgSend(v7, "isEqual:", v9))
    {
      v10 = (id)MapsSuggestionsShortcutTypeFromEntryType(objc_msgSend(v4, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
      v12 = v10 == objc_msgSend(v11, "type");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return !v12;
}

- (BOOL)_accessoryVisiblityForFavorite:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (self->_shortcutEditSession)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    if (v6 == v8 || objc_msgSend(v6, "isEqual:", v8))
    {
      v9 = objc_msgSend(v5, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut"));
      v11 = v9 == objc_msgSend(v10, "type");

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return !v11;
}

- (BOOL)_shouldShowAccessoryForEntry:(id)a3
{
  return MapsSuggestionsEntryIsNearbyTransit(a3, a2) ^ 1;
}

- (BOOL)_shouldShowAccessoryForFavorite:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  unsigned int v6;

  v3 = a3;
  if (objc_msgSend(v3, "type") == (id)6
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier")),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NearbyTransit")),
        v4,
        (v5 & 1) != 0))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = objc_msgSend(v3, "isSetupPlaceholder") ^ 1;
  }

  return v6;
}

- (BOOL)_isMoveOperationWithDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  unint64_t v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localDragSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localContext"));

  v7 = objc_opt_class(MapsDragLocalContext);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localObject"));

  v13 = objc_opt_class(HomeDragLocalContext);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  if (!v9)
    goto LABEL_15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windowScene"));
  if (v16 == v20)
    v21 = 1;
  else
    v21 = objc_msgSend(v16, "isEqual:", v20);

  LOBYTE(v16) = 0;
  if (v21 && v15)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemSnapshot"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifierPath"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sectionIdentifier"));
    if (v24 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      v28 = objc_msgSend(v24, "isEqual:", v26);

      if ((v28 & 1) == 0)
      {
LABEL_15:
        LOBYTE(v16) = 0;
        goto LABEL_30;
      }
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemSnapshot"));
    v30 = objc_opt_class(MapsUIDiffableDataSourceOutlineNodeSnapshot);
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      v31 = v29;
    else
      v31 = 0;
    v32 = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _shortcutForNodeSnapshot:](self, "_shortcutForNodeSnapshot:", v32));
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      if (v33 && (objc_msgSend(v33, "isSetupPlaceholder") & 1) == 0)
        goto LABEL_28;
    }
    else if (v33)
    {
      v34 = (unint64_t)objc_msgSend(v33, "type");
      if (v34 >= 6)
      {
LABEL_28:
        LOBYTE(v16) = 1;
        goto LABEL_29;
      }
      LODWORD(v16) = (0x13u >> v34) & 1;
LABEL_29:

      goto LABEL_30;
    }
    LOBYTE(v16) = 0;
    goto LABEL_29;
  }
LABEL_30:

  return (char)v16;
}

- (int64_t)_firstValidMoveIndexForFavorites:(id)a3
{
  id v3;
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      v9 = (int64_t)v5 + v6;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "isShortcutForSetup", (_QWORD)v11))
        {
          v9 = (int64_t)v8 + v6;
          goto LABEL_12;
        }
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (void)_performMoveWithDropCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  ShortcutManager *shortcutManager;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dragItem"));

  if (v7)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entries](self, "_entries"));
      v9 = -[HomeOutlineFavoritesSectionController _firstValidMoveIndexForFavorites:](self, "_firstValidMoveIndexForFavorites:", v8);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
      v9 = objc_msgSend(v8, "_maps_firstValidMoveIndex");
    }
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationIndexPath"));
    v12 = objc_msgSend(v11, "item");

    if ((uint64_t)v12 > -[HomeOutlineFavoritesSectionController _headerNodeCount](self, "_headerNodeCount"))
      v12 -= -[HomeOutlineFavoritesSectionController _headerNodeCount](self, "_headerNodeCount");
    if ((uint64_t)v12 > (uint64_t)v10)
      v10 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localObject"));
    v14 = objc_opt_class(HomeDragLocalContext);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemSnapshot"));
    v18 = objc_opt_class(MapsUIDiffableDataSourceOutlineNodeSnapshot);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      v19 = v17;
    else
      v19 = 0;
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _shortcutForNodeSnapshot:](self, "_shortcutForNodeSnapshot:", v20));
    if (v21)
    {
      if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entries](self, "_entries"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100920000;
        v27[3] = &unk_1011B1820;
        v23 = v28;
        v28[0] = v21;
        v28[1] = self;
        objc_msgSend(v28[0], "moveToIndex:with:completion:", v10, v22, v27);

      }
      else
      {
        shortcutManager = self->_shortcutManager;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1009200C8;
        v25[3] = &unk_1011AE8F8;
        v23 = &v26;
        v26 = v21;
        -[ShortcutManager moveShortcut:toIndex:completion:](shortcutManager, "moveShortcut:toIndex:completion:", v26, v10, v25);
      }

      -[HomeOutlineFavoritesSectionController _animateMoveOfShortcut:toIndex:dropCoordinator:](self, "_animateMoveOfShortcut:toIndex:dropCoordinator:", v21, v10, v4);
    }

  }
}

- (void)_animateMoveOfShortcut:(id)a3 toIndex:(unint64_t)a4 dropCoordinator:(id)a5
{
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  objc_class *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;

  v31 = a3;
  v8 = a5;
  v9 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dragItem"));

  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entries](self, "_entries"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10092046C;
    v34[3] = &unk_1011DC1A0;
    v14 = &v35;
    v35 = v31;
    v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v34);
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v13));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v16));
      objc_msgSend(v17, "removeObjectAtIndex:", v16);
      objc_msgSend(v17, "insertObject:atIndex:", v18, a4);
      v19 = (objc_class *)objc_msgSend(v17, "copy");
      v20 = 160;
LABEL_6:
      v23 = *(Class *)((char *)&self->super.super.isa + v20);
      *(Class *)((char *)&self->super.super.isa + v20) = v19;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
      objc_msgSend(v24, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
      objc_msgSend(v25, "applySnapshotIfNeededWithSectionController:", self);

      v26 = *(Class *)((char *)&self->super.super.isa + v20);
      *(Class *)((char *)&self->super.super.isa + v20) = 0;

      v27 = (char *)-[HomeOutlineFavoritesSectionController _headerNodeCount](self, "_headerNodeCount") + a4;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationIndexPath"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v27, objc_msgSend(v28, "section")));

      v30 = objc_msgSend(v8, "dropItem:toItemAtIndexPath:", v12, v29);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entriesLegacy](self, "_entriesLegacy"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1009204DC;
    v32[3] = &unk_1011DC1C8;
    v14 = &v33;
    v33 = v31;
    v21 = objc_msgSend(v13, "indexOfObjectPassingTest:", v32);
    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v21;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v13));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v22));
      objc_msgSend(v17, "removeObjectAtIndex:", v22);
      objc_msgSend(v17, "insertObject:atIndex:", v18, a4);
      v19 = (objc_class *)objc_msgSend(v17, "copy");
      v20 = 152;
      goto LABEL_6;
    }
  }

}

- (BOOL)_isCopyOperationWithDropSession:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController mapItemForDropSession:](self, "mapItemForDropSession:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v6 = objc_msgSend(v5, "_maps_canAddShortcutForMapItem:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_performCopyWithDropCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController mapItemForDropSession:](self, "mapItemForDropSession:", v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v8 = objc_msgSend(v7, "_maps_canAddShortcutForMapItem:", v6);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithType:mapItem:](ShortcutEditSession, "addSessionWithType:mapItem:", 1, v6));
      if (v9)
      {
        objc_initWeak(&location, self);
        -[NSMutableArray addObject:](self->_dropShortcutEditSessions, "addObject:", v9);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100920730;
        v10[3] = &unk_1011B0E90;
        objc_copyWeak(&v13, &location);
        v11 = v6;
        v12 = v9;
        objc_msgSend(v12, "saveWithCompletion:", v10);

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }

    }
  }

}

- (id)_entriesLegacy
{
  NSArray *entriesForMoveAnimation;
  NSArray *v3;
  void *v5;
  void *v6;

  entriesForMoveAnimation = self->_entriesForMoveAnimation;
  if (entriesForMoveAnimation)
  {
    v3 = entriesForMoveAnimation;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider shortcuts](self->_suggestionsDataProvider, "shortcuts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_shortcutOrderedEntries:", v5));

  }
  return v3;
}

- (id)_entries
{
  NSArray *favoritesForMoveAnimation;

  favoritesForMoveAnimation = self->_favoritesForMoveAnimation;
  if (favoritesForMoveAnimation)
    return favoritesForMoveAnimation;
  else
    return (id)objc_claimAutoreleasedReturnValue(-[MapsFavoritesManager shortcutsForMapsHome](self->_favoritesDataProvider, "shortcutsForMapsHome"));
}

- (int64_t)_headerNodeCount
{
  return 1;
}

- (id)_shortcutForNodeSnapshot:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));

  if (v5)
  {
    v7 = objc_opt_class(TwoLinesMapsFavoriteItemOutlineCellModel);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "item"));
  }
  else
  {
    v11 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
      v12 = v6;
    else
      v12 = 0;
    v9 = v12;

    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entry"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_shortcutForSuggestionsEntry:", v14));

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_deleteSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[6];
  id v18;
  id location;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _shortcutForNodeSnapshot:](self, "_shortcutForNodeSnapshot:", v4));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletionWithSnapshot:](self, "deletionWithSnapshot:", v4));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v8));
      -[NSMutableArray addObject:](self->_deleteShortcutEditSessions, "addObject:", v10);
      objc_initWeak(&location, self);
      v20 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      -[HomeOutlineSectionController beginDeletions:](self, "beginDeletions:", v11);

      if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100920C74;
        v17[3] = &unk_1011AE5B8;
        v12 = v17;
        v13 = &v18;
        objc_copyWeak(&v18, &location);
        v17[4] = v9;
        v17[5] = v10;
        objc_msgSend(v8, "deleteWithCompletionHandler:", v17);
      }
      else
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100920D3C;
        v14[3] = &unk_1011B0E90;
        v12 = v14;
        v13 = &v16;
        objc_copyWeak(&v16, &location);
        v14[4] = v9;
        v15 = v10;
        objc_msgSend(v15, "removeFromShortcutsWithCompletion:", v14);
      }

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);

    }
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionController:nodeSnapshotAtIndexPath:", self, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v11 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v14 = v13;
  if ((isKindOfClass & 1) == 0)
  {
    v20 = objc_opt_class(TwoLinesMapsFavoriteItemOutlineCellModel);
    v21 = objc_opt_isKindOfClass(v14, v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
    v14 = v22;
    if ((v21 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "item"));
      +[HomeAnalyticsManager captureTapActionWithFavorite:](HomeAnalyticsManager, "captureTapActionWithFavorite:", v15);
      if (objc_msgSend(v15, "isShortcutForSetup"))
      {
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
        v17 = (void *)v23;
        if (v15 && v23)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "actionCoordinator"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "homeActionDelegate"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "homeContaineeViewController"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v15));
          objc_msgSend(v32, "viewController:showAddShortcut:", v25, v26);

        }
        goto LABEL_7;
      }
    }
    else
    {
      v27 = objc_opt_class(_TtC4Maps27LibraryLinkOutlineCellModel);
      v28 = objc_opt_isKindOfClass(v14, v27);

      if ((v28 & 1) == 0)
      {
LABEL_16:
        v35.receiver = self;
        v35.super_class = (Class)HomeOutlineFavoritesSectionController;
        -[HomeOutlineSectionController collectionView:didSelectItemAtIndexPath:](&v35, "collectionView:didSelectItemAtIndexPath:", v6, v7);
        goto LABEL_17;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionCoordinator"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "homeActionDelegate"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "homeContaineeViewController"));
      objc_msgSend(v15, "viewControllerShowLibraryRootView:", v31);

    }
LABEL_15:

    goto LABEL_16;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));
  +[HomeAnalyticsManager captureTapActionWithEntry:](HomeAnalyticsManager, "captureTapActionWithEntry:", v15);
  if (!objc_msgSend(v15, "isShortcutForSetup"))
    goto LABEL_15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_shortcutForSuggestionsEntry:", v15));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
  v19 = v18;
  if (v17 && v18)
  {
    objc_msgSend(v18, "bounds");
    -[HomeOutlineFavoritesSectionController _startEditSessionForShortcut:sourceView:sourceRect:](self, "_startEditSessionForShortcut:sourceView:sourceRect:", v17, v19);
  }

LABEL_7:
LABEL_17:

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  id v21;
  char *v22;
  void *v23;

  v7 = a4;
  v8 = a5;
  if (-[HomeOutlineFavoritesSectionController _isMoveOperationWithDropSession:](self, "_isMoveOperationWithDropSession:", v7))
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entries](self, "_entries"));
      v10 = -[HomeOutlineFavoritesSectionController _firstValidMoveIndexForFavorites:](self, "_firstValidMoveIndexForFavorites:", v9);

      v11 = objc_msgSend(v8, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineFavoritesSectionController _entries](self, "_entries"));
      v13 = objc_msgSend(v12, "count");

      if ((uint64_t)v11 > (uint64_t)v13)
      {
        v14 = objc_alloc((Class)UICollectionViewDropProposal);
        v15 = 0;
LABEL_9:
        v20 = 2;
LABEL_13:
        v21 = objc_msgSend(v14, "initWithDropOperation:intent:", v15, v20);
        goto LABEL_14;
      }
      v22 = (char *)objc_msgSend(v8, "item");
      if ((uint64_t)v22 > (uint64_t)((char *)-[HomeOutlineFavoritesSectionController _headerNodeCount](self, "_headerNodeCount")+ v10))
      {
LABEL_12:
        v14 = objc_alloc((Class)UICollectionViewDropProposal);
        v15 = 3;
        v20 = 1;
        goto LABEL_13;
      }
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider meCard](self->_meCardDataProvider, "meCard"));
      v18 = (char *)objc_msgSend(v17, "_maps_firstValidMoveIndex");

      v19 = (char *)objc_msgSend(v8, "item");
      if ((uint64_t)v19 >= (uint64_t)&v18[-[HomeOutlineFavoritesSectionController _headerNodeCount](self, "_headerNodeCount")])goto LABEL_12;
    }
    v14 = objc_alloc((Class)UICollectionViewDropProposal);
    v15 = 3;
    goto LABEL_9;
  }
  v16 = -[HomeOutlineFavoritesSectionController _isCopyOperationWithDropSession:](self, "_isCopyOperationWithDropSession:", v7);
  v14 = objc_alloc((Class)UICollectionViewDropProposal);
  if (v16)
  {
    v15 = 2;
    goto LABEL_9;
  }
  v21 = objc_msgSend(v14, "initWithDropOperation:", 0);
LABEL_14:
  v23 = v21;

  return v23;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
  v6 = -[HomeOutlineFavoritesSectionController _isMoveOperationWithDropSession:](self, "_isMoveOperationWithDropSession:", v5);

  if (v6)
  {
    -[HomeOutlineFavoritesSectionController _performMoveWithDropCoordinator:](self, "_performMoveWithDropCoordinator:", v9);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
    v8 = -[HomeOutlineFavoritesSectionController _isCopyOperationWithDropSession:](self, "_isCopyOperationWithDropSession:", v7);

    if (v8)
      -[HomeOutlineFavoritesSectionController _performCopyWithDropCoordinator:](self, "_performCopyWithDropCoordinator:", v9);
  }

}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesForMoveAnimation, 0);
  objc_storeStrong((id *)&self->_entriesForMoveAnimation, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_deleteShortcutEditSessions, 0);
  objc_storeStrong((id *)&self->_dropShortcutEditSessions, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_meCardDataProvider, 0);
  objc_storeStrong((id *)&self->_libraryCountsDataProvider, 0);
  objc_storeStrong((id *)&self->_favoritesDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
}

@end
