@implementation VenueCardCoordinator

- (VenueCardCoordinator)initWithActionCoordinator:(id)a3 venueChangeNotifier:(id)a4
{
  id v6;
  id v7;
  VenueCardCoordinator *v8;
  VenueCardCoordinator *v9;
  VenueCardDealer *v10;
  VenuesStack *v11;
  VenuesStack *cardStack;
  VenueCardFactory *v13;
  VenueCardFactory *cardFactory;
  VenuesStack *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VenueCardCoordinator;
  v8 = -[VenueCardCoordinator init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_actionCoordinator, v6);
    v10 = objc_alloc_init(VenueCardDealer);
    v11 = -[VenuesStack initWithCardDealer:]([VenuesStack alloc], "initWithCardDealer:", v10);
    cardStack = v9->_cardStack;
    v9->_cardStack = v11;

    -[VenuesStack setDelegate:](v9->_cardStack, "setDelegate:", v9);
    -[VenuesStack setDataSource:](v9->_cardStack, "setDataSource:", v9);
    v13 = -[VenueCardFactory initWithChangeNotifier:]([VenueCardFactory alloc], "initWithChangeNotifier:", v7);
    cardFactory = v9->_cardFactory;
    v9->_cardFactory = v13;

    -[VenueCardFactory setDelegate:](v9->_cardFactory, "setDelegate:", v9);
    -[VenuesStack addStackObserver:](v9->_cardStack, "addStackObserver:", v9->_cardFactory);
    v15 = v9->_cardStack;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
    objc_msgSend(v16, "setVenueCardStack:", v15);

  }
  return v9;
}

+ (id)searchResultForPlaceCardItem:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  SearchResult *v7;
  void *v8;
  SearchResult *v9;

  v3 = a3;
  v4 = objc_opt_class(PlaceCardItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

    if (v6)
    {
      v7 = [SearchResult alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
      v9 = -[SearchResult initWithMapItem:](v7, "initWithMapItem:", v8);

    }
    else
    {
      v9 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isCardStackEmpty
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesStack allItems](self->_cardStack, "allItems"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (unint64_t)pushVenueCardItem:(id)a3 source:(unint64_t)a4
{
  return -[VenuesStack pushVenueCardItem:withSource:](self->_cardStack, "pushVenueCardItem:withSource:", a3, a4);
}

- (unint64_t)pushVenueCardItem:(id)a3 source:(unint64_t)a4 savePlaceCardSelectionState:(BOOL)a5
{
  return -[VenuesStack pushVenueCardItem:withSource:savePlaceCardSelectionState:](self->_cardStack, "pushVenueCardItem:withSource:savePlaceCardSelectionState:", a3, a4, a5);
}

- (void)popVenueCardItem:(id)a3
{
  id v4;
  VenuesStack *cardStack;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  cardStack = self->_cardStack;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004AEE78;
  v7[3] = &unk_1011B88E0;
  v8 = v4;
  v6 = v4;
  -[VenuesStack popVenueCard:](cardStack, "popVenueCard:", v7);

}

- (void)removeAllCards
{
  -[VenuesStack clearStack](self->_cardStack, "clearStack");
}

- (id)viewControllerForCardItem:(id)a3
{
  return -[VenueCardFactory viewControllerForCardItem:](self->_cardFactory, "viewControllerForCardItem:", a3);
}

- (ContaineeProtocol)topViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesStack allItems](self->_cardStack, "allItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardFactory existingViewControllerForCardItem:](self->_cardFactory, "existingViewControllerForCardItem:", v4));
  else
    v5 = 0;

  return (ContaineeProtocol *)v5;
}

- (unint64_t)venueIdForCurrentCardStack
{
  return -[VenuesStack venueIdForCurrentCardStack](self->_cardStack, "venueIdForCurrentCardStack");
}

- (BOOL)venuesStackContainsCategoryListCard
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesStack lastCardConformingToProtocol:](self->_cardStack, "lastCardConformingToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem));

  if (v3)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesStack lastCardConformingToProtocol:](self->_cardStack, "lastCardConformingToProtocol:", &OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem));
  v4 = v5 != 0;

  return v4;
}

- (VenueCardCoordinatorDataSource)dataSource
{
  return (VenueCardCoordinatorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cardStack, 0);
  objc_storeStrong((id *)&self->_cardFactory, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
}

- (void)venuesStack:(id)a3 reorderedStackAndRemovedCardItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VenuesStack cards:lastCardConformingToProtocol:](VenuesStack, "cards:lastCardConformingToProtocol:", v8, &OBJC_PROTOCOL___VenueCategoryCardItem));
  if (v9)
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[VenuesStack cards:lastCardConformingToProtocol:](VenuesStack, "cards:lastCardConformingToProtocol:", v10, &OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem));

    if (!v11)
      goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allItems"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[VenueCardCoordinator searchResultForPlaceCardItem:](VenueCardCoordinator, "searchResultForPlaceCardItem:", v13));
  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "searchPinsManager"));
    v33 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    objc_msgSend(v16, "setSearchPins:selectedPin:animated:", v17, v14, 1);

  }
LABEL_7:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardFactory existingViewControllerForCardItem:](self->_cardFactory, "existingViewControllerForCardItem:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v22), (_QWORD)v28));
        v24 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentViewController"));

        if (v23 != v25)
        {
          v26 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "containerViewController"));
          objc_msgSend(v27, "removeControllerFromStack:", v23);

        }
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v20);
  }

}

- (id)stateForNewCardItem:(id)a3 previousItemInStack:(id)a4 savePlaceCardSelectionState:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardCoordinator dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapSelectionStateForVenueCardItem:savePlaceCardSelectionState:", v9, v5));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardCoordinator dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchFieldItemForVenueCardItem:previousItemInStack:", v9, v8));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardCoordinator dataSource](self, "dataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchInfoForVenueCardItem:previousItemInStack:", v9, v8));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[VenueMapSearchState stateWithMapSelectionState:searchFieldItem:searchInfo:](VenueMapSearchState, "stateWithMapSelectionState:searchFieldItem:searchInfo:", v11, v13, v15));
  return v16;
}

- (id)shareDelegateForCardFactory:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appCoordinator"));

  return v4;
}

- (id)routePlanningOverviewViewControllerForCardFactory:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "routePlanningOverviewViewController"));

  return v4;
}

@end
