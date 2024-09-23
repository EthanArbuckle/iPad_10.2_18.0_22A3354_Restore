@implementation MeCardDataProvider

- (MeCardDataProvider)init
{
  MeCardDataProvider *v2;
  uint64_t v3;
  ShortcutManager *shortcutManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MeCardDataProvider;
  v2 = -[MeCardDataProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    shortcutManager = v2->_shortcutManager;
    v2->_shortcutManager = (ShortcutManager *)v3;

  }
  return v2;
}

- (void)setActive:(BOOL)a3
{
  ShortcutManager *shortcutManager;

  if (self->_active != a3)
  {
    self->_active = a3;
    shortcutManager = self->_shortcutManager;
    if (a3)
    {
      -[ShortcutManager addObserver:](shortcutManager, "addObserver:", self);
      -[MeCardDataProvider _updateMeCardAndNotifyObservers:](self, "_updateMeCardAndNotifyObservers:", 0);
    }
    else
    {
      -[ShortcutManager removeObserver:](shortcutManager, "removeObserver:", self);
    }
  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateMeCardAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  MapsSuggestionsMeCard *v6;
  MapsSuggestionsMeCard *v7;
  int v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  unsigned int v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  if (self->_active)
  {
    v3 = a3;
    v6 = (MapsSuggestionsMeCard *)objc_claimAutoreleasedReturnValue(-[ShortcutManager meCard](self->_shortcutManager, "meCard"));
    v7 = v6;
    if (v6 && !self->_hasInitialData)
    {
      v8 = 1;
      self->_hasInitialData = 1;
    }
    else
    {
      v8 = 0;
    }
    if (v6 == self->_meCard)
      v9 = 0;
    else
      v9 = -[MapsSuggestionsMeCard isEqual:](v6, "isEqual:") ^ 1;
    v10 = sub_100432EDC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsMeCard shortcutsForAll](v7, "shortcutsForAll"));
      v23 = v3;
      v17 = objc_msgSend(v22, "count");
      v18 = sub_10039E4FC(v8);
      v24 = v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = sub_10039E4FC(v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138413314;
      v26 = v14;
      v27 = 2112;
      v28 = v16;
      v29 = 1024;
      v30 = v17;
      v3 = v23;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@, # favorites = %d, hasInitialDataChanged = %@, meCardChanged = %@", buf, 0x30u);

      v8 = v24;
    }

    if ((v8 | v9) == 1)
    {
      objc_storeStrong((id *)&self->_meCard, v7);
      if (v3)
        -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
    }

  }
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
  -[MeCardDataProvider _updateMeCardAndNotifyObservers:](self, "_updateMeCardAndNotifyObservers:", 1);
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (MapsSuggestionsMeCard)meCard
{
  return self->_meCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
