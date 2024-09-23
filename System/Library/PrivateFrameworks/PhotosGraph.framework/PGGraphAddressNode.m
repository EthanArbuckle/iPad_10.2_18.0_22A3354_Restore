@implementation PGGraphAddressNode

- (PPLocationNamedEntities)pg_locationNamedEntity
{
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0D70B80]);
  -[PGGraphAddressNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streetNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStreetAddress:", v7);

  objc_msgSend(v4, "cityNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCity:", v10);

  objc_msgSend(v4, "stateNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateOrProvince:", v13);

  objc_msgSend(v4, "countryNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCountry:", v16);

  -[PGGraphAddressNode location](self, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocation:", v17);

  return (PPLocationNamedEntities *)v3;
}

- (PGGraphAddressNode)initWithLocationMode:(int64_t)a3 coordinate:(CLLocationCoordinate2D)a4 name:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v10;
  PGGraphAddressNode *v11;
  PGGraphAddressNode *v12;
  unint64_t locationMode;
  const __CFString *v14;
  uint64_t v15;
  NSString *uuid;
  objc_super v18;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphAddressNode;
  v11 = -[PGGraphLocationNode init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_locationMode = a3;
    v11->_coordinate.latitude = latitude;
    v11->_coordinate.longitude = longitude;
    objc_storeStrong((id *)&v11->_name, a5);
    locationMode = v12->_locationMode;
    if (locationMode > 3)
      v14 = CFSTR("Unknown");
    else
      v14 = off_1E8430258[locationMode];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%f,%f>|%@|%@"), *(_QWORD *)&v12->_coordinate.latitude, *(_QWORD *)&v12->_coordinate.longitude, v12->_name, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    uuid = v12->_uuid;
    v12->_uuid = (NSString *)v15;

  }
  return v12;
}

- (PGGraphAddressNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  double latitude;
  double longitude;
  void *v18;
  void *v19;
  PGGraphAddressNode *v20;
  void *v21;
  void *v22;
  NSString *uuid;
  int v25;
  NSString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lng"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    objc_msgSend(v9, "doubleValue");
    v13 = v12;
    objc_msgSend(v11, "doubleValue");
    v15 = CLLocationCoordinate2DMake(v13, v14);
    latitude = v15.latitude;
    longitude = v15.longitude;
  }
  else
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  v20 = -[PGGraphAddressNode initWithLocationMode:coordinate:name:](self, "initWithLocationMode:coordinate:name:", v8, v19, latitude, longitude);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 && (objc_msgSend(v21, "isEqualToString:", v20->_uuid) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      uuid = v20->_uuid;
      v25 = 138412546;
      v26 = uuid;
      v27 = 2112;
      v28 = v22;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Address node has a different uuid than expected, '%@' vs '%@'", (uint8_t *)&v25, 0x16u);
    }
    objc_storeStrong((id *)&v20->_uuid, v22);
  }

  return v20;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && self->_locationMode != (int)objc_msgSend(v6, "shortValue"))
      goto LABEL_15;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      if (v9 != self->_coordinate.latitude)
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lng"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      if (v11 != self->_coordinate.longitude)
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      if (!objc_msgSend(v12, "isEqual:", self->_name))
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13 && !objc_msgSend(v13, "isEqual:", self->_uuid))
LABEL_15:
      v14 = 0;
    else
      v14 = 1;

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (id)propertyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_locationMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("lm"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coordinate.latitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coordinate.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lng"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uuid, CFSTR("uuid"));
  return v3;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double latitude;
  uint64_t v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lm")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_locationMode);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v9 = v5;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lat")))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    latitude = self->_coordinate.latitude;
LABEL_7:
    objc_msgSend(v6, "numberWithDouble:", latitude);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lng")))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    latitude = self->_coordinate.longitude;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v8 = 56;
LABEL_12:
    v5 = *(id *)((char *)&self->super.super.super.super.super.isa + v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("uuid")))
  {
    v8 = 64;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphAddressNode.", (uint8_t *)&v11, 0xCu);
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (NSString)description
{
  unint64_t locationMode;
  const __CFString *v3;

  locationMode = self->_locationMode;
  if (locationMode > 3)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E8430258[locationMode];
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphAddressNode (%@, <%f, %f>, %@)"), self->_name, *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude, v3);
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  void *v3;
  NSString *uuid;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphAddressNode filter](PGGraphAddressNode, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  v8 = CFSTR("uuid");
  v9[0] = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterBySettingProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v6;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Address");
  return CFSTR("Address");
}

- (unsigned)domain
{
  return 200;
}

- (int64_t)locationMode
{
  return self->_locationMode;
}

- (BOOL)isImproved
{
  return self->_locationMode == 1;
}

- (BOOL)isCoarse
{
  return self->_locationMode == 2;
}

- (BOOL)isOcean
{
  return self->_locationMode == 3;
}

- (BOOL)isPrecise
{
  return (self->_locationMode < 4uLL) & (3u >> (self->_locationMode & 0xF));
}

- (void)enumerateAreaEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("AREA"), 201, a3);
}

- (CLLocation)location
{
  CLLocationCoordinate2D *p_coordinate;
  void *v3;

  p_coordinate = &self->_coordinate;
  if (CLLocationCoordinate2DIsValid(self->_coordinate))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", p_coordinate->latitude, p_coordinate->longitude);
  else
    v3 = 0;
  return (CLLocation *)v3;
}

- (BOOL)isPersonHomeOrWorkAddress
{
  void *v2;
  BOOL v3;

  -[MANode anyEdgeWithLabel:domain:](self, "anyEdgeWithLabel:domain:", CFSTR("IS_HOME_WORK"), 202);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (PGGraphAddressNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphAddressNodeCollection alloc], "initWithNode:", self);
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)featureType
{
  return 7;
}

- (id)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, self->_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Address"), 200);
}

+ (MANodeFilter)preciseFilter
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("lm");
  v7[0] = &unk_1E84EA348;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)impreciseFilter
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("lm");
  v7[0] = &unk_1E84EA360;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v4;
}

+ (void)setCoordinate:(CLLocationCoordinate2D)a3 onAddressNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  double longitude;
  double latitude;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("lat");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  objc_msgSend(v8, "numberWithDouble:", latitude);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("lng");
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", longitude);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v12, a4, 0);

}

+ (MARelation)homeOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphIsHomeWorkEdge filter](PGGraphIsHomeWorkEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphHomeWorkNode homeFilter](PGGraphHomeWorkNode, "homeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)workOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphIsHomeWorkEdge filter](PGGraphIsHomeWorkEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphHomeWorkNode workFilter](PGGraphHomeWorkNode, "workFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)homeWorkOfAddress
{
  void *v2;
  void *v3;

  +[PGGraphIsHomeWorkEdge filter](PGGraphIsHomeWorkEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)numberOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphLocationNumberNode filter](PGGraphLocationNumberNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)streetOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationStreetNode filter](PGGraphLocationStreetNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)districtOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationDistrictNode filter](PGGraphLocationDistrictNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)cityOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationCityNode filter](PGGraphLocationCityNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)countyOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationCountyNode filter](PGGraphLocationCountyNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)stateOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationStateNode filter](PGGraphLocationStateNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)countryOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationCountryNode filter](PGGraphLocationCountryNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)languageOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLanguageEdge filter](PGGraphLanguageEdge, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outRelation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)momentOfAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphAddressEdge filter](PGGraphAddressEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)areaOfAddress
{
  void *v2;
  void *v3;

  +[PGGraphAreaEdge filter](PGGraphAreaEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)frequentLocationOfAddress
{
  void *v2;
  void *v3;

  +[PGGraphFrequentLocationAtEdge filter](PGGraphFrequentLocationAtEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
