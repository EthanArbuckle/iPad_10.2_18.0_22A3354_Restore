@implementation SuggestionShortcutsRowCellModel

- (SuggestionShortcutsRowCellModel)initWithMapsSuggestionsEntry:(id)a3
{
  id v5;
  void *v6;
  id v7;
  SuggestionShortcutsRowCellModel *v8;
  SuggestionShortcutsRowCellModel *v9;
  id *p_entryLegacy;
  void *v11;
  void *v12;
  SuggestionShortcutsRowCellModel *v13;
  objc_super v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)SuggestionShortcutsRowCellModel;
    v8 = -[SuggestionShortcutsRowCellModel init](&v15, "init");
    v9 = v8;
    if (v8)
    {
      p_entryLegacy = (id *)&v8->_entryLegacy;
      objc_storeStrong((id *)&v8->_entryLegacy, a3);
      objc_msgSend(*p_entryLegacy, "addObserver:forKeyPath:options:context:", v9, CFSTR("title"), 0, off_1014A3C98);
      objc_msgSend(*p_entryLegacy, "addObserver:forKeyPath:options:context:", v9, CFSTR("subtitle"), 0, off_1014A3C98);
      -[SuggestionShortcutsRowCellModel _updateTitlesFromEntry](v9, "_updateTitlesFromEntry");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      objc_msgSend(v11, "addTileGroupObserver:queue:", v9, &_dispatch_main_q);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "addObserver:selector:name:object:", v9, "_sceneDidActivate:", UISceneDidActivateNotification, 0);

    }
    self = v9;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (SuggestionShortcutsRowCellModel)initWithMapsFavoriteItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  SuggestionShortcutsRowCellModel *v8;
  SuggestionShortcutsRowCellModel *v9;
  id *p_entry;
  void *v11;
  void *v12;
  SuggestionShortcutsRowCellModel *v13;
  objc_super v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)SuggestionShortcutsRowCellModel;
    v8 = -[SuggestionShortcutsRowCellModel init](&v15, "init");
    v9 = v8;
    if (v8)
    {
      p_entry = (id *)&v8->_entry;
      objc_storeStrong((id *)&v8->_entry, a3);
      objc_msgSend(*p_entry, "addObserver:forKeyPath:options:context:", v9, CFSTR("title"), 0, off_1014A3C98);
      objc_msgSend(*p_entry, "addObserver:forKeyPath:options:context:", v9, CFSTR("subtitle"), 0, off_1014A3C98);
      -[SuggestionShortcutsRowCellModel _updateTitlesFromEntry](v9, "_updateTitlesFromEntry");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      objc_msgSend(v11, "addTileGroupObserver:queue:", v9, &_dispatch_main_q);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "addObserver:selector:name:object:", v9, "_sceneDidActivate:", UISceneDidActivateNotification, 0);

    }
    self = v9;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = 1;
  if (!v3)
    v4 = 0;
  v5 = OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1014A3C98);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "removeObserver:forKeyPath:context:", self, CFSTR("subtitle"), off_1014A3C98);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v6, "removeTileGroupObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)SuggestionShortcutsRowCellModel;
  -[SuggestionShortcutsRowCellModel dealloc](&v7, "dealloc");
}

- (unint64_t)hash
{
  unsigned int v3;
  uint64_t v4;

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = 1;
  if (!v3)
    v4 = 0;
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4]), "hash");
}

- (BOOL)isEqual:(id)a3
{
  SuggestionShortcutsRowCellModel *v4;
  SuggestionShortcutsRowCellModel *v5;
  uint64_t v6;
  SuggestionShortcutsRowCellModel *v7;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (SuggestionShortcutsRowCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
      v8 = 64;
    else
      v8 = 56;
    v10 = *(Class *)((char *)&self->super.super.isa + v8);
    v11 = objc_claimAutoreleasedReturnValue(-[SuggestionShortcutsRowCellModel entry](v7, "entry"));
    if (v10 == (void *)v11)
    {
      v9 = 1;
    }
    else
    {
      v12 = (void *)v11;
      v9 = objc_msgSend(v10, "isEqual:", v11);
      v10 = v12;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_maps_diffableDataSourceIdentifier
{
  unsigned int v3;
  uint64_t v4;

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = 1;
  if (!v3)
    v4 = 0;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4]), "uniqueIdentifier"));
}

- (id)title
{
  return self->_title;
}

- (id)subtitle
{
  return self->_subtitle;
}

- (id)subtitleColor
{
  void *v3;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if (!-[MapsFavoriteItem isShortcutForSetup](self->_entry, "isShortcutForSetup"))
      goto LABEL_7;
  }
  else if (!-[MapsSuggestionsEntry isShortcutForSetup](self->_entryLegacy, "isShortcutForSetup"))
  {
LABEL_7:
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    return v3;
  }
  if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    goto LABEL_7;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor linkColor](UIColor, "linkColor"));
  return v3;
}

- (id)image
{
  UIImage *image;

  image = self->_image;
  if (!image)
  {
    -[SuggestionShortcutsRowCellModel fetchImage](self, "fetchImage");
    image = self->_image;
  }
  return image;
}

- (BOOL)vibrantBackground
{
  unsigned int v3;
  uint64_t v4;

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = 1;
  if (!v3)
    v4 = 0;
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4]), "hasVibrantBackground");
}

- (void)fetchImage
{
  ++self->_imageCount;
  -[SuggestionShortcutsRowCellModel _fetchImageWithImageCount:retryCount:](self, "_fetchImageWithImageCount:retryCount:");
}

- (void)fetchImageIfMissing
{
  id v3;
  NSObject *v4;
  NSString *title;
  int v6;
  NSString *v7;

  if (-[SuggestionShortcutsRowCellModel _shouldFetchMissingImage](self, "_shouldFetchMissingImage"))
  {
    v3 = sub_100432EDC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      title = self->_title;
      v6 = 138412290;
      v7 = title;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Fetching missing icon for favorite '%@'", (uint8_t *)&v6, 0xCu);
    }

    -[SuggestionShortcutsRowCellModel fetchImage](self, "fetchImage");
  }
}

- (void)_updateTitlesFromEntry
{
  void *v3;
  NSString *v4;
  NSString *title;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *subtitle;
  id v11;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFavoriteItem title](self->_entry, "title"));
    v4 = (NSString *)objc_msgSend(v3, "copy");
    title = self->_title;
    self->_title = v4;

    v11 = (id)objc_claimAutoreleasedReturnValue(-[MapsFavoriteItem subtitle](self->_entry, "subtitle"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry title](self->_entryLegacy, "title"));
    v8 = (NSString *)objc_msgSend(v7, "copy");
    v9 = self->_title;
    self->_title = v8;

    v11 = (id)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry subtitle](self->_entryLegacy, "subtitle"));
  }
  v6 = (NSString *)objc_msgSend(v11, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v6;

}

- (void)_fetchImageWithImageCount:(unint64_t)a3 retryCount:(unint64_t)a4
{
  void *v7;
  _TtC4Maps16MapsFavoriteItem *entry;
  _BOOL8 v9;
  id *v10;
  MapsSuggestionsEntry *entryLegacy;
  _BOOL8 v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15[3];
  _QWORD v16[4];
  id v17[2];
  _QWORD v18[4];
  id v19[2];
  id location;

  if (a4 <= 4 && self->_imageCount == a3)
  {
    objc_initWeak(&location, self);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      entry = self->_entry;
      v9 = -[SuggestionShortcutsRowCellModel vibrantBackground](self, "vibrantBackground");
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10028E9C4;
      v18[3] = &unk_1011AEE10;
      v10 = v19;
      objc_copyWeak(v19, &location);
      v19[1] = (id)a3;
      objc_msgSend(v7, "getImageForRowFavorite:inverted:completion:", entry, v9, v18);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      entryLegacy = self->_entryLegacy;
      v12 = -[SuggestionShortcutsRowCellModel vibrantBackground](self, "vibrantBackground");
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10028EAC0;
      v16[3] = &unk_1011AEE10;
      v10 = v17;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a3;
      objc_msgSend(v7, "getImageForRowSuggestion:inverted:completion:", entryLegacy, v12, v16);
    }

    objc_destroyWeak(v10);
    v13 = dispatch_time(0, 5000000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10028EBBC;
    v14[3] = &unk_1011AEE38;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a3;
    v15[2] = (id)a4;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

- (void)_setFetchedImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;
  unsigned __int8 v7;
  void *v8;
  UIImage *v9;

  v5 = (UIImage *)a3;
  v6 = v5;
  if (self->_image != v5)
  {
    v9 = v5;
    v7 = -[UIImage isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel observers](self, "observers"));
      objc_msgSend(v8, "shortcutsRowCellModelDidUpdate:", self);

      v6 = v9;
    }
  }

}

- (BOOL)_shouldFetchMissingImage
{
  BOOL v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->_image)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel observers](self, "observers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObservers"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "shortcutsRowCellModelShouldFetchMissingImage:") & 1) != 0
          && (objc_msgSend(v11, "shortcutsRowCellModelShouldFetchMissingImage:", self, (_QWORD)v13) & 1) != 0)
        {
          v2 = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v2 = 0;
LABEL_14:

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;
  _QWORD block[5];

  if (off_1014A3C98 == a6)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread", a3, a4, a5))
    {
      -[SuggestionShortcutsRowCellModel _updateTitlesFromEntry](self, "_updateTitlesFromEntry");
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel observers](self, "observers"));
      objc_msgSend(v7, "shortcutsRowCellModelDidUpdate:", self);

    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10028EFC8;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SuggestionShortcutsRowCellModel;
    -[SuggestionShortcutsRowCellModel observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (MapsSuggestionsEntry)entryLegacy
{
  return self->_entryLegacy;
}

- (_TtC4Maps16MapsFavoriteItem)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_entryLegacy, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
