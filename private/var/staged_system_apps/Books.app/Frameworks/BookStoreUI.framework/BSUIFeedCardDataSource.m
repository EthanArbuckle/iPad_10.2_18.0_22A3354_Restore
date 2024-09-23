@implementation BSUIFeedCardDataSource

- (BSUIFeedCardDataSource)initWithFeedArray:(id)a3 syncLayoutController:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  BSUIFeedCardDataSource *v11;
  NSArray *v12;
  NSArray *cardArray;
  NSDictionary *v14;
  NSDictionary *options;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BSUIFeedCardDataSource;
  v11 = -[BSUIFeedCardDataSource init](&v17, "init");
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    cardArray = v11->_cardArray;
    v11->_cardArray = v12;

    objc_storeStrong((id *)&v11->_syncLayoutController, a4);
    v14 = (NSDictionary *)objc_msgSend(v10, "copy");
    options = v11->_options;
    v11->_options = v14;

  }
  return v11;
}

- (void)appendNewDataToExistingDataSource:(id)a3 cardStackViewController:(id)a4
{
  NSArray *v5;
  NSArray *cardArray;

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](self->_cardArray, "arrayByAddingObjectsFromArray:", a3, a4));
  cardArray = self->_cardArray;
  self->_cardArray = v5;

}

- (int64_t)numberOfCards:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedCardDataSource cardArray](self, "cardArray", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (NSString)identifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedCardDataSource options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCCardStackIdentifierKey));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (int64_t)cardIndexForFeedOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url")));
    v7 = -[BSUIFeedCardDataSource _cardIndexForTarget:withKeyPath:](self, "_cardIndexForTarget:withKeyPath:", v6, CFSTR("url"));

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storeId")));
      v7 = -[BSUIFeedCardDataSource _cardIndexForTarget:withKeyPath:](self, "_cardIndexForTarget:withKeyPath:", v8, CFSTR("storeId"));

      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storeId")));
        v7 = -[BSUIFeedCardDataSource _cardIndexForTarget:withKeyPath:](self, "_cardIndexForTarget:withKeyPath:", v9, CFSTR("resource.@unionOfObjects.id"));

        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = objc_opt_class(NSDictionary, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resource")));
          v13 = BUDynamicCast(v11, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("id")));
          v7 = -[BSUIFeedCardDataSource _cardIndexForTarget:withKeyPath:](self, "_cardIndexForTarget:withKeyPath:", v15, CFSTR("resource.@unionOfObjects.id"));

        }
      }
    }
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)alwaysPresentNewCardSetForFeedOptions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = objc_opt_class(NSNumber, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("alwaysPresentNewCardSet")));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  LOBYTE(v3) = objc_msgSend(v8, "BOOLValue");

  return (char)v3;
}

- (id)representedObjectForCardAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedCardDataSource cardArray](self, "cardArray"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (id)contentViewControllerForCardAtIndex:(int64_t)a3 cardContentScrollManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BSUIFeedViewController *v12;
  void *v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedCardDataSource cardArray](self, "cardArray"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isInCard")));
  if (!v9)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isInCard"));
    v11 = objc_msgSend(v10, "copy");

    v8 = v11;
  }
  v12 = -[BSUIFeedViewController initWithOptions:]([BSUIFeedViewController alloc], "initWithOptions:", v8);
  -[BSUIFeedViewController configureWithSyncLayoutController:](v12, "configureWithSyncLayoutController:", self->_syncLayoutController);
  -[BSUIFeedViewController setCardContentScrollManager:](v12, "setCardContentScrollManager:", v6);

  -[BSUIFeedViewController setOptions:](v12, "setOptions:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController suspendUpdatesUntilContentExceedsHeightWithCompletion:](v12, "suspendUpdatesUntilContentExceedsHeightWithCompletion:", 0));
  -[BSUIFeedViewController setAssertionForSuspendingLayoutUpdates:](v12, "setAssertionForSuspendingLayoutUpdates:", v13);

  return v12;
}

- (Class)cardNavigationControllerClass:(id)a3
{
  return (Class)objc_opt_class(BSUICardNavigationController, a2);
}

- (int64_t)_cardIndexForTarget:(id)a3 withKeyPath:(id)a4
{
  NSArray *cardArray;
  id v6;
  void *v7;
  id v8;

  cardArray = self->_cardArray;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray valueForKeyPath:](cardArray, "valueForKeyPath:", a4));
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  return (int64_t)v8;
}

- (NSArray)cardArray
{
  return self->_cardArray;
}

- (void)setCardArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUISyncLayoutController)syncLayoutController
{
  return self->_syncLayoutController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncLayoutController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_cardArray, 0);
}

@end
