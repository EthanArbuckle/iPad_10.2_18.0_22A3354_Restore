@implementation DirectionsHomeHistoryItem

- (DirectionsHomeHistoryItem)init
{
  DirectionsHomeHistoryItem *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DirectionsHomeHistoryItem;
  v2 = -[DirectionsHomeHistoryItem init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[DirectionsHomeHistoryItem setCurrentLocation:](v2, "setCurrentLocation:", v3);

  }
  return v2;
}

- (AddressBookAddress)homeAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "meCardHomeAddress"));

  return (AddressBookAddress *)v3;
}

- (double)timestamp
{
  return 0.0;
}

- (SearchResult)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Home [Address Book label]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v4, "setFirstLine:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsHomeHistoryItem homeAddress](self, "homeAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleLineAddress"));
  objc_msgSend(v4, "setSecondLine:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsHomeHistoryItem homeAddress](self, "homeAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geocodedMapItem"));
  objc_msgSend(v4, "setMapItem:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  if (v11)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsHomeHistoryItem homeAddress](self, "homeAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geocodingError"));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsHomeHistoryItem homeAddress](self, "homeAddress"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10049EC90;
      v15[3] = &unk_1011AF308;
      v16 = v4;
      objc_msgSend(v14, "forwardGeocodeAddress:", v15);

    }
  }
  objc_msgSend(v4, "setDebugSubtitle:", CFSTR("[Home]"));

}

- (id)entryWithTicket:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Home [Address Book label]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v4, "safeAddDisplayLine:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsHomeHistoryItem currentLocation](self, "currentLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  objc_msgSend(v4, "safeAddDisplayLine:", v9);

  return v4;
}

@end
