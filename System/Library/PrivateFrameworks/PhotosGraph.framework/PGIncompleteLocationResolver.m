@implementation PGIncompleteLocationResolver

- (PGIncompleteLocationResolver)initWithAddressNodes:(id)a3 locationHelper:(id)a4
{
  id v7;
  id v8;
  PGIncompleteLocationResolver *v9;
  PGIncompleteLocationResolver *v10;
  uint64_t v11;
  NSMutableDictionary *resolvedLocationNodesCache;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGIncompleteLocationResolver;
  v9 = -[PGIncompleteLocationResolver init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addressNodes, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    resolvedLocationNodesCache = v10->_resolvedLocationNodesCache;
    v10->_resolvedLocationNodesCache = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v10->_locationHelper, a4);
  }

  return v10;
}

- (id)_resolveIdentifierForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), objc_msgSend(a3, "identifier"), a4);
}

- (id)resolvedLocationNodeForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4
{
  return -[PGIncompleteLocationResolver _resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:resolvedDimension:continueResolvingHigherDimensions:](self, "_resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:resolvedDimension:continueResolvingHigherDimensions:", a3, a4, 0, 0);
}

- (id)resolvedLocationNodeForIncompleteAddressNode:(id)a3 withPreferredTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5
{
  return -[PGIncompleteLocationResolver _resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:resolvedDimension:continueResolvingHigherDimensions:](self, "_resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:resolvedDimension:continueResolvingHigherDimensions:", a3, a4, a5, 1);
}

- (id)_resolvedLocationNodeForIncompleteAddressNode:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 continueResolvingHigherDimensions:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  void *v19;
  void *v20;
  id v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unint64_t *v34;
  id v35;
  unint64_t v36;
  _QWORD v37[6];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;
  CLLocationCoordinate2D v43;

  v6 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[PGIncompleteLocationResolver _resolveIdentifierForIncompleteAddressNode:withTargetDimension:](self, "_resolveIdentifierForIncompleteAddressNode:withTargetDimension:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_resolvedLocationNodesCache, "objectForKeyedSubscript:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v13 = 0;
    }
    objc_msgSend(v13, "label");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (a5 && v14)
      *a5 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v14);
    v16 = v13;

LABEL_35:
    goto LABEL_36;
  }
  objc_msgSend(v10, "coordinate");
  latitude = v43.latitude;
  longitude = v43.longitude;
  if (CLLocationCoordinate2DIsValid(v43))
  {
    v34 = a5;
    -[NSSet allObjects](self->_addressNodes, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __150__PGIncompleteLocationResolver__resolvedLocationNodeForIncompleteAddressNode_withTargetDimension_resolvedDimension_continueResolvingHigherDimensions___block_invoke;
    v37[3] = &__block_descriptor_48_e51_q24__0__PGGraphAddressNode_8__PGGraphAddressNode_16l;
    *(CLLocationDegrees *)&v37[4] = latitude;
    *(CLLocationDegrees *)&v37[5] = longitude;
    objc_msgSend(v19, "sortedArrayUsingComparator:", v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v36 = 0;
    v22 = !v6;
    v23 = a4;
    do
    {
      v24 = v23;
      v25 = v21;
      v35 = v21;
      -[PGIncompleteLocationResolver _resolvedAddressForIncompleteAddress:withTargetDimension:resolvedDimension:resolvedLocation:sortedAddresses:](self, "_resolvedAddressForIncompleteAddress:withTargetDimension:resolvedDimension:resolvedLocation:sortedAddresses:", v10, v23, &v36, &v35, v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v35;

      v23 = v24 + 1;
      if (v24 + 1 <= 9 && v26 == 0)
        v28 = v22;
      else
        v28 = 1;
    }
    while (v28 != 1);
    if (objc_msgSend(v26, "isSameNodeAsNode:", v10))
    {

    }
    else if (v21)
    {
LABEL_23:
      if (v24 >= a4)
      {
        v30 = MEMORY[0x1E0C81028];
        do
        {
          v31 = v11;
          -[PGIncompleteLocationResolver _resolveIdentifierForIncompleteAddressNode:withTargetDimension:](self, "_resolveIdentifierForIncompleteAddressNode:withTargetDimension:", v10, v24);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 && v24 == v36)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478083;
              v39 = v10;
              v40 = 2113;
              v41 = v21;
              _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "Resolved incomplete address %{private}@ to location %{private}@", buf, 0x16u);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resolvedLocationNodesCache, "setObject:forKeyedSubscript:", v21, v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resolvedLocationNodesCache, "setObject:forKeyedSubscript:", v32, v11);

          }
          --v24;
        }
        while (v24 >= a4);
      }
      if (v34)
        *v34 = v36;
      v16 = v21;

      goto LABEL_35;
    }
    v21 = 0;
    v36 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resolvedLocationNodesCache, "setObject:forKeyedSubscript:", v29, v11);

  v16 = 0;
  if (a5)
    *a5 = 0;
LABEL_36:

  return v16;
}

- (id)_resolvedAddressForIncompleteAddress:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 resolvedLocation:(id *)a6 sortedAddresses:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a7;
  -[PGIncompleteLocationResolver _resolvedAddressForIncompleteAddress:withTargetDimension:resolvedDimension:resolvedLocation:addresses:](self, "_resolvedAddressForIncompleteAddress:withTargetDimension:resolvedDimension:resolvedLocation:addresses:", v12, a4, a5, a6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v12, "graph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v15, "nodesForLabel:domain:", CFSTR("Address"), 200);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "minusSet:", v19);

    }
    -[PGIncompleteLocationResolver _resolvedAddressForIncompleteAddress:withTargetDimension:resolvedDimension:resolvedLocation:addresses:](self, "_resolvedAddressForIncompleteAddress:withTargetDimension:resolvedDimension:resolvedLocation:addresses:", v12, a4, a5, a6, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_resolvedAddressForIncompleteAddress:(id)a3 withTargetDimension:(unint64_t)a4 resolvedDimension:(unint64_t *)a5 resolvedLocation:(id *)a6 addresses:(id)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  id v29;
  id *v31;
  unint64_t *v32;
  char isKindOfClass;
  PGIncompleteLocationResolver *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;
  CLLocationCoordinate2D v43;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v34 = self;
  objc_msgSend((id)objc_opt_class(), "_maxDistanceForDimension:", a4);
  v15 = v14;
  objc_msgSend(v12, "coordinate");
  v39 = v16;
  v40 = v17;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v19)
  {
    v20 = v19;
    v31 = a6;
    v32 = a5;
    v21 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v23, "isSameNodeAsNode:", v12, v31) & 1) == 0)
        {
          objc_msgSend(v23, "coordinate");
          if (CLLocationCoordinate2DIsValid(v43))
          {
            CLLocationCoordinate2DGetDistanceFrom();
            if (v24 <= v15)
            {
              -[PGGraphLocationHelper closestLocationNodeFromLocationNode:withDimension:reverse:](v34->_locationHelper, "closestLocationNodeFromLocationNode:withDimension:reverse:", v23, a4, 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "label");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v26);

              if (v27 == a4)
              {
                v28 = v23;
                v29 = objc_retainAutorelease(v25);
                *v31 = v29;
                if (v32)
                  *v32 = a4;

                goto LABEL_19;
              }

            }
            else if ((isKindOfClass & 1) != 0)
            {
              goto LABEL_15;
            }
          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_15:
  v28 = 0;
LABEL_19:

  return v28;
}

- (NSSet)addressNodes
{
  return self->_addressNodes;
}

- (void)setAddressNodes:(id)a3
{
  objc_storeStrong((id *)&self->_addressNodes, a3);
}

- (NSMutableDictionary)resolvedLocationNodesCache
{
  return self->_resolvedLocationNodesCache;
}

- (void)setResolvedLocationNodesCache:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedLocationNodesCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedLocationNodesCache, 0);
  objc_storeStrong((id *)&self->_addressNodes, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

uint64_t __150__PGIncompleteLocationResolver__resolvedLocationNodeForIncompleteAddressNode_withTargetDimension_resolvedDimension_continueResolvingHigherDimensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  CLLocationDegrees v6;
  double v7;
  CLLocationDegrees v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  CLLocationDegrees v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CLLocationCoordinate2D v20;
  CLLocationCoordinate2D v21;

  v4 = a3;
  objc_msgSend(a2, "coordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "coordinate");
  v10 = v9;
  v12 = v11;

  v20.latitude = v6;
  v20.longitude = v8;
  v13 = CLLocationCoordinate2DIsValid(v20);
  v21.latitude = v10;
  v21.longitude = v12;
  v14 = CLLocationCoordinate2DIsValid(v21);
  if (!v13 && !v14)
    return 0;
  if (!v13 && v14)
    return 1;
  if (v13 && !v14)
    return -1;
  CLLocationCoordinate2DGetDistanceFrom();
  v17 = v16;
  CLLocationCoordinate2DGetDistanceFrom();
  if (v18 <= v17)
    v19 = 0;
  else
    v19 = -1;
  if (v17 > v18)
    return 1;
  else
    return v19;
}

+ (double)_maxDistanceForDimension:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 6 <= 3)
    return dbl_1CA8ECCC8[a3 - 6];
  return result;
}

@end
