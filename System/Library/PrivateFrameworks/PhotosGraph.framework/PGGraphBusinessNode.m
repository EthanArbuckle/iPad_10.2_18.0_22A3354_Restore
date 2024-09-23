@implementation PGGraphBusinessNode

- (PPNamedEntity)pg_namedEntity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PGGraphBusinessNode name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v3, 2, v5);
  }
  else
  {
    v6 = 0;
  }

  return (PPNamedEntity *)v6;
}

- (PGGraphBusinessNode)initWithMuid:(unint64_t)a3 name:(id)a4 venueCapacity:(int64_t)a5 coordinates:(CLLocationCoordinate2D)a6 radius:(double)a7
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v14;
  PGGraphBusinessNode *v15;
  PGGraphBusinessNode *v16;
  objc_super v18;

  longitude = a6.longitude;
  latitude = a6.latitude;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphBusinessNode;
  v15 = -[PGGraphNode init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_muid = a3;
    objc_storeStrong((id *)&v15->_name, a4);
    v16->_venueCapacity = a5;
    v16->_coordinates.latitude = latitude;
    v16->_coordinates.longitude = longitude;
    v16->_radius = a7;
  }

  return v16;
}

- (PGGraphBusinessNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  CLLocationDegrees v14;
  void *v15;
  double v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  double latitude;
  double longitude;
  void *v21;
  double v22;
  double v23;
  PGGraphBusinessNode *v24;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("muid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("venueCapacity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (-[__CFString length](v9, "length"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    v18 = CLLocationCoordinate2DMake(v14, v17);
    latitude = v18.latitude;
    longitude = v18.longitude;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("radius"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
  }
  else
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
    v21 = v9;
    v9 = &stru_1E8436F28;
    v23 = 0.0;
  }

  v24 = -[PGGraphBusinessNode initWithMuid:name:venueCapacity:coordinates:radius:](self, "initWithMuid:name:venueCapacity:coordinates:radius:", v8, v9, v11, latitude, longitude, v23);
  return v24;
}

- (PGGraphBusinessNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PGGraphBusinessNode *v24;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("muid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v10;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("muid"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("id"));
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("vncpct"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("vncpct"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("venueCapacity"));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("vncpct"));
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lat"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lat"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("latitude"));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("lat"));
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lng"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lng"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("longitude"));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("lng"));
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("radius"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("radius"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("radius"));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("radius"));
    }

  }
  v24 = -[PGGraphBusinessNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v9, v7, v12);

  return v24;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  BOOL v16;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "unsignedIntegerValue") != self->_muid)
      goto LABEL_15;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_name))
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueCapacity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "integerValue") != self->_venueCapacity)
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      if (v11 != self->_coordinates.latitude)
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("longitude"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      if (v13 != self->_coordinates.longitude)
        goto LABEL_15;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radius"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (!v14 || (objc_msgSend(v14, "doubleValue"), v15 == self->_radius))
      v16 = 1;
    else
LABEL_15:
      v16 = 0;

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)propertyDictionary
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("muid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v12[0] = v3;
  v12[1] = name;
  v11[1] = CFSTR("name");
  v11[2] = CFSTR("venueCapacity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_venueCapacity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("latitude");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coordinates.latitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("longitude");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coordinates.longitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("radius");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_radius);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphBusinessNode (%@, %llu %d)"), self->_name, self->_muid, self->_venueCapacity);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Business");
  return CFSTR("Business");
}

- (unsigned)domain
{
  return 503;
}

- (NSSet)businessCategories
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphBusinessNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)enumerateBusinessCategoryNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BUSINESSCATEGORY"), 504, a3);
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BUSINESS"), 503, a3);
}

- (NSSet)publicEventNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphBusinessNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicEventNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)keywordDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PGGraphBusinessNode businessCategories](self, "businessCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_localizedCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PGGraphBusinessNode venueCapacity](self, "venueCapacity");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = CFSTR("N/A");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphBusinessNode name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ [%@] [cap:%@]"), v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)UUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_muid);
}

- (id)associatedNodesForRemoval
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphBusinessNode_associatedNodesForRemoval__block_invoke;
  v6[3] = &unk_1E842DD10;
  v4 = v3;
  v7 = v4;
  -[PGGraphBusinessNode enumerateBusinessCategoryNodesUsingBlock:](self, "enumerateBusinessCategoryNodesUsingBlock:", v6);

  return v4;
}

- (PGGraphBusinessNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphBusinessNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 17;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBusinessNode UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)venueCapacity
{
  return self->_venueCapacity;
}

- (CLLocationCoordinate2D)coordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinates.latitude;
  longitude = self->_coordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

void __48__PGGraphBusinessNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("BUSINESSCATEGORY"), 504) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Business"), 503);
}

+ (id)filterWithMuid:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("muid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (MARelation)categoryOfBusiness
{
  void *v2;
  void *v3;

  +[PGGraphBusinessCategoryEdge filter](PGGraphBusinessCategoryEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)publicEventOfBusiness
{
  void *v2;
  void *v3;

  +[PGGraphPublicEventBusinessEdge filter](PGGraphPublicEventBusinessEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentOfBusiness
{
  void *v2;
  void *v3;

  +[PGGraphPlaceBusinessEdge filter](PGGraphPlaceBusinessEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
