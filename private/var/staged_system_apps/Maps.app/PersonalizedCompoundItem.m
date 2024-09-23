@implementation PersonalizedCompoundItem

- (PersonalizedCompoundItem)init
{

  return 0;
}

- (PersonalizedCompoundItem)initWithItems:(id)a3
{
  id v4;
  PersonalizedCompoundItem *v5;
  NSArray *v6;
  NSArray *items;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSSet *v22;
  NSSet *keys;
  uint64_t v24;
  PersonalizedItemPriorityFunction *priorityFunction;
  PersonalizedCompoundItem *v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PersonalizedCompoundItem;
  v5 = -[PersonalizedCompoundItem init](&v34, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    items = v5->_items;
    v27 = v5;
    v5->_items = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v29 = objc_opt_new(NSMutableArray);
    v28 = objc_opt_new(NSMutableArray);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keys", v27));
          objc_msgSend(v8, "unionSet:", v15);

          if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem))
          {
            v16 = v14;
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v16, "sourceType")));
            -[NSMutableArray addObject:](v29, "addObject:", v17);

            v18 = objc_msgSend(v16, "sourceSubtype");
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
            -[NSMutableArray addObject:](v28, "addObject:", v19);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v11);
    }

    v20 = -[NSMutableArray copy](v29, "copy");
    v5 = v27;
    -[PersonalizedCompoundItem setPossiblePersonalizedItemSourceTypes:](v27, "setPossiblePersonalizedItemSourceTypes:", v20);

    v21 = -[NSMutableArray copy](v28, "copy");
    -[PersonalizedCompoundItem setPossiblePersonalizedItemSourceSubtypes:](v27, "setPossiblePersonalizedItemSourceSubtypes:", v21);

    v22 = (NSSet *)objc_msgSend(v8, "copy");
    keys = v27->_keys;
    v27->_keys = v22;

    v24 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForCompoundItemResolution"));
    priorityFunction = v27->_priorityFunction;
    v27->_priorityFunction = (PersonalizedItemPriorityFunction *)v24;

  }
  return v5;
}

- (void)setPriorityFunction:(id)a3
{
  PersonalizedItemPriorityFunction *v4;
  PersonalizedItemPriorityFunction *obj;

  v4 = (PersonalizedItemPriorityFunction *)a3;
  if (!v4)
    v4 = (PersonalizedItemPriorityFunction *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForCompoundItemResolution"));
  if (self->_priorityFunction != v4)
  {
    obj = v4;
    -[PersonalizedCompoundItem setHasCachedAutocompleteItemWithHighestPriority:](self, "setHasCachedAutocompleteItemWithHighestPriority:", 0);
    objc_storeStrong((id *)&self->_priorityFunction, obj);
    v4 = obj;
  }

}

- (unint64_t)priority
{
  NSArray *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "priority", (_QWORD)v10) > v5)
          v5 = objc_msgSend(v8, "priority");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (unint64_t)v5;
}

- (CLLocationCoordinate2D)coordinate
{
  double longitude;
  double latitude;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  CLLocationCoordinate2D result;

  latitude = kCLLocationCoordinate2DInvalid.latitude;
  longitude = kCLLocationCoordinate2DInvalid.longitude;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "coordinate", (_QWORD)v14);
        if ((v8 & 1) != 0)
        {
          longitude = v11;
          latitude = v10;
        }
        v9 = (char *)v9 + 1;
        v8 = 0;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = 0;
    }
    while (v6);
  }

  v12 = latitude;
  v13 = longitude;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enhancedPlacement", (_QWORD)v9));

        if (v7)
        {
          v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enhancedPlacement"));
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "labelGeometry", (_QWORD)v9));

        if (v7)
        {
          v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "labelGeometry"));
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (GEOLabelGeometry *)v3;
}

- (MKMapItem)mapItem
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PersonalizedCompoundItem *v25;
  id v26;
  void *v27;
  void *v28;
  NSArray *obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = self->_items;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v4)
  {

    v8 = 0;
    return (MKMapItem *)v8;
  }
  v5 = v4;
  obj = v3;
  v25 = self;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v30 = *(_QWORD *)v32;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v32 != v30)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem", v25));
      v12 = objc_msgSend(v10, "priority");
      if ((objc_msgSend(v11, "_hasResolvablePartialInformation") & 1) != 0)
      {
        v13 = 1;
        if (!v8)
          goto LABEL_20;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
        if ((objc_msgSend(v15, "hasExpiredComponents") & 1) != 0)
          v13 = 1;
        else
          v13 = objc_msgSend(v10, "mustRefineMapItem");

        if (!v8)
        {
LABEL_20:
          v8 = v11;
          v6 = objc_msgSend(v10, "priority");
          v7 = v13;
          goto LABEL_21;
        }
      }
      if (v6 >= v12)
      {
        if (v6 <= v12)
        {
          if (v13 & 1 | ((v7 & 1) == 0))
          {
            if (v7 & 1 | ((v13 & 1) == 0))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItemStorageForPersistence"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItemStorageForPersistence"));
              v28 = v16;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encodedData"));
              v26 = objc_msgSend(v18, "length");
              v27 = v17;
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "encodedData"));
              v20 = objc_msgSend(v19, "length");

              if (v26 > v20)
              {
                v21 = v11;

                v6 = objc_msgSend(v10, "priority");
                v8 = v21;
              }

            }
            else
            {
              v7 = 0;
            }
          }
          else
          {
            v22 = v11;

            v6 = objc_msgSend(v10, "priority");
            v7 = 0;
            v8 = v22;
          }
        }
      }
      else
      {
        v14 = v11;

        v6 = objc_msgSend(v10, "priority");
        v7 = v13;
        v8 = v14;
      }
LABEL_21:

      v9 = (char *)v9 + 1;
    }
    while (v5 != v9);
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v5 = v23;
  }
  while (v23);

  if (v8)
    objc_msgSend(v8, "setPersonalizedCompoundItem:", v25);
  return (MKMapItem *)v8;
}

- (NSArray)searchableStrings
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "searchableStrings", (_QWORD)v12));
        if (v9)
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (ParkedCar)parkedCar
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "parkedCar") & 1) != 0)
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parkedCar", (_QWORD)v11));
          if (v8)
          {
            v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return (ParkedCar *)v9;
}

- (TrafficIncidentReport)incidentReport
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "incidentReport") & 1) != 0)
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incidentReport", (_QWORD)v11));
          if (v8)
          {
            v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return (TrafficIncidentReport *)v9;
}

- (SearchResult)searchResult
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "searchResult", (_QWORD)v10));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (SearchResult *)v8;
}

- (VKLabelMarker)sourceLabelMarker
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "sourceLabelMarker", (_QWORD)v10));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (VKLabelMarker *)v8;
}

- (AddressBookAddress)address
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "address", (_QWORD)v10));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (AddressBookAddress *)v8;
}

- (SearchDotPlace)searchDotPlace
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "searchDotPlace", (_QWORD)v10));
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (SearchDotPlace *)v8;
}

- (MapsLocationOfInterest)locationOfInterest
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "locationOfInterest") & 1) != 0)
        {
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locationOfInterest", (_QWORD)v11));
          if (v8)
          {
            v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return (MapsLocationOfInterest *)v9;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "title", (_QWORD)v12));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combineAdornment:", v10));

        v8 = (char *)v8 + 1;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "prefix", (_QWORD)v12));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combineAdornment:", v10));

        v8 = (char *)v8 + 1;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "subtitle", (_QWORD)v12));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combineAdornment:", v10));

        v8 = (char *)v8 + 1;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (unint64_t)sortOrder
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "sortOrder", (_QWORD)v10);
        if (v7)
        {
          v8 = (unint64_t)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment defaultAdornment](PersonalizedItemStyleAttributesAdornment, "defaultAdornment"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "styleAttributes", (_QWORD)v12));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combineAdornment:", v10));

        v8 = (char *)v8 + 1;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (PersonalizedItemStyleAttributesAdornment *)v3;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemClientFeatureIDAdornment defaultAdornment](PersonalizedItemClientFeatureIDAdornment, "defaultAdornment"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "clientFeatureID", (_QWORD)v12));
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "combineAdornment:", v10));

        v8 = (char *)v8 + 1;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (PersonalizedItemClientFeatureIDAdornment *)v3;
}

- (BOOL)shouldBeClustered
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "shouldBeClustered", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)showsBalloonCallout
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "showsBalloonCallout", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)shouldBeHiddenFromMap
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "shouldBeHiddenFromMap", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)mustRefineMapItem
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "mustRefineMapItem", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isRouteStartOrEnd
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v6, "isRouteStartOrEnd") & 1) != 0
          && (objc_msgSend(v6, "isRouteStartOrEnd", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)needsToPreserveSelection
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!-[NSArray count](self->_items, "count"))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_items;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "needsToPreserveSelection") & 1) == 0
          || !objc_msgSend(v8, "needsToPreserveSelection", (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_15;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_15:

  return v9;
}

- (PersonalizedCompoundItem)itemWithHighestPriorityForFunction:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  BOOL v15;
  id v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem items](self, "items"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem))
          v12 = v11;
        else
          v12 = 0;

        if (v12)
        {
          if ((v13 = objc_msgSend(v4, "priorityForPersonalizedAutocompleteItem:", v11), !v8)
            || objc_msgSend(v8, "hidden") && !objc_msgSend(v11, "hidden")
            || ((v14 = objc_msgSend(v8, "hidden"), v14 == objc_msgSend(v11, "hidden"))
              ? (v15 = (uint64_t)v13 <= (uint64_t)v7)
              : (v15 = 1),
                !v15))
          {
            v16 = v11;

            v7 = v13;
            v8 = v16;
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }

  return (PersonalizedCompoundItem *)v8;
}

- (PersonalizedAutocompleteItem)autocompleteItemWithHighestPriority
{
  void *v3;
  void *v4;

  if (-[PersonalizedCompoundItem hasCachedAutocompleteItemWithHighestPriority](self, "hasCachedAutocompleteItemWithHighestPriority"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem cachedAutocompleteItemWithHighestPriority](self, "cachedAutocompleteItemWithHighestPriority"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem priorityFunction](self, "priorityFunction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem itemWithHighestPriorityForFunction:](self, "itemWithHighestPriorityForFunction:", v4));

    -[PersonalizedCompoundItem setCachedAutocompleteItemWithHighestPriority:](self, "setCachedAutocompleteItemWithHighestPriority:", v3);
    -[PersonalizedCompoundItem setHasCachedAutocompleteItemWithHighestPriority:](self, "setHasCachedAutocompleteItemWithHighestPriority:", 1);
  }
  return (PersonalizedAutocompleteItem *)v3;
}

- (id)autocompleteItemWithHighestObjectPriority
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForAutocompleteObject](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForAutocompleteObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem itemWithHighestPriorityForFunction:](self, "itemWithHighestPriorityForFunction:", v3));

  return v4;
}

- (id)autocompleteItemWithEarliestServerSectionAndIndexInSection
{
  NSArray *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  id v13;
  id v14;
  unint64_t v15;
  BOOL v16;
  id v17;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v19 = 0;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v2);
        v9 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem))
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          v12 = objc_msgSend(v9, "hasServerItemIndex");

          if (v12)
          {
            if ((v13 = objc_msgSend(v9, "serverSectionIndex"),
                  v14 = objc_msgSend(v9, "serverItemIndexInSection"),
                  v15 = (unint64_t)v14,
                  !v5)
              || v13 < v6
              || (v13 == v6 ? (v16 = (unint64_t)v14 >= v19) : (v16 = 1), !v16))
            {
              v17 = v9;

              v19 = v15;
              v5 = v17;
              v6 = v13;
            }
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)sourceType
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "sourceType");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (int64_t)sourceSubtype
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "sourceSubtype");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (BOOL)hasPriorityOverride
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasPriorityOverride");
  else
    v4 = 0;

  return v4;
}

- (int64_t)priorityOverride
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "priorityOverride");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverResultScoreMetadata"));

  return (GEOServerResultScoreMetadata *)v3;
}

- (BOOL)hidden
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hidden");
  else
    v4 = 1;

  return v4;
}

- (NSArray)autocompletionStrings
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem, (_QWORD)v14))v10 = v9;
        else
          v10 = 0;

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "autocompletionStrings"));
          if (v11)
            objc_msgSend(v3, "addObjectsFromArray:", v11);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (BOOL)hasServerItemIndex
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem, (_QWORD)v11))v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        if (v8)
        {
          v9 = objc_msgSend(v6, "hasServerItemIndex");

          if ((v9 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_15;
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v3;
}

- (unint64_t)serverSectionIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithEarliestServerSectionAndIndexInSection](self, "autocompleteItemWithEarliestServerSectionAndIndexInSection"));
  v3 = objc_msgSend(v2, "serverSectionIndex");

  return (unint64_t)v3;
}

- (unint64_t)serverItemIndexInSection
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithEarliestServerSectionAndIndexInSection](self, "autocompleteItemWithEarliestServerSectionAndIndexInSection"));
  v3 = objc_msgSend(v2, "serverItemIndexInSection");

  return (unint64_t)v3;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 1;
}

- (id)leafPersonalizedAutocompleteItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem items](self, "items"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem items](self, "items"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = v6;
    if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem))
      v8 = v7;
    else
      v8 = 0;

    if (!v8)
    {
      v18 = &__NSArray0__struct;
      goto LABEL_21;
    }
    v25 = v7;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem items](self, "items"));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem items](self, "items", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
          if (objc_msgSend(v16, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedAutocompleteItem))
            v17 = v16;
          else
            v17 = 0;

          if (v17)
            objc_msgSend(v7, "addObject:", v16);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v9 = objc_msgSend(v7, "copy");
  }
  v18 = v9;
LABEL_21:

  return v18;
}

- (id)autocompleteObject
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestObjectPriority](self, "autocompleteItemWithHighestObjectPriority"));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "autocompleteObject"));
  else
    v4 = 0;

  return v4;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSArray count](self->_items, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_items, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p (%d items) name='%@'>"), v5, self, v6, v9));

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  PersonalizedCompoundItem *v4;
  PersonalizedCompoundItem *v5;
  uint64_t v6;
  PersonalizedCompoundItem *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = (PersonalizedCompoundItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v29 = 1;
  }
  else if (v4
         && (v6 = objc_opt_class(PersonalizedCompoundItem), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem keys](self, "keys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem keys](v7, "keys"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10
      && (-[PersonalizedCompoundItem coordinate](self, "coordinate"),
          v12 = v11,
          v14 = v13,
          -[PersonalizedCompoundItem coordinate](v7, "coordinate"),
          vabdd_f64(v12, v16) < 0.00000000999999994)
      && vabdd_f64(v14, v15) < 0.00000000999999994)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem title](self, "title"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem title](v7, "title"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
      if (objc_msgSend(v18, "isEqualToString:", v20))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem subtitle](self, "subtitle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "value"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem subtitle](v7, "subtitle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "value"));
        v39 = v22;
        if (objc_msgSend(v22, "isEqualToString:", v38))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem prefix](self, "prefix"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "value"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem prefix](v7, "prefix"));
          v36 = v24;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "value"));
          v25 = objc_msgSend(v24, "isEqualToString:");
          v26 = v23;
          if (v25)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem styleAttributes](self, "styleAttributes"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "styleAttributes"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem styleAttributes](v7, "styleAttributes"));
            v33 = v21;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "styleAttributes"));
            v29 = objc_msgSend(v27, "isEqual:", v28);

            v21 = v33;
          }
          else
          {
            v29 = 0;
          }

        }
        else
        {
          v29 = 0;
          v26 = v23;
        }

      }
      else
      {
        v29 = 0;
      }

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)wantsDisplayedSearchResultsTypePoints
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v6, "wantsDisplayedSearchResultsTypePoints") & 1) != 0
          && (objc_msgSend(v6, "wantsDisplayedSearchResultsTypePoints", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)containsPossiblePersonalizedItemSourceSubtype:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem possiblePersonalizedItemSourceSubtypes](self, "possiblePersonalizedItemSourceSubtypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)containsPossiblePersonalizedItemSourceType:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem possiblePersonalizedItemSourceTypes](self, "possiblePersonalizedItemSourceTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->source, a3);
}

- (NSSet)keys
{
  return self->_keys;
}

- (NSArray)items
{
  return self->_items;
}

- (PersonalizedItemPriorityFunction)priorityFunction
{
  return self->_priorityFunction;
}

- (PersonalizedCompoundItemAutocompleteAnalytics)autocompleteAnalytics
{
  return self->_autocompleteAnalytics;
}

- (void)setAutocompleteAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteAnalytics, a3);
}

- (BOOL)hasCachedAutocompleteItemWithHighestPriority
{
  return self->_hasCachedAutocompleteItemWithHighestPriority;
}

- (void)setHasCachedAutocompleteItemWithHighestPriority:(BOOL)a3
{
  self->_hasCachedAutocompleteItemWithHighestPriority = a3;
}

- (PersonalizedAutocompleteItem)cachedAutocompleteItemWithHighestPriority
{
  return (PersonalizedAutocompleteItem *)objc_loadWeakRetained((id *)&self->_cachedAutocompleteItemWithHighestPriority);
}

- (void)setCachedAutocompleteItemWithHighestPriority:(id)a3
{
  objc_storeWeak((id *)&self->_cachedAutocompleteItemWithHighestPriority, a3);
}

- (NSArray)possiblePersonalizedItemSourceTypes
{
  return self->_possiblePersonalizedItemSourceTypes;
}

- (void)setPossiblePersonalizedItemSourceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_possiblePersonalizedItemSourceTypes, a3);
}

- (NSArray)possiblePersonalizedItemSourceSubtypes
{
  return self->_possiblePersonalizedItemSourceSubtypes;
}

- (void)setPossiblePersonalizedItemSourceSubtypes:(id)a3
{
  objc_storeStrong((id *)&self->_possiblePersonalizedItemSourceSubtypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possiblePersonalizedItemSourceSubtypes, 0);
  objc_storeStrong((id *)&self->_possiblePersonalizedItemSourceTypes, 0);
  objc_destroyWeak((id *)&self->_cachedAutocompleteItemWithHighestPriority);
  objc_storeStrong((id *)&self->_autocompleteAnalytics, 0);
  objc_storeStrong((id *)&self->_priorityFunction, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_destroyWeak((id *)&self->source);
}

- (AutocompleteMatchInfo)matchInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem autocompleteItemWithHighestPriority](self, "autocompleteItemWithHighestPriority"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteItemWithMatchInfo))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "matchInfo"));
  else
    v3 = 0;

  return (AutocompleteMatchInfo *)v3;
}

@end
