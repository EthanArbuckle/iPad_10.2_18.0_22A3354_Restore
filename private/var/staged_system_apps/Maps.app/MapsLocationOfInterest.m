@implementation MapsLocationOfInterest

- (MapsLocationOfInterest)init
{

  return 0;
}

- (MapsLocationOfInterest)initWithLocationOfInterestType:(int64_t)a3 mapItem:(id)a4
{
  id v6;
  MapsLocationOfInterest *v7;
  MapsLocationOfInterest *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MapsLocationOfInterest;
  v7 = -[MapsLocationOfInterest init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
    -[MapsLocationOfInterest _updateMapItemWithGeoMapItem:](v8, "_updateMapItemWithGeoMapItem:", v9);

  }
  return v8;
}

- (MapsLocationOfInterest)initWithLocationOfInterest:(id)a3 geoMapItem:(id)a4
{
  id v6;
  id v7;
  MapsLocationOfInterest *v8;
  uint64_t v9;
  NSUUID *identifier;
  uint64_t v11;
  NSString *customLabel;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MapsLocationOfInterest;
  v8 = -[MapsLocationOfInterest init](&v14, "init");
  if (v8)
  {
    v8->_type = (int64_t)objc_msgSend(v6, "type");
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "customLabel"));
    customLabel = v8->_customLabel;
    v8->_customLabel = (NSString *)v11;

    -[MapsLocationOfInterest _updateMapItemWithGeoMapItem:](v8, "_updateMapItemWithGeoMapItem:", v7);
  }

  return v8;
}

- (MapsLocationOfInterest)initWithMapsSuggestionEntry:(id)a3
{
  id v4;
  void *v5;
  MapsLocationOfInterest *v6;
  id v7;
  uint64_t v8;
  MapsLocationOfInterest *v9;
  id v10;
  void *v11;
  NSUUID *v12;
  NSUUID *identifier;
  uint64_t v14;
  NSString *customLabel;
  objc_super v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MKMapItem"));
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsLocationOfInterest;
    v6 = -[MapsLocationOfInterest init](&v17, "init");
    if (v6)
    {
      v7 = objc_msgSend(v4, "type");
      if (v7 == (id)1)
      {
        v8 = 0;
      }
      else if (v7 == (id)19)
      {
        v8 = 2;
      }
      else if (v7 == (id)2)
      {
        v8 = 1;
      }
      else
      {
        v8 = -1;
      }
      v6->_type = v8;
      v10 = objc_alloc((Class)NSUUID);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
      v12 = (NSUUID *)objc_msgSend(v10, "initWithUUIDString:", v11);
      identifier = v6->_identifier;
      v6->_identifier = v12;

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel")));
      customLabel = v6->_customLabel;
      v6->_customLabel = (NSString *)v14;

      objc_storeStrong((id *)&v6->_mapItem, v5);
      -[MapsLocationOfInterest _updateMapItemName](v6, "_updateMapItemName");
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MapsLocationOfInterest)initWithMapsFavoriteItem:(id)a3
{
  id v4;
  void *v5;
  MapsLocationOfInterest *v6;
  unint64_t v7;
  int64_t v8;
  MapsLocationOfInterest *v9;
  id v10;
  void *v11;
  NSUUID *v12;
  NSUUID *identifier;
  uint64_t v14;
  NSString *customLabel;
  objc_super v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mkMapItem"));
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsLocationOfInterest;
    v6 = -[MapsLocationOfInterest init](&v17, "init");
    if (v6)
    {
      v7 = (unint64_t)objc_msgSend(v4, "type");
      if (v7 > 6)
        v8 = 0;
      else
        v8 = qword_100E3C0E0[v7];
      v6->_type = v8;
      v10 = objc_alloc((Class)NSUUID);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v12 = (NSUUID *)objc_msgSend(v10, "initWithUUIDString:", v11);
      identifier = v6->_identifier;
      v6->_identifier = v12;

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customName"));
      customLabel = v6->_customLabel;
      v6->_customLabel = (NSString *)v14;

      objc_storeStrong((id *)&v6->_mapItem, v5);
      -[MapsLocationOfInterest _updateMapItemName](v6, "_updateMapItemName");
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateMapItemName
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  -[MapsLocationOfInterest _updateMapItemWithGeoMapItem:](self, "_updateMapItemWithGeoMapItem:", v3);

}

- (void)_updateMapItemWithGeoMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSUUID *identifier;
  void *v14;
  void *v15;
  void *v16;
  unint64_t type;
  uint64_t v18;
  void *v19;
  void *v20;
  MKMapItem *v21;
  MKMapItem *mapItem;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *originalName;
  id v27;
  id v28;

  v4 = a3;
  if (v4)
  {
    v27 = v4;
    -[MapsLocationOfInterest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_clientAttributes"));

    if (v5)
    {
      v6 = v27;
    }
    else
    {
      v7 = objc_alloc_init((Class)GEOMapItemClientAttributes);
      v8 = objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v27, v7));

      v6 = (void *)v8;
    }
    v28 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_clientAttributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routineAttributes"));

    if (!v10)
    {
      v11 = objc_alloc_init((Class)GEOMapItemRoutineAttributes);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_clientAttributes"));
      objc_msgSend(v12, "setRoutineAttributes:", v11);

    }
    identifier = self->_identifier;
    v14 = v28;
    if (identifier)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_clientAttributes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routineAttributes"));
      objc_msgSend(v16, "setLoiIdentifier:", identifier);

      v14 = v28;
    }
    type = self->_type;
    if (type < 4)
      v18 = (type + 1);
    else
      v18 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_clientAttributes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routineAttributes"));
    objc_msgSend(v20, "setLoiType:", v18);

    v21 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v28, 0);
    mapItem = self->_mapItem;
    self->_mapItem = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest name](self, "name"));
    if (v23)
    {
      -[MapsLocationOfInterest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
      v25 = (NSString *)objc_msgSend(v24, "copy");
      originalName = self->_originalName;
      self->_originalName = v25;

      -[MKMapItem setName:](self->_mapItem, "setName:", v23);
      -[MapsLocationOfInterest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
    }
    -[MapsLocationOfInterest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mapItem"));

  }
}

- (NSString)name
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v3 = -[MapsLocationOfInterest type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest customLabel](self, "customLabel"));
  v5 = MapsSuggestionsRoutineLocalizedLabelLOIType(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "length"))
    v7 = v6;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
  v8 = v7;

  return (NSString *)v8;
}

+ (void)fetchLocationOfInterestWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10083E50C;
    v9[3] = &unk_1011D8C78;
    v10 = v5;
    v11 = v7;
    objc_msgSend(v8, "fetchLocationOfInterestWithIdentifier:withHandler:", v10, v9);

  }
}

- (BOOL)isFrequentLocation
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest identifier](self, "identifier"));
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](self, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: name='%@', mapItem='%@', loi=%@>"), v3, self, v4, v6, v7));

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (void)setCustomLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customLabel, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
