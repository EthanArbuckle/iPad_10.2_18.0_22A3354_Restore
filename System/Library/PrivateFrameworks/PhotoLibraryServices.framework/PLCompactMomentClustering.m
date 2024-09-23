@implementation PLCompactMomentClustering

- (PLCompactMomentClustering)initWithDataManager:(id)a3 frequentLocations:(id)a4
{
  PLCompactMomentClustering *v6;
  NSSet *v7;
  NSSet *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLCompactMomentClustering;
  v6 = -[PLCompactMomentClustering init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSSet *)objc_msgSend(a3, "locationsOfInterest");
    v6->_locationsOfInterest = v7;
    v8 = v7;
    v6->_frequentLocations = (NSSet *)a4;
    v9 = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCompactMomentClustering;
  -[PLCompactMomentClustering dealloc](&v3, sel_dealloc);
}

- (id)newAssetClusterFromAssetsSortedByDate:(id)a3
{
  return -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", a3, -[PLDataCluster approximateRegionWithMaximumRadius:](+[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:"), "approximateRegionWithMaximumRadius:", 100.0));
}

- (id)assetsByLocationTypeFromAssets:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = -[PLCompactMomentClustering _processedLocationTypeByAssetUUIDFromAssets:](self, "_processedLocationTypeByAssetUUIDFromAssets:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(v11, "uuid")), "unsignedShortValue");
        v13 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12));
        if (!v13)
        {
          v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12));
        }
        objc_msgSend(v13, "addObject:", v11);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)createAssetClustersForAssetsInDay:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  NSObject *Log;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t i;
  uint64_t v36;
  NSObject *v37;
  id v38;
  int v39;
  PLCompactMomentClustering *v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[7];
  _QWORD v56[5];
  _BYTE v57[128];
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t v60[128];
  uint8_t buf[4];
  unint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v46 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = _os_feature_enabled_impl();
  if (v39)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke;
    v56[3] = &unk_1E365FA70;
    v56[4] = v5;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v56);
    if (objc_msgSend(v5, "count"))
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v55[0] = v6;
      v55[1] = 3221225472;
      v55[2] = __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke_2;
      v55[3] = &unk_1E365FA98;
      v55[4] = a3;
      v55[5] = v46;
      v55[6] = v7;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v55);
      a3 = (id)objc_msgSend(a3, "mutableCopy");
      objc_msgSend(a3, "removeObjectsAtIndexes:", v7);
    }
    else
    {
      v8 = a3;
    }

  }
  v43 = objc_msgSend(a3, "count");
  if (v43 < 0x801)
  {
    objc_msgSend(v46, "addObjectsFromArray:", -[PLCompactMomentClustering _runDBSCANClusteringWithAssets:](self, "_runDBSCANClusteringWithAssets:", a3));
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "dateCreated"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(a3, "firstObject"), "dateCreated"));
    v10 = v9;
    Log = PLMomentsGetLog();
    v12 = os_log_type_enabled(Log, OS_LOG_TYPE_INFO);
    if (v10 >= 7200.0)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v62 = v43;
        _os_log_impl(&dword_199541000, Log, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Using partial clustering for %lu items.", buf, 0xCu);
      }
      v25 = 0;
      v26 = 0;
      v41 = a3;
      v42 = v43 - 1;
      v27 = 2048;
      v40 = self;
      do
      {
        while (1)
        {
          if (v25 + v27 >= v43)
            v27 = v43 - v25;
          v28 = -[PLCompactMomentClustering _runDBSCANClusteringWithAssets:](self, "_runDBSCANClusteringWithAssets:", objc_msgSend(a3, "subarrayWithRange:", v25, v27));
          v29 = objc_msgSend(v28, "count");
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v30)
            break;
          v26 = 0;
          v25 += v27;
          if (v25 > v42)
            goto LABEL_26;
        }
        v31 = v30;
        v44 = v27;
        v45 = v25;
        v32 = 0;
        v33 = *(_QWORD *)v52;
        v34 = v26;
        v26 = 0;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v52 != v33)
              objc_enumerationMutation(v28);
            v36 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            if (v29 - 1 - v32 == i)
            {
              if (v34)
              {
                v59[0] = v34;
                v59[1] = v36;
                v26 = +[PLAssetCluster mergedCluster:](PLAssetCluster, "mergedCluster:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2));
              }
              else
              {
                v26 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
              }
            }
            else if (-v32 == i && v34)
            {
              v58[0] = v34;
              v58[1] = v36;
              objc_msgSend(v46, "addObject:", +[PLAssetCluster mergedCluster:](PLAssetCluster, "mergedCluster:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2)));
              v34 = 0;
            }
            else
            {
              objc_msgSend(v46, "addObject:", v36);
            }
          }
          v32 += v31;
          v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        }
        while (v31);
        v27 = v44;
        v25 += v44;
        a3 = v41;
        self = v40;
      }
      while (v44 + v45 <= v42);
      if (v26)
        objc_msgSend(v46, "addObject:", v26);
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v62 = v43;
        _os_log_impl(&dword_199541000, Log, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Numbers of assets %lu exceeding clustering limit, but are close in time.", buf, 0xCu);
      }
      if (-[NSSet count](self->_locationsOfInterest, "count") || -[NSSet count](self->_frequentLocations, "count"))
      {
        v13 = PLMomentsGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Trying to split based off of home/work/frequentLocation before defaulting to tagging as one cluster.", buf, 2u);
        }
        v14 = -[PLCompactMomentClustering assetsByLocationTypeFromAssets:](self, "assetsByLocationTypeFromAssets:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3));
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v48;
          v18 = MEMORY[0x1E0C9AA60];
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v48 != v17)
                objc_enumerationMutation(v14);
              v20 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
              v21 = objc_msgSend((id)objc_msgSend(v20, "anyObject"), "assetComparisonSortDescriptors");
              if (v21)
                v22 = v21;
              else
                v22 = v18;
              v23 = -[PLCompactMomentClustering newAssetClusterFromAssetsSortedByDate:](self, "newAssetClusterFromAssetsSortedByDate:", objc_msgSend(v20, "sortedArrayUsingDescriptors:", v22));
              objc_msgSend(v46, "addObject:", v23);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          }
          while (v16);
        }
      }
      else
      {
        v37 = PLMomentsGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_INFO, "[MomentsGeneration].CompactMoments Not trying to split cluster based off locationType since locationsOfInterest and frequentLocations are empty. Tagging as one cluster.", buf, 2u);
        }
        v38 = -[PLCompactMomentClustering newAssetClusterFromAssetsSortedByDate:](self, "newAssetClusterFromAssetsSortedByDate:", a3);
        objc_msgSend(v46, "addObject:", v38);

      }
    }
  }
LABEL_26:
  objc_msgSend(v46, "sortUsingDescriptors:", +[PLAssetCluster sortByTimeSortDescriptors](PLAssetCluster, "sortByTimeSortDescriptors"));
  if (v39)

  return v46;
}

- (id)_runDBSCANClusteringWithAssets:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double latitude;
  double longitude;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CLLocationCoordinate2D v29;

  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return (id)MEMORY[0x1E0C9AA60];
  v5 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "pl_coordinate");
        latitude = v29.latitude;
        longitude = v29.longitude;
        if (!CLLocationCoordinate2DIsValid(v29))
          goto LABEL_16;
        v14 = latitude != 0.0;
        if (longitude != 0.0)
          v14 = 1;
        if (!v14 || (latitude == 40.0 ? (v15 = longitude == -100.0) : (v15 = 0), v16 = (void *)v5, v15))
LABEL_16:
          v16 = (void *)v6;
        objc_msgSend(v16, "addObject:", v11);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  v17 = -[PLCompactMomentClustering _clusterAssetsWithUsableLocation:](self, "_clusterAssetsWithUsableLocation:", v5);
  v18 = -[PLCompactMomentClustering _clusterAssetsWithUnusableLocation:](self, "_clusterAssetsWithUnusableLocation:", v6);
  v19 = -[PLCompactMomentClustering _assetClustersFromDataClusters:](self, "_assetClustersFromDataClusters:", v17);
  v20 = -[PLCompactMomentClustering _assetClustersFromDataClusters:](self, "_assetClustersFromDataClusters:", v18);
  if (objc_msgSend(v19, "count"))
  {
    if (objc_msgSend(v20, "count"))
      v20 = -[PLCompactMomentClustering _mergeAssetClustersWithLocation:withAssetClustersWithoutLocation:](self, "_mergeAssetClustersWithLocation:withAssetClustersWithoutLocation:", v19, v20);
    else
      v20 = v19;
  }
  v22 = (void *)objc_msgSend(v20, "mutableCopy");
  objc_msgSend(v22, "sortUsingDescriptors:", +[PLAssetCluster sortByTimeSortDescriptors](PLAssetCluster, "sortByTimeSortDescriptors"));
  return v22;
}

- (id)_mergeAssetClustersWithLocation:(id)a3 withAssetClustersWithoutLocation:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  double v31;
  double v32;
  PLAssetCluster *v33;
  uint64_t v34;
  uint64_t v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v36 = objc_msgSend(a3, "count");
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = a4;
  v39 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v52;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(obj);
        v41 = v5;
        v6 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v5);
        v7 = (void *)objc_msgSend(v6, "startDate");
        v8 = (void *)objc_msgSend(v6, "endDate");
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v48;
          v13 = 0x7FFFFFFFFFFFFFFFLL;
          v14 = -10800.0;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v48 != v12)
                objc_enumerationMutation(a3);
              objc_msgSend((id)objc_msgSend(v8, "earlierDate:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "endDate")), "timeIntervalSinceDate:", objc_msgSend(v7, "laterDate:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "startDate")));
              if (v16 > v14)
              {
                v14 = v16;
                v13 = v11 + i;
              }
            }
            v11 += v10;
            v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v10);
        }
        else
        {
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v18 = (void *)objc_msgSend(v40, "objectForKeyedSubscript:", v17);
        if (!v18)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v18, v17);
        }
        objc_msgSend(v18, "addObject:", v6);
        v5 = v41 + 1;
      }
      while (v41 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v39);
  }
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v36)
  {
    for (j = 0; j != v36; ++j)
    {
      v21 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", j);
      v22 = objc_msgSend(v40, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", j));
      if (v22)
      {
        v23 = (void *)v22;
        v24 = (void *)objc_msgSend((id)objc_msgSend(v21, "assets"), "mutableCopy");
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v44 != v27)
                objc_enumerationMutation(v23);
              objc_msgSend(v24, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "assets"));
            }
            v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v26);
        }
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v24, "sortUsingDescriptors:", objc_msgSend((id)objc_msgSend(v24, "firstObject"), "assetComparisonSortDescriptors"));
          v29 = (void *)objc_msgSend(v21, "location");
          if (v29)
          {
            v30 = objc_alloc(MEMORY[0x1E0C9E368]);
            objc_msgSend(v29, "coordinate");
            v29 = (void *)objc_msgSend(v30, "initWithCenter:radius:identifier:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), v31, v32, 0.0);
          }
          v33 = -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", v24, v29);
          objc_msgSend(v19, "addObject:", v33);

        }
        else
        {

        }
      }
      else
      {
        objc_msgSend(v19, "addObject:", v21);
      }
    }
  }
  v34 = objc_msgSend(v40, "objectForKeyedSubscript:", &unk_1E375D0C8);
  if (v34)
    objc_msgSend(v19, "addObjectsFromArray:", v34);
  return v19;
}

- (id)_assetClustersFromDataClusters:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  PLAssetCluster *v13;
  void *context;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "count");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  context = (void *)MEMORY[0x19AEC1554]();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "approximateRegionWithMaximumRadius:", 100.0);
        v12 = (void *)objc_msgSend(v10, "objects");
        v20 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pl_date"), 1);
        v13 = -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", objc_msgSend(v12, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1)), v11);
        objc_msgSend(v5, "addObject:", v13);

      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }
  objc_autoreleasePoolPop(context);
  return v5;
}

- (id)_processedLocationTypeByAssetUUIDFromAssets:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = -[PLCompactMomentClustering _validLocationTypeForBucketingAssets:](self, "_validLocationTypeForBucketingAssets:", +[PLMomentGenerationUtils locationTypeForAsset:locationsOfInterest:frequentLocations:](PLMomentGenerationUtils, "locationTypeForAsset:locationsOfInterest:frequentLocations:", v10, self->_locationsOfInterest, self->_frequentLocations));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v11), objc_msgSend(v10, "uuid"));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v5;
}

- (unsigned)_validLocationTypeForBucketingAssets:(unsigned __int16)a3
{
  if ((a3 - 1) > 4)
    return 6;
  else
    return word_199B9AE68[(unsigned __int16)(a3 - 1)];
}

- (id)_shareStateByAssetUUIDFromAssets:(id)a3 momentHasMixedOwnership:(BOOL *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  char v15;
  BOOL *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
  {
    v15 = 0;
    if (!a4)
      return v6;
    goto LABEL_9;
  }
  v8 = v7;
  v17 = a4;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "shareState", v17);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14), objc_msgSend(v13, "uuid"));
      v9 |= (_DWORD)v14 != 2;
      v10 |= (_DWORD)v14 == 2;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v8);
  v15 = v9 & v10;
  a4 = v17;
  if (v17)
LABEL_9:
    *a4 = v15 & 1;
  return v6;
}

- (id)_clusterAssetsWithUsableLocation:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *Log;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  PLDBSCANClustering *v17;
  PLDBSCANClustering *v18;
  _QWORD v20[6];
  char v21;
  uint8_t v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return (id)MEMORY[0x1E0C9AA60];
  if (-[NSSet count](self->_locationsOfInterest, "count") || -[NSSet count](self->_frequentLocations, "count"))
  {
    v5 = -[PLCompactMomentClustering _processedLocationTypeByAssetUUIDFromAssets:](self, "_processedLocationTypeByAssetUUIDFromAssets:", a3);
    v6 = (void *)objc_msgSend(v5, "allValues");
    v7 = objc_msgSend(v6, "firstObject");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "isEqualToNumber:", v7))
          {
            v13 = 1;
            goto LABEL_20;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
          continue;
        break;
      }
    }
    Log = PLMomentsGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, Log, OS_LOG_TYPE_INFO, "Not splitting assets based on location type: not more than one location type", buf, 2u);
    }
    v13 = 0;
  }
  else
  {
    v15 = PLMomentsGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Not splitting assets based on location type: locationsOfInterest and frequentLocations are empy", buf, 2u);
    }
    v13 = 0;
    v5 = 0;
  }
LABEL_20:
  buf[0] = 0;
  v16 = -[PLCompactMomentClustering _shareStateByAssetUUIDFromAssets:momentHasMixedOwnership:](self, "_shareStateByAssetUUIDFromAssets:momentHasMixedOwnership:", a3, buf);
  v17 = [PLDBSCANClustering alloc];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__PLCompactMomentClustering__clusterAssetsWithUsableLocation___block_invoke;
  v20[3] = &unk_1E365FAC0;
  v21 = v13;
  v22 = buf[0];
  v20[4] = v5;
  v20[5] = v16;
  v18 = -[PLDataClustering initWithDistanceBlock:](v17, "initWithDistanceBlock:", v20);
  -[PLDataDensityClustering setMaximumDistance:](v18, "setMaximumDistance:", 10800.0);
  -[PLDataDensityClustering setMinimumNumberOfObjects:](v18, "setMinimumNumberOfObjects:", 1);
  v14 = -[PLDBSCANClustering performWithDataset:progressBlock:](v18, "performWithDataset:progressBlock:", a3, 0);

  return v14;
}

- (id)_clusterAssetsWithUnusableLocation:(id)a3
{
  PLDBSCANClustering *v4;
  id v5;

  if (!objc_msgSend(a3, "count"))
    return (id)MEMORY[0x1E0C9AA60];
  v4 = -[PLDataClustering initWithDistanceBlock:]([PLDBSCANClustering alloc], "initWithDistanceBlock:", &__block_literal_global_235);
  -[PLDataDensityClustering setMaximumDistance:](v4, "setMaximumDistance:", 10800.0);
  -[PLDataDensityClustering setMinimumNumberOfObjects:](v4, "setMinimumNumberOfObjects:", 1);
  v5 = -[PLDBSCANClustering performWithDataset:progressBlock:](v4, "performWithDataset:progressBlock:", a3, 0);

  return v5;
}

double __64__PLCompactMomentClustering__clusterAssetsWithUnusableLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v3;

  objc_msgSend((id)objc_msgSend(a2, "pl_date"), "timeIntervalSinceDate:", objc_msgSend(a3, "pl_date"));
  return fabs(v3);
}

double __62__PLCompactMomentClustering__clusterAssetsWithUsableLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v6;
  double v7;
  int v8;
  char v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21;

  objc_msgSend((id)objc_msgSend(a2, "pl_date"), "timeIntervalSinceDate:", objc_msgSend(a3, "pl_date"));
  v7 = fabs(v6);
  if (v7 <= 10800.0)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(a2, "pl_uuid")), "unsignedShortValue");
      if (v8 != objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(a3, "pl_uuid")), "unsignedShortValue"))return 10801.0;
    }
    if (*(_BYTE *)(a1 + 49))
    {
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", objc_msgSend(a2, "pl_uuid")), "unsignedShortValue");
      v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", objc_msgSend(a3, "pl_uuid")), "unsignedShortValue");
      v11 = v9 == 2 && v10 != 2 || v9 != 2 && v10 == 2;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(a2, "pl_coordinate");
    objc_msgSend(a3, "pl_coordinate");
    objc_msgSend(a2, "pl_gpsHorizontalAccuracy", v13, v14);
    v16 = fmin(fmax(v15, 0.0), 5000.0);
    objc_msgSend(a3, "pl_gpsHorizontalAccuracy");
    v18 = fmin(fmax(v17, 0.0), 5000.0);
    CLLocationCoordinate2DGetDistanceFrom();
    v20 = fmax(v19 + (v16 + v18) * -0.5, 0.0);
    if (v7 > 300.0 || v11)
    {
      v21 = v7 > 7200.0 || v11;
      if ((v21 & 1) != 0)
      {
        return v20 * 3.6 + 7200.0;
      }
      else if (v20 / v7 >= 60.0)
      {
        return 10801.0;
      }
    }
    else if (v20 >= 10000.0)
    {
      return 10801.0;
    }
  }
  return v7;
}

uint64_t __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  void *v8;

  result = +[PLMomentGenerationUtils shouldConsiderAssetAsOutlierForMomentClustering:](PLMomentGenerationUtils, "shouldConsiderAssetAsOutlierForMomentClustering:", a2);
  if ((_DWORD)result)
  {
    result = +[PLMomentGenerationUtils externalOriginatorStateForAsset:](PLMomentGenerationUtils, "externalOriginatorStateForAsset:", a2);
    if ((_DWORD)result)
    {
      v7 = result;
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", result));
      if (!v8)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v7));
      }
      return objc_msgSend(v8, "addIndex:", a3);
    }
  }
  return result;
}

uint64_t __63__PLCompactMomentClustering_createAssetClustersForAssetsInDay___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  PLAssetCluster *v5;

  v5 = -[PLAssetCluster initWithAssetsSortedByDate:region:]([PLAssetCluster alloc], "initWithAssetsSortedByDate:region:", objc_msgSend(a1[4], "objectsAtIndexes:", a3), 0);
  objc_msgSend(a1[5], "addObject:", v5);

  return objc_msgSend(a1[6], "addIndexes:", a3);
}

@end
