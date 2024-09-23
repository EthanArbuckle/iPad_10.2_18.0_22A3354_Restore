@implementation MapsPinsController

+ (id)sharedController
{
  if (qword_1014D3248 != -1)
    dispatch_once(&qword_1014D3248, &stru_1011C64D8);
  return (id)qword_1014D3240;
}

- (MapsPinsController)init
{
  MapsPinsController *v2;
  void *v3;
  uint64_t v4;
  NSArray *storeSubscriptionTypes;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v8.receiver = self;
  v8.super_class = (Class)MapsPinsController;
  v2 = -[MapsPinsController init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
    objc_msgSend(v3, "addObserver:", v2);

    v9 = objc_opt_class(MSHistoryMarkedLocation);
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v6, "subscribe:", v2);

    -[MapsPinsController _updatePinsWithCompletion:](v2, "_updatePinsWithCompletion:", 0);
  }
  return v2;
}

- (MSPDroppedPin)droppedPin
{
  MSHistoryMarkedLocation *pin;

  pin = self->_pin;
  if (pin)
    pin = (MSHistoryMarkedLocation *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation droppedPin](pin, "droppedPin"));
  return pin;
}

- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7
{
  id v9;

  v9 = a4;
  if ((objc_msgSend(a7, "isEqual:", CFSTR("com.apple.Maps.MapsPinsController")) & 1) == 0)
    -[MapsPinsController _handleNewOrModifiedCustomSearchResult:](self, "_handleNewOrModifiedCustomSearchResult:", v9);

}

- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5
{
  if (a5)
    -[MapsPinsController _handleNewOrModifiedCustomSearchResult:](self, "_handleNewOrModifiedCustomSearchResult:", a4);
}

- (void)_handleNewOrModifiedCustomSearchResult:(id)a3
{
  id v4;
  MSHistoryMarkedLocation *pin;
  MSHistoryMarkedLocation *v6;
  void *v7;
  void *v8;
  MSHistoryMarkedLocation *v9;
  MSHistoryMarkedLocation *v10;
  MSHistoryMarkedLocation *v11;
  void *v12;
  MSHistoryMarkedLocation *v13;
  MSHistoryMarkedLocation *v14;

  v4 = a3;
  pin = self->_pin;
  if (!v4 && pin)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v14 = self->_pin;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v7, "deleteWithObjects:completionHandler:", v8, &stru_1011C64F8);

    v9 = self->_pin;
    self->_pin = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (!-[MSHistoryMarkedLocation isEqualToSearchResult:](pin, "isEqualToSearchResult:", v4))
  {
    v6 = self->_pin;
    if (v6)
    {
      -[MSHistoryMarkedLocation updateWithSearchResult:](v6, "updateWithSearchResult:", v4);
    }
    else
    {
      v10 = (MSHistoryMarkedLocation *)objc_msgSend(objc_alloc((Class)MSHistoryMarkedLocation), "initWithSearchResult:", v4);
      v11 = self->_pin;
      self->_pin = v10;

    }
    v9 = (MSHistoryMarkedLocation *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v13 = self->_pin;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    -[MSHistoryMarkedLocation saveWithObjects:completionHandler:](v9, "saveWithObjects:completionHandler:", v12, &stru_1011C6518);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_notifySearchManager
{
  SearchResult *v3;
  void *v4;
  void *v5;
  SearchResult *v6;

  v3 = [SearchResult alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPinsController droppedPin](self, "droppedPin"));
  v6 = -[SearchResult initWithDroppedPin:](v3, "initWithDroppedPin:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
  objc_msgSend(v5, "setCustomSearchResult:animated:shouldSelectOnMap:context:", v6, 0, 0, CFSTR("com.apple.Maps.MapsPinsController"));

}

- (void)_updatePinsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
  v6 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync13MapsSyncRange), "initWithOffset:limit:", 0, 1);
  v7 = objc_msgSend(v5, "initWithPredicate:sortDescriptors:range:", 0, 0, v6);

  v8 = objc_alloc_init((Class)MSHistoryMarkedLocationRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100786130;
  v10[3] = &unk_1011ADA50;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "fetchWithOptions:completionHandler:", v7, v10);

}

- (void)storeDidChangeWithTypes:(id)a3
{
  -[MapsPinsController _updatePinsWithCompletion:](self, "_updatePinsWithCompletion:", 0);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_pin, 0);
}

@end
