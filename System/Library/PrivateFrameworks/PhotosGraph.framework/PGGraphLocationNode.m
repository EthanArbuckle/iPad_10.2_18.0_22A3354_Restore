@implementation PGGraphLocationNode

- (PGGraphLocationNode)init
{
  PGGraphLocationNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGGraphLocationNode;
  result = -[PGGraphNode init](&v3, sel_init);
  if (result)
    result->_centroidCoordinate = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
  return result;
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (PGGraphLocationNodeCollection)locationNodeCollection
{
  return (PGGraphLocationNodeCollection *)(id)objc_msgSend(objc_alloc(-[PGGraphLocationNode collectionClass](self, "collectionClass")), "initWithNode:", self);
}

- (BOOL)supportsNameShortening
{
  return -[PGGraphLocationNode domain](self, "domain") == 201;
}

- (NSString)fullname
{
  void *v3;
  PGGraphLocationNode *v4;
  void *v5;
  int v6;
  __int128 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  -[PGGraphLocationNode label](v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Address"));

  if (v6)
  {
    -[PGGraphLocationNode locationNodeCollection](v4, "locationNodeCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentLocationNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyNode");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (PGGraphLocationNode *)v10;
  }
  if (v4)
  {
    *(_QWORD *)&v7 = 138412546;
    v26 = v7;
    v11 = MEMORY[0x1E0C81028];
    do
    {
      -[PGGraphNode name](v4, "name", v26);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!-[MANode outEdgesCount](v4, "outEdgesCount"))
      {
        -[PGGraphLocationNode label](v4, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Country"));

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForCountryCode:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
          {
            v17 = v12;
            v12 = v16;
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "loggingConnection");
            v17 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              v28 = (uint64_t)v15;
              v29 = 2112;
              v30 = v12;
              _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Locale %@ does not have a country name for country code %@", buf, 0x16u);
            }
          }

        }
      }
      if (v12)
      {
        objc_msgSend(v3, "addObject:", v12);
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v22 = objc_opt_class();
        -[PGGraphLocationNode label](v4, "label");
        v23 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v26;
        v28 = v22;
        v29 = 2112;
        v30 = v23;
        _os_log_fault_impl(&dword_1CA237000, v11, OS_LOG_TYPE_FAULT, "Location Node of class %@ with label %@ has a nil name.", buf, 0x16u);

      }
      -[PGGraphLocationNode locationNodeCollection](v4, "locationNodeCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "parentLocationNodes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "anyNode");
      v21 = objc_claimAutoreleasedReturnValue();

      v4 = (PGGraphLocationNode *)v21;
    }
    while (v21);
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (unint64_t)locationMask
{
  void *v2;
  unint64_t v3;

  -[PGGraphLocationNode label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Address")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Number")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Street")) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("District")) & 1) != 0)
  {
    v3 = 8;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("City")) & 1) != 0)
  {
    v3 = 16;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("County")) & 1) != 0)
  {
    v3 = 32;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("State")) & 1) != 0)
  {
    v3 = 64;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("Country")))
  {
    v3 = 128;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)keywordDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  PGGraphLocationNode *v25;

  -[PGGraphLocationNode label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Address")) & 1) == 0)
  {
    -[PGGraphNode name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "addObject:", v5);

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__66895;
  v24 = __Block_byref_object_dispose__66896;
  v25 = self;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    if (!objc_msgSend((id)v21[5], "outEdgesCount"))
      break;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v7 = (void *)v21[5];
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __41__PGGraphLocationNode_keywordDescription__block_invoke;
    v12[3] = &unk_1E84366A8;
    v14 = &v20;
    v13 = v4;
    v15 = &v16;
    objc_msgSend(v7, "enumerateOutEdgesUsingBlock:", v12);
    LODWORD(v7) = *((unsigned __int8 *)v17 + 24);

    _Block_object_dispose(&v16, 8);
  }
  while ((_DWORD)v7);
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@] %@"), v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  return v10;
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
  v6[2] = __48__PGGraphLocationNode_associatedNodesForRemoval__block_invoke;
  v6[3] = &unk_1E84366E8;
  v4 = v3;
  v7 = v4;
  -[MANode enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:](self, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v6);

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
    -[PGGraphLocationNode locationNodeCollection](self, "locationNodeCollection");
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

- (unint64_t)featureType
{
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = objc_opt_class();
    _os_log_fault_impl(&dword_1CA237000, v3, OS_LOG_TYPE_FAULT, "Feature type not implemented for node class %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (NSString)featureIdentifier
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
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

void __48__PGGraphLocationNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "domain") - 200 <= 2
    && objc_msgSend(v6, "domain") - 200 <= 2
    && objc_msgSend(v5, "inEdgesCount") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

void __41__PGGraphLocationNode_keywordDescription__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(v11, "domain") == 200;
  v6 = v11;
  if (v5)
  {
    objc_msgSend(v11, "oppositeNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

    v6 = v11;
  }

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 200);
}

+ (MARelation)parentLocationOfLocation
{
  void *v2;
  void *v3;

  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)childLocationOfLocation
{
  void *v2;
  void *v3;

  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)addressOfLocation
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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitiveClosure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionalStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  +[PGGraphAddressNode filter](PGGraphAddressNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v10;
}

@end
