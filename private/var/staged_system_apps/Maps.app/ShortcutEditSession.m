@implementation ShortcutEditSession

+ (id)addSession
{
  ShortcutEditSession *v2;
  _TtC4Maps16MapsFavoriteItem *v3;

  v2 = objc_alloc_init(ShortcutEditSession);
  -[ShortcutEditSession setAlreadySaved:](v2, "setAlreadySaved:", 0);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = objc_alloc_init(_TtC4Maps16MapsFavoriteItem);
    -[MapsFavoriteItem setType:](v3, "setType:", 1);
    -[ShortcutEditSession setMoveToPreferredIndexInFavorites:](v2, "setMoveToPreferredIndexInFavorites:", 1);
  }
  else
  {
    v3 = (_TtC4Maps16MapsFavoriteItem *)objc_msgSend(objc_alloc((Class)MapsSuggestionsShortcut), "initSetupPlaceholderOfType:", 1);
  }
  -[ShortcutEditSession setOriginalShortcut:](v2, "setOriginalShortcut:", v3);

  return v2;
}

+ (id)addSessionWithType:(int64_t)a3 mapItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC4Maps16MapsFavoriteItem *v13;
  void *v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v7));
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v9 = objc_alloc_init((Class)MSFavoriteItem);
      objc_msgSend(v9, "setMapItemStorage:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItemStorageForPersistence"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userValues"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      objc_msgSend(v9, "setCustomName:", v12);

      v13 = -[MapsFavoriteItem initWithFavoriteItem:]([_TtC4Maps16MapsFavoriteItem alloc], "initWithFavoriteItem:", v9);
      -[MapsFavoriteItem setType:](v13, "setType:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "addSessionWithShortcut:", v13));

    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)MapsSuggestionsShortcut), "initWithType:geoMapItem:customName:", a3, v8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "addSessionWithShortcut:", v9));
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (ShortcutEditSession)editSessionWithSuggestion:(id)a3
{
  id v3;
  ShortcutEditSession *v4;

  v3 = a3;
  v4 = objc_alloc_init(ShortcutEditSession);
  -[ShortcutEditSession setAlreadySaved:](v4, "setAlreadySaved:", 0);
  -[ShortcutEditSession setOriginalSuggestionsEntry:](v4, "setOriginalSuggestionsEntry:", v3);

  return v4;
}

+ (id)addSessionWithShortcut:(id)a3
{
  id v3;
  ShortcutEditSession *v4;

  v3 = a3;
  v4 = objc_alloc_init(ShortcutEditSession);
  -[ShortcutEditSession setAlreadySaved:](v4, "setAlreadySaved:", 0);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    -[ShortcutEditSession setMoveToPreferredIndexInFavorites:](v4, "setMoveToPreferredIndexInFavorites:", 1);
  -[ShortcutEditSession setOriginalShortcut:](v4, "setOriginalShortcut:", v3);

  return v4;
}

+ (ShortcutEditSession)editSessionWithShortcut:(id)a3
{
  id v3;
  ShortcutEditSession *v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init(ShortcutEditSession);
  -[ShortcutEditSession setAlreadySaved:](v4, "setAlreadySaved:", 1);
  if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v5 = objc_msgSend(v3, "copy");

    v3 = v5;
  }
  -[ShortcutEditSession setOriginalShortcut:](v4, "setOriginalShortcut:", v3);

  return v4;
}

- (ShortcutEditSession)init
{
  ShortcutEditSession *v2;
  id *v3;
  void *v4;
  _QWORD v6[4];
  ShortcutEditSession *v7;
  _QWORD block[4];
  ShortcutEditSession *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ShortcutEditSession;
  v2 = -[ShortcutEditSession init](&v10, "init");
  if (v2)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100C53888;
      block[3] = &unk_1011AC860;
      v3 = (id *)&v9;
      v9 = v2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcutManager](v2, "shortcutManager"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100C538E8;
      v6[3] = &unk_1011AE168;
      v3 = (id *)&v7;
      v7 = v2;
      objc_msgSend(v4, "loadAllShortcutsWithHandler:", v6);

    }
  }
  return v2;
}

- (void)setOriginalSuggestionsEntry:(id)a3
{
  MapsSuggestionsEntry *v5;
  MapsSuggestionsShortcutLike *v6;
  _TtC4Maps16MapsFavoriteItem *v7;
  MapsSuggestionsShortcutLike *originalShortcut;
  MapsSuggestionsShortcutLike *v9;
  MapsSuggestionsShortcutLike *v10;
  MapsSuggestionsShortcutLike *shortcut;
  MapsSuggestionsShortcutLike *v12;
  MapsSuggestionsShortcutLike *v13;
  MapsSuggestionsShortcutLike *v14;
  MapsSuggestionsEntry *v15;

  v5 = (MapsSuggestionsEntry *)a3;
  if (self->_originalSuggestionsEntry != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_originalSuggestionsEntry, a3);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v6 = (MapsSuggestionsShortcutLike *)objc_alloc_init((Class)MSFavoriteItem);
      -[MapsSuggestionsShortcutLike setType:](v6, "setType:", 1);
      v7 = -[MapsFavoriteItem initWithFavoriteItem:]([_TtC4Maps16MapsFavoriteItem alloc], "initWithFavoriteItem:", v6);
      originalShortcut = self->_originalShortcut;
      self->_originalShortcut = (MapsSuggestionsShortcutLike *)v7;
      v9 = v7;

      self->_originalShortcutType = (int64_t)-[MapsSuggestionsShortcutLike type](v9, "type");
      v10 = (MapsSuggestionsShortcutLike *)-[MapsSuggestionsShortcutLike copy](v9, "copy");
      shortcut = self->_shortcut;
      self->_shortcut = v10;

    }
    else
    {
      v12 = (MapsSuggestionsShortcutLike *)objc_msgSend(objc_alloc((Class)MapsSuggestionsShortcut), "initSetupPlaceholderOfType:", MapsSuggestionsShortcutTypeFromEntryType(-[MapsSuggestionsEntry type](v15, "type")));
      v13 = self->_originalShortcut;
      self->_originalShortcut = v12;
      v6 = v12;

      v14 = (MapsSuggestionsShortcutLike *)-[MapsSuggestionsShortcutLike copy](v6, "copy");
      v9 = self->_shortcut;
      self->_shortcut = v14;
    }

    v5 = v15;
  }

}

- (void)setOriginalShortcut:(id)a3
{
  MapsSuggestionsShortcutLike *v5;
  id v6;
  MapsSuggestionsShortcutLike *v7;
  MapsSuggestionsShortcutLike *shortcut;
  MapsSuggestionsShortcutLike *v9;

  v5 = (MapsSuggestionsShortcutLike *)a3;
  if (self->_originalShortcut != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_originalShortcut, a3);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      objc_storeStrong((id *)&self->_shortcut, a3);
      v6 = -[MapsSuggestionsShortcutLike type](v9, "type");
      v5 = v9;
      self->_originalShortcutType = (int64_t)v6;
    }
    else
    {
      v7 = (MapsSuggestionsShortcutLike *)-[MapsSuggestionsShortcutLike copy](v9, "copy");
      shortcut = self->_shortcut;
      self->_shortcut = v7;

      v5 = v9;
    }
  }

}

- (NSString)titleForAddressPicker
{
  void *v3;
  unsigned int v4;
  void *v5;
  const __CFString *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;

  v3 = 0;
  switch((unint64_t)-[MapsSuggestionsShortcutLike type](self->_shortcut, "type"))
  {
    case 0uLL:
    case 1uLL:
      v4 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v4)
        v6 = CFSTR("[Shortcut] Add Pin");
      else
        v6 = CFSTR("[Shortcut] Add Favorite");
      goto LABEL_14;
    case 2uLL:
      v7 = -[MapsSuggestionsShortcutLike isSetupPlaceholder](self->_shortcut, "isSetupPlaceholder");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v7 & 1) != 0)
        v6 = CFSTR("[Shortcut] Set up Home");
      else
        v6 = CFSTR("[Shortcut] Change Home Address");
      goto LABEL_14;
    case 3uLL:
      v8 = -[MapsSuggestionsShortcutLike isSetupPlaceholder](self->_shortcut, "isSetupPlaceholder");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v8 & 1) != 0)
        v6 = CFSTR("[Shortcut] Set up Work");
      else
        v6 = CFSTR("[Shortcut] Change Work Address");
LABEL_14:
      v9 = v5;
      goto LABEL_15;
    case 5uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v9;
      v6 = CFSTR("[Shortcut] Add School");
      goto LABEL_15;
    case 6uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v9;
      v6 = CFSTR("[Shortcut] Add Favorite Button");
LABEL_15:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
    default:
      return (NSString *)v3;
  }
  return (NSString *)v3;
}

- (BOOL)isSetupPlaceholder
{
  return -[MapsSuggestionsShortcutLike isSetupPlaceholder](self->_shortcut, "isSetupPlaceholder");
}

- (BOOL)canBeSaved
{
  return (self->_modified || !self->_alreadySaved) && !self->_removing;
}

- (BOOL)canChangeType
{
  return +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
      || -[MapsSuggestionsShortcutLike type](self->_originalShortcut, "type") == (id)1;
}

- (void)setName:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[MapsSuggestionsShortcutLike setCustomName:](self->_shortcut, "setCustomName:", v4);
    self->_modified = 1;
  }

}

- (void)setMapItem:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_geoMapItem"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v4));

  -[MapsSuggestionsShortcutLike setGeoMapItem:](self->_shortcut, "setGeoMapItem:", v5);
  self->_modified = 1;

}

- (id)mapItem
{
  return -[MapsSuggestionsShortcutLike geoMapItem](self->_shortcut, "geoMapItem");
}

- (id)identifier
{
  return -[MapsSuggestionsShortcutLike identifier](self->_shortcut, "identifier");
}

- (void)setType:(int64_t)a3
{
  -[MapsSuggestionsShortcutLike setType:](self->_shortcut, "setType:", a3);
  self->_modified = 1;
}

- (void)setAdjustedCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  MapsSuggestionsShortcutLike *v16;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v16 = self->_shortcut;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcutLike geoMapItem](v16, "geoMapItem"));

  if (v6)
  {
    v7 = objc_alloc_init((Class)GEOMapItemCorrectedLocationAttributes);
    v8 = objc_alloc_init((Class)GEOLatLng);
    objc_msgSend(v8, "setLat:", latitude);
    objc_msgSend(v8, "setLng:", longitude);
    objc_msgSend(v7, "setCorrectedCoordinate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcutLike geoMapItem](v16, "geoMapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientAttributes"));
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = objc_alloc_init((Class)GEOMapItemClientAttributes);
    v13 = v12;

    objc_msgSend(v13, "setCorrectedLocationAttributes:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcutLike geoMapItem](v16, "geoMapItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v14, v13));
    -[MapsSuggestionsShortcutLike setGeoMapItem:](v16, "setGeoMapItem:", v15);

    self->_modified = 1;
  }

}

- (void)addSharing:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *contacts;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestionContactValue"));
  v5 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self, "shortcut"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    objc_msgSend(v7, "addContact:", v8);

  }
  else
  {
    objc_msgSend(v6, "addContact:", v4);
  }

  self->_modified = 1;
  contacts = self->_contacts;
  self->_contacts = 0;

}

- (void)removeSharing:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *contacts;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestionContactValue"));
  v5 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcut](self, "shortcut"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    objc_msgSend(v7, "removeContact:", v8);

  }
  else
  {
    objc_msgSend(v6, "removeContact:", v4);
  }

  self->_modified = 1;
  contacts = self->_contacts;
  self->_contacts = 0;

}

- (NSArray)contacts
{
  NSArray *contacts;
  unsigned int v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  contacts = self->_contacts;
  if (!contacts)
  {
    v4 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcutLike contacts](self->_shortcut, "contacts"));
    if (v4)
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromHandles:](MSPSharedTripContact, "contactsFromHandles:", v5));
    else
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactValuesFromSuggestionsContacts:](MSPSharedTripContact, "contactValuesFromSuggestionsContacts:", v5));
    v7 = self->_contacts;
    self->_contacts = v6;

    contacts = self->_contacts;
  }
  return contacts;
}

- (BOOL)shortcutsContainItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char IsEqualToMapItemForPurpose;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoCompletionItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoMapItem"));

    if (!v7)
    {
LABEL_16:
      LOBYTE(v10) = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v8 = objc_opt_class(MKMapItem);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
      goto LABEL_16;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    if (!v7)
      goto LABEL_16;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_cachedShortcuts;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoMapItem", (_QWORD)v19));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoMapItem"));
          IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v16, v7, 3);

          if ((IsEqualToMapItemForPurpose & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_18;
          }
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_18:

LABEL_19:
  return (char)v10;
}

- (void)saveWithCompletion:(id)a3
{
  id v4;
  MapsSuggestionsShortcutLike *shortcut;
  void *v6;
  void (**v7)(void);
  char v8;
  MapsSuggestionsShortcutLike *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  char v20;
  id from;
  _QWORD v22[5];
  MapsSuggestionsShortcutLike *v23;
  id v24;
  id location;
  MapsSuggestionsShortcutLike *v26;

  v4 = a3;
  shortcut = self->_shortcut;
  if (shortcut && !self->_removing)
  {
    -[MapsSuggestionsShortcutLike setIsHidden:](shortcut, "setIsHidden:", 0);
    v8 = 0;
    if (!self->_alreadySaved)
      v8 = -[MapsSuggestionsEntry isShortcutForSetup](self->_originalSuggestionsEntry, "isShortcutForSetup") ^ 1;
    objc_initWeak(&location, self);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v9 = self->_shortcut;
      if (v9)
      {
        if (-[ShortcutEditSession moveToPreferredIndexInFavorites](self, "moveToPreferredIndexInFavorites"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100C54684;
          v22[3] = &unk_1011EA158;
          v22[4] = self;
          v23 = v9;
          v24 = v4;
          objc_msgSend(v10, "loadAllShortcutsWithCompletionHandler:", v22);

        }
        else
        {
          -[ShortcutEditSession _saveFavorite:completion:](self, "_saveFavorite:completion:", v9, v4);
        }
      }
      else
      {
        if (v4)
          (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession completionHandler](self, "completionHandler"));

        if (v14)
        {
          v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ShortcutEditSession completionHandler](self, "completionHandler"));
          v15[2]();

        }
      }

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcutManager](self, "shortcutManager"));
      objc_initWeak(&from, v11);

      v12 = objc_loadWeakRetained(&from);
      v26 = self->_shortcut;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100C54694;
      v16[3] = &unk_1011EA1A8;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      v17 = v4;
      v20 = v8;
      objc_msgSend(v12, "addOrUpdateShortcuts:handler:", v13, v16);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession completionHandler](self, "completionHandler"));

    if (v6)
    {
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ShortcutEditSession completionHandler](self, "completionHandler"));
      v7[2]();

    }
  }

}

- (void)_saveFavorite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ShortcutEditSession *v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C54A04;
  v10[3] = &unk_1011EA218;
  objc_copyWeak(&v14, &location);
  v8 = v6;
  v11 = v8;
  v12 = self;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "saveWithCompletionHandler:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)removeFromShortcutsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  MapsSuggestionsShortcutLike *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD, _QWORD);
  id v11;
  _QWORD v12[4];
  void (**v13)(_QWORD, _QWORD);
  id location;
  MapsSuggestionsShortcutLike *shortcut;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_shortcut)
  {
    self->_removing = 1;
    objc_initWeak(&location, self);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v6 = self->_shortcut;
      if (v6)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100C54DB4;
        v12[3] = &unk_1011AE218;
        v13 = v5;
        -[MapsSuggestionsShortcutLike deleteWithCompletionHandler:](v6, "deleteWithCompletionHandler:", v12);

      }
      else if (v5)
      {
        v5[2](v5, 0);
      }

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutEditSession shortcutManager](self, "shortcutManager"));
      shortcut = self->_shortcut;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &shortcut, 1));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100C54E68;
      v9[3] = &unk_1011AE988;
      objc_copyWeak(&v11, &location);
      v10 = v5;
      objc_msgSend(v7, "removeShortcuts:handler:", v8, v9);

      objc_destroyWeak(&v11);
    }
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)shortcutManager
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100B3A5D4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oneFavorites"));

  return v4;
}

- (void)_touchMapsSuggestionsEngine
{
  id v2;
  id v3;

  v2 = sub_100B3A5D4();
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "hintRefreshOfType:", 18);

}

+ (void)captureCreateFavoriteAction
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  id v9;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shortcuts"));

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v3);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "type");
          if (v9 == (id)6 || v9 == (id)1)
            ++v6;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);

      if (v6 >= 5)
      {
        if ((unint64_t)v6 >= 0xA)
        {
          if ((unint64_t)v6 >= 0xF)
            v6 = 15;
          else
            v6 = 10;
        }
        else
        {
          v6 = 5;
        }
      }
    }
    else
    {

      v6 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v6));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2052, 0, v13);

  }
  else
  {
    v11 = sub_100B3A5D4();
    v14 = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "oneFavorites"));
    objc_msgSend(v12, "loadAllShortcutsWithHandler:", &stru_1011EA238);

  }
}

- (BOOL)editOnlyAddress
{
  return self->_editingModeType == 2;
}

- (BOOL)editOnlyLocation
{
  return self->_editingModeType == 3;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (MapsSuggestionsShortcutLike)shortcut
{
  return self->_shortcut;
}

- (void)setShortcut:(id)a3
{
  objc_storeStrong((id *)&self->_shortcut, a3);
}

- (BOOL)alreadySaved
{
  return self->_alreadySaved;
}

- (void)setAlreadySaved:(BOOL)a3
{
  self->_alreadySaved = a3;
}

- (BOOL)didResignTitleFocus
{
  return self->_didResignTitleFocus;
}

- (void)setDidResignTitleFocus:(BOOL)a3
{
  self->_didResignTitleFocus = a3;
}

- (BOOL)moveToPreferredIndexInFavorites
{
  return self->_moveToPreferredIndexInFavorites;
}

- (void)setMoveToPreferredIndexInFavorites:(BOOL)a3
{
  self->_moveToPreferredIndexInFavorites = a3;
}

- (int64_t)editingModeType
{
  return self->_editingModeType;
}

- (void)setEditingModeType:(int64_t)a3
{
  self->_editingModeType = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MapsSuggestionsEntry)originalSuggestionsEntry
{
  return self->_originalSuggestionsEntry;
}

- (MapsSuggestionsShortcutLike)originalShortcut
{
  return self->_originalShortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalShortcut, 0);
  objc_storeStrong((id *)&self->_originalSuggestionsEntry, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_cachedShortcuts, 0);
}

@end
