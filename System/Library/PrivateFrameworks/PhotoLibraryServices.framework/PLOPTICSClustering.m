@implementation PLOPTICSClustering

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v7;
  void (**v8)(id, _BYTE *);
  uint64_t v9;
  NSProgress *v10;
  NSProgress *progress;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  void *v24;
  uint64_t v25;
  SEL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  SEL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[9];

  v7 = a3;
  v8 = (void (**)(id, _BYTE *))a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLOPTICSClustering.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataset.count > 0"));

  }
  v41[0] = 0;
  v9 = 3 * objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v9);
  v10 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v10;

  -[PLOPTICSClustering preprocessData:](self, "preprocessData:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  -[PLOPTICSClustering orderedDatasetByReachabilityDistance:](self, "orderedDatasetByReachabilityDistance:", v12);
  v29 = (void *)v12;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOPTICSClustering extractRootClusters:inOriginalDataset:inProgressBlock:](self, "extractRootClusters:inOriginalDataset:inProgressBlock:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v25 = v9;
    v26 = a2;
    v28 = v7;
    v27 = v13;
    v15 = objc_msgSend(v14, "count");
    v16 = 0;
    v17 = 0;
    do
    {
      if (v17 >= objc_msgSend(v30, "count"))
        break;
      if (v16 >= v15)
      {
        v21 = v17;
        v20 = v16;
      }
      else
      {
        while (1)
        {
          objc_msgSend(v14, "objectAtIndex:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLOPTICSClustering extractSubClusters:inDataset:parentIndex:inProgressBlock:](self, "extractSubClusters:inDataset:parentIndex:inProgressBlock:", v18, v29, v16, v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "count"))
          {
            v20 = objc_msgSend(v14, "count");
            objc_msgSend(v14, "addObjectsFromArray:", v19);
          }
          else
          {
            v20 = -1;
          }
          v15 = objc_msgSend(v14, "count");
          -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress completedUnitCount](self->_progress, "completedUnitCount") + 1);
          if (v8)
          {
            -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
            v8[2](v8, v41);
          }
          if (v41[0])
            break;
          v21 = v17 + 1;
          if (v17 + 1 >= objc_msgSend(v30, "count"))
            break;
          ++v16;

          ++v17;
          if (v16 >= v15)
            goto LABEL_18;
        }
        v21 = v17 + 1;

      }
LABEL_18:
      v16 = v20;
      v17 = v21;
    }
    while (v20 != -1);
    if (v41[0])
    {
      v22 = (id)MEMORY[0x1E0C9AA60];
      v7 = v28;
    }
    else
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__22384;
      v39 = __Block_byref_object_dispose__22385;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __55__PLOPTICSClustering_performWithDataset_progressBlock___block_invoke;
      v31[3] = &unk_1E3666700;
      v34 = v26;
      v31[4] = self;
      v7 = v28;
      v32 = v28;
      v33 = &v35;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v31);
      -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v25);
      if (v8)
      {
        -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
        v8[2](v8, v41);
      }
      v22 = (id)v36[5];

      _Block_object_dispose(&v35, 8);
    }
    v13 = v27;
  }
  else
  {
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v9);
    if (v8)
    {
      -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
      v8[2](v8, v41);
    }
    v22 = v14;
  }

  return v22;
}

- (id)extractRootClusters:(id)a3 inOriginalDataset:(id)a4 inProgressBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  SEL v40;
  _QWORD v41[3];
  char v42;
  _QWORD v43[4];
  _QWORD v44[5];
  id v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__22384;
  v44[4] = __Block_byref_object_dispose__22385;
  v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __76__PLOPTICSClustering_extractRootClusters_inOriginalDataset_inProgressBlock___block_invoke;
  v32[3] = &unk_1E3666728;
  v37 = v44;
  v38 = v43;
  v32[4] = self;
  v13 = v10;
  v33 = v13;
  v40 = a2;
  v14 = v12;
  v34 = v14;
  v15 = v9;
  v35 = v15;
  v16 = v11;
  v36 = v16;
  v39 = v41;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v32);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");

    if (objc_msgSend(v15, "count") - v19 == 2)
    {
      v31 = objc_msgSend(v17, "indexRange");
      objc_msgSend(v17, "indexRange");
      v30 = v20;
      objc_msgSend(v17, "rootLevel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");
      objc_msgSend(v17, "minCoreDistanceIndex");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");
      objc_msgSend(v17, "minCoreDistance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      +[PLOPTICSClusterDescriptor clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:](PLOPTICSClusterDescriptor, "clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:", v31, v30 + 1, v22, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "removeLastObject");
      objc_msgSend(v14, "addObject:", v26);

    }
  }
  v27 = v36;
  v28 = v14;

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);

  return v28;
}

- (id)extractSubClusters:(id)a3 inDataset:(id)a4 parentIndex:(int64_t)a5 inProgressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  PLOPTICSClustering *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD *v29;
  int64_t v30;
  _QWORD v31[3];
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[4];
  _QWORD v40[5];
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v10, "indexRange");
  -[PLOPTICSClustering prepareOrderedDatasetIndexRange:inDataset:](self, "prepareOrderedDatasetIndexRange:inDataset:", v13, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__22384;
  v40[4] = __Block_byref_object_dispose__22385;
  v41 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__22384;
  v37 = __Block_byref_object_dispose__22385;
  v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__PLOPTICSClustering_extractSubClusters_inDataset_parentIndex_inProgressBlock___block_invoke;
  v21[3] = &unk_1E3666750;
  v26 = v40;
  v16 = v11;
  v22 = v16;
  v27 = v39;
  v17 = v10;
  v23 = v17;
  v24 = self;
  v30 = a5;
  v28 = &v33;
  v18 = v12;
  v25 = v18;
  v29 = v31;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);
  v19 = (id)v34[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);

  return v19;
}

- (id)preprocessData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__22384;
  v17 = __Block_byref_object_dispose__22385;
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__PLOPTICSClustering_preprocessData___block_invoke;
  v12[3] = &unk_1E366E278;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v14[5], "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  do
  {
    if (v7 == -1)
      break;
    objc_msgSend((id)v14[5], "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOrder:", v6);
    -[PLOPTICSClustering updateNeighbors:forIndex:](self, "updateNeighbors:forIndex:", v14[5], v7);
    v7 = -[PLOPTICSClustering updateReachibilityDistance:forIndex:](self, "updateReachibilityDistance:forIndex:", v14[5], v7);
    if (v7 < 0)
    {
      v9 = objc_msgSend((id)v14[5], "indexOfObjectPassingTest:", &__block_literal_global_116);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        v7 = -1;
      else
        v7 = v9;
    }
    objc_msgSend(v5, "addObject:", v8);
    v10 = objc_msgSend((id)v14[5], "count");
    ++v6;

  }
  while (v6 < v10);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (id)orderedDatasetByReachabilityDistance:(id)a3
{
  void *v3;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_119);
  return v3;
}

- (id)prepareOrderedDatasetIndexRange:(_NSRange)a3 inDataset:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLOPTICSClustering.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexRange.location != NSNotFound"));

  }
  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v8, "subarrayWithRange:", location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_122_22382);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_123);

  return v12;
}

- (void)updateNeighbors:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProcessed:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (a4 != v9 && (objc_msgSend(v10, "processed") & 1) == 0)
      {
        -[PLDataClustering distanceBlock](self, "distanceBlock");
        v12 = (double (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "object");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = ((double (**)(_QWORD, void *, void *))v12)[2](v12, v13, v14);

        -[PLDataDensityClustering maximumDistance](self, "maximumDistance");
        if (v15 <= v16)
        {
          v20[0] = CFSTR("originalIndex");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20[1] = CFSTR("distance");
          v21[0] = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v19);

        }
      }

      ++v9;
    }
    while (v9 < objc_msgSend(v6, "count"));
  }
  objc_msgSend(v7, "registerNeighbors:deleteExisting:", v8, 1);

}

- (int64_t)updateReachibilityDistance:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  BOOL v22;
  double v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  int64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  unint64_t v45;

  v6 = a3;
  -[PLDataDensityClustering maximumDistance](self, "maximumDistance");
  v8 = v7;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "neighbors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects");

  if (v11 < v12)
  {
    -[PLDataDensityClustering maximumDistance](self, "maximumDistance");
    objc_msgSend(v9, "setCoreDistance:", v13 + 1.0);
    objc_msgSend(v9, "neighbors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = 0;
      do
      {
        objc_msgSend(v9, "neighborAtIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("originalIndex"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        objc_msgSend(v6, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "reachabilityDistance");
        v22 = v21 <= 3.40282347e38;
        v23 = 3.40282347e38;
        if (v22)
          objc_msgSend(v20, "reachabilityDistance", 3.40282347e38);
        objc_msgSend(v20, "setReachabilityDistance:", v23);

        ++v16;
        objc_msgSend(v9, "neighbors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

      }
      while (v16 < v25);
    }
    goto LABEL_21;
  }
  objc_msgSend(v9, "sortNeighborsByDistance");
  objc_msgSend(v9, "updateCoreDistanceForNeighbor:", -[PLDataDensityClustering minimumNumberOfObjects](self, "minimumNumberOfObjects") - 1);
  objc_msgSend(v9, "neighbors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (!v27)
  {
LABEL_21:
    v29 = -1;
    goto LABEL_22;
  }
  v28 = 0;
  v29 = -1;
  do
  {
    objc_msgSend(v9, "neighborAtIndex:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("originalIndex"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedIntegerValue");

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("distance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    objc_msgSend(v9, "coreDistance");
    if (v36 > v35)
    {
      objc_msgSend(v9, "coreDistance");
      v35 = v37;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "reachabilityDistance");
    if (v35 >= v39)
    {
      objc_msgSend(v38, "reachabilityDistance");
      v35 = v40;
    }
    objc_msgSend(v38, "setReachabilityDistance:", v35);
    objc_msgSend(v38, "reachabilityDistance");
    if (v8 >= v41)
    {
      objc_msgSend(v38, "reachabilityDistance");
      v8 = v42;
    }
    objc_msgSend(v38, "reachabilityDistance");
    if (v8 == v43)
      v29 = v32;

    ++v28;
    objc_msgSend(v9, "neighbors");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

  }
  while (v28 < v45);
LABEL_22:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

uint64_t __64__PLOPTICSClustering_prepareOrderedDatasetIndexRange_inDataset___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProcessed:", 0);
}

uint64_t __64__PLOPTICSClustering_prepareOrderedDatasetIndexRange_inDataset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "reachabilityDistance");
  v6 = v5;
  objc_msgSend(v4, "reachabilityDistance");
  v8 = v7;

  if (v6 < v8)
    return 1;
  else
    return -1;
}

uint64_t __59__PLOPTICSClustering_orderedDatasetByReachabilityDistance___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProcessed:", 0);
}

uint64_t __59__PLOPTICSClustering_orderedDatasetByReachabilityDistance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "reachabilityDistance");
  v6 = v5;
  objc_msgSend(v4, "reachabilityDistance");
  v8 = v7;

  if (v6 < v8)
    return 1;
  else
    return -1;
}

void __37__PLOPTICSClustering_preprocessData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "maximumDistance");
  +[PLOPTICSClusteringObject clusterObjectWithObject:index:epsilon:](PLOPTICSClusteringObject, "clusterObjectWithObject:index:epsilon:", v6, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);
}

uint64_t __37__PLOPTICSClustering_preprocessData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "processed") ^ 1;
  *a4 = result;
  return result;
}

void __79__PLOPTICSClustering_extractSubClusters_inDataset_parentIndex_inProgressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  id v31;

  v8 = a2;
  v31 = v8;
  if (a3)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "processed") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v9, "order") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reachabilityDistance");
      v12 = v11;
      objc_msgSend(v10, "reachabilityDistance");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v12 - v13;
      if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) > 0.0)
      {
        v14 = objc_msgSend(v9, "order");
        if (v14 >= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "order"))
        {
          v18 = objc_msgSend(v9, "order");
          v15 = v18 - objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "order");
        }
        else
        {
          v15 = 0;
        }
        objc_msgSend(*(id *)(a1 + 40), "clusterSize");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");

        if (v15 > objc_msgSend(*(id *)(a1 + 48), "minimumNumberOfObjects")
          && v20 - v15 >= objc_msgSend(*(id *)(a1 + 48), "minimumNumberOfObjects"))
        {
          objc_msgSend(*(id *)(a1 + 48), "maximumDistance");
          v22 = v21 + 1.0;
          v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "order");
          v24 = objc_msgSend(v9, "order");
          v25 = -1;
          while (v23 < v24)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setProcessed:", 1);
            objc_msgSend(v26, "coreDistance");
            if (v27 < v22)
            {
              objc_msgSend(v26, "coreDistance");
              v22 = v28;
              v25 = objc_msgSend(v26, "order");
            }

            ++v23;
            v24 = objc_msgSend(v9, "order");
          }
          +[PLOPTICSClusterDescriptor clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:](PLOPTICSClusterDescriptor, "clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "order"), v15, *(_QWORD *)(a1 + 96), v25, v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v29);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);

        }
      }

    }
  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = v8;
    v9 = *(id *)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "completedUnitCount") + 1);
  v30 = *(_QWORD *)(a1 + 56);
  if (v30)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "fractionCompleted");
    (*(void (**)(uint64_t, uint64_t))(v30 + 16))(v30, *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    *a4 = 1;

}

void __76__PLOPTICSClustering_extractRootClusters_inOriginalDataset_inProgressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v7 = a2;
  v35 = v7;
  if (!a3)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = v7;
    v8 = *(id *)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
    goto LABEL_21;
  }
  v8 = v7;
  if ((objc_msgSend(v8, "processed") & 1) != 0)
    goto LABEL_21;
  v9 = objc_msgSend(v8, "order");
  if (v9 >= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "order"))
  {
    v13 = objc_msgSend(v8, "order");
    v10 = v13 - objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "order");
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v10;
  objc_msgSend(*(id *)(a1 + 32), "maximumDistance");
  v15 = v14;
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v16 <= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfObjects"))
  {
    objc_msgSend(v8, "setProcessed:", 1);
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3 - 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reachabilityDistance");
    v26 = v25;
    objc_msgSend(v24, "reachabilityDistance");
    if (v26 != v27)
      goto LABEL_20;
  }
  else
  {
    v17 = v15 + 1.0;
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "order");
    v19 = objc_msgSend(v8, "order");
    v20 = -1;
    while (v18 < v19)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProcessed:", 1);
      objc_msgSend(v21, "coreDistance");
      if (v22 < v17)
      {
        objc_msgSend(v21, "coreDistance");
        v17 = v23;
        v20 = objc_msgSend(v21, "order");
      }

      ++v18;
      v19 = objc_msgSend(v8, "order");
    }
    v28 = objc_msgSend(v8, "order") - 1;
    if (v28 <= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "order"))
    {
      v29 = objc_msgSend(v8, "order") - 1;
      if (v29 <= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "order"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("PLOPTICSClustering.m"), 321, CFSTR("End Index should be larger than Start Index."));

      }
    }
    +[PLOPTICSClusterDescriptor clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:](PLOPTICSClusterDescriptor, "clusterDescriptor:rootLevel:minCoreDistanceIndex:minCoreDistance:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "order"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), -1, v20, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
  }
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

LABEL_20:
LABEL_21:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "completedUnitCount") + 1);
  v33 = *(_QWORD *)(a1 + 64);
  if (v33)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "fractionCompleted");
    (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v33, *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    *a4 = 1;

}

void __55__PLOPTICSClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "minCoreDistanceIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((v4 & 0x8000000000000000) == 0)
  {
    objc_msgSend(v15, "rootLevel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 == -1)
    {
      objc_msgSend(v15, "clusterSize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PLOPTICSClustering.m"), 251, CFSTR("Cluster size shouldn't be zero"));

      }
      objc_msgSend(v15, "startIndex");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
      for (i = (void *)objc_claimAutoreleasedReturnValue(); v8; --v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(i, "addObject:", v12);

        ++v10;
      }
      +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v13);

    }
  }

}

@end
