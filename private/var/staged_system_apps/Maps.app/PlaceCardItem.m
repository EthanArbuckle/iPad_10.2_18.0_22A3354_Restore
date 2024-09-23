@implementation PlaceCardItem

- (unint64_t)venueID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem _venueIdentifier](self, "_venueIdentifier"));
  if (objc_msgSend(v3, "_hasVenueID"))
  {
    v4 = objc_msgSend(v3, "venueID");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem personalizedItem](self, "personalizedItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceLabelMarker"));
    v4 = objc_msgSend(v6, "venueID");

  }
  return (unint64_t)v4;
}

- (unint64_t)venueCardID
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
  v3 = objc_msgSend(v2, "_muid");

  return (unint64_t)v3;
}

- (BOOL)isVenueItem
{
  return -[PlaceCardItem venueID](self, "venueID") != 0;
}

- (id)_venueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueIdentifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_venueInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueIdentifier"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_venueInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueIdentifier"));

  }
  return v8;
}

- (PlaceCardItem)init
{

  return 0;
}

- (PlaceCardItem)initWithMapItem:(id)a3
{
  id v5;
  PlaceCardItem *v6;
  PlaceCardItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PlaceCardItem;
  v6 = -[PlaceCardItem init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    if (objc_msgSend(v5, "isCurrentLocation"))
      v7->_isCurrentLocation = 1;
    if (-[MKMapItem _hasResolvablePartialInformation](v7->_mapItem, "_hasResolvablePartialInformation"))
      -[PlaceCardItem setIsIntermediateMapItem:](v7, "setIsIntermediateMapItem:", 1);
  }

  return v7;
}

- (PlaceCardItem)initWithSearchResult:(id)a3
{
  id v5;
  PlaceCardItem *v6;
  uint64_t v7;
  AddressBookAddress *address;
  void *v9;
  void *v10;
  MapsLocationOfInterest *v11;
  MapsLocationOfInterest *locationOfInterest;
  uint64_t v13;
  MapsLocationOfInterest *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PlaceCardItem;
  v6 = -[PlaceCardItem init](&v16, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
    address = v6->_address;
    v6->_address = (AddressBookAddress *)v7;

    objc_storeStrong((id *)&v6->_searchResult, a3);
    v6->_isDroppedPin = objc_msgSend(v5, "type") == 3;
    if (-[SearchResult isDynamicCurrentLocation](v6->_searchResult, "isDynamicCurrentLocation"))
      v6->_isCurrentLocation = 1;
    if (-[SearchResultRepr hasIncompleteMetadata](v6->_searchResult, "hasIncompleteMetadata"))
      v6->_isIntermediateMapItem = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationOfInterest"));
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      locationOfInterest = v6->_locationOfInterest;
      v6->_locationOfInterest = v11;
    }
    else
    {
      locationOfInterest = (MapsLocationOfInterest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
      v13 = objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest locationOfInterest](locationOfInterest, "locationOfInterest"));
      v14 = v6->_locationOfInterest;
      v6->_locationOfInterest = (MapsLocationOfInterest *)v13;

    }
  }

  return v6;
}

- (PlaceCardItem)initWithMapItem:(id)a3 address:(id)a4
{
  id v7;
  PlaceCardItem *v8;
  PlaceCardItem *v9;
  uint64_t v10;
  MapsLocationOfInterest *locationOfInterest;

  v7 = a4;
  v8 = -[PlaceCardItem initWithMapItem:](self, "initWithMapItem:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_address, a4);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locationOfInterest"));
    locationOfInterest = v9->_locationOfInterest;
    v9->_locationOfInterest = (MapsLocationOfInterest *)v10;

  }
  return v9;
}

- (PlaceCardItem)initWithMapItem:(id)a3 chargeStationWaypointInfo:(id)a4
{
  id v7;
  PlaceCardItem *v8;
  PlaceCardItem *v9;

  v7 = a4;
  v8 = -[PlaceCardItem initWithMapItem:](self, "initWithMapItem:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_chargeStationWaypointInfo, a4);

  return v9;
}

- (PlaceCardItem)initWithLocationOfInterest:(id)a3
{
  id v5;
  void *v6;
  PlaceCardItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  AddressBookAddress *address;
  void *v16;
  void *v17;
  uint64_t v18;
  AddressBookAddress *v19;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v7 = -[PlaceCardItem initWithMapItem:](self, "initWithMapItem:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_locationOfInterest, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_clientAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressBookAttributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressIdentifier"));

    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addressForIdentifier:", v12));
      address = v7->_address;
      v7->_address = (AddressBookAddress *)v14;

      if (!v7->_address)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addressObject"));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addressForAddressObject:", v16));
          v19 = v7->_address;
          v7->_address = (AddressBookAddress *)v18;

        }
      }
    }

  }
  return v7;
}

- (PlaceCardItem)initWithPersonalizedItem:(id)a3
{
  id v5;
  void *v6;
  PlaceCardItem *v7;
  uint64_t v8;
  AddressBookAddress *address;
  uint64_t v10;
  SearchResult *searchResult;
  SearchResult *v12;
  BOOL v13;
  uint64_t v14;
  MapsLocationOfInterest *locationOfInterest;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v7 = -[PlaceCardItem initWithMapItem:](self, "initWithMapItem:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_personalizedItem, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
    address = v7->_address;
    v7->_address = (AddressBookAddress *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
    searchResult = v7->_searchResult;
    v7->_searchResult = (SearchResult *)v10;

    v12 = v7->_searchResult;
    if (v12)
      v13 = -[SearchResultRepr type](v12, "type") == 3;
    else
      v13 = 0;
    v7->_isDroppedPin = v13;
    if ((objc_opt_respondsToSelector(v5, "locationOfInterest") & 1) != 0)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationOfInterest"));
      locationOfInterest = v7->_locationOfInterest;
      v7->_locationOfInterest = (MapsLocationOfInterest *)v14;

    }
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingMapItem
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("searchResult"), CFSTR("searchResult.mapItem"), CFSTR("searchResult.reverseGeocoded"), CFSTR("searchResult.failedToReverseGeocode"), CFSTR("address.addressValue"), CFSTR("locationOfInterest.name"), CFSTR("locationOfInterest.mapItem"), 0);
}

- (_MKPlaceItem)placeItem
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));
    v5 = objc_msgSend(v4, "isMeCard");

    if (v5)
      v6 = 40;
    else
      v6 = 32;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contact"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ContactPlaceItem placeItemWithMapItem:contact:options:](ContactPlaceItem, "placeItemWithMapItem:contact:options:", v7, v9, v6));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressValue"));
    objc_msgSend(v10, "setSelectedAddress:", v12);

    objc_msgSend(v10, "setLocationOfInterest:", self->_locationOfInterest);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));
    objc_msgSend(v10, "setIsMeCard:", objc_msgSend(v13, "isMeCard"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
    objc_msgSend(v10, "setSearchResult:", v14);
  }
  else
  {
    if (self->_isDroppedPin)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
      if ((objc_msgSend(v15, "failedToReverseGeocode") & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
        v16 = objc_msgSend(v22, "hasIncompleteMetadata");

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
      v20 = v14;
      v21 = 2;
      v19 = (_BOOL8)v16;
    }
    else
    {
      if (-[PlaceCardItem isHomeWorkSchoolAddress](self, "isHomeWorkSchoolAddress"))
        v17 = 8;
      else
        v17 = 0;
      v18 = v17 | -[PlaceCardItem isCurrentLocation](self, "isCurrentLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
      v19 = -[PlaceCardItem isIntermediateMapItem](self, "isIntermediateMapItem");
      v20 = v14;
      v21 = v18;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_MKMapItemPlaceItem placeItemWithMapItem:options:isIntermediateMapItem:](_MKMapItemPlaceItem, "placeItemWithMapItem:options:isIntermediateMapItem:", v20, v21, v19));
  }

  return (_MKPlaceItem *)v10;
}

- (RAPPlace)rapPlace
{
  SearchResult *searchResult;
  SearchResult *v3;

  searchResult = self->_searchResult;
  if (searchResult)
    v3 = searchResult;
  else
    v3 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", self->_mapItem);
  return (RAPPlace *)v3;
}

- (MKMapItem)mapItem
{
  void *locationOfInterest;
  MKMapItem *v3;

  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest || (locationOfInterest = self->_searchResult) != 0)
    v3 = (MKMapItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(locationOfInterest, "mapItem"));
  else
    v3 = self->_mapItem;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PlaceCardItem *v4;
  PlaceCardItem *v5;
  uint64_t v6;
  PlaceCardItem *v7;
  BOOL v8;

  v4 = (PlaceCardItem *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_11;
  }
  v6 = objc_opt_class(PlaceCardItem);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = self->_address == v7->_address
      && self->_mapItem == v7->_mapItem
      && self->_searchResult == v7->_searchResult
      && self->_isDroppedPin == v7->_isDroppedPin;

  }
  else
  {
LABEL_9:
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem placeItem](self, "placeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (CNContact)contact
{
  AddressBookAddress *address;
  void *v4;
  void *v5;

  address = self->_address;
  if (address)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](address, "contact"));
  }
  else if (self->_isCurrentLocation)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "meCard"));

  }
  else
  {
    v4 = 0;
  }
  return (CNContact *)v4;
}

- (BOOL)shouldInsertInHistory
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  if (-[PlaceCardItem shouldInsertInHistoryForRAPTrackingOnly](self, "shouldInsertInHistoryForRAPTrackingOnly"))
  {
    LOBYTE(v3) = 1;
  }
  else if (-[PlaceCardItem isCurrentLocation](self, "isCurrentLocation")
         || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem contact](self, "contact")),
             v4,
             v4))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));

    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
      v7 = v6;
      LOBYTE(v3) = !v6 || objc_msgSend(v6, "type") != 3;

    }
  }
  return (char)v3;
}

- (BOOL)shouldInsertInHistoryForRAPTrackingOnly
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[PlaceCardItem isHomeWorkSchoolAddress](self, "isHomeWorkSchoolAddress"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem locationOfInterest](self, "locationOfInterest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v3 = v5 != 0;

  return v3;
}

- (BOOL)isMeCard
{
  AddressBookAddress *address;

  address = self->_address;
  if (address)
    LOBYTE(address) = -[AddressBookAddress isMeCard](address, "isMeCard");
  return (char)address;
}

- (BOOL)canAddToCollections
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if ((v4 & 1) != 0 || -[PlaceCardItem isMeCard](self, "isMeCard"))
    return 0;
  v6 = objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
    v9 = objc_msgSend(v8, "type");

    if (v9 == 3)
      return 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
  v11 = objc_msgSend(v10, "_maps_canAddToCollections");

  return v11;
}

- (NSString)defaultCollectionItemTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));
  if (v3)
  {
    if (-[PlaceCardItem isHomeWorkSchoolAddress](self, "isHomeWorkSchoolAddress"))
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedLabel"));
    else
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "compositeName"));
    v7 = (void *)v4;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
    if (-[PlaceCardItem isDroppedPin](self, "isDroppedPin"))
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_addressFormattedAsName"));
    else
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_defaultCollectionItemTitle"));
    v7 = (void *)v6;

  }
  return (NSString *)v7;
}

- (BOOL)canAddToShortcuts
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v3 = objc_msgSend(v2, "isUsingOfflineMaps");

  return v3 ^ 1;
}

- (BOOL)canAddToLibrary
{
  unsigned int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v4 = objc_msgSend(v3, "isUsingOfflineMaps");

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (BOOL)canAddNote
{
  unsigned int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v4 = objc_msgSend(v3, "isUsingOfflineMaps");

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (BOOL)canShowOpenFindMyAction
{
  int IsEnabled_MapsWally;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally(self);
  if (IsEnabled_MapsWally)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
    v6 = objc_msgSend(v5, "canShowOpenFindMy");

    LOBYTE(IsEnabled_MapsWally) = v6;
  }
  return IsEnabled_MapsWally;
}

- (BOOL)canShowRequestLocation
{
  int IsEnabled_MapsWally;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally(self);
  if (IsEnabled_MapsWally)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self, "searchResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
    v6 = objc_msgSend(v5, "canShowRequestLocation");

    LOBYTE(IsEnabled_MapsWally) = v6;
  }
  return IsEnabled_MapsWally;
}

- (BOOL)isHomeWorkSchoolAddress
{
  void *v3;
  AddressBookAddress *address;
  unsigned __int8 v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest identifier](self->_locationOfInterest, "identifier"));
  if (v3
    && (!-[MapsLocationOfInterest type](self->_locationOfInterest, "type")
     || (id)-[MapsLocationOfInterest type](self->_locationOfInterest, "type") == (id)1
     || (id)-[MapsLocationOfInterest type](self->_locationOfInterest, "type") == (id)2)
    || (address = self->_address) != 0
    && -[AddressBookAddress isHomeWorkSchoolAddress](address, "isHomeWorkSchoolAddress"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
    v5 = objc_msgSend(v6, "_maps_isHomeWorkOrSchool");

  }
  return v5;
}

- (int64_t)addressType
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem locationOfInterest](self, "locationOfInterest"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem locationOfInterest](self, "locationOfInterest"));
    v5 = objc_msgSend(v4, "type");

    return (int64_t)v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem address](self, "address"));
    v8 = objc_msgSend(v7, "addressType");

    if (v8 <= 3)
      return v8 - 1;
    else
      return -1;
  }
}

- (BOOL)shouldShowEditNameAction
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  if (!self->_locationOfInterest)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self, "mapItem"));
  if (objc_msgSend(v3, "_hasMUID") && objc_msgSend(v3, "_muid"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem locationOfInterest](self, "locationOfInterest"));
    v4 = objc_msgSend(v5, "isFrequentLocation");

  }
  return v4;
}

- (NSString)customLabel
{
  return -[MapsLocationOfInterest customLabel](self->_locationOfInterest, "customLabel");
}

- (PersonalizedItem)personalizedItem
{
  return self->_personalizedItem;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)isDroppedPin
{
  return self->_isDroppedPin;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (BOOL)isIntermediateMapItem
{
  return self->_isIntermediateMapItem;
}

- (void)setIsIntermediateMapItem:(BOOL)a3
{
  self->_isIntermediateMapItem = a3;
}

- (GEOMapItemCorrectedLocationAttributes)correctedLocationAttributes
{
  return self->_correctedLocationAttributes;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (VKEVChargeStationRouteWaypoint)chargeStationWaypointInfo
{
  return self->_chargeStationWaypointInfo;
}

- (CGRect)calloutAnchorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_calloutAnchorRect.origin.x;
  y = self->_calloutAnchorRect.origin.y;
  width = self->_calloutAnchorRect.size.width;
  height = self->_calloutAnchorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCalloutAnchorRect:(CGRect)a3
{
  self->_calloutAnchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargeStationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_correctedLocationAttributes, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_personalizedItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
