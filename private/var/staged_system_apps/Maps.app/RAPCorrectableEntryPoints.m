@implementation RAPCorrectableEntryPoints

- (RAPCorrectableEntryPoints)initWithGEORoadAccessPoints:(id)a3
{
  id v4;
  RAPCorrectableEntryPoints *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *originalPoints;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *addedPoints;
  uint64_t v29;
  NSMutableArray *correctedPoints;
  uint64_t v31;
  NSMutableArray *deletedPoints;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _QWORD v47[6];

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)RAPCorrectableEntryPoints;
  v5 = -[RAPCorrectableEntryPoints init](&v45, "init");
  if (v5)
  {
    v39 = objc_msgSend(v4, "count");
    v34 = v4;
    v6 = sub_10039DCD4(v4, &stru_1011E0EE0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isDestinationEntryPoint == YES")));
    v9 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryPointType == %d"), 0));
    v10 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryPointType == %d"), 1));
    v11 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryPointType == %d"), 2));
    v12 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryPointType == %d"), 4));
    v13 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryPointType == %d"), 3));
    v14 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryPointType == %d"), 5));
    v40 = (void *)v9;
    v47[0] = v9;
    v47[1] = v10;
    v37 = (void *)v11;
    v38 = (void *)v10;
    v47[2] = v11;
    v47[3] = v13;
    v35 = (void *)v13;
    v36 = (void *)v12;
    v15 = (void *)v14;
    v47[4] = v12;
    v47[5] = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 6));
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    originalPoints = v5->_originalPoints;
    v5->_originalPoints = (NSMutableArray *)v17;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v42;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v23)));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filteredArrayUsingPredicate:", v8));
          if (objc_msgSend(v25, "count"))
            v26 = v25;
          else
            v26 = v24;
          -[NSMutableArray addObjectsFromArray:](v5->_originalPoints, "addObjectsFromArray:", v26);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v21);
    }

    v27 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v39));
    addedPoints = v5->_addedPoints;
    v5->_addedPoints = (NSMutableArray *)v27;

    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v39));
    correctedPoints = v5->_correctedPoints;
    v5->_correctedPoints = (NSMutableArray *)v29;

    v31 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v39));
    deletedPoints = v5->_deletedPoints;
    v5->_deletedPoints = (NSMutableArray *)v31;

    v4 = v34;
  }

  return v5;
}

- (BOOL)isEdited
{
  return -[NSMutableArray count](self->_addedPoints, "count")
      || -[NSMutableArray count](self->_correctedPoints, "count")
      || -[NSMutableArray count](self->_deletedPoints, "count") != 0;
}

- (void)modifyEntryPoint:(id)a3 withCoordinates:(CLLocationCoordinate2D)a4 entryPointType:(int64_t)a5
{
  double longitude;
  double latitude;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v16 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectableEntryPoints _entryPointWithCoordinates:entryPointType:](self, "_entryPointWithCoordinates:entryPointType:", a5, latitude, longitude));
  if (-[NSMutableArray containsObject:](self->_originalPoints, "containsObject:", v16))
  {
    -[NSMutableArray removeObject:](self->_originalPoints, "removeObject:", v16);
    v10 = objc_alloc_init((Class)GEORPEditedAccessPoint);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessPoint"));
    objc_msgSend(v10, "setOriginal:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessPoint"));
    objc_msgSend(v10, "setCorrected:", v12);

    -[NSMutableArray addObject:](self->_correctedPoints, "addObject:", v10);
  }
  else if (-[NSMutableArray containsObject:](self->_addedPoints, "containsObject:", v16))
  {
    -[NSMutableArray removeObject:](self->_addedPoints, "removeObject:", v16);
    -[NSMutableArray addObject:](self->_addedPoints, "addObject:", v9);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessPoint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectableEntryPoints editedPointWithCorrectedPoint:](self, "editedPointWithCorrectedPoint:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessPoint"));
    objc_msgSend(v14, "setCorrected:", v15);

  }
}

- (id)_entryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4
{
  double longitude;
  double latitude;
  id v7;
  id v8;
  RAPEntryPoint *v9;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = objc_alloc_init((Class)GEOLatLng);
  objc_msgSend(v7, "setLat:", latitude);
  objc_msgSend(v7, "setLng:", longitude);
  v8 = objc_alloc_init((Class)GEORoadAccessPoint);
  objc_msgSend(v8, "setLocation:", v7);
  v9 = -[RAPEntryPoint initWithAccessPoint:type:]([RAPEntryPoint alloc], "initWithAccessPoint:type:", v8, a4);

  return v9;
}

- (id)createEntryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectableEntryPoints _entryPointWithCoordinates:entryPointType:](self, "_entryPointWithCoordinates:entryPointType:", a4, a3.latitude, a3.longitude));
  -[NSMutableArray addObject:](self->_addedPoints, "addObject:", v5);
  return v5;
}

- (void)removeEntryPoint:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableArray containsObject:](self->_originalPoints, "containsObject:"))
    -[NSMutableArray addObject:](self->_deletedPoints, "addObject:", v6);
  -[NSMutableArray removeObject:](self->_originalPoints, "removeObject:", v6);
  -[NSMutableArray removeObject:](self->_addedPoints, "removeObject:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessPoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectableEntryPoints editedPointWithCorrectedPoint:](self, "editedPointWithCorrectedPoint:", v4));

  if (v5)
    -[NSMutableArray removeObject:](self->_correctedPoints, "removeObject:", v5);

}

- (id)editedPointWithCorrectedPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A70ED8;
  v9[3] = &unk_1011E0F08;
  v10 = a3;
  v4 = v10;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v9));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](self->_correctedPoints, "filteredArrayUsingPredicate:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  return v7;
}

- (NSArray)removedPoints
{
  return (NSArray *)sub_10039DCD4(self->_deletedPoints, &stru_1011E0F48);
}

- (NSArray)addedPoints
{
  return (NSArray *)sub_10039DCD4(self->_addedPoints, &stru_1011E0F68);
}

- (NSArray)correctedPoints
{
  return (NSArray *)-[NSMutableArray copy](self->_correctedPoints, "copy");
}

- (NSArray)workingPoints
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  RAPEntryPoint *v12;
  void *v13;
  RAPEntryPoint *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__NSArray0__struct, "arrayByAddingObjectsFromArray:", self->_originalPoints));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_addedPoints));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_correctedPoints;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v12 = [RAPEntryPoint alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "corrected", (_QWORD)v16));
        v14 = -[RAPEntryPoint initWithAccessPoint:](v12, "initWithAccessPoint:", v13);
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObject:", v14));

        v9 = (char *)v9 + 1;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_originalPoints));
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_deletedPoints));
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_addedPoints));
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_correctedPoints));
  v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedPoints, 0);
  objc_storeStrong((id *)&self->_addedPoints, 0);
  objc_storeStrong((id *)&self->_deletedPoints, 0);
  objc_storeStrong((id *)&self->_originalPoints, 0);
}

@end
