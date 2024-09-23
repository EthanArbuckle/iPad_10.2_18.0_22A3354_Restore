@implementation SearchFieldItem

- (NSString)title
{
  void *searchResult;
  NSString *v4;
  NSString *searchString;
  id v6;
  CRRecentContact *coreRecentContact;
  void *v9;
  id v10;
  CRRecentContact *v11;
  uint64_t v12;
  GEOSearchCategory *searchCategory;
  void *venueCategoryItem;
  AddressBookAddress *address;
  _TtC4Maps16MapsFindMyHandle *findMyHandle;
  HistoryEntryRecentsItem *historyItem;
  HistoryEntryRecentsItem *v18;
  __objc2_prot *v19;
  uint64_t v20;
  HistoryEntryRecentsItem *v21;
  HistoryEntryRecentsItem *v22;
  HistoryEntryRecentsItem *v23;
  void *v24;
  unsigned int v25;
  HistoryEntryRecentsItem *v26;
  void *v27;
  GEOMapItemChildPlace *childPlace;
  HistoryEntryRecentsItem *v29;
  __objc2_prot *v30;
  uint64_t v31;
  HistoryEntryRecentsItem *v32;
  HistoryEntryRecentsItem *v33;
  HistoryEntryRecentsItem *v34;
  void *v35;
  unsigned int v36;
  HistoryEntryRecentsItem *v37;
  void *v38;
  void *v39;
  RoutePlanningWaypointRequest *routePlanningWaypointRequest;
  void *v41;
  void *v42;
  void *v43;

  searchResult = self->_searchResult;
  if (searchResult)
    goto LABEL_2;
  searchString = self->_searchString;
  if (searchString || (searchString = self->_addressString) != 0)
  {
LABEL_5:
    v4 = searchString;
    goto LABEL_6;
  }
  coreRecentContact = self->_coreRecentContact;
  if (coreRecentContact)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact displayName](coreRecentContact, "displayName"));
    v10 = objc_msgSend(v9, "length");
    v11 = self->_coreRecentContact;
    if (v10)
      v12 = objc_claimAutoreleasedReturnValue(-[CRRecentContact displayName](v11, "displayName"));
    else
      v12 = objc_claimAutoreleasedReturnValue(-[CRRecentContact address](v11, "address"));
    goto LABEL_17;
  }
  searchCategory = self->_searchCategory;
  if (searchCategory)
    goto LABEL_12;
  venueCategoryItem = self->_venueCategoryItem;
  if (venueCategoryItem || (venueCategoryItem = self->_placeCategoryItem) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(venueCategoryItem, "searchCategory"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayString"));
LABEL_17:
    v6 = (id)v12;
LABEL_18:

    return (NSString *)v6;
  }
  searchCategory = self->_suggestion;
  if (searchCategory)
  {
LABEL_12:
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory displayString](searchCategory, "displayString"));
    goto LABEL_6;
  }
  address = self->_address;
  if (address)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](address, "compositeName"));
    goto LABEL_6;
  }
  searchResult = self->_autocompletePerson;
  if (searchResult)
    goto LABEL_2;
  findMyHandle = self->_findMyHandle;
  if (findMyHandle)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[MapsFindMyHandle displayName](findMyHandle, "displayName"));
    goto LABEL_6;
  }
  historyItem = self->_historyItem;
  if (historyItem)
  {
    v18 = historyItem;
    v19 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
    v20 = objc_opt_class(HistoryEntryRecentsItem);
    v21 = v18;
    if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    if (v23
      && (v24 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v23, "historyEntry")),
          v25 = objc_msgSend(v24, "conformsToProtocol:", v19),
          v24,
          v25))
    {
      v26 = v21;
    }
    else
    {
      v26 = 0;
    }

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v26, "historyEntry"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "query"));

      return (NSString *)v6;
    }
    v29 = self->_historyItem;
    v30 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    v31 = objc_opt_class(HistoryEntryRecentsItem);
    v32 = v29;
    if ((objc_opt_isKindOfClass(v32, v31) & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;

    if (v34
      && (v35 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v34, "historyEntry")),
          v36 = objc_msgSend(v35, "conformsToProtocol:", v30),
          v35,
          v36))
    {
      v37 = v32;
    }
    else
    {
      v37 = 0;
    }

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v37, "historyEntry"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "geoMapItem"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name"));

      return (NSString *)v6;
    }
    goto LABEL_54;
  }
  childPlace = self->_childPlace;
  if (childPlace)
  {
LABEL_36:
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEOMapItemChildPlace name](childPlace, "name"));
    goto LABEL_6;
  }
  if (self->_mapKitHandle)
  {
    searchString = self->_mapKitHandleTitle;
    goto LABEL_5;
  }
  routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
  if (routePlanningWaypointRequest)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointPlaceholder](routePlanningWaypointRequest, "waypointPlaceholder"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v42 = v41;
    if (v41)
    {
      v6 = v41;
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](self->_routePlanningWaypointRequest, "waypointRequest"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "waypointName"));

    }
    goto LABEL_18;
  }
  searchResult = self->_completion;
  if (!searchResult)
  {
    searchString = self->_completedQuery;
    if (searchString)
      goto LABEL_5;
    childPlace = self->_composedWaypoint;
    if (!childPlace)
    {
LABEL_54:
      v6 = 0;
      return (NSString *)v6;
    }
    goto LABEL_36;
  }
LABEL_2:
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(searchResult, "title"));
LABEL_6:
  v6 = v4;
  return (NSString *)v6;
}

- (NSString)waypointName
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
  v4 = objc_msgSend(v3, "isDynamicCurrentLocation");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));

    if (!v7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem title](self, "title"));
      return (NSString *)v6;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nameWithResolvedWaypoint:allowCurrentLocation:", v8, 1));

  }
  return (NSString *)v6;
}

- (id)waypointIconWithScale:(double)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
  v6 = objc_msgSend(v5, "isDynamicCurrentLocation");

  if (!v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes currentLocationStyleAttributes](GEOFeatureStyleAttributes, "currentLocationStyleAttributes")), v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v7, 0, 0, a3)), v7, !v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "findMyHandleID"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypointRequest"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waypointIconWithScale:", a3));

        if (v8)
          return v8;
      }
    }
    else
    {

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addressBookAddress"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "waypointRequest"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "waypointIconWithScale:", a3));

        if (v8)
          return v8;
      }
    }
    else
    {

    }
    v21 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
    if (!v21)
      goto LABEL_60;
    v22 = (void *)v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "styleAttributes"));

    if (!v24
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint")),
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "styleAttributes")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v26, a3)), v26, v25, !v8))
    {
LABEL_60:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem mapItemIfGeocoded](self, "mapItemIfGeocoded"));

      if (!v27
        || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem mapItemIfGeocoded](self, "mapItemIfGeocoded")),
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v28, 2, 0, a3)), v28, !v8))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));

        if (!v29
          || (v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest")),
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "waypointRequest")),
              v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "waypointIconWithScale:", a3)),
              v31,
              v30,
              !v8))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem evStopWaypoint](self, "evStopWaypoint"));

          if (!v32
            || (v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes")), v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v33, 2, 0, a3)), v33, !v8))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));

            if (!v34)
              goto LABEL_32;
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "iconStyleAttributes"));

            if (v36)
            {
              v37 = objc_alloc((Class)GEOFeatureStyleAttributes);
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "iconStyleAttributes"));
              v40 = objc_msgSend(v37, "initWithGEOStyleAttributes:", v39);

            }
            else
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "clientResolved"));
              v43 = objc_msgSend(v42, "itemType");

              v40 = 0;
              switch(v43)
              {
                case 1u:
                  v44 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
                  goto LABEL_30;
                case 2u:
                  v44 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
                  goto LABEL_30;
                case 3u:
                  v44 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
                  goto LABEL_30;
                case 6u:
                  v44 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
LABEL_30:
                  v40 = (id)v44;
                  break;
                default:
                  break;
              }
            }
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v40, a3));

            if (!v8)
            {
LABEL_32:
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));

              if (!v45)
              {
LABEL_42:
                v50 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem venueCategoryItem](self, "venueCategoryItem"));
                if (!v50)
                  goto LABEL_57;
                v51 = (void *)v50;
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem venueCategoryItem](self, "venueCategoryItem"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "searchCategory"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "styleAttributes"));

                if (!v54
                  || (v55 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem venueCategoryItem](self, "venueCategoryItem")),
                      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "searchCategory")),
                      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "styleAttributes")),
                      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v57, a3)), v57, v56, v55, !v8))
                {
LABEL_57:
                  v58 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem placeCategoryItem](self, "placeCategoryItem"));
                  if (!v58)
                    goto LABEL_58;
                  v59 = (void *)v58;
                  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem placeCategoryItem](self, "placeCategoryItem"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "searchCategory"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "styleAttributes"));

                  if (!v62
                    || (v63 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem placeCategoryItem](self, "placeCategoryItem")),
                        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchCategory")),
                        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "styleAttributes")),
                        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v65, a3)), v65, v64, v63, !v8))
                  {
LABEL_58:
                    v66 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchCategory](self, "searchCategory"));
                    if (!v66)
                      goto LABEL_59;
                    v67 = (void *)v66;
                    v68 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchCategory](self, "searchCategory"));
                    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "styleAttributes"));

                    if (!v69
                      || (v70 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchCategory](self, "searchCategory")),
                          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "styleAttributes")),
                          v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v71, a3)), v71, v70, !v8))
                    {
LABEL_59:
                      if (!self->_searchString
                        || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass.circle.fill")))) == 0)
                      {
                        v72 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes genericMarkerStyleAttributes](GEOFeatureStyleAttributes, "genericMarkerStyleAttributes"));
                        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v72, a3));

                      }
                    }
                  }
                }
                return v8;
              }
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
              v47 = objc_msgSend(v46, "addressType");

              switch(v47)
              {
                case 3u:
                  v48 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
                  break;
                case 2u:
                  v48 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
                  break;
                case 1u:
                  v48 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
                  break;
                default:
                  v49 = 0;
LABEL_41:
                  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _iconWithStyleAttributes:scale:](self, "_iconWithStyleAttributes:scale:", v49, a3));

                  if (v8)
                    return v8;
                  goto LABEL_42;
              }
              v49 = (void *)v48;
              goto LABEL_41;
            }
          }
        }
      }
    }
  }
  return v8;
}

- (id)_iconWithStyleAttributes:(id)a3 scale:(double)a4
{
  return +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", a3, 2, 0, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[SearchFieldItem clear](self, "clear");
  v3.receiver = self;
  v3.super_class = (Class)SearchFieldItem;
  -[SearchFieldItem dealloc](&v3, "dealloc");
}

- (void)clear
{
  NSString *addressString;
  CRRecentContact *coreRecentContact;
  SearchResult *searchResult;
  GEOSearchCategory *searchCategory;
  GEORelatedSearchSuggestion *suggestion;
  NSString *searchString;
  NSString *completedQuery;
  MKLocalSearchCompletion *completion;
  NSString *userTypedStringForRAP;
  GEORetainedSearchMetadata *retainedSearchMetadata;
  AddressBookAddress *address;
  _TtC4Maps22MapsAutocompletePerson *autocompletePerson;
  _TtC4Maps16MapsFindMyHandle *findMyHandle;
  HistoryEntryRecentsItem *historyItem;
  ExternalURLQuery *externalURLQuery;
  VenueCategoryItem *venueCategoryItem;
  PlaceCategoryItem *placeCategoryItem;
  GEOMapItemChildPlace *childPlace;
  NSData *mapKitHandle;
  NSString *mapKitHandleTitle;
  RoutePlanningWaypointRequest *routePlanningWaypointRequest;
  GEOComposedWaypoint *composedWaypoint;
  GEOLatLng *latLng;
  GEOSpotlightSearchPunchIn *punchInDetails;

  addressString = self->_addressString;
  self->_addressString = 0;

  coreRecentContact = self->_coreRecentContact;
  self->_coreRecentContact = 0;

  searchResult = self->_searchResult;
  self->_searchResult = 0;

  searchCategory = self->_searchCategory;
  self->_searchCategory = 0;

  suggestion = self->_suggestion;
  self->_suggestion = 0;

  searchString = self->_searchString;
  self->_searchString = 0;

  completedQuery = self->_completedQuery;
  self->_completedQuery = 0;

  completion = self->_completion;
  self->_completion = 0;

  userTypedStringForRAP = self->_userTypedStringForRAP;
  self->_userTypedStringForRAP = 0;

  retainedSearchMetadata = self->_retainedSearchMetadata;
  self->_retainedSearchMetadata = 0;

  address = self->_address;
  self->_address = 0;

  autocompletePerson = self->_autocompletePerson;
  self->_autocompletePerson = 0;

  findMyHandle = self->_findMyHandle;
  self->_findMyHandle = 0;

  historyItem = self->_historyItem;
  self->_historyItem = 0;

  externalURLQuery = self->_externalURLQuery;
  self->_externalURLQuery = 0;

  venueCategoryItem = self->_venueCategoryItem;
  self->_venueCategoryItem = 0;

  placeCategoryItem = self->_placeCategoryItem;
  self->_placeCategoryItem = 0;

  childPlace = self->_childPlace;
  self->_childPlace = 0;

  mapKitHandle = self->_mapKitHandle;
  self->_mapKitHandle = 0;

  mapKitHandleTitle = self->_mapKitHandleTitle;
  self->_mapKitHandleTitle = 0;

  routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
  self->_routePlanningWaypointRequest = 0;

  composedWaypoint = self->_composedWaypoint;
  self->_composedWaypoint = 0;

  latLng = self->_latLng;
  self->_latLng = 0;

  punchInDetails = self->_punchInDetails;
  self->_punchInDetails = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v6;

  objc_storeStrong((id *)v5 + 6, self->_searchResult);
  objc_storeStrong((id *)v5 + 7, self->_completion);
  v8 = -[NSString copyWithZone:](self->_userTypedStringForRAP, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 26);
  *((_QWORD *)v5 + 26) = v8;

  v10 = -[GEORetainedSearchMetadata copyWithZone:](self->_retainedSearchMetadata, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 27);
  *((_QWORD *)v5 + 27) = v10;

  v12 = -[NSString copyWithZone:](self->_completedQuery, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v12;

  objc_storeStrong((id *)v5 + 8, self->_address);
  objc_storeStrong((id *)v5 + 9, self->_searchCategory);
  objc_storeStrong((id *)v5 + 10, self->_venueCategoryItem);
  objc_storeStrong((id *)v5 + 11, self->_placeCategoryItem);
  objc_storeStrong((id *)v5 + 16, self->_suggestion);
  objc_storeStrong((id *)v5 + 12, self->_historyItem);
  objc_storeStrong((id *)v5 + 13, self->_coreRecentContact);
  objc_storeStrong((id *)v5 + 17, self->_externalURLQuery);
  objc_storeStrong((id *)v5 + 19, self->_childPlace);
  v14 = -[NSData copy](self->_mapKitHandle, "copy");
  v15 = (void *)*((_QWORD *)v5 + 20);
  *((_QWORD *)v5 + 20) = v14;

  v16 = -[NSString copy](self->_mapKitHandleTitle, "copy");
  v17 = (void *)*((_QWORD *)v5 + 21);
  *((_QWORD *)v5 + 21) = v16;

  v18 = -[RoutePlanningWaypointRequest copy](self->_routePlanningWaypointRequest, "copy");
  v19 = (void *)*((_QWORD *)v5 + 22);
  *((_QWORD *)v5 + 22) = v18;

  objc_storeStrong((id *)v5 + 23, self->_composedWaypoint);
  v20 = -[GEOLatLng copy](self->_latLng, "copy");
  v21 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v20;

  v22 = -[GEOSpotlightSearchPunchIn copy](self->_punchInDetails, "copy");
  v23 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v22;

  v24 = -[MapsAutocompletePerson copy](self->_autocompletePerson, "copy");
  v25 = (void *)*((_QWORD *)v5 + 24);
  *((_QWORD *)v5 + 24) = v24;

  v26 = -[MapsFindMyHandle copy](self->_findMyHandle, "copy");
  v27 = (void *)*((_QWORD *)v5 + 25);
  *((_QWORD *)v5 + 25) = v26;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SearchFieldItem *v4;
  SearchFieldItem *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (SearchFieldItem *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_7;
  }
  v6 = objc_opt_class(SearchFieldItem);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = -[SearchFieldItem isEqualToSearchFieldItem:](self, "isEqualToSearchFieldItem:", v5);
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)isEqualToSearchFieldItem:(id)a3
{
  SearchFieldItem *v4;
  SearchFieldItem *v5;
  CRRecentContact *coreRecentContact;
  unint64_t v7;
  CRRecentContact *v8;
  unint64_t v9;
  id v10;
  unsigned __int8 v11;
  GEOSpotlightSearchPunchIn *punchInDetails;

  v4 = (SearchFieldItem *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_70:
    v11 = 0;
    goto LABEL_71;
  }
  if (v4 != self)
  {
    if ((-[NSString isEqualToString:](self->_searchString, "isEqualToString:", v4->_searchString)
       || !self->_searchString && !v5->_searchString)
      && (-[SearchResult isEqual:](self->_searchResult, "isEqual:", v5->_searchResult)
       || !self->_searchResult && !v5->_searchResult)
      && ((-[MKLocalSearchCompletion isEqual:](self->_completion, "isEqual:", v5->_completion) & 1) != 0
       || !self->_completion && !v5->_completion)
      && (-[NSString isEqualToString:](self->_userTypedStringForRAP, "isEqualToString:", v5->_userTypedStringForRAP)
       || !self->_userTypedStringForRAP && !v5->_userTypedStringForRAP)
      && ((-[GEORetainedSearchMetadata isEqual:](self->_retainedSearchMetadata, "isEqual:", v5->_retainedSearchMetadata) & 1) != 0|| !self->_retainedSearchMetadata && !v5->_retainedSearchMetadata)&& ((-[NSString isEqual:](self->_completedQuery, "isEqual:", v5->_completedQuery) & 1) != 0|| !self->_completedQuery && !v5->_completedQuery)&& (-[AddressBookAddress isEqual:](self->_address, "isEqual:", v5->_address) || !self->_address && !v5->_address)&& (-[MapsFindMyHandle isEqual:](self->_findMyHandle, "isEqual:", v5->_findMyHandle)|| !self->_findMyHandle && !v5->_findMyHandle)&& (-[MapsAutocompletePerson isEqual:](self->_autocompletePerson, "isEqual:", v5->_autocompletePerson)|| !self->_autocompletePerson && !v5->_autocompletePerson)&& ((-[GEOSearchCategory isEqual:](self->_searchCategory, "isEqual:", v5->_searchCategory) & 1) != 0|| !self->_searchCategory && !v5->_searchCategory)&& (-[VenueCategoryItem isEqual:](self->_venueCategoryItem, "isEqual:", v5->_venueCategoryItem)|| !self->_venueCategoryItem && !v5->_venueCategoryItem)&& ((-[PlaceCategoryItem isEqual:](self->_placeCategoryItem, "isEqual:", v5->_placeCategoryItem) & 1) != 0|| !self->_placeCategoryItem && !v5->_placeCategoryItem)&& ((-[GEORelatedSearchSuggestion isEqual:](self->_suggestion, "isEqual:", v5->_suggestion) & 1) != 0|| !self->_suggestion && !v5->_suggestion)
      && (-[HistoryEntryRecentsItem isEqual:](self->_historyItem, "isEqual:", v5->_historyItem)
       || !self->_historyItem && !v5->_historyItem)
      && -[ExternalURLQuery isEqualToExternalURLQuery:](self->_externalURLQuery, "isEqualToExternalURLQuery:", v5->_externalURLQuery)&& !self->_externalURLQuery&& !v5->_externalURLQuery&& ((-[GEOMapItemChildPlace isEqual:](self->_childPlace, "isEqual:", v5->_childPlace) & 1) != 0|| !self->_childPlace && !v5->_childPlace)&& ((-[NSData isEqual:](self->_mapKitHandle, "isEqual:", v5->_mapKitHandle) & 1) != 0|| !self->_mapKitHandle && !v5->_mapKitHandle)&& (-[RoutePlanningWaypointRequest isEqual:](self->_routePlanningWaypointRequest, "isEqual:", v5->_routePlanningWaypointRequest)|| !self->_routePlanningWaypointRequest && !v5->_routePlanningWaypointRequest)&& ((-[GEOComposedWaypoint isEqual:](self->_composedWaypoint, "isEqual:", v5->_composedWaypoint) & 1) != 0|| !self->_composedWaypoint && !v5->_composedWaypoint))
    {
      coreRecentContact = v5->_coreRecentContact;
      v7 = self->_coreRecentContact;
      v8 = coreRecentContact;
      if ((CRRecentContact *)v7 == v8)
      {

        goto LABEL_85;
      }
      v9 = (unint64_t)v8;
      v10 = objc_msgSend((id)v7, "contactID");
      if (v10 != objc_msgSend((id)v9, "contactID"))
      {

        v11 = 0;
        goto LABEL_87;
      }

      if (v7 | v9)
      {
LABEL_85:
        punchInDetails = self->_punchInDetails;
        v7 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem punchInDetails](v5, "punchInDetails"));
        v11 = -[GEOSpotlightSearchPunchIn isEqual:](punchInDetails, "isEqual:", v7);
LABEL_87:

        goto LABEL_71;
      }
    }
    goto LABEL_70;
  }
  v11 = 1;
LABEL_71:

  return v11;
}

- (BOOL)isEquivalentAsWaypointToSearchFieldItem:(id)a3
{
  id *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 IsEqualToMapItemForPurpose;
  void *v9;
  SearchResult *searchResult;
  id v12;
  unsigned __int8 v13;
  HistoryEntryRecentsItem *historyItem;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  RoutePlanningWaypointRequest *routePlanningWaypointRequest;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  GEOComposedWaypoint *composedWaypoint;
  _QWORD v33[5];
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v4 = (id *)a3;
  if (!v4)
    goto LABEL_5;
  v5 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem autocompletePerson](self, "autocompletePerson"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
  v7 = (uint64_t)v6;
  if (v5 && v6)
    goto LABEL_8;

  if (v5 | v7)
  {
LABEL_5:
    IsEqualToMapItemForPurpose = 0;
    goto LABEL_10;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem findMyHandle](self, "findMyHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyHandle"));
  v7 = (uint64_t)v9;
  if (v5)
  {
    if (v9)
    {
LABEL_8:
      IsEqualToMapItemForPurpose = objc_msgSend((id)v5, "isEqual:", v7);
LABEL_9:

      goto LABEL_10;
    }
  }

  if (v5 | v7)
    goto LABEL_5;
  if (-[SearchFieldItem isEqualToSearchFieldItem:](self, "isEqualToSearchFieldItem:", v4))
  {
    IsEqualToMapItemForPurpose = 1;
    goto LABEL_10;
  }
  searchResult = self->_searchResult;
  if (searchResult)
  {
    v12 = v4[6];
    if (v12)
    {
      v13 = -[SearchResult isEqualToSearchResult:forPurpose:](searchResult, "isEqualToSearchResult:forPurpose:", v12, 1);
LABEL_17:
      IsEqualToMapItemForPurpose = v13;
      goto LABEL_10;
    }
  }
  historyItem = self->_historyItem;
  if (!historyItem || !v4[12])
    goto LABEL_25;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_100660834;
  v45 = sub_100660844;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100660834;
  v39 = sub_100660844;
  v40 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](historyItem, "historyEntry"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10066084C;
  v34[3] = &unk_1011BF230;
  v34[4] = &v41;
  objc_msgSend(v15, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, 0, v34, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[12], "historyEntry"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100660884;
  v33[3] = &unk_1011BF230;
  v33[4] = &v35;
  objc_msgSend(v16, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, 0, v33, 0);

  v17 = v42[5];
  if (!v17)
    goto LABEL_23;
  v18 = v36[5];
  if (v18)
  {
    IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v17, v18, 1);
    v19 = 0;
  }
  else
  {
LABEL_23:
    IsEqualToMapItemForPurpose = 0;
    v19 = 1;
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  if (v19)
  {
LABEL_25:
    routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
    if (routePlanningWaypointRequest && v4[22])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](routePlanningWaypointRequest, "waypointRequest"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[22], "waypointRequest"));
      v23 = sub_100BEF3B0(v21, v22);
    }
    else
    {
      v24 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem evStopWaypoint](self, "evStopWaypoint"));
      if (v24)
      {
        v25 = (void *)v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "evStopWaypoint"));

        if (v26)
        {
          v5 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem evStopWaypoint](self, "evStopWaypoint"));
          v27 = objc_msgSend((id)v5, "muid");
          v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "evStopWaypoint"));
          if (v27 == objc_msgSend((id)v7, "muid"))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem evStopWaypoint](self, "evStopWaypoint"));
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "latLng"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "evStopWaypoint"));
            v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "latLng"));
            if (v29 | v31)
              IsEqualToMapItemForPurpose = objc_msgSend((id)v29, "isEqual:", v31);
            else
              IsEqualToMapItemForPurpose = 1;

          }
          else
          {
            IsEqualToMapItemForPurpose = 0;
          }
          goto LABEL_9;
        }
      }
      composedWaypoint = self->_composedWaypoint;
      if (composedWaypoint && v4[23])
      {
        v13 = -[GEOComposedWaypoint isEqual:](composedWaypoint, "isEqual:");
        goto LABEL_17;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem waypoint](self, "waypoint"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoint"));
      if (!objc_msgSend(v21, "isValid") || !objc_msgSend(v22, "isValid"))
      {
        IsEqualToMapItemForPurpose = 0;
        goto LABEL_41;
      }
      v23 = objc_msgSend(v21, "isEqual:", v22);
    }
    IsEqualToMapItemForPurpose = v23;
LABEL_41:

  }
LABEL_10:

  return IsEqualToMapItemForPurpose;
}

- (void)setSearchString:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *searchString;
  NSString *v7;

  v4 = (NSString *)a3;
  if (!v4 || self->_searchString != v4)
  {
    v7 = v4;
    -[SearchFieldItem clear](self, "clear");
    v5 = (NSString *)-[NSString copy](v7, "copy");
    searchString = self->_searchString;
    self->_searchString = v5;

    v4 = v7;
  }

}

- (NSString)originalSearchString
{
  return self->_searchString;
}

- (void)setAddressString:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *addressString;
  NSString *v7;

  v4 = (NSString *)a3;
  if (!v4 || self->_addressString != v4)
  {
    v7 = v4;
    -[SearchFieldItem clear](self, "clear");
    v5 = (NSString *)-[NSString copy](v7, "copy");
    addressString = self->_addressString;
    self->_addressString = v5;

    v4 = v7;
  }

}

- (void)setSearchCategory:(id)a3
{
  GEOSearchCategory *v5;
  GEOSearchCategory *v6;

  v5 = (GEOSearchCategory *)a3;
  if (!v5 || self->_searchCategory != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_searchCategory, a3);
    v5 = v6;
  }

}

- (void)setVenueCategoryItem:(id)a3
{
  VenueCategoryItem *v5;
  VenueCategoryItem *v6;

  v5 = (VenueCategoryItem *)a3;
  if (!v5 || self->_venueCategoryItem != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_venueCategoryItem, a3);
    v5 = v6;
  }

}

- (void)setPlaceCategoryItem:(id)a3
{
  PlaceCategoryItem *v5;
  PlaceCategoryItem *v6;

  v5 = (PlaceCategoryItem *)a3;
  if (!v5 || self->_placeCategoryItem != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_placeCategoryItem, a3);
    v5 = v6;
  }

}

- (void)setSuggestion:(id)a3
{
  GEORelatedSearchSuggestion *v5;
  GEORelatedSearchSuggestion *v6;

  v5 = (GEORelatedSearchSuggestion *)a3;
  if (!v5 || self->_suggestion != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_suggestion, a3);
    v5 = v6;
  }

}

- (void)setSearchString:(id)a3 forCompletedQuery:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *searchString;
  NSString *v9;
  NSString *completedQuery;
  NSString *v11;

  v11 = (NSString *)a3;
  v6 = (NSString *)a4;
  if (!v11 || self->_searchString != v11 || self->_completedQuery != v6)
  {
    -[SearchFieldItem clear](self, "clear");
    v7 = (NSString *)-[NSString copy](v11, "copy");
    searchString = self->_searchString;
    self->_searchString = v7;

    v9 = (NSString *)-[NSString copy](v6, "copy");
    completedQuery = self->_completedQuery;
    self->_completedQuery = v9;

  }
}

- (void)setSearchResult:(id)a3
{
  SearchResult *v5;
  GEOLatLng *v6;
  GEOLatLng *latLng;
  double v8;
  SearchResult *v9;

  v5 = (SearchResult *)a3;
  if (!v5 || self->_searchResult != v5)
  {
    v9 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_searchResult, a3);
    v6 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
    latLng = self->_latLng;
    self->_latLng = v6;

    -[SearchResult coordinate](v9, "coordinate");
    -[GEOLatLng setLat:](self->_latLng, "setLat:");
    -[SearchResult coordinate](v9, "coordinate");
    -[GEOLatLng setLng:](self->_latLng, "setLng:", v8);
    v5 = v9;
  }

}

- (void)setCompletion:(id)a3
{
  void *v5;
  void *v6;
  GEOLatLng *v7;
  GEOLatLng *latLng;
  MKLocalSearchCompletion *v9;

  v9 = (MKLocalSearchCompletion *)a3;
  if (self->_completion != v9)
  {
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_completion, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion mapItem](v9, "mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "place"));
    v7 = (GEOLatLng *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "center"));
    latLng = self->_latLng;
    self->_latLng = v7;

  }
}

- (void)setUserTypedStringForRAP:(id)a3
{
  NSString *v4;
  NSString *userTypedStringForRAP;

  if (self->_userTypedStringForRAP != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    userTypedStringForRAP = self->_userTypedStringForRAP;
    self->_userTypedStringForRAP = v4;

  }
}

- (void)setCoreRecentContact:(id)a3
{
  id v4;
  CRRecentContact *coreRecentContact;
  CRRecentContact *v6;
  unint64_t v7;
  id v8;
  CRRecentContact *v9;
  CRRecentContact *v10;
  unint64_t v11;

  v4 = a3;
  coreRecentContact = self->_coreRecentContact;
  v11 = (unint64_t)v4;
  v6 = coreRecentContact;
  if (v6 == (CRRecentContact *)v11)
  {

    v9 = (CRRecentContact *)v11;
  }
  else
  {
    v7 = (unint64_t)v6;
    v8 = objc_msgSend((id)v11, "contactID");
    if (v8 == objc_msgSend((id)v7, "contactID"))
    {

      if (v11 | v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[SearchFieldItem clear](self, "clear");
    v10 = (CRRecentContact *)(id)v11;
    v9 = self->_coreRecentContact;
    self->_coreRecentContact = v10;
  }

LABEL_9:
}

- (void)setAddress:(id)a3
{
  void *v5;
  void *v6;
  GEOLatLng *v7;
  GEOLatLng *latLng;
  AddressBookAddress *v9;

  v9 = (AddressBookAddress *)a3;
  if (self->_address != v9)
  {
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_address, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress geocodedMapItem](v9, "geocodedMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "place"));
    v7 = (GEOLatLng *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "center"));
    latLng = self->_latLng;
    self->_latLng = v7;

  }
}

- (void)setHistoryItem:(id)a3
{
  HistoryEntryRecentsItem *v5;
  HistoryEntryRecentsItem *v6;

  v5 = (HistoryEntryRecentsItem *)a3;
  if (self->_historyItem != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_historyItem, a3);
    v5 = v6;
  }

}

- (void)setExternalURLQuery:(id)a3
{
  ExternalURLQuery *v5;
  ExternalURLQuery *v6;

  v5 = (ExternalURLQuery *)a3;
  if (self->_externalURLQuery != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_externalURLQuery, a3);
    v5 = v6;
  }

}

- (void)setChildPlace:(id)a3
{
  GEOLatLng *v5;
  GEOLatLng *latLng;
  void *v7;
  void *v8;
  double v9;
  GEOMapItemChildPlace *v10;

  v10 = (GEOMapItemChildPlace *)a3;
  if (self->_childPlace != v10)
  {
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_childPlace, a3);
    v5 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
    latLng = self->_latLng;
    self->_latLng = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemChildPlace identifier](v10, "identifier"));
    objc_msgSend(v7, "coordinate");
    -[GEOLatLng setLat:](self->_latLng, "setLat:");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemChildPlace identifier](v10, "identifier"));
    objc_msgSend(v8, "coordinate");
    -[GEOLatLng setLng:](self->_latLng, "setLng:", v9);

  }
}

- (void)setMapKitHandle:(id)a3
{
  id v4;
  NSData *v5;
  NSData *mapKitHandle;

  if (self->_mapKitHandle != a3)
  {
    v4 = a3;
    -[SearchFieldItem clear](self, "clear");
    v5 = (NSData *)objc_msgSend(v4, "copy");

    mapKitHandle = self->_mapKitHandle;
    self->_mapKitHandle = v5;

  }
}

- (void)setRoutePlanningWaypointRequest:(id)a3
{
  RoutePlanningWaypointRequest *v5;
  RoutePlanningWaypointRequest *routePlanningWaypointRequest;
  unsigned __int8 v7;
  GEOLatLng *v8;
  GEOLatLng *latLng;
  void *v10;
  void *v11;
  double v12;
  RoutePlanningWaypointRequest *v13;

  v5 = (RoutePlanningWaypointRequest *)a3;
  routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
  if (routePlanningWaypointRequest != v5)
  {
    v13 = v5;
    v7 = -[RoutePlanningWaypointRequest isEqual:](routePlanningWaypointRequest, "isEqual:", v5);
    v5 = v13;
    if ((v7 & 1) == 0)
    {
      -[SearchFieldItem clear](self, "clear");
      objc_storeStrong((id *)&self->_routePlanningWaypointRequest, a3);
      v8 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
      latLng = self->_latLng;
      self->_latLng = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](self->_routePlanningWaypointRequest, "waypointRequest"));
      objc_msgSend(v10, "coordinate");
      -[GEOLatLng setLat:](self->_latLng, "setLat:");

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](self->_routePlanningWaypointRequest, "waypointRequest"));
      objc_msgSend(v11, "coordinate");
      -[GEOLatLng setLng:](self->_latLng, "setLng:", v12);

      v5 = v13;
    }
  }

}

- (void)setComposedWaypoint:(id)a3
{
  id v5;
  GEOComposedWaypoint *composedWaypoint;
  id v7;
  unsigned __int8 v8;
  void *v9;
  GEOLatLng *v10;
  GEOLatLng *latLng;
  double v12;
  double v13;
  GEOLatLng *v14;
  GEOLatLng *v15;
  double v16;
  unint64_t v17;

  v5 = a3;
  composedWaypoint = self->_composedWaypoint;
  v17 = (unint64_t)v5;
  v7 = composedWaypoint;
  if (v17 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v17, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      -[SearchFieldItem clear](self, "clear");
      objc_storeStrong((id *)&self->_composedWaypoint, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "latLng"));

      if (v9)
      {
        v10 = (GEOLatLng *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "latLng"));
        latLng = self->_latLng;
        self->_latLng = v10;

      }
      else
      {
        objc_msgSend((id)v17, "coordinate");
        if (v12 != -180.0)
        {
          objc_msgSend((id)v17, "coordinate");
          if (v13 != -180.0)
          {
            v14 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
            v15 = self->_latLng;
            self->_latLng = v14;

            objc_msgSend((id)v17, "coordinate");
            -[GEOLatLng setLat:](self->_latLng, "setLat:");
            objc_msgSend((id)v17, "coordinate");
            -[GEOLatLng setLng:](self->_latLng, "setLng:", v16);
          }
        }
      }
    }
  }

}

- (void)setAutocompletePerson:(id)a3
{
  _TtC4Maps22MapsAutocompletePerson *v5;
  _TtC4Maps22MapsAutocompletePerson *v6;

  v5 = (_TtC4Maps22MapsAutocompletePerson *)a3;
  if (self->_autocompletePerson != v5)
  {
    v6 = v5;
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_autocompletePerson, a3);
    v5 = v6;
  }

}

- (void)setFindMyHandle:(id)a3
{
  id v5;
  _TtC4Maps16MapsFindMyHandle *findMyHandle;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  findMyHandle = self->_findMyHandle;
  v10 = (unint64_t)v5;
  v7 = findMyHandle;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      -[SearchFieldItem clear](self, "clear");
      objc_storeStrong((id *)&self->_findMyHandle, a3);
      v8 = (void *)v10;
    }
  }

}

- (void)setPunchInDetails:(id)a3 searchString:(id)a4
{
  NSString *v7;
  GEOSpotlightSearchPunchIn *v8;

  v8 = (GEOSpotlightSearchPunchIn *)a3;
  v7 = (NSString *)a4;
  if (self->_punchInDetails != v8 || self->_searchString != v7)
  {
    -[SearchFieldItem clear](self, "clear");
    objc_storeStrong((id *)&self->_punchInDetails, a3);
    objc_storeStrong((id *)&self->_searchString, a4);
  }

}

- (GEOSearchCategory)currentCategory
{
  GEOSearchCategory *searchCategory;

  searchCategory = self->_searchCategory;
  if (searchCategory)
    return searchCategory;
  else
    return (GEOSearchCategory *)(id)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion category](self->_completion, "category"));
}

- (NSString)searchString
{
  SearchResult *searchResult;
  void *v4;
  GEOSearchCategory *searchCategory;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  GEORelatedSearchSuggestion *suggestion;
  id v13;
  NSObject *v14;
  SearchResult *v15;
  void *v16;
  NSString *v17;
  void *v18;
  MKLocalSearchCompletion *completion;
  int IsEnabled_SearchAndDiscovery;
  void *autocompletePerson;
  void *v22;
  id v23;
  CRRecentContact *coreRecentContact;
  id v25;
  CRRecentContact *v26;
  AddressBookAddress *address;
  _TtC4Maps16MapsFindMyHandle *findMyHandle;
  HistoryEntryRecentsItem *historyItem;
  HistoryEntryRecentsItem *v30;
  __objc2_prot *v31;
  uint64_t v32;
  HistoryEntryRecentsItem *v33;
  HistoryEntryRecentsItem *v34;
  HistoryEntryRecentsItem *v35;
  void *v36;
  unsigned int v37;
  HistoryEntryRecentsItem *v38;
  void *v39;
  ExternalURLQuery *externalURLQuery;
  HistoryEntryRecentsItem *v41;
  __objc2_prot *v42;
  uint64_t v43;
  HistoryEntryRecentsItem *v44;
  HistoryEntryRecentsItem *v45;
  HistoryEntryRecentsItem *v46;
  void *v47;
  unsigned int v48;
  HistoryEntryRecentsItem *v49;
  void *v50;
  void *v51;
  NSString *searchString;
  GEOMapItemChildPlace *childPlace;
  RoutePlanningWaypointRequest *routePlanningWaypointRequest;
  void *v55;
  void *v56;
  int v57;
  SearchResult *v58;

  searchResult = self->_searchResult;
  if (!searchResult)
  {
    searchCategory = self->_searchCategory;
    if (searchCategory)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory displayString](searchCategory, "displayString"));
LABEL_19:
      v10 = v6;
      return v10;
    }
    suggestion = self->_suggestion;
    if (suggestion)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEORelatedSearchSuggestion searchBarDisplayToken](suggestion, "searchBarDisplayToken"));
      goto LABEL_19;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion category](self->_completion, "category"));

    completion = self->_completion;
    if (v18)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion category](completion, "category"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayString"));
      goto LABEL_15;
    }
    if (completion)
    {
      IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(completion);
      autocompletePerson = self->_completion;
      if (IsEnabled_SearchAndDiscovery
        || (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(autocompletePerson, "title")),
            v23 = objc_msgSend(v22, "length"),
            v22,
            autocompletePerson = self->_completion,
            !v23))
      {
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(autocompletePerson, "queryLine"));
        goto LABEL_19;
      }
      goto LABEL_31;
    }
    coreRecentContact = self->_coreRecentContact;
    if (coreRecentContact)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact displayName](coreRecentContact, "displayName"));
      v25 = objc_msgSend(v9, "length");
      v26 = self->_coreRecentContact;
      if (v25)
        v8 = (id)objc_claimAutoreleasedReturnValue(-[CRRecentContact displayName](v26, "displayName"));
      else
        v8 = (id)objc_claimAutoreleasedReturnValue(-[CRRecentContact address](v26, "address"));
      goto LABEL_15;
    }
    address = self->_address;
    if (address)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](address, "compositeName"));
      goto LABEL_19;
    }
    autocompletePerson = self->_autocompletePerson;
    if (autocompletePerson)
    {
LABEL_31:
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(autocompletePerson, "title"));
      goto LABEL_19;
    }
    findMyHandle = self->_findMyHandle;
    if (findMyHandle)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[MapsFindMyHandle displayName](findMyHandle, "displayName"));
      goto LABEL_19;
    }
    historyItem = self->_historyItem;
    if (historyItem)
    {
      v30 = historyItem;
      v31 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
      v32 = objc_opt_class(HistoryEntryRecentsItem);
      v33 = v30;
      if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      if (v35
        && (v36 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v35, "historyEntry")),
            v37 = objc_msgSend(v36, "conformsToProtocol:", v31),
            v36,
            v37))
      {
        v38 = v33;
      }
      else
      {
        v38 = 0;
      }

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v38, "historyEntry"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "query"));

        return v10;
      }
      v41 = self->_historyItem;
      v42 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      v43 = objc_opt_class(HistoryEntryRecentsItem);
      v44 = v41;
      if ((objc_opt_isKindOfClass(v44, v43) & 1) != 0)
        v45 = v44;
      else
        v45 = 0;
      v46 = v45;

      if (v46
        && (v47 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v46, "historyEntry")),
            v48 = objc_msgSend(v47, "conformsToProtocol:", v42),
            v47,
            v48))
      {
        v49 = v44;
      }
      else
      {
        v49 = 0;
      }

      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v49, "historyEntry"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "geoMapItem"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "name"));

        return v10;
      }
LABEL_72:
      searchString = self->_searchString;
      goto LABEL_73;
    }
    externalURLQuery = self->_externalURLQuery;
    if (externalURLQuery)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[ExternalURLQuery query](externalURLQuery, "query"));
      goto LABEL_19;
    }
    searchString = self->_addressString;
    if (!searchString)
    {
      childPlace = self->_childPlace;
      if (childPlace)
        goto LABEL_65;
      if (!self->_mapKitHandle)
      {
        childPlace = self->_composedWaypoint;
        if (!childPlace)
        {
          routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
          if (routePlanningWaypointRequest)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointPlaceholder](routePlanningWaypointRequest, "waypointPlaceholder"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
            v16 = v55;
            if (!v55)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](self->_routePlanningWaypointRequest, "waypointRequest"));
              v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "waypointName"));

              goto LABEL_25;
            }
            v17 = v55;
LABEL_24:
            v10 = v17;
LABEL_25:

            goto LABEL_16;
          }
          goto LABEL_72;
        }
LABEL_65:
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEOMapItemChildPlace name](childPlace, "name"));
        goto LABEL_19;
      }
      searchString = self->_mapKitHandleTitle;
    }
LABEL_73:
    v6 = searchString;
    goto LABEL_19;
  }
  if (-[SearchResult behavesAsAtom](searchResult, "behavesAsAtom"))
  {
    v4 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
    if ((objc_msgSend(v7, "_hasTransitDisplayName") & 1) != 0)
      v4 = 0;
    else
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self->_searchResult, "singleLineAddress"));

  }
  if (!objc_msgSend(v4, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](self->_searchResult, "title"));

    if (objc_msgSend(v9, "length"))
    {
      v8 = v9;
      goto LABEL_14;
    }
    v13 = sub_1006618BC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_searchResult;
      v57 = 138412290;
      v58 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to generate search string from search result: %@", (uint8_t *)&v57, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SearchFieldItem_UnknownLocation"), CFSTR("localized string not found"), 0));
    goto LABEL_24;
  }
  v8 = v4;
LABEL_14:
  v9 = v8;
LABEL_15:
  v10 = (NSString *)v8;
LABEL_16:

  return v10;
}

- (NSString)personalizedAddressName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchString](self, "searchString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    v3 = (void *)v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "meCardHomeAddress"));

    if (v9 == v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("Home");
      goto LABEL_10;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "meCardWorkAddress"));

    if (v12 == v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("Work");
      goto LABEL_10;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "meCardSchoolAddress"));

    if (v15 == v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("School");
LABEL_10:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, CFSTR("localized string not found"), 0));

      v3 = (void *)v21;
    }
  }
  return (NSString *)v3;
}

- (BOOL)behavesAsAtom
{
  BOOL v3;
  HistoryEntryRecentsItem *v5;
  __objc2_prot *v6;
  uint64_t v7;
  HistoryEntryRecentsItem *v8;
  HistoryEntryRecentsItem *v9;
  HistoryEntryRecentsItem *v10;
  void *v11;
  unsigned int v12;
  HistoryEntryRecentsItem *v13;

  if (-[SearchResult behavesAsAtom](self->_searchResult, "behavesAsAtom")
    || self->_searchCategory
    || self->_address
    || self->_coreRecentContact)
  {
    return 1;
  }
  v5 = self->_historyItem;
  v6 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  v7 = objc_opt_class(HistoryEntryRecentsItem);
  v8 = v5;
  if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v10, "historyEntry")),
        v12 = objc_msgSend(v11, "conformsToProtocol:", v6),
        v11,
        v12))
  {
    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  if (v13)
    v3 = 1;
  else
    v3 = self->_routePlanningWaypointRequest != 0;

  return v3;
}

- (GEOComposedWaypointEVStop)evStopWaypoint
{
  void *v2;
  uint64_t v3;
  void *v4;
  GEOComposedWaypointEVStop *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
  v3 = objc_opt_class(GEOComposedWaypointEVStop);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (GEOSpotlightSearchPunchIn)punchInDetails
{
  return self->_punchInDetails;
}

- (BOOL)isSpotlightSearch
{
  return self->_punchInDetails != 0;
}

- (NSString)description
{
  SearchFieldItem *v2;
  id v3;
  void ***v4;
  SearchFieldItem *v5;
  SearchFieldItem *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100664060;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[SearchFieldItem _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  SearchFieldItem *v2;
  id v3;
  void ***v4;
  SearchFieldItem *v5;
  SearchFieldItem *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1006641E0;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[SearchFieldItem _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem title](self, "title"));
  (*((void (**)(id, const __CFString *, void *))a3 + 2))(v5, CFSTR("title"), v6);

  (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(v5, CFSTR("searchString"), self->_searchString);
  (*((void (**)(id, const __CFString *, SearchResult *))a3 + 2))(v5, CFSTR("searchResult"), self->_searchResult);
  (*((void (**)(id, const __CFString *, MKLocalSearchCompletion *))a3 + 2))(v5, CFSTR("completion"), self->_completion);
  (*((void (**)(id, const __CFString *, AddressBookAddress *))a3 + 2))(v5, CFSTR("addressBookAddress"), self->_address);
  (*((void (**)(id, const __CFString *, GEOSearchCategory *))a3 + 2))(v5, CFSTR("searchCategory"), self->_searchCategory);
  (*((void (**)(id, const __CFString *, VenueCategoryItem *))a3 + 2))(v5, CFSTR("venueCategoryItem"), self->_venueCategoryItem);
  (*((void (**)(id, const __CFString *, PlaceCategoryItem *))a3 + 2))(v5, CFSTR("placeCategoryItem"), self->_placeCategoryItem);
  (*((void (**)(id, const __CFString *, HistoryEntryRecentsItem *))a3 + 2))(v5, CFSTR("historyItem"), self->_historyItem);
  (*((void (**)(id, const __CFString *, CRRecentContact *))a3 + 2))(v5, CFSTR("coreRecentContact"), self->_coreRecentContact);
  (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(v5, CFSTR("addressString"), self->_addressString);
  (*((void (**)(id, const __CFString *, GEOMapItemChildPlace *))a3 + 2))(v5, CFSTR("childPlace"), self->_childPlace);
  (*((void (**)(id, const __CFString *, RoutePlanningWaypointRequest *))a3 + 2))(v5, CFSTR("routePlanningWaypointRequest"), self->_routePlanningWaypointRequest);
  (*((void (**)(id, const __CFString *, GEORelatedSearchSuggestion *))a3 + 2))(v5, CFSTR("suggestion"), self->_suggestion);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint shortDescription](self->_composedWaypoint, "shortDescription"));
  (*((void (**)(id, const __CFString *, void *))a3 + 2))(v5, CFSTR("composedWaypoint"), v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsAutocompletePerson description](self->_autocompletePerson, "description"));
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v5, CFSTR("autocompletePerson"), v8);

}

- (DirectionsWaypoint)waypoint
{
  DirectionsWaypoint *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SearchResult *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(DirectionsWaypoint);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));

    if (v7)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
      -[DirectionsWaypoint setRequestAddress:](v3, "setRequestAddress:", v5);
      goto LABEL_18;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem coreRecentContact](self, "coreRecentContact"));

    if (v8)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem coreRecentContact](self, "coreRecentContact"));
      v9 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
      -[DirectionsWaypoint setRequestSearchString:](v3, "setRequestSearchString:", v9);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));

      if (v10)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));
        -[DirectionsWaypoint setCompletion:](v3, "setCompletion:", v5);
        goto LABEL_18;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem externalURLQuery](self, "externalURLQuery"));

      if (v11)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem externalURLQuery](self, "externalURLQuery"));
        -[DirectionsWaypoint setExternalURLQuery:](v3, "setExternalURLQuery:", v5);
        goto LABEL_18;
      }
      v12 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));
      if (!v12)
        goto LABEL_17;
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waypointRequest"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapItemForLocationComparison"));

      if (!v16)
      {
LABEL_17:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchString](self, "searchString"));
        -[DirectionsWaypoint setRequestSearchString:](v3, "setRequestSearchString:", v19);

        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completedQuery](self, "completedQuery"));
        -[DirectionsWaypoint setSuggestionsPrefix:](v3, "setSuggestionsPrefix:", v5);
        goto LABEL_18;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem routePlanningWaypointRequest](self, "routePlanningWaypointRequest"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "waypointRequest"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapItemForLocationComparison"));

      v9 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v5);
      -[DirectionsWaypoint setRequestSearch:](v3, "setRequestSearch:", v9);
    }

    goto LABEL_18;
  }
  v5 = v4;
  if (objc_msgSend(v4, "type") == 4)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));

    v5 = (void *)v6;
  }
  -[DirectionsWaypoint setRequestSearch:](v3, "setRequestSearch:", v5);
LABEL_18:

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](self, "composedWaypoint"));
    -[DirectionsWaypoint updateFromGEOComposedWaypoint:](v3, "updateFromGEOComposedWaypoint:", v21);

  }
  return v3;
}

- (DirectionsWaypoint)personalizedDirectionsWaypoint
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem mapItemIfGeocoded](self, "mapItemIfGeocoded"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem waypoint](self, "waypoint"));
  else
    v4 = 0;
  return (DirectionsWaypoint *)v4;
}

- (BOOL)matchesWaypoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));

  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));

    if (v11)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestAddress"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem coreRecentContact](self, "coreRecentContact"));

      if (v14)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem coreRecentContact](self, "coreRecentContact"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "address"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestSearchString"));
        v10 = objc_msgSend(v7, "isEqualToString:", v9);
        goto LABEL_12;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));

      if (!v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem externalURLQuery](self, "externalURLQuery"));

        if (!v17)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchString](self, "searchString"));
          if (!objc_msgSend(v6, "length"))
          {
            v8 = 0;
            goto LABEL_15;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completedQuery](self, "completedQuery"));

          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestSearchString"));
          v19 = objc_msgSend(v6, "isEqualToString:", v7);
          if (v18)
          {
            if (v19)
            {
              v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completedQuery](self, "completedQuery"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionsPrefix"));
              v8 = objc_msgSend(v9, "isEqualToString:", v20);

              goto LABEL_13;
            }
          }
          else if (v19)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionsPrefix"));
            v8 = v9 == 0;
            goto LABEL_13;
          }
          v8 = 0;
          goto LABEL_14;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem externalURLQuery](self, "externalURLQuery"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "externalURLQuery"));
        v13 = objc_msgSend(v6, "isEqualToExternalURLQuery:", v7);
        goto LABEL_8;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](self, "completion"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
    }
    v7 = (void *)v12;
    v13 = objc_msgSend(v6, "isEqual:", v12);
LABEL_8:
    v8 = v13;
    goto LABEL_14;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestSearch"));
  v8 = 1;
  if ((objc_msgSend(v6, "isEqualToSearchResult:forPurpose:", v7, 1) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
    if (!objc_msgSend(v9, "isDynamicCurrentLocation"))
    {
      v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v10 = objc_msgSend(v4, "isDynamicCurrentLocation");
LABEL_12:
    v8 = v10;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  return v8;
}

- (MKMapItem)mapItemIfGeocoded
{
  id v2;
  void *v3;
  void *v4;
  SearchFieldItem *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  id *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  CLLocationCoordinate2D v32;

  v5 = self;
  v26 = 0;
  v27 = (id *)&v26;
  v28 = 0x3032000000;
  v29 = sub_100660834;
  v30 = sub_100660844;
  v31 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](v5, "searchResult"));
    v8 = objc_msgSend(v7, "isDynamicCurrentLocation");
    if (v8)
    {
      v2 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      if (objc_msgSend(v2, "hasLocation"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation"));
        v10 = v8;
      }
      else
      {
        v10 = 0;
        v9 = 0;
      }
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](v5, "searchResult"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v10 = 0;
    }
    objc_storeStrong(v27 + 5, v9);
    if ((v8 & 1) == 0)
    {

    }
    if (v10)

    if ((v8 & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem historyItem](v5, "historyItem"));

  if (v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem historyItem](v5, "historyItem"));
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "historyEntry"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100662AA4;
    v25[3] = &unk_1011BF230;
    v25[4] = &v26;
    objc_msgSend(v2, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, 0, v25, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](v5, "address"));

    if (v12)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](v5, "address"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geocodedMapItem"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem coreRecentContact](v5, "coreRecentContact"));

      if (v14)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
        v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchFieldItem coreRecentContact](v5, "coreRecentContact"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedMapItemForContactID:", objc_msgSend(v2, "contactID")));
        v16 = v27[5];
        v27[5] = (id)v15;

        goto LABEL_20;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](v5, "completion"));

      if (!v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](v5, "composedWaypoint"));

        if (!v22)
          goto LABEL_22;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](v5, "composedWaypoint"));
        v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
        if (v2)
        {
          v23 = objc_alloc((Class)MKMapItem);
          v5 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem composedWaypoint](v5, "composedWaypoint"));
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem geoMapItem](v5, "geoMapItem"));
          v24 = objc_msgSend(v23, "initWithGeoMapItem:isPlaceHolderPlace:", v3, 0);
        }
        else
        {
          v24 = 0;
        }
        objc_storeStrong(v27 + 5, v24);
        if (v2)
        {

        }
        goto LABEL_20;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem completion](v5, "completion"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    }
    v2 = v27[5];
    v27[5] = (id)v13;
  }
LABEL_20:

LABEL_21:
LABEL_22:
  v17 = v27[5];
  if (v17 && (objc_msgSend(v17, "_coordinate"), CLLocationCoordinate2DIsValid(v32)))
    v18 = v27[5];
  else
    v18 = 0;
  v19 = v18;
  _Block_object_dispose(&v26, 8);

  return (MKMapItem *)v19;
}

+ (SearchFieldItem)searchFieldItemWithObject:(id)a3
{
  return (SearchFieldItem *)objc_msgSend(a1, "searchFieldItemWithObject:expandRecentsItem:preserveContact:", a3, 0, 0);
}

+ (SearchFieldItem)searchFieldItemWithObject:(id)a3 expandRecentsItem:(BOOL)a4 preserveContact:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  SearchResult *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  SearchResult *v40;
  id v41;
  NSObject *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  char *v47;
  id v48;
  NSObject *v49;
  char *v50;
  id v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  char *v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  uint64_t v60;
  id *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  SearchFieldItem *v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  const char *v73;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (!v8)
  {
    v10 = 0;
    goto LABEL_18;
  }
  v9 = objc_opt_class(SearchFieldItem);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v60 = 0;
    v61 = (id *)&v60;
    v62 = 0x3032000000;
    v63 = sub_100660834;
    v64 = sub_100660844;
    v65 = objc_alloc_init(SearchFieldItem);
    v11 = objc_opt_class(GEOSearchCategory);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      objc_msgSend(v61[5], "setSearchCategory:", v8);
    }
    else
    {
      v12 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
      {
        objc_msgSend(v61[5], "setSearchResult:", v8);
      }
      else
      {
        v13 = objc_opt_class(MKLocalSearchCompletion);
        if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
        {
          objc_msgSend(v61[5], "setCompletion:", v8);
        }
        else
        {
          v14 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
          if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
          {
            objc_msgSend(v61[5], "setAutocompletePerson:", v8);
          }
          else
          {
            v15 = objc_opt_class(_TtC4Maps16MapsFindMyHandle);
            if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
            {
              objc_msgSend(v61[5], "setFindMyHandle:", v8);
            }
            else
            {
              v16 = objc_opt_class(AddressBookAddress);
              if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
              {
                objc_msgSend(v61[5], "setAddress:", v8);
              }
              else
              {
                v18 = objc_opt_class(HistoryEntryRecentsItem);
                if ((objc_opt_isKindOfClass(v8, v18) & 1) != 0)
                {
                  if (v6)
                  {
                    v19 = v8;
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry"));
                    v59[1] = 3221225472;
                    v59[2] = sub_100663424;
                    v59[3] = &unk_1011BF258;
                    v59[4] = &v60;
                    v57[4] = &v60;
                    v58[0] = _NSConcreteStackBlock;
                    v58[1] = 3221225472;
                    v58[2] = sub_100663470;
                    v58[3] = &unk_1011BAC00;
                    v58[4] = &v60;
                    v59[0] = _NSConcreteStackBlock;
                    v57[0] = _NSConcreteStackBlock;
                    v57[1] = 3221225472;
                    v57[2] = sub_100663484;
                    v57[3] = &unk_1011BF230;
                    objc_msgSend(v20, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v59, v58, v57, 0);

                  }
                  else
                  {
                    objc_msgSend(v61[5], "setHistoryItem:", v8);
                  }
                  goto LABEL_17;
                }
                v21 = objc_opt_class(CRRecentContact);
                if ((objc_opt_isKindOfClass(v8, v21) & 1) != 0)
                {
                  if (v5)
                  {
                    objc_msgSend(v61[5], "setCoreRecentContact:", v8);
                  }
                  else
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "address"));
                    objc_msgSend(v61[5], "setAddressString:", v24);

                  }
                  goto LABEL_17;
                }
                v22 = objc_opt_class(CoreRoutineHistoryItem);
                if ((objc_opt_isKindOfClass(v8, v22) & 1) != 0)
                {
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchResult"));
                  objc_msgSend(v61[5], "setSearchResult:", v23);

                }
                else
                {
                  v25 = objc_opt_class(VenueCategoryItem);
                  if ((objc_opt_isKindOfClass(v8, v25) & 1) != 0)
                  {
                    objc_msgSend(v61[5], "setVenueCategoryItem:", v8);
                  }
                  else
                  {
                    v26 = objc_opt_class(PlaceCategoryItem);
                    if ((objc_opt_isKindOfClass(v8, v26) & 1) != 0)
                    {
                      objc_msgSend(v61[5], "setPlaceCategoryItem:", v8);
                    }
                    else
                    {
                      v27 = objc_opt_class(GEOMapItemChildPlace);
                      if ((objc_opt_isKindOfClass(v8, v27) & 1) != 0)
                      {
                        objc_msgSend(v61[5], "setChildPlace:", v8);
                      }
                      else
                      {
                        v28 = objc_opt_class(RoutePlanningWaypointRequest);
                        if ((objc_opt_isKindOfClass(v8, v28) & 1) != 0)
                        {
                          objc_msgSend(v61[5], "setRoutePlanningWaypointRequest:", v8);
                        }
                        else
                        {
                          v29 = objc_opt_class(GEORelatedSearchSuggestion);
                          if ((objc_opt_isKindOfClass(v8, v29) & 1) != 0)
                          {
                            objc_msgSend(v61[5], "setSuggestion:", v8);
                          }
                          else if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___GEOMapItem))
                          {
                            v30 = -[SearchResult initWithGEOMapItem:]([SearchResult alloc], "initWithGEOMapItem:", v8);
                            objc_msgSend(v61[5], "setSearchResult:", v30);

                          }
                          else
                          {
                            v31 = objc_opt_class(SearchFieldItem);
                            if ((objc_opt_isKindOfClass(v8, v31) & 1) != 0)
                            {
                              objc_storeStrong(v61 + 5, a3);
                            }
                            else
                            {
                              v32 = objc_opt_class(DirectionsWaypoint);
                              if ((objc_opt_isKindOfClass(v8, v32) & 1) == 0)
                              {
                                v34 = objc_opt_class(GEOComposedWaypoint);
                                if ((objc_opt_isKindOfClass(v8, v34) & 1) != 0)
                                {
                                  v35 = v8;
                                  if (objc_msgSend(v35, "isCurrentLocation"))
                                  {
                                    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
                                    objc_msgSend(v61[5], "setSearchResult:", v36);

                                  }
                                  else
                                  {
                                    objc_msgSend(v61[5], "setComposedWaypoint:", v35);
                                  }
                                }
                                else
                                {
                                  v37 = objc_opt_class(NSString);
                                  if ((objc_opt_isKindOfClass(v8, v37) & 1) != 0)
                                  {
                                    objc_msgSend(v61[5], "setSearchString:", v8);
                                    goto LABEL_17;
                                  }
                                  v38 = objc_opt_class(MapsSuggestionsEntry);
                                  if ((objc_opt_isKindOfClass(v8, v38) & 1) == 0)
                                  {
                                    v41 = sub_1004318FC();
                                    v42 = objc_claimAutoreleasedReturnValue(v41);
                                    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                                    {
                                      if (v6)
                                        v43 = CFSTR("YES");
                                      else
                                        v43 = CFSTR("NO");
                                      v44 = v43;
                                      if (v5)
                                        v45 = CFSTR("YES");
                                      else
                                        v45 = CFSTR("NO");
                                      v46 = v45;
                                      v47 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to create item from object (expand recents: %@, preserve contact: %@): %@"), v44, v46, v8));
                                      *(_DWORD *)buf = 136315906;
                                      v67 = "+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:]";
                                      v68 = 2080;
                                      v69 = "SearchFieldItem.m";
                                      v70 = 1024;
                                      v71 = 966;
                                      v72 = 2112;
                                      v73 = v47;
                                      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

                                    }
                                    if (sub_100A70734())
                                    {
                                      v48 = sub_1004318FC();
                                      v49 = objc_claimAutoreleasedReturnValue(v48);
                                      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                                      {
                                        v50 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                                        *(_DWORD *)buf = 138412290;
                                        v67 = v50;
                                        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                                      }
                                    }
                                    v51 = v61[5];
                                    v61[5] = 0;

                                    goto LABEL_17;
                                  }
                                  v35 = v8;
                                  if (objc_msgSend(v35, "type") == (id)24)
                                  {
                                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "findMyWaypoint"));
                                    if (!v39)
                                    {
                                      v52 = sub_1004318FC();
                                      v53 = objc_claimAutoreleasedReturnValue(v52);
                                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                                      {
                                        *(_DWORD *)buf = 136315906;
                                        v67 = "+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:]";
                                        v68 = 2080;
                                        v69 = "SearchFieldItem.m";
                                        v70 = 1024;
                                        v71 = 961;
                                        v72 = 2080;
                                        v73 = "waypoint != nil";
                                        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
                                      }

                                      if (sub_100A70734())
                                      {
                                        v54 = sub_1004318FC();
                                        v55 = objc_claimAutoreleasedReturnValue(v54);
                                        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                                        {
                                          v56 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                                          *(_DWORD *)buf = 138412290;
                                          v67 = v56;
                                          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                                        }
                                      }
                                    }
                                    v40 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v39);
                                    objc_msgSend(v61[5], "setSearchResult:", v40);

                                  }
                                }

                                goto LABEL_17;
                              }
                              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pin"));
                              objc_msgSend(v61[5], "setSearchResult:", v33);

                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_17:
    v10 = v61[5];
    _Block_object_dispose(&v60, 8);

    goto LABEL_18;
  }
  v10 = objc_msgSend(v8, "copy");
LABEL_18:

  return (SearchFieldItem *)v10;
}

+ (SearchFieldItem)searchFieldItemWithWaypointRequest:(id)a3 resolvedWaypoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && !objc_msgSend(v7, "isCurrentLocation"))
  {
    v9 = (id *)objc_alloc_init((Class)a1);
    objc_msgSend(v9, "setRoutePlanningWaypointRequest:", v6);
    objc_storeStrong(v9 + 23, a4);
  }
  else
  {
    v9 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "searchFieldItemWithObject:", v8));
  }

  return (SearchFieldItem *)v9;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (CLLocationCoordinate2D)coordinateHint
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinateHint.latitude;
  longitude = self->_coordinateHint.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinateHint:(CLLocationCoordinate2D)a3
{
  self->_coordinateHint = a3;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (MKLocalSearchCompletion)completion
{
  return self->_completion;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (VenueCategoryItem)venueCategoryItem
{
  return self->_venueCategoryItem;
}

- (PlaceCategoryItem)placeCategoryItem
{
  return self->_placeCategoryItem;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (CRRecentContact)coreRecentContact
{
  return self->_coreRecentContact;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (NSString)addressStringLabel
{
  return self->_addressStringLabel;
}

- (void)setAddressStringLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (GEORelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (ExternalURLQuery)externalURLQuery
{
  return self->_externalURLQuery;
}

- (NSString)externalQueryName
{
  return self->_externalQueryName;
}

- (void)setExternalQueryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (GEOMapItemChildPlace)childPlace
{
  return self->_childPlace;
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (NSString)mapKitHandleTitle
{
  return self->_mapKitHandleTitle;
}

- (void)setMapKitHandleTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (RoutePlanningWaypointRequest)routePlanningWaypointRequest
{
  return self->_routePlanningWaypointRequest;
}

- (GEOComposedWaypoint)composedWaypoint
{
  return self->_composedWaypoint;
}

- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson
{
  return self->_autocompletePerson;
}

- (_TtC4Maps16MapsFindMyHandle)findMyHandle
{
  return self->_findMyHandle;
}

- (NSString)userTypedStringForRAP
{
  return self->_userTypedStringForRAP;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (void)setRetainedSearchMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_userTypedStringForRAP, 0);
  objc_storeStrong((id *)&self->_findMyHandle, 0);
  objc_storeStrong((id *)&self->_autocompletePerson, 0);
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
  objc_storeStrong((id *)&self->_routePlanningWaypointRequest, 0);
  objc_storeStrong((id *)&self->_mapKitHandleTitle, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_childPlace, 0);
  objc_storeStrong((id *)&self->_externalQueryName, 0);
  objc_storeStrong((id *)&self->_externalURLQuery, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_addressStringLabel, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_coreRecentContact, 0);
  objc_storeStrong((id *)&self->_historyItem, 0);
  objc_storeStrong((id *)&self->_placeCategoryItem, 0);
  objc_storeStrong((id *)&self->_venueCategoryItem, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_punchInDetails, 0);
}

+ (id)searchFieldItemsForRouteInSuggestionsEntry:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  SearchFieldItem *v10;
  SearchResult *v11;
  void *v12;
  SearchResult *v13;
  char *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  SearchFieldItem *v21;
  SearchResult *v22;
  id v23;
  NSObject *v24;
  const char *v25;
  id v26;
  SearchResult *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v32;
  int v33;
  id v34;
  __int16 v35;
  char *v36;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    if (objc_msgSend(v3, "containsKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")));
      if (v5)
      {
        v6 = v5;
        v7 = (char *)objc_msgSend(v5, "waypointsCount");
        v8 = (char *)objc_msgSend(v3, "uint64ForKey:", CFSTR("MapsSuggestionsResumeRouteWaypointIndex"));
        if (v8 < v7)
        {
          v9 = v8;
          do
          {
            v10 = objc_alloc_init(SearchFieldItem);
            v11 = [SearchResult alloc];
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypointsAtIndex:", v9));
            v13 = -[SearchResult initWithComposedWaypoint:](v11, "initWithComposedWaypoint:", v12);
            -[SearchFieldItem setSearchResult:](v10, "setSearchResult:", v13);

            objc_msgSend(v4, "addObject:", v10);
            ++v9;
          }
          while (v7 != v9);
        }
        if (!objc_msgSend(v4, "count"))
        {
          v29 = sub_1006618BC();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v33 = 134217984;
            v34 = objc_msgSend(v6, "waypointsCount");
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to extract any items from MSG entry (expected %lu)", (uint8_t *)&v33, 0xCu);
          }

          v26 = 0;
          goto LABEL_28;
        }
        v14 = (char *)objc_msgSend(v4, "count");
        v15 = sub_1006618BC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v14 >= v7)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 134218240;
            v34 = objc_msgSend(v4, "count");
            v35 = 2048;
            v36 = v7;
            v18 = v17;
            v19 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_26;
          }
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v33 = 134218240;
          v34 = objc_msgSend(v4, "count");
          v35 = 2048;
          v36 = v7;
          v18 = v17;
          v19 = OS_LOG_TYPE_ERROR;
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Extracted %lu items from MSG entry (expected %lu)", (uint8_t *)&v33, 0x16u);
        }

        v26 = v4;
        goto LABEL_28;
      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MKMapItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findMyWaypoint"));
    if (v20)
    {
      v21 = objc_alloc_init(SearchFieldItem);
      v22 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v20);
      -[SearchFieldItem setSearchResult:](v21, "setSearchResult:", v22);

      objc_msgSend(v4, "addObject:", v21);
      v23 = sub_1006618BC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        v25 = "Extracted item from findMyWaypoint in MSG entry";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v33, 2u);
      }
    }
    else
    {
      if (!v6)
      {
        v32 = sub_1006618BC();
        v21 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v33) = 0;
          _os_log_impl((void *)&_mh_execute_header, &v21->super, OS_LOG_TYPE_ERROR, "Unable to extract any items from MSG entry (no route storage, no find my info, no map item)", (uint8_t *)&v33, 2u);
        }
        v26 = 0;
        goto LABEL_20;
      }
      v21 = objc_alloc_init(SearchFieldItem);
      v27 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v6);
      -[SearchFieldItem setSearchResult:](v21, "setSearchResult:", v27);

      objc_msgSend(v4, "addObject:", v21);
      v28 = sub_1006618BC();
      v24 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        v25 = "Extracted item from MapItem in MSG entry";
        goto LABEL_18;
      }
    }

    v26 = v4;
LABEL_20:

LABEL_28:
    goto LABEL_29;
  }
  v26 = 0;
LABEL_29:

  return v26;
}

+ (id)searchFieldItemsForRouteHistoryEntry:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  id v27;
  id v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[2];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endWaypoint"));
  v5 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    v10 = objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v9));
    v47[0] = v10;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endWaypoint"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v11));
    v47[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));

  }
  else
  {
    IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v7, v8);
    if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
      || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
          (IsEnabled_Maps420 & 1) != 0)
      || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypoints"));
      v16 = sub_10039DCD4(v9, &stru_1011BF298);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v17 = objc_msgSend(v13, "count");
      v18 = objc_msgSend(v9, "count");
      v19 = sub_1006618BC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v10 = v20;
      if (v17 >= v18)
      {
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        v27 = objc_msgSend(v13, "count");
        v28 = objc_msgSend(v9, "count");
        v29 = sub_10039DCD4(v13, &stru_1011BF2F8);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 134218499;
        v42 = v27;
        v43 = 2048;
        v44 = v28;
        v45 = 2113;
        v46 = v24;
        v25 = v10;
        v26 = OS_LOG_TYPE_DEFAULT;
      }
      else
      {
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v21 = objc_msgSend(v13, "count");
        v22 = objc_msgSend(v9, "count");
        v23 = sub_10039DCD4(v13, &stru_1011BF2D8);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 134218499;
        v42 = v21;
        v43 = 2048;
        v44 = v22;
        v45 = 2113;
        v46 = v24;
        v25 = v10;
        v26 = OS_LOG_TYPE_ERROR;
      }
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Extracted %lu items from history entry (expected %lu): %{private}@", buf, 0x20u);

      goto LABEL_13;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startWaypoint"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v31));
    v33 = v32;
    if (v32)
    {
      v9 = v32;
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      v9 = (id)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v34));

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endWaypoint"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v35));
    v37 = v36;
    if (v36)
    {
      v10 = v36;
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      v10 = objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v38));

    }
    v40[0] = v9;
    v40[1] = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    v39 = sub_1006618BC();
    v11 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Created items from non-MPR history entry: %@", buf, 0xCu);
    }
  }

LABEL_13:
  return v13;
}

- (_TtC4Maps22MapsAutocompletePerson)_maps_autoCompletePerson
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem autocompletePerson](self, "autocompletePerson"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autocompletePerson"));

  }
  return (_TtC4Maps22MapsAutocompletePerson *)v5;
}

- (_TtC4Maps16MapsFindMyHandle)_maps_findMyHandle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem findMyHandle](self, "findMyHandle"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "findMyHandle"));

  }
  return (_TtC4Maps16MapsFindMyHandle *)v5;
}

- (AddressBookAddress)_maps_address
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem address](self, "address"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](self, "searchResult"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "address"));

  }
  return (AddressBookAddress *)v5;
}

- (BOOL)isFindMyPerson
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem _maps_autoCompletePerson](self, "_maps_autoCompletePerson"));
  v4 = objc_claimAutoreleasedReturnValue(-[SearchFieldItem _maps_findMyHandle](self, "_maps_findMyHandle"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handle"));
  v6 = (v5 | v4) != 0;

  return v6;
}

@end
