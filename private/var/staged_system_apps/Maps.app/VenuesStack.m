@implementation VenuesStack

- (VenuesStack)initWithCardDealer:(id)a3
{
  id v5;
  VenuesStack *v6;
  VenuesStack *v7;
  NSArray *cardStack;
  uint64_t v9;
  NSMapTable *cardToPreviousStateMapping;
  uint64_t v11;
  NSHashTable *stackObservers;
  VenueMapSearchState *stateFromBeforeTheStack;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VenuesStack;
  v6 = -[VenuesStack init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    cardStack = v6->_cardStack;
    v6->_cardStack = (NSArray *)&__NSArray0__struct;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    cardToPreviousStateMapping = v7->_cardToPreviousStateMapping;
    v7->_cardToPreviousStateMapping = (NSMapTable *)v9;

    objc_storeStrong((id *)&v7->_dealer, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    stackObservers = v7->_stackObservers;
    v7->_stackObservers = (NSHashTable *)v11;

    stateFromBeforeTheStack = v7->_stateFromBeforeTheStack;
    v7->_stateFromBeforeTheStack = 0;

    objc_storeWeak((id *)&v7->_dataSource, 0);
  }

  return v7;
}

- (VenuesStack)init
{

  return 0;
}

- (NSArray)allItems
{
  return self->_cardStack;
}

- (unint64_t)pushVenueCardItem:(id)a3 withSource:(unint64_t)a4
{
  id v6;
  unint64_t v7;

  v6 = a3;
  v7 = -[VenuesStack pushVenueCardItem:withSource:savePlaceCardSelectionState:](self, "pushVenueCardItem:withSource:savePlaceCardSelectionState:", v6, a4, objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem));

  return v7;
}

- (unint64_t)pushVenueCardItem:(id)a3 withSource:(unint64_t)a4 savePlaceCardSelectionState:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSArray *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  NSArray *v23;
  NSArray *cardStack;
  void *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v5 = a5;
  v8 = a3;
  v9 = -[VenueCardDealer newHandFromExistingHand:nextTopCard:source:](self->_dealer, "newHandFromExistingHand:nextTopCard:source:", self->_cardStack, v8, a4);
  if (v9 == self->_cardStack)
  {
    v13 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardDealer existingCardForHand:cardItem:](self->_dealer, "existingCardForHand:cardItem:", v9, v8));
    if (v10)
    {
      v11 = -[NSArray indexOfObject:](v9, "indexOfObject:", v10);
      if (v11)
        v12 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v11 - 1));
      else
        v12 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesStack dataSource](self, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateForNewCardItem:previousItemInStack:savePlaceCardSelectionState:", v10, v12, v5));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_cardStack, "lastObject"));
      v28 = (void *)v12;
      if (-[NSArray containsObject:](v9, "containsObject:", v16))
      {
        -[NSMapTable setObject:forKey:](self->_cardToPreviousStateMapping, "setObject:forKey:", v15, v16);
      }
      else if (!-[NSArray count](self->_cardStack, "count"))
      {
        objc_storeStrong((id *)&self->_stateFromBeforeTheStack, v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_cardStack, v15));
      objc_msgSend(v17, "removeObjectsInArray:", v9);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            -[NSMapTable removeObjectForKey:](self->_cardToPreviousStateMapping, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v20);
      }

      v23 = (NSArray *)-[NSArray copy](v9, "copy");
      cardStack = self->_cardStack;
      self->_cardStack = v23;

      if (objc_msgSend(v18, "count")
        && (v25 = (void *)objc_claimAutoreleasedReturnValue(-[VenuesStack delegate](self, "delegate")),
            objc_msgSend(v25, "venuesStack:reorderedStackAndRemovedCardItems:", self, v18),
            v25,
            a4 == 1))
      {
        v13 = 3;
      }
      else
      {
        -[VenuesStack _notifyObserversStackDidChange](self, "_notifyObserversStackDidChange");
        v13 = 2;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)popVenueCard:(id)a3
{
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  VenueMapSearchState *v8;
  VenueMapSearchState *stateFromBeforeTheStack;
  NSArray *v10;
  NSArray *cardStack;
  void (**v12)(id, void *, void *, VenueMapSearchState *);

  v12 = (void (**)(id, void *, void *, VenueMapSearchState *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_cardStack, "lastObject"));
  if (v4)
  {
    v5 = -[NSArray count](self->_cardStack, "count");
    v6 = v5 - 1;
    if (v5 == 1)
    {
      v8 = self->_stateFromBeforeTheStack;
      stateFromBeforeTheStack = self->_stateFromBeforeTheStack;
      self->_stateFromBeforeTheStack = 0;

      v7 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_cardStack, "objectAtIndexedSubscript:", v5 - 2));
      v8 = (VenueMapSearchState *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cardToPreviousStateMapping, "objectForKey:", v7));
      -[NSMapTable removeObjectForKey:](self->_cardToPreviousStateMapping, "removeObjectForKey:", v7);
    }
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_cardStack, "subarrayWithRange:", 0, v6));
    cardStack = self->_cardStack;
    self->_cardStack = v10;

    -[VenuesStack _notifyObserversStackDidChange](self, "_notifyObserversStackDidChange");
    if (v12)
      v12[2](v12, v4, v7, v8);

  }
  else if (v12)
  {
    v12[2](v12, 0, 0, 0);
  }

}

- (void)clearStack
{
  NSArray *cardStack;

  -[NSMapTable removeAllObjects](self->_cardToPreviousStateMapping, "removeAllObjects");
  cardStack = self->_cardStack;
  self->_cardStack = (NSArray *)&__NSArray0__struct;

  -[VenuesStack _notifyObserversStackDidChange](self, "_notifyObserversStackDidChange");
}

- (void)addStackObserver:(id)a3
{
  -[NSHashTable addObject:](self->_stackObservers, "addObject:", a3);
}

- (void)removeStackObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_stackObservers, "removeObject:", a3);
}

- (BOOL)canPushVenueCardItem:(id)a3
{
  return objc_msgSend(a3, "isVenueItem");
}

- (unint64_t)venueIdForCurrentCardStack
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_cardStack, "firstObject"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "venueID");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (id)lastCardConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "cards:lastCardConformingToProtocol:", self->_cardStack, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

+ (id)cards:(id)a3 lastCardConformingToProtocol:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100989DB8;
  v9[3] = &unk_1011DD4E0;
  v10 = a4;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cardsFromArray:passingTest:ascending:", a3, v9, 0));

  return v7;
}

+ (id)cardsFromArray:(id)a3 passingTest:(id)a4 ascending:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100989ED0;
  v20 = sub_100989EE0;
  v21 = 0;
  if (v5)
    v9 = 0;
  else
    v9 = 2;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100989EE8;
  v13[3] = &unk_1011DD508;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", v9, v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)_notifyObserversStackDidChange
{
  NSHashTable *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_stackObservers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "cardStack:didChangeStack:", self, self->_cardStack, (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (VenuesStackDataSource)dataSource
{
  return (VenuesStackDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (VenuesStackDelegate)delegate
{
  return (VenuesStackDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stateFromBeforeTheStack, 0);
  objc_storeStrong((id *)&self->_stackObservers, 0);
  objc_storeStrong((id *)&self->_dealer, 0);
  objc_storeStrong((id *)&self->_cardToPreviousStateMapping, 0);
  objc_storeStrong((id *)&self->_cardStack, 0);
}

@end
