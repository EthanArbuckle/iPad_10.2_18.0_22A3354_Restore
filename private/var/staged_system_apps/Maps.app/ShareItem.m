@implementation ShareItem

+ (id)shareItemWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5 applicationActivities:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  ShareItemSearchResult *v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[ShareItemSearchResult initWithSearchResult:contact:includePrintActivity:applicationActivities:]([ShareItemSearchResult alloc], "initWithSearchResult:contact:includePrintActivity:applicationActivities:", v11, v10, v6, v9);

  return v12;
}

+ (id)shareItemWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5
{
  return objc_msgSend(a1, "shareItemWithSearchResult:contact:includePrintActivity:applicationActivities:", a3, a4, a5, &__NSArray0__struct);
}

+ (id)shareItemForCurrentLocationIncludingPrintActivity:(BOOL)a3 withBackingMapItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  id v27;
  void *v28;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setMapItem:", v6);
  v9 = objc_alloc_init((Class)CNContactStore);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v28 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  v26 = v9;
  v27 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_ios_meContactWithKeysToFetch:error:", v11, &v27));
  v13 = v27;

  if (v12)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v12, 0));
    if (objc_msgSend(v16, "length"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v6;
      v18 = a1;
      v19 = v4;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Person_Name_Location_Callout_Label"), CFSTR("localized string not found"), 0));
      v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v16));

      v4 = v19;
      a1 = v18;
      v6 = v25;

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));
      objc_msgSend(v22, "setName:", v21);

      v16 = (void *)v21;
    }
    v15 = objc_alloc_init((Class)CNMutableContact);
    objc_msgSend(v15, "setContactType:", 0);
    objc_msgSend(v15, "setGivenName:", v16);

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unknownContact"));
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "shareItemWithSearchResult:contact:includePrintActivity:", v8, v15, v4));

  return v23;
}

+ (id)shareItemWithRoute:(id)a3 includeRoutingApps:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  ShareItemRoute *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[ShareItemRoute initWithRoute:includeRoutingApps:]([ShareItemRoute alloc], "initWithRoute:includeRoutingApps:", v5, v4);

  return v6;
}

+ (id)shareItemForObject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __objc2_prot *v10;
  uint64_t v11;
  void *v12;
  SearchResult *v13;
  void *v14;
  SearchResult *v15;
  void *v16;
  uint64_t v18;
  id v19;
  void *v20;
  SearchResult *v21;
  id v22;
  id v23;
  SearchResult *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  SearchResult *v37;
  void *v38;
  id v39;
  __objc2_prot *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  unsigned int v46;
  id v47;
  CuratedCollectionShareItemSource *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v3 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1009500A8;
  v63 = sub_1009500B8;
  v64 = 0;
  v4 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v60;
    v6 = v3;
    v7 = (id)v5[5];
    v5[5] = (uint64_t)v6;
    goto LABEL_3;
  }
  v11 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
  {
    v7 = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MKMapItem"));

    if (v12)
    {
      v13 = [SearchResult alloc];
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MKMapItem"));
      v15 = -[SearchResult initWithMapItem:](v13, "initWithMapItem:", v14);
      v16 = (void *)v60[5];
      v60[5] = (uint64_t)v15;

    }
    if (objc_msgSend(v7, "type") == (id)7)
      objc_msgSend((id)v60[5], "setReverseGeocoded:", 1);
    goto LABEL_3;
  }
  v18 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v3, v18) & 1) == 0)
  {
    v34 = objc_opt_class(CRRecentContact);
    if ((objc_opt_isKindOfClass(v3, v34) & 1) == 0)
    {
LABEL_4:
      v8 = (void *)v60[5];
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unknownContact"));
        v10 = (__objc2_prot *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v60[5], v9, 1));

      }
      else
      {
        v10 = 0;
      }
      goto LABEL_12;
    }
    v7 = v3;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cachedMapItemForContactID:", objc_msgSend(v7, "contactID")));

    if (v36)
    {
      v37 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v36);
      v38 = (void *)v60[5];
      v60[5] = (uint64_t)v37;

    }
LABEL_3:

    goto LABEL_4;
  }
  v19 = v3;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1009500A8;
  v57 = sub_1009500B8;
  v58 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry"));
  v51[4] = &v53;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1009500C0;
  v52[3] = &unk_1011BAC00;
  v52[4] = &v59;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100950114;
  v51[3] = &unk_1011BF230;
  objc_msgSend(v20, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, v52, v51, 0);

  if (v54[5])
  {
    v21 = [SearchResult alloc];
    v22 = objc_alloc((Class)MKMapItem);
    v23 = objc_msgSend(v22, "initWithGeoMapItem:isPlaceHolderPlace:", v54[5], 0);
    v24 = -[SearchResult initWithMapItem:](v21, "initWithMapItem:", v23);
    v25 = (void *)v60[5];
    v60[5] = (uint64_t)v24;

  }
  v26 = v19;
  v10 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
  v27 = objc_opt_class(HistoryEntryRecentsItem);
  v28 = v26;
  if ((objc_opt_isKindOfClass(v28, v27) & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;

  if (v30
    && (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "historyEntry")),
        v32 = objc_msgSend(v31, "conformsToProtocol:", v10),
        v31,
        v32))
  {
    v33 = v28;
  }
  else
  {
    v33 = 0;
  }

  if (v33)
  {
    v39 = v28;
    v40 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
    v41 = objc_opt_class(HistoryEntryRecentsItem);
    v42 = v39;
    if ((objc_opt_isKindOfClass(v42, v41) & 1) != 0)
      v43 = v42;
    else
      v43 = 0;
    v44 = v43;

    if (v44
      && (v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "historyEntry")),
          v46 = objc_msgSend(v45, "conformsToProtocol:", v40),
          v45,
          v46))
    {
      v47 = v42;
    }
    else
    {
      v47 = 0;
    }

    v48 = [CuratedCollectionShareItemSource alloc];
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "historyEntry"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "placeCollection"));
    v10 = -[CuratedCollectionShareItemSource initWithPlaceCollection:refinedMapItems:](v48, "initWithPlaceCollection:refinedMapItems:", v50, &__NSArray0__struct);

  }
  _Block_object_dispose(&v53, 8);

  if (!v33)
    goto LABEL_4;
LABEL_12:
  _Block_object_dispose(&v59, 8);

  return v10;
}

@end
