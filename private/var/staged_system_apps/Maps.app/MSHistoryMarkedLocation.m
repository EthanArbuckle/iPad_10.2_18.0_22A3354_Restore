@implementation MSHistoryMarkedLocation

- (MSHistoryMarkedLocation)initWithDroppedPin:(id)a3
{
  id v4;
  MSHistoryMarkedLocation *v5;
  MSHistoryMarkedLocation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSHistoryMarkedLocation;
  v5 = -[MSHistoryMarkedLocation init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MSHistoryMarkedLocation updateWithDroppedPin:](v5, "updateWithDroppedPin:", v4);

  return v6;
}

- (MSHistoryMarkedLocation)initWithSearchResult:(id)a3
{
  id v4;
  MSHistoryMarkedLocation *v5;
  MSHistoryMarkedLocation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSHistoryMarkedLocation;
  v5 = -[MSHistoryMarkedLocation init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MSHistoryMarkedLocation updateWithSearchResult:](v5, "updateWithSearchResult:", v4);

  return v6;
}

- (id)droppedPin
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init((Class)MSPDroppedPin);
  v4 = objc_alloc_init((Class)GEOLatLng);
  objc_msgSend(v3, "setLatLng:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation latitude](self, "latitude"));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "latLng"));
  objc_msgSend(v8, "setLat:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation longitude](self, "longitude"));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "latLng"));
  objc_msgSend(v12, "setLng:", v11);

  objc_msgSend(v3, "setFloorOrdinal:", -[MSHistoryMarkedLocation floorOrdinal](self, "floorOrdinal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation createTime](self, "createTime"));
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");

  return v3;
}

- (void)updateWithDroppedPin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
  objc_msgSend(v5, "lat");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[MSHistoryMarkedLocation setLatitude:](self, "setLatitude:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
  objc_msgSend(v7, "lng");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[MSHistoryMarkedLocation setLongitude:](self, "setLongitude:", v8);

  v9 = objc_msgSend(v4, "floorOrdinal");
  -[MSHistoryMarkedLocation setFloorOrdinal:](self, "setFloorOrdinal:", v9);
}

- (void)updateWithSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  -[MSHistoryMarkedLocation setCustomName:](self, "setCustomName:", v5);

  -[MSHistoryMarkedLocation setFloorOrdinal:](self, "setFloorOrdinal:", objc_msgSend(v4, "floorOrdinal"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v6));
  -[MSHistoryMarkedLocation setMapItemStorage:](self, "setMapItemStorage:", v7);

}

- (BOOL)isEqualToSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v17;
  void *v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation customName](self, "customName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation latitude](self, "latitude"));
      objc_msgSend(v4, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      if (objc_msgSend(v7, "isEqualToNumber:", v8))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation longitude](self, "longitude"));
        objc_msgSend(v4, "coordinate");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
        if (objc_msgSend(v9, "isEqualToNumber:", v11)
          && (v12 = -[MSHistoryMarkedLocation floorOrdinal](self, "floorOrdinal"),
              v12 == objc_msgSend(v4, "floorOrdinal")))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation muid](self, "muid"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_geoMapItem"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "_muid")));
          v15 = objc_msgSend(v17, "isEqualToNumber:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqualToMarkedLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation customName](self, "customName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customName"));
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation latitude](self, "latitude"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latitude"));
      if (objc_msgSend(v7, "isEqualToNumber:", v8))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation longitude](self, "longitude"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "longitude"));
        if (objc_msgSend(v9, "isEqualToNumber:", v10)
          && (v11 = -[MSHistoryMarkedLocation floorOrdinal](self, "floorOrdinal"),
              v11 == objc_msgSend(v4, "floorOrdinal")))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMarkedLocation muid](self, "muid"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "muid"));
          v14 = objc_msgSend(v12, "isEqualToNumber:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
