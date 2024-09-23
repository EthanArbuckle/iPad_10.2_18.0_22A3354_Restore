@implementation AutocompleteItem

- (AutocompleteItem)init
{

  return 0;
}

- (AutocompleteItem)initWithServerCompletion:(id)a3 hasPriorityOverride:(BOOL)a4 priorityOverride:(int64_t)a5 serverResultScoreMetadata:(id)a6
{
  id v11;
  id v12;
  AutocompleteItem *v13;
  AutocompleteItem *v14;
  uint64_t v15;
  MKMapItem *mapItem;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *subtitle;
  uint64_t v21;
  NSSet *keys;
  uint64_t v23;
  AutocompleteMatchInfo *matchInfo;
  objc_super v26;

  v11 = a3;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AutocompleteItem;
  v13 = -[AutocompleteItem init](&v26, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_object, a3);
    *(_OWORD *)&v14->_sourceType = xmmword_100E2D550;
    v14->_hasPriorityOverride = a4;
    v14->_priorityOverride = a5;
    objc_storeStrong((id *)&v14->_serverResultScoreMetadata, a6);
    v14->_hasServerItemIndex = 1;
    v14->_serverSectionIndex = (unint64_t)objc_msgSend(v11, "serverSectionIndex");
    v14->_serverItemIndexInSection = (unint64_t)objc_msgSend(v11, "serverItemIndexInSection");
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
    mapItem = v14->_mapItem;
    v14->_mapItem = (MKMapItem *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    title = v14->_title;
    v14->_title = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subtitle"));
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[AutocompleteItem keysForServerCompletion:](AutocompleteItem, "keysForServerCompletion:", v11));
    keys = v14->_keys;
    v14->_keys = (NSSet *)v21;

    v23 = objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0));
    matchInfo = v14->_matchInfo;
    v14->_matchInfo = (AutocompleteMatchInfo *)v23;

  }
  return v14;
}

- (AutocompleteItem)initWithLocalCompletion:(id)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 hasPriorityOverride:(BOOL)a6 priorityOverride:(int64_t)a7 matchInfo:(id)a8
{
  id v15;
  id v16;
  AutocompleteItem *v17;
  AutocompleteItem *v18;
  uint64_t v19;
  id v20;
  __objc2_prot *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSString *title;
  NSString *subtitle;
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
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSString *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  MKMapItem *v51;
  id v52;
  __objc2_prot *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  unsigned int v59;
  id v60;
  id v61;
  __objc2_prot *v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  unsigned int v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  NSString *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSString *v76;
  void *v77;
  uint64_t v78;
  NSString *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSString *v83;
  uint64_t v84;
  uint64_t v85;
  MKMapItem *v86;
  uint64_t v87;
  NSString *v88;
  MKMapItem *mapItem;
  PersonalizedMapItemKey *v90;
  uint64_t v91;
  NSString *v92;
  uint64_t v93;
  NSString *v94;
  uint64_t v95;
  AddressBookAddressItemKey *v96;
  uint64_t v97;
  id v98;
  void *v99;
  AutocompleteStringKey *v100;
  void *v101;
  uint64_t v102;
  NSSet *keys;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  AddressBookAddressItemKey *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  id object;
  objc_super v117;

  v15 = a3;
  v16 = a8;
  v117.receiver = self;
  v117.super_class = (Class)AutocompleteItem;
  v17 = -[AutocompleteItem init](&v117, "init");
  v18 = v17;
  if (!v17)
    goto LABEL_73;
  objc_storeStrong(&v17->_object, a3);
  v18->_sourceType = a4;
  v18->_sourceSubtype = a5;
  v18->_hasPriorityOverride = a6;
  v18->_priorityOverride = a7;
  v19 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v15, v19) & 1) == 0)
  {
    v29 = objc_opt_class(GEOSearchCategory);
    if ((objc_opt_isKindOfClass(v15, v29) & 1) != 0)
    {
      v30 = v15;
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "displayString"));
      title = v18->_title;
      v18->_title = (NSString *)v31;

      subtitle = v18->_subtitle;
      v18->_subtitle = (NSString *)&stru_1011EB268;

      v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "displayString"));
      if (!v16)
        v16 = (id)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 1));

      goto LABEL_56;
    }
    v44 = objc_opt_class(AddressBookAddress);
    if ((objc_opt_isKindOfClass(v15, v44) & 1) != 0)
    {
      v45 = v15;
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "compositeName"));
      v47 = v18->_title;
      v18->_title = (NSString *)v46;

LABEL_55:
      v34 = 0;
      goto LABEL_56;
    }
    v70 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
    if ((objc_opt_isKindOfClass(v15, v70) & 1) != 0)
    {
      v45 = v15;
      v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "title"));
      v72 = v18->_title;
      v18->_title = (NSString *)v71;

      v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "subTitle"));
    }
    else
    {
      v81 = objc_opt_class(CRRecentContact);
      if ((objc_opt_isKindOfClass(v15, v81) & 1) != 0)
      {
        v45 = v15;
        v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "displayName"));
        v83 = v18->_title;
        v18->_title = (NSString *)v82;

        v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "address"));
      }
      else
      {
        v84 = objc_opt_class(MapsSuggestionsEntry);
        if ((objc_opt_isKindOfClass(v15, v84) & 1) == 0)
        {
          v105 = objc_opt_class(SearchResult);
          if ((objc_opt_isKindOfClass(v15, v105) & 1) == 0)
          {
            v114 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v15, v114) & 1) != 0)
            {
              v34 = v15;
              objc_storeStrong((id *)&v18->_title, a3);
              v115 = objc_claimAutoreleasedReturnValue(-[AutocompleteItem _searchItemForString:](v18, "_searchItemForString:", v34));
              object = v18->_object;
              v18->_object = (id)v115;

              if (!v16)
              {
                v80 = 0;
                goto LABEL_47;
              }
            }
            else
            {
              v34 = 0;
              v18->_hidden = 1;
            }
            goto LABEL_56;
          }
          v45 = v15;
          v106 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "mapItem"));
          mapItem = v18->_mapItem;
          v18->_mapItem = (MKMapItem *)v106;
          goto LABEL_53;
        }
        v45 = v15;
        v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "MKMapItem"));
        v86 = v18->_mapItem;
        v18->_mapItem = (MKMapItem *)v85;

        v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "title"));
        v88 = v18->_title;
        v18->_title = (NSString *)v87;

        v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "subtitle"));
      }
    }
    mapItem = (MKMapItem *)v18->_subtitle;
    v18->_subtitle = (NSString *)v73;
LABEL_53:

    if (!v16)
      v16 = (id)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0));
    goto LABEL_55;
  }
  v20 = v15;
  v21 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  v22 = objc_opt_class(HistoryEntryRecentsItem);
  v23 = v20;
  if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25
    && (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "historyEntry")),
        v27 = objc_msgSend(v26, "conformsToProtocol:", v21),
        v26,
        v27))
  {
    v28 = v23;
  }
  else
  {
    v28 = 0;
  }

  if (v28)
  {
    v35 = v23;
    v36 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
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

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "historyEntry"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "geoMapItem"));
    v50 = objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v49));
    v51 = v18->_mapItem;
    v18->_mapItem = (MKMapItem *)v50;

    v34 = 0;
    if (!v16)
      goto LABEL_46;
  }
  else
  {
    v52 = v23;
    v53 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
    v54 = objc_opt_class(HistoryEntryRecentsItem);
    v55 = v52;
    if ((objc_opt_isKindOfClass(v55, v54) & 1) != 0)
      v56 = v55;
    else
      v56 = 0;
    v57 = v56;

    if (v57
      && (v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "historyEntry")),
          v59 = objc_msgSend(v58, "conformsToProtocol:", v53),
          v58,
          v59))
    {
      v60 = v55;
    }
    else
    {
      v60 = 0;
    }

    if (!v60)
    {
      v34 = 0;
      v18->_hidden = 1;
      if (v16)
        goto LABEL_56;
      goto LABEL_46;
    }
    v61 = v55;
    v62 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
    v63 = objc_opt_class(HistoryEntryRecentsItem);
    v64 = v61;
    if ((objc_opt_isKindOfClass(v64, v63) & 1) != 0)
      v65 = v64;
    else
      v65 = 0;
    v66 = v65;

    if (v66
      && (v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "historyEntry")),
          v68 = objc_msgSend(v67, "conformsToProtocol:", v62),
          v67,
          v68))
    {
      v69 = v64;
    }
    else
    {
      v69 = 0;
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "historyEntry"));
    v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "query"));
    v76 = v18->_title;
    v18->_title = (NSString *)v75;

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "historyEntry"));
    v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "locationDisplayString"));
    v79 = v18->_subtitle;
    v18->_subtitle = (NSString *)v78;

    v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v18->_title, v18->_subtitle));
    if (!v16)
    {
LABEL_46:
      v80 = 1;
LABEL_47:
      v16 = (id)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", v80));
    }
  }
LABEL_56:
  if (!v18->_mapItem)
  {
    v95 = objc_opt_class(AddressBookAddress);
    if ((objc_opt_isKindOfClass(v15, v95) & 1) != 0)
    {
      v96 = -[AddressBookAddressItemKey initWithAddressBookAddress:]([AddressBookAddressItemKey alloc], "initWithAddressBookAddress:", v15);
LABEL_68:
      v90 = (PersonalizedMapItemKey *)v96;
      goto LABEL_69;
    }
    if (v34)
    {
      v96 = -[AutocompleteStringKey initWithString:]([AutocompleteStringKey alloc], "initWithString:", v34);
      goto LABEL_68;
    }
    v97 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
    if ((objc_opt_isKindOfClass(v15, v97) & 1) == 0)
    {
      v96 = (AddressBookAddressItemKey *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v18->_title, v18->_subtitle));
      goto LABEL_68;
    }
    v98 = v15;
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "handle"));
    if (v99)
    {

    }
    else
    {
      v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "contact"));
      if (v107)
      {
        v108 = (void *)v107;
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "contact"));
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "postalAddresses"));
        v111 = objc_msgSend(v110, "count");

        if (v111 == (id)1)
        {
          v112 = [AddressBookAddressItemKey alloc];
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "contact"));
          v113 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookAddress singleAddressForContact:](AddressBookAddress, "singleAddressForContact:", v101));
          v90 = -[AddressBookAddressItemKey initWithAddressBookAddress:](v112, "initWithAddressBookAddress:", v113);

          goto LABEL_66;
        }
      }
    }
    v100 = [AutocompleteStringKey alloc];
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "identifier"));
    v90 = -[AutocompleteStringKey initWithString:](v100, "initWithString:", v101);
LABEL_66:

    goto LABEL_69;
  }
  v90 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v18->_mapItem);
  v91 = objc_claimAutoreleasedReturnValue(-[MKMapItem name](v18->_mapItem, "name"));
  v92 = v18->_title;
  v18->_title = (NSString *)v91;

  v93 = objc_claimAutoreleasedReturnValue(-[MKMapItem _addressFormattedAsShortenedAddress](v18->_mapItem, "_addressFormattedAsShortenedAddress"));
  v94 = v18->_subtitle;
  v18->_subtitle = (NSString *)v93;

LABEL_69:
  if (v90)
    v102 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v90));
  else
    v102 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  keys = v18->_keys;
  v18->_keys = (NSSet *)v102;

  objc_storeStrong((id *)&v18->_matchInfo, v16);
LABEL_73:

  return v18;
}

- (AutocompleteItem)initWithLocalCompletion:(id)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 matchInfo:(id)a6
{
  return -[AutocompleteItem initWithLocalCompletion:sourceType:sourceSubtype:hasPriorityOverride:priorityOverride:matchInfo:](self, "initWithLocalCompletion:sourceType:sourceSubtype:hasPriorityOverride:priorityOverride:matchInfo:", a3, a4, a5, 0, 0, a6);
}

- (AutocompleteItem)initWithPersonalizedItem:(id)a3 matchInfo:(id)a4
{
  id v6;
  id v7;
  AutocompleteItem *v8;
  uint64_t v9;
  GEOServerResultScoreMetadata *serverResultScoreMetadata;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id object;
  uint64_t v15;
  NSSet *keys;
  void *v17;
  uint64_t v18;
  NSString *title;
  void *v20;
  uint64_t v21;
  NSString *subtitle;
  uint64_t v23;
  MKMapItem *mapItem;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AutocompleteItem;
  v8 = -[AutocompleteItem init](&v26, "init");
  if (v8)
  {
    v8->_sourceType = (int64_t)objc_msgSend(v6, "sourceType");
    v8->_sourceSubtype = (int64_t)objc_msgSend(v6, "sourceSubtype");
    if (objc_msgSend(v6, "hasPriorityOverride"))
    {
      v8->_hasPriorityOverride = 1;
      v8->_priorityOverride = (int64_t)objc_msgSend(v6, "priorityOverride");
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverResultScoreMetadata"));
    serverResultScoreMetadata = v8->_serverResultScoreMetadata;
    v8->_serverResultScoreMetadata = (GEOServerResultScoreMetadata *)v9;

    v8->_hidden = objc_msgSend(v6, "hidden");
    v11 = objc_msgSend(v6, "hasServerItemIndex");
    v8->_hasServerItemIndex = v11;
    if (v11)
    {
      v8->_serverSectionIndex = (unint64_t)objc_msgSend(v6, "serverSectionIndex");
      v12 = (uint64_t)objc_msgSend(v6, "serverItemIndexInSection");
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v8->_serverSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    v8->_serverItemIndexInSection = v12;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autocompleteObject"));
    object = v8->_object;
    v8->_object = (id)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keys"));
    keys = v8->_keys;
    v8->_keys = (NSSet *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
    title = v8->_title;
    v8->_title = (NSString *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitle"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "value"));
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    mapItem = v8->_mapItem;
    v8->_mapItem = (MKMapItem *)v23;

    objc_storeStrong((id *)&v8->_matchInfo, a4);
  }

  return v8;
}

+ (id)keysForServerCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  AddressBookAddressItemKey *v8;
  ClientTypeResolver *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MapsLocationOfInterest *v14;
  void *v15;
  PersonalizedMapItemKey *v16;
  void *v17;
  PersonalizedMapItemKey *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unsigned int v23;
  PersonalizedMapItemKey *v24;
  PersonalizedMapItemKey *v25;
  PersonalizedMapItemKey *v26;
  PersonalizedMapItemKey *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v33;
  double v34;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientResolved"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientResolved"));
    v7 = objc_msgSend(v6, "itemType");

    if (((_DWORD)v7 - 1) < 2 || (_DWORD)v7 == 6)
    {
      v9 = objc_alloc_init(ClientTypeResolver);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver personalizedItemSource](v9, "personalizedItemSource"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cachedAddressWithType:", v7));

      if (v11)
      {
        v8 = -[AddressBookAddressItemKey initWithAddressBookAddress:]([AddressBookAddressItemKey alloc], "initWithAddressBookAddress:", v11);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver personalizedItemSource](v9, "personalizedItemSource"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cachedLOIWithType:", v7));

        if (v13)
        {
          v14 = -[MapsLocationOfInterest initWithLocationOfInterest:geoMapItem:]([MapsLocationOfInterest alloc], "initWithLocationOfInterest:geoMapItem:", v13, 0);
          v8 = -[LocationOfInterestItemKey initWithLocationOfInterest:]([LocationOfInterestItemKey alloc], "initWithLocationOfInterest:", v14);

        }
        else
        {
          v8 = 0;
        }

      }
      if (!v8)
        goto LABEL_15;
    }
    else
    {
      if ((_DWORD)v7 != 3)
        goto LABEL_15;
      v8 = (AddressBookAddressItemKey *)objc_claimAutoreleasedReturnValue(+[ParkedCar personalizedItemKey](ParkedCar, "personalizedItemKey"));
      if (!v8)
        goto LABEL_15;
    }
    objc_msgSend(v4, "addObject:", v8);

  }
LABEL_15:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));

  if (v15)
  {
    v16 = [PersonalizedMapItemKey alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
    v18 = -[PersonalizedMapItemKey initWithMapItem:](v16, "initWithMapItem:", v17);
    objc_msgSend(v4, "addObject:", v18);

  }
  else
  {
    v33 = 0.0;
    v34 = 0.0;
    if (objc_msgSend(v3, "getCoordinate:", &v33))
    {
      v19 = objc_alloc((Class)CLLocation);
      v20 = objc_msgSend(v19, "initWithLatitude:longitude:", v33, v34);
      v21 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:placeType:", v20, objc_msgSend(v3, "_placeType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
      objc_msgSend(v21, "setName:", v22);

      v23 = objc_msgSend(v3, "_hasDisambiguationRadiusMeters");
      v24 = [PersonalizedMapItemKey alloc];
      v25 = v24;
      if (v23)
      {
        objc_msgSend(v3, "_disambiguationRadiusMeters");
        v26 = -[PersonalizedMapItemKey initWithMapItem:disambiguationRadiusMeters:](v25, "initWithMapItem:disambiguationRadiusMeters:", v21);
      }
      else
      {
        v26 = -[PersonalizedMapItemKey initWithMapItem:](v24, "initWithMapItem:", v21);
      }
      v27 = v26;
      objc_msgSend(v4, "addObject:", v26);

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v28 = objc_msgSend(v4, "copy");
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v29, v30));
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v31));

  }
  return v28;
}

- (id)_searchItemForString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  HistoryEntryRecentsItem *v6;
  uint64_t v8;

  v3 = a3;
  v4 = objc_alloc_init((Class)MSPMutableHistoryEntrySearch);
  objc_msgSend(v4, "setQuery:", v3);

  v8 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transferToImmutableIfValidWithError:", &v8));
  v6 = -[HistoryEntryRecentsItem initWithHistoryEntry:]([HistoryEntryRecentsItem alloc], "initWithHistoryEntry:", v5);

  return v6;
}

- (unint64_t)priority
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  MKMapItem *mapItem;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    -[MKMapItem _coordinate](mapItem, "_coordinate");
  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)-[MKMapItem _enhancedPlacement](self->_mapItem, "_enhancedPlacement");
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)-[MKMapItem _labelGeometry](self->_mapItem, "_labelGeometry");
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment");
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", self->_title, 1);
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", self->_subtitle, 1);
}

- (unint64_t)sortOrder
{
  return 0;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  return (PersonalizedItemStyleAttributesAdornment *)+[PersonalizedItemStyleAttributesAdornment defaultAdornment](PersonalizedItemStyleAttributesAdornment, "defaultAdornment");
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  return (PersonalizedItemClientFeatureIDAdornment *)+[PersonalizedItemClientFeatureIDAdornment defaultAdornment](PersonalizedItemClientFeatureIDAdornment, "defaultAdornment");
}

- (BOOL)shouldBeClustered
{
  return 1;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeHiddenFromMap
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (SearchResult)searchResult
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return 0;
}

- (NSArray)autocompletionStrings
{
  return 0;
}

- (id)autocompleteObject
{
  return self->_object;
}

- (unint64_t)serverSectionIndex
{
  return self->_serverSectionIndex;
}

- (unint64_t)serverItemIndexInSection
{
  return self->_serverItemIndexInSection;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 0;
}

- (id)leafPersonalizedAutocompleteItems
{
  AutocompleteItem *v3;

  v3 = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (BOOL)hasPriorityOverride
{
  return self->_hasPriorityOverride;
}

- (int64_t)priorityOverride
{
  return self->_priorityOverride;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return self->_serverResultScoreMetadata;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)hasServerItemIndex
{
  return self->_hasServerItemIndex;
}

- (NSSet)keys
{
  return self->_keys;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->source, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (AutocompleteMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_serverResultScoreMetadata, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
