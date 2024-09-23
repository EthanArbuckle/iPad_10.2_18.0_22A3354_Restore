@implementation RTStateDepictionOneState

- (RTStateDepictionOneState)init
{
  return -[RTStateDepictionOneState initWithLocation:type:typeSource:customLabel:mapItem:](self, "initWithLocation:type:typeSource:customLabel:mapItem:", 0, -1, 0, 0, 0);
}

- (RTStateDepictionOneState)initWithLocation:(id)a3 type:(int64_t)a4 typeSource:(unint64_t)a5 customLabel:(id)a6 mapItem:(id)a7
{
  id v13;
  id v14;
  id v15;
  RTStateDepictionOneState *v16;
  RTStateDepictionOneState *v17;
  NSDate *geocodeDate;
  uint64_t v19;
  NSMutableArray *histEntryExit_s;
  uint64_t v21;
  NSString *customLabel;
  objc_super v24;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RTStateDepictionOneState;
  v16 = -[RTStateDepictionOneState init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_location, a3);
    v17->_type = a4;
    v17->_typeSource = a5;
    objc_storeStrong((id *)&v17->_mapItem, a7);
    geocodeDate = v17->_geocodeDate;
    v17->_geocodeDate = 0;

    v19 = objc_opt_new();
    histEntryExit_s = v17->_histEntryExit_s;
    v17->_histEntryExit_s = (NSMutableArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    customLabel = v17->_customLabel;
    v17->_customLabel = (NSString *)v21;

  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[RTStateDepictionOneState location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("location"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[RTStateDepictionOneState type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[RTStateDepictionOneState typeSource](self, "typeSource"), CFSTR("typeSource2.0"));
  v6 = (void *)MEMORY[0x1E0D271E8];
  -[RTStateDepictionOneState geoMapItem](self, "geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItemStorageForGEOMapItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("mapItem"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[RTStateDepictionOneState mapItemSource](self, "mapItemSource"), CFSTR("mapItemSource"));
  -[RTStateDepictionOneState geocodeDate](self, "geocodeDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("geocodeDate"));

  -[RTStateDepictionOneState histEntryExit_s](self, "histEntryExit_s");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("histEntryExit_s"));

  -[RTStateDepictionOneState customLabel](self, "customLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("customLabel"));

}

- (RTStateDepictionOneState)initWithCoder:(id)a3
{
  id v4;
  RTStateDepictionOneState *v5;
  uint64_t v6;
  RTStateModelLocation *location;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  GEOMapItem *geoMapItem;
  uint64_t v13;
  uint64_t v14;
  NSDate *geocodeDate;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *histEntryExit_s;
  uint64_t v21;
  NSString *customLabel;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RTStateDepictionOneState;
  v5 = -[RTStateDepictionOneState init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (RTStateModelLocation *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("type")))
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    else
      v8 = -1;
    v5->_type = v8;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("typeSource2.0")))
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeSource2.0"));
    else
      v9 = 0;
    v5->_typeSource = v9;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("typeSource")))
    {
      v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeSource")) + 1;
      if (v10 <= 5)
        v5->_typeSource = qword_1D1EEDB68[v10];
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapItem")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItem"));
      v11 = objc_claimAutoreleasedReturnValue();
      geoMapItem = v5->_geoMapItem;
      v5->_geoMapItem = (GEOMapItem *)v11;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapItemSource")))
      v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapItemSource"));
    else
      v13 = 0;
    v5->_mapItemSource = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geocodeDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    geocodeDate = v5->_geocodeDate;
    v5->_geocodeDate = (NSDate *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("histEntryExit_s"));
    v19 = objc_claimAutoreleasedReturnValue();
    histEntryExit_s = v5->_histEntryExit_s;
    v5->_histEntryExit_s = (NSMutableArray *)v19;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("customLabel")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customLabel"));
      v21 = objc_claimAutoreleasedReturnValue();
      customLabel = v5->_customLabel;
      v5->_customLabel = (NSString *)v21;

    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[RTStateDepictionOneState location](self, "location");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D183C0], "locationOfInterestTypeToString:", -[RTStateDepictionOneState type](self, "type"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D183C0], "locationOfInterestTypeSourceToString:", -[RTStateDepictionOneState typeSource](self, "typeSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepictionOneState histEntryExit_s](self, "histEntryExit_s");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v30, "count");
  -[RTStateDepictionOneState mapItem](self, "mapItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepictionOneState mapItem](self, "mapItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "latitude");
  v5 = v4;
  -[RTStateDepictionOneState mapItem](self, "mapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "longitude");
  v7 = v6;
  -[RTStateDepictionOneState mapItem](self, "mapItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "extendedAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addressIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepictionOneState mapItem](self, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extendedAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isMe"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = (void *)MEMORY[0x1E0D183E8];
  -[RTStateDepictionOneState mapItem](self, "mapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceToString:", objc_msgSend(v14, "source"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepictionOneState customLabel](self, "customLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("location, %@, type, %@, typeSource, %@, visits, %lu, mapItem, address, \"%@\", location, <%f, %f>, addressIdentifier, %@, isMe, %@, mapItemSource, %@, customLabel, %@"), v26, v23, v21, v19, v3, v5, v7, v9, v12, v15, v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (RTStateModelLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)typeSource
{
  return self->_typeSource;
}

- (void)setTypeSource:(unint64_t)a3
{
  self->_typeSource = a3;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (unint64_t)mapItemSource
{
  return self->_mapItemSource;
}

- (void)setMapItemSource:(unint64_t)a3
{
  self->_mapItemSource = a3;
}

- (NSDate)geocodeDate
{
  return self->_geocodeDate;
}

- (void)setGeocodeDate:(id)a3
{
  objc_storeStrong((id *)&self->_geocodeDate, a3);
}

- (NSMutableArray)histEntryExit_s
{
  return self->_histEntryExit_s;
}

- (void)setHistEntryExit_s:(id)a3
{
  objc_storeStrong((id *)&self->_histEntryExit_s, a3);
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (void)setCustomLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customLabel, a3);
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (void)setGeoMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_geoMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_histEntryExit_s, 0);
  objc_storeStrong((id *)&self->_geocodeDate, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
