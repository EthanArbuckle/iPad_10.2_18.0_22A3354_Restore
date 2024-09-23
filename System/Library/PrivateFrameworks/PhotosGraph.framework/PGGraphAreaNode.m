@implementation PGGraphAreaNode

- (PGGraphAreaNode)initWithName:(id)a3 isBlocked:(BOOL)a4 popularityScore:(double)a5
{
  id v9;
  PGGraphAreaNode *v10;
  PGGraphAreaNode *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphAreaNode;
  v10 = -[PGGraphNode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    *((_BYTE *)v11 + 32) = *((_BYTE *)v11 + 32) & 0xFE | a4;
    v11->_centroidCoordinate = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
    v11->_popularityScore = a5;
  }

  return v11;
}

- (PGGraphAreaNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  PGGraphAreaNode *v13;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("blocked"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("popularityScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = -[PGGraphAreaNode initWithName:isBlocked:popularityScore:](self, "initWithName:isBlocked:popularityScore:", v7, v9, v12);
  return v13;
}

- (PGGraphAreaNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphAreaNode *v14;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bl"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("blocked"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("bl"));
    v10 = v12;
  }
  v14 = -[PGGraphAreaNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v9, v7, v10);

  return v14;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_name))
      goto LABEL_9;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blocked"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "BOOLValue") == ((*((_BYTE *)self + 32) & 1) == 0))
        goto LABEL_9;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popularityScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9 && (objc_msgSend(v9, "doubleValue"), v10 != self->_popularityScore))
LABEL_9:
      v11 = 0;
    else
      v11 = 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = self->_name;
  v7[0] = CFSTR("name");
  v7[1] = CFSTR("blocked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 32) & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("popularityScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_popularityScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("blocked")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 32) & 1);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("popularityScore")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_popularityScore);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = self->_name;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphAreaNode.", (uint8_t *)&v8, 0xCu);
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (NSString)description
{
  void *v3;
  NSString *name;
  double popularityScore;
  __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  popularityScore = self->_popularityScore;
  if (popularityScore < 0.0)
  {
    v6 = &stru_1E8436F28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", score: %.3f"), *(_QWORD *)&self->_popularityScore);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((*((_BYTE *)self + 32) & 1) != 0)
    v7 = CFSTR(", blocked");
  else
    v7 = &stru_1E8436F28;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PGGraphAreaNode (%@%@)%@"), name, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (popularityScore >= 0.0)

  return (NSString *)v8;
}

- (NSString)label
{
  __CFString *v2;

  v2 = CFSTR("Area");
  return (NSString *)CFSTR("Area");
}

- (unsigned)domain
{
  return 201;
}

- (NSString)fullname
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphAreaNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphAreaNode collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)&v9 = 138412290;
    v21 = v9;
    do
    {
      v10 = objc_msgSend(v8, "locationMask", v21);
      if (v10 >= 0x40)
      {
        v11 = v10;
        objc_msgSend(v8, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == 128)
        {
          objc_msgSend(v5, "localizedStringForCountryCode:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v13;
        }
        if (objc_msgSend(v12, "length"))
        {
          objc_msgSend(v3, "addObject:", v12);
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "loggingConnection");
          v15 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v23 = v8;
            _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Empty location name for node %@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(v8, "locationNodeCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "parentLocationNodes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "anyNode");
      v18 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v18;
    }
    while (v18);
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (PGGraphLocationNode)stateOrBiggerParentLocationNode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[PGGraphAreaNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      if ((unint64_t)objc_msgSend(v4, "locationMask") > 0x3F)
        break;
      objc_msgSend(v4, "locationNodeCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentLocationNodes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "anyNode");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  return (PGGraphLocationNode *)v4;
}

- (BOOL)diameterIsLargerThanDiameter:(double)a3
{
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  double v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke;
  v8[3] = &unk_1E8433888;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  v10 = &v12;
  v11 = a3;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("AREA"), 201, v8);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (id)shortenedNameWithLocationHelper:(id)a3
{
  return +[PGAOINameShortener shortenedAOIForLocationOrAreaNode:locationHelper:](PGAOINameShortener, "shortenedAOIForLocationOrAreaNode:locationHelper:", self, a3);
}

- (id)addressNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphAreaNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D *p_centroidCoordinate;
  void *v4;
  void *v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  p_centroidCoordinate = &self->_centroidCoordinate;
  if (!CLLocationCoordinate2DIsValid(self->_centroidCoordinate))
  {
    -[PGGraphAreaNode collection](self, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centroidCoordinate");
    p_centroidCoordinate->latitude = v6;
    p_centroidCoordinate->longitude = v7;

  }
  latitude = p_centroidCoordinate->latitude;
  longitude = p_centroidCoordinate->longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (PGGraphAreaNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphAreaNodeCollection alloc], "initWithNode:", self);
}

- (BOOL)supportsNameShortening
{
  return 1;
}

- (unint64_t)featureType
{
  return 8;
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
  -[PGGraphAreaNode name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CLLocationCoordinate2D)centroidCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_centroidCoordinate.latitude;
  longitude = self->_centroidCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCentroidCoordinate:(CLLocationCoordinate2D)a3
{
  self->_centroidCoordinate = a3;
}

- (BOOL)isBlocked
{
  return *((_BYTE *)self + 32) & 1;
}

- (double)popularityScore
{
  return self->_popularityScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

void __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v5, "coordinate");
  v8 = v7;
  v10 = v9;
  v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke_2;
  v15[3] = &unk_1E8433860;
  v14 = v5;
  v16 = v14;
  v12 = *(id *)(a1 + 40);
  v19 = v8;
  v20 = v10;
  v13 = *(_QWORD *)(a1 + 48);
  v17 = v12;
  v18 = v13;
  v21 = *(_QWORD *)(a1 + 56);
  v22 = a3;
  objc_msgSend(v11, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("AREA"), 201, v15);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

  objc_autoreleasePoolPop(v6);
}

void __48__PGGraphAreaNode_diameterIsLargerThanDiameter___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double v6;

  v5 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "isSameNodeAsNode:", v5)
    || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(v5, "coordinate");
    CLLocationCoordinate2DGetDistanceFrom();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 > *(double *)(a1 + 72);
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    **(_BYTE **)(a1 + 80) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Area"), 201);
}

+ (MANodeFilter)blockedFilter
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  v6 = CFSTR("blocked");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabel:domain:properties:", CFSTR("Area"), 201, v3);

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)nonBlockedFilter
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  v6 = CFSTR("blocked");
  v7[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabel:domain:properties:", CFSTR("Area"), 201, v3);

  return (MANodeFilter *)v4;
}

+ (id)filterWithName:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = CFSTR("name");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLabel:domain:properties:", CFSTR("Area"), 201, v6);
  return v7;
}

+ (id)filterWithNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("name");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)setIsBlocked:(BOOL)a3 onNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  _BOOL8 v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forNodeWithIdentifier:", v9, CFSTR("blocked"), a4);

}

+ (void)setPopularityScore:(double)a3 onNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithDouble:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forNodeWithIdentifier:", v9, CFSTR("popularityScore"), a4);

}

+ (MARelation)addressOfArea
{
  void *v2;
  void *v3;

  +[PGGraphAreaEdge filter](PGGraphAreaEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)countyOfArea
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "addressOfArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[PGGraphAddressNode countyOfAddress](PGGraphAddressNode, "countyOfAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

+ (MARelation)stateOfArea
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "addressOfArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[PGGraphAddressNode stateOfAddress](PGGraphAddressNode, "stateOfAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

+ (MARelation)countryOfArea
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "addressOfArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[PGGraphAddressNode countryOfAddress](PGGraphAddressNode, "countryOfAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

@end
