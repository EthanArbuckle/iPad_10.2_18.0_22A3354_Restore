@implementation ShortcutManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A16A50;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D3C90 != -1)
    dispatch_once(&qword_1014D3C90, block);
  return (id)qword_1014D3C88;
}

- (void)_loadMapsSuggestionsEngineIfNecessary
{
  id v3;
  MapsSuggestionsEngine *v4;
  MapsSuggestionsEngine *engine;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_engine)
  {
    objc_initWeak(&location, self);
    v3 = sub_100B3A5D4();
    v4 = (MapsSuggestionsEngine *)objc_claimAutoreleasedReturnValue(v3);
    engine = self->_engine;
    self->_engine = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEngine oneFavorites](self->_engine, "oneFavorites"));
    objc_msgSend(v6, "registerMeCardObserver:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEngine oneFavorites](self->_engine, "oneFavorites"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A16B70;
    v8[3] = &unk_1011AFE50;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "readMeCardWithHandler:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_touchMapsSuggestionsEngine
{
  -[MapsSuggestionsEngine hintRefreshOfType:](self->_engine, "hintRefreshOfType:", 18);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutManager _observers](self, "_observers"));
  objc_msgSend(v5, "registerObserver:", v4);

  -[ShortcutManager _loadMapsSuggestionsEngineIfNecessary](self, "_loadMapsSuggestionsEngineIfNecessary");
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutManager _observers](self, "_observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (id)_observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___ShortcutManagerObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateMeCard:(id)a3
{
  MapsSuggestionsMeCard *v5;
  unsigned __int8 v6;
  MapsSuggestionsMeCard *v7;

  v7 = (MapsSuggestionsMeCard *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = v7;
  if (self->_meCard != v7)
  {
    v6 = -[MapsSuggestionsMeCard isEqual:](v7, "isEqual:");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_meCard, a3);
      -[GEOObserverHashTable shortcutManagerMeCardDidChange:](self->_observers, "shortcutManagerMeCardDidChange:", self);
      v5 = v7;
    }
  }

}

- (void)prefetchMeCard
{
  -[ShortcutManager _loadMapsSuggestionsEngineIfNecessary](self, "_loadMapsSuggestionsEngineIfNecessary");
}

- (NSString)uniqueName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A16E74;
  v5[3] = &unk_1011AC8B0;
  v5[4] = self;
  v6 = objc_msgSend(a4, "copy", a3);
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)moveShortcut:(id)a3 toIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_engine && self->_meCard)
  {
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEngine oneFavorites](self->_engine, "oneFavorites"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAll](self->_meCard, "shortcutsForAll"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A16FCC;
    v13[3] = &unk_1011DFBB8;
    v14 = v10;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v11, "moveShortcut:toIndex:withSnapshot:handler:", v8, a4, v12, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (MapsSuggestionsMeCard)meCard
{
  return self->_meCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
