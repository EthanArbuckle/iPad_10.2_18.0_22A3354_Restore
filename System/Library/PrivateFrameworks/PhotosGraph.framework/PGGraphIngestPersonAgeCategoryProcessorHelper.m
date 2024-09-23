@implementation PGGraphIngestPersonAgeCategoryProcessorHelper

- (PGGraphIngestPersonAgeCategoryProcessorHelper)init
{
  PGGraphIngestPersonAgeCategoryProcessorHelper *v2;
  uint64_t v3;
  CLSSceneConfidenceThresholdHelper *babyScenesHelper;
  uint64_t v5;
  CLSSceneConfidenceThresholdHelper *childScenesHelper;
  uint64_t v7;
  CLSSceneConfidenceThresholdHelper *teenScenesHelper;
  uint64_t v9;
  CLSSceneConfidenceThresholdHelper *adultScenesHelper;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGGraphIngestPersonAgeCategoryProcessorHelper;
  v2 = -[PGGraphIngestPersonAgeCategoryProcessorHelper init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA138, 1);
    babyScenesHelper = v2->_babyScenesHelper;
    v2->_babyScenesHelper = (CLSSceneConfidenceThresholdHelper *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA150, 1);
    childScenesHelper = v2->_childScenesHelper;
    v2->_childScenesHelper = (CLSSceneConfidenceThresholdHelper *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA168, 1);
    teenScenesHelper = v2->_teenScenesHelper;
    v2->_teenScenesHelper = (CLSSceneConfidenceThresholdHelper *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA180, 1);
    adultScenesHelper = v2->_adultScenesHelper;
    v2->_adultScenesHelper = (CLSSceneConfidenceThresholdHelper *)v9;

  }
  return v2;
}

- (unint64_t)ageCategoryUsingFaceAttributesForPersonNode:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  unint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    +[PGGraphIngestFaceAttributeConveniences sampledAssetsWithSingleFaceForPersonLocalIdentifier:photoLibrary:numberOfYearsBack:sampleSize:fetchPropertySets:](PGGraphIngestFaceAttributeConveniences, "sampledAssetsWithSingleFaceForPersonLocalIdentifier:photoLibrary:numberOfYearsBack:sampleSize:fetchPropertySets:", v8, v7, 5, 200, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if ((unint64_t)objc_msgSend(v9, "count") >= 5)
    {
      objc_msgSend(v7, "librarySpecificFetchOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0CD1B88];
      v33[0] = *MEMORY[0x1E0CD1B78];
      v33[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFetchPropertySets:", v13);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ageType != %lu"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInternalPredicate:", v14);

      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAssets:options:", v9, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if ((unint64_t)objc_msgSend(v16, "count") >= 5)
      {
        v26 = v11;
        v27 = v7;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v25 = v16;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v29 != v20)
                objc_enumerationMutation(v17);
              v22 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromPHFaceAgeType:](self, "ageCategoryFromPHFaceAgeType:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "ageType"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v23);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v19);
        }

        v10 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryForPersonNode:ageCategoryCountedSet:](self, "ageCategoryForPersonNode:ageCategoryCountedSet:", v6, v15);
        v7 = v27;
        v16 = v25;
        v11 = v26;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)ageCategoryForPersonNode:(id)a3 ageCategoryCountedSet:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __int128 v25;
  double v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  __int128 v40;
  PGGraphIngestPersonAgeCategoryProcessorHelper *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(&unk_1E84EA198, "count"))
    goto LABEL_7;
  v8 = 0;
  v9 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    objc_msgSend(&unk_1E84EA198, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "countForObject:", v11);
    if (v12 >= v8 && v12 > 4)
    {
      v8 = v12;
      v10 = v9;
    }

    ++v9;
  }
  while (v9 < objc_msgSend(&unk_1E84EA198, "count"));
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "stringDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v43 = v15;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ has no age bracket that hits minimum criteria", buf, 0xCu);

    }
LABEL_22:
    v38 = 0;
    goto LABEL_23;
  }
  objc_msgSend(&unk_1E84EA198, "objectAtIndexedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");

  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "loggingConnection");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "stringDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestPersonAgeCategoryProcessorHelper ageDescriptionFromAge:](self, "ageDescriptionFromAge:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v43 = v20;
    v44 = 2112;
    v45 = v21;
    v46 = 2048;
    v47 = v8;
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ most represented age bracket is %@ (%lu faces)", buf, 0x20u);

  }
  v41 = self;

  v22 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithObject:", v23);
  v14 = objc_claimAutoreleasedReturnValue();

  v24 = v10 + 1;
  if (v24 < objc_msgSend(&unk_1E84EA198, "count"))
  {
    v26 = (double)v8;
    *(_QWORD *)&v25 = 138478339;
    v40 = v25;
    while (1)
    {
      objc_msgSend(&unk_1E84EA198, "objectAtIndexedSubscript:", v24, v40);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v7, "countForObject:", v27);
      if (v28 < 5)
        break;
      v29 = v28;
      if ((double)v28 / v26 < 0.3)
        break;
      objc_msgSend(&unk_1E84EA198, "objectAtIndexedSubscript:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v14, "addObject:", v32);

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggingConnection");
      v34 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "stringDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraphIngestPersonAgeCategoryProcessorHelper ageDescriptionFromAge:](v41, "ageDescriptionFromAge:", v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v40;
        v43 = v35;
        v44 = 2112;
        v45 = v36;
        v46 = 2048;
        v47 = v29;
        _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ possible age bracket %@ (%lu faces)", buf, 0x20u);

      }
      if (++v24 >= objc_msgSend(&unk_1E84EA198, "count"))
        goto LABEL_20;
    }

  }
LABEL_20:
  if (!-[NSObject count](v14, "count"))
    goto LABEL_22;
  -[NSObject lastObject](v14, "lastObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "unsignedIntValue");

LABEL_23:
  return v38;
}

- (unint64_t)ageCategoryFromPHFaceAgeType:(unsigned __int16)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return qword_1CA8ECD88[(unsigned __int16)(a3 - 1)];
}

- (unint64_t)ageCategoryFromBirthdayDateComponents:(id)a3 currentDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "year");
  v8 = 0;
  if (v5 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v9);
    if (v10 >= 94672800.0)
    {
      if (v10 >= 410248800.0)
      {
        if (v10 >= 978285600.0)
        {
          if (v10 >= 1925013600.0)
            v8 = 5;
          else
            v8 = 4;
        }
        else
        {
          v8 = 3;
        }
      }
      else
      {
        v8 = 2;
      }
    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (unint64_t)ageCategoryFromBirthdayDateForPersonNode:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "birthdayDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromBirthdayDateComponents:currentDate:](self, "ageCategoryFromBirthdayDateComponents:currentDate:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)confidenceThresholdByBabySceneIdentifierWithCurationModel:(id)a3
{
  return (id)-[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_babyScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", a3);
}

- (id)confidenceThresholdByChildSceneIdentifierWithCurationModel:(id)a3
{
  return (id)-[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_childScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", a3);
}

- (id)confidenceThresholdByTeenSceneIdentifierWithCurationModel:(id)a3
{
  return (id)-[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_teenScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", a3);
}

- (id)confidenceThresholdByAdultSceneIdentifierWithCurationModel:(id)a3
{
  return (id)-[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_adultScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", a3);
}

- (unint64_t)ageCategoryFromAssetSamplingScenesForPersonNode:(id)a3 photoLibrary:(id)a4 curationSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  PGGraphIngestPersonAgeCategoryProcessorHelper *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  unint64_t v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v12 = *MEMORY[0x1E0CD19F0];
    v46[0] = *MEMORY[0x1E0CD1A50];
    v46[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphIngestFaceAttributeConveniences sampledAssetsWithSingleFaceForPersonLocalIdentifier:photoLibrary:numberOfYearsBack:sampleSize:fetchPropertySets:](PGGraphIngestFaceAttributeConveniences, "sampledAssetsWithSingleFaceForPersonLocalIdentifier:photoLibrary:numberOfYearsBack:sampleSize:fetchPropertySets:", v11, v9, 100, 200, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "count");
    if (v15 < 5)
    {
      v30 = v15;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "stringDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v42 = v32;
        v43 = 2048;
        v44 = v30;
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ has not enough singleton face assets: %lu", buf, 0x16u);

      }
      v29 = 0;
    }
    else
    {
      v34 = self;
      v36 = v9;
      v16 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v14, "fetchedObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

      v35 = v10;
      objc_msgSend(v10, "prepareAssets:", v18);
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v20 = v18;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v38 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v25, "curationModel");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "localIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v27);

          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v22);
      }

      objc_msgSend(MEMORY[0x1E0CD1750], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromScenesByAssetLocalIdentifier:curationModelByAssetLocalIdentifier:personNode:](v34, "ageCategoryFromScenesByAssetLocalIdentifier:curationModelByAssetLocalIdentifier:personNode:", v28, v19, v8);

      v10 = v35;
      v9 = v36;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (unint64_t)ageCategoryFromScenesByAssetLocalIdentifier:(id)a3 curationModelByAssetLocalIdentifier:(id)a4 personNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v24[4];
  id v25;
  PGGraphIngestPersonAgeCategoryProcessorHelper *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __140__PGGraphIngestPersonAgeCategoryProcessorHelper_ageCategoryFromScenesByAssetLocalIdentifier_curationModelByAssetLocalIdentifier_personNode___block_invoke;
  v24[3] = &unk_1E842E8E8;
  v11 = v9;
  v25 = v11;
  v26 = self;
  v27 = &v38;
  v28 = &v34;
  v29 = &v30;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);
  v12 = objc_msgSend(v8, "count");
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "stringDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v39[3];
    v17 = v35[3];
    v18 = v31[3];
    *(_DWORD *)buf = 138478851;
    v43 = v15;
    v44 = 2048;
    v45 = v16;
    v46 = 2048;
    v47 = v17;
    v48 = 2048;
    v49 = v18;
    v50 = 2048;
    v51 = v12;
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ - (baby: %lu, child: %lu, teen: %lu, total: %lu)", buf, 0x34u);

  }
  v19 = v39[3];
  v20 = (double)v12;
  if ((double)v19 / (double)v12 >= 0.6)
  {
    v22 = 1;
  }
  else
  {
    v21 = v35[3] + v19;
    if ((double)v21 / v20 >= 0.6)
    {
      v22 = 2;
    }
    else if ((double)(v31[3] + v21) / v20 >= 0.6)
    {
      v22 = 3;
    }
    else
    {
      v22 = 0;
    }
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

- (id)ageDescriptionFromAge:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("AgeCategoryUnspecified");
  else
    return off_1E842E908[a3];
}

- (unsigned)ageTypeFromAgeCategory:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return word_1CA8ECDB0[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adultScenesHelper, 0);
  objc_storeStrong((id *)&self->_teenScenesHelper, 0);
  objc_storeStrong((id *)&self->_childScenesHelper, 0);
  objc_storeStrong((id *)&self->_babyScenesHelper, 0);
}

void __140__PGGraphIngestPersonAgeCategoryProcessorHelper_ageCategoryFromScenesByAssetLocalIdentifier_curationModelByAssetLocalIdentifier_personNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
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
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  _QWORD *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "confidenceThresholdBySceneIdentifierWithCurationModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "confidenceThresholdBySceneIdentifierWithCurationModel:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "confidenceThresholdBySceneIdentifierWithCurationModel:", v7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "confidenceThresholdBySceneIdentifierWithCurationModel:", v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v11)
  {
    v12 = v11;
    v38 = (_QWORD *)a1;
    v39 = v7;
    v40 = v5;
    v41 = 0;
    v13 = *(_QWORD *)v49;
    v42 = 0;
    v43 = *(_QWORD *)v49;
    do
    {
      v14 = 0;
      v46 = v12;
      do
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "extendedSceneIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && (objc_msgSend(v15, "confidence"), v20 = v19, objc_msgSend(v18, "doubleValue"), v20 >= v21))
        {
          BYTE4(v42) = 1;
        }
        else
        {
          v47 = v16;
          objc_msgSend(v9, "objectForKeyedSubscript:", v17, v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 && (objc_msgSend(v15, "confidence"), v24 = v23, objc_msgSend(v22, "doubleValue"), v24 >= v25))
          {
            LOBYTE(v42) = 1;
          }
          else
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", v17);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 && (objc_msgSend(v15, "confidence"), v28 = v27, objc_msgSend(v26, "doubleValue"), v28 >= v29))
            {
              BYTE4(v41) = 1;
            }
            else
            {
              v30 = v10;
              v31 = v9;
              v32 = v8;
              objc_msgSend(v44, "objectForKeyedSubscript:", v17);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                objc_msgSend(v15, "confidence");
                v35 = v34;
                objc_msgSend(v33, "doubleValue");
                if (v35 >= v36)
                  LOBYTE(v41) = 1;
              }

              v8 = v32;
              v9 = v31;
              v10 = v30;
              v13 = v43;
            }

            v12 = v46;
          }

          v16 = v47;
        }

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v12);

    v7 = v39;
    v5 = v40;
    if ((v41 & 1) == 0)
    {
      if ((v42 & 0x100000000) != 0)
      {
        v37 = v38[6];
LABEL_31:
        ++*(_QWORD *)(*(_QWORD *)(v37 + 8) + 24);
        goto LABEL_32;
      }
      if ((v42 & 1) != 0)
      {
        v37 = v38[7];
        goto LABEL_31;
      }
      if ((v41 & 0x100000000) != 0)
      {
        v37 = v38[8];
        goto LABEL_31;
      }
    }
  }
  else
  {

  }
LABEL_32:

}

@end
