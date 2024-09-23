@implementation PLRegionsHierarchicalClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double latitude;
  double longitude;
  _BOOL4 v14;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;
  CLLocationCoordinate2D v46;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_81019);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v11, "pl_coordinate");
        latitude = v46.latitude;
        longitude = v46.longitude;
        if (CLLocationCoordinate2DIsValid(v46))
        {
          v14 = latitude != 0.0;
          if (longitude != 0.0)
            v14 = 1;
          if (v14 && (latitude != 40.0 || longitude != -100.0))
            objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }
  v32 = v6;
  -[PLRegionsHierarchicalClustering _processData:](self, "_processData:", v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRegionsHierarchicalClustering _postProcessClusters:](self, "_postProcessClusters:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        if (objc_msgSend(v23, "count"))
        {
          +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "meanRegion:", 50.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v20);
  }

  if (!objc_msgSend(v17, "count"))
  {
    +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "meanRegion:", 100.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, v28);

  }
  return v17;
}

- (id)_processData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  unint64_t v15;
  double v16;
  uint64_t j;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  PLHierarchicalClustering *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v5);
        +[PLRegionsHierarchicalClusteringObject clusterObjectWithObject:index:](PLRegionsHierarchicalClusteringObject, "clusterObjectWithObject:index:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v8 + i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

      }
      v8 += i;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v7);
  }
  v33 = v5;

  v12 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (unint64_t)((double)v12 + (double)v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v4;
  v35 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v35)
  {
    v15 = 0;
    v34 = *(_QWORD *)v41;
    v16 = 0.0;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v14);
        if (++v15 < v12)
        {
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          v19 = v15;
          do
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            __48__PLRegionsHierarchicalClustering__processData___block_invoke((uint64_t)v20, v18, v20);
            v22 = v21;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v23);

            if (v22 > v16)
              v16 = v22;

            ++v19;
          }
          while (v19 < v12);
        }
      }
      v35 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v35);
  }
  else
  {
    v16 = 0.0;
  }

  objc_msgSend(v13, "count");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "doubleValue");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v26);
  }

  v29 = -[PLDataClustering initWithDistanceBlock:]([PLHierarchicalClustering alloc], "initWithDistanceBlock:", &__block_literal_global_21);
  -[PLHierarchicalClustering setK:](v29, "setK:", 1);
  -[PLHierarchicalClustering setThreshold:](v29, "setThreshold:", fmax(v16 / 10.0, 1000.0));
  -[PLHierarchicalClustering performWithDataset:progressBlock:](v29, "performWithDataset:progressBlock:", v14, &__block_literal_global_25_81015);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "valueForKey:", CFSTR("objects"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_postProcessClusters:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t m;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  void *v36;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v54 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v50 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v10, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "index"));
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          }
          while (v13);
        }

        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke;
        v47[3] = &unk_1E3672F90;
        v47[4] = v11;
        v48 = v4;
        objc_msgSend(v10, "enumerateRangesWithOptions:usingBlock:", 0, v47);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v6);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        if (objc_msgSend(v22, "count") > v19)
          v19 = objc_msgSend(v22, "count");
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v23 = objc_msgSend(v16, "count");
  if (v23 >= 1)
  {
    v24 = vcvtpd_u64_f64((double)v19 / 6.0);
    for (m = v23 + 1; m > 1; --m)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", m - 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v26, "count") <= 3)
      {

      }
      else
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", m - 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v28 >= v24)
          continue;
      }
      objc_msgSend(v16, "removeObjectAtIndex:", m - 2);
    }
  }
  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = obj;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v40;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v40 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(v29, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n));
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
      }
      while (v32);
    }

    objc_msgSend(v16, "addObject:", v29);
  }
  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_33_81006);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "valueForKey:", CFSTR("object"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

void __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke_2;
  v7[3] = &__block_descriptor_48_e64_B24__0__PLRegionsHierarchicalClusteringObject_8__NSDictionary_16l;
  v7[4] = a2;
  v7[5] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

uint64_t __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pl_date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

BOOL __56__PLRegionsHierarchicalClustering__postProcessClusters___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(a2, "index");
  v4 = *(_QWORD *)(a1 + 32);
  return v3 >= v4 && v3 < *(_QWORD *)(a1 + 40) + v4;
}

uint64_t __48__PLRegionsHierarchicalClustering__processData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pl_coordinate");

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pl_coordinate");
  return CLLocationCoordinate2DGetDistanceFrom();
}

uint64_t __68__PLRegionsHierarchicalClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "pl_date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
