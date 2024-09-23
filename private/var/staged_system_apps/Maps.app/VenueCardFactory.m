@implementation VenueCardFactory

- (VenueCardFactory)initWithChangeNotifier:(id)a3
{
  id v4;
  VenueCardFactory *v5;
  VenueCardFactory *v6;
  uint64_t v7;
  NSMapTable *cardItemToViewControllerMapping;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VenueCardFactory;
  v5 = -[VenueCardFactory init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_changeNotifier, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    cardItemToViewControllerMapping = v6->_cardItemToViewControllerMapping;
    v6->_cardItemToViewControllerMapping = (NSMapTable *)v7;

  }
  return v6;
}

- (VenueCardFactory)init
{

  return 0;
}

- (id)viewControllerForCardItem:(id)a3
{
  id v4;
  PlaceCardViewController *v5;
  PlaceCardViewController *v6;
  id v7;
  VenueCategoryViewController *v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isVenueItem"))
  {
    v5 = (PlaceCardViewController *)objc_claimAutoreleasedReturnValue(-[VenueCardFactory existingViewControllerForCardItem:](self, "existingViewControllerForCardItem:", v4));
    if (v5)
    {
LABEL_18:
      v6 = v5;

      goto LABEL_19;
    }
    if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem))
    {
      v5 = objc_alloc_init(PlaceCardViewController);
LABEL_17:
      -[NSMapTable setObject:forKey:](self->_cardItemToViewControllerMapping, "setObject:forKey:", v5, v4);
      goto LABEL_18;
    }
    if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem))
    {
      v7 = v4;
      v8 = -[VenueCategoryViewController initWithCategoryCardItem:]([VenueCategoryViewController alloc], "initWithCategoryCardItem:", v7);
    }
    else if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem))
    {
      v7 = v4;
      v8 = -[VenueCategoryViewController initWithAutoCompleteCategoryCardItem:]([VenueCategoryViewController alloc], "initWithAutoCompleteCategoryCardItem:", v7);
    }
    else
    {
      if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___VenueClusterCardItem))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueLabelMarker"));
        v10 = objc_msgSend(v9, "isCluster");

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardFactory delegate](self, "delegate"));
          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shareDelegateForCardFactory:", self));

          v5 = -[SimpleResultsViewController initWithShareDelegate:]([SimpleResultsViewController alloc], "initWithShareDelegate:", v7);
          -[PlaceCardViewController setIsPresentingVenueClusterResults:](v5, "setIsPresentingVenueClusterResults:", 1);
LABEL_16:

          goto LABEL_17;
        }
      }
      if (!objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___VenueRoutePlanningCardItem))
      {
        v5 = 0;
        goto LABEL_17;
      }
      v7 = (id)objc_claimAutoreleasedReturnValue(-[VenueCardFactory delegate](self, "delegate"));
      v8 = (VenueCategoryViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routePlanningOverviewViewControllerForCardFactory:", self));
    }
    v5 = (PlaceCardViewController *)v8;
    goto LABEL_16;
  }
  v6 = 0;
LABEL_19:

  return v6;
}

- (id)existingViewControllerForCardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cardItemToViewControllerMapping, "objectForKey:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___VenueRoutePlanningCardItem))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardFactory delegate](self, "delegate"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routePlanningOverviewViewControllerForCardFactory:", self));
LABEL_21:
    v7 = (id)v9;

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_cardItemToViewControllerMapping, "keyEnumerator", 0));
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v8);
          v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v15 = v4;
          v16 = v15;
          if (v14 == v15)
          {

            v14 = v16;
LABEL_20:
            v9 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cardItemToViewControllerMapping, "objectForKey:", v14));
            goto LABEL_21;
          }
          v17 = objc_opt_class(v15);
          if ((objc_opt_isKindOfClass(v14, v17) & 1) != 0
            && (v18 = objc_msgSend(v14, "venueCardID"), v18 == objc_msgSend(v16, "venueCardID")))
          {
            v19 = objc_msgSend(v14, "venueCardID");

            if (v19)
              goto LABEL_20;
          }
          else
          {

          }
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    v7 = 0;
  }

  return v7;
}

- (void)cardStack:(id)a3 didChangeStack:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_cardItemToViewControllerMapping, "keyEnumerator"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[NSMapTable removeObjectForKey:](self->_cardItemToViewControllerMapping, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (VenueCardFactoryDelegate)delegate
{
  return (VenueCardFactoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardItemToViewControllerMapping, 0);
  objc_destroyWeak((id *)&self->_changeNotifier);
}

@end
