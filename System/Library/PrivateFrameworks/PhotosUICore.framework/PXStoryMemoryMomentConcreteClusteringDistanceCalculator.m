@implementation PXStoryMemoryMomentConcreteClusteringDistanceCalculator

- (PXStoryMemoryMomentConcreteClusteringDistanceCalculator)initWithWeights:(id)a3 locationsByAssetUUID:(id)a4 faceprintsByAssetUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryMemoryMomentConcreteClusteringDistanceCalculator;
  v11 = -[PXStoryMemoryMomentConcreteClusteringDistanceCalculator init](&v24, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("time"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("time"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      *((_QWORD *)v11 + 5) = v14;

    }
    else
    {
      *((_QWORD *)v11 + 5) = 0x3FF0000000000000;
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("location"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("location"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      *((_QWORD *)v11 + 6) = v17;
      v18 = v11 + 48;

    }
    else
    {
      *((_QWORD *)v11 + 6) = 0x3FF0000000000000;
      v18 = v11 + 48;
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("face"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("face"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      *((_QWORD *)v11 + 7) = v21;
      v22 = v11 + 56;

    }
    else
    {
      *((_QWORD *)v11 + 7) = 0x3FF0000000000000;
      v22 = v11 + 56;
    }

    if (!v10)
      *v22 = 0;
    if ((unint64_t)objc_msgSend(v9, "count") <= 1)
      *v18 = 0;
    objc_storeStrong((id *)v11 + 3, a4);
    objc_storeStrong((id *)v11 + 4, a5);
  }

  return (PXStoryMemoryMomentConcreteClusteringDistanceCalculator *)v11;
}

- (id)densityClusteringDistanceBlockForAssets:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke;
  v8[3] = &unk_1E51237D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

- (void)clusteringDistanceForAssets:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 resultHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD, __n128, __n128, __n128, __n128);
  void *v12;
  void *v13;
  uint64_t v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  double v28;
  double v29;
  NSDictionary *locationsByAssetUUID;
  void *v31;
  void *v32;
  NSDictionary *v33;
  void *v34;
  void *v35;
  double v36;
  NSDictionary *faceprintsByAssetUUID;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t i;
  void *v44;
  PXStoryMemoryMomentConcreteClusteringDistanceCalculator *v45;
  NSDictionary *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void (**v58)(_QWORD, __n128, __n128, __n128, __n128);
  id v59;
  id obj;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(_QWORD, __n128, __n128, __n128, __n128))a6;
  v12 = (void *)MEMORY[0x1A85CE17C]();
  if (v11)
  {
    objc_msgSend(v10, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a5);
    v14 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v14;
    if (v13 && v14)
    {
      objc_msgSend(v13, "creationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "creationDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v21);
      v23 = v22;

      if (v23 < 0.0)
        v23 = -v23;
      v28 = 1.0;
      v29 = 1.0;
      if (self->_locationWeight > 0.0)
      {
        locationsByAssetUUID = self->_locationsByAssetUUID;
        objc_msgSend(v13, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](locationsByAssetUUID, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = self->_locationsByAssetUUID;
        objc_msgSend(v19, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 && v35)
        {
          objc_msgSend(v32, "distanceFromLocation:", v35);
          v29 = v36;
        }

      }
      if (self->_faceWeight > 0.0)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        faceprintsByAssetUUID = self->_faceprintsByAssetUUID;
        objc_msgSend(v13, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](faceprintsByAssetUUID, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        if (v40)
        {
          v41 = v40;
          v56 = v13;
          v57 = v12;
          v58 = v11;
          v59 = v10;
          v42 = 0;
          v61 = *(_QWORD *)v68;
          v62 = v19;
          v28 = 3.40282347e38;
          obj = v39;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v68 != v61)
                objc_enumerationMutation(obj);
              v44 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v45 = self;
              v46 = self->_faceprintsByAssetUUID;
              objc_msgSend(v62, "uuid");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
              if (v49)
              {
                v50 = v49;
                v51 = *(_QWORD *)v64;
                do
                {
                  for (j = 0; j != v50; ++j)
                  {
                    if (*(_QWORD *)v64 != v51)
                      objc_enumerationMutation(v48);
                    objc_msgSend(v44, "computeDistance:withDistanceFunction:error:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j), 0, 0);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v54 = v53;
                    if (v53)
                    {
                      objc_msgSend(v53, "doubleValue");
                      if (v28 >= v55)
                        v28 = v55;
                      v42 = 1;
                    }

                  }
                  v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
                }
                while (v50);
              }

              self = v45;
            }
            v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
          }
          while (v41);

          if ((v42 & 1) == 0)
            v28 = 1.0;
          v11 = v58;
          v10 = v59;
          v13 = v56;
          v12 = v57;
          v19 = v62;
        }
        else
        {

        }
      }
      v24.n128_f64[0] = v29 * self->_locationWeight + v23 * self->_timeWeight + v28 * self->_faceWeight;
      v25.n128_f64[0] = v29;
      v26.n128_f64[0] = v23;
      v27.n128_f64[0] = v28;
      v11[2](v11, v24, v25, v26, v27);
    }
    else
    {
      v15.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      v16.n128_u64[0] = 0;
      v17.n128_u64[0] = 0;
      v18.n128_u64[0] = 0;
      v11[2](v11, v15, v16, v17, v18);
    }

  }
  objc_autoreleasePoolPop(v12);

}

- (double)timeWeight
{
  return self->_timeWeight;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (double)faceWeight
{
  return self->_faceWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintsByAssetUUID, 0);
  objc_storeStrong((id *)&self->_locationsByAssetUUID, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

double __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  double v11;
  _QWORD v13[5];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(v5, "intValue");
  v10 = objc_msgSend(v6, "intValue");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke_2;
  v13[3] = &unk_1E51237A8;
  v13[4] = &v14;
  objc_msgSend(v7, "clusteringDistanceForAssets:fromIndex:toIndex:resultHandler:", v8, v9, v10, v13);
  v11 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __99__PXStoryMemoryMomentConcreteClusteringDistanceCalculator_densityClusteringDistanceBlockForAssets___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
