@implementation PLDataCluster

- (id)locations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double latitude;
  double longitude;
  _BOOL4 v13;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CLLocationCoordinate2D v23;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PLDataCluster objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PLDataCluster objects](self, "objects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "pl_coordinate");
        latitude = v23.latitude;
        longitude = v23.longitude;
        if (CLLocationCoordinate2DIsValid(v23))
        {
          v13 = latitude != 0.0;
          if (longitude != 0.0)
            v13 = 1;
          if (v13 && (latitude != 40.0 || longitude != -100.0))
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
            objc_msgSend(v5, "addObject:", v15);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)universalDates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PLDataCluster objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLDataCluster objects](self, "objects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "pl_date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)approximateRegionWithMaximumRadius:(double)a3
{
  PLDBSCANClustering *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  BOOL v21;
  id v22;
  id v23;
  PLDBSCANClustering *v25;
  id obj;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = -[PLDataClustering initWithDistanceBlock:]([PLDBSCANClustering alloc], "initWithDistanceBlock:", &__block_literal_global_79406);
  -[PLDataDensityClustering setMaximumDistance:](v5, "setMaximumDistance:", a3);
  -[PLDataDensityClustering setMinimumNumberOfObjects:](v5, "setMinimumNumberOfObjects:", 1);
  -[PLDataCluster objects](self, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  -[PLDBSCANClustering performWithDataset:progressBlock:](v5, "performWithDataset:progressBlock:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v13, "meanRegion:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (!v11)
            goto LABEL_9;
          objc_msgSend(v10, "objects");
          v27 = v10;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          objc_msgSend(v13, "objects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v11;
          v20 = objc_msgSend(v18, "count");

          v10 = v27;
          v21 = v17 >= v20;
          v11 = v19;
          if (!v21)
          {
LABEL_9:
            v22 = v15;

            v23 = v13;
            v10 = v23;
            v11 = v22;
          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  return v11;
}

- (id)meanRegion:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  double v41;
  uint64_t v42;
  void *v43;
  id v44;
  CLLocationCoordinate2D v45;
  void *v46;
  void *v47;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;
  CLLocationCoordinate2D v61;
  CLLocationCoordinate2D v62;

  v60 = *MEMORY[0x1E0C80C00];
  -[PLDataCluster locations](self, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (!v5)
    goto LABEL_46;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v55;
  v9 = 0.0;
  v10 = 0.0;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v55 != v8)
        objc_enumerationMutation(v4);
      v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v11);
      objc_msgSend(v12, "coordinate");
      v14 = v13;
      v16 = v15;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v12 == (void *)v17)
      {

      }
      else
      {
        v18 = (void *)v17;
        v61.latitude = v14;
        v61.longitude = v16;
        if (!CLLocationCoordinate2DIsValid(v61))
          goto LABEL_12;
        v19 = v14 != 0.0;
        if (v16 != 0.0)
          v19 = 1;
        if (v19)
        {

          if (v14 != 40.0 || v16 != -100.0)
          {
            v10 = v10 + v14;
            v9 = v9 + v16;
            ++v7;
          }
        }
        else
        {
LABEL_12:

        }
      }
      ++v11;
    }
    while (v6 != v11);
    v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    v6 = v21;
  }
  while (v21);
  if (v7)
  {
    v22 = (double)v7;
    v23 = v10 / (double)v7;
    v24 = v9 / (double)v7;
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v23, v24);
    v25 = 10.0;
    if (v7 != 1)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v26 = v4;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v51;
        v30 = 0.0;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v51 != v29)
              objc_enumerationMutation(v26);
            v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v31);
            objc_msgSend(v32, "coordinate");
            v34 = v33;
            v36 = v35;
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v37 = objc_claimAutoreleasedReturnValue();
            if (v32 == (void *)v37)
            {

            }
            else
            {
              v38 = (void *)v37;
              v62.latitude = v34;
              v62.longitude = v36;
              if (!CLLocationCoordinate2DIsValid(v62))
                goto LABEL_35;
              v39 = v34 != 0.0;
              if (v36 != 0.0)
                v39 = 1;
              if (v39)
              {

                if (v34 != 40.0 || v36 != -100.0)
                {
                  objc_msgSend(v49, "distanceFromLocation:", v32);
                  v30 = v30 + v41;
                }
              }
              else
              {
LABEL_35:

              }
            }
            ++v31;
          }
          while (v28 != v31);
          v42 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          v28 = v42;
        }
        while (v42);
      }
      else
      {
        v30 = 0.0;
      }

      if (v30 / v22 >= a3)
        v25 = v30 / v22;
      else
        v25 = a3;
    }
    v44 = objc_alloc(MEMORY[0x1E0C9E368]);
    v45 = CLLocationCoordinate2DMake(v23, v24);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "UUIDString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v44, "initWithCenter:radius:identifier:", v47, v45.latitude, v45.longitude, v25);

  }
  else
  {
LABEL_46:
    v43 = 0;
  }

  return v43;
}

- (id)meanUniversalDate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  void *v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLDataCluster universalDates](self, "universalDates", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "timeIntervalSince1970");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  -[PLDataCluster objects](self, "objects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 / (double)(unint64_t)objc_msgSend(v10, "count");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

double __77__PLDataCluster_PLRegionsClusteringItem__approximateRegionWithMaximumRadius___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "pl_coordinate");
  objc_msgSend(v4, "pl_coordinate");
  v15 = v6;
  v16 = v7;
  CLLocationCoordinate2DGetDistanceFrom();
  v9 = v8;
  objc_msgSend(v5, "pl_date", v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pl_date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = fabs(v12) / 7200.0;

  return v9 + v13;
}

- (PLDataCluster)init
{
  PLDataCluster *v2;
  uint64_t v3;
  NSArray *objects;
  id clustroid;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLDataCluster;
  v2 = -[PLDataCluster init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    objects = v2->_objects;
    v2->_objects = (NSArray *)v3;

    clustroid = v2->_clustroid;
    v2->_diameter = 0.0;
    v2->_clustroid = 0;

    v2->_score = 1.0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> - count:%ld score:%lf"), v5, self, -[NSArray count](self->_objects, "count"), *(_QWORD *)&self->_score);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_diameter != 0.0)
    objc_msgSend(v6, "appendFormat:", CFSTR(" diameter:%lf"), *(_QWORD *)&self->_diameter);
  if (self->_clustroid)
    objc_msgSend(v6, "appendFormat:", CFSTR(" clustroid:\"%@\"), self->_clustroid);
  return v6;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (id)clustroid
{
  return self->_clustroid;
}

- (void)setClustroid:(id)a3
{
  objc_storeStrong(&self->_clustroid, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clustroid, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

+ (id)clusterWithObjects:(id)a3 clustroid:(id)a4 diameter:(double)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_opt_class();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObjects:", v8);

  objc_msgSend(v9, "setDiameter:", a5);
  objc_msgSend(v9, "setScore:", 1.0);
  objc_msgSend(v9, "setClustroid:", v7);

  return v9;
}

+ (id)clusterWithObjects:(id)a3
{
  return (id)objc_msgSend(a1, "clusterWithObjects:clustroid:diameter:", a3, 0, 0.0);
}

@end
