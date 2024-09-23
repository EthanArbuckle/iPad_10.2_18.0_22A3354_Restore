@implementation PLAssetCluster

- (PLAssetCluster)initWithAssetsSortedByDate:(id)a3 region:(id)a4
{
  id v7;
  id v8;
  PLAssetCluster *v9;
  PLAssetCluster *v10;
  void *v11;
  uint64_t v12;
  NSDate *startDate;
  void *v14;
  uint64_t v15;
  NSDate *endDate;
  double v17;
  double v18;
  uint64_t v19;
  CLLocation *location;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLAssetCluster;
  v9 = -[PLAssetCluster init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateCreated");
    v12 = objc_claimAutoreleasedReturnValue();
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v12;

    objc_msgSend(v7, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateCreated");
    v15 = objc_claimAutoreleasedReturnValue();
    endDate = v10->_endDate;
    v10->_endDate = (NSDate *)v15;

    if (v8)
    {
      objc_msgSend(v8, "center");
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v17, v18);
      location = v10->_location;
      v10->_location = (CLLocation *)v19;

    }
  }

  return v10;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[CLLocation coordinate](self->_location, "coordinate");
  v4 = v3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PLAssetCluster;
  -[PLAssetCluster description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ start: %@, end %@, location {%.8f, %.8f}, assets %lu"), v8, self->_startDate, self->_endDate, v4, v6, -[NSArray count](self->_assets, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)assets
{
  return self->_assets;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

+ (id)mergedCluster:(id)a3
{
  id v3;
  void *v4;
  PLAssetCluster *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(v4, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
          if (v13 != v4)
          {
            objc_msgSend(v13, "assets", (_QWORD)v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObjectsFromArray:", v14);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    objc_msgSend(v8, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0C9E368]);
      objc_msgSend(v16, "coordinate");
      v19 = v18;
      v21 = v20;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v17, "initWithCenter:radius:identifier:", v23, v19, v21, 0.0);

    }
    else
    {
      v24 = 0;
    }
    v5 = -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", v7, v24);

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

+ (id)sortByTimeSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
