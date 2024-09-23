@implementation PLEmbeddingUtilities

+ (id)poolVectors:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t k;
  void *v21;
  double v22;
  unint64_t v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (!objc_msgSend(v11, "count"))
        {

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allVectorsHaveNonZeroLength"));
          goto LABEL_16;
        }
        v12 = objc_msgSend(v11, "count");
        if (v8)
        {
          if (v12 != v8)
          {

            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allVectorsAreEqualLength"));

            v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            goto LABEL_17;
          }
        }
        else
        {
          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = v5;
LABEL_16:

  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8)
  {
LABEL_17:
    for (j = 0; j != v8; ++j)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        v19 = 0.0;
        do
        {
          for (k = 0; k != v17; ++k)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "objectAtIndexedSubscript:", j);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v19 = v19 + v22;

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v17);
      }
      else
      {
        v19 = 0.0;
      }

      v23 = objc_msgSend(v15, "count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 / (double)v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v24);

    }
  }

  return v27;
}

+ (double)cosineSimilarityBetweenVector:(id)a3 secondVector:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v25;
  void *v26;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v8, "count");
  if (objc_msgSend(v7, "count"))
    v11 = objc_msgSend(v8, "count") == 0;
  else
    v11 = 1;
  if (v9 == v10)
  {
    if (!v11)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vectorsAreEqualLength"));

    if (!v11)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bothVectorsHaveNonZeroCounts"));

LABEL_6:
  v12 = objc_msgSend(v7, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      v17 = v17 + v20 * v23;
      v16 = v16 + v20 * v20;
      v15 = v15 + v23 * v23;
      ++v14;
    }
    while (v13 != v14);
    if (v16 > 0.0 && v15 > 0.0)
      v17 = v17 / sqrt(v16 * v15);
  }
  else
  {
    v17 = 0.0;
  }

  return v17;
}

+ (id)sortCompareObjects:(id)a3 sortAscending:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3928];
  v6 = a3;
  objc_msgSend(v5, "sortDescriptorWithKey:ascending:", CFSTR("distanceBetweenVectors"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)extractNumericalValuesForScenePrint:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  float *v8;
  float v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "descriptorData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "elementCount");
    v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v7 = (id)MEMORY[0x1E0C9AA60];
    if (v5)
    {
      v8 = (float *)v6;
      if (v6)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        do
        {
          v9 = *v8++;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v10);

          --v5;
        }
        while (v5);
      }
    }
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

+ (id)padVector:(id)a3 withZeroesForVectorWithNumberOfDimensions:(unint64_t)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;

  v7 = a3;
  if (objc_msgSend(v7, "count") <= a4)
  {
    if (objc_msgSend(v7, "count") == a4)
    {
      v9 = v7;
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
      v11 = objc_msgSend(v7, "count");
      v12 = a4 - v11;
      if (a4 != v11)
      {
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v13);

          --v12;
        }
        while (v12);
      }
      v9 = (id)objc_msgSend(v10, "copy");

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

    v9 = 0;
  }

  return v9;
}

+ (id)generateMaxVectorFromVectors:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      v8 = 0x1E0CB3000uLL;
      v25 = v4;
      do
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v9 = v3;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v29;
          v13 = 0.0;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              if (objc_msgSend(v15, "count") != v6)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v19 = v3;
                v20 = v8;
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vector.count == vectorDimension"));

                v8 = v20;
                v3 = v19;
                v4 = v25;
              }
              objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "doubleValue");
              v18 = v17;

              if (v13 < v18)
                v13 = v18;
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v11);
        }
        else
        {
          v13 = 0.0;
        }

        objc_msgSend(*(id *)(v8 + 2024), "numberWithDouble:", v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v22);

        ++v7;
      }
      while (v7 != v6);
    }
    v23 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

+ (id)generateNormalizedVectors:(id)a3 fromMaxVector:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          +[PLEmbeddingUtilities generateNormalizedVector:fromMaxVector:](PLEmbeddingUtilities, "generateNormalizedVector:fromMaxVector:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v6, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)generateNormalizedEmbeddingCompareObjects:(id)a3 fromMaxVector:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  PLEmbeddingCompareObject *v15;
  void *v16;
  PLEmbeddingCompareObject *v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "vector", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLEmbeddingUtilities generateNormalizedVector:fromMaxVector:](PLEmbeddingUtilities, "generateNormalizedVector:fromMaxVector:", v13, v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = [PLEmbeddingCompareObject alloc];
          objc_msgSend(v12, "assetUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PLEmbeddingCompareObject initWithAssetUUID:vector:](v15, "initWithAssetUUID:vector:", v16, v14);

          objc_msgSend(v7, "addObject:", v17);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v18 = (void *)objc_msgSend(v7, "copy");
    v5 = v20;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

+ (id)generateNormalizedVector:(id)a3 fromMaxVector:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vector.count == maxVector.count"));

  }
  if (objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    if (objc_msgSend(v7, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 / v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

        ++v11;
      }
      while (v11 < objc_msgSend(v7, "count"));
    }
    v19 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (id)generateMappingOfEmbeddingCompareObjectsToAssetUUIDFromEmbeddingCompareObjects:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "assetUUID", (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          v14 = v12;
        else
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v15 = v14;

        objc_msgSend(v15, "addObject:", v10);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

+ (id)averageTop:(unint64_t)a3 forEmbeddingCompareObjectsByAssetUUID:(id)a4 sortAscending:(BOOL)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;
  BOOL v18;

  v9 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingUtilities.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfEmbeddingObjectsPerAsset > 0"));

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__PLEmbeddingUtilities_averageTop_forEmbeddingCompareObjectsByAssetUUID_sortAscending___block_invoke;
  v15[3] = &unk_1E365FEA0;
  v18 = a5;
  v16 = v10;
  v17 = a3;
  v11 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

+ (id)assetUUIDsFromEmbeddingCompareObjects:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PLEmbeddingUtilities_assetUUIDsFromEmbeddingCompareObjects___block_invoke;
  v9[3] = &unk_1E365FEC8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (id)distanceByAssetUUIDFromEmbeddingCompareObjects:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PLEmbeddingUtilities_distanceByAssetUUIDFromEmbeddingCompareObjects___block_invoke;
  v8[3] = &unk_1E365FEC8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)fetchAssetsForCLIPGenerationFromPhotoLibrary:(id)a3 limitToExtendedAssets:(BOOL)a4 assetFetchLimit:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__924;
  v30 = __Block_byref_object_dispose__925;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__924;
  v24 = __Block_byref_object_dispose__925;
  v25 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __113__PLEmbeddingUtilities_fetchAssetsForCLIPGenerationFromPhotoLibrary_limitToExtendedAssets_assetFetchLimit_error___block_invoke;
  v14[3] = &unk_1E3662C58;
  v19 = a4;
  v18 = a5;
  v10 = v9;
  v15 = v10;
  v16 = &v26;
  v17 = &v20;
  objc_msgSend(v10, "performBlockAndWait:", v14);
  v11 = (void *)v21[5];
  if (v11)
  {
    v12 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v11);
  }
  else
  {
    v12 = (id)v27[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __113__PLEmbeddingUtilities_fetchAssetsForCLIPGenerationFromPhotoLibrary_limitToExtendedAssets_assetFetchLimit_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("visibilityState"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForSearchIndexExclusions"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == NO"), CFSTR("hidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("trashedState"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %f"), CFSTR("highlightBeingExtendedAssets.promotionScore"), 0x3FC999999999999ALL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPredicate:", v9);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortDescriptors:", v14);

  objc_msgSend(v12, "setFetchBatchSize:", 100);
  objc_msgSend(v12, "setResultType:", 0);
  objc_msgSend(v12, "setFetchLimit:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v12, "setIncludesPendingChanges:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v16 + 40);
  objc_msgSend(v15, "executeFetchRequest:error:", v12, &obj);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v16 + 40), obj);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

void __71__PLEmbeddingUtilities_distanceByAssetUUIDFromEmbeddingCompareObjects___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "distanceBetweenVectors");
  v8 = (id)objc_msgSend(v5, "initWithDouble:");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "assetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

void __62__PLEmbeddingUtilities_assetUUIDsFromEmbeddingCompareObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "assetUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __87__PLEmbeddingUtilities_averageTop_forEmbeddingCompareObjectsByAssetUUID_sortAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  PLAveragedEmbeddingCompareObject *v19;
  PLAveragedEmbeddingCompareObject *v20;
  CMTimeRange v21;
  CMTimeRange otherRange;
  CMTimeRange v23;

  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_msgSend(v6, "count");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    +[PLEmbeddingUtilities sortCompareObjects:sortAscending:](PLEmbeddingUtilities, "sortCompareObjects:sortAscending:", v6, *(unsigned __int8 *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&v23.start.value = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&v23.start.epoch = v11;
    *(_OWORD *)&v23.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    if (v9)
    {
      v12 = 0;
      v13 = 0.0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "distanceBetweenVectors");
        v16 = v15;
        if (v14)
          objc_msgSend(v14, "llmTimeRange");
        else
          memset(&otherRange, 0, sizeof(otherRange));
        v13 = v13 + v16;
        v21 = v23;
        CMTimeRangeGetUnion(&v23, &v21, &otherRange);

        ++v12;
      }
      while (v9 != v12);
    }
    else
    {
      v13 = 0.0;
    }
    v18 = v13 / (double)*(unint64_t *)(a1 + 40);
    v19 = [PLAveragedEmbeddingCompareObject alloc];
    v21 = v23;
    v20 = -[PLAveragedEmbeddingCompareObject initWithAssetUUID:timeRange:averageDistanceBetweenVectors:](v19, "initWithAssetUUID:timeRange:averageDistanceBetweenVectors:", v5, &v21, v18);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);

    goto LABEL_16;
  }
  if (objc_msgSend(v6, "count"))
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v10);
LABEL_16:

  }
}

@end
