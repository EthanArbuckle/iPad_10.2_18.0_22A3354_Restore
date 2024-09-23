@implementation PGMemoryController

- (PGMemoryController)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5
{
  id v9;
  PGMemoryController *v10;
  PGMemoryController *v11;

  v9 = a3;
  v10 = -[PGMemoryController initWithPhotoLibrary:loggingConnection:](self, "initWithPhotoLibrary:loggingConnection:", a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_graph, a3);

  return v11;
}

- (PGMemoryController)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGMemoryController *v9;
  PGMemoryController *v10;
  id progressBlock;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGMemoryController;
  v9 = -[PGMemoryController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    progressBlock = v10->_progressBlock;
    v10->_progressBlock = &__block_literal_global_8011;

  }
  return v10;
}

- (id)momentForMomentID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = self->_momentsByMomentIDs;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_momentsByMomentIDs, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier == %@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPredicate:", v8);

      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_momentsByMomentIDs, "setObject:forKeyedSubscript:", v6, v4);

    }
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)libraryHasEnoughProcessedScenes:(BOOL)a3 andProcessedFaces:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  -[PGMemoryGenerationContext processedScenesAndFacesCache](self->_memoryGenerationContext, "processedScenesAndFacesCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "libraryHasEnoughScenesProcessed:andProcessedFaces:", v5, v4);

  return v4;
}

- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 haveFacesProcessed:(BOOL)a4 forYear:(id)a5 withGraph:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  PGMemoryGenerationContext *memoryGenerationContext;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v7 = a4;
  v8 = a3;
  memoryGenerationContext = self->_memoryGenerationContext;
  v10 = a6;
  v11 = a5;
  -[PGMemoryGenerationContext processedScenesAndFacesCache](memoryGenerationContext, "processedScenesAndFacesCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "integerValue");

  LOBYTE(v11) = objc_msgSend(v12, "libraryHasEnoughScenesProcessed:andProcessedFaces:forYear:inGraph:", v8, v7, v13, v10);
  return (char)v11;
}

- (BOOL)momentNodesHaveScenesProcessed:(id)a3 inGraph:(id)a4
{
  PGMemoryGenerationContext *memoryGenerationContext;
  id v6;
  id v7;
  void *v8;
  char v9;

  memoryGenerationContext = self->_memoryGenerationContext;
  v6 = a4;
  v7 = a3;
  -[PGMemoryGenerationContext processedScenesAndFacesCache](memoryGenerationContext, "processedScenesAndFacesCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allMomentNodesHaveScenesProcessed:inGraph:", v7, v6);

  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (PGCurationManager)curationManager
{
  return (PGCurationManager *)objc_getProperty(self, a2, 32, 1);
}

- (PGMemoryGenerationContext)memoryGenerationContext
{
  return self->_memoryGenerationContext;
}

- (void)setMemoryGenerationContext:(id)a3
{
  objc_storeStrong((id *)&self->_memoryGenerationContext, a3);
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (id)progressBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_memoryGenerationContext, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_momentsByMomentIDs, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)assetCollectionWithAssetLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGMemoryController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  +[PGCurationManager defaultAssetSortDescriptors](PGCurationManager, "defaultAssetSortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)anyBlockedFeatureIsHitByEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PGMemoryController memoryGenerationContext](self, "memoryGenerationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodesWithBlockedFeatureCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodesWithBlockedFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "containsNode:", v4);
  return (char)v5;
}

+ (id)_localIdentifierOfMainPersonInEvent:(id)a3 prominentOnly:(BOOL)a4
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  int v20;
  void *v21;
  uint64_t v23;
  id v24;
  unint64_t v25;
  _BOOL4 v26;
  id obj;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v26 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "eventCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMomentNodes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v28, "numberOfAssets");
  if (v26)
    v6 = 0.8;
  else
    v6 = 0.45;
  if (v26)
    v7 = 0.2;
  else
    v7 = 0.15;
  v36 = 0u;
  v37 = 0u;
  if (v26)
    v8 = 3;
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  v38 = 0uLL;
  v39 = 0uLL;
  objc_msgSend(v24, "personNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v9)
  {
LABEL_33:
    v11 = 0;
    goto LABEL_34;
  }
  v10 = 0;
  v11 = 0;
  v12 = vcvtpd_u64_f64(v6 * (double)v5);
  v25 = vcvtmd_u64_f64(v7 * (double)v5);
  v13 = *(_QWORD *)v37;
  while (2)
  {
    v14 = 0;
    v15 = v10 + 1;
    v23 = v10 + v9;
    do
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(obj);
      if (v15 + v14 > v8)
      {

        goto LABEL_33;
      }
      v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
      objc_msgSend(v16, "collection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __89__PGMemoryController_FeatureBlocking___localIdentifierOfMainPersonInEvent_prominentOnly___block_invoke;
      v29[3] = &unk_1E84342A8;
      v18 = v17;
      v30 = v18;
      v31 = &v32;
      objc_msgSend(v28, "enumerateIdentifiersAsCollectionsWithBlock:", v29);
      v19 = v33[3];
      if (v19 >= v12)
      {
        if (v11 || (objc_msgSend(v16, "isMeNode") & 1) != 0)
        {
          if (!objc_msgSend(v16, "isMeNode", v23) || v26)
          {
LABEL_25:

            v20 = 0;
            v11 = 0;
            goto LABEL_28;
          }
        }
        else
        {
          v11 = v16;
        }
      }
      else if (v19 > v25 && (!objc_msgSend(v16, "isMeNode") || v26))
      {
        goto LABEL_25;
      }
      v20 = 1;
LABEL_28:

      _Block_object_dispose(&v32, 8);
      if (!v20)
        goto LABEL_34;
      ++v14;
    }
    while (v9 != v14);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v10 = v23;
    if (v9)
      continue;
    break;
  }
LABEL_34:

  objc_msgSend(v11, "localIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (BOOL)anyBlockedFeatureIn:(id)a3 isHitByEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  char v45;
  BOOL v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[6];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[6];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v56 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v55 = v6;
    objc_msgSend(v6, "celebratedHolidayNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v88;
      v51 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v88 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v12 = v56;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v84;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v84 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
                objc_msgSend(v11, "name");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v16) = objc_msgSend(v16, "collidesWithHolidayWithName:", v17);

                if ((v16 & 1) != 0)
                {
LABEL_59:
                  v46 = 1;
                  goto LABEL_60;
                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
              if (v13)
                continue;
              break;
            }
          }

          v9 = v51;
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
        v9 = v51;
      }
      while (v8);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v55, "dateNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v52)
    {
      v18 = *(_QWORD *)v80;
      v48 = *(_QWORD *)v80;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v80 != v18)
          {
            v20 = v19;
            objc_enumerationMutation(v7);
            v19 = v20;
          }
          v49 = v19;
          v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v19);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v22 = v56;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v76;
            while (2)
            {
              for (k = 0; k != v23; ++k)
              {
                if (*(_QWORD *)v76 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
                objc_msgSend(v21, "localDate", v48);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v26, "collidesWithDate:", v27);

                v71 = 0;
                v72 = &v71;
                v73 = 0x2020000000;
                v74 = 0;
                if ((v28 & 1) != 0
                  || (v70[0] = MEMORY[0x1E0C809B0],
                      v70[1] = 3221225472,
                      v70[2] = __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke,
                      v70[3] = &unk_1E8435500,
                      v70[4] = v26,
                      v70[5] = &v71,
                      objc_msgSend(v21, "enumerateHolidayNodesUsingBlock:", v70),
                      *((_BYTE *)v72 + 24)))
                {
LABEL_58:
                  _Block_object_dispose(&v71, 8);
                  goto LABEL_59;
                }
                _Block_object_dispose(&v71, 8);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
              if (v23)
                continue;
              break;
            }
          }

          v19 = v49 + 1;
          v18 = v48;
        }
        while (v49 + 1 != v52);
        v52 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
        v18 = v48;
      }
      while (v52);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v55, "addressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v93, 16);
    if (v53)
    {
      v29 = *(_QWORD *)v67;
      v48 = *(_QWORD *)v67;
      while (2)
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v67 != v29)
          {
            v31 = v30;
            objc_enumerationMutation(v7);
            v30 = v31;
          }
          v50 = v30;
          v32 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v30);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v33 = v56;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v92, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v63;
LABEL_40:
            v36 = 0;
            while (1)
            {
              if (*(_QWORD *)v63 != v35)
                objc_enumerationMutation(v33);
              v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v36);
              objc_msgSend(v32, "coordinate", v48);
              v38 = objc_msgSend(v37, "collidesWithLocationAtCoordinates:");
              v71 = 0;
              v72 = &v71;
              v73 = 0x2020000000;
              v74 = 0;
              if ((v38 & 1) != 0)
                goto LABEL_58;
              objc_msgSend(v32, "collection");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "areaNodes");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v61[0] = MEMORY[0x1E0C809B0];
              v61[1] = 3221225472;
              v61[2] = __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke_2;
              v61[3] = &unk_1E8432D40;
              v61[4] = v37;
              v61[5] = &v71;
              objc_msgSend(v40, "enumerateNodesUsingBlock:", v61);

              if (*((_BYTE *)v72 + 24))
                goto LABEL_58;
              _Block_object_dispose(&v71, 8);
              if (v34 == ++v36)
              {
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v92, 16);
                if (v34)
                  goto LABEL_40;
                break;
              }
            }
          }

          v30 = v50 + 1;
          v29 = v48;
        }
        while (v50 + 1 != v53);
        v53 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v93, 16);
        v29 = v48;
        if (v53)
          continue;
        break;
      }
    }

    objc_msgSend(a1, "_localIdentifierOfMainPersonInEvent:prominentOnly:", v55, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = v56;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v91, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v58;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v58 != v43)
            objc_enumerationMutation(v41);
          v45 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "collidesWithPersonWithLocalIdentifier:", v7, v48);
        }
        v46 = v45;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v91, 16);
      }
      while (v42);
    }
    else
    {
      v46 = 0;
    }
LABEL_60:

    v6 = v55;
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

void __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "collidesWithHolidayWithName:", v6);

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "collidesWithAreaWithName:", v6);

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __89__PGMemoryController_FeatureBlocking___localIdentifierOfMainPersonInEvent_prominentOnly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", *(_QWORD *)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyEdge");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v5, "numberOfAssets");
}

@end
