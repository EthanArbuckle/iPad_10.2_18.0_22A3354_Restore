@implementation PGMemoryFeatureBlocking

+ (id)blockableFeaturesForFeatureNodes:(id)a3 momentNodes:(id)a4 memoryCategory:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_blockableHolidayFeatureForFeatureNodes:momentNodes:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "addObject:", v11);
  objc_msgSend(a1, "_blockableDateFeatureForFeatureNodes:momentNodes:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "addObject:", v12);
  }
  else
  {
    objc_msgSend(a1, "_blockableDateIntervalFeatureForFeatureNodes:momentNodes:memoryCategory:", v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v10, "addObject:", v13);

  }
  objc_msgSend(a1, "_blockableLocationFeatureForFeatureNodes:momentNodes:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v10, "addObject:", v14);
  objc_msgSend(a1, "_blockablePersonFeatureForFeatureNodes:momentNodes:", v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v10, "addObject:", v15);

  return v10;
}

+ (id)_blockableHolidayFeatureForFeatureNodes:(id)a3 momentNodes:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count") && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "celebratedHolidayNodes");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (objc_msgSend(v6, "count") == 1)
  {
    v8 = (void *)MEMORY[0x1E0CD1648];
    objc_msgSend(v6, "anyNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeMemoryFeatureWithHolidayForName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_blockableDateFeatureForFeatureNodes:(id)a3 momentNodes:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "dateNodes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = (void *)MEMORY[0x1E0CD1648];
    objc_msgSend(v4, "anyNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeMemoryFeatureWithDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_blockableDateIntervalFeatureForFeatureNodes:(id)a3 momentNodes:(id)a4 memoryCategory:(unint64_t)a5
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = PGMemorySourceTypeFromCategory(a5);
  if (v7 <= 4 && ((1 << v7) & 0x19) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "universalDateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1648], "timeMemoryFeatureWithDateInterval:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)_blockableLocationFeatureForFeatureNodes:(id)a3 momentNodes:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a1, "_blockableLocationFeatureForFeatureNodes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(a1, "_blockableLocationFeatureForMomentNodes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_blockableLocationFeatureForFeatureNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[PGGraphNodeCollection subsetInCollection:](PGGraphAreaNodeCollection, "subsetInCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = (void *)MEMORY[0x1E0CD1648];
    objc_msgSend(v4, "anyNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationMemoryFeatureWithAreaForName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphAddressNodeCollection, "subsetInCollection:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v9 = (void *)MEMORY[0x1E0CD1648];
    objc_msgSend(v6, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationMemoryFeatureWithLocation:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v8;
}

+ (id)_blockableLocationFeatureForMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(a1, "_bestAddressNodeAsCollectionInMomentNodeAsCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      v12 = 0;
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v5, "areaNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nonBlockedAreaNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") == 1)
    {
      v9 = (void *)MEMORY[0x1E0CD1648];
      objc_msgSend(v8, "anyNode");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationMemoryFeatureWithAreaForName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v6;
      if (objc_msgSend(v10, "count") != 1)
      {
        v12 = 0;
        goto LABEL_11;
      }
      v13 = (void *)MEMORY[0x1E0CD1648];
      objc_msgSend(v10, "locations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationMemoryFeatureWithLocation:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:

    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

+ (id)_bestAddressNodeAsCollectionInMomentNodeAsCollection:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__45597;
  v17 = __Block_byref_object_dispose__45598;
  v18 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  objc_msgSend(v3, "preciseAddressNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PGMemoryFeatureBlocking__bestAddressNodeAsCollectionInMomentNodeAsCollection___block_invoke;
  v8[3] = &unk_1E842F368;
  v5 = v3;
  v9 = v5;
  v10 = v12;
  v11 = &v13;
  objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v8);
  v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

+ (id)_blockablePersonFeatureForFeatureNodes:(id)a3 momentNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_blockablePetFeatureForFeatureNodes:momentNodes:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count") && objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "personNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") == 1)
      {
        v13 = v11;
        v11 = v12;
      }
      else
      {
        objc_msgSend(a1, "_prominentPersonNodeAsCollectionInMomentNodeAsCollection:withPersonNodes:maximumNumberOfPersonsAllowed:minimumPresenceThreshold:maximumOthersPresenceThreshold:", v7, v12, 3, 0.8, 0.2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v13 = v14;

          v11 = v13;
        }
        else
        {
          v13 = 0;
        }
      }

    }
    objc_msgSend(v7, "graph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "collectionBySubtracting:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count") == 1)
    {
      v18 = (void *)MEMORY[0x1E0CD1648];
      objc_msgSend(v17, "localIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "peopleMemoryFeatureWithPersonLocalIdentifier:", v20);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

+ (id)_prominentPersonNodeAsCollectionInMomentNodeAsCollection:(id)a3 withPersonNodes:(id)a4 maximumNumberOfPersonsAllowed:(unint64_t)a5 minimumPresenceThreshold:(double)a6 maximumOthersPresenceThreshold:(double)a7
{
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v11 = a3;
  v12 = a4;
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__45597;
    v28 = __Block_byref_object_dispose__45598;
    v29 = 0;
    if (v13 <= a5)
    {
      v15 = objc_msgSend(v11, "numberOfAssets");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __186__PGMemoryFeatureBlocking__prominentPersonNodeAsCollectionInMomentNodeAsCollection_withPersonNodes_maximumNumberOfPersonsAllowed_minimumPresenceThreshold_maximumOthersPresenceThreshold___block_invoke;
      v18[3] = &unk_1E842F390;
      v19 = v11;
      v20 = &v24;
      v21 = v15;
      v22 = a6;
      v23 = a7;
      objc_msgSend(v12, "enumerateIdentifiersAsCollectionsWithBlock:", v18);

      v14 = (void *)v25[5];
    }
    v16 = v14;
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_blockablePetFeatureForFeatureNodes:(id)a3 momentNodes:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count") == 1)
  {
    v6 = (void *)MEMORY[0x1E0CD1648];
    objc_msgSend(v5, "anyNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "peopleMemoryFeatureWithPersonLocalIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)momentNodesWithBlockedFeatureInGraph:(id)a3 userFeedbackCalculator:(id)a4 loggingConnection:(id)a5 progressReporter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "dataCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "areaNamesWithNegativeFeedback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "holidayNamesWithNegativeFeedback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "datesWithNegativeFeedback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personUUIDsWithNegativeFeedback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "locationsWithNegativeFeedback");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_momentNodesWithBlockedFeatureInGraph:areaNamesWithNegativeFeedback:holidayNamesWithNegativeFeedback:datesWithNegativeFeedback:personUUIDsWithNegativeFeedback:locationsWithNegativeFeedback:loggingConnection:progressReporter:", v13, v15, v16, v17, v18, v19, v11, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_momentNodesWithBlockedFeatureInGraph:(id)a3 areaNamesWithNegativeFeedback:(id)a4 holidayNamesWithNegativeFeedback:(id)a5 datesWithNegativeFeedback:(id)a6 personUUIDsWithNegativeFeedback:(id)a7 locationsWithNegativeFeedback:(id)a8 loggingConnection:(id)a9 progressReporter:(id)a10
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  char v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  id v61;
  unint64_t v62;
  double v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  char v70;
  _BOOL4 v71;
  void *v72;
  uint64_t v73;
  uint32_t numer;
  uint32_t denom;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  unint64_t v79;
  os_signpost_id_t spid;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  uint8_t *v90;
  _BYTE *v91;
  uint64_t *v92;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  char v101;
  uint8_t buf[8];
  uint8_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  PGGraphMomentNodeCollection *v107;
  mach_timebase_info info;
  uint8_t v109[4];
  int v110;
  __int16 v111;
  const char *v112;
  _BYTE v113[24];
  uint64_t v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v86 = a4;
  v85 = a5;
  v84 = a6;
  v83 = a7;
  v81 = a8;
  v16 = a9;
  v17 = a10;
  v18 = v16;
  v19 = os_signpost_id_generate(v18);
  v20 = v18;
  v21 = v20;
  v79 = v19 - 1;
  spid = v19;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MomentNodesWithBlockedFeature", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v78 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v103 = buf;
  v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__45597;
  v106 = __Block_byref_object_dispose__45598;
  v107 = -[MAElementCollection initWithGraph:]([PGGraphMomentNodeCollection alloc], "initWithGraph:", v15);
  v22 = v17;
  v82 = *((id *)v103 + 5);
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  if (objc_msgSend(v86, "count"))
  {
    +[PGGraphAreaNodeCollection areaNodesForNames:inGraph:](PGGraphAreaNodeCollection, "areaNodesForNames:inGraph:", v86, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v103 + 5);
    objc_msgSend(v23, "addressNodes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "momentNodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "collectionByFormingUnionWith:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v103 + 5);
    *((_QWORD *)v103 + 5) = v27;

  }
  if (*((_BYTE *)v99 + 24))
  {
    *((_BYTE *)v99 + 24) = 1;
    goto LABEL_9;
  }
  v29 = objc_msgSend(v22, "isCancelledWithProgress:", 0.2);
  *((_BYTE *)v99 + 24) = v29;
  if ((v29 & 1) == 0)
  {
    if (objc_msgSend(v85, "count"))
    {
      objc_msgSend(v85, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphHolidayNodeCollection holidayNodesWithNames:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithNames:inGraph:", v34, v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)*((_QWORD *)v103 + 5);
      objc_msgSend(v35, "dateNodes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "momentNodes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "collectionByFormingUnionWith:", v38);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)*((_QWORD *)v103 + 5);
      *((_QWORD *)v103 + 5) = v39;

    }
    if (*((_BYTE *)v99 + 24))
    {
      *((_BYTE *)v99 + 24) = 1;
LABEL_19:
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_DWORD *)v113 = 67109378;
      *(_DWORD *)&v113[4] = 261;
      *(_WORD *)&v113[8] = 2080;
      *(_QWORD *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/Conveniences/PGMemoryFeatureBlocking.m";
      v30 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
    v41 = objc_msgSend(v22, "isCancelledWithProgress:", 0.4);
    *((_BYTE *)v99 + 24) = v41;
    if ((v41 & 1) != 0)
      goto LABEL_19;
    if (objc_msgSend(v84, "count"))
    {
      objc_msgSend(v84, "allObjects");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphDateNodeCollection dateNodesForLocalDates:inGraph:](PGGraphDateNodeCollection, "dateNodesForLocalDates:inGraph:", v42, v15);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)*((_QWORD *)v103 + 5);
      objc_msgSend(v43, "momentNodes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "collectionByFormingUnionWith:", v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)*((_QWORD *)v103 + 5);
      *((_QWORD *)v103 + 5) = v46;

    }
    if (*((_BYTE *)v99 + 24))
    {
      *((_BYTE *)v99 + 24) = 1;
LABEL_26:
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_DWORD *)v113 = 67109378;
      *(_DWORD *)&v113[4] = 268;
      *(_WORD *)&v113[8] = 2080;
      *(_QWORD *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/Conveniences/PGMemoryFeatureBlocking.m";
      v30 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
    v48 = objc_msgSend(v22, "isCancelledWithProgress:", 0.5);
    *((_BYTE *)v99 + 24) = v48;
    if ((v48 & 1) != 0)
      goto LABEL_26;
    if (objc_msgSend(v83, "count"))
    {
      v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v50 = v83;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v94, v115, 16);
      if (v51)
      {
        v52 = *(_QWORD *)v95;
        do
        {
          for (i = 0; i != v51; ++i)
          {
            if (*(_QWORD *)v95 != v52)
              objc_enumerationMutation(v50);
            objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v54);

          }
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v94, v115, 16);
        }
        while (v51);
      }

      +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", v49, v15);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v15);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0D429D8];
      +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "adjacencyWithSources:relation:targetsClass:", v56, v58, objc_opt_class());
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v99 + 24))
      {
        *((_BYTE *)v99 + 24) = 1;
LABEL_39:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v113 = 67109378;
          *(_DWORD *)&v113[4] = 281;
          *(_WORD *)&v113[8] = 2080;
          *(_QWORD *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/Conveniences/PGMemoryFeatureBlocking.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v113, 0x12u);
        }
        v61 = v82;
LABEL_42:

        v31 = v82;
        v32 = v82;
        goto LABEL_13;
      }
      v60 = objc_msgSend(v22, "isCancelledWithProgress:", 0.6);
      *((_BYTE *)v99 + 24) = v60;
      if ((v60 & 1) != 0)
        goto LABEL_39;
      v62 = objc_msgSend(v59, "sourcesCount");
      if (v62)
      {
        *(_QWORD *)v113 = 0;
        *(_QWORD *)&v113[8] = v113;
        *(_QWORD *)&v113[16] = 0x2020000000;
        v114 = 0x3FE3333333333333;
        v63 = 0.2 / (double)v62;
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __251__PGMemoryFeatureBlocking__momentNodesWithBlockedFeatureInGraph_areaNamesWithNegativeFeedback_holidayNamesWithNegativeFeedback_datesWithNegativeFeedback_personUUIDsWithNegativeFeedback_locationsWithNegativeFeedback_loggingConnection_progressReporter___block_invoke;
        v87[3] = &unk_1E842F3B8;
        v88 = v55;
        v90 = buf;
        v91 = v113;
        v93 = v63;
        v92 = &v98;
        v89 = v22;
        objc_msgSend(v59, "enumerateTargetsBySourceWithBlock:", v87);
        if (*((_BYTE *)v99 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v109 = 67109378;
            v110 = 294;
            v111 = 2080;
            v112 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Mem"
                   "ories/Conveniences/PGMemoryFeatureBlocking.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v109, 0x12u);
          }
          v64 = v82;

          _Block_object_dispose(v113, 8);
          goto LABEL_42;
        }

        _Block_object_dispose(v113, 8);
      }

    }
    +[PGGraphAddressNodeCollection addressNodesWithinDistance:ofLocations:inGraph:](PGGraphAddressNodeCollection, "addressNodesWithinDistance:ofLocations:inGraph:", v81, v15, 100.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)*((_QWORD *)v103 + 5);
    objc_msgSend(v65, "momentNodes");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "collectionByFormingUnionWith:", v67);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)*((_QWORD *)v103 + 5);
    *((_QWORD *)v103 + 5) = v68;

    if (*((_BYTE *)v99 + 24))
    {
      *((_BYTE *)v99 + 24) = 1;
    }
    else
    {
      v70 = objc_msgSend(v22, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v99 + 24) = v70;
      if ((v70 & 1) == 0)
      {
        v73 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v76 = v21;
        v77 = v76;
        if (v79 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
        {
          *(_WORD *)v113 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v77, OS_SIGNPOST_INTERVAL_END, spid, "MomentNodesWithBlockedFeature", ", v113, 2u);
        }

        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v113 = 136315394;
          *(_QWORD *)&v113[4] = "MomentNodesWithBlockedFeature";
          *(_WORD *)&v113[12] = 2048;
          *(double *)&v113[14] = (float)((float)((float)((float)(v73 - v78) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v77, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v113, 0x16u);
        }
        v72 = (void *)*((_QWORD *)v103 + 5);
        goto LABEL_61;
      }
    }
    v71 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    v72 = v82;
    if (v71)
    {
      *(_DWORD *)v113 = 67109378;
      *(_DWORD *)&v113[4] = 301;
      *(_WORD *)&v113[8] = 2080;
      *(_QWORD *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/Conveniences/PGMemoryFeatureBlocking.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v113, 0x12u);
      v72 = v82;
    }
LABEL_61:
    v32 = v72;

    v31 = v82;
    goto LABEL_13;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v113 = 67109378;
    *(_DWORD *)&v113[4] = 254;
    *(_WORD *)&v113[8] = 2080;
    *(_QWORD *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Conveniences/PGMemoryFeatureBlocking.m";
    v30 = MEMORY[0x1E0C81028];
LABEL_11:
    _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v113, 0x12u);
  }
LABEL_12:
  v31 = v82;
  v32 = v82;
LABEL_13:
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(buf, 8);
  return v32;
}

void __251__PGMemoryFeatureBlocking__momentNodesWithBlockedFeatureInGraph_areaNamesWithNegativeFeedback_holidayNamesWithNegativeFeedback_datesWithNegativeFeedback_personUUIDsWithNegativeFeedback_locationsWithNegativeFeedback_loggingConnection_progressReporter___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;

  v12 = a2;
  +[PGMemoryFeatureBlocking _prominentPersonNodeAsCollectionInMomentNodeAsCollection:withPersonNodes:maximumNumberOfPersonsAllowed:minimumPresenceThreshold:maximumOthersPresenceThreshold:](PGMemoryFeatureBlocking, "_prominentPersonNodeAsCollectionInMomentNodeAsCollection:withPersonNodes:maximumNumberOfPersonsAllowed:minimumPresenceThreshold:maximumOthersPresenceThreshold:", 0.45, 0.15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "intersectsCollection:", v6))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "collectionByFormingUnionWith:", v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
  *(_BYTE *)(v10 + 24) = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a4 = 1;

}

void __186__PGMemoryFeatureBlocking__prominentPersonNodeAsCollectionInMomentNodeAsCollection_withPersonNodes_maximumNumberOfPersonsAllowed_minimumPresenceThreshold_maximumOthersPresenceThreshold___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyEdge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double)(unint64_t)objc_msgSend(v8, "numberOfAssets") / (double)*(unint64_t *)(a1 + 48);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13 || v9 < *(double *)(a1 + 56))
  {
    if (v9 > *(double *)(a1 + 64))
    {
      *v11 = 0;

      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong(v11, a3);
  }

}

void __80__PGMemoryFeatureBlocking__bestAddressNodeAsCollectionInMomentNodeAsCollection___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyEdge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relevance");
  v8 = v7;

  if (v8 >= 0.8)
  {
    v9 = *(_QWORD *)(a1[5] + 8);
    if (v8 > *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    }
  }

}

@end
