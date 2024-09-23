@implementation PNPersonClusterManager

- (PNPersonClusterManager)initWithPhotoLibrary:(id)a3
{
  return -[PNPersonClusterManager initWithPhotoLibrary:detectionType:promoterDelegate:](self, "initWithPhotoLibrary:detectionType:promoterDelegate:", a3, 1, 0);
}

- (PNPersonClusterManager)initWithPhotoLibrary:(id)a3 detectionType:(signed __int16)a4 promoterDelegate:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  PNPersonClusterManager *v10;
  PNPersonClusterManager *v11;
  PNVisionHelper *v12;
  PNVisionHelper *visionHelper;
  uint64_t v14;
  NSMutableDictionary *personClusters;
  uint64_t v16;
  NSMutableDictionary *representativeFaceObservationForPersonIdentifier;
  uint64_t v18;
  NSMutableDictionary *distancesForPersonLocalIdentifier;
  uint64_t v20;
  NSMutableDictionary *distancesInCommonMomentsForPersonLocalIdentifier;
  uint64_t v22;
  NSMutableDictionary *confidencesForMergedPersonLocalIdentifier;
  uint64_t v24;
  NSSet *assetsToIgnore;
  char v26;
  NSObject *v27;
  const char *v28;
  uint8_t v30[16];
  objc_super v31;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PNPersonClusterManager;
  v10 = -[PNPersonClusterManager init](&v31, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_10;
  -[PNPersonClusterManager setPhotoLibrary:](v10, "setPhotoLibrary:", v8);
  -[PNPersonClusterManager setDetectionType:](v11, "setDetectionType:", v6);
  v12 = objc_alloc_init(PNVisionHelper);
  visionHelper = v11->_visionHelper;
  v11->_visionHelper = v12;

  v14 = objc_opt_new();
  personClusters = v11->_personClusters;
  v11->_personClusters = (NSMutableDictionary *)v14;

  v16 = objc_opt_new();
  representativeFaceObservationForPersonIdentifier = v11->_representativeFaceObservationForPersonIdentifier;
  v11->_representativeFaceObservationForPersonIdentifier = (NSMutableDictionary *)v16;

  v18 = objc_opt_new();
  distancesForPersonLocalIdentifier = v11->_distancesForPersonLocalIdentifier;
  v11->_distancesForPersonLocalIdentifier = (NSMutableDictionary *)v18;

  v20 = objc_opt_new();
  distancesInCommonMomentsForPersonLocalIdentifier = v11->_distancesInCommonMomentsForPersonLocalIdentifier;
  v11->_distancesInCommonMomentsForPersonLocalIdentifier = (NSMutableDictionary *)v20;

  v22 = objc_opt_new();
  confidencesForMergedPersonLocalIdentifier = v11->_confidencesForMergedPersonLocalIdentifier;
  v11->_confidencesForMergedPersonLocalIdentifier = (NSMutableDictionary *)v22;

  objc_msgSend(v8, "pn_fetchInvalidAssetIdentifiersForCommonComparison");
  v24 = objc_claimAutoreleasedReturnValue();
  assetsToIgnore = v11->_assetsToIgnore;
  v11->_assetsToIgnore = (NSSet *)v24;

  objc_storeStrong((id *)&v11->_promoterDelegate, a5);
  if (v11->_promoterDelegate)
  {
    v26 = objc_opt_respondsToSelector();
    v11->_vuDistanceSPIEnabled = v26 & 1;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v30 = 0;
        v27 = MEMORY[0x24BDACB70];
        v28 = "[PNPersonClusterManager] Using VU distance SPI for pet deduper distance";
LABEL_9:
        _os_log_impl(&dword_243C3E000, v27, OS_LOG_TYPE_INFO, v28, v30, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v11->_vuDistanceSPIEnabled = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v30 = 0;
    v27 = MEMORY[0x24BDACB70];
    v28 = "[PNPersonClusterManager] Using Photos average animalprint distance SPI for pet deduper distance";
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (void)clearCaches
{
  -[NSMutableDictionary removeAllObjects](self->_personClusters, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_representativeFaceObservationForPersonIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_distancesForPersonLocalIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_distancesInCommonMomentsForPersonLocalIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_confidencesForMergedPersonLocalIdentifier, "removeAllObjects");
}

- (void)invalidateCachesForPerson:(id)a3
{
  void *v4;
  id v5;
  void (**v6)(void *, NSMutableDictionary *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD aBlock[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke;
  aBlock[3] = &unk_251480160;
  v5 = v4;
  v19 = v5;
  v6 = (void (**)(void *, NSMutableDictionary *))_Block_copy(aBlock);
  v6[2](v6, self->_distancesForPersonLocalIdentifier);
  v6[2](v6, self->_distancesInCommonMomentsForPersonLocalIdentifier);
  v7 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_representativeFaceObservationForPersonIdentifier, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsString:", v5))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_representativeFaceObservationForPersonIdentifier, "removeObjectsForKeys:", v7);
}

- (id)_mapPersonClustersToPersons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PNPersonCluster *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "localIdentifier", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_personClusters, "objectForKeyedSubscript:", v13);
        v14 = (PNPersonCluster *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = -[PNPersonCluster initWithPerson:inPhotoLibrary:]([PNPersonCluster alloc], "initWithPerson:inPhotoLibrary:", v12, v6);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personClusters, "setObject:forKeyedSubscript:", v14, v13);
        }
        objc_msgSend(v5, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)_mapPersonClustersToFaceGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PNPersonCluster *v13;
  PNPersonCluster *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
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
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "localIdentifier", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_personClusters, "objectForKeyedSubscript:", v12);
        v13 = (PNPersonCluster *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v14 = [PNPersonCluster alloc];
          -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PNPersonCluster initWithFaceGroup:inPhotoLibrary:](v14, "initWithFaceGroup:inPhotoLibrary:", v11, v15);

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personClusters, "setObject:forKeyedSubscript:", v13, v12);
        }
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)mergePersons:(id)a3 withPerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  PNPersonClusterManager *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *context;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "detectionType") == 1)
  {
    objc_msgSend(v7, "representativeFaceByFaceIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[PNPersonClusterManager representativeFaceObservationForPerson:ageType:](self, "representativeFaceObservationForPerson:ageType:", v7, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v7, "representativeFaceByFaceIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "backingFaceIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

      }
    }
  }
  objc_msgSend(v7, "mergedPersonIdentifiers");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v7, "setMergedPersonIdentifiers:", v13);

    objc_msgSend(v7, "mergedPersonIdentifiers");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v14 = v6;
  v53 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v53)
  {
    v15 = 0;
    v49 = *(_QWORD *)v67;
    v50 = v14;
    v51 = self;
    do
    {
      v16 = 0;
      do
      {
        v57 = v15;
        if (*(_QWORD *)v67 != v49)
          objc_enumerationMutation(v14);
        v56 = v16;
        v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v16);
        context = (void *)MEMORY[0x249506444]();
        v54 = objc_msgSend(v17, "faceCount");
        -[PNPersonClusterManager invalidateCachesForPerson:](self, "invalidateCachesForPerson:", v17);
        objc_msgSend(v17, "mergedPersonIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "unionSet:", v18);

        objc_msgSend(v17, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addObject:", v19);

        objc_msgSend(v7, "backingFaceIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "backingFaceIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "unionSet:", v21);

        objc_msgSend(v7, "backingAssetIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "backingAssetIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "unionSet:", v23);

        objc_msgSend(v7, "backingMomentIdentifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "backingMomentIdentifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "unionSet:", v25);

        if (objc_msgSend(v17, "detectionType") == 1)
        {
          objc_msgSend(v17, "representativeFaceByFaceIdentifiers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (!v27)
          {
            -[PNPersonClusterManager representativeFaceObservationForPerson:ageType:](self, "representativeFaceObservationForPerson:ageType:", v17, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              objc_msgSend(v17, "representativeFaceByFaceIdentifiers");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "backingFaceIdentifiers");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

            }
          }
        }
        objc_msgSend(v7, "representativeFaceByFaceIdentifiers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "representativeFaceByFaceIdentifiers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addEntriesFromDictionary:", v32);

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        objc_msgSend(v17, "backingFaceIdentifiersByMomentIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v63 != v36)
                objc_enumerationMutation(v33);
              v38 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_msgSend(v17, "backingFaceIdentifiersByMomentIdentifiers");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "backingFaceIdentifiersByMomentIdentifiers");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKeyedSubscript:", v38);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                objc_msgSend(v42, "unionSet:", v40);
              }
              else
              {
                objc_msgSend(v7, "backingFaceIdentifiersByMomentIdentifiers");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, v38);

              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          }
          while (v35);
        }

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        objc_msgSend(v17, "mergedPersonIdentifiers");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        self = v51;
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v59 != v47)
                objc_enumerationMutation(v44);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v51->_personClusters, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          }
          while (v46);
        }
        v15 = v54 + v57;

        objc_autoreleasePoolPop(context);
        v16 = v56 + 1;
        v14 = v50;
      }
      while (v56 + 1 != v53);
      v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v53);

    if (v15)
    {
      -[PNPersonClusterManager invalidateCachesForPerson:](v51, "invalidateCachesForPerson:", v7);
      objc_msgSend(v7, "invalidateCaches");
    }
  }
  else
  {

  }
}

- (void)updateConfidenceCacheBetweenPersonLocalIdentifier:(id)a3 andOtherPersonLocalIdentifier:(id)a4 withDistance:(double)a5
{
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  void (**v12)(void *, id, id, void *);
  double v13;
  void *v14;
  double v15;
  void *v16;
  _QWORD aBlock[4];
  NSMutableDictionary *v18;

  v8 = self->_confidencesForMergedPersonLocalIdentifier;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PNPersonClusterManager_updateConfidenceCacheBetweenPersonLocalIdentifier_andOtherPersonLocalIdentifier_withDistance___block_invoke;
  aBlock[3] = &unk_251480188;
  v18 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  v12 = (void (**)(void *, id, id, void *))_Block_copy(aBlock);
  v13 = 1.0 - a5;
  *(float *)&a5 = 1.0 - a5;
  LODWORD(v13) = LODWORD(a5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v11, v10, v14);

  LODWORD(v15) = LODWORD(a5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v10, v11, v16);

}

- (unsigned)minAgeTypeForFaceAgeType:(unsigned __int16)a3 andFaceAgeType:(unsigned __int16)a4
{
  unsigned __int16 v4;

  if (a3 >= a4)
    v4 = a4;
  else
    v4 = a3;
  if (!a4)
    v4 = a3;
  if (a3)
    return v4;
  else
    return a4;
}

- (int64_t)assetsOverlapBetweenPerson:(id)a3 andPerson:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  objc_msgSend(a3, "backingAssetIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingAssetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PNPersonClusterManager assetsOverlapBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:](self, "assetsOverlapBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:", v7, v8);
  return v9;
}

- (int64_t)assetsOverlapBetweenPersonAssetIdentifiers:(id)a3 andPersonAssetIdentifiers:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "count");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = -[PNPersonClusterManager numberOfAssetsInCommonBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:](self, "numberOfAssetsInCommonBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:", v7, v6);

  if (v10 < 0xF)
    return 2 * (v11 != 0);
  if (v11 <= (unint64_t)fmaxf((float)v10 * 0.01, 1.0))
    return 0;
  if (v11 <= (unint64_t)fmaxf((float)v10 * 0.05, 1.0))
    return 1;
  return 2;
}

- (unint64_t)numberOfAssetsInCommonBetweenPerson:(id)a3 andPerson:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  objc_msgSend(a3, "backingAssetIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingAssetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PNPersonClusterManager numberOfAssetsInCommonBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:](self, "numberOfAssetsInCommonBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:", v7, v8);
  return v9;
}

- (unint64_t)numberOfAssetsInCommonBetweenPersonAssetIdentifiers:(id)a3 andPersonAssetIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "intersectsSet:", v7))
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "intersectSet:", v7);
    objc_msgSend(v8, "minusSet:", self->_assetsToIgnore);
    v9 = objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfMomentsInCommonBetweenPerson:(id)a3 andPerson:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v5 = a4;
  objc_msgSend(a3, "backingMomentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "backingMomentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intersectSet:", v8);
  v9 = objc_msgSend(v7, "count");

  return v9;
}

- (float)distanceWithOverlapCheckBetweenPerson:(id)a3 andPerson:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  int64_t v17;
  float v18;
  int64_t v19;
  float v20;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = -[PNPersonClusterManager assetsOverlapBetweenPerson:andPerson:](self, "assetsOverlapBetweenPerson:andPerson:", v14, v15);
  v18 = 1.0;
  if (v17 != 2)
  {
    v19 = v17;
    -[PNPersonClusterManager distanceBetweenPerson:andPerson:useCommonMoments:minAgeType:updateBlock:error:](self, "distanceBetweenPerson:andPerson:useCommonMoments:minAgeType:updateBlock:error:", v14, v15, v11, a6, v16, a8);
    if (v20 > 0.15 && v19 == 1)
      v18 = 1.0;
    else
      v18 = v20;
  }

  return v18;
}

- (float)distanceBetweenPerson:(id)a3 andPerson:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  float v17;
  float v18;

  v10 = a5;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  if (-[PNPersonClusterManager detectionType](self, "detectionType") == 1)
    -[PNPersonClusterManager distanceBetweenHuman:andHuman:useCommonMoments:minAgeType:updateBlock:error:](self, "distanceBetweenHuman:andHuman:useCommonMoments:minAgeType:updateBlock:error:", v16, v15, v10, a6, v14, a8);
  else
    -[PNPersonClusterManager distanceBetweenPet:andPet:useCommonMoments:](self, "distanceBetweenPet:andPet:useCommonMoments:", v16, v15, v10);
  v18 = v17;

  return v18;
}

- (float)distanceBetweenHuman:(id)a3 andHuman:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8
{
  _BOOL4 v11;
  id v14;
  void (**v15)(id, _BYTE *, float);
  float v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int16 v27;
  void *v28;
  float v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  float v44;
  NSObject *v45;
  uint64_t i;
  void *v47;
  void *v48;
  float v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  PNVisionHelper *visionHelper;
  float v55;
  float v56;
  id v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v67;
  void (**v68)(id, _BYTE *, float);
  unsigned __int16 *v69;
  id obj;
  void *v71;
  void *v72;
  unsigned int v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void (**v78)(void *, void *, void *, void *, void *);
  void *v79;
  id *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  int v89;
  _QWORD aBlock[4];
  id v91;
  char v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  double v98;
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  void *v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v11 = a5;
  v106 = *MEMORY[0x24BDAC8D0];
  v83 = a3;
  v14 = a4;
  v15 = (void (**)(id, _BYTE *, float))a7;
  v92 = 0;
  v15[2](v15, &v92, 0.2);
  v16 = 1.0;
  if (!v92)
  {
    v17 = 16;
    if (v11)
      v17 = 24;
    v18 = *(id *)((char *)&self->super.isa + v17);
    objc_msgSend(v83, "localIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PNPersonClusterManager_distanceBetweenHuman_andHuman_useCommonMoments_minAgeType_updateBlock_error___block_invoke;
    aBlock[3] = &unk_2514801B0;
    v21 = v18;
    v91 = v21;
    v77 = v21;
    v78 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
    v82 = (void *)v19;
    objc_msgSend(v21, "objectForKeyedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v81 = v22;
    if (v22
      && (objc_msgSend(v22, "objectForKeyedSubscript:", v20), (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v25 = v24;
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("minAgeType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedShortValue");

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("distance"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v16 = v29;

      if (a6)
        *a6 = v27;

      v30 = v77;
      v23 = v81;
    }
    else
    {
      v89 = 0;
      -[PNPersonClusterManager representativeFaceObservationForPerson:ageType:](self, "representativeFaceObservationForPerson:ageType:", v83, (char *)&v89 + 2);
      v31 = objc_claimAutoreleasedReturnValue();
      -[PNPersonClusterManager representativeFaceObservationForPerson:ageType:](self, "representativeFaceObservationForPerson:ageType:", v14, &v89);
      v80 = a8;
      v32 = objc_claimAutoreleasedReturnValue();
      v73 = -[PNPersonClusterManager minAgeTypeForFaceAgeType:andFaceAgeType:](self, "minAgeTypeForFaceAgeType:andFaceAgeType:", HIWORD(v89), (unsigned __int16)v89);
      v71 = (void *)v32;
      v72 = (void *)v31;
      -[PNVisionHelper distanceBetweenFaceObservation:andFaceObservation:error:](self->_visionHelper, "distanceBetweenFaceObservation:andFaceObservation:error:", v31, v32, v80);
      v34 = v33;
      -[PNPersonClusterManager _adjustDistanceFactorForPerson:andPerson:forAgeType:andAgeType:](self, "_adjustDistanceFactorForPerson:andPerson:forAgeType:andAgeType:", v83, v14, HIWORD(v89), (unsigned __int16)v89);
      v36 = v35;
      if (v35 == 1.0)
      {
        v16 = v34;
      }
      else
      {
        v16 = v34 * v35;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v94 = v82;
          v95 = 2112;
          v96 = v20;
          v97 = 2048;
          v98 = v34;
          v99 = 2048;
          v100 = v16;
          _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Adjusting best distance between %@ and %@ from %.3f to %.3f", buf, 0x2Au);
        }
      }
      v15[2](v15, &v92, 0.9);
      v69 = a6;
      if (v11)
      {
        -[PNPersonClusterManager _minimiumDistanceRequiredForCommonAssetDistanceForAgeType:](self, "_minimiumDistanceRequiredForCommonAssetDistanceForAgeType:", v73);
        if (v16 <= *(float *)&v37)
        {
          objc_msgSend(v83, "backingMomentIdentifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v38, "mutableCopy");

          objc_msgSend(v14, "backingMomentIdentifiers");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "intersectSet:", v40);

          if (objc_msgSend(v39, "count"))
          {
            v67 = v39;
            objc_msgSend(v39, "allObjects");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[PNPersonClusterManager pn_fetchMomentsWithLocalIdentifiers:](self, "pn_fetchMomentsWithLocalIdentifiers:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = objc_msgSend(v42, "count");
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            obj = v42;
            v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
            if (v76)
            {
              v75 = *(_QWORD *)v86;
              v74 = (float)v43;
              v44 = 0.0;
              v45 = MEMORY[0x24BDACB70];
              v68 = v15;
              v79 = v20;
              while (2)
              {
                for (i = 0; i != v76; ++i)
                {
                  if (*(_QWORD *)v86 != v75)
                    objc_enumerationMutation(obj);
                  v47 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                  v48 = (void *)MEMORY[0x249506444]();
                  v49 = (v44 + 0.3) * 0.5 / v74 + 0.2;
                  v15[2](v15, &v92, v49);
                  if (v92)
                  {
                    objc_autoreleasePoolPop(v48);

                    v16 = 1.0;
                    v20 = v79;
                    v30 = v77;
                    goto LABEL_39;
                  }
                  v89 = 0;
                  v104 = v47;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v104, 1);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PNPersonClusterManager _representativeFaceObservationForPerson:ageType:inAssetCollections:](self, "_representativeFaceObservationForPerson:ageType:inAssetCollections:", v83, (char *)&v89 + 2, v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  v103 = v47;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PNPersonClusterManager _representativeFaceObservationForPerson:ageType:inAssetCollections:](self, "_representativeFaceObservationForPerson:ageType:inAssetCollections:", v14, &v89, v52);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  visionHelper = self->_visionHelper;
                  v84 = 0;
                  -[PNVisionHelper distanceBetweenFaceObservation:andFaceObservation:error:](visionHelper, "distanceBetweenFaceObservation:andFaceObservation:error:", v51, v53, &v84);
                  v56 = v55;
                  v57 = v84;
                  if (v36 == 1.0)
                  {
                    v58 = v56;
                  }
                  else
                  {
                    v58 = v36 * v56;
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v47, "localIdentifier");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413314;
                      v94 = v59;
                      v95 = 2112;
                      v96 = v82;
                      v97 = 2112;
                      v98 = *(double *)&v79;
                      v99 = 2048;
                      v100 = v56;
                      v101 = 2048;
                      v102 = v58;
                      _os_log_impl(&dword_243C3E000, v45, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Common moment %@ between %@ and %@: adjust distance from %.3f to %.3f", buf, 0x34u);

                      v15 = v68;
                    }
                  }
                  if (v58 < v16)
                  {
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v47, "localIdentifier");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413058;
                      v94 = v60;
                      v95 = 2112;
                      v96 = v82;
                      v97 = 2112;
                      v98 = *(double *)&v79;
                      v99 = 2048;
                      v100 = v58;
                      _os_log_impl(&dword_243C3E000, v45, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Common moment %@ between %@ and %@: new best distance %.3f", buf, 0x2Au);

                    }
                    v16 = v58;
                  }

                  objc_autoreleasePoolPop(v48);
                  if (v80)
                    *v80 = objc_retainAutorelease(v57);
                  v44 = v44 + 1.0;

                  v20 = v79;
                  v23 = v81;
                }
                v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
                if (v76)
                  continue;
                break;
              }
            }

            v39 = v67;
          }

        }
      }
      *(float *)&v37 = v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v73);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2](v78, v82, v20, v61, v62);

      *(float *)&v63 = v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v73);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2](v78, v20, v82, v64, v65);

      if (v69)
        *v69 = v73;
      v30 = v77;
      v23 = v81;
LABEL_39:

    }
  }

  return v16;
}

- (float)mergeConfidenceBetweenPersonLocalIdentifier:(id)a3 andCandidateLocalIdentifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_confidencesForMergedPersonLocalIdentifier, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = -1.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("confidence"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "floatValue");
            v18 = v17;

            if (v12 < v18)
              v12 = v18;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    else
    {
      v12 = -1.0;
    }

  }
  else
  {
    v12 = -1.0;
  }

  return v12;
}

- (float)_minimiumDistanceRequiredForCommonAssetDistanceForAgeType:(unsigned __int16)a3
{
  return flt_243FA9E10[(a3 - 1) < 2];
}

- (float)_adjustDistanceFactorForPerson:(id)a3 andPerson:(id)a4 forAgeType:(unsigned __int16)a5 andAgeType:(unsigned __int16)a6
{
  int v6;
  int v7;
  id v9;
  id v10;
  float v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = 1.0;
  if (v6 | v7)
  {
    if ((v6 | v7) == 1)
    {
      objc_msgSend(v9, "firstSeenDateWithoutOutliersForAgeType:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstSeenDateWithoutOutliersForAgeType:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      if (v14 < 0.0)
        v14 = -v14;
      v15 = v14 / 2629800.0;
      v16 = 0.00800000038;
    }
    else
    {
      if ((v7 | 2) != 2 || (v6 | 2) != 2)
        goto LABEL_15;
      objc_msgSend(v9, "firstSeenDateWithoutOutliersForAgeType:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstSeenDateWithoutOutliersForAgeType:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      if (v17 < 0.0)
        v17 = -v17;
      v15 = v17 / 2629800.0;
      v16 = 0.00100000005;
    }
    v18 = v15 * v16 + 1.0;
    if (v15 <= 12.0)
      v11 = 1.0;
    else
      v11 = v18;

  }
LABEL_15:

  return v11;
}

- (id)representativeFaceObservationForPerson:(id)a3 ageType:(unsigned __int16 *)a4
{
  return -[PNPersonClusterManager _representativeFaceObservationForPerson:ageType:inAssetCollections:](self, "_representativeFaceObservationForPerson:ageType:inAssetCollections:", a3, a4, 0);
}

- (id)_representativeFaceObservationForPerson:(id)a3 ageType:(unsigned __int16 *)a4 inAssetCollections:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  PNPersonClusterManager *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *context;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned __int16 v47;
  uint8_t buf[4];
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v47 = 0;
  v38 = v7;
  objc_msgSend(v7, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      v15 = v9;
      do
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v14), "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v9;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v12);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_representativeFaceObservationForPersonIdentifier, "objectForKeyedSubscript:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("distance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("minAgeType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v20, "unsignedShortValue");

  }
  else
  {
    context = (void *)MEMORY[0x249506444]();
    v21 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v22);
          -[PNPersonClusterManager pn_fetchFacesForPerson:inMoment:](self, "pn_fetchFacesForPerson:inMoment:", v38, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fetchedObjects");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v24);
    }

    if (v22 && (unint64_t)objc_msgSend(v21, "count") > 1)
    {
      v29 = v21;
      v30 = self;
      v31 = v29;
      v32 = 0;
    }
    else
    {
      -[PNPersonClusterManager pn_fetchFacesForPerson:](self, "pn_fetchFacesForPerson:", v38);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = self;
      v31 = v29;
      v32 = v38;
    }
    -[PNPersonClusterManager representativeFaceObservationForFaces:ageType:inPerson:](v30, "representativeFaceObservationForFaces:ageType:inPerson:", v31, &v47, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v33;
    if (v33)
    {
      v50[1] = CFSTR("minAgeType");
      v51[0] = v33;
      v50[0] = CFSTR("distance");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v47);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v38;
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PersonPromoter] Quarantine %@: VNFaceObservation nil", buf, 0xCu);
      }
      objc_msgSend(v38, "setQuarantined:", 1);
      v18 = 0;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_representativeFaceObservationForPersonIdentifier, "setObject:forKeyedSubscript:", v18, v9);

    objc_autoreleasePoolPop(context);
  }
  if (a4)
    *a4 = v47;

  return v19;
}

- (id)representativeFaceObservationForFaces:(id)a3 ageType:(unsigned __int16 *)a4 inPerson:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PNVisionHelper *visionHelper;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int16 v33;
  id v34;
  unsigned __int16 *v36;
  id v37;
  id obj;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[8];
  _QWORD v46[4];
  id v47;
  _QWORD *v48;
  uint64_t *v49;
  _BYTE *v50;
  _QWORD v51[3];
  int v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t v64[128];
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v37 = a5;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__2288;
  v62 = __Block_byref_object_dispose__2289;
  v63 = 0;
  v40 = (void *)objc_opt_new();
  v36 = a4;
  v39 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x249506444]();
        -[PNVisionHelper faceObservationFromFace:](self->_visionHelper, "faceObservationFromFace:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v12, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v14, v15);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v12, "ageType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, v15);

        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v12;
          _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Error: VNFaceObservation nil for %@", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v40, "count"))
  {
    visionHelper = self->_visionHelper;
    objc_msgSend(v40, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    -[PNVisionHelper representativenessFromFaceObservations:error:](visionHelper, "representativenessFromFaceObservations:error:", v18, &v53);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v53;

    if (v20 || !v19)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error while calling -[PNVisionHelper representativenessFromFaceObservations:error:]: %@, result: %@.", buf, 0x16u);
      }
      v34 = 0;
    }
    else
    {
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v52 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v66 = __Block_byref_object_copy__2288;
      v67 = __Block_byref_object_dispose__2289;
      v68 = 0;
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __81__PNPersonClusterManager_representativeFaceObservationForFaces_ageType_inPerson___block_invoke;
      v46[3] = &unk_2514801D8;
      v47 = v19;
      v48 = v51;
      v49 = &v58;
      v50 = buf;
      objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v46);
      if (v59[5])
      {
        if (v37)
        {
          objc_msgSend(v37, "representativeFaceByFaceIdentifiers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (unint64_t)objc_msgSend(v21, "count") > 1;

          if (v22)
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            objc_msgSend(v37, "representativeFaceByFaceIdentifiers");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "keyEnumerator");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v64, 16);
            if (v25)
            {
              v26 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v42 != v26)
                    objc_enumerationMutation(v24);
                  v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                  if (objc_msgSend(v28, "containsObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)))
                  {
                    objc_msgSend(v37, "representativeFaceByFaceIdentifiers");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "objectForKeyedSubscript:", v28);
                    v30 = objc_claimAutoreleasedReturnValue();
                    v31 = (void *)v59[5];
                    v59[5] = v30;

                  }
                }
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v64, 16);
              }
              while (v25);
            }

          }
        }
        objc_msgSend(v39, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "unsignedShortValue");

        if (v36)
          *v36 = v33;
        v34 = (id)v59[5];
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v45 = 0;
          _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: No valid face representativeness found.", v45, 2u);
        }
        v34 = 0;
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v51, 8);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Error: No valid face observations when calling -[PNVisionHelper faceObservationFromFace:]", buf, 2u);
    }
    v34 = 0;
  }

  _Block_object_dispose(&v58, 8);
  return v34;
}

- (float)distanceBetweenPet:(id)a3 andPet:(id)a4 useCommonMoments:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int v10;
  float v11;
  uint64_t v12;
  id v13;
  void (**v14)(void *, void *, void *, void *, void *);
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  _BOOL4 v28;
  void *v29;
  double v30;
  void *v31;
  id v33;
  void *v34;
  _QWORD aBlock[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "detectionType");
  v11 = 1.0;
  if (v10 == objc_msgSend(v9, "detectionType"))
  {
    v12 = 16;
    if (v5)
      v12 = 24;
    v13 = *(id *)((char *)&self->super.isa + v12);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PNPersonClusterManager_distanceBetweenPet_andPet_useCommonMoments___block_invoke;
    aBlock[3] = &unk_2514801B0;
    v33 = v13;
    v36 = v33;
    v14 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
    objc_msgSend(v8, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentifier");
    v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[PNPersonClusterManager pn_fetchFacesForPerson:](self, "pn_fetchFacesForPerson:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonClusterManager pn_fetchFacesForPerson:](self, "pn_fetchFacesForPerson:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v17;
    objc_msgSend(v17, "fetchedObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonClusterManager distanceBetweenPetFaces:andPetFaces:](self, "distanceBetweenPetFaces:andPetFaces:", v19, v20);
    v22 = v21;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v34, "count");
      v25 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 138413314;
      v38 = v15;
      v39 = 2048;
      v40 = v24;
      v41 = 2112;
      v42 = v16;
      v43 = 2048;
      v44 = v25;
      v45 = 2048;
      v46 = v22;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] The overall distance between %@ (%lu faces) and %@ (%lu faces) is %lf", buf, 0x34u);
    }
    v11 = v22;
    if (v5)
    {
      -[PNPersonClusterManager momentBasedDistanceBetweenPet:andPet:](self, "momentBasedDistanceBetweenPet:andPet:", v8, v9);
      v27 = v26;
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      v11 = 1.0;
      if (v27 == 1.0)
      {
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Common moments distance is 1.0, setting distance to 1.0...", buf, 2u);
        }
      }
      else
      {
        if (v28)
        {
          *(_DWORD *)buf = 138412802;
          v38 = v15;
          v39 = 2112;
          v40 = *(_QWORD *)&v16;
          v41 = 2048;
          v42 = v27;
          _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] The common moments distance between %@ and %@ is %lf", buf, 0x20u);
        }
        if (v22 >= v27)
          v11 = v27;
        else
          v11 = v22;
      }
    }
    *(float *)&v23 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(void *, void *, void *, void *, void *), void *, double, void *, void *))v14[2])(v14, v15, COERCE_DOUBLE(*(_QWORD *)&v16), v29, &unk_25149A3C0);

    *(float *)&v30 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(void *, void *, void *, void *, void *), double, void *, void *, void *))v14[2])(v14, COERCE_DOUBLE(*(_QWORD *)&v16), v15, v31, &unk_25149A3C0);

  }
  return v11;
}

- (float)distanceBetweenPetFaces:(id)a3 andPetFaces:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  float v14;
  float v15;
  float v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  if (self->_vuDistanceSPIEnabled)
  {
    v6 = (objc_class *)MEMORY[0x24BDBCEB8];
    v7 = a4;
    v8 = a3;
    v9 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v11 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke;
    v23[3] = &unk_251480200;
    v24 = v9;
    v12 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v23);

    v18 = v11;
    v19 = 3221225472;
    v20 = __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke_2;
    v21 = &unk_251480200;
    v22 = v10;
    v13 = v10;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v18);

    -[PNPersonPromoterDelegate similarityBetweenFacesWithVUIdentifiers:andOtherFacesWithVUIdentifiers:](self->_promoterDelegate, "similarityBetweenFacesWithVUIdentifiers:andOtherFacesWithVUIdentifiers:", v12, v13, v18, v19, v20, v21);
    v15 = 1.0 - v14;

  }
  else
  {
    v13 = a4;
    v12 = a3;
    -[PNPersonClusterManager animalprintBasedDistanceBetweenPetFaces:andPetFaces:](self, "animalprintBasedDistanceBetweenPetFaces:andPetFaces:", v12, v13);
    v15 = v16;
  }

  return v15;
}

- (float)animalprintBasedDistanceBetweenPetFaces:(id)a3 andPetFaces:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[4];
  id v32;
  uint8_t *v33;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t v43[4];
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v28 = v5;
  v29 = v6;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    *(_QWORD *)buf = 0;
    v38 = buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__2288;
    v41 = __Block_byref_object_dispose__2289;
    v42 = 0;
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke;
    v34[3] = &unk_251480228;
    v36 = buf;
    v9 = v7;
    v35 = v9;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v34);
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_185;
    v31[3] = &unk_251480228;
    v33 = buf;
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = v10;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
    v11 = objc_msgSend(v9, "count");
    if (v11 >= objc_msgSend(v10, "count"))
      v12 = v9;
    else
      v12 = v10;
    v13 = v12;
    v14 = objc_msgSend(v9, "count");
    if (v14 >= objc_msgSend(v10, "count"))
      v15 = v10;
    else
      v15 = v9;
    v16 = v15;
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_2291);
      objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_188);
      v17 = objc_msgSend(v16, "count");
      v18 = 0;
      v19 = 0.0;
      while (objc_msgSend(v13, "count") > v18)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v18 % v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id *)(v38 + 40);
        obj = (id)*((_QWORD *)v38 + 5);
        objc_msgSend(v20, "computeDistance:withDistanceFunction:error:", v21, 0, &obj);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v22, obj);
        objc_msgSend(v23, "floatValue");
        v25 = v24;

        v19 = v19 + v25;
        ++v18;
      }
      v26 = v19 / (float)(unint64_t)objc_msgSend(v13, "count");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v43 = 134217984;
        v44 = v26;
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Found an average distance of %lf for the two pets.", v43, 0xCu);
      }
    }
    else
    {
      v26 = 1.0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNPersonClusterManager] Error: Couldn't extract animalprint from any pet faces for one of the pets", v43, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v26 = 1.0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] One pet has zero faces, bailing and returning a distance of 1!", buf, 2u);
    }
  }

  return v26;
}

- (float)momentBasedDistanceBetweenPet:(id)a3 andPet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  PNPersonClusterManager *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  double v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  *(double *)&v8 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "backingMomentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingMomentIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") >= 2 && (unint64_t)objc_msgSend(v10, "count") > 1)
  {
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v12, "intersectSet:", v10);
    v13 = objc_msgSend(v12, "count");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v59 = v13;
      v60 = 2112;
      v61 = (uint64_t)v7;
      v62 = 2112;
      v63 = v8;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Found %lu common moments between %@ and %@", buf, 0x20u);
    }
    if (!v13)
    {
      v11 = 1.0;
LABEL_38:

      goto LABEL_39;
    }
    if (v13 == 1)
    {
      objc_msgSend(v5, "backingAssetIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backingAssetIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v14;
      v16 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v16, "intersectSet:", v15);
      v17 = objc_msgSend(v16, "count");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v59 = v17;
        v60 = 2112;
        v61 = (uint64_t)v7;
        v62 = 2112;
        v63 = v8;
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Found %lu common assets between %@ and %@", buf, 0x20u);
      }
      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v59 = v17;
          v60 = 2048;
          v61 = 1;
          _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] %lu > 0 common assets in %lu common moments under the minimum common moments threshold, returning a distance of 1.0", buf, 0x16u);
        }

        v11 = 1.0;
        v18 = v52;
        goto LABEL_37;
      }

    }
    v46 = v12;
    v47 = v10;
    objc_msgSend(v12, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self;
    -[PNPersonClusterManager pn_fetchMomentsWithLocalIdentifiers:](self, "pn_fetchMomentsWithLocalIdentifiers:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v18 = v21;
    v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v22)
    {
      v23 = v22;
      v45 = v9;
      v48 = (void *)v8;
      v49 = v7;
      v24 = *(_QWORD *)v55;
      v25 = 0.0;
      v26 = 0.0;
      v50 = *(_QWORD *)v55;
      do
      {
        v27 = 0;
        v53 = v23;
        do
        {
          if (*(_QWORD *)v55 != v24)
            objc_enumerationMutation(v18);
          v28 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x249506444]();
          -[PNPersonClusterManager pn_fetchFacesForPerson:inMoment:](v20, "pn_fetchFacesForPerson:inMoment:", v5, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v30, "count") >= 2)
          {
            -[PNPersonClusterManager pn_fetchFacesForPerson:inMoment:](v20, "pn_fetchFacesForPerson:inMoment:", v6, v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v31, "count") >= 2)
            {
              v32 = v18;
              v33 = v5;
              v34 = v6;
              objc_msgSend(v30, "fetchedObjects");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "fetchedObjects");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[PNPersonClusterManager distanceBetweenPetFaces:andPetFaces:](v20, "distanceBetweenPetFaces:andPetFaces:", v35, v36);
              v38 = v37;

              v25 = v25 + v38;
              v26 = v26 + 1.0;
              v39 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
              {
                v40 = objc_msgSend(v30, "count");
                v41 = objc_msgSend(v31, "count");
                *(_DWORD *)buf = 138413314;
                v59 = (uint64_t)v49;
                v60 = 2048;
                v61 = v40;
                v62 = 2112;
                v63 = (uint64_t)v48;
                v64 = 2048;
                v65 = v41;
                v66 = 2048;
                v67 = v38;
                _os_log_impl(&dword_243C3E000, v39, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Distance between %@ (%lu faces) and %@ (%lu faces) is %lf", buf, 0x34u);
              }
              v6 = v34;
              v5 = v33;
              v18 = v32;
              v24 = v50;
              v20 = self;
              v23 = v53;
            }

          }
          objc_autoreleasePoolPop(v29);
          ++v27;
        }
        while (v23 != v27);
        v23 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v23);

      v8 = (uint64_t)v48;
      v7 = v49;
      v9 = v45;
      if (v26 != 0.0)
      {
        v11 = v25 / v26;
        v12 = v46;
        v10 = v47;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v59 = (uint64_t)v49;
          v60 = 2112;
          v61 = (uint64_t)v48;
          v62 = 2048;
          *(double *)&v63 = v11;
          v42 = MEMORY[0x24BDACB70];
          v43 = "[PNPersonClusterManager] The average distance across moments between %@ and %@ is %lf";
LABEL_36:
          _os_log_impl(&dword_243C3E000, v42, OS_LOG_TYPE_INFO, v43, buf, 0x20u);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    else
    {

    }
    v11 = 1.0;
    v12 = v46;
    v10 = v47;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v59 = (uint64_t)v7;
      v60 = 2112;
      v61 = v8;
      v62 = 2048;
      v63 = 2;
      v42 = MEMORY[0x24BDACB70];
      v43 = "[PNPersonClusterManager] No common moments between %@ and %@ where the pets both have more than %lu faces, returning...";
      goto LABEL_36;
    }
LABEL_37:

    goto LABEL_38;
  }
  v11 = 1.0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v59 = (uint64_t)v7;
    v60 = 2048;
    v61 = objc_msgSend(v9, "count");
    v62 = 2112;
    v63 = v8;
    v64 = 2048;
    v65 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Pet %@ has %lu moments and pet %@ has %lu moments, returning a distance of 1.0 because a pet has too few moments", buf, 0x2Au);
  }
LABEL_39:

  return v11;
}

- (id)pn_persistentStorageDirectoryURL
{
  void *v2;
  void *v3;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_persistentStorageDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)pn_performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "pn_performChangesAndWait:error:", v6, a4);

  return (char)a4;
}

- (id)pn_fetchPersonsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_personClusters, "objectForKeyedSubscript:", v12, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v5;
          v15 = v13;
        }
        else
        {
          v14 = v6;
          v15 = v12;
        }
        objc_msgSend(v14, "addObject:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pn_fetchPersonsWithLocalIdentifiers:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PNPersonClusterManager _mapPersonClustersToPersons:](self, "_mapPersonClustersToPersons:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v18);

  }
  return v5;
}

- (id)pn_fetchPersonsWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "pn_fetchPersonsWithType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PNPersonClusterManager _mapPersonClustersToPersons:](self, "_mapPersonClustersToPersons:", v7);
  }
  else
  {
    objc_msgSend(v5, "pn_fetchFaceGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PNPersonClusterManager _mapPersonClustersToFaceGroups:](self, "_mapPersonClustersToFaceGroups:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchPersonsInMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchPersonsInMoment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPersonClusterManager _mapPersonClustersToPersons:](self, "_mapPersonClustersToPersons:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchCandidatePersonsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pn_fetchCandidatePersonsForPerson:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPersonClusterManager _mapPersonClustersToPersons:](self, "_mapPersonClustersToPersons:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchInvalidCandidatePersonsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pn_fetchInvalidCandidatePersonsForPerson:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPersonClusterManager _mapPersonClustersToPersons:](self, "_mapPersonClustersToPersons:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PNPersonClusterManager *v13;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__PNPersonClusterManager_pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets___block_invoke;
  v11[3] = &unk_2514802B0;
  v8 = v7;
  v12 = v8;
  v13 = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = v8;

  return v9;
}

- (unint64_t)pn_numberOfFacesWithFaceprints
{
  void *v2;
  unint64_t v3;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pn_numberOfFacesWithFaceprints");

  return v3;
}

- (id)pn_fetchFacesWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchFacesWithLocalIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchFacesForPerson:(id)a3
{
  return (id)objc_msgSend(a3, "fetchFaces");
}

- (id)pn_fetchFacesForPerson:(id)a3 inMoment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "backingFaceIdentifiersByMomentIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pn_fetchFacesWithLocalIdentifiers:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "personLocalIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v16, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_opt_new();
      v33 = v17;
      objc_msgSend(v17, "fetchedObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceFaceGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v6;
      if (v20)
      {
        objc_msgSend(v6, "backingFaceIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = v19;
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v13);
            v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (v21)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "localIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v21, "containsObject:", v27);

              if (!v28)
                continue;
            }
            objc_msgSend(v26, "localIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v29);

          }
          v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v23);
      }

      v6 = v34;
      objc_msgSend(v34, "backingFaceIdentifiersByMomentIdentifiers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v18, v31);

      v10 = 0;
    }
  }
  else
  {
    -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backingFaceIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pn_fetchFacesWithLocalIdentifiers:", v15);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)pn_fetchFacesForPersonLocalIdentifiers:(id)a3 inMoment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pn_fetchFacesForFaceGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchFacesForFaceGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsForFaceLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchAssetsForFaceLocalIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchMoments
{
  void *v2;
  void *v3;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_fetchMoments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pn_fetchMomentsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchMomentsWithLocalIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchMomentsForPerson:(id)a3
{
  return (id)objc_msgSend(a3, "fetchMoments");
}

- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchMomentsForAssetsWithLocalIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchAssetsWithLocalIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsInMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchAssetsInMoment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsForPerson:(id)a3
{
  return (id)objc_msgSend(a3, "fetchAssets");
}

- (id)pn_fetchAssetsForFaceGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchAssetsForFaceGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchFaceGroups
{
  void *v2;
  void *v3;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_fetchFaceGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pn_fetchFaceGroupsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pn_fetchFaceGroupsForPerson:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison
{
  void *v2;
  void *v3;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_fetchInvalidAssetIdentifiersForCommonComparison");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (float)pn_faceProcessingProgress
{
  void *v2;
  float v3;
  float v4;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_faceProcessingProgress");
  v4 = v3;

  return v4;
}

- (id)pn_lastAssetDate
{
  void *v2;
  void *v3;

  -[PNPersonClusterManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pn_lastAssetDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PNPhotoLibraryProtocol)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (PNVisionHelper)visionHelper
{
  return self->_visionHelper;
}

- (void)setVisionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_visionHelper, a3);
}

- (NSMutableDictionary)personClusters
{
  return self->_personClusters;
}

- (void)setPersonClusters:(id)a3
{
  objc_storeStrong((id *)&self->_personClusters, a3);
}

- (NSSet)assetsToIgnore
{
  return self->_assetsToIgnore;
}

- (void)setAssetsToIgnore:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToIgnore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToIgnore, 0);
  objc_storeStrong((id *)&self->_personClusters, 0);
  objc_storeStrong((id *)&self->_visionHelper, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_promoterDelegate, 0);
  objc_storeStrong((id *)&self->_confidencesForMergedPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_distancesInCommonMomentsForPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_distancesForPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_representativeFaceObservationForPersonIdentifier, 0);
}

void __80__PNPersonClusterManager_pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_mapPersonClustersToPersons:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x24BDF9AE0]);
  objc_msgSend(v3, "faceprintData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = (void *)objc_msgSend(v4, "initWithState:error:", v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNPersonClusterManager] Error: Couldn't extract animalprint from pet face %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

void __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x24BDF9AE0]);
  objc_msgSend(v3, "faceprintData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = (void *)objc_msgSend(v4, "initWithState:error:", v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNPersonClusterManager] Error: Couldn't extract animalprint from pet face %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

uint64_t __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 < v8
    || (objc_msgSend(v4, "confidence"), v10 = v9, objc_msgSend(v5, "confidence"), v10 == v11)
    && (v12 = objc_msgSend(v4, "hash"), v12 < objc_msgSend(v5, "hash")))
  {
    v13 = -1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 < v8
    || (objc_msgSend(v4, "confidence"), v10 = v9, objc_msgSend(v5, "confidence"), v10 == v11)
    && (v12 = objc_msgSend(v4, "hash"), v12 < objc_msgSend(v5, "hash")))
  {
    v13 = -1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

void __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "vuObservationID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "vuObservationID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __69__PNPersonClusterManager_distanceBetweenPet_andPet_useCommonMoments___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = *(void **)(a1 + 32);
  v13 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("distance");
  v17[1] = CFSTR("minAgeType");
  v18[0] = v10;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v15, v13);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v9);
    v13 = (id)v16;
  }

}

void __81__PNPersonClusterManager_representativeFaceObservationForFaces_ageType_inPerson___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = a3;
  v7 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "faceId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    v11 = *(_QWORD *)(a1[5] + 8);
    if (v10 > *(float *)(v11 + 24))
    {
      *(float *)(v11 + 24) = v10;
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    }
  }

}

void __102__PNPersonClusterManager_distanceBetweenHuman_andHuman_useCommonMoments_minAgeType_updateBlock_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = *(void **)(a1 + 32);
  v13 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("distance");
  v17[1] = CFSTR("minAgeType");
  v18[0] = v10;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v15, v13);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v9);
    v13 = (id)v16;
  }

}

void __119__PNPersonClusterManager_updateConfidenceCacheBetweenPersonLocalIdentifier_andOtherPersonLocalIdentifier_withDistance___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v15 = CFSTR("confidence");
  v16[0] = v8;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v11, v10);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v7);
    v10 = (id)v14;
  }

}

void __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke_2;
    v7[3] = &unk_251480138;
    v8 = v4;
    v9 = v6;
    v10 = *(id *)(a1 + 32);
    v5 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
    objc_msgSend(v3, "removeObjectsForKeys:", v5);

  }
}

void __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  float v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("distance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  if (v6 < 0.3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  }
}

+ (id)personProcessingSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)momentSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)assetSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("filename"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)faceSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)peopleSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)faceGroupSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nodeSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
