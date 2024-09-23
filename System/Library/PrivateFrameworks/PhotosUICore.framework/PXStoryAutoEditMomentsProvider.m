@implementation PXStoryAutoEditMomentsProvider

- (PXStoryAutoEditMomentsProvider)initWithConfiguration:(id)a3 assetCollection:(id)a4 displayAssets:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXStoryAutoEditMomentsProvider *v12;
  PXStoryAutoEditMomentsProvider *v13;
  PXStoryAutoEditConcreteMomentsStatistics *v14;
  PXStoryAutoEditConcreteMomentsStatistics *statistics;
  const char *v16;
  objc_class *v17;
  id v18;
  os_log_t v19;
  OS_os_log *log;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryAutoEditMomentsProvider;
  v12 = -[PXStoryAutoEditMomentsProvider init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_assetCollection, a4);
    objc_storeStrong((id *)&v13->_displayAssets, a5);
    v14 = objc_alloc_init(PXStoryAutoEditConcreteMomentsStatistics);
    statistics = v13->_statistics;
    v13->_statistics = v14;

    v16 = (const char *)*MEMORY[0x1E0D744D8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = os_log_create(v16, (const char *)objc_msgSend(v18, "UTF8String"));
    log = v13->_log;
    v13->_log = (OS_os_log *)v19;

  }
  return v13;
}

- (id)_faceprintsByAssetUUIDWithAssets:(id)a3 faceprintDatas:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;

  v5 = a3;
  v20 = a4;
  v6 = (void *)MEMORY[0x1A85CE17C]();
  if (objc_msgSend(v5, "count") >= 2)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v5, "count") >= 1)
    {
      v18 = v6;
      v19 = v5;
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8, v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v11, "count"))
        {
          v13 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = objc_alloc(NSClassFromString(CFSTR("VNFaceTorsoprint")));
              v21 = 0;
              v16 = (void *)objc_msgSend(v15, "initWithState:error:", v14, &v21);
              if (v16)
                objc_msgSend(v12, "addObject:", v16);

            }
            ++v13;
          }
          while (v13 < objc_msgSend(v11, "count"));
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v10);

        ++v8;
        v5 = v19;
      }
      while (v8 < objc_msgSend(v19, "count"));
      v6 = v18;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_autoreleasePoolPop(v6);

  return v7;
}

- (id)_faceprintDatasByAssetUUIDWithAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A85CE17C]();
  if (objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v29 = (id)objc_opt_new();
      if (objc_msgSend(v3, "count") >= 1)
      {
        v27 = v5;
        v6 = 0;
        v28 = v3;
        do
        {
          v7 = (void *)MEMORY[0x1A85CE17C]();
          objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v30 = v7;
            v10 = v8;
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v10, "faceStrings");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              v13 = 0;
              do
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 1);
                if (v15)
                  objc_msgSend(v11, "addObject:", v15);

                ++v13;
              }
              while (v13 < objc_msgSend(v12, "count"));
            }
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v11, v9);

            v3 = v28;
            v7 = v30;
          }

          objc_autoreleasePoolPop(v7);
          ++v6;
        }
        while (v6 < objc_msgSend(v3, "count"));
        v5 = v27;
      }
      goto LABEL_22;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "photoLibraryForCurrentQueueQoS");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "librarySpecificFetchOptions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setIncludedDetectionTypes:", v20);

          v33[0] = *MEMORY[0x1E0CD1B50];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFetchPropertySets:", v21);

          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectsAtIndexes:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v23, v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_opt_new();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __71__PXStoryAutoEditMomentsProvider__faceprintDatasByAssetUUIDWithAssets___block_invoke;
          v31[3] = &unk_1E5123718;
          v29 = v25;
          v32 = v29;
          objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v31);

LABEL_21:
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    else
    {
      v17 = 0;
    }
    v29 = 0;
    goto LABEL_21;
  }
  v29 = 0;
LABEL_23:
  objc_autoreleasePoolPop(v4);

  return v29;
}

- (id)_faceprintsByAssetUUIDWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count") >= 2)
  {
    -[PXStoryAutoEditMomentsProvider _faceprintDatasByAssetUUIDWithAssets:](self, "_faceprintDatasByAssetUUIDWithAssets:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryAutoEditMomentsProvider _faceprintsByAssetUUIDWithAssets:faceprintDatas:](self, "_faceprintsByAssetUUIDWithAssets:faceprintDatas:", v4, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_locationsByAssetUUIDWithAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double latitude;
  double longitude;
  void *v15;
  CLLocationCoordinate2D v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85CE17C]();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      if (objc_msgSend(v3, "count"))
      {
        v8 = 0;
        do
        {
          objc_msgSend(v3, "objectAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "location");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v10)
          {
            if (v11)
            {
              objc_msgSend(v10, "coordinate");
              latitude = v17.latitude;
              longitude = v17.longitude;
              if (CLLocationCoordinate2DIsValid(v17))
              {
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v12);

              }
            }
          }

          ++v8;
        }
        while (v8 < objc_msgSend(v3, "count"));
      }
    }
  }
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (void)_computeClustering
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  os_signpost_id_t v8;
  OS_os_log *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PXDisplayAssetFetchResult *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  PXStoryMemoryMomentConcreteClusteringDistanceCalculator *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  void *v30;
  int v31;
  objc_class *v32;
  NSObject *v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  char v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  PXDisplayAssetFetchResult *v66;
  PXStoryMemoryMoment *v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  double v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  NSArray *moments;
  double v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  objc_class *aClass;
  os_signpost_id_t spid;
  uint64_t v87;
  void *v88;
  void *v89;
  unint64_t v90;
  void *v91;
  const __CFString *v92;
  PXStoryAutoEditMomentsProvider *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  PXDisplayAssetFetchResult *v98;
  PXStoryMemoryMomentConcreteClusteringDistanceCalculator *v99;
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  unint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  double v109;
  __int16 v110;
  unint64_t v111;
  __int16 v112;
  double v113;
  _QWORD v114[10];

  v114[8] = *MEMORY[0x1E0C80C00];
  if (-[PXDisplayAssetFetchResult count](self->_displayAssets, "count") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    -[PXStoryAutoEditMomentsProvider assetCollection](self, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "category");
      v7 = CFSTR("singleMoment");
      switch(v6)
      {
        case 1:
          break;
        case 2:
          v7 = CFSTR("personOverTime");
          break;
        case 3:
          v7 = CFSTR("person");
          break;
        case 4:
          v7 = CFSTR("earlyMomentsWithPerson");
          break;
        case 5:
          v7 = CFSTR("socialGroupOverTime");
          break;
        case 6:
          v7 = CFSTR("socialGroup");
          break;
        case 7:
          v7 = CFSTR("lastMonthAtHome");
          break;
        case 8:
          v7 = CFSTR("lastYearInReview");
          break;
        case 9:
          v7 = CFSTR("foodie");
          break;
        case 10:
          v7 = CFSTR("pet");
          break;
        case 11:
          v7 = CFSTR("baby");
          break;
        case 12:
          v7 = CFSTR("cityLocation");
          break;
        case 13:
          v7 = CFSTR("regionLocation");
          break;
        case 14:
          v7 = CFSTR("areaLocation");
          break;
        case 15:
          v7 = CFSTR("businessLocation");
          break;
        case 16:
        case 17:
          v7 = CFSTR("meaningfulEvent");
          break;
        case 18:
        case 19:
        case 31:
          v7 = CFSTR("trip");
          break;
        case 20:
        case 22:
        case 30:
          goto LABEL_6;
        case 21:
          v7 = CFSTR("season");
          break;
        case 23:
          goto LABEL_68;
        case 24:
          v7 = CFSTR("recentHighlights");
          break;
        case 25:
          v7 = CFSTR("childActivity");
          break;
        case 26:
          v7 = CFSTR("excitingMoments");
          break;
        case 27:
          v7 = CFSTR("trends");
          break;
        case 28:
          v7 = CFSTR("petOutdoor");
          break;
        case 29:
          v7 = CFSTR("childAndPerson");
          break;
        default:
          if (v6 == 202)
          {
LABEL_68:
            v7 = CFSTR("dayInHistory");
          }
          else
          {
            if (v6 != 216)
              goto LABEL_6;
            v7 = CFSTR("lastSeason");
          }
          break;
      }
    }
    else
    {
      v6 = 0;
LABEL_6:
      v7 = CFSTR("default");
    }
    v87 = v6;
    v8 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
    v9 = self->_log;
    v10 = v9;
    v90 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
    {
      v11 = -[PXDisplayAssetFetchResult count](self->_displayAssets, "count");
      *(_DWORD *)buf = 134218242;
      v101 = v11;
      v102 = 2114;
      v103 = (uint64_t)v7;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryAutoEditMomentsClustering", "count: %ld, category: %{public}@", buf, 0x16u);
    }

    -[PFStoryAutoEditConfiguration clusteringPropertiesForMemoryCategoryName:](self->_configuration, "clusteringPropertiesForMemoryCategoryName:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryAutoEditMomentsProvider clusteringProperties](self, "clusteringProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = v5;
    v92 = v7;
    spid = v8;
    if (v13)
    {
      -[PXStoryAutoEditMomentsProvider clusteringProperties](self, "clusteringProperties");
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    v15 = self->_displayAssets;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[PXDisplayAssetFetchResult count](v15, "count"));
    if (-[PXDisplayAssetFetchResult count](v15, "count") >= 1)
    {
      v17 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

        ++v17;
      }
      while (-[PXDisplayAssetFetchResult count](v15, "count") > v17);
    }
    -[PXStoryAutoEditMomentsProvider _locationsByAssetUUIDWithAssets:](self, "_locationsByAssetUUIDWithAssets:", v15);
    v19 = objc_claimAutoreleasedReturnValue();
    v93 = self;
    -[PXStoryAutoEditMomentsProvider _faceprintsByAssetUUIDWithAssets:](self, "_faceprintsByAssetUUIDWithAssets:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = [PXStoryMemoryMomentConcreteClusteringDistanceCalculator alloc];
    objc_msgSend(v12, "distanceWeights");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v20;
    v89 = (void *)v19;
    v99 = -[PXStoryMemoryMomentConcreteClusteringDistanceCalculator initWithWeights:locationsByAssetUUID:faceprintsByAssetUUID:](v21, "initWithWeights:locationsByAssetUUID:faceprintsByAssetUUID:", v22, v19, v20);

    objc_msgSend(v12, "algorithm");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = objc_opt_class();
    v114[1] = objc_opt_class();
    v114[2] = objc_opt_class();
    v114[3] = objc_opt_class();
    v114[4] = objc_opt_class();
    v114[5] = objc_opt_class();
    v114[6] = objc_opt_class();
    v114[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = v24;
    v98 = v15;
    if (objc_msgSend(v26, "count"))
    {
      v27 = v16;
      v28 = 0;
      while (1)
      {
        v29 = (objc_class *)objc_msgSend(v26, "objectAtIndexedSubscript:", v28);
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v25, "isEqualToString:", v30);

        if (v31)
          break;
        if (objc_msgSend(v26, "count") <= (unint64_t)++v28)
        {
          v32 = 0;
          goto LABEL_22;
        }
      }
      v32 = objc_retainAutorelease(v29);
LABEL_22:
      v15 = v98;
      v16 = v27;
    }
    else
    {
      v32 = 0;
    }

    if (-[PXDisplayAssetFetchResult count](v15, "count") > 1000)
    {
      v32 = (objc_class *)objc_opt_class();
      PLStoryGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = -[PXDisplayAssetFetchResult count](v15, "count");
        objc_msgSend(v12, "algorithm");
        v35 = v32;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "algorithm");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v101 = v34;
        v102 = 2112;
        v103 = (uint64_t)v36;
        v104 = 2112;
        v105 = (unint64_t)v37;
        _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_INFO, "Moments clustering has %ld assets, using algorithm %@ instead of %@", buf, 0x20u);

        v32 = v35;
      }

    }
    v95 = v12;
    aClass = v32;
    if (v32)
    {
      -[PXStoryMemoryMomentConcreteClusteringDistanceCalculator densityClusteringDistanceBlockForAssets:](v99, "densityClusteringDistanceBlockForAssets:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend([v32 alloc], "initWithDistanceBlock:", v38);
      objc_msgSend(v12, "algorithmProperties");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setValuesForKeysWithDictionary:", v40);

      objc_msgSend(v39, "performWithDataset:progressBlock:", v16, &__block_literal_global_85166);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v91 = v16;
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v41, "count"));
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[PXDisplayAssetFetchResult count](v15, "count"));
    if (-[PXDisplayAssetFetchResult count](v15, "count") >= 1)
    {
      v43 = 0;
      do
      {
        objc_msgSend(v42, "addObject:", &unk_1E53ECB58);
        ++v43;
      }
      while (v43 < -[PXDisplayAssetFetchResult count](v15, "count"));
    }
    v97 = v41;
    if (objc_msgSend(v41, "count"))
    {
      v44 = 0;
      do
      {
        objc_msgSend(v41, "objectAtIndexedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objects");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v46, "count"))
        {
          v47 = 0;
          do
          {
            objc_msgSend(v46, "objectAtIndexedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "integerValue");

            objc_msgSend(v42, "objectAtIndexedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "isEqual:", &unk_1E53ECB58);

            if ((v51 & 1) == 0)
            {
              PLStoryGetLog();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v42, "objectAtIndexedSubscript:", v49);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "integerValue");
                *(_DWORD *)buf = 134218496;
                v101 = v49;
                v102 = 2048;
                v103 = v54;
                v104 = 2048;
                v105 = v44;
                _os_log_impl(&dword_1A6789000, v52, OS_LOG_TYPE_INFO, "Moments clustering reused asset %lu in multiple clusters, cluster %ld and %lu", buf, 0x20u);

              }
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v44);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:atIndexedSubscript:", v55, v49);

            ++v47;
          }
          while (v47 < objc_msgSend(v46, "count"));
        }

        ++v44;
        v41 = v97;
      }
      while (v44 < objc_msgSend(v97, "count"));
    }
    v56 = 0;
    if (objc_msgSend(v42, "count"))
    {
      v57 = 0;
      v58 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v59 = v57;
        objc_msgSend(v42, "objectAtIndexedSubscript:", v57);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "integerValue");

        v62 = v59 + 1;
        do
        {
          v57 = v62;
          if (v62 >= objc_msgSend(v42, "count"))
            break;
          objc_msgSend(v42, "objectAtIndexedSubscript:", v57);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "integerValue");

          v62 = v57 + 1;
        }
        while (v61 == v64);
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v59, v57 - v59);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v98;
        v67 = -[PXStoryMemoryMoment initWithDisplayAssets:indexSet:diagnosticDistanceCalculator:]([PXStoryMemoryMoment alloc], "initWithDisplayAssets:indexSet:diagnosticDistanceCalculator:", v98, v65, v99);
        v68 = -[PXStoryMemoryMoment count](v67, "count");
        if (v58 >= v68)
          v58 = v68;
        v69 = -[PXStoryMemoryMoment count](v67, "count");
        if (v56 <= v69)
          v56 = v69;
        objc_msgSend(v96, "addObject:", v67);

      }
      while (v57 < objc_msgSend(v42, "count"));
    }
    else
    {
      v58 = 0x7FFFFFFFFFFFFFFFLL;
      v66 = v98;
    }
    v70 = (double)-[PXDisplayAssetFetchResult count](v66, "count");
    v71 = v70 / (double)(unint64_t)objc_msgSend(v96, "count");
    PLStoryGetLog();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v94, "localizedTitle");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v87);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v96, "count");
      *(_DWORD *)buf = 138413826;
      v101 = (uint64_t)v73;
      v102 = 2112;
      v103 = (uint64_t)v74;
      v104 = 2112;
      v105 = (unint64_t)v92;
      v106 = 2048;
      v107 = v75;
      v108 = 2048;
      v109 = *(double *)&v58;
      v110 = 2048;
      v111 = v56;
      v112 = 2048;
      v113 = v71;
      _os_log_impl(&dword_1A6789000, v72, OS_LOG_TYPE_DEFAULT, "clustering collection '%@' with category '%@' (%@) has %ld moments (min: %ld, max: %ld, avg: %.2f)", buf, 0x48u);

    }
    v76 = objc_msgSend(v96, "copy");
    moments = v93->_moments;
    v93->_moments = (NSArray *)v76;

    -[PXStoryAutoEditConcreteMomentsStatistics setMinimumAssetCount:](v93->_statistics, "setMinimumAssetCount:", v58);
    -[PXStoryAutoEditConcreteMomentsStatistics setMaximumAssetCount:](v93->_statistics, "setMaximumAssetCount:", v56);
    -[PXStoryAutoEditConcreteMomentsStatistics setAverageAssetCount:](v93->_statistics, "setAverageAssetCount:", v71);
    -[PXStoryAutoEditConcreteMomentsStatistics setMemoryCategoryName:](v93->_statistics, "setMemoryCategoryName:", v92);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PXStoryAutoEditConcreteMomentsStatistics setClusteringDuration:](v93->_statistics, "setClusteringDuration:", v78 - v4);
    -[PXStoryAutoEditConcreteMomentsStatistics setClusteringProperties:](v93->_statistics, "setClusteringProperties:", v95);
    -[PXStoryAutoEditConcreteMomentsStatistics setClusteringDistanceCalculator:](v93->_statistics, "setClusteringDistanceCalculator:", v99);
    v79 = v93->_log;
    v80 = v79;
    if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      NSStringFromClass(aClass);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v96, "count");
      *(_DWORD *)buf = 138544386;
      v101 = (uint64_t)v81;
      v102 = 2048;
      v103 = v82;
      v104 = 2048;
      v105 = v58;
      v106 = 2048;
      v107 = v56;
      v108 = 2048;
      v109 = v71;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v80, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditMomentsClustering", "alg: %{public}@, moments: %ld (min: %ld, max: %ld, avg: %.2f)", buf, 0x34u);

    }
    PLStoryGetLog();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      -[PXStoryAutoEditConcreteMomentsStatistics clusteringDuration](v93->_statistics, "clusteringDuration");
      *(_DWORD *)buf = 134217984;
      v101 = v84;
      _os_log_impl(&dword_1A6789000, v83, OS_LOG_TYPE_DEFAULT, "clustering finished in %.3fs", buf, 0xCu);
    }

  }
}

- (NSArray)moments
{
  PXStoryAutoEditMomentsProvider *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_moments)
    -[PXStoryAutoEditMomentsProvider _computeClustering](v2, "_computeClustering");
  objc_sync_exit(v2);

  return v2->_moments;
}

- (void)enumerateMomentsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXStoryAutoEditMomentsProvider moments](self, "moments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PXStoryAutoEditMomentsProvider_enumerateMomentsUsingBlock___block_invoke;
  v7[3] = &unk_1E5123780;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PXStoryAutoEditMomentsProvider moments](self, "moments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (PXStoryAutoEditMomentsStatistics)statistics
{
  return (PXStoryAutoEditMomentsStatistics *)self->_statistics;
}

- (id)momentForDisplayAssetIndex:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v16;
  void *v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXStoryAutoEditMomentsProvider moments](self, "moments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "firstGlobalIndex") > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditMomentsProvider.m"), 591, CFSTR("Invalid asset index: %lu"), a3);

  }
  if (objc_msgSend(v7, "lastGlobalIndex") >= a3)
  {
    v12 = v7;
  }
  else
  {
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "lastGlobalIndex") < a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAutoEditMomentsProvider.m"), 597, CFSTR("Invalid asset index: %lu"), a3);

    }
    if (objc_msgSend(v8, "firstGlobalIndex") <= a3)
    {
      v13 = v8;
    }
    else
    {
      v9 = objc_msgSend(v6, "count") - 1;
      if (v9 >= 2)
      {
        v10 = 0;
        while (1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", (v9 + v10) >> 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "firstGlobalIndex") <= a3)
          {
            if (objc_msgSend(v11, "lastGlobalIndex") >= a3)
            {

              v10 = (v9 + v10) >> 1;
              goto LABEL_23;
            }
            v10 = (v9 + v10) >> 1;
          }
          else
          {
            v9 = (v9 + v10) >> 1;
          }

          if (v10 + 1 >= v9)
            goto LABEL_18;
        }
      }
      v10 = 0;
LABEL_18:
      if (v10 != v9)
      {
        PXAssertGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v19 = a3;
          _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Could not find moment for asset index %lu", buf, 0xCu);
        }

      }
LABEL_23:
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v13;

  }
  return v12;
}

- (id)_diagnosticSwiftCodeForMomentsUnitTest
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  uint64_t i;
  void *v62;
  double v63;
  CLLocationDegrees v64;
  void *v65;
  CLLocationDegrees v66;
  CLLocationCoordinate2D v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v73;
  unint64_t v74;
  PXStoryAutoEditMomentsProvider *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v74 = -[PXStoryAutoEditMomentsProvider count](self, "count");
  v4 = -[PXDisplayAssetFetchResult count](self->_displayAssets, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAutoEditMomentsProvider _faceprintDatasByAssetUUIDWithAssets:](self, "_faceprintDatasByAssetUUIDWithAssets:", self->_displayAssets);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAutoEditMomentsProvider _locationsByAssetUUIDWithAssets:](self, "_locationsByAssetUUIDWithAssets:", self->_displayAssets);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v5;
  if (-[PXDisplayAssetFetchResult count](self->_displayAssets, "count"))
  {
    v6 = 0;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    v75 = self;
    do
    {
      -[PXDisplayAssetFetchResult objectAtIndex:](self->_displayAssets, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = v10;
      if (v10)
      {
        objc_msgSend(v10, "coordinate");
        v12 = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v13);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addObject:", v14);

      }
      else
      {
        objc_msgSend(v82, "addObject:", &unk_1E53EF970);
        objc_msgSend(v81, "addObject:", &unk_1E53EF970);
      }
      objc_msgSend(v8, "creationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "addObject:", v15);
      objc_msgSend(v8, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = v7;
      if (v17)
        v20 = (void *)v17;
      else
        v20 = v7;
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        v23 = 0;
        do
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "base64EncodedStringWithOptions:", 34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v22, "addObject:", v25);

          ++v23;
        }
        while (v23 < objc_msgSend(v21, "count"));
      }
      v7 = v19;
      if (v22)
        v26 = v22;
      else
        v26 = v19;
      v5 = v80;
      objc_msgSend(v80, "addObject:", v26);

      ++v6;
      self = v75;
    }
    while (v6 < -[PXDisplayAssetFetchResult count](v75->_displayAssets, "count"));
  }
  -[PXStoryAutoEditMomentsProvider statistics](self, "statistics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    func testFromTTR() throws {\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let dictionary: [AnyHashable : Any] = [\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("            \"version\" : PFStoryAutoEditConfiguration.currentVersion,\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("            \"memoryCategories\" : [\n"));
  objc_msgSend(v27, "memoryCategoryName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                \"%@\" : [\n"), v28);

  objc_msgSend(v3, "appendFormat:", CFSTR("                    \"clustering\" : [\n"));
  objc_msgSend(v27, "clusteringProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "algorithm");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                        \"algorithm\" : \"%@\",\n"), v30);

  objc_msgSend(v3, "appendFormat:", CFSTR("                        \"algorithmProperties\" : [\n"));
  objc_msgSend(v27, "clusteringProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "algorithmProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("minimumNumberOfObjects"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = &unk_1E53ECB70;
  objc_msgSend(v3, "appendFormat:", CFSTR("                            \"minimumNumberOfObjects\" : %@,\n"), v35);

  objc_msgSend(v27, "clusteringProperties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "algorithmProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("maximumDistance"));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v38)
    v40 = (void *)v38;
  else
    v40 = &unk_1E53ECB70;
  objc_msgSend(v3, "appendFormat:", CFSTR("                            \"maximumDistance\" : %@\n"), v40);

  objc_msgSend(v3, "appendFormat:", CFSTR("                        ],\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("                        \"distanceWeights\" : [\n"));
  objc_msgSend(v27, "clusteringProperties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "distanceWeights");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("time"));
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = (void *)v43;
  else
    v45 = &unk_1E53ECB88;
  objc_msgSend(v3, "appendFormat:", CFSTR("                            \"time\" : %@,\n"), v45);

  objc_msgSend(v27, "clusteringProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "distanceWeights");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("location"));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = (void *)v48;
  else
    v50 = &unk_1E53ECB88;
  objc_msgSend(v3, "appendFormat:", CFSTR("                            \"location\" : %@,\n"), v50);

  v79 = v27;
  objc_msgSend(v27, "clusteringProperties");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "distanceWeights");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("face"));
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v53)
    v55 = (void *)v53;
  else
    v55 = &unk_1E53ECB88;
  objc_msgSend(v3, "appendFormat:", CFSTR("                            \"face\" : %@,\n"), v55);

  objc_msgSend(v3, "appendFormat:", CFSTR("                        ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("                    ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("                ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("            ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let config = PFStoryAutoEditConfiguration(configurationDictionary: dictionary)\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        XCTAssertNotNil(config)\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let faceStrings : [[String]] = ["));
  if (objc_msgSend(v5, "count"))
  {
    v56 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("[\n            "));
      if (objc_msgSend(v57, "count"))
      {
        v58 = 0;
        do
        {
          objc_msgSend(v3, "appendString:", CFSTR("\"\"\"\n            "));
          objc_msgSend(v57, "objectAtIndexedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n            "));
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "appendString:", v60);
          objc_msgSend(v3, "appendString:", CFSTR("\n            \"\"\","));

          ++v58;
        }
        while (v58 < objc_msgSend(v57, "count"));
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("],"));

      ++v56;
      v5 = v80;
    }
    while (v56 < objc_msgSend(v80, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("        ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let assets : [PXDisplayAsset] = [\n"));
  if (v73)
  {
    for (i = 0; i != v73; ++i)
    {
      objc_msgSend(v82, "objectAtIndexedSubscript:", i);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "doubleValue");
      v64 = v63;
      objc_msgSend(v81, "objectAtIndexedSubscript:", i);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "doubleValue");
      v67 = CLLocationCoordinate2DMake(v64, v66);

      objc_msgSend(v83, "objectAtIndex:", i);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "timeIntervalSince1970");
      objc_msgSend(v3, "appendFormat:", CFSTR("            PXSyntheticPHAsset(date: Date(timeIntervalSince1970:%f), location: CLLocationCoordinate2D(latitude: %f, longitude: %f), faceStrings: faceStrings[%lu]), "), v69, *(_QWORD *)&v67.latitude, *(_QWORD *)&v67.longitude, i);
      objc_msgSend(v68, "description");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("// %@ "), v70);

      if (!CLLocationCoordinate2DIsValid(v67))
        objc_msgSend(v3, "appendFormat:", CFSTR("// Invalid location information"));
      objc_msgSend(v3, "appendFormat:", CFSTR("\n"));

    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("        ]\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let assetCollection = MockPHAssetCollection() { collection in\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("            collection.testAssetCollectionType = .memory\n"));
  objc_msgSend(v79, "memoryCategoryName");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("            collection.testCategory = .%@\n"), v71);

  objc_msgSend(v3, "appendFormat:", CFSTR("        }\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let displayAssets = PXDisplayAssetFetchResultFromArray(assets)\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let provider = PXStoryAutoEditMomentsProvider(configuration: config!, assetCollection: assetCollection, displayAssets:displayAssets)\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let momentCount = provider.count\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        let stats = provider.statistics\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        XCTAssert(momentCount == %ld)\n"), v74);
  objc_msgSend(v3, "appendFormat:", CFSTR("        XCTAssertLessThan(stats.clusteringDuration, 0.2)\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    }\n\n"));

  return v3;
}

- (PFStoryClusteringProperties)clusteringProperties
{
  return self->_clusteringProperties;
}

- (void)setClusteringProperties:(id)a3
{
  objc_storeStrong((id *)&self->_clusteringProperties, a3);
}

- (NSError)error
{
  return self->_error;
}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (void)setDisplayAssets:(id)a3
{
  objc_storeStrong((id *)&self->_displayAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clusteringProperties, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

uint64_t __61__PXStoryAutoEditMomentsProvider_enumerateMomentsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PXStoryAutoEditMomentsProvider__faceprintDatasByAssetUUIDWithAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CD1390], "uuidFromLocalIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "faceClusteringProperties", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "faceprint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "faceprintData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

@end
