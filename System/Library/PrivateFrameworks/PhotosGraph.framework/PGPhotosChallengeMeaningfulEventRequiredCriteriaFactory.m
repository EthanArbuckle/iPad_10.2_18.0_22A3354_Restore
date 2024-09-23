@implementation PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory

+ (id)requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6 params:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  objc_msgSend(v12, "setWithArray:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:params:", v16, a4, v15, v14, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6 params:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void (**v18)(void *, const __CFString *, void *);
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v54;
  id v55;
  _QWORD aBlock[4];
  id v57;
  _QWORD v58[4];

  v58[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__requiredCriteriaForIdentifiers_inferenceType_graph_sceneTaxonomy_params___block_invoke;
  aBlock[3] = &unk_1E842A940;
  v17 = v16;
  v57 = v17;
  v18 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  if (v12)
  {
    if (objc_msgSend(v12, "containsObject:", CFSTR("Wedding")))
    {
      objc_msgSend(a1, "_weddingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("Wedding"));

    }
    if ((objc_msgSend(v12, "containsObject:", CFSTR("Birthday")) & 1) == 0
      && (objc_msgSend(v12, "containsObject:", CFSTR("WeakBirthday")) & 1) == 0)
    {
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(a1, "_weddingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("Wedding"));

  }
  v54 = 0;
  v55 = 0;
  objc_msgSend(a1, "_birthdayCriteriaWithGraph:strongBirthdayCriteria:weakBirthdayCriteria:sceneTaxonomy:", v13, &v55, &v54, v14);
  v21 = v55;
  v22 = v54;
  if (v12)
  {
    if (objc_msgSend(v12, "containsObject:", CFSTR("Birthday")))
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("Birthday"));
    if ((objc_msgSend(v12, "containsObject:", CFSTR("WeakBirthday")) & 1) == 0)
    {

      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("Birthday"));
  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("WeakBirthday"));

  if (!v12)
  {
    objc_msgSend(a1, "_anniversaryCriteriaWithGraph:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("Anniversary"));

    goto LABEL_20;
  }
LABEL_15:
  if (objc_msgSend(v12, "containsObject:", CFSTR("Anniversary")))
  {
    objc_msgSend(a1, "_anniversaryCriteriaWithGraph:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("Anniversary"));

  }
  if ((objc_msgSend(v12, "containsObject:", CFSTR("Celebration")) & 1) == 0)
  {
LABEL_21:
    if (objc_msgSend(v12, "containsObject:", CFSTR("Performance")))
    {
      objc_msgSend(a1, "_performanceCriteriaWithGraph:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, CFSTR("Performance"), v26);

    }
    if ((objc_msgSend(v12, "containsObject:", CFSTR("Concert")) & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_20:
  objc_msgSend(a1, "_celebrationCriteriaWithGraph:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("Celebration"), v25);

  if (v12)
    goto LABEL_21;
  objc_msgSend(a1, "_performanceCriteriaWithGraph:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("Performance"), v27);

LABEL_26:
  objc_msgSend(a1, "_concertCriteriaArrayForInferenceType:graph:", a4, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("Concert"));

  if (!v12)
  {
    objc_msgSend(a1, "_festivalCriteriaArrayWithGraph:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("Festival"));

    goto LABEL_32;
  }
LABEL_27:
  if (objc_msgSend(v12, "containsObject:", CFSTR("Festival")))
  {
    objc_msgSend(a1, "_festivalCriteriaArrayWithGraph:", v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("Festival"));

  }
  if ((objc_msgSend(v12, "containsObject:", CFSTR("Theater")) & 1) == 0)
  {
LABEL_33:
    if (objc_msgSend(v12, "containsObject:", CFSTR("Dance")))
    {
      objc_msgSend(a1, "_danceCriteriaWithGraph:", v13);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, CFSTR("Dance"), v32);

    }
    if ((objc_msgSend(v12, "containsObject:", CFSTR("Hiking")) & 1) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_32:
  objc_msgSend(a1, "_theaterCriteriaWithGraph:", v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("Theater"), v31);

  if (v12)
    goto LABEL_33;
  objc_msgSend(a1, "_danceCriteriaWithGraph:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("Dance"), v33);

LABEL_38:
  objc_msgSend(a1, "_hikingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, CFSTR("Hiking"));

  if (!v12)
  {
    objc_msgSend(a1, "_climbingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, CFSTR("Climbing"), v36);

    goto LABEL_44;
  }
LABEL_39:
  if (objc_msgSend(v12, "containsObject:", CFSTR("Climbing")))
  {
    objc_msgSend(a1, "_climbingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, CFSTR("Climbing"), v35);

  }
  if ((objc_msgSend(v12, "containsObject:", CFSTR("Beaching")) & 1) == 0)
  {
LABEL_45:
    if (objc_msgSend(v12, "containsObject:", CFSTR("SportEvent")))
    {
      objc_msgSend(a1, "_sportEventCriteriaArrayForInferenceType:graph:", a4, v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, CFSTR("SportEvent"));

    }
    if ((objc_msgSend(v12, "containsObject:", CFSTR("WinterSport")) & 1) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_44:
  objc_msgSend(a1, "_beachingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("Beaching"), v37);

  if (v12)
    goto LABEL_45;
  objc_msgSend(a1, "_sportEventCriteriaArrayForInferenceType:graph:", a4, v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v39, CFSTR("SportEvent"));

LABEL_50:
  objc_msgSend(a1, "_winterSportCriteriaWithGraph:sceneTaxonomy:", v13, v14);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("WinterSport"), v40);

  if (!v12)
  {
    objc_msgSend(a1, "_divingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, CFSTR("Diving"), v43);

    v58[0] = CFSTR("Lunch");
    v58[1] = CFSTR("Dinner");
    v58[2] = CFSTR("Breakfast");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_60;
  }
LABEL_51:
  if (objc_msgSend(v12, "containsObject:", CFSTR("Diving")))
  {
    objc_msgSend(a1, "_divingCriteriaWithGraph:sceneTaxonomy:", v13, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, CFSTR("Diving"), v41);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "containsObject:", CFSTR("Lunch")))
    objc_msgSend(v42, "addObject:", CFSTR("Lunch"));
  if (objc_msgSend(v12, "containsObject:", CFSTR("Dinner")))
    objc_msgSend(v42, "addObject:", CFSTR("Dinner"));
  if (objc_msgSend(v12, "containsObject:", CFSTR("Breakfast")))
    objc_msgSend(v42, "addObject:", CFSTR("Breakfast"));
LABEL_60:
  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend(a1, "_restaurantCriteriaByCriteriaForIdentifiers:withGraph:sceneTaxonomy:params:", v42, v13, v14, v15);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v44);

  }
  if (v12)
  {
    if (objc_msgSend(v12, "containsObject:", CFSTR("NightOut")))
    {
      objc_msgSend(a1, "_nightOutCriteriaArrayWithGraph:sceneTaxonomy:", v13, v14);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v45, CFSTR("NightOut"));

    }
    if ((objc_msgSend(v12, "containsObject:", CFSTR("Entertainment")) & 1) == 0)
    {
LABEL_69:
      if (objc_msgSend(v12, "containsObject:", CFSTR("AmusementPark")))
      {
        objc_msgSend(a1, "_amusementParkCriteriaArrayWithGraph:sceneTaxonomy:", v13, v14);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v48, CFSTR("AmusementPark"));

      }
      if ((objc_msgSend(v12, "containsObject:", CFSTR("Museum")) & 1) == 0)
        goto LABEL_75;
      goto LABEL_74;
    }
  }
  else
  {
    objc_msgSend(a1, "_nightOutCriteriaArrayWithGraph:sceneTaxonomy:", v13, v14);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v46, CFSTR("NightOut"));

  }
  objc_msgSend(a1, "_entertainmentCriteriaWithGraph:", v13);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, CFSTR("Entertainment"), v47);

  if (v12)
    goto LABEL_69;
  objc_msgSend(a1, "_amusementParkCriteriaArrayWithGraph:sceneTaxonomy:", v13, v14);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v49, CFSTR("AmusementPark"));

LABEL_74:
  objc_msgSend(a1, "_museumCriteriaArrayForInferenceType:graph:", a4, v13);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v50, CFSTR("Museum"));

  if (!v12)
  {
LABEL_76:
    objc_msgSend(a1, "_socialGroupGatheringCriteriaWithGraph:", v13);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v51, CFSTR("Gathering"));

    goto LABEL_77;
  }
LABEL_75:
  if (objc_msgSend(v12, "containsObject:", CFSTR("Gathering")))
    goto LABEL_76;
LABEL_77:
  v52 = v17;

  return v52;
}

+ (void)_birthdayCriteriaWithGraph:(id)a3 strongBirthdayCriteria:(id *)a4 weakBirthdayCriteria:(id *)a5 sceneTaxonomy:(id)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = a6;
  objc_msgSend(v9, "setWithObjects:", CFSTR("celebration"), CFSTR("birthday_cake"), CFSTR("sparkling_wine"), CFSTR("cake"), CFSTR("pinata"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneNodesForSceneNames:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("restaurant"), CFSTR("bar"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneNodesForSceneNames:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "collectionByFormingUnionWith:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_weddingSceneNodesWithGraph:includeWedding:sceneTaxonomy:", v8, 1, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("grave"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneNodesForSceneNames:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "collectionByFormingUnionWith:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke;
  aBlock[3] = &unk_1E842A9B8;
  v22 = v8;
  v35 = v22;
  v36 = v14;
  v37 = v18;
  v38 = v11;
  v23 = v19;
  v39 = v23;
  v24 = v20;
  v40 = v24;
  v25 = v11;
  v26 = v18;
  v27 = v14;
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5;
  v32[3] = &unk_1E842FE30;
  v33 = _Block_copy(aBlock);
  v28 = v33;
  objc_msgSend(v22, "enumeratePersonNodesIncludingMe:withBlock:", 1, v32);
  if (a4)
    *a4 = objc_retainAutorelease(v23);
  if (a5)
    *a5 = objc_retainAutorelease(v24);

}

+ (id)_weddingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  void *v7;
  PGMeaningfulEventRequiredCriteria *v8;
  void *v9;
  PGMeaningfulEventNumberTrait *v10;
  PGMeaningfulEventSceneCollectionTrait *v11;
  PGMeaningfulEventNumberTrait *v12;
  PGMeaningfulEventPartOfDayTrait *v13;
  PGMeaningfulEventRequiredCriteria *v14;
  PGMeaningfulEventNumberTrait *v15;
  PGMeaningfulEventSceneCollectionTrait *v16;
  void *v17;
  void *v18;
  PGMeaningfulEventCollectionTrait *v19;
  PGGraphPOINodeCollection *v20;
  PGMeaningfulEventCollectionTrait *v21;
  PGMeaningfulEventNumberTrait *v22;
  void *v23;
  PGMeaningfulEventNumberTrait *v25;
  PGMeaningfulEventNumberTrait *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_weddingSceneNodesWithGraph:includeWedding:sceneTaxonomy:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Wedding"), v6, 0.4);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleWorkLocationsForGraph:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSkipNegativeRequirementForMissingLocation:", 1);
    v27 = v9;
    -[PGMeaningfulEventCriteria setLocationsTrait:](v8, "setLocationsTrait:", v9);
    v10 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 10.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v10, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v8, "setNumberOfPeopleTrait:", v10);
    v11 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v7);
    -[PGMeaningfulEventTrait setMinimumScore:](v11, "setMinimumScore:", 2.0 / (double)(unint64_t)objc_msgSend(v7, "count"));
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v11, "setMinimumNumberOfHighConfidenceAssets:", 5);
    -[PGMeaningfulEventCriteria setScenesTrait:](v8, "setScenesTrait:", v11);
    v12 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 12600.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v12, "setMinimumScore:", 1.0);
    v26 = v12;
    -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v8, "setMinimumDurationTrait:", v12);
    v13 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 28);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 0.1);
    -[PGMeaningfulEventCriteria setAllPartsOfDayTrait:](v8, "setAllPartsOfDayTrait:", v13);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v8, "setMustBeInteresting:", 1);
    v14 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Wedding"), v6, 0.4);
    v15 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 30.0);

    -[PGMeaningfulEventTrait setMinimumScore:](v15, "setMinimumScore:", 1.0);
    v25 = v15;
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v14, "setNumberOfPeopleTrait:", v15);
    v16 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v7);

    -[PGMeaningfulEventTrait setMinimumScore:](v16, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v7, "count"));
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v16, "setMinimumNumberOfHighConfidenceAssets:", 18);
    -[PGMeaningfulEventCriteria setScenesTrait:](v14, "setScenesTrait:", v16);
    v29[0] = CFSTR("Shopping");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v17, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      v19 = [PGMeaningfulEventCollectionTrait alloc];
      v20 = -[MAElementCollection initWithGraph:]([PGGraphPOINodeCollection alloc], "initWithGraph:", v6);
      v21 = -[PGMeaningfulEventCollectionTrait initWithNodes:negativeNodes:](v19, "initWithNodes:negativeNodes:", v20, v18);

      -[PGMeaningfulEventTrait setMinimumScore:](v21, "setMinimumScore:", 1.0);
      -[PGMeaningfulEventCriteria setPoisTrait:](v14, "setPoisTrait:", v21);

    }
    v22 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 3600.0);

    -[PGMeaningfulEventTrait setMinimumScore:](v22, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v14, "setMinimumDurationTrait:", v22);
    -[PGMeaningfulEventCriteria setAllPartsOfDayTrait:](v14, "setAllPartsOfDayTrait:", v13);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v14, "setMustBeInteresting:", 1);
    -[PGMeaningfulEventCriteria setLocationsTrait:](v14, "setLocationsTrait:", v27);
    v28[0] = v8;
    v28[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

+ (id)_celebrationCriteriaWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PGMeaningfulEventRequiredCriteria *v6;
  PGMeaningfulEventNumberTrait *v7;
  PGMeaningfulEventSceneCollectionTrait *v8;
  void *v9;
  void *v10;
  PGMeaningfulEventCollectionTrait *v11;
  PGGraphPOINodeCollection *v12;
  PGMeaningfulEventCollectionTrait *v13;
  PGMeaningfulEventNumberTrait *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("graduation"), CFSTR("disco_ball"), CFSTR("ceremony"), CFSTR("wedding"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneNodesForSceneNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Celebration"), v3, 0.4);
    v7 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 4.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v7, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v6, "setNumberOfPeopleTrait:", v7);
    v8 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v5);
    -[PGMeaningfulEventTrait setMinimumScore:](v8, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v5, "count"));
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v8, "setMinimumNumberOfHighConfidenceAssets:", 10);
    -[PGMeaningfulEventCriteria setScenesTrait:](v6, "setScenesTrait:", v8);
    v16[0] = CFSTR("Shopping");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v9, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v11 = [PGMeaningfulEventCollectionTrait alloc];
      v12 = -[MAElementCollection initWithGraph:]([PGGraphPOINodeCollection alloc], "initWithGraph:", v3);
      v13 = -[PGMeaningfulEventCollectionTrait initWithNodes:negativeNodes:](v11, "initWithNodes:negativeNodes:", v12, v10);

      -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 1.0);
      -[PGMeaningfulEventCriteria setPoisTrait:](v6, "setPoisTrait:", v13);

    }
    v14 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 10800.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v6, "setMinimumDurationTrait:", v14);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v6, "setMustBeInteresting:", 1);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_sportEventCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3 == 1)
  {
    objc_msgSend(a1, "_sportEventCriteriaArrayForPublicEventInferenceWithGraph:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_sportEventCriteriaArrayForMeaningInferenceWithGraph:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

+ (id)_sportEventCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGMeaningfulEventRequiredCriteria *v12;
  PGMeaningfulEventNumberTrait *v13;
  PGMeaningfulEventCollectionTrait *v14;
  void *v15;
  PGMeaningfulEventNumberTrait *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "sports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(a1, "_sportEventScenesTraitWithGraph:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("Entertainment");
  v23[1] = CFSTR("Stadium");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "anyNodeForLabel:domain:properties:", CFSTR("Park"), 501, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v10, "count"))
  {
    v12 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("SportEvent"), v4, 0.4);
    -[PGMeaningfulEventCriteria setScenesTrait:](v12, "setScenesTrait:", v8);
    v13 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 2.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v12, "setNumberOfPeopleTrait:", v13);
    v14 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v10);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 0.25);
    -[PGMeaningfulEventCriteria setPoisTrait:](v12, "setPoisTrait:", v14);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v12, "setLocationsTrait:", v15);
    if (v11)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke;
      v21[3] = &unk_1E842AA30;
      v22 = v11;
      -[PGMeaningfulEventCriteria poisTrait](v12, "poisTrait");
      v20 = v7;
      v16 = v13;
      v17 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAdditionalMatchingBlock:", v21);

      v5 = v17;
      v13 = v16;
      v7 = v20;

    }
    objc_msgSend(v5, "addObject:", v12);

  }
  return v5;
}

+ (id)_sportEventCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PGMeaningfulEventRequiredCriteria *v7;
  void *v8;
  PGMeaningfulEventRequiredCriteria *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_sportEventScenesTraitWithGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setMinimumNumberOfHighConfidenceAssets:", 2);
    v7 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("SportEvent"), v4, 0.4);
    -[PGMeaningfulEventCriteria setScenesTrait:](v7, "setScenesTrait:", v6);
    objc_msgSend(a1, "_sportEventScenesTraitWithGraph:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimumNumberOfHighConfidenceAssets:", 7);
    v9 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("SportEvent"), v4, 0.4);
    -[PGMeaningfulEventCriteria setScenesTrait:](v9, "setScenesTrait:", v8);
    v12[0] = v7;
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_divingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGMeaningfulEventRequiredCriteria *v17;
  PGMeaningfulEventSceneCollectionTrait *v18;
  PGMeaningfulEventCollectionTrait *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_divingSceneNodesWithGraph:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("Water");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphROINodeCollection roiNodesForLabels:inGraph:](PGGraphROINodeCollection, "roiNodesForLabels:inGraph:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") && objc_msgSend(v10, "count"))
  {
    objc_msgSend(a1, "_winterSportSceneNodesWithGraph:sceneTaxonomy:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_negativeHikingSceneNodesWithGraph:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionByFormingUnionWith:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("surfing"), CFSTR("surfboard"), CFSTR("watersport"), CFSTR("jetski"), CFSTR("kiteboarding"), CFSTR("wakeboarding"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneNodesForSceneNames:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionByFormingUnionWith:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Diving"), v6, 0.7);
    v18 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v8, v16);
    -[PGMeaningfulEventTrait setMinimumScore:](v18, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v8, "count"));
    -[PGMeaningfulEventCriteria setScenesTrait:](v17, "setScenesTrait:", v18);
    v19 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v10);
    -[PGMeaningfulEventTrait setMinimumScore:](v19, "setMinimumScore:", 0.25);
    -[PGMeaningfulEventCriteria setRoisTrait:](v17, "setRoisTrait:", v19);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v17, "setMustBeInteresting:", 1);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingFrequentLocationsForGraph:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v17, "setLocationsTrait:", v20);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_winterSportCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGMeaningfulEventRequiredCriteria *v13;
  PGMeaningfulEventSceneCollectionTrait *v14;
  PGMeaningfulEventCollectionTrait *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_winterSportSceneNodesWithGraph:sceneTaxonomy:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("Mountain");
  v18[1] = CFSTR("Nature");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphROINodeCollection roiNodesForLabels:inGraph:](PGGraphROINodeCollection, "roiNodesForLabels:inGraph:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") && objc_msgSend(v9, "count"))
  {
    objc_msgSend(a1, "_beachingSceneNodesWithGraph:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_negativeHikingSceneNodesWithGraph:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionByFormingUnionWith:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("WinterSport"), v6, 0.6);
    v14 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v7, v12);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v7, "count"));
    -[PGMeaningfulEventCriteria setScenesTrait:](v13, "setScenesTrait:", v14);
    v15 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v9);
    -[PGMeaningfulEventTrait setMinimumScore:](v15, "setMinimumScore:", 0.25);
    -[PGMeaningfulEventCriteria setRoisTrait:](v13, "setRoisTrait:", v15);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v13, "setMustBeInteresting:", 1);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v13, "setLocationsTrait:", v16);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_theaterCriteriaWithGraph:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D4B228];
  v5 = a3;
  objc_msgSend(v4, "theater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_danceCriteriaWithGraph:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D4B228];
  v5 = a3;
  objc_msgSend(v4, "dance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_performanceCriteriaWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGMeaningfulEventRequiredCriteria *v10;
  PGMeaningfulEventNumberTrait *v11;
  PGMeaningfulEventCollectionTrait *v12;
  PGMeaningfulEventSceneCollectionTrait *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("performance"), CFSTR("clown"), CFSTR("ballet_dancer"), CFSTR("acrobat"), CFSTR("ballet"), CFSTR("breakdancing"), CFSTR("bellydance"), CFSTR("magic"), CFSTR("circus"), CFSTR("orchestra"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneNodesForSceneNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("Nightlife");
  v16[1] = CFSTR("Culture");
  v16[2] = CFSTR("Entertainment");
  v16[3] = CFSTR("Performance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") && objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("toy"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneNodesForSceneNames:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Performance"), v3, 0.4);
    v11 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 2.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v10, "setNumberOfPeopleTrait:", v11);

    v12 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v7);
    -[PGMeaningfulEventTrait setMinimumScore:](v12, "setMinimumScore:", 0.1);
    -[PGMeaningfulEventCriteria setPoisTrait:](v10, "setPoisTrait:", v12);
    v13 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v5, v9);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v5, "count"));
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v13, "setMinimumNumberOfHighConfidenceAssets:", 4);
    -[PGMeaningfulEventCriteria setScenesTrait:](v10, "setScenesTrait:", v13);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v10, "setLocationsTrait:", v14);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_concertCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  if (a3 == 1)
  {
    objc_msgSend(a1, "_concertCriteriaArrayForPublicEventInferenceWithGraph:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(a1, "_concertCriteriaArrayForMeaningInferenceWithGraph:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

+ (id)_concertCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  PGMeaningfulEventRequiredCriteria *v13;
  PGMeaningfulEventNumberTrait *v14;
  PGMeaningfulEventCollectionTrait *v15;
  PGMeaningfulEventSceneCollectionTrait *v16;
  PGMeaningfulEventNumberTrait *v17;
  void *v18;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(a1, "_concertSceneNodesInGraph:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("Nightlife");
  v20[1] = CFSTR("Culture");
  v20[2] = CFSTR("Entertainment");
  v20[3] = CFSTR("Stadium");
  v20[4] = CFSTR("Performance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "count");
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v10, "count"))
    {
      v13 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Concert"), v4, 0.4);
      v14 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 2.0);
      -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v13, "setNumberOfPeopleTrait:", v14);

      v15 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v10);
      -[PGMeaningfulEventTrait setMinimumScore:](v15, "setMinimumScore:", 0.1);
      -[PGMeaningfulEventCriteria setPoisTrait:](v13, "setPoisTrait:", v15);
      v16 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v8);
      -[PGMeaningfulEventTrait setMinimumScore:](v16, "setMinimumScore:", 1.0 / (double)v12);
      -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v16, "setMinimumNumberOfHighConfidenceAssets:", 2);
      -[PGMeaningfulEventCriteria setScenesTrait:](v13, "setScenesTrait:", v16);
      v17 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 300.0);
      -[PGMeaningfulEventTrait setMinimumScore:](v17, "setMinimumScore:", 1.0);
      -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v13, "setMinimumDurationTrait:", v17);
      +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGMeaningfulEventCriteria setLocationsTrait:](v13, "setLocationsTrait:", v18);
      objc_msgSend(v5, "addObject:", v13);

    }
  }

  return v5;
}

+ (id)_concertCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  PGMeaningfulEventRequiredCriteria *v12;
  PGMeaningfulEventSceneCollectionTrait *v13;
  PGMeaningfulEventPartOfDayTrait *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_concertSceneNodesInGraph:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("performance"), CFSTR("nightclub"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionByFormingUnionWith:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v12 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Concert"), v4, 0.4);
    v13 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v9);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 1.0 / (double)v11);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v13, "setMinimumNumberOfHighConfidenceAssets:", 7);
    -[PGMeaningfulEventCriteria setScenesTrait:](v12, "setScenesTrait:", v13);
    v14 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 48);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 0.4);
    -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v12, "setSignificantPartsOfDayTrait:", v14);
    objc_msgSend(v5, "addObject:", v12);

  }
  return v5;
}

+ (id)_festivalCriteriaArrayWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  PGMeaningfulEventRequiredCriteria *v11;
  PGMeaningfulEventNumberTrait *v12;
  PGMeaningfulEventSceneCollectionTrait *v13;
  PGMeaningfulEventNumberTrait *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(a1, "_concertSceneNodesInGraph:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Festival"), v4, 0.4);
    v12 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 5.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v11, "setNumberOfPeopleTrait:", v12);

    v13 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v8);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 1.0 / (double)v10);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v13, "setMinimumNumberOfHighConfidenceAssets:", 10);
    -[PGMeaningfulEventCriteria setScenesTrait:](v11, "setScenesTrait:", v13);
    v14 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 57600.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v11, "setMinimumDurationTrait:", v14);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v11, "setLocationsTrait:", v15);
    objc_msgSend(v5, "addObject:", v11);

  }
  return v5;
}

+ (id)_museumCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  if (a3 == 1)
  {
    objc_msgSend(a1, "_museumCriteriaArrayForPublicEventInferenceWithGraph:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(a1, "_museumCriteriaArrayForMeaningInferenceWithGraph:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

+ (id)_museumCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  id v4;
  void *v5;
  PGMeaningfulEventRequiredCriteria *v6;
  PGMeaningfulEventPartOfDayTrait *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_museumSceneTraitInGraph:minimumNumberOfHighConfidenceAssets:", v4, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Museum"), v4, 0.4);
    -[PGMeaningfulEventCriteria setScenesTrait:](v6, "setScenesTrait:", v5);
    v7 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 14);
    -[PGMeaningfulEventTrait setMinimumScore:](v7, "setMinimumScore:", 0.2);
    -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v6, "setSignificantPartsOfDayTrait:", v7);
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

+ (id)_museumCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGMeaningfulEventRequiredCriteria *v11;
  PGMeaningfulEventCollectionTrait *v12;
  PGMeaningfulEventPartOfDayTrait *v13;
  PGMeaningfulEventNumberTrait *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(a1, "_museumSceneTraitInGraph:minimumNumberOfHighConfidenceAssets:", v4, 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("Museum");
  v17[1] = CFSTR("Culture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v10, "count"))
  {
    v11 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Museum"), v4, 0.4);
    v12 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v10);
    -[PGMeaningfulEventTrait setMinimumScore:](v12, "setMinimumScore:", 0.1);
    -[PGMeaningfulEventCriteria setPoisTrait:](v11, "setPoisTrait:", v12);
    -[PGMeaningfulEventCriteria setScenesTrait:](v11, "setScenesTrait:", v8);
    v13 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 14);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 0.2);
    -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v11, "setSignificantPartsOfDayTrait:", v13);
    v14 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 3600.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v11, "setMinimumDurationTrait:", v14);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v11, "setLocationsTrait:", v15);
    objc_msgSend(v5, "addObject:", v11);

  }
  return v5;
}

+ (id)_nightOutCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PGMeaningfulEventPartOfDayTrait *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  PGMeaningfulEventRequiredCriteria *v38;
  PGMeaningfulEventNumberTrait *v39;
  PGMeaningfulEventSceneCollectionTrait *v40;
  PGMeaningfulEventCollectionTrait *v41;
  PGMeaningfulEventNumberTrait *v42;
  void *v44;
  PGMeaningfulEventPartOfDayTrait *v45;
  void *v46;
  id obj;
  uint64_t v48;
  void *v49;
  PGMeaningfulEventPartOfDayTrait *v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 32);
  -[PGMeaningfulEventTrait setMinimumScore:](v9, "setMinimumScore:", 0.6);
  objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v6;
  objc_msgSend(a1, "_publicEventCriteriaForCategoryWithName:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "setSignificantPartsOfDayTrait:", v9);
    objc_msgSend(v8, "addObject:", v11);
  }
  v44 = v11;
  v45 = v9;
  v51 = v8;
  v50 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:forbiddenPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:forbiddenPartOfDay:", 48, 12);
  -[PGMeaningfulEventTrait setMinimumScore:](v50, "setMinimumScore:", 0.3);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", &unk_1E84E9A30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v13 = objc_msgSend(&unk_1E84E9A18, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v60;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v60 != v15)
          objc_enumerationMutation(&unk_1E84E9A18);
        objc_msgSend(v7, "nodeForName:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v16;
        v57[1] = 3221225472;
        v57[2] = __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
        v57[3] = &unk_1E84331B0;
        v58 = v12;
        objc_msgSend(v18, "traverseChildrenUsingNameBlock:", v57);

      }
      v14 = objc_msgSend(&unk_1E84E9A18, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v14);
  }
  objc_msgSend(v52, "sceneNodesForSceneNames:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = CFSTR("Nightlife");
  v71[1] = CFSTR("Restaurant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v20, v52);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count") && objc_msgSend(v21, "count"))
  {
    v46 = v21;
    v68[0] = CFSTR("minimumDuration");
    v68[1] = CFSTR("minimumNumberOfHighConfidenceScenes");
    v69[1] = &unk_1E84E36C8;
    v68[2] = CFSTR("usePOIs");
    v69[0] = &unk_1E84EB2B8;
    v69[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v22;
    v66[0] = CFSTR("minimumDuration");
    v66[1] = CFSTR("minimumNumberOfHighConfidenceScenes");
    v67[0] = &unk_1E84EB2B8;
    v67[1] = &unk_1E84E36E0;
    v66[2] = CFSTR("usePOIs");
    v67[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v23;
    v64[0] = CFSTR("minimumDuration");
    v64[1] = CFSTR("minimumNumberOfHighConfidenceScenes");
    v65[0] = &unk_1E84EB2C8;
    v65[1] = &unk_1E84E36F8;
    v64[2] = CFSTR("usePOIs");
    v65[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v52);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v25;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v26)
    {
      v27 = v26;
      v48 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v54 != v48)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("minimumDuration"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31;

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("minimumNumberOfHighConfidenceScenes"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "unsignedIntegerValue");

          if (v34 <= 1)
            v35 = 1;
          else
            v35 = v34;
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("usePOIs"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "BOOLValue");

          v38 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("NightOut"), v52, 0.6);
          -[PGMeaningfulEventCriteria setLocationsTrait:](v38, "setLocationsTrait:", v49);
          v39 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 3.0);
          -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v38, "setNumberOfPeopleTrait:", v39);

          v40 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v19);
          -[PGMeaningfulEventTrait setMinimumScore:](v40, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v19, "count"));
          -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v40, "setMinimumNumberOfHighConfidenceAssets:", v35);
          -[PGMeaningfulEventCriteria setScenesTrait:](v38, "setScenesTrait:", v40);
          if (v37)
          {
            v41 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v46);
            -[PGMeaningfulEventTrait setMinimumScore:](v41, "setMinimumScore:", 0.4);
            -[PGMeaningfulEventCriteria setPoisTrait:](v38, "setPoisTrait:", v41);

          }
          -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v38, "setMustBeInteresting:", 1);
          v42 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", v32);
          -[PGMeaningfulEventTrait setMinimumScore:](v42, "setMinimumScore:", 1.0);
          -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v38, "setMinimumDurationTrait:", v42);
          -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v38, "setSignificantPartsOfDayTrait:", v50);
          objc_msgSend(v51, "addObject:", v38);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v27);
    }

    v21 = v46;
  }

  return v51;
}

+ (id)_anniversaryCriteriaWithGraph:(id)a3
{
  id v3;
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
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "anyNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anniversaryDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 0, &__block_literal_global_19891);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "collection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "personNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "year");
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __89__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke_2;
        v21[3] = &unk_1E842A968;
        v26 = v15;
        v22 = v6;
        v23 = v3;
        v24 = v13;
        v16 = v14;
        v25 = v16;
        v17 = v13;
        objc_msgSend(v23, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Year"), 400, v21);
        v18 = v25;
        v19 = v16;

      }
      else
      {
        v19 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v19 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v19 = (id)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5 params:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  int v74;
  void *v75;
  char v76;
  PGMeaningfulEventRequiredCriteria *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  PGMeaningfulEventCollectionTrait *v87;
  PGMeaningfulEventCollectionTrait *v88;
  double v89;
  PGMeaningfulEventCollectionTrait *v90;
  PGMeaningfulEventSceneCollectionTrait *v91;
  uint64_t v92;
  uint64_t v93;
  PGMeaningfulEventPartOfDayTrait *v94;
  PGMeaningfulEventPartOfDayTrait *v95;
  PGMeaningfulEventNumberTrait *v96;
  PGMeaningfulEventNumberTrait *v97;
  void *v98;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id obj;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  _BYTE v135[128];
  _QWORD v136[8];
  _QWORD v137[8];
  _QWORD v138[8];
  _QWORD v139[8];
  _QWORD v140[8];
  _QWORD v141[8];
  _QWORD v142[6];
  _QWORD v143[6];
  _QWORD v144[6];
  _QWORD v145[6];
  _QWORD v146[6];
  _QWORD v147[6];
  _QWORD v148[6];
  _QWORD v149[6];
  _QWORD v150[4];
  const __CFString *v151;
  _QWORD v152[4];

  v152[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(a5, "nodeForName:", CFSTR("tableware"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("restaurant"), CFSTR("food"), 0);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("wine_bottle"), CFSTR("wine"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __134__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy_params___block_invoke;
  v133[3] = &unk_1E84331B0;
  v15 = v14;
  v134 = v15;
  v108 = v12;
  objc_msgSend(v12, "traverseChildrenUsingNameBlock:", v133);
  v107 = (void *)v13;
  objc_msgSend(v10, "sceneNodesForSceneNames:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneNodesForSceneNames:", v15);
  v121 = v16;
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionByFormingUnionWith:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("aquarium"), CFSTR("underwater"), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneNodesForSceneNames:");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = CFSTR("Nightlife");
  v152[1] = CFSTR("Restaurant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v18, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v151 = CFSTR("Museum");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v10;
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v20, v10);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = v17;
  if (!objc_msgSend(v17, "count") || !objc_msgSend(v19, "count"))
  {
    v113 = (id)MEMORY[0x1E0C9AA70];
    v41 = (void *)v13;
    v40 = v108;
    goto LABEL_58;
  }
  v111 = v19;
  v103 = v15;
  v116 = v9;
  +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v10);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v148[0] = CFSTR("label");
  v148[1] = CFSTR("significantPartsOfDay");
  v149[0] = CFSTR("Lunch");
  v149[1] = &unk_1E84E3710;
  v148[2] = CFSTR("forbiddenPartOfDay");
  v148[3] = CFSTR("minimumNumberOfHighConfidenceScenes");
  v149[2] = &unk_1E84E3728;
  v149[3] = &unk_1E84E36C8;
  v21 = MEMORY[0x1E0C9AAB0];
  v148[4] = CFSTR("usePOIs");
  v148[5] = CFSTR("useNegativePOIs");
  v149[4] = MEMORY[0x1E0C9AAB0];
  v149[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 6);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v125;
  v146[0] = CFSTR("label");
  v146[1] = CFSTR("significantPartsOfDay");
  v147[0] = CFSTR("Lunch");
  v147[1] = &unk_1E84E3710;
  v146[2] = CFSTR("forbiddenPartOfDay");
  v146[3] = CFSTR("minimumNumberOfHighConfidenceScenes");
  v147[2] = &unk_1E84E3728;
  v147[3] = &unk_1E84E3740;
  v146[4] = CFSTR("usePOIs");
  v146[5] = CFSTR("useNegativePOIs");
  v147[4] = v21;
  v147[5] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 6);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v11;
  v150[1] = v123;
  v144[0] = CFSTR("label");
  v144[1] = CFSTR("forbiddenPartOfDay");
  v145[0] = CFSTR("Breakfast");
  v145[1] = &unk_1E84E3758;
  v144[2] = CFSTR("significantPartsOfDay");
  v144[3] = CFSTR("minimumNumberOfHighConfidenceScenes");
  v145[2] = &unk_1E84E3770;
  v145[3] = &unk_1E84E36C8;
  v144[4] = CFSTR("usePOIs");
  v144[5] = CFSTR("useNegativePOIs");
  v145[4] = v21;
  v145[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v150[2] = v22;
  v142[0] = CFSTR("label");
  v142[1] = CFSTR("forbiddenPartOfDay");
  v143[0] = CFSTR("Breakfast");
  v143[1] = &unk_1E84E3758;
  v142[2] = CFSTR("significantPartsOfDay");
  v142[3] = CFSTR("minimumNumberOfHighConfidenceScenes");
  v143[2] = &unk_1E84E3770;
  v23 = v21;
  v143[3] = &unk_1E84E3740;
  v142[4] = CFSTR("usePOIs");
  v142[5] = CFSTR("useNegativePOIs");
  v143[4] = v21;
  v143[5] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v150[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v127, "initWithArray:", v25);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumDurationCriterion1"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion1"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "intValue");

  v140[0] = CFSTR("label");
  v140[1] = CFSTR("significantPartsOfDay");
  v141[0] = CFSTR("Dinner");
  v141[1] = &unk_1E84E3728;
  v140[2] = CFSTR("forbiddenPartOfDay");
  v140[3] = CFSTR("allPartsOfDay");
  v141[2] = &unk_1E84E3788;
  v141[3] = &unk_1E84E37A0;
  v140[4] = CFSTR("minimumDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29 * 60.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v141[4] = v32;
  v140[5] = CFSTR("minimumNumberOfHighConfidenceScenes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v141[5] = v33;
  v141[6] = v23;
  v140[6] = CFSTR("usePOIs");
  v140[7] = CFSTR("useNegativePOIs");
  v141[7] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 8);
  v34 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumDurationCriterion2"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumDurationCriterion2"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    v39 = v38 * 60.0;
  }
  else
  {
    v39 = INFINITY;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion2"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)v26;
  if (v42)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion2"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "intValue");

  }
  else
  {
    v45 = 0x7FFFFFFFLL;
  }
  v138[0] = CFSTR("label");
  v138[1] = CFSTR("significantPartsOfDay");
  v139[0] = CFSTR("Dinner");
  v139[1] = &unk_1E84E3728;
  v138[2] = CFSTR("forbiddenPartOfDay");
  v138[3] = CFSTR("allPartsOfDay");
  v139[2] = &unk_1E84E3788;
  v139[3] = &unk_1E84E37A0;
  v138[4] = CFSTR("minimumDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v139[4] = v46;
  v138[5] = CFSTR("minimumNumberOfHighConfidenceScenes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v139[5] = v47;
  v139[6] = MEMORY[0x1E0C9AAB0];
  v138[6] = CFSTR("usePOIs");
  v138[7] = CFSTR("useNegativePOIs");
  v139[7] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 8);
  v48 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumDurationCriterion3"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumDurationCriterion3"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    v52 = v51;

    v53 = v52 * 60.0;
  }
  else
  {
    v53 = INFINITY;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion3"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion3"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "intValue");

  }
  else
  {
    v56 = 0x7FFFFFFFLL;
  }
  v136[0] = CFSTR("label");
  v136[1] = CFSTR("significantPartsOfDay");
  v137[0] = CFSTR("Dinner");
  v137[1] = &unk_1E84E3728;
  v136[2] = CFSTR("forbiddenPartOfDay");
  v136[3] = CFSTR("allPartsOfDay");
  v137[2] = &unk_1E84E3788;
  v137[3] = &unk_1E84E37A0;
  v136[4] = CFSTR("minimumDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v137[4] = v57;
  v136[5] = CFSTR("minimumNumberOfHighConfidenceScenes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v137[5] = v58;
  v137[6] = MEMORY[0x1E0C9AAA0];
  v136[6] = CFSTR("usePOIs");
  v136[7] = CFSTR("useNegativePOIs");
  v137[7] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 8);
  v59 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerCriteriaDefinitions"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)v34;
  v104 = (void *)v59;
  if (objc_msgSend(v60, "isEqualToString:", CFSTR("ThreeCriteria")))
  {
    objc_msgSend(v43, "addObject:", v34);
    v61 = v48;
    v62 = (void *)v59;
    v9 = v116;
  }
  else
  {
    v63 = objc_msgSend(v60, "isEqualToString:", CFSTR("TwoCriteria"));
    v61 = v34;
    v62 = (void *)v48;
    v9 = v116;
    if ((v63 & 1) == 0)
    {
      v62 = (void *)v34;
      if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Criterion1")) & 1) == 0)
      {
        v62 = (void *)v48;
        if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Criterion2")) & 1) == 0)
        {
          v62 = v104;
          if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Criterion3")) & 1) == 0)
            goto LABEL_21;
        }
      }
      goto LABEL_20;
    }
  }
  objc_msgSend(v43, "addObject:", v61);
LABEL_20:
  objc_msgSend(v43, "addObject:", v62);
LABEL_21:
  v100 = v60;
  v101 = (void *)v48;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v113 = (id)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v43;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v135, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v130;
    v114 = *(_QWORD *)v130;
    do
    {
      v67 = 0;
      v119 = v65;
      do
      {
        if (*(_QWORD *)v130 != v66)
          objc_enumerationMutation(obj);
        v68 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v67);
        objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("label"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "containsObject:", v69))
        {
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("significantPartsOfDay"));
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("forbiddenPartOfDay"));
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("allPartsOfDay"));
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("minimumDuration"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("minimumNumberOfHighConfidenceScenes"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "unsignedIntegerValue");

          if (v71 <= 1)
            v72 = 1;
          else
            v72 = v71;
          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("usePOIs"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "BOOLValue");

          objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("useNegativePOIs"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "BOOLValue");

          v77 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v69, v118, 0.6);
          v78 = v121;
          if (!v74)
            v78 = v117;
          v79 = v78;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DinnerSceneNodesCritererion3"));
          v80 = v11;
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (v81)
          {
            objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("DinnerSceneNodesCritererion3"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v82, "isEqualToString:", CFSTR("POISceneNodes")))
            {
              v83 = v121;

              v79 = v83;
            }
            v84 = v122;

          }
          else
          {
            v84 = v122;
          }
          v85 = objc_msgSend(v79, "count");
          if (v85)
          {
            v86 = v85;
            if (v74)
            {
              v87 = [PGMeaningfulEventCollectionTrait alloc];
              if ((v76 & 1) != 0)
                v88 = -[PGMeaningfulEventCollectionTrait initWithNodes:negativeNodes:](v87, "initWithNodes:negativeNodes:", v111, v109);
              else
                v88 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v87, "initWithNodes:", v111);
              v90 = v88;
              -[PGMeaningfulEventTrait setMinimumScore:](v88, "setMinimumScore:", 0.7);
              -[PGMeaningfulEventCriteria setPoisTrait:](v77, "setPoisTrait:", v90);
              v89 = 1.0 / (double)v86;

            }
            else
            {
              -[PGMeaningfulEventCriteria setLocationsTrait:](v77, "setLocationsTrait:", v110);
              v89 = 2.0 / (double)v86;
              -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v77, "setMustBeInteresting:", 1);
            }
            v91 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v79, v112);
            -[PGMeaningfulEventTrait setMinimumScore:](v91, "setMinimumScore:", v89);
            -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v91, "setMinimumNumberOfHighConfidenceAssets:", v72);
            -[PGMeaningfulEventSceneCollectionTrait setAccumulateHighConfidenceAssetCounts:](v91, "setAccumulateHighConfidenceAssetCounts:", 1);
            -[PGMeaningfulEventCriteria setScenesTrait:](v77, "setScenesTrait:", v91);
            v92 = objc_msgSend(v128, "unsignedIntegerValue");
            if (v126)
              v93 = objc_msgSend(v126, "unsignedIntegerValue");
            else
              v93 = 1;
            v94 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:forbiddenPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:forbiddenPartOfDay:", v92, v93);
            -[PGMeaningfulEventTrait setMinimumScore:](v94, "setMinimumScore:", 0.75);
            -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v77, "setSignificantPartsOfDayTrait:", v94);
            if (v124)
            {
              v95 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:forbiddenPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:forbiddenPartOfDay:", objc_msgSend(v124, "unsignedIntegerValue"), 1);
              -[PGMeaningfulEventTrait setMinimumScore:](v95, "setMinimumScore:", 0.75);
              -[PGMeaningfulEventCriteria setAllPartsOfDayTrait:](v77, "setAllPartsOfDayTrait:", v95);

            }
            v84 = v122;
            if (v122)
            {
              v96 = [PGMeaningfulEventNumberTrait alloc];
              objc_msgSend(v122, "doubleValue");
              v97 = -[PGMeaningfulEventNumberTrait initWithNumberValue:](v96, "initWithNumberValue:");
              -[PGMeaningfulEventTrait setMinimumScore:](v97, "setMinimumScore:", 1.0);
              -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v77, "setMinimumDurationTrait:", v97);

            }
            objc_msgSend(v113, "objectForKeyedSubscript:", v69);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v98)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "setObject:forKeyedSubscript:", v98, v69);
            }
            objc_msgSend(v98, "addObject:", v77);

          }
          v11 = v115;
          v9 = v116;
          v65 = v119;
          v66 = v114;
        }

        ++v67;
      }
      while (v65 != v67);
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v135, 16);
    }
    while (v65);
  }

  v41 = v107;
  v40 = v108;
  v15 = v103;
  v19 = v111;
LABEL_58:

  return v113;
}

+ (id)_hikingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PGMeaningfulEventRequiredCriteria *v19;
  PGMeaningfulEventSceneCollectionTrait *v20;
  PGMeaningfulEventCollectionTrait *v21;
  PGMeaningfulEventLocationMobilityTrait *v22;
  void *v23;
  PGMeaningfulEventRequiredCriteria *v24;
  PGMeaningfulEventCollectionTrait *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_hikingSceneNodesWithGraph:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("Hiking");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = CFSTR("Mountain");
  v34[1] = CFSTR("Nature");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphROINodeCollection roiNodesForLabels:inGraph:](PGGraphROINodeCollection, "roiNodesForLabels:inGraph:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") && (objc_msgSend(v10, "count") || objc_msgSend(v12, "count")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("gown"), CFSTR("suit"), CFSTR("necktie"), CFSTR("vineyard"), CFSTR("cycling"), CFSTR("bicycle"), CFSTR("golf"), CFSTR("skydiving"), CFSTR("sport"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneNodesForSceneNames:", v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_winterSportSceneNodesWithGraph:sceneTaxonomy:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionByFormingUnionWith:", v14);
    v32 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_beachingSceneNodesWithGraph:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionByFormingUnionWith:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_divingSceneNodesWithGraph:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionByFormingUnionWith:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v7;
    v19 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Hiking"), v6, 0.4);
    v20 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v8, v28);
    -[PGMeaningfulEventTrait setMinimumScore:](v20, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v8, "count"));
    -[PGMeaningfulEventCriteria setScenesTrait:](v19, "setScenesTrait:", v20);
    v30 = v12;
    v21 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v12);
    -[PGMeaningfulEventTrait setMinimumScore:](v21, "setMinimumScore:", 0.5);
    -[PGMeaningfulEventCriteria setRoisTrait:](v19, "setRoisTrait:", v21);
    v22 = -[PGMeaningfulEventLocationMobilityTrait initWithMobility:]([PGMeaningfulEventLocationMobilityTrait alloc], "initWithMobility:", 1);
    -[PGMeaningfulEventTrait setMinimumScore:](v22, "setMinimumScore:", 0.9);
    -[PGMeaningfulEventCriteria setLocationMobilityTrait:](v19, "setLocationMobilityTrait:", v22);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingFrequentLocationsForGraph:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v19, "setLocationsTrait:", v23);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v19, "setMustBeInteresting:", 1);
    v24 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Hiking"), v6, 0.4);
    -[PGMeaningfulEventTrait setMinimumScore:](v20, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v8, "count"));
    -[PGMeaningfulEventCriteria setScenesTrait:](v24, "setScenesTrait:", v20);
    v25 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v32);
    -[PGMeaningfulEventTrait setMinimumScore:](v25, "setMinimumScore:", 0.5);
    -[PGMeaningfulEventCriteria setPoisTrait:](v24, "setPoisTrait:", v25);
    -[PGMeaningfulEventTrait setMinimumScore:](v22, "setMinimumScore:", 0.9);
    -[PGMeaningfulEventCriteria setLocationMobilityTrait:](v24, "setLocationMobilityTrait:", v22);
    -[PGMeaningfulEventCriteria setLocationsTrait:](v24, "setLocationsTrait:", v23);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v24, "setMustBeInteresting:", 1);
    v33[0] = v19;
    v33[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v31;
    v10 = v32;

    v12 = v30;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)_climbingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGMeaningfulEventRequiredCriteria *v12;
  PGMeaningfulEventCollectionTrait *v13;
  PGMeaningfulEventNumberTrait *v14;
  void *v15;
  void *v16;
  void *v17;
  PGMeaningfulEventSceneCollectionTrait *v18;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("rock_climbing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneNodesForSceneNames:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("Mountain");
  v21[1] = CFSTR("Nature");
  v21[2] = CFSTR("Beach");
  v21[3] = CFSTR("Water");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphROINodeCollection roiNodesForLabels:inGraph:](PGGraphROINodeCollection, "roiNodesForLabels:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") && objc_msgSend(v11, "count"))
  {
    v12 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Climbing"), v6, 0.4);
    v13 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v11);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 0.25);
    -[PGMeaningfulEventCriteria setRoisTrait:](v12, "setRoisTrait:", v13);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingFrequentLocationsForGraph:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v12, "setLocationsTrait:", v20);
    v14 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 1.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v12, "setNumberOfPeopleTrait:", v14);
    objc_msgSend(a1, "_winterSportSceneNodesWithGraph:sceneTaxonomy:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_divingSceneNodesWithGraph:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionByFormingUnionWith:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v9, v17);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v18, "setMinimumNumberOfHighConfidenceAssets:", 4);
    -[PGMeaningfulEventTrait setMinimumScore:](v18, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumRatioOfHighConfidenceAssets:](v18, "setMinimumRatioOfHighConfidenceAssets:", 0.5);
    -[PGMeaningfulEventCriteria setScenesTrait:](v12, "setScenesTrait:", v18);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v12, "setMustBeInteresting:", 1);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_beachingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGMeaningfulEventRequiredCriteria *v16;
  PGMeaningfulEventSceneCollectionTrait *v17;
  PGMeaningfulEventCollectionTrait *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_beachingSceneNodesWithGraph:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("Beach");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphROINodeCollection roiNodesForLabels:inGraph:](PGGraphROINodeCollection, "roiNodesForLabels:inGraph:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") && objc_msgSend(v10, "count"))
  {
    objc_msgSend(a1, "_winterSportSceneNodesWithGraph:sceneTaxonomy:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_negativeHikingSceneNodesWithGraph:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionByFormingUnionWith:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_negativeSceneNodesForBeachingWithGraph:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionByFormingUnionWith:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Beaching"), v6, 0.4);
    v17 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v8, v15);
    -[PGMeaningfulEventTrait setMinimumScore:](v17, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v8, "count"));
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v17, "setMinimumNumberOfHighConfidenceAssets:", 2);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfNegativeHighConfidenceAssets:](v17, "setMinimumNumberOfNegativeHighConfidenceAssets:", 4);
    -[PGMeaningfulEventCriteria setScenesTrait:](v16, "setScenesTrait:", v17);
    v18 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v10);
    -[PGMeaningfulEventTrait setMinimumScore:](v18, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setRoisTrait:](v16, "setRoisTrait:", v18);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingFrequentLocationsForGraph:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v16, "setLocationsTrait:", v19);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v16, "setMustBeInteresting:", 1);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_entertainmentCriteriaWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGMeaningfulEventRequiredCriteria *v8;
  PGMeaningfulEventSceneCollectionTrait *v9;
  PGMeaningfulEventCollectionTrait *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("zoo"), CFSTR("aquarium"), CFSTR("underwater"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneNodesForSceneNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("Entertainment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") && objc_msgSend(v7, "count"))
  {
    v8 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Entertainment"), v3, 0.4);
    v9 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v5);
    -[PGMeaningfulEventTrait setMinimumScore:](v9, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v5, "count"));
    -[PGMeaningfulEventCriteria setScenesTrait:](v8, "setScenesTrait:", v9);
    v10 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v7);
    -[PGMeaningfulEventTrait setMinimumScore:](v10, "setMinimumScore:", 0.7);
    -[PGMeaningfulEventCriteria setPoisTrait:](v8, "setPoisTrait:", v10);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v8, "setLocationsTrait:", v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_amusementParkCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGMeaningfulEventRequiredCriteria *v16;
  PGMeaningfulEventCollectionTrait *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGMeaningfulEventSceneCollectionTrait *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_specialAmusementParkCriteriaWithGraph:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeForName:", CFSTR("amusement_park"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __110__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
    v25[3] = &unk_1E84331B0;
    v26 = v11;
    objc_msgSend(v12, "traverseChildrenUsingNameBlock:", v25);

  }
  objc_msgSend(v6, "sceneNodesForSceneNames:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("AmusementPark");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") && objc_msgSend(v15, "count"))
  {
    v16 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("AmusementPark"), v6, 0.4);
    v24 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:", v13);
    -[PGMeaningfulEventTrait setMinimumScore:](v24, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v13, "count"));
    -[PGMeaningfulEventCriteria setScenesTrait:](v16, "setScenesTrait:", v24);
    v17 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v15);
    -[PGMeaningfulEventTrait setMinimumScore:](v17, "setMinimumScore:", 0.7);
    -[PGMeaningfulEventCriteria setPoisTrait:](v16, "setPoisTrait:", v17);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v6);
    v18 = v12;
    v19 = v11;
    v20 = v10;
    v21 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v16, "setLocationsTrait:", v22);
    objc_msgSend(v21, "addObject:", v16);

    v9 = v21;
    v10 = v20;
    v11 = v19;
    v12 = v18;

  }
  return v9;
}

+ (id)_specialAmusementParkCriteriaWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PGMeaningfulEventRequiredCriteria *v6;
  PGMeaningfulEventCollectionTrait *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = CFSTR("AmusementPark");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("AmusementPark"), v3, 0.4);
    v7 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", v5);
    -[PGMeaningfulEventTrait setMinimumScore:](v7, "setMinimumScore:", 0.7);
    -[PGMeaningfulEventCollectionTrait setAdditionalMatchingBlock:](v7, "setAdditionalMatchingBlock:", &__block_literal_global_368);
    -[PGMeaningfulEventCriteria setPoisTrait:](v6, "setPoisTrait:", v7);
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:](PGMeaningfulEventRequiredCriteriaFactory, "locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningfulEventCriteria setLocationsTrait:](v6, "setLocationsTrait:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_socialGroupGatheringCriteriaWithGraph:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  PGMeaningfulEventRequiredCriteria *v27;
  PGMeaningfulEventCollectionTrait *v28;
  void *v29;
  PGMeaningfulEventCollectionTrait *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  objc_msgSend(v37, "meNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localIdentifier", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = 2;
    else
      v5 = 3;

  }
  else
  {
    v5 = 3;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke;
  v55[3] = &unk_1E842AAB8;
  v57 = v5;
  v35 = v6;
  v56 = v35;
  objc_msgSend(v37, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("SocialGroup"), 302, v55);
  v8 = v35;
  v9 = objc_msgSend(v35, "count");
  if (v9 >= 2)
  {
    v51 = 0;
    v52 = (double *)&v51;
    v53 = 0x2020000000;
    v54 = 0;
    if (v9 > 3)
    {
      v46[0] = v7;
      v46[1] = 3221225472;
      v46[2] = __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3;
      v46[3] = &unk_1E842AB20;
      v46[4] = &v51;
      objc_msgSend(MEMORY[0x1E0D4B128], "calculateStandardDeviationForItems:valueBlock:result:", v35, &__block_literal_global_374, v46);
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v11 = v35;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v48 != v14)
              objc_enumerationMutation(v11);
            v13 += objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "numberOfMomentNodes");
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        }
        while (v12);
        v16 = (double)v13 * 0.65;
      }
      else
      {
        v16 = 0.0;
      }

      v52[3] = ceil(v16);
      v8 = v35;
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = (void *)objc_msgSend(v8, "copy");
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          v22 = (double)(unint64_t)objc_msgSend(v21, "numberOfMomentNodes");
          if (v52[3] <= v22)
            objc_msgSend(v35, "removeObject:", v21);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
      }
      while (v18);
    }

    _Block_object_dispose(&v51, 8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v35;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
          v27 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Gathering"), v37, 0.01);
          v28 = [PGMeaningfulEventCollectionTrait alloc];
          objc_msgSend(v26, "collection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v28, "initWithNodes:", v29);
          -[PGMeaningfulEventCriteria setSocialGroupsTrait:](v27, "setSocialGroupsTrait:", v30);

          -[PGMeaningfulEventCriteria socialGroupsTrait](v27, "socialGroupsTrait");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setMinimumScore:", 1.0);

          -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v27, "setMustBeInteresting:", 1);
          objc_msgSend(v10, "addObject:", v27);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
      }
      while (v23);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_sportEventScenesTraitWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGMeaningfulEventSceneCollectionTrait *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("sumo"), CFSTR("badminton"), CFSTR("softball"), CFSTR("soccer"), CFSTR("cricket_sport"), CFSTR("rugby"), CFSTR("scoreboard"), CFSTR("tennis"), CFSTR("cheerleading"), CFSTR("polo"), CFSTR("hockey"), CFSTR("football"), CFSTR("grand_prix"), CFSTR("jockey_horse"), CFSTR("wrestling"), CFSTR("baseball"), CFSTR("motorsport"),
    CFSTR("basketball"),
    CFSTR("rink"),
    CFSTR("arena"),
    CFSTR("motocross"),
    CFSTR("stadium"),
    CFSTR("ballgames"),
    0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneNodesForSceneNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("amusement_park"), CFSTR("graduation"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneNodesForSceneNames:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v5, v7);
    -[PGMeaningfulEventTrait setMinimumScore:](v8, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(v5, "count"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_winterSportSceneNodesWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  objc_msgSend(a4, "nodeForName:", CFSTR("winter_sport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("winter_sport"), CFSTR("ski_boot"), CFSTR("snowshoe"), CFSTR("ski_equipment"), CFSTR("snowboard"), CFSTR("snowmobile"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke;
    v11[3] = &unk_1E84331B0;
    v12 = v7;
    v8 = v7;
    objc_msgSend(v6, "traverseChildrenUsingNameBlock:", v11);
    objc_msgSend(v5, "sceneNodesForSceneNames:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_beachingSceneNodesWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("beach"), CFSTR("surfing"), CFSTR("surfboard"), CFSTR("mollusk"), CFSTR("shore"), CFSTR("folding_chair"), CFSTR("jetski"), CFSTR("windsurfing"), CFSTR("barnacle"), CFSTR("sand"), CFSTR("skating"), CFSTR("lighthouse"), CFSTR("swimsuit"), CFSTR("sandcastle"), CFSTR("sunbathing"), CFSTR("watersport"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_negativeSceneNodesForBeachingWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("snow"), CFSTR("blizzard"), CFSTR("snowball"), CFSTR("snowman"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_divingSceneNodesWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("diving"), CFSTR("underwater"), CFSTR("submarine_water"), CFSTR("scuba"), CFSTR("wetsuit"), CFSTR("coral_reef"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_hikingSceneNodesWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("hiking"), CFSTR("mountain"), CFSTR("canyon"), CFSTR("volcano"), CFSTR("glacier"), CFSTR("cliff"), CFSTR("waterfall"), CFSTR("forest"), CFSTR("desert"), CFSTR("hill"), CFSTR("trail"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_negativeHikingSceneNodesWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("hiking"), CFSTR("canyon"), CFSTR("volcano"), CFSTR("cliff"), CFSTR("waterfall"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_weddingSceneNodesWithGraph:(id)a3 includeWedding:(BOOL)a4 sceneTaxonomy:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99E20];
  v9 = a3;
  objc_msgSend(v8, "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
    objc_msgSend(v10, "addObject:", CFSTR("wedding"));
  objc_msgSend(v7, "nodeForName:", CFSTR("wedding"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke;
  v16[3] = &unk_1E84331B0;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "visitChildrenUsingNameBlock:", v16);
  objc_msgSend(v9, "sceneNodesForSceneNames:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_concertSceneNodesInGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("concert"), CFSTR("singer"), CFSTR("deejay"), CFSTR("orchestra"), CFSTR("musical_instrument"), CFSTR("speakers_music"), CFSTR("microphone"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_museumSceneTraitInGraph:(id)a3 minimumNumberOfHighConfidenceAssets:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  PGMeaningfulEventSceneCollectionTrait *v11;
  unint64_t v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(a1, "_museumSceneNodesInGraph:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a1, "_negativeMuseumSceneNodesInGraph:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", v7, v10);
    -[PGMeaningfulEventTrait setMinimumScore:](v11, "setMinimumScore:", 1.0 / (double)v9);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v11, "setMinimumNumberOfHighConfidenceAssets:", a4);
    v12 = vcvtas_u32_f32((float)a4 * 0.5);
    if (v12 <= 1)
      v13 = 1;
    else
      v13 = v12;
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfNegativeHighConfidenceAssets:](v11, "setMinimumNumberOfNegativeHighConfidenceAssets:", v13);
    -[PGMeaningfulEventSceneCollectionTrait setAccumulateHighConfidenceAssetCounts:](v11, "setAccumulateHighConfidenceAssetCounts:", 1);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_museumSceneNodesInGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("illustrations"), CFSTR("painting"), CFSTR("museum"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_negativeMuseumSceneNodesInGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("food"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneNodesForSceneNames:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_publicEventCriteriaForCategoryWithName:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  __CFString **v11;
  PGMeaningfulEventRequiredCriteria *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  NSObject *v25;
  PGMeaningfulEventCollectionTrait *v26;
  void *v27;
  PGMeaningfulEventCollectionTrait *v28;
  void *v30;
  int v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "anyNodeForLabel:domain:", v5, 901);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    v10 = 0.4;
    if ((v9 & 1) != 0)
    {
      v11 = kPGGraphNodeMeaningMuseum;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4B228], "dance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {
        v11 = kPGGraphNodeMeaningDance;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          v11 = kPGGraphNodeMeaningFestival;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v5, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
          {
            v11 = kPGGraphNodeMeaningConcert;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v5, "isEqualToString:", v19);

            if ((v20 & 1) != 0)
            {
              v11 = kPGGraphNodeMeaningNightOut;
              v10 = 0.6;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D4B228], "sports");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v5, "isEqualToString:", v21);

              if ((v22 & 1) != 0)
              {
                v11 = kPGGraphNodeMeaningSportEvent;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D4B228], "theater");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v5, "isEqualToString:", v23);

                if ((v24 & 1) == 0)
                {
                  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "loggingConnection");
                  v25 = objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    v31 = 138412290;
                    v32 = v5;
                    _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "Not handling category with name %@", (uint8_t *)&v31, 0xCu);
                  }
                  v12 = 0;
                  goto LABEL_18;
                }
                v11 = kPGGraphNodeMeaningTheater;
              }
            }
          }
        }
      }
    }
    v25 = *v11;
    v12 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v25, v6, v10);
    v26 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v7, "collection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v26, "initWithNodes:", v27);

    -[PGMeaningfulEventTrait setMinimumScore:](v28, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setPublicEventCategoriesTrait:](v12, "setPublicEventCategoriesTrait:", v28);

LABEL_18:
    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

uint64_t __116__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

uint64_t __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

void __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "numberOfMemberNodes") >= *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

double __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3(uint64_t a1, double a2, double a3)
{
  double result;

  result = a2 + a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  return (double)(unint64_t)objc_msgSend(a2, "numberOfMomentNodes");
}

BOOL __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__specialAmusementParkCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v4 = a2;
  objc_msgSend(a3, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOIEdge filterSpecial](PGGraphPOIEdge, "filterSpecial");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphPOIEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count") != 0;
  return v8;
}

uint64_t __110__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

uint64_t __134__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy_params___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

void __89__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  PGMeaningfulEventRequiredCriteria *v5;
  PGMeaningfulEventCollectionTrait *v6;
  double v7;
  void *v8;
  PGMeaningfulEventCollectionTrait *v9;
  void *v10;
  PGMeaningfulEventCollectionTrait *v11;
  void *v12;
  id v13;

  v3 = objc_msgSend(a2, "calendarUnitValue");
  if (*(_QWORD *)(a1 + 64) != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setYear:", v3);
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", *(_QWORD *)(a1 + 32), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dateNodeForLocalDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", CFSTR("Anniversary"), *(_QWORD *)(a1 + 40), 0.5);
      v6 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventCollectionTrait alloc], "initWithNodes:", *(_QWORD *)(a1 + 48));
      -[PGMeaningfulEventCriteria setPeopleTrait:](v5, "setPeopleTrait:", v6);

      v7 = 1.0 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "count");
      -[PGMeaningfulEventCriteria peopleTrait](v5, "peopleTrait");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMinimumScore:", v7);

      v9 = [PGMeaningfulEventCollectionTrait alloc];
      objc_msgSend(v4, "collection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v9, "initWithNodes:", v10);
      -[PGMeaningfulEventCriteria setDatesTrait:](v5, "setDatesTrait:", v11);

      -[PGMeaningfulEventCriteria datesTrait](v5, "datesTrait");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMinimumScore:", 1.0);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
    }

  }
}

uint64_t __89__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(a2, "numberOfMomentNodes");
  v6 = objc_msgSend(v4, "numberOfMomentNodes");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

uint64_t __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

BOOL __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (objc_msgSend(v5, "containsNode:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2;
    v11[3] = &unk_1E842AA08;
    v8 = v7;
    v12 = v8;
    v13 = &v14;
    objc_msgSend(v6, "enumeratePreciseAddressNodesUsingBlock:", v11);

  }
  v9 = *((_BYTE *)v15 + 24) == 0;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "areaNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3;
  v9[3] = &unk_1E842A9E0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a3;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

}

void __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  char v5;
  _BYTE *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
    v5 = objc_msgSend(v7, "diameterIsLargerThanDiameter:", 4000.0);
    v6 = *(_BYTE **)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
    *v6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, BOOL, id, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  v3 = a2;
  objc_msgSend(v3, "birthdayDateComponents");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "potentialBirthdayDateComponents");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 | v5)
  {
    if (v4)
      v7 = (void *)v4;
    else
      v7 = (void *)v5;
    v8 = v7;
    v9 = objc_msgSend(v8, "year");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = a1[4];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2;
    v27[3] = &unk_1E842A968;
    v32 = v9;
    v14 = v8;
    v28 = v14;
    v29 = a1[4];
    v15 = v10;
    v30 = v15;
    v16 = v11;
    v31 = v16;
    objc_msgSend(v13, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Year"), 400, v27);
    aBlock[0] = v12;
    aBlock[1] = 3221225472;
    aBlock[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4;
    aBlock[3] = &unk_1E842A990;
    v22 = a1[4];
    v23 = v3;
    v24 = a1[5];
    v25 = a1[6];
    v26 = a1[7];
    v17 = (void (**)(void *, BOOL, id, _QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v15, "count"))
    {
      v17[2](v17, v4 != 0, v15, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(a1[8], "addObject:", v18);
      v17[2](v17, v4 != 0, v15, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(a1[9], "addObject:", v19);

    }
    if (objc_msgSend(v16, "count"))
    {
      v17[2](v17, 0, v16, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(a1[8], "addObject:", v20);

    }
  }

}

uint64_t __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  id v22;
  double v23;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  v5 = objc_msgSend(v3, "calendarUnitValue");
  if (v5 > *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "setYear:", v5);
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", *(_QWORD *)(a1 + 32), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dateNodeForLocalDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    if ((objc_msgSend(MEMORY[0x1E0D4B148], "isWeekendDate:", v6) & 1) == 0)
    {
      v22 = 0;
      v23 = 0.0;
      v8 = objc_msgSend(MEMORY[0x1E0D4B148], "nextWeekendLocalStartDate:interval:options:afterDate:", &v22, &v23, 0, v6);
      v9 = v22;
      v10 = v9;
      if (v8)
      {
        objc_msgSend(v9, "dateByAddingTimeInterval:", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v10;
        v12 = v10;
        if (objc_msgSend(v12, "compare:", v11) == 1)
        {
          v13 = v12;
        }
        else
        {
          do
          {
            objc_msgSend(*(id *)(a1 + 40), "dateNodeForLocalDate:", v12, v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14 && (!v7 || (objc_msgSend(v14, "isSameNodeAsNode:", v7) & 1) == 0))
            {
              v18 = 0;
              v19 = &v18;
              v20 = 0x2020000000;
              v21 = 0;
              v17[0] = MEMORY[0x1E0C809B0];
              v17[1] = 3221225472;
              v17[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3;
              v17[3] = &unk_1E842FD68;
              v17[4] = &v18;
              objc_msgSend(v15, "enumerateHolidayNodesUsingBlock:", v17);
              if (!*((_BYTE *)v19 + 24))
                objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
              _Block_object_dispose(&v18, 8);
            }
            objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = v13;
          }
          while (objc_msgSend(v13, "compare:", v11) != 1);
        }

        v10 = v16;
      }

    }
  }
  objc_autoreleasePoolPop(v4);

}

PGMeaningfulEventRequiredCriteria *__144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4(uint64_t a1, int a2, void *a3, int a4)
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  PGMeaningfulEventRequiredCriteria *v10;
  PGMeaningfulEventCollectionTrait *v11;
  void *v12;
  PGMeaningfulEventCollectionTrait *v13;
  PGMeaningfulEventCollectionTrait *v14;
  PGGraphDateNodeCollection *v15;
  PGMeaningfulEventCollectionTrait *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  PGMeaningfulEventRequiredCriteria *v26;
  PGMeaningfulEventSceneCollectionTrait *v27;
  PGMeaningfulEventNumberTrait *v28;
  uint64_t v29;
  PGMeaningfulEventSceneCollectionTrait *v30;
  PGMeaningfulEventPartOfDayTrait *v31;
  void *v32;
  __CFString *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = CFSTR("Birthday");
  if (a4)
    v8 = CFSTR("WeakBirthday");
  v9 = v8;
  v10 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, *(_QWORD *)(a1 + 32), 0.4);
  v11 = [PGMeaningfulEventCollectionTrait alloc];
  objc_msgSend(*(id *)(a1 + 40), "collection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v11, "initWithNodes:", v12);
  -[PGMeaningfulEventCriteria setPeopleTrait:](v10, "setPeopleTrait:", v13);

  v14 = [PGMeaningfulEventCollectionTrait alloc];
  v15 = -[MAElementCollection initWithSet:graph:]([PGGraphDateNodeCollection alloc], "initWithSet:graph:", v7, *(_QWORD *)(a1 + 32));
  v16 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v14, "initWithNodes:", v15);
  -[PGMeaningfulEventCriteria setDatesTrait:](v10, "setDatesTrait:", v16);

  -[PGMeaningfulEventCriteria peopleTrait](v10, "peopleTrait");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMinimumScore:", 1.0);

  -[PGMeaningfulEventCriteria datesTrait](v10, "datesTrait");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMinimumScore:", 1.0);

  if (a2)
  {
    v34 = v9;
    -[PGMeaningfulEventRequiredCriteria setAdditionalInfoForKey:value:](v10, "setAdditionalInfoForKey:value:", CFSTR("birthday.isOnDate"), MEMORY[0x1E0C9AAB0]);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v36;
LABEL_6:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v23), "localDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(MEMORY[0x1E0D4B148], "isWeekendDate:", v24);

        if ((v25 & 1) != 0)
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v21)
            goto LABEL_6;
          goto LABEL_12;
        }
      }

      v9 = v34;
      if ((a4 & 1) != 0)
        goto LABEL_20;
      v29 = objc_msgSend(*(id *)(a1 + 48), "count");
      v30 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      -[PGMeaningfulEventTrait setMinimumScore:](v30, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"));
      -[PGMeaningfulEventCriteria setScenesTrait:](v10, "setScenesTrait:", v30);

      if (v29)
        goto LABEL_20;
      goto LABEL_18;
    }
LABEL_12:

    if ((a4 & 1) != 0)
    {
      v26 = 0;
      v9 = v34;
      goto LABEL_23;
    }
    v31 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 56);
    -[PGMeaningfulEventTrait setMinimumScore:](v31, "setMinimumScore:", 0.2);
    -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v10, "setSignificantPartsOfDayTrait:", v31);

    v9 = v34;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 64), "count"))
    {
LABEL_18:
      v26 = 0;
      goto LABEL_23;
    }
    v27 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:]([PGMeaningfulEventSceneCollectionTrait alloc], "initWithNodes:negativeNodes:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    -[PGMeaningfulEventTrait setMinimumScore:](v27, "setMinimumScore:", 1.0 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "count"));
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v27, "setMinimumNumberOfHighConfidenceAssets:", 2);
    -[PGMeaningfulEventCriteria setScenesTrait:](v10, "setScenesTrait:", v27);
    v28 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 5.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v28, "setMinimumScore:", 1.0);
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v10, "setNumberOfPeopleTrait:", v28);

  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "length"))
    -[PGMeaningfulEventRequiredCriteria setAdditionalInfoForKey:value:](v10, "setAdditionalInfoForKey:value:", CFSTR("personLocalIdentifier"), v32);
  v26 = v10;

LABEL_23:
  return v26;
}

unint64_t __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  unint64_t result;

  result = objc_msgSend(a2, "category");
  if (result <= 4 && ((1 << result) & 0x16) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __132__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__requiredCriteriaForIdentifiers_inferenceType_graph_sceneTaxonomy_params___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7, v9, v10);

  }
}

@end
