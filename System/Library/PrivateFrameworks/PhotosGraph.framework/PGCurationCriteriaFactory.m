@implementation PGCurationCriteriaFactory

- (PGCurationCriteriaFactory)init
{
  PGCurationCriteriaFactory *v2;
  uint64_t v3;
  CLSSceneTaxonomyHierarchy *sceneTaxonomy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGCurationCriteriaFactory;
  v2 = -[PGCurationCriteriaFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
    sceneTaxonomy = v2->_sceneTaxonomy;
    v2->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v3;

  }
  return v2;
}

- (id)holidayServiceWithGraph:(id)a3
{
  id v4;
  PGCurationCriteriaFactory *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "infoNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](v5->_holidayServiceByLocale, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B180]), "initWithLocale:", v7);

  objc_sync_exit(v5);
  return v8;
}

- (id)curationCriteriaWithMeaningLabel:(id)a3 featureNodes:(id)a4 inGraph:(id)a5 client:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  void *v24;
  PGCurationSetTrait *v25;
  void *v26;
  void *v27;
  PGCurationSetTrait *v28;
  __int16 v30;
  uint8_t buf[2];
  __int16 v32;
  __int16 v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Wedding")))
  {
    -[PGCurationCriteriaFactory _weddingCriteriaWithClient:](self, "_weddingCriteriaWithClient:", a6);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Birthday")))
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Anniversary")))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("HolidayEvent")))
      {
        -[PGCurationCriteriaFactory _holidayEventCriteriaWithGraph:featureNodes:client:](self, "_holidayEventCriteriaWithGraph:featureNodes:client:", v12, v11, a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Entertainment")) & 1) != 0
             || objc_msgSend(v10, "isEqualToString:", CFSTR("AmusementPark")))
      {
        -[PGCurationCriteriaFactory _entertainmentCriteriaWithClient:](self, "_entertainmentCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Concert")))
      {
        -[PGCurationCriteriaFactory _concertCriteriaWithClient:](self, "_concertCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Festival")))
      {
        -[PGCurationCriteriaFactory _festivalCriteriaWithClient:](self, "_festivalCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("SportEvent")))
      {
        -[PGCurationCriteriaFactory _sportEventCriteriaWithClient:](self, "_sportEventCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("NightOut")))
      {
        -[PGCurationCriteriaFactory _nightOutCriteriaWithClient:](self, "_nightOutCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Performance")))
      {
        -[PGCurationCriteriaFactory _performanceCriteriaWithClient:](self, "_performanceCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Museum")))
      {
        -[PGCurationCriteriaFactory _museumCriteriaWithClient:](self, "_museumCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Diving")))
      {
        -[PGCurationCriteriaFactory _divingCriteriaWithClient:](self, "_divingCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Hiking")))
      {
        -[PGCurationCriteriaFactory _hikingCriteriaWithClient:](self, "_hikingCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("WinterSport")))
      {
        -[PGCurationCriteriaFactory _winterSportCriteriaWithClient:](self, "_winterSportCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Beaching")))
      {
        -[PGCurationCriteriaFactory _beachingCriteriaWithClient:](self, "_beachingCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Climbing")))
      {
        -[PGCurationCriteriaFactory _climbingCriteriaWithClient:](self, "_climbingCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Breakfast")))
      {
        -[PGCurationCriteriaFactory _breakfastCriteriaWithClient:](self, "_breakfastCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Lunch")))
      {
        -[PGCurationCriteriaFactory _lunchCriteriaWithClient:](self, "_lunchCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Dinner")))
        {
          v14 = 0;
          if (!v11)
            goto LABEL_31;
          goto LABEL_28;
        }
        -[PGCurationCriteriaFactory _dinnerCriteriaWithClient:](self, "_dinnerCriteriaWithClient:", a6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
LABEL_3:
      v14 = (void *)v13;
      if (!v11)
        goto LABEL_31;
      goto LABEL_28;
    }
    if (v11)
    {
      +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "localIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "anyObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGCurationCriteriaFactory _anniversaryCriteriaWithPersonLocalIdentifier:client:](self, "_anniversaryCriteriaWithPersonLocalIdentifier:client:", v17, a6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v21 = MEMORY[0x1E0C81028];
        v22 = "Asking for Anniversary meaning criteria with no associated featured person";
        v23 = buf;
        goto LABEL_43;
      }
LABEL_26:
      v14 = 0;
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = 0;
      v18 = MEMORY[0x1E0C81028];
      v19 = "Asking for Anniversary meaning criteria with no associated feature node";
      v20 = (uint8_t *)&v30;
      goto LABEL_39;
    }
LABEL_24:
    v14 = 0;
    goto LABEL_31;
  }
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v32 = 0;
      v18 = MEMORY[0x1E0C81028];
      v19 = "Asking for Birthday meaning criteria with no associated feature node";
      v20 = (uint8_t *)&v32;
LABEL_39:
      _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v33 = 0;
      v21 = MEMORY[0x1E0C81028];
      v22 = "Asking for Birthday meaning criteria with no associated featured person";
      v23 = (uint8_t *)&v33;
LABEL_43:
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, v22, v23, 2u);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  objc_msgSend(v15, "localIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteriaFactory _birthdayCriteriaWithPersonLocalIdentifiers:client:](self, "_birthdayCriteriaWithPersonLocalIdentifiers:client:", v16, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_27:
LABEL_28:
  +[PGGraphNodeCollection subsetInCollection:](PGGraphSocialGroupNodeCollection, "subsetInCollection:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v25 = [PGCurationSetTrait alloc];
    objc_msgSend(v24, "memberNodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PGCurationSetTrait initWithItems:](v25, "initWithItems:", v27);
    objc_msgSend(v14, "setSocialGroupTrait:", v28);

  }
LABEL_31:

  return v14;
}

- (id)curationCriteriaWithCollection:(id)a3 meaningLabel:(id)a4 inGraph:(id)a5 client:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Birthday")))
  {
    objc_msgSend(v10, "birthdayPersonNodes");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("Anniversary")))
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v10, "anniversaryPersonNodes");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_7:
  objc_msgSend(v14, "featureNodeCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteriaFactory curationCriteriaWithMeaningLabel:featureNodes:inGraph:client:](self, "curationCriteriaWithMeaningLabel:featureNodes:inGraph:client:", v11, v15, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)petCurationCriteriaWithCollection:(id)a3 client:(unint64_t)a4 curationContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PGCurationCriteria *v14;
  PGCurationSetTrait *v15;
  void *v16;

  v7 = a5;
  objc_msgSend(a3, "eventEnrichmentMomentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "petNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "uuids");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v7, "hiddenOrBlockedPersonUUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minusSet:", v12);

    objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifiersWithUUIDs:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a4, 0.1);
      v15 = -[PGCurationSetTrait initWithItems:]([PGCurationSetTrait alloc], "initWithItems:", v13);
      -[PGCurationCriteria setPeopleTrait:](v14, "setPeopleTrait:", v15);

      -[PGCurationCriteria peopleTrait](v14, "peopleTrait");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMinimumScore:", 1.0);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)tripCurationCriteriaWithCollection:(id)a3 client:(unint64_t)a4
{
  if ((objc_msgSend(a3, "isShortTrip") & 1) != 0)
    -[PGCurationCriteriaFactory _shortTripCriteriaWithClient:](self, "_shortTripCriteriaWithClient:", a4);
  else
    -[PGCurationCriteriaFactory _longTripCriteriaWithClient:](self, "_longTripCriteriaWithClient:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)curationCriteriaWithSeasonName:(id)a3 client:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint8_t v13[16];

  v6 = a3;
  v7 = v6;
  if (a4 != 1)
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D4B090]))
    {
      -[PGCurationCriteriaFactory _searchWinterCriteria](self, "_searchWinterCriteria");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D4B080]))
    {
      -[PGCurationCriteriaFactory _searchSpringCriteria](self, "_searchSpringCriteria");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D4B088]))
    {
      -[PGCurationCriteriaFactory _searchSummerCriteria](self, "_searchSummerCriteria");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D4B078]))
      {
        v10 = 0;
        goto LABEL_14;
      }
      -[PGCurationCriteriaFactory _searchFallCriteria](self, "_searchFallCriteria");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v11;
LABEL_14:
    objc_msgSend(v10, "setFaceFilter:", 2);
    goto LABEL_15;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Curation criteria are not defined for client PGCriteriaClientMemories", v13, 2u);
  }

  v10 = 0;
LABEL_15:

  return v10;
}

- (id)foodieCurationCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v3;
  PGCurationSDFoodTrait *v4;
  PGCurationCropScoreTrait *v5;

  v3 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  v4 = objc_alloc_init(PGCurationSDFoodTrait);
  -[PGCurationCriteria setSdFoodTrait:](v3, "setSdFoodTrait:", v4);

  v5 = -[PGCurationCropScoreTrait initWithMinimumSquareCropScore:]([PGCurationCropScoreTrait alloc], "initWithMinimumSquareCropScore:", 0.7);
  -[PGCurationCriteria setCropScoreTrait:](v3, "setCropScoreTrait:", v5);

  return v3;
}

- (id)foodieCurationCriteriaWithPersonLocalIdentifier:(id)a3 client:(unint64_t)a4
{
  id v5;
  PGCurationCriteria *v6;
  PGCurationSetTrait *v7;
  void *v8;
  PGCurationSetTrait *v9;
  void *v10;

  v5 = a3;
  v6 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a4, 0.1);
  v7 = [PGCurationSetTrait alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PGCurationSetTrait initWithItems:](v7, "initWithItems:", v8);
  -[PGCurationCriteria setPeopleTrait:](v6, "setPeopleTrait:", v9);

  -[PGCurationCriteria peopleTrait](v6, "peopleTrait");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumScore:", 1.0);

  return v6;
}

- (id)_weddingCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.07);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA540, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  return v4;
}

- (id)_birthdayCriteriaWithPersonLocalIdentifiers:(id)a3 client:(unint64_t)a4
{
  id v6;
  PGCurationCriteria *v7;
  void *v8;
  PGCurationSceneTrait *v9;
  PGCurationSetTrait *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a4, 0.1);
    -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA558, MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v8);
    -[PGCurationCriteria setScenesTrait:](v7, "setScenesTrait:", v9);

    v10 = -[PGCurationSetTrait initWithItems:]([PGCurationSetTrait alloc], "initWithItems:", v6);
    -[PGCurationCriteria setPeopleTrait:](v7, "setPeopleTrait:", v10);

    -[PGCurationCriteria peopleTrait](v7, "peopleTrait");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumScore:", 1.0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_anniversaryCriteriaWithPersonLocalIdentifier:(id)a3 client:(unint64_t)a4
{
  id v5;
  void *v6;
  PGCurationCriteria *v7;
  PGCurationSetTrait *v8;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a4, 0.1);
    v8 = -[PGCurationSetTrait initWithItems:]([PGCurationSetTrait alloc], "initWithItems:", v6);
    -[PGCurationCriteria setPeopleTrait:](v7, "setPeopleTrait:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_holidayEventCriteriaWithGraph:(id)a3 featureNodes:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  PGCurationCriteria *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGCurationSceneTrait *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PGCurationSetTrait *v25;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a5, 0.1);
  if (objc_msgSend(v9, "count"))
  {
    -[PGCurationCriteriaFactory holidayServiceWithGraph:](self, "holidayServiceWithGraph:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sceneNamesForHolidayName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", v15, MEMORY[0x1E0C9AA60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v16);
    -[PGCurationCriteria setScenesTrait:](v10, "setScenesTrait:", v17);

    v18 = objc_msgSend(v11, "peopleTraitForHolidayName:", v14);
    +[PGGraphNodeCollection subsetInCollection:](PGGraphMomentNodeCollection, "subsetInCollection:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    switch(v18)
    {
      case 1:
        v27 = v8;
        objc_msgSend(v19, "personNodes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "partnerPersonNodes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 32:
        v27 = v8;
        objc_msgSend(v19, "personNodes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "motherPersonNodes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 64:
        v27 = v8;
        objc_msgSend(v19, "personNodes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fatherPersonNodes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_9:

        goto LABEL_10;
    }
    v23 = v22;
    objc_msgSend(v22, "localIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[PGCurationSetTrait initWithItems:]([PGCurationSetTrait alloc], "initWithItems:", v24);
    -[PGCurationCriteria setPeopleTrait:](v10, "setPeopleTrait:", v25);

    v8 = v27;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (id)_hikingCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA570, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  if (a3 == 2)
    -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);

  return v5;
}

- (id)_divingCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA588, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  -[PGCurationCriteria setFaceFilter:](v4, "setFaceFilter:", 0);
  return v4;
}

- (id)_winterSportCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA5A0, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  if (a3 == 2)
    -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);

  return v5;
}

- (id)_beachingCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA5B8, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  if (a3 == 2)
    -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);

  return v5;
}

- (id)_climbingCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA5D0, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  if (a3 == 2)
    -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);

  return v5;
}

- (id)_entertainmentCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA5E8, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  return v4;
}

- (id)_concertCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA600, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  -[PGCurationCriteria setFaceFilter:](v4, "setFaceFilter:", 0);
  return v4;
}

- (id)_festivalCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA618, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  -[PGCurationCriteria setFaceFilter:](v4, "setFaceFilter:", 0);
  return v4;
}

- (id)_performanceCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA630, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  return v4;
}

- (id)_museumCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;
  PGCurationSceneTrait *v6;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", MEMORY[0x1E0C9AA60], &unk_1E84EA648);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v5);
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v6);

  -[PGCurationCriteria setFaceFilter:](v4, "setFaceFilter:", 0);
  return v4;
}

- (id)_sportEventCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA660, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  if (a3 == 2)
    -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);

  return v5;
}

- (id)_nightOutCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  void *v6;
  PGCurationSceneTrait *v7;
  PGCurationPartOfDayTrait *v8;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA678, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  v8 = -[PGCurationPartOfDayTrait initWithPartOfDay:]([PGCurationPartOfDayTrait alloc], "initWithPartOfDay:", 48);
  -[PGCurationTrait setMinimumScore:](v8, "setMinimumScore:", 0.1);
  -[PGCurationCriteria setPartOfDayTrait:](v5, "setPartOfDayTrait:", v8);
  if (a3 == 2)
    -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);

  return v5;
}

- (id)_breakfastCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  PGCurationPartOfDayTrait *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  v6 = -[PGCurationPartOfDayTrait initWithPartOfDay:]([PGCurationPartOfDayTrait alloc], "initWithPartOfDay:", 2);
  -[PGCurationTrait setMinimumScore:](v6, "setMinimumScore:", 0.1);
  -[PGCurationCriteria setPartOfDayTrait:](v5, "setPartOfDayTrait:", v6);
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      -[PGCurationCriteriaFactory _searchRestaurantCompulsoryScenesTrait](self, "_searchRestaurantCompulsoryScenesTrait");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria setCompulsoryScenesTrait:](v5, "setCompulsoryScenesTrait:", v8);

      -[PGCurationCriteriaFactory _searchRestaurantScenesTrait](self, "_searchRestaurantScenesTrait");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v9);

      -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);
    }
  }
  else
  {
    -[PGCurationCriteriaFactory _memoriesRestaurantScenesTrait](self, "_memoriesRestaurantScenesTrait");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  }
  return v5;
}

- (id)_lunchCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  PGCurationPartOfDayTrait *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  v6 = -[PGCurationPartOfDayTrait initWithPartOfDay:]([PGCurationPartOfDayTrait alloc], "initWithPartOfDay:", 4);
  -[PGCurationTrait setMinimumScore:](v6, "setMinimumScore:", 0.1);
  -[PGCurationCriteria setPartOfDayTrait:](v5, "setPartOfDayTrait:", v6);
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      -[PGCurationCriteriaFactory _searchRestaurantCompulsoryScenesTrait](self, "_searchRestaurantCompulsoryScenesTrait");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria setCompulsoryScenesTrait:](v5, "setCompulsoryScenesTrait:", v8);

      -[PGCurationCriteriaFactory _searchRestaurantScenesTrait](self, "_searchRestaurantScenesTrait");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v9);

      -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);
    }
  }
  else
  {
    -[PGCurationCriteriaFactory _memoriesRestaurantScenesTrait](self, "_memoriesRestaurantScenesTrait");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v7);

  }
  return v5;
}

- (id)_dinnerCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v5;
  uint64_t v6;
  PGCurationPartOfDayTrait *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.1);
  if (a3)
    v6 = 16;
  else
    v6 = 48;
  v7 = -[PGCurationPartOfDayTrait initWithPartOfDay:]([PGCurationPartOfDayTrait alloc], "initWithPartOfDay:", v6);
  -[PGCurationTrait setMinimumScore:](v7, "setMinimumScore:", 0.1);
  -[PGCurationCriteria setPartOfDayTrait:](v5, "setPartOfDayTrait:", v7);
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      -[PGCurationCriteriaFactory _searchRestaurantCompulsoryScenesTrait](self, "_searchRestaurantCompulsoryScenesTrait");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria setCompulsoryScenesTrait:](v5, "setCompulsoryScenesTrait:", v9);

      -[PGCurationCriteriaFactory _searchRestaurantScenesTrait](self, "_searchRestaurantScenesTrait");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v10);

      -[PGCurationCriteria setFaceFilter:](v5, "setFaceFilter:", 0);
    }
  }
  else
  {
    -[PGCurationCriteriaFactory _memoriesRestaurantScenesTrait](self, "_memoriesRestaurantScenesTrait");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria setScenesTrait:](v5, "setScenesTrait:", v8);

  }
  return v5;
}

- (id)_shortTripCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.05);
  -[PGCurationCriteriaFactory _tripScenesTrait](self, "_tripScenesTrait");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v5);

  return v4;
}

- (id)_longTripCriteriaWithClient:(unint64_t)a3
{
  PGCurationCriteria *v4;
  void *v5;

  v4 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", a3, 0.05);
  -[PGCurationCriteriaFactory _tripScenesTrait](self, "_tripScenesTrait");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteria setScenesTrait:](v4, "setScenesTrait:", v5);

  -[PGCurationCriteria setFaceFilter:](v4, "setFaceFilter:", 0);
  return v4;
}

- (id)_compulsoryRequiredTraitsFromBaseSceneNames:(id)a3 leafSceneNames:(id)a4
{
  void *v4;
  PGCurationSceneTrait *v5;

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", a3, MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v4);
  -[PGCurationTrait setMinimumScore:](v5, "setMinimumScore:", 0.1);

  return v5;
}

- (id)_searchWinterCriteria
{
  PGCurationCriteria *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v3 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", 2, 0.1);
  v4 = MEMORY[0x1E0C9AA60];
  -[PGCurationCriteriaFactory _compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:](self, "_compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:", &unk_1E84EA690, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteria setCompulsoryScenesTrait:](v3, "setCompulsoryScenesTrait:", v5);

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA6A8, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v3, "setScenesTrait:", v7);

  return v3;
}

- (id)_searchSpringCriteria
{
  PGCurationCriteria *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v3 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", 2, 0.1);
  v4 = MEMORY[0x1E0C9AA60];
  -[PGCurationCriteriaFactory _compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:](self, "_compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:", &unk_1E84EA6C0, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteria setCompulsoryScenesTrait:](v3, "setCompulsoryScenesTrait:", v5);

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA6D8, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v3, "setScenesTrait:", v7);

  return v3;
}

- (id)_searchSummerCriteria
{
  PGCurationCriteria *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v3 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", 2, 0.1);
  v4 = MEMORY[0x1E0C9AA60];
  -[PGCurationCriteriaFactory _compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:](self, "_compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:", &unk_1E84EA6F0, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteria setCompulsoryScenesTrait:](v3, "setCompulsoryScenesTrait:", v5);

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA708, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v3, "setScenesTrait:", v7);

  return v3;
}

- (id)_searchFallCriteria
{
  PGCurationCriteria *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PGCurationSceneTrait *v7;

  v3 = -[PGCurationCriteria initWithMinimumAssetsRatio:client:]([PGCurationCriteria alloc], "initWithMinimumAssetsRatio:client:", 2, 0.1);
  v4 = MEMORY[0x1E0C9AA60];
  -[PGCurationCriteriaFactory _compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:](self, "_compulsoryRequiredTraitsFromBaseSceneNames:leafSceneNames:", &unk_1E84EA720, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCriteria setCompulsoryScenesTrait:](v3, "setCompulsoryScenesTrait:", v5);

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA738, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v6);
  -[PGCurationCriteria setScenesTrait:](v3, "setScenesTrait:", v7);

  return v3;
}

- (id)_memoriesRestaurantScenesTrait
{
  void *v2;
  PGCurationSceneTrait *v3;

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA750, &unk_1E84EA768);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v2);

  return v3;
}

- (id)_searchRestaurantScenesTrait
{
  void *v2;
  PGCurationSceneTrait *v3;

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA780, MEMORY[0x1E0C9AA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v2);

  return v3;
}

- (id)_searchRestaurantCompulsoryScenesTrait
{
  void *v2;
  PGCurationSceneTrait *v3;

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", MEMORY[0x1E0C9AA60], &unk_1E84EA798);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v2);

  return v3;
}

- (id)_tripScenesTrait
{
  void *v2;
  PGCurationSceneTrait *v3;

  -[PGCurationCriteriaFactory _sceneNamesFromBaseSceneNames:leafSceneNames:](self, "_sceneNamesFromBaseSceneNames:leafSceneNames:", &unk_1E84EA7B0, MEMORY[0x1E0C9AA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PGCurationSceneTrait initWithSceneNames:]([PGCurationSceneTrait alloc], "initWithSceneNames:", v2);

  return v3;
}

- (id)_sceneNamesFromBaseSceneNames:(id)a3 leafSceneNames:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v16);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        -[CLSSceneTaxonomyHierarchy nodeForName:](self->_sceneTaxonomy, "nodeForName:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v12;
        v17[1] = 3221225472;
        v17[2] = __74__PGCurationCriteriaFactory__sceneNamesFromBaseSceneNames_leafSceneNames___block_invoke;
        v17[3] = &unk_1E84331B0;
        v18 = v7;
        objc_msgSend(v14, "traverseChildrenUsingNameBlock:", v17);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_holidayServiceByLocale, 0);
}

uint64_t __74__PGCurationCriteriaFactory__sceneNamesFromBaseSceneNames_leafSceneNames___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

@end
