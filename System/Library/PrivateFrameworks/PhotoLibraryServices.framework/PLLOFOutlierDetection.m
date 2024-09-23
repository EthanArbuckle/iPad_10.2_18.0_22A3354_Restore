@implementation PLLOFOutlierDetection

- (PLLOFOutlierDetection)init
{
  PLLOFOutlierDetection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLLOFOutlierDetection;
  result = -[PLLOFOutlierDetection init](&v3, sel_init);
  if (result)
    result->_k = 4;
  return result;
}

- (id)filteredObjectsWithDataset:(id)a3 distanceBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  uint64_t v22;
  double *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  double *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  PLLOFOutlierDetection *v47;
  id obj;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  double **v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") > 2)
  {
    v8 = objc_msgSend(v6, "count");
    v45 = v7;
    v47 = self;
    v63 = -[PLLOFOutlierDetection createDistancesMatrixForDataset:distanceBlock:](self, "createDistancesMatrixForDataset:distanceBlock:", v6, v7);
    v44 = v8;
    -[PLLOFOutlierDetection createKNNMatrixWithDistanceMatrix:size:](self, "createKNNMatrixWithDistanceMatrix:size:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v46 = v6;
    obj = v6;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v52)
    {
      v58 = 0;
      v50 = *(_QWORD *)v65;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v65 != v50)
            objc_enumerationMutation(obj);
          v53 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v9);
          v54 = v9;
          v57 = v51;
          objc_msgSend(v57, "objectAtIndexedSubscript:", v58);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v55 = v10;
          v11 = 0.0;
          v12 = 0.0;
          v59 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
          if (v59)
          {
            v56 = *(_QWORD *)v69;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v69 != v56)
                  objc_enumerationMutation(v55);
                v60 = v13;
                v14 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v13), "integerValue");
                v15 = v57;
                objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = 0u;
                v73 = 0u;
                v74 = 0u;
                v75 = 0u;
                v61 = v16;
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v73;
                  v20 = 0.0;
                  do
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v73 != v19)
                        objc_enumerationMutation(v61);
                      v22 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "integerValue");
                      v23 = v63[v22];
                      objc_msgSend(v15, "objectAtIndexedSubscript:", v22);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "lastObject");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = v23[objc_msgSend(v25, "integerValue")];

                      v27 = v63[v14][v22];
                      if (v26 >= v27)
                        v27 = v26;
                      v20 = v20 + v27;
                    }
                    v18 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
                  }
                  while (v18);
                }
                else
                {
                  v20 = 0.0;
                }
                v28 = 1.0 / (v20 / (double)(unint64_t)objc_msgSend(v61, "count"));

                v12 = v12 + v28;
                v13 = v60 + 1;
              }
              while (v60 + 1 != v59);
              v59 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
            }
            while (v59);
          }
          v62 = (id)objc_msgSend(v55, "count");
          v29 = v57;
          objc_msgSend(v29, "objectAtIndexedSubscript:", v58);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v73;
            v11 = 0.0;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v73 != v33)
                  objc_enumerationMutation(v30);
                v35 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "integerValue");
                v36 = v63[v35];
                objc_msgSend(v29, "objectAtIndexedSubscript:", v35);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "lastObject");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v36[objc_msgSend(v38, "integerValue")];

                v40 = v63[v58][v35];
                if (v39 >= v40)
                  v40 = v39;
                v11 = v11 + v40;
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
            }
            while (v32);
          }
          v41 = 1.0 / (v11 / (double)(unint64_t)objc_msgSend(v30, "count"));

          if (v12 / (double)(unint64_t)v62 / v41 <= 1.1)
            objc_msgSend(v49, "addObject:", v53);
          ++v58;
          v9 = v54 + 1;
        }
        while (v54 + 1 != v52);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v52);
    }

    -[PLLOFOutlierDetection freeDistancesMatrix:forDataset:](v47, "freeDistancesMatrix:forDataset:", v63, obj);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v43 = objc_msgSend(v49, "count");
      *(_DWORD *)buf = 134218240;
      v79 = v44 - v43;
      v80 = 2048;
      v81 = v44;
      _os_log_debug_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "LOF Filtering: Filtered %ld outliers for %ld objects", buf, 0x16u);
    }

    v7 = v45;
    v6 = v46;
  }
  else
  {
    v49 = v6;
  }

  return v49;
}

- (id)createKNNMatrixWithDistanceMatrix:(double *)a3 size:(unint64_t)a4
{
  uint64_t v6;
  unint64_t k;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  id v21;
  _QWORD v22[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v6 = 0;
    do
    {
      k = self->_k;
      if (k + 1 < a4)
        v8 = k + 1;
      else
        v8 = a4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v11 = 0;
      v12 = a3[v6];
      do
      {
        if (v6 != v10)
        {
          v13 = objc_msgSend(v9, "count");
          v14 = self->_k;
          if (v13 < v14
            || (v15 = v12[v10],
                objc_msgSend(v9, "lastObject"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = v12[objc_msgSend(v16, "integerValue")],
                v16,
                v15 < v17))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __64__PLLOFOutlierDetection_createKNNMatrixWithDistanceMatrix_size___block_invoke;
            v22[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
            v22[4] = v12;
            objc_msgSend(v9, "insertObject:atIndex:", v18, objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, v11, 1024, v22));
            if (v13 >= v14)
            {

              objc_msgSend(v9, "removeLastObject");
            }
            else
            {
              ++v11;

            }
          }
        }
        ++v10;
      }
      while (a4 != v10);
      objc_msgSend(v21, "addObject:", v9);

      ++v6;
    }
    while (v6 != a4);
  }
  return v21;
}

- (double)createDistancesMatrixForDataset:(id)a3 distanceBlock:(id)a4
{
  id v5;
  double (**v6)(id, void *, void *);
  size_t v7;
  double **v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double **v13;
  double **v14;
  void *v15;
  void *v16;
  double v17;
  double **v18;
  double **v20;
  void *context;

  v5 = a3;
  v6 = (double (**)(id, void *, void *))a4;
  v7 = objc_msgSend(v5, "count");
  v8 = (double **)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      v8[i] = (double *)malloc_type_calloc(v7, 8uLL, 0x100004000313F17uLL);
    v10 = 0;
    v11 = 0;
    v20 = v8;
    do
    {
      context = (void *)MEMORY[0x19AEC1554]();
      v12 = 0;
      v13 = v8;
      v14 = &v8[v11];
      do
      {
        if (v12)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", v11 + v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v6[2](v6, v15, v16);

          (*v14)[v10 + v12] = v17;
          v18 = &v13[v10];
        }
        else
        {
          v17 = 0.0;
          v18 = v14;
        }
        (*v18)[v11] = v17;
        ++v12;
        ++v13;
      }
      while (v11 + v12 < v7);
      objc_autoreleasePoolPop(context);
      ++v11;
      ++v10;
      v8 = v20;
    }
    while (v11 != v7);
  }

  return v8;
}

- (void)freeDistancesMatrix:(double *)a3 forDataset:(id)a4
{
  unint64_t v5;
  id v6;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v5 = 0;
    do
      free(a3[v5++]);
    while (v5 < objc_msgSend(v6, "count"));
  }
  free(a3);

}

- (id)lofScoresWithDataset:(id)a3 distanceBlock:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  double **v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  uint64_t v24;
  double *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  id v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  double *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  PLLOFOutlierDetection *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  uint64_t v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 > 2)
  {
    v9 = v8;
    v48 = v7;
    v10 = -[PLLOFOutlierDetection createDistancesMatrixForDataset:distanceBlock:](self, "createDistancesMatrixForDataset:distanceBlock:", v6, v7);
    v47 = self;
    -[PLLOFOutlierDetection createKNNMatrixWithDistanceMatrix:size:](self, "createKNNMatrixWithDistanceMatrix:size:", v10, v9);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v11 = 0;
      v49 = v6;
      do
      {
        v54 = v50;
        v55 = v11;
        objc_msgSend(v54, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        obj = v12;
        v13 = 0.0;
        v14 = 0.0;
        v56 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (v56)
        {
          v53 = *(_QWORD *)v61;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v61 != v53)
                objc_enumerationMutation(obj);
              v57 = v15;
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v15), "integerValue");
              v17 = v54;
              objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v58 = v18;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v65;
                v22 = 0.0;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v65 != v21)
                      objc_enumerationMutation(v58);
                    v24 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "integerValue");
                    v25 = v10[v24];
                    objc_msgSend(v17, "objectAtIndexedSubscript:", v24);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "lastObject");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = v25[objc_msgSend(v27, "integerValue")];

                    v29 = v10[v16][v24];
                    if (v28 >= v29)
                      v29 = v28;
                    v22 = v22 + v29;
                  }
                  v20 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
                }
                while (v20);
              }
              else
              {
                v22 = 0.0;
              }
              v30 = 1.0 / (v22 / (double)(unint64_t)objc_msgSend(v58, "count"));

              v14 = v14 + v30;
              v15 = v57 + 1;
            }
            while (v57 + 1 != v56);
            v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          }
          while (v56);
        }
        v59 = (id)objc_msgSend(obj, "count");
        v31 = v54;
        v32 = v55;
        objc_msgSend(v31, "objectAtIndexedSubscript:", v55);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v65;
          v13 = 0.0;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v65 != v36)
                objc_enumerationMutation(v33);
              v38 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "integerValue");
              v39 = v10[v38];
              objc_msgSend(v31, "objectAtIndexedSubscript:", v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "lastObject");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v39[objc_msgSend(v41, "integerValue")];

              v32 = v55;
              v43 = v10[v55][v38];
              if (v42 >= v43)
                v43 = v42;
              v13 = v13 + v43;
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
          }
          while (v35);
        }
        v44 = 1.0 / (v13 / (double)(unint64_t)objc_msgSend(v33, "count"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 / (double)(unint64_t)v59 / v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v45);

        v11 = v32 + 1;
        v6 = v49;
      }
      while (v11 < objc_msgSend(v49, "count"));
    }
    -[PLLOFOutlierDetection freeDistancesMatrix:forDataset:](v47, "freeDistancesMatrix:forDataset:", v10, v6);

    v7 = v48;
  }
  else
  {
    v51 = v6;
  }

  return v51;
}

- (unint64_t)k
{
  return self->_k;
}

- (void)setK:(unint64_t)a3
{
  self->_k = a3;
}

- (BOOL)filterZeroDistanceDataset
{
  return self->_filterZeroDistanceDataset;
}

- (void)setFilterZeroDistanceDataset:(BOOL)a3
{
  self->_filterZeroDistanceDataset = a3;
}

uint64_t __64__PLLOFOutlierDetection_createKNNMatrixWithDistanceMatrix_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = *(double *)(v5 + 8 * objc_msgSend(a2, "integerValue"));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v6, "integerValue");

  v10 = *(double *)(v8 + 8 * v9);
  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

@end
