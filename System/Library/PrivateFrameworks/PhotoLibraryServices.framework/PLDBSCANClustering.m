@implementation PLDBSCANClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  PLSamplingClustering *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  double *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  PLDBSCANClustering *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  CFMutableSetRef cf;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  PLDBSCANClustering *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = self;
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x801)
  {
    v8 = objc_alloc_init(PLSamplingClustering);
    -[PLSamplingClustering setNumberOfClusters:](v8, "setNumberOfClusters:", 2048);
    v9 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke;
    v41[3] = &unk_1E3668B10;
    v42 = v7;
    -[PLSamplingClustering performWithDataset:progressBlock:](v8, "performWithDataset:progressBlock:", v6, v41);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2048);
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke_2;
    v39[3] = &unk_1E3668B38;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v40 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v39);
    v12 = v11;

    v6 = v12;
    self = v34;
  }
  v13 = objc_msgSend(v6, "count");
  v14 = -[PLDataClustering createDistancesFlatMatrixForDataset:](self, "createDistancesFlatMatrixForDataset:", v6);
  v15 = malloc_type_calloc(8uLL, v13, 0x7A2DFF3FuLL);
  v33 = v13;
  cf = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects"))
    v32 = -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects") - 1;
  else
    v32 = 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v17)
  {
    v18 = v17;
    v28 = v7;
    v19 = 0;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v16);
        if (!v15[v19])
        {
          v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v15[v19] = 1;
          -[PLDBSCANClustering _neighborsAtIndex:withDistancesFlatMatrix:datasetSize:](self, "_neighborsAtIndex:withDistancesFlatMatrix:datasetSize:", v19, v14, v33);
          v23 = self;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count") >= v32)
          {
            -[PLDBSCANClustering _expandClusterForObject:dataset:objectsMappedToCluster:visitedObjects:distancesFlatMatrix:neighbors:](v23, "_expandClusterForObject:dataset:objectsMappedToCluster:visitedObjects:distancesFlatMatrix:neighbors:", v22, v16, cf, v15, v14, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v25);

          }
          else
          {
            objc_msgSend(v31, "addObject:", v22);
          }

          self = v34;
        }
        ++v19;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v18);

    v7 = v28;
    goto LABEL_20;
  }

  if (v15)
LABEL_20:
    free(v15);
  -[PLDataClustering freeDistancesFlatMatrix:](self, "freeDistancesFlatMatrix:", v14);
  CFRelease(cf);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_neighborsAtIndex:(unint64_t)a3 withDistancesFlatMatrix:(double *)a4 datasetSize:(unint64_t)a5
{
  void *v9;
  double v10;
  double v11;
  unint64_t v12;

  v9 = (void *)objc_opt_new();
  -[PLDataDensityClustering maximumDistance](self, "maximumDistance");
  if (a5)
  {
    v11 = v10;
    v12 = 0;
    do
    {
      if (a3 != v12 && a4[-[PLDataClustering flatMatrixIndexForRow:andColumn:]((uint64_t)self, v12, a3)] <= v11)
        objc_msgSend(v9, "addIndex:", v12);
      ++v12;
    }
    while (a5 != v12);
  }
  return v9;
}

- (id)_expandClusterForObject:(id)a3 dataset:(id)a4 objectsMappedToCluster:(__CFSet *)a5 visitedObjects:(unint64_t *)a6 distancesFlatMatrix:(double *)a7 neighbors:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD v29[4];
  id v30;
  id v31;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "addObject:", v13);
  v24 = v13;
  CFSetAddValue(a5, v13);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v15;
  objc_msgSend(v17, "addIndexes:", v15);
  v27 = objc_msgSend(v14, "count");
  while (objc_msgSend(v17, "count"))
  {
    v18 = objc_msgSend(v17, "firstIndex", v24);
    objc_msgSend(v14, "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a6[v18])
    {
      a6[v18] = 1;
      -[PLDBSCANClustering _neighborsAtIndex:withDistancesFlatMatrix:datasetSize:](self, "_neighborsAtIndex:withDistancesFlatMatrix:datasetSize:", v18, a7, v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      if (v21 >= -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects"))
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __122__PLDBSCANClustering__expandClusterForObject_dataset_objectsMappedToCluster_visitedObjects_distancesFlatMatrix_neighbors___block_invoke;
        v29[3] = &unk_1E3675358;
        v30 = v26;
        v31 = v17;
        objc_msgSend(v20, "enumerateIndexesUsingBlock:", v29);

      }
    }
    if (!CFSetContainsValue(a5, v19))
    {
      objc_msgSend(v16, "addObject:", v19);
      CFSetAddValue(a5, v19);
    }
    objc_msgSend(v17, "removeIndex:", v18);

  }
  +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v16, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __122__PLDBSCANClustering__expandClusterForObject_dataset_objectsMappedToCluster_visitedObjects_distancesFlatMatrix_neighbors___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  }
  return result;
}

uint64_t __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(a2 * 0.1);
  return result;
}

void __55__PLDBSCANClustering_performWithDataset_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
