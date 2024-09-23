@implementation TwoLinesContentViewModelComposer

+ (id)_delimiterString
{
  if (qword_1014D3858 != -1)
    dispatch_once(&qword_1014D3858, &stru_1011DAB58);
  return (id)qword_1014D3850;
}

+ (BOOL)userInterfaceLayoutDirectionIsRTL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == (id)1;

  return v3;
}

+ (id)cellModelForPlaceNotFoundWithUserEnteredText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BasicTwoLinesContentViewModel *v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("More Results for <user typed string> [Home / Work]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3));
  v7 = objc_msgSend(v6, "rangeOfString:", v3);
  v9 = v8;

  v10 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v6, 0, &stru_1011DAB98);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v7, v9));
  v14 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  -[_BasicTwoLinesContentViewModel setTitleHighlightRanges:](v10, "setTitleHighlightRanges:", v12);

  return v10;
}

+ (id)cellModelForAddMissingPlaceWithUserEnteredText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BasicTwoLinesContentViewModel *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Add to Maps [Home / Work Search Results]"), CFSTR("localized string not found"), 0));

  v6 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v5, v3, &stru_1011DABB8);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v6, "setAxIdentifier:", CFSTR("AddMissingPlaceCell"));

  return v6;
}

+ (id)cellModelForAddressBookAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BasicTwoLinesContentViewModel *v7;
  id v8;
  _BasicTwoLinesContentViewModel *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  if ((objc_msgSend(v3, "isMeCard") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "capitalizedString"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "compositeName"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortAddress"));
  v7 = [_BasicTwoLinesContentViewModel alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1008C2858;
  v21[3] = &unk_1011DABE0;
  v8 = v3;
  v22 = v8;
  v9 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v7, "initWithTitleText:subtitleText:imageCreationBlock:", v5, v6, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geocodedMapItem"));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));

    if (v12)
      goto LABEL_7;
  }
  v13 = objc_alloc((Class)MKMapItem);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addressDictionary"));
  v15 = objc_msgSend(v13, "initWithAddressDictionary:", v14);

  v11 = v15;
  if (v15)
  {
LABEL_7:
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1008C2ACC;
    v18[3] = &unk_1011DAC08;
    v19 = v11;
    v20 = v8;
    v16 = v11;
    -[_BasicTwoLinesContentViewModel setPersonalizedItemForQuickActionMenuCreator:](v9, "setPersonalizedItemForQuickActionMenuCreator:", v18);

  }
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v9, "setAxIdentifier:", CFSTR("AddressBookAddressCell"));

  return v9;
}

+ (id)cellModelForSearchResult:(id)a3
{
  return objc_msgSend(a1, "cellModelForSearchResult:typedACQuery:showAutocompleteClientSource:", a3, 0, 0);
}

+ (id)cellModelForOfflineSearchResult:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PlaceContextViewModel *v12;
  _SearchResultTwoLinesContentViewModel *v13;
  id v14;
  _SearchResultTwoLinesContentViewModel *v15;
  id v16;
  void **v18;
  uint64_t v19;
  SearchResultMapItem *(*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_addressFormattedAsCity"));

  if (objc_msgSend(v3, "isDynamicCurrentLocation"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Offline Search] Current Location"), CFSTR("localized string not found"), CFSTR("Offline")));

    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_addressFormattedAsCity"));

    }
    else
    {
      v11 = 0;
    }
    v12 = -[PlaceContextViewModel initWithCurrentLocation]([PlaceContextViewModel alloc], "initWithCurrentLocation");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v11 = v7;
    v12 = 0;
  }
  v13 = [_SearchResultTwoLinesContentViewModel alloc];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1008C2D80;
  v23[3] = &unk_1011DABE0;
  v14 = v3;
  v24 = v14;
  v15 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v13, "initWithTitleText:subtitleText:imageCreationBlock:", v9, v11, v23);
  -[_SearchResultTwoLinesContentViewModel setPreferredAddressFormat:](v15, "setPreferredAddressFormat:", 1);
  if ((objc_msgSend(v14, "isDynamicCurrentLocation") ^ 1 | v5) == 1 && !objc_msgSend(v11, "length"))
    -[_SearchResultTwoLinesContentViewModel setObservedSearchResult:](v15, "setObservedSearchResult:", v14);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1008C2F10;
  v21 = &unk_1011DAC30;
  v22 = v14;
  v16 = v14;
  -[_BasicTwoLinesContentViewModel setPersonalizedItemForQuickActionMenuCreator:](v15, "setPersonalizedItemForQuickActionMenuCreator:", &v18);
  -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v15, "setPlaceContextViewModel:", v12, v18, v19, v20, v21);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v15, "setAxIdentifier:", CFSTR("SearchResultCell"));

  return v15;
}

+ (id)cellModelForSearchResult:(id)a3 typedACQuery:(id)a4 showAutocompleteClientSource:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  PlaceContextViewModel *v24;
  uint64_t v25;
  _SearchResultTwoLinesContentViewModel *v26;
  id v27;
  _SearchResultTwoLinesContentViewModel *v28;
  id v29;
  void **v31;
  uint64_t v32;
  SearchResultMapItem *(*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v10 = objc_msgSend(v9, "isAuthorizedForPreciseLocation");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_addressFormattedAsShortenedAddress"));

  v13 = objc_msgSend(v7, "isDynamicCurrentLocation");
  if ((_DWORD)v13)
  {
    if ((v10 & 1) != 0)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_addressFormattedAsShortenedAddress"));
      v18 = sub_1008C3208(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    }
    else
    {
      v25 = MKLocalizedStringForCurrentLocation(v13, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue(v25);
      v19 = 0;
    }
    v24 = -[PlaceContextViewModel initWithCurrentLocation]([PlaceContextViewModel alloc], "initWithCurrentLocation");
  }
  else
  {
    if (v5
      && objc_msgSend(v7, "type") == 3
      && objc_msgSend(v8, "length")
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString")),
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString")),
          v22 = objc_msgSend(v20, "containsString:", v21),
          v21,
          v20,
          v22))
    {
      v15 = v12;
      v23 = (id)objc_claimAutoreleasedReturnValue(+[AutocompleteClientSource autocompleteClientSourceTitleWithType:](AutocompleteClientSource, "autocompleteClientSourceTitleWithType:", 5));
    }
    else
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v23 = v12;
    }
    v19 = v23;
    v24 = 0;
  }
  v26 = [_SearchResultTwoLinesContentViewModel alloc];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1008C32A8;
  v36[3] = &unk_1011DABE0;
  v27 = v7;
  v37 = v27;
  v28 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v26, "initWithTitleText:subtitleText:imageCreationBlock:", v15, v19, v36);
  -[_SearchResultTwoLinesContentViewModel setPreferredAddressFormat:](v28, "setPreferredAddressFormat:", 0);
  if ((objc_msgSend(v27, "isDynamicCurrentLocation") ^ 1 | v10) == 1 && !objc_msgSend(v19, "length"))
    -[_SearchResultTwoLinesContentViewModel setObservedSearchResult:](v28, "setObservedSearchResult:", v27);
  v31 = _NSConcreteStackBlock;
  v32 = 3221225472;
  v33 = sub_1008C3410;
  v34 = &unk_1011DAC30;
  v35 = v27;
  v29 = v27;
  -[_BasicTwoLinesContentViewModel setPersonalizedItemForQuickActionMenuCreator:](v28, "setPersonalizedItemForQuickActionMenuCreator:", &v31);
  -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v28, "setPlaceContextViewModel:", v24, v31, v32, v33, v34);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v28, "setAxIdentifier:", CFSTR("SearchResultCell"));

  return v28;
}

+ (id)cellModelForMapsSuggestionsShortcut:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BasicTwoLinesContentViewModel *v18;
  id v19;
  _BasicTwoLinesContentViewModel *v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  char v28;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSetupPlaceholder");
  v5 = v3;
  if (objc_msgSend(v5, "type") == (id)6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NearbyTransit"));

  }
  else
  {
    v7 = 0;
  }

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if ((v7 & 1) != 0)
    {
      v8 = MapsSuggestionsLocalizedNearbyTransitFullString();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = MapsSuggestionsLocalizedNearbyTransitFullSubtitleString();
      v11 = objc_claimAutoreleasedReturnValue(v10);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeName"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortAddress"));
    }
    v15 = (void *)v11;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proposedFavoriteStyleAttributes"));
  }
  else
  {
    if ((v7 & 1) != 0)
    {
      v12 = MapsSuggestionsLocalizedNearbyTransitFullString();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v13 = MapsSuggestionsLocalizedNearbyTransitFullSubtitleString();
      v14 = objc_claimAutoreleasedReturnValue(v13);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));
    }
    v15 = (void *)v14;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));
  }
  v17 = (void *)v16;
  v18 = [_BasicTwoLinesContentViewModel alloc];
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_1008C3658;
  v26 = &unk_1011DAC58;
  v28 = (char)v4;
  v19 = v17;
  v27 = v19;
  v20 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v18, "initWithTitleText:subtitleText:imageCreationBlock:", v9, v15, &v23);
  -[_BasicTwoLinesContentViewModel setVibrantBackground:](v20, "setVibrantBackground:", v4, v23, v24, v25, v26);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
    && objc_msgSend(v5, "isSetupPlaceholder"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor linkColor](UIColor, "linkColor"));
    -[_BasicTwoLinesContentViewModel setSubtitleTextColor:](v20, "setSubtitleTextColor:", v21);

  }
  if (v7)
    -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v20, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v20, "setAxIdentifier:", CFSTR("MapsSuggestionsShortcutCell"));

  return v20;
}

+ (id)cellModelForMapsSuggestionEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellModelForMapsSuggestionEntry:title:subtitle:", v4, v5, v6));

  return v7;
}

+ (id)cellModelForMapsSuggestionEntry:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7;
  id v8;
  id v9;
  _MapsSuggestionsEntryTwoLinesContentViewModel *v10;
  id v11;
  _MapsSuggestionsEntryTwoLinesContentViewModel *v12;
  void *v13;
  void **v15;
  uint64_t v16;
  SuggestionsItem *(*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = [_MapsSuggestionsEntryTwoLinesContentViewModel alloc];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1008C3960;
  v20[3] = &unk_1011DABE0;
  v11 = v7;
  v21 = v11;
  v12 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v10, "initWithTitleText:subtitleText:imageCreationBlock:", v9, v8, v20);

  -[_MapsSuggestionsEntryTwoLinesContentViewModel setObservedEntry:](v12, "setObservedEntry:", v11);
  -[_BasicTwoLinesContentViewModel setImageStyle:](v12, "setImageStyle:", 4);
  if ((objc_msgSend(v11, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsNotADestinationKey"), 1) & 1) == 0)
  {
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1008C3A14;
    v18 = &unk_1011DAC30;
    v19 = v11;
    -[_BasicTwoLinesContentViewModel setPersonalizedItemForQuickActionMenuCreator:](v12, "setPersonalizedItemForQuickActionMenuCreator:", &v15);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v15, v16, v17, v18));
  -[_BasicTwoLinesContentViewModel setShowBadgeView:](v12, "setShowBadgeView:", objc_msgSend(v13, "BOOLForKey:", CFSTR("__internal__EnableMapsSuggestion")));

  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v12, "setAxIdentifier:", CFSTR("MapsSuggestionEntryCell"));
  return v12;
}

+ (id)cellModelForMapsFavoriteItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellModelForMapsFavoriteItem:title:subtitle:", v4, v5, v6));

  return v7;
}

+ (id)cellModelForMapsFavoriteItem:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7;
  id v8;
  id v9;
  _MapsFavoriteItemTwoLinesContentViewModel *v10;
  id v11;
  _MapsFavoriteItemTwoLinesContentViewModel *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = [_MapsFavoriteItemTwoLinesContentViewModel alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008C3C20;
  v16[3] = &unk_1011DABE0;
  v11 = v7;
  v17 = v11;
  v12 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v10, "initWithTitleText:subtitleText:imageCreationBlock:", v9, v8, v16);

  if (objc_msgSend(v11, "isSetupPlaceholder"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor linkColor](UIColor, "linkColor"));
    -[_BasicTwoLinesContentViewModel setSubtitleTextColor:](v12, "setSubtitleTextColor:", v13);

  }
  -[_MapsFavoriteItemTwoLinesContentViewModel setObservedEntry:](v12, "setObservedEntry:", v11);
  -[_BasicTwoLinesContentViewModel setImageStyle:](v12, "setImageStyle:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  -[_BasicTwoLinesContentViewModel setShowBadgeView:](v12, "setShowBadgeView:", objc_msgSend(v14, "BOOLForKey:", CFSTR("__internal__EnableMapsSuggestion")));

  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v12, "setAxIdentifier:", CFSTR("MapsSuggestionEntryCell"));
  return v12;
}

+ (id)cellModelForCollection:(id)a3
{
  id v3;
  _CollectionTwoLinesContentViewModel *v4;
  void *v5;
  void *v6;
  id v7;
  _CollectionTwoLinesContentViewModel *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = [_CollectionTwoLinesContentViewModel alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitle"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008C3DC8;
  v10[3] = &unk_1011DABE0;
  v11 = v3;
  v7 = v3;
  v8 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v4, "initWithTitleText:subtitleText:imageCreationBlock:", v5, v6, v10);

  -[_CollectionTwoLinesContentViewModel setCollection:](v8, "setCollection:", v7);
  -[_BasicTwoLinesContentViewModel setImageStyle:](v8, "setImageStyle:", 3);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v8, "setAxIdentifier:", CFSTR("GuideCell"));

  return v8;
}

+ (id)cellModelForTransitLine:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _BasicTwoLinesContentViewModel *v13;
  id v14;
  _BasicTwoLinesContentViewModel *v15;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "system"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "system"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "system"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Transit_Line_Cell_Default"), CFSTR("localized string not found"), 0));
    }
    v6 = (void *)v12;
    v8 = 0;
  }

  v13 = [_BasicTwoLinesContentViewModel alloc];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008C3FDC;
  v17[3] = &unk_1011DABE0;
  v18 = v3;
  v14 = v3;
  v15 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v13, "initWithTitleText:subtitleText:imageCreationBlock:", v6, v8, v17);
  -[_BasicTwoLinesContentViewModel setImageStyle:](v15, "setImageStyle:", 4);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v15, "setAxIdentifier:", CFSTR("TransitLineCell"));

  return v15;
}

+ (id)cellModelForCollectionMapItem:(id)a3 currentLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BasicTwoLinesContentViewModel *v17;
  id v18;
  _BasicTwoLinesContentViewModel *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  char v26;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_firstLocalizedCategoryName"));
  if (v6)
  {
    v26 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString distanceStringFromLocation:toMapItem:showsDistance:](NSString, "distanceStringFromLocation:toMapItem:showsDistance:", v6, v5, &v26));
    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_resultSnippetLocationString"));

    }
  }
  else
  {
    v9 = 0;
  }
  if ((objc_msgSend(v5, "_hasPriceDescription") & 1) != 0)
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_priceDescription"));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_priceRangeString"));
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v13, "addObject:", v8);
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v13, "addObject:", v9);
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v13, "addObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", v15));
  v17 = [_BasicTwoLinesContentViewModel alloc];
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_1008C43BC;
  v24 = &unk_1011DABE0;
  v25 = v5;
  v18 = v5;
  v19 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v17, "initWithTitleText:subtitleText:imageCreationBlock:", v7, v16, &v21);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v19, "setAxIdentifier:", CFSTR("GuideItemCell"), v21, v22, v23, v24);

  return v19;
}

+ (id)cellModelForMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BasicTwoLinesContentViewModel *v6;
  id v7;
  _BasicTwoLinesContentViewModel *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_addressFormattedAsShortenedAddress"));
  v6 = [_BasicTwoLinesContentViewModel alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008C4540;
  v10[3] = &unk_1011DABE0;
  v11 = v3;
  v7 = v3;
  v8 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v6, "initWithTitleText:subtitleText:imageCreationBlock:", v4, v5, v10);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v8, "setAxIdentifier:", CFSTR("PlaceCell"));

  return v8;
}

+ (id)libraryCellModelForMapItem:(id)a3 customName:(id)a4 styleAttributes:(id)a5 thirdLineViewModel:(id)a6 menuProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BasicTwoLinesContentViewModel *v26;
  _BasicTwoLinesContentViewModel *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
    v17 = v13;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_firstLocalizedCategoryName"));
  if (v20)
    objc_msgSend(v19, "addObject:", v20);
  v36 = (void *)v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_geoMapItem"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_resultSnippetLocationString"));

  if (v22)
    objc_msgSend(v19, "addObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", v23));

  if (!objc_msgSend(v24, "length"))
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_addressFormattedAsShortenedAddress"));

    v24 = (void *)v25;
  }
  v38 = v12;
  v39 = v13;
  v26 = [_BasicTwoLinesContentViewModel alloc];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1008C4924;
  v40[3] = &unk_1011DABE0;
  v41 = v14;
  v35 = v14;
  v37 = v18;
  v27 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v26, "initWithTitleText:subtitleText:imageCreationBlock:", v18, v24, v40);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v27, "setAxIdentifier:", CFSTR("LibraryPlaceCell"));
  if (v15)
    -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v27, "setPlaceContextViewModel:", v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis")));
  objc_msgSend(v28, "setImage:forState:", v29, 0);

  objc_msgSend(v28, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v28, "_setMenuProvider:", v16);
  objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("LibraryPlaceCellMoreButton"));
  v30 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v28, 1);
  objc_msgSend(v30, "setDisplayedState:", 2);
  v31 = v15;
  v32 = objc_alloc_init((Class)UICellAccessoryMultiselect);
  objc_msgSend(v32, "setDisplayedState:", 1);
  v42[0] = v30;
  v42[1] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
  -[_BasicTwoLinesContentViewModel setCellAccessories:](v27, "setCellAccessories:", v33);

  return v27;
}

+ (id)cellModelForParkedCar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BasicTwoLinesContentViewModel *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationDisplayString"));

  v6 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v4, v5, &stru_1011DAC78);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v6, "setAxIdentifier:", CFSTR("ParkedCarCell"));

  return v6;
}

+ (id)cellModelForLocalSearchCompletion:(id)a3 userLocationSearchResult:(id)a4 autocompleteClientSourceType:(int64_t)a5
{
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DirectionIntentCellViewModel *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _SearchResultTwoLinesContentViewModel *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _SearchResultTwoLinesContentViewModel *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  __CFString *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v94;
  void *v95;
  void *v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;

  v7 = a3;
  v92 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleHighlightRanges"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitle"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitleHighlightRanges"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "category"));

  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "category"));
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionIntent"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RouteAC")));
    v14 = -[DirectionIntentCellViewModel initWithLocalSearchCompletion:]([DirectionIntentCellViewModel alloc], "initWithLocalSearchCompletion:", v7);
    v15 = objc_claimAutoreleasedReturnValue(-[DirectionIntentCellViewModel titleCellString](v14, "titleCellString"));

    v16 = objc_claimAutoreleasedReturnValue(-[DirectionIntentCellViewModel subtitleCellString](v14, "subtitleCellString"));
    v88 = 0;
    v17 = 0;
    v18 = 0;
    v9 = (__CFString *)v16;
    v8 = (void *)v15;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientResolved"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientResolved"));
      v21 = objc_msgSend(v20, "itemType");

      v17 = 0;
      v22 = v21 - 1;
      v23 = 0;
      v18 = 0;
      switch(v22)
      {
        case 0u:
          v24 = v9;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "meCardHomeAddress"));
          goto LABEL_23;
        case 1u:
          v24 = v9;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "meCardWorkAddress"));
          goto LABEL_23;
        case 2u:
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
          if (-[__CFString length](v9, "length"))
          {
            v17 = 0;
            v23 = 0;
          }
          else
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
            v83 = v11;
            v84 = v9;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "parkedCar"));

            v85 = v8;
            v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "locationDisplayString"));

            v11 = v83;
            v17 = 0;
            v23 = 0;
            v96 = 0;
            v24 = (__CFString *)v86;
            v8 = v85;
LABEL_24:

            v9 = v24;
          }
LABEL_25:
          if (!-[__CFString length](v9, "length") && v23)
          {
            v35 = v8;
            v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "shortAddress"));

            v96 = 0;
            v9 = (__CFString *)v36;
            v8 = v35;
          }

          v88 = 0;
          break;
        case 3u:
          v27 = -[__CFString length](v9, "length");
          if (!v92)
            goto LABEL_20;
          v24 = v9;
          if (!v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "mapItem"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_addressFormattedAsShortenedAddress"));
            v30 = sub_1008C3208(v29);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            v32 = v8;
            v33 = (void *)v31;
            v34 = &stru_1011EB268;
            if (v31)
              v34 = (__CFString *)v31;
            v9 = v34;

            v8 = v32;
            v96 = 0;
LABEL_20:
            v24 = v9;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "meCard"));
          v23 = 0;
          v18 = 0;
          goto LABEL_24;
        case 4u:
          goto LABEL_25;
        case 5u:
          v24 = v9;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "meCardSchoolAddress"));
LABEL_23:
          v23 = (void *)v26;
          v17 = 0;
          goto LABEL_24;
        default:
          v23 = 0;
          v18 = 0;
          goto LABEL_25;
      }
LABEL_29:
      v13 = 0;
    }
    else
    {
      switch((unint64_t)objc_msgSend(v7, "_type"))
      {
        case 0uLL:
        case 3uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("search")));
          v88 = 0;
          v17 = 0;
          v18 = 0;
          break;
        case 1uLL:
        case 2uLL:
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
          v88 = 0;
          v17 = 0;
          goto LABEL_29;
        case 4uLL:
          v95 = v8;
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionResult"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "collection"));

          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "publisherAttribution"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "displayName"));

          if (objc_msgSend(v68, "length"))
            objc_msgSend(v66, "addObject:", v68);
          v69 = objc_msgSend(v65, "numberOfItems");
          if (v69)
          {
            v70 = v69;
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("Places [Autocomplete]"), CFSTR("localized string not found"), 0));
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v72, v70));
            objc_msgSend(v66, "addObject:", v73);

          }
          v87 = v11;
          v74 = v9;
          if (objc_msgSend(a1, "userInterfaceLayoutDirectionIsRTL"))
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "reverseObjectEnumerator"));
            v76 = v65;
            v77 = v68;
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "allObjects"));
            v79 = objc_msgSend(v78, "mutableCopy");

            v68 = v77;
            v65 = v76;

            v66 = v79;
          }
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "componentsJoinedByString:", v80));

          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "publisherAttribution"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v81, "iconIdentifier")));

          v17 = 0;
          v18 = 0;
          v13 = 0;
          v8 = v95;
          v11 = v87;
          break;
        default:
          v88 = 0;
          v17 = 0;
          v18 = 0;
          goto LABEL_29;
      }
    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteClientSource autocompleteClientSourceTitleWithType:](AutocompleteClientSource, "autocompleteClientSourceTitleWithType:", a5));
  v94 = v8;
  v89 = v37;
  if (objc_msgSend(v37, "length"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    objc_msgSend(v38, "addObject:", v37);
    if (-[__CFString length](v9, "length"))
      objc_msgSend(v38, "addObject:", v9);
    if (objc_msgSend(a1, "userInterfaceLayoutDirectionIsRTL"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "reverseObjectEnumerator"));
      v40 = v7;
      v41 = v13;
      v42 = v17;
      v43 = v18;
      v44 = v11;
      v45 = v9;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "allObjects"));
      v47 = objc_msgSend(v46, "mutableCopy");

      v9 = v45;
      v11 = v44;
      v18 = v43;
      v17 = v42;
      v13 = v41;
      v7 = v40;

      v38 = v47;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "componentsJoinedByString:", v48));

    v9 = (__CFString *)v49;
    v8 = v94;
  }
  v50 = (void *)v90;
  v51 = [_SearchResultTwoLinesContentViewModel alloc];
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_1008C5494;
  v99[3] = &unk_1011DACA0;
  v52 = v13;
  v100 = v52;
  v53 = v11;
  v101 = v53;
  v54 = v7;
  v102 = v54;
  v55 = v18;
  v103 = v55;
  v56 = v17;
  v104 = v56;
  v57 = v88;
  v105 = v57;
  v58 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v51, "initWithTitleText:subtitleText:imageCreationBlock:", v8, v9, v99);
  -[_BasicTwoLinesContentViewModel setTitleHighlightRanges:](v58, "setTitleHighlightRanges:", v90);
  -[_BasicTwoLinesContentViewModel setSubtitleHighlightRanges:](v58, "setSubtitleHighlightRanges:", v96);
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "clientResolved"));
  v91 = v55;
  if (objc_msgSend(v59, "itemType") == 4)
  {
    v60 = -[__CFString length](v9, "length");

    if (!v60)
      -[_SearchResultTwoLinesContentViewModel setObservedSearchResult:](v58, "setObservedSearchResult:", v92);
  }
  else
  {

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mapItem"));
  v62 = v61;
  if (v61)
  {
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472;
    v97[2] = sub_1008C5820;
    v97[3] = &unk_1011DAC30;
    v98 = v61;
    -[_BasicTwoLinesContentViewModel setPersonalizedItemForQuickActionMenuCreator:](v58, "setPersonalizedItemForQuickActionMenuCreator:", v97);

  }
  if (objc_msgSend(v54, "_type") == (id)4)
    -[_BasicTwoLinesContentViewModel setImageStyle:](v58, "setImageStyle:", 2);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v58, "setAxIdentifier:", CFSTR("LocalSearchCompletionCell"));

  return v58;
}

+ (id)cellModelForOfflineRegionLocalSearchCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  _SearchResultTwoLinesContentViewModel *v11;
  id v12;
  _SearchResultTwoLinesContentViewModel *v13;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleHighlightRanges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitleHighlightRanges"));
  v8 = objc_msgSend(v3, "_supportsOfflineDownload");
  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Offline map unavailable [autocomplete]"), CFSTR("localized string not found"), CFSTR("Offline")));

    v7 = 0;
    v6 = (void *)v10;
  }
  v11 = [_SearchResultTwoLinesContentViewModel alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1008C5A04;
  v15[3] = &unk_1011DABE0;
  v16 = v3;
  v12 = v3;
  v13 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v11, "initWithTitleText:subtitleText:imageCreationBlock:", v4, v6, v15);
  -[_BasicTwoLinesContentViewModel setTitleHighlightRanges:](v13, "setTitleHighlightRanges:", v5);
  -[_BasicTwoLinesContentViewModel setSubtitleHighlightRanges:](v13, "setSubtitleHighlightRanges:", v7);
  -[_BasicTwoLinesContentViewModel setDisabled:](v13, "setDisabled:", v8 ^ 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v13, "setAxIdentifier:", CFSTR("LocalSearchCompletionCell"));

  return v13;
}

+ (id)cellModelForRecentContact:(id)a3
{
  return objc_msgSend(a1, "cellModelForRecentContact:showAutocompleteClientSource:autocompleteClientSourceType:", a3, 0, 0);
}

+ (id)cellModelForRecentContact:(id)a3 showAutocompleteClientSource:(BOOL)a4 autocompleteClientSourceType:(int64_t)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BasicTwoLinesContentViewModel *v27;
  _QWORD v29[5];
  BOOL v30;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CRRecentContactMetadataFrom));

  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_22;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CRRecentContactMetadataFromDisplayName));
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CRRecentContactMetadataFromAddress));

  v16 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    v17 = v15;
  else
    v17 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CRRecentContactMetadataFromAddressKind));

  if ((objc_msgSend(v18, "isEqual:", CRAddressKindEmail) & 1) != 0)
  {
    v19 = (id *)&CNContactEmailAddressesKey;
  }
  else
  {
    if (!objc_msgSend(v18, "isEqual:", CRAddressKindPhoneNumber))
    {
      v20 = 0;
      goto LABEL_17;
    }
    v19 = (id *)&CNContactPhoneNumbersKey;
  }
  v20 = *v19;
  if (!v17
    || (v21 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager")),
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "senderNameForAddress:ofType:", v17, v20)),
        v21,
        !v14))
  {
LABEL_17:
    if (objc_msgSend(v13, "length"))
      v22 = v13;
    else
      v22 = 0;
    v14 = v22;
  }

LABEL_22:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
  if (v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteClientSource autocompleteClientSourceTitleWithType:contactName:](AutocompleteClientSource, "autocompleteClientSourceTitleWithType:contactName:", a5, v13));
  }
  else
  {
    if (!v14)
    {
      v24 = 0;
      goto LABEL_27;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("From_Subtitle_CRRecentContact newUI"), CFSTR("localized string not found"), 0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v14));
    v14 = (id)v26;
  }

LABEL_27:
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1008C5E60;
  v29[3] = &unk_1011DACC0;
  v30 = v6;
  v29[4] = a5;
  v27 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v23, v24, v29);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v27, "setAxIdentifier:", CFSTR("RecentContactCell"));

  return v27;
}

+ (id)cellModelForHistoryEntryRecentsItem:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  __objc2_prot *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  id v17;
  __objc2_prot *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v25;
  id v26;
  __objc2_prot *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  __objc2_prot *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  unsigned int v42;
  id v43;
  id v44;
  __objc2_prot *v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  unsigned int v51;
  id v52;
  void *v53;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  v9 = objc_opt_class(HistoryEntryRecentsItem);
  v10 = v7;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry")),
        v14 = objc_msgSend(v13, "conformsToProtocol:", v8),
        v13,
        v14))
  {
    v15 = v10;
  }
  else
  {
    v15 = 0;
  }

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer _cellModelForHistoryEntryRoute:](TwoLinesContentViewModelComposer, "_cellModelForHistoryEntryRoute:", v10));
  }
  else
  {
    v17 = v10;
    v18 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    v19 = objc_opt_class(HistoryEntryRecentsItem);
    v20 = v17;
    if ((objc_opt_isKindOfClass(v20, v19) & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22
      && (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "historyEntry")),
          v24 = objc_msgSend(v23, "conformsToProtocol:", v18),
          v23,
          v24))
    {
      v25 = v20;
    }
    else
    {
      v25 = 0;
    }

    if (v25)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer _cellModelForHistoryEntryPlace:showAutocompleteClientSource:showPlaceContext:](TwoLinesContentViewModelComposer, "_cellModelForHistoryEntryPlace:showAutocompleteClientSource:showPlaceContext:", v20, v6, v5));
    }
    else
    {
      v26 = v20;
      v27 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
      v28 = objc_opt_class(HistoryEntryRecentsItem);
      v29 = v26;
      if ((objc_opt_isKindOfClass(v29, v28) & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
      v31 = v30;

      if (v31
        && (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "historyEntry")),
            v33 = objc_msgSend(v32, "conformsToProtocol:", v27),
            v32,
            v33))
      {
        v34 = v29;
      }
      else
      {
        v34 = 0;
      }

      if (v34)
      {
        v16 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer _cellModelForHistoryEntrySearch:showAutocompleteClientSource:](TwoLinesContentViewModelComposer, "_cellModelForHistoryEntrySearch:showAutocompleteClientSource:", v29, v6));
      }
      else
      {
        v35 = v29;
        v36 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
        v37 = objc_opt_class(HistoryEntryRecentsItem);
        v38 = v35;
        if ((objc_opt_isKindOfClass(v38, v37) & 1) != 0)
          v39 = v38;
        else
          v39 = 0;
        v40 = v39;

        if (v40
          && (v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "historyEntry")),
              v42 = objc_msgSend(v41, "conformsToProtocol:", v36),
              v41,
              v42))
        {
          v43 = v38;
        }
        else
        {
          v43 = 0;
        }

        if (v43)
        {
          v16 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer _cellModelForHistoryEntryTransitLineItem:](TwoLinesContentViewModelComposer, "_cellModelForHistoryEntryTransitLineItem:", v38));
        }
        else
        {
          v44 = v38;
          v45 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
          v46 = objc_opt_class(HistoryEntryRecentsItem);
          v47 = v44;
          if ((objc_opt_isKindOfClass(v47, v46) & 1) != 0)
            v48 = v47;
          else
            v48 = 0;
          v49 = v48;

          if (v49
            && (v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "historyEntry")),
                v51 = objc_msgSend(v50, "conformsToProtocol:", v45),
                v50,
                v51))
          {
            v52 = v47;
          }
          else
          {
            v52 = 0;
          }

          if (!v52)
          {
            v53 = 0;
            goto LABEL_47;
          }
          v16 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer _cellModelForHistoryEntryCuratedCollection:](TwoLinesContentViewModelComposer, "_cellModelForHistoryEntryCuratedCollection:", v47));
        }
      }
    }
  }
  v53 = (void *)v16;
LABEL_47:

  return v53;
}

+ (id)_cellModelForHistoryEntryRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  id v10;
  _BasicTwoLinesContentViewModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v38;
  id v39;
  id v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endWaypoint"));
  v7 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endWaypoint"));
    v11 = (_BasicTwoLinesContentViewModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cellModelForComposedWaypointToRoute:", v10));
    goto LABEL_17;
  }
  v39 = 0;
  v40 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
  +[SearchResult newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:](SearchResult, "newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:", &v40, &v39, v12);
  v9 = v40;
  v10 = v39;

  if ((objc_msgSend(v10, "isAddressBookResult") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "address"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypointCompositeName"));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  }
  if (objc_msgSend(v9, "isDynamicCurrentLocation"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = v15;
    v17 = CFSTR("From_my_location_recents_cell_subtitle");
LABEL_11:
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, CFSTR("localized string not found"), 0));
    goto LABEL_12;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v19 = objc_msgSend(v18, "length");

  if (!v19)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = v15;
    v17 = CFSTR("From_unknown_location_recents_cell_subtitle");
    goto LABEL_11;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("From_in_cell"), CFSTR("localized string not found"), 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21));

LABEL_12:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "waypoints"));
  v25 = (char *)objc_msgSend(v24, "count");

  if ((unint64_t)v25 >= 3)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("count_of_stops"), CFSTR("localized string not found"), 0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v25 - 2));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    objc_msgSend(v29, "addObject:", v22);
    objc_msgSend(v29, "addObject:", v28);
    v38 = v10;
    v30 = v9;
    v31 = v14;
    if (objc_msgSend(a1, "userInterfaceLayoutDirectionIsRTL"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "reverseObjectEnumerator"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));
      v34 = objc_msgSend(v33, "mutableCopy");

      v29 = v34;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsJoinedByString:", v35));

    v22 = (void *)v36;
    v14 = v31;
    v9 = v30;
    v10 = v38;
  }
  v11 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v14, v22, &stru_1011DACE0);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v11, "setAxIdentifier:", CFSTR("RecentRouteCell"));

LABEL_17:
  return v11;
}

+ (id)_cellModelForComposedWaypointToRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cellModelForRouteName:persistentData:thirdLineViewModel:menuProvider:", v5, v7, 0, 0));

  return v8;
}

+ (id)cellModelForRouteData:(id)a3 thirdLineViewModel:(id)a4 menuProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userProvidedName"));
  if (objc_msgSend(v11, "length"))
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userProvidedName"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeName"));
  v13 = (void *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cellModelForRouteName:persistentData:thirdLineViewModel:menuProvider:", v13, v8, v10, v9));
  return v14;
}

+ (id)_cellModelForRouteName:(id)a3 persistentData:(id)a4 thirdLineViewModel:(id)a5 menuProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _BasicTwoLinesContentViewModel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[2];

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v12, 0, &stru_1011DAD00);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "distanceAndElevationDescriptionStringWithAttributes:", &__NSDictionary0__struct));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributedString"));
  -[_BasicTwoLinesContentViewModel setAttributedSubtitleText:](v13, "setAttributedSubtitleText:", v15);

  -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v13, "setPlaceContextViewModel:", v10);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v13, "setAxIdentifier:", CFSTR("RecentCustomRouteCell"));
  if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis")));
    objc_msgSend(v16, "setImage:forState:", v17, 0);

    objc_msgSend(v16, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v16, "_setMenuProvider:", v9);
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("RecentCustomRouteCellMoreButton"));
    v18 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v16, 1);
    v19 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    objc_msgSend(v19, "setDisplayedState:", 1);
    v22[0] = v18;
    v22[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
    -[_BasicTwoLinesContentViewModel setCellAccessories:](v13, "setCellAccessories:", v20);

  }
  return v13;
}

+ (id)_cellModelForHistoryEntryPlace:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _BasicTwoLinesContentViewModel *v36;
  id v37;
  _BasicTwoLinesContentViewModel *v38;
  id v39;
  PlaceContextViewModel *v40;
  PlaceContextViewModel *v41;
  void **v43;
  uint64_t v44;
  SearchResultMapItem *(*v45)(uint64_t);
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;

  v5 = a5;
  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "historyEntry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteClientSource autocompleteClientSourceTitleWithType:](AutocompleteClientSource, "autocompleteClientSourceTitleWithType:", 2));
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v12, "addObject:", v13);

  }
  if (objc_msgSend(v10, "_venueFeatureType") == (id)4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venueLabelWithContext:", 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_venueInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parent"));
    v17 = objc_msgSend(v16, "featureType");

    if (v17 != 2)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addressObject"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "venueShortAddress"));

      v21 = objc_msgSend(v20, "length");
      v22 = v20;
      if (v21 || (v23 = objc_msgSend(v14, "length", v20), v22 = v14, v23))
        objc_msgSend(v12, "addObject:", v22);

      goto LABEL_19;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_addressFormattedAsShortenedAddress"));
    if (objc_msgSend(v10, "_isMapItemTypeAddress")
      && objc_msgSend(v14, "containsString:", v11))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoAddress"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "structuredAddress"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "locality"));
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uppercaseString"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseString"));
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      if (!v29)
        goto LABEL_17;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoAddress"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "structuredAddress"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_cellContent_subtitleWithTitle:", v11));
    }
    v30 = (void *)v26;

    v14 = v30;
  }
LABEL_17:
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v12, "addObject:", v14);
LABEL_19:

  if (objc_msgSend(a1, "userInterfaceLayoutDirectionIsRTL"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reverseObjectEnumerator"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allObjects"));
    v33 = objc_msgSend(v32, "mutableCopy");

    v12 = v33;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", v34));

  v36 = [_BasicTwoLinesContentViewModel alloc];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1008C6F30;
  v48[3] = &unk_1011DABE0;
  v37 = v10;
  v49 = v37;
  v38 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v36, "initWithTitleText:subtitleText:imageCreationBlock:", v11, v35, v48);
  v43 = _NSConcreteStackBlock;
  v44 = 3221225472;
  v45 = sub_1008C6FE4;
  v46 = &unk_1011DAC30;
  v39 = v9;
  v47 = v39;
  -[_BasicTwoLinesContentViewModel setPersonalizedItemForQuickActionMenuCreator:](v38, "setPersonalizedItemForQuickActionMenuCreator:", &v43);
  if (v5)
  {
    v40 = [PlaceContextViewModel alloc];
    v41 = -[PlaceContextViewModel initWithMapItem:context:](v40, "initWithMapItem:context:", v37, 1, v43, v44, v45, v46);
    -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v38, "setPlaceContextViewModel:", v41);

  }
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v38, "setAxIdentifier:", CFSTR("RecentPlaceCell"), v43, v44, v45, v46);

  return v38;
}

+ (id)_cellModelForHistoryEntrySearch:(id)a3 showAutocompleteClientSource:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BasicTwoLinesContentViewModel *v18;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "historyEntry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteClientSource autocompleteClientSourceTitleWithType:](AutocompleteClientSource, "autocompleteClientSourceTitleWithType:", 1));
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v9, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "historyEntry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "locationDisplayString"));

  if (objc_msgSend(v12, "length"))
    objc_msgSend(v9, "addObject:", v12);
  if (objc_msgSend(a1, "userInterfaceLayoutDirectionIsRTL"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reverseObjectEnumerator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    v15 = objc_msgSend(v14, "mutableCopy");

    v9 = v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", v16));

  v18 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v8, v17, &stru_1011DAD20);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v18, "setAxIdentifier:", CFSTR("RecentSearchCell"));

  return v18;
}

+ (id)_cellModelForHistoryEntryTransitLineItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "historyEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lineItem"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellModelForTransitLine:", v5));
  return v6;
}

+ (id)_cellModelForHistoryEntryCuratedCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BasicTwoLinesContentViewModel *v19;
  void *v20;
  id v21;
  _BasicTwoLinesContentViewModel *v22;
  _QWORD v24[4];
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "historyEntry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeCollection"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publisherAttribution"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v8, "addObject:", v7);
  v9 = objc_msgSend(v5, "numberOfItems");
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Number of places [Curated Collection]"), CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10));
    objc_msgSend(v8, "addObject:", v13);

  }
  if (objc_msgSend(a1, "userInterfaceLayoutDirectionIsRTL"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reverseObjectEnumerator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
    v16 = objc_msgSend(v15, "mutableCopy");

    v8 = v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", v17));

  v19 = [_BasicTwoLinesContentViewModel alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionTitle"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1008C74D0;
  v24[3] = &unk_1011DABE0;
  v25 = v5;
  v21 = v5;
  v22 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v19, "initWithTitleText:subtitleText:imageCreationBlock:", v20, v18, v24);

  -[_BasicTwoLinesContentViewModel setImageStyle:](v22, "setImageStyle:", 3);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v22, "setAxIdentifier:", CFSTR("CuratedGuideCell"));

  return v22;
}

+ (id)cellModelForSharedTripSummary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BasicTwoLinesContentViewModel *v6;
  id v7;
  _BasicTwoLinesContentViewModel *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitle"));
  v6 = [_BasicTwoLinesContentViewModel alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008C76CC;
  v10[3] = &unk_1011DABE0;
  v11 = v3;
  v7 = v3;
  v8 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v6, "initWithTitleText:subtitleText:imageCreationBlock:", v4, v5, v10);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v8, "setAxIdentifier:", CFSTR("SharedTripSummaryCell"));

  return v8;
}

+ (id)cellModelForSharedTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BasicTwoLinesContentViewModel *v10;
  id v11;
  _BasicTwoLinesContentViewModel *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listCellTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listCellSubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "addObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_delimiterString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", v8));

  v10 = [_BasicTwoLinesContentViewModel alloc];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008C7A4C;
  v14[3] = &unk_1011DABE0;
  v15 = v4;
  v11 = v4;
  v12 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v10, "initWithTitleText:subtitleText:imageCreationBlock:", v5, v9, v14);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v12, "setAxIdentifier:", CFSTR("SharedTripCell"));

  return v12;
}

+ (id)cellModelForLocationInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BasicTwoLinesContentViewModel *v12;
  void *v13;
  void *v14;
  _BasicTwoLinesContentViewModel *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationName"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationName"));
  else
    v6 = &stru_1011EB268;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localityName"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (-[__CFString length](v6, "length"))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(", ")));

      v6 = (__CFString *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localityName"));
    v11 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v10));

    v6 = (__CFString *)v11;
  }
  v12 = [_BasicTwoLinesContentViewModel alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[LookAround Rap]"), CFSTR("localized string not found"), 0));
  v15 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v12, "initWithTitleText:subtitleText:imageCreationBlock:", v14, v6, &stru_1011DAD40);

  -[_BasicTwoLinesContentViewModel setImageStyle:](v15, "setImageStyle:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[_BasicTwoLinesContentViewModel setLeftImageTintColor:](v15, "setLeftImageTintColor:", v16);

  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v15, "setAxIdentifier:", CFSTR("LookAroundCell"));
  return v15;
}

+ (id)cellModelForPublisher:(id)a3 showDisclosureIndicator:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BasicTwoLinesContentViewModel *v11;
  id v12;
  _BasicTwoLinesContentViewModel *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publisherAttribution"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Curated Collections] %lu Guides"), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, objc_msgSend(v5, "totalCollectionCount")));

  v11 = [_BasicTwoLinesContentViewModel alloc];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1008C8040;
  v19[3] = &unk_1011DABE0;
  v12 = v5;
  v20 = v12;
  v13 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v11, "initWithTitleText:subtitleText:imageCreationBlock:", v7, v10, v19);
  -[_BasicTwoLinesContentViewModel setImageStyle:](v13, "setImageStyle:", 1);
  if (v4)
  {
    v14 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    objc_msgSend(v14, "setTintColor:", v15);

    v21 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[_BasicTwoLinesContentViewModel setCellAccessories:](v13, "setCellAccessories:", v16);

  }
  -[_BasicTwoLinesContentViewModel setPublisher:](v13, "setPublisher:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  -[_BasicTwoLinesContentViewModel setTitleTextFont:](v13, "setTitleTextFont:", v17);

  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v13, "setAxIdentifier:", CFSTR("PublisherCell"));
  return v13;
}

+ (id)cellModelForSearchHomeRecentSearch:(id)a3
{
  id v3;
  void *v4;
  _BasicTwoLinesContentViewModel *v5;
  uint64_t v6;
  uint64_t v7;
  _BasicTwoLinesContentViewModel *v8;
  _QWORD v10[6];
  _QWORD v11[7];
  _QWORD v12[7];
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1008C8328;
  v27 = sub_1008C8338;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1008C8328;
  v21 = sub_1008C8338;
  v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_1008C8328;
  v15[4] = sub_1008C8338;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_1008C8328;
  v13[4] = sub_1008C8338;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "historyEntry"));
  v11[6] = v13;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1008C8340;
  v12[3] = &unk_1011DAD68;
  v12[4] = &v23;
  v12[5] = &v17;
  v12[6] = v15;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008C83D8;
  v11[3] = &unk_1011DAD90;
  v11[4] = &v23;
  v11[5] = &v17;
  objc_msgSend(v4, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v12, 0, v11, 0);

  v5 = [_BasicTwoLinesContentViewModel alloc];
  v6 = v24[5];
  v7 = v18[5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008C8548;
  v10[3] = &unk_1011DADB8;
  v10[4] = v15;
  v10[5] = v13;
  v8 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v5, "initWithTitleText:subtitleText:imageCreationBlock:", v6, v7, v10);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v8, "setAxIdentifier:", CFSTR("SearchHomeRecentSearchCell"));
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v8;
}

+ (id)cellModelForRatingsHistory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  _BasicTwoLinesContentViewModel *v49;
  id v50;
  _BasicTwoLinesContentViewModel *v51;
  id v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v53 = objc_alloc_init((Class)NSMutableAttributedString);
  v5 = objc_alloc_init((Class)NSMutableAttributedString);
  v6 = objc_alloc_init((Class)NSMutableAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Ratings History] Your rating"), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewedPlace"));
  v9 = objc_msgSend(v8, "recommendState");

  if (v9)
  {
    if (v9 == (id)2)
    {
      v10 = CFSTR("hand.thumbsup.fill");
    }
    else
    {
      if (v9 != (id)1)
      {
        v11 = 0;
        goto LABEL_8;
      }
      v10 = CFSTR("hand.thumbsdown.fill");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v10));
LABEL_8:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithTintColor:", v12));

    v14 = objc_alloc_init((Class)NSTextAttachment);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    objc_msgSend(v15, "pointSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithConfiguration:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));
    objc_msgSend(v14, "setImage:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v14));
    objc_msgSend(v6, "appendAttributedString:", v19);

    v20 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v55);
    objc_msgSend(v6, "appendAttributedString:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewedPlace"));
  v22 = objc_msgSend(v21, "numberOfPhotosAdded");

  if (!v9 && v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("camera.fill")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageWithTintColor:", v24));

    v26 = objc_alloc_init((Class)NSTextAttachment);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    objc_msgSend(v27, "pointSize");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "imageWithConfiguration:", v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageWithRenderingMode:", 2));
    objc_msgSend(v26, "setImage:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v26));
    objc_msgSend(v5, "appendAttributedString:", v31);

    v32 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
    objc_msgSend(v5, "appendAttributedString:", v32);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewedPlace"));
  v34 = objc_msgSend(v33, "numberOfPhotosAdded");

  if (v34 == (id)1)
  {
    v35 = objc_alloc((Class)NSMutableAttributedString);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = v36;
    v38 = CFSTR("[Ratings History] 1 Photo");
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewedPlace"));
    v40 = objc_msgSend(v39, "numberOfPhotosAdded");

    if ((unint64_t)v40 < 2)
      goto LABEL_17;
    v35 = objc_alloc((Class)NSMutableAttributedString);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = v36;
    v38 = CFSTR("[Ratings History] Number of Photos");
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", v38, CFSTR("localized string not found"), 0));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewedPlace"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, objc_msgSend(v42, "numberOfPhotosAdded")));
  v44 = objc_msgSend(v35, "initWithString:", v43);
  objc_msgSend(v5, "appendAttributedString:", v44);

LABEL_17:
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v53, "appendAttributedString:", v6);
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      v45 = objc_alloc((Class)NSAttributedString);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR("localized string not found"), 0));
      v48 = objc_msgSend(v45, "initWithString:", v47);
      objc_msgSend(v53, "appendAttributedString:", v48);

    }
    objc_msgSend(v53, "appendAttributedString:", v5);
  }
  v49 = [_BasicTwoLinesContentViewModel alloc];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1008C8C34;
  v56[3] = &unk_1011DABE0;
  v57 = v3;
  v50 = v3;
  v51 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v49, "initWithTitleText:subtitleText:imageCreationBlock:", v54, 0, v56);
  -[_BasicTwoLinesContentViewModel setAttributedSubtitleText:](v51, "setAttributedSubtitleText:", v53);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v51, "setAxIdentifier:", CFSTR("RatingsHistoryCell"));

  return v51;
}

+ (id)cellModelForRAPReportsHistory:(id)a3 allowDisclosureIndicator:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BasicTwoLinesContentViewModel *v20;
  id v21;
  _BasicTwoLinesContentViewModel *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;
  id v34;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name")),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportTitle"));
  }
  v13 = objc_opt_new(NSMutableArray);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportSummary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateOfReportCreation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_abbreviatedDateStringWithoutYearForDate:](NSDateFormatter, "_maps_abbreviatedDateStringWithoutYearForDate:", v15));

  if (objc_msgSend(v16, "length"))
    -[NSMutableArray addObject:](v13, "addObject:", v16);
  if (objc_msgSend(v14, "length"))
    -[NSMutableArray addObject:](v13, "addObject:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR("localized string not found"), 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v13, "componentsJoinedByString:", v18));

  v20 = [_BasicTwoLinesContentViewModel alloc];
  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_1008C9018;
  v31 = &unk_1011DADE0;
  v21 = v6;
  v32 = v21;
  v33 = a1;
  v22 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:](v20, "initWithTitleText:subtitleText:imageCreationBlock:", v12, v19, &v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "backgroundColorForRAPType:", objc_msgSend(v21, "reportType", v28, v29, v30, v31)));
  -[_BasicTwoLinesContentViewModel setLeadingImageBackgroundColor:](v22, "setLeadingImageBackgroundColor:", v23);

  -[_BasicTwoLinesContentViewModel setImageStyle:](v22, "setImageStyle:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[_BasicTwoLinesContentViewModel setLeftImageTintColor:](v22, "setLeftImageTintColor:", v24);

  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v22, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v22, "setAxIdentifier:", CFSTR("ReportAProblemHistoryCell"));
  if (v4
    && (objc_msgSend(v21, "reportStatus") == 2 || objc_msgSend(v21, "reportStatus") == 1))
  {
    v25 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    v34 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    -[_BasicTwoLinesContentViewModel setCellAccessories:](v22, "setCellAccessories:", v26);

  }
  return v22;
}

+ (id)backgroundColorForRAPType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;

  v5 = a3 - 8;
  if ((a3 - 8) <= 9 && ((0x283u >> v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", off_1011DAFC8[v5], v3, v4));
  else
    v6 = 0;
  return v6;
}

+ (id)_convertSymbolToIconImage:(id)a3 RAPType:(int)a4
{
  uint64_t v4;
  id v6;
  ImageIconWithBackgroundConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  -[ImageIconWithBackgroundConfiguration setIconSize:](v7, "setIconSize:", 30.0, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[ImageIconWithBackgroundConfiguration setTintColor:](v7, "setTintColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "backgroundColorForRAPType:", v4));
  -[ImageIconWithBackgroundConfiguration setBackgroundColor:](v7, "setBackgroundColor:", v9);

  -[ImageIconWithBackgroundConfiguration setCornerRadius:](v7, "setCornerRadius:", 15.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_imageIconWithBackgroundConfiguration:", v7));

  return v10;
}

+ (id)cellModelForUGCSuggestionContentType:(int64_t)a3 visitDate:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BasicTwoLinesContentViewModel *v20;

  v5 = a4;
  switch(a3)
  {
    case 1:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[UGC] Add Your Photos to Maps"), CFSTR("localized string not found"), 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[UGC] You took photos here");
      goto LABEL_9;
    case 2:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[UGC] Rate This Place"), CFSTR("localized string not found"), 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[UGC] In your Favorites");
      goto LABEL_9;
    case 3:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[UGC] Rate This Place"), CFSTR("localized string not found"), 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[UGC] It’s pinned.");
      goto LABEL_9;
    case 4:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[UGC] Rate This Place"), CFSTR("localized string not found"), 0));

      if (v5)
      {
        v9 = objc_alloc_init((Class)NSRelativeDateTimeFormatter);
        objc_msgSend(v9, "setDateTimeStyle:", 1);
        objc_msgSend(v9, "setUnitsStyle:", 0);
        objc_msgSend(v9, "setFormattingContext:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForDate:relativeToDate:", v5, v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[UGC] Visited"), CFSTR("localized string not found"), 0));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v16));

LABEL_10:
      }
      else
      {
        v11 = &stru_1011EB268;
      }
LABEL_11:
      v20 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:imageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:imageCreationBlock:", v7, v11, &stru_1011DAE00);
      -[_BasicTwoLinesContentViewModel setImageStyle:](v20, "setImageStyle:", 0);

      return v20;
    case 5:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[UGC] Rate This Place"), CFSTR("localized string not found"), 0));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("[UGC] You’re nearby");
LABEL_9:
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
      goto LABEL_10;
    default:
      v11 = &stru_1011EB268;
      v7 = &stru_1011EB268;
      goto LABEL_11;
  }
}

+ (id)cellModelForOfflineMapSubscriptionInfo:(id)a3 cancelDownloadBlock:(id)a4 resumeDownloadBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _OfflineMapSubscriptionTwoLinesContentViewModel *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _OfflineMapSubscriptionTwoLinesContentViewModel *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Offline Map"), CFSTR("localized string not found"), CFSTR("Offline")));
  }
  v14 = (void *)v13;

  v15 = [_OfflineMapSubscriptionTwoLinesContentViewModel alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "region"));
  v18 = sub_1008C9984(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = -[_OfflineMapSubscriptionTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v15, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v14, 0, v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "region"));
  sub_1008C99FC(v20, v22);

  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v20, "setImageCreationCanBeCached:", 1);
  -[_OfflineMapSubscriptionTwoLinesContentViewModel setSubscriptionInfo:](v20, "setSubscriptionInfo:", v7);
  v23 = objc_msgSend(v9, "copy");

  -[_OfflineMapSubscriptionTwoLinesContentViewModel setCancelDownloadBlock:](v20, "setCancelDownloadBlock:", v23);
  v24 = objc_msgSend(v8, "copy");

  -[_OfflineMapSubscriptionTwoLinesContentViewModel setResumeDownloadBlock:](v20, "setResumeDownloadBlock:", v24);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v20, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v20, "setSubtitleUsesMonospacedNumbers:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v20, "setAxIdentifier:", CFSTR("OfflineMapSubscriptionCell"));
  -[_OfflineMapSubscriptionTwoLinesContentViewModel setAccessibilityLabel:](v20, "setAccessibilityLabel:", v14);

  return v20;
}

+ (id)cellModelForOfflineMapSuggestion:(id)a3 downloadBlock:(id)a4
{
  id v5;
  id v6;
  _BasicTwoLinesContentViewModel *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _BasicTwoLinesContentViewModel *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a4;
  v6 = a3;
  v7 = [_BasicTwoLinesContentViewModel alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "regionName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestionSubtitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapRegion"));
  v11 = sub_1008C9984(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v7, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v8, v9, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapRegion"));
  sub_1008C99FC(v13, v14);

  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v13, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v13, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v13, "setSubtitleUsesMonospacedNumbers:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v13, "setAxIdentifier:", CFSTR("OfflineMapSuggestionCell"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel titleText](v13, "titleText"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v13, "setAccessibilityLabel:", v15);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1008C9D70;
  v24[3] = &unk_1011DAE28;
  v25 = v5;
  v16 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v24));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0, v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle"), v19));
  objc_msgSend(v18, "setImage:forState:", v20, 0);

  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("DownloadSuggestedMap"));
  v21 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v18, 1);
  v26 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  -[_BasicTwoLinesContentViewModel setCellAccessories:](v13, "setCellAccessories:", v22);

  return v13;
}

+ (id)cellModelForExpiredOfflineMapSubscription:(id)a3 isAvailable:(BOOL)a4 isSupportedOSVersion:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  const __CFString *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  _BasicTwoLinesContentViewModel *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Offline Map"), CFSTR("localized string not found"), CFSTR("Offline")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if (v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Tap to update [List]"), CFSTR("localized string not found"), CFSTR("Offline")));

    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "region"));
    v15 = sub_1008C9984(v14);
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue(v15);
  }
  else
  {
    if (v5)
      v17 = CFSTR("Not Available [List]");
    else
      v17 = CFSTR("Update OS to Restore [List]");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v17, CFSTR("localized string not found"), CFSTR("Offline")));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "region"));
    v19 = sub_1008C9984(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1008C9FD8;
    v24[3] = &unk_1011DAEC8;
    v25 = v20;
    v14 = v20;
    v16 = objc_retainBlock(v24);

  }
  v21 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:]([_BasicTwoLinesContentViewModel alloc], "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v9, v13, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "region"));
  sub_1008C99FC(v21, v22);

  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v21, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v21, "setAxIdentifier:", CFSTR("ExpiredOfflineMapSubscription"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v21, "setAccessibilityLabel:", v9);
  -[_BasicTwoLinesContentViewModel setDisabled:](v21, "setDisabled:", !v6);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v21, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v21, "setSubtitleUsesMonospacedNumbers:", 1);

  return v21;
}

+ (id)cellModelForSavedRouteOfflineDownload:(id)a3 estimatedSizeInBytes:(int64_t)a4
{
  id v5;
  void *v6;
  _BasicTwoLinesContentViewModel *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _BasicTwoLinesContentViewModel *v12;
  void *v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:](MKRoundingByteCountFormatter, "stringFromByteCountWithRoundingTo1MB:", a4));
  v7 = [_BasicTwoLinesContentViewModel alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v10 = sub_1008C9984(v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v7, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v9, v6, v11);

  sub_1008C99FC(v12, v5);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v12, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setShouldCenterImage:](v12, "setShouldCenterImage:", 1);
  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v12, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v12, "setSubtitleUsesMonospacedNumbers:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v12, "setAxIdentifier:", CFSTR("OfflineMapDownloadCell"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel titleText](v12, "titleText"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v12, "setAccessibilityLabel:", v13);

  return v12;
}

+ (id)cellModelForSavedRouteCalculatingOfflineRegion:(id)a3
{
  id v3;
  _BasicTwoLinesContentViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _BasicTwoLinesContentViewModel *v11;
  void *v12;

  v3 = a3;
  v4 = [_BasicTwoLinesContentViewModel alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_CALCULATING"), CFSTR("localized string not found"), CFSTR("Offline")));
  v9 = sub_1008C9984(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v4, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v6, v8, v10);

  sub_1008C99FC(v11, v3);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v11, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setShouldCenterImage:](v11, "setShouldCenterImage:", 1);
  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v11, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v11, "setSubtitleUsesMonospacedNumbers:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v11, "setAxIdentifier:", CFSTR("OfflineMapDownloadCell"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel titleText](v11, "titleText"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v11, "setAccessibilityLabel:", v12);

  return v11;
}

+ (id)cellModelForSavedRouteCalculatingFailureForOfflineRegion:(id)a3
{
  id v3;
  _BasicTwoLinesContentViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _BasicTwoLinesContentViewModel *v11;
  void *v12;

  v3 = a3;
  v4 = [_BasicTwoLinesContentViewModel alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_TITLE_UNAVAILABLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_ERROR"), CFSTR("localized string not found"), CFSTR("Offline")));
  v9 = sub_1008C9984(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v4, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v6, v8, v10);

  sub_1008C99FC(v11, v3);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v11, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setShouldCenterImage:](v11, "setShouldCenterImage:", 1);
  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v11, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v11, "setSubtitleUsesMonospacedNumbers:", 1);
  -[_BasicTwoLinesContentViewModel setDisabled:](v11, "setDisabled:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v11, "setAxIdentifier:", CFSTR("OfflineMapDownloadCell"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel titleText](v11, "titleText"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v11, "setAccessibilityLabel:", v12);

  return v11;
}

+ (id)cellModelForSavedRouteUnavailableOfflineRegion:(id)a3
{
  id v3;
  _BasicTwoLinesContentViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _BasicTwoLinesContentViewModel *v11;
  void *v12;

  v3 = a3;
  v4 = [_BasicTwoLinesContentViewModel alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_TITLE_UNAVAILABLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_UNAVAILABLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v9 = sub_1008C9984(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v4, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v6, v8, v10);

  sub_1008C99FC(v11, v3);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v11, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setShouldCenterImage:](v11, "setShouldCenterImage:", 1);
  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v11, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setSubtitleUsesMonospacedNumbers:](v11, "setSubtitleUsesMonospacedNumbers:", 1);
  -[_BasicTwoLinesContentViewModel setDisabled:](v11, "setDisabled:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v11, "setAxIdentifier:", CFSTR("OfflineMapDownloadCell"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel titleText](v11, "titleText"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v11, "setAccessibilityLabel:", v12);

  return v11;
}

+ (id)cellModelForSavedRouteOfflineRegion:(id)a3 coveredByExistingSubscription:(id)a4
{
  id v4;
  _BasicTwoLinesContentViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _BasicTwoLinesContentViewModel *v12;
  void *v13;

  v4 = a3;
  v5 = [_BasicTwoLinesContentViewModel alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_TITLE_ALREADY_DOWNLOADED"), CFSTR("localized string not found"), CFSTR("Offline")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_ALREADY_DOWNLOADED"), CFSTR("localized string not found"), CFSTR("Offline")));
  v10 = sub_1008C9984(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](v5, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", v7, v9, v11);

  sub_1008C99FC(v12, v4);
  -[_BasicTwoLinesContentViewModel setAllowsSubtitleWrapping:](v12, "setAllowsSubtitleWrapping:", 1);
  -[_BasicTwoLinesContentViewModel setShouldCenterImage:](v12, "setShouldCenterImage:", 1);
  -[_BasicTwoLinesContentViewModel setImageCreationCanBeCached:](v12, "setImageCreationCanBeCached:", 1);
  -[_BasicTwoLinesContentViewModel setAxIdentifier:](v12, "setAxIdentifier:", CFSTR("OfflineMapDownloadCell"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BasicTwoLinesContentViewModel titleText](v12, "titleText"));
  -[_BasicTwoLinesContentViewModel setAccessibilityLabel:](v12, "setAccessibilityLabel:", v13);

  return v12;
}

+ (id)cellModelForHistoryEntryRecentsItemProtocol:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  if (v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:", v11, v6, v5));
  else
    v12 = 0;

  return v12;
}

@end
