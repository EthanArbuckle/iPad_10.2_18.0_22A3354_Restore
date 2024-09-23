@implementation PGEnrichedMemoryFactory

+ (int64_t)notificationLevelForTriggeredMemory:(id)a3 withLocalDate:(id)a4 graph:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  objc_msgSend(v7, "memoryFeatureNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "memoryMomentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "labels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[PGGraph stellarMeanings](PGGraph, "stellarMeanings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke;
  v38[3] = &unk_1E8434FA8;
  v17 = v14;
  v39 = v17;
  objc_msgSend(v15, "enumerateIndexesUsingBlock:", v38);

  objc_msgSend(v7, "triggerTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke_2;
  v32[3] = &unk_1E842EE58;
  v37 = &v40;
  v19 = v7;
  v33 = v19;
  v20 = v13;
  v34 = v20;
  v21 = v17;
  v35 = v21;
  v22 = v11;
  v36 = v22;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v32);

  if (v41[3] != 4)
  {
    switch(objc_msgSend(v19, "memoryCategory"))
    {
      case 0:
      case 7:
      case 12:
      case 13:
      case 14:
      case 15:
      case 20:
      case 24:
        v23 = v41;
        v24 = v41[3];
        if (v24 <= 1)
          v24 = 1;
        goto LABEL_6;
      case 2:
      case 3:
      case 4:
        goto LABEL_7;
      case 5:
      case 6:
        objc_msgSend(v19, "memoryFeatureNodes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphNodeCollection subsetInCollection:](PGGraphSocialGroupNodeCollection, "subsetInCollection:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "anyNode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v25, "rankInGraph:", v9) > 1)
          goto LABEL_9;
        goto LABEL_8;
      case 9:
      case 27:
        v23 = v41;
        v24 = v41[3];
        if (v24 <= 2)
          v24 = 2;
        goto LABEL_6;
      case 10:
      case 11:
      case 17:
      case 18:
      case 19:
      case 25:
      case 26:
      case 28:
      case 29:
      case 30:
        goto LABEL_3;
      case 16:
        if (objc_msgSend(v20, "containsObject:", CFSTR("Birthday")))
        {
LABEL_7:
          +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[PGPeopleInferencesConveniences anyPersonNodes:belongToBestSocialGroupsInGraph:](PGPeopleInferencesConveniences, "anyPersonNodes:belongToBestSocialGroupsInGraph:", v25, v9))
          {
LABEL_8:
            v41[3] = 3;
          }
LABEL_9:

        }
        else
        {
          +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", v10);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count");

          if (v31)
          {
LABEL_3:
            v23 = v41;
            v24 = 3;
LABEL_6:
            v23[3] = v24;
          }
        }
        break;
      default:
        break;
    }
  }
  v26 = v41[3];

  _Block_object_dispose(&v40, 8);
  return v26;
}

+ (double)notificationScoreForNotificationLevel:(int64_t)a3 electionScore:(double)a4
{
  double *v4;
  double v5;

  if ((unint64_t)(a3 - 2) > 2)
    v4 = (double *)MEMORY[0x1E0CD1D10];
  else
    v4 = (double *)qword_1E842EE78[a3 - 2];
  v5 = fmax(a4, 0.0);
  if (v5 > 1.0)
    v5 = 1.0;
  return v5 * *MEMORY[0x1E0CD1D30] + *v4;
}

void __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  PGMeaningLabelForMeaning(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  switch(a2)
  {
    case 0:
    case 7:
    case 16:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v6 = *(_QWORD *)(v5 + 24);
      if (v6 <= 1)
        v6 = 1;
      goto LABEL_13;
    case 1:
    case 3:
    case 12:
    case 17:
      goto LABEL_7;
    case 2:
    case 15:
      goto LABEL_9;
    case 4:
      if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", CFSTR("Anniversary")))
        goto LABEL_9;
      if (objc_msgSend(*(id *)(a1 + 40), "intersectsSet:", *(_QWORD *)(a1 + 48)))
      {
LABEL_7:
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v6 = 3;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "personNodes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (!v8)
          goto LABEL_14;
LABEL_11:
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v6 = *(_QWORD *)(v5 + 24);
        if (v6 <= 2)
          v6 = 2;
      }
LABEL_13:
      *(_QWORD *)(v5 + 24) = v6;
LABEL_14:
      *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 4;
      return;
    case 5:
      if (objc_msgSend(*(id *)(a1 + 32), "memoryCategory") != 8)
        goto LABEL_14;
LABEL_9:
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v6 = 4;
      goto LABEL_13;
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 18:
    case 19:
    case 27:
      goto LABEL_11;
    default:
      goto LABEL_14;
  }
}

+ (void)requestFlexMusicCurationForEnrichedMemories:(id)a3 context:(id)a4 photoLibrary:(id)a5 graph:(id)a6 progressReporter:(id)a7 resultHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  PGFlexMusicCurationParameters *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  PGFlexMusicCurationParameters *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  unint64_t v51;
  void (**v52)(void);
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v50 = a6;
  v16 = a7;
  v52 = (void (**)(void))a8;
  v53 = v13;
  v17 = objc_msgSend(v13, "count");
  v45 = v16;
  objc_msgSend(v16, "progressReportersForParallelOperationsWithCount:", v17);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v15;
  +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsFromPhotoLibrary:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v17;
  if (!v17)
    goto LABEL_21;
  v19 = 0;
  v20 = (double)v17;
  v48 = v18;
  v49 = v14;
  while (1)
  {
    v21 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v54, "objectAtIndexedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isCancelled"))
      break;
    objc_msgSend(v53, "objectAtIndexedSubscript:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (double)v19 / v20;
    v25 = (double)v19++ + 0.5;
    v26 = v25 / v20;
    objc_msgSend(v22, "childProgressReporterFromStart:toEnd:", v24, v25 / v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v14)
    {
      if (objc_msgSend(v27, "isCancelledWithProgress:", 1.0))
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "loggingConnection");
        v44 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v44, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] (MemoriesMusic) Cancelling Flex Music curation for enriched memories.", buf, 2u);
        }

        goto LABEL_20;
      }
      v55 = v28;
      v57 = v21;
      v29 = 0;
      goto LABEL_9;
    }
    objc_msgSend((id)objc_opt_class(), "flexMusicFeatureExtractionContextWithCuratorContext:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    +[PGMusicCurator extractMusicCurationFeaturesForEnrichedMemory:graph:context:progressReporter:error:](PGMusicCurator, "extractMusicCurationFeaturesForEnrichedMemory:graph:context:progressReporter:error:", v23, v50, v29, v28, &v59);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v59;
    v32 = v31;
    if (v30)
    {
      v55 = v28;
      v57 = v21;

      v29 = (void *)v30;
LABEL_9:
      v56 = v22;
      objc_msgSend(v22, "childProgressReporterFromStart:toEnd:", v26, (double)v19 / v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = [PGFlexMusicCurationParameters alloc];
      v34 = objc_msgSend(v23, "suggestedMood");
      objc_msgSend(v23, "legacyMoodKeywords");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueMemoryIdentifier");
      v36 = v23;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PGFlexMusicCurationParameters initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:](v33, "initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:", v34, v35, v48, v37, 0, v29, v14);

      v58 = 0;
      +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:progressReporter:error:](PGFlexMusicCurator, "curateFlexMusicWithCurationParameters:progressReporter:error:", v38, v32, &v58);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v58;
      if (v39)
        objc_msgSend(v48, "addFlexMusicCuration:date:", v39, v47);
      v52[2]();
      v18 = v48;
      v23 = v36;

      v14 = v49;
      v22 = v56;
      v21 = v57;
      v28 = v55;
      goto LABEL_13;
    }
    ((void (*)(void (**)(void), void *, _QWORD, id))v52[2])(v52, v23, 0, v31);
LABEL_13:

    objc_autoreleasePoolPop(v21);
    if (v51 == v19)
      goto LABEL_21;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "loggingConnection");
  v42 = objc_claimAutoreleasedReturnValue();

  v23 = v42;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v42, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] (MemoriesMusic) Cancelling Flex Music curation for enriched memories.", buf, 2u);
  }
LABEL_20:

  objc_autoreleasePoolPop(v21);
LABEL_21:

}

+ (void)requestMusicCurationForEnrichedMemories:(id)a3 context:(id)a4 graph:(id)a5 progressReporter:(id)a6 resultHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void);
  void *v16;
  unint64_t v17;
  double v18;
  void **p_vtable;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void **v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  unint64_t v39;
  void (**v40)(void);
  void *v41;
  void *v42;
  void *v43;
  void *context;
  id v45;
  id v46;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(void))a7;
  v16 = v13;
  v40 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v11;
  v39 = objc_msgSend(v11, "count");
  if (v39)
  {
    v17 = 0;
    v18 = (double)v39;
    p_vtable = PGPotentialMemory.vtable;
    v36 = v13;
    v38 = v14;
    while (1)
    {
      v20 = (void *)MEMORY[0x1CAA4EB2C]();
      if (objc_msgSend(v14, "isCancelled"))
        break;
      v21 = ((double)v17 + 0.5) / v18;
      objc_msgSend(v41, "objectAtIndexedSubscript:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "childProgressReporterFromStart:toEnd:", (double)v17 / v18, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "appleMusicFeatureExtractionContextWithCuratorContext:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(p_vtable + 459, "extractMusicCurationFeaturesForEnrichedMemory:graph:context:progressReporter:error:", v22, v16, v24, v23, &v46);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v46;
      if (v25)
      {
        v42 = v26;
        v43 = v23;
        context = v20;
        objc_msgSend(v14, "childProgressReporterFromStart:toEnd:", v21, (double)++v17 / v18);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = p_vtable;
        v29 = (void *)v27;
        v45 = 0;
        objc_msgSend(v28 + 459, "curateMusicForFeatures:context:progressReporter:error:", v25, v12, v27, &v45);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v45;
        if (v30)
        {
          objc_msgSend(v12, "recentlyUsedSongs");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addMusicCuration:date:", v30, v37);

          v16 = v36;
        }
        v40[2]();

        objc_autoreleasePoolPop(context);
        v14 = v38;
        p_vtable = (void **)(PGPotentialMemory + 24);
      }
      else
      {
        v33 = v26;
        ((void (*)(void (**)(void), void *, _QWORD, id))v40[2])(v40, v22, 0, v26);

        objc_autoreleasePoolPop(v20);
        ++v17;
      }
      if (v17 == v39)
        goto LABEL_14;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "loggingConnection");
    v35 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v35, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] (MemoriesMusic) Cancelling Apple Music curation for enriched memories.", buf, 2u);
    }

    objc_autoreleasePoolPop(v20);
    v16 = v36;
  }
LABEL_14:

}

- (PGEnrichedMemoryFactory)initWithMemoryCurationSession:(id)a3 graph:(id)a4 serviceManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGEnrichedMemoryFactory *v12;
  os_log_t v13;
  OS_os_log *loggingConnection;
  PGMoodKeywordComputer *v15;
  PGMoodKeywordComputer *moodKeywordComputer;
  PGTitleGenerationContext *v17;
  PGTitleGenerationContext *titleGenerationContext;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PGEnrichedMemoryFactory;
  v12 = -[PGEnrichedMemoryFactory init](&v20, sel_init);
  if (v12)
  {
    v13 = os_log_create("com.apple.PhotosGraph", "EnrichedMemoryFactory");
    loggingConnection = v12->_loggingConnection;
    v12->_loggingConnection = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_memoryCurationSession, a3);
    v15 = objc_alloc_init(PGMoodKeywordComputer);
    moodKeywordComputer = v12->_moodKeywordComputer;
    v12->_moodKeywordComputer = v15;

    v17 = -[PGTitleGenerationContext initWithGraph:serviceManager:]([PGTitleGenerationContext alloc], "initWithGraph:serviceManager:", v10, v11);
    titleGenerationContext = v12->_titleGenerationContext;
    v12->_titleGenerationContext = v17;

    objc_storeStrong((id *)&v12->_graph, a4);
  }

  return v12;
}

- (id)_memoryEnricherFromTriggeredMemory:(id)a3
{
  id v4;
  PGMemoryGenerator *v5;
  uint64_t v6;
  __objc2_class *v7;
  NSObject *loggingConnection;
  NSObject *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PGMemoryGenerator initWithMemoryCurationSession:loggingConnection:]([PGMemoryGenerator alloc], "initWithMemoryCurationSession:loggingConnection:", self->_memoryCurationSession, self->_loggingConnection);
  v6 = objc_msgSend(v4, "memoryCategory");
  if (v6 > 200)
  {
    if ((unint64_t)(v6 - 201) < 0x15 || (unint64_t)(v6 - 301) < 2 || v6 == 401)
    {
LABEL_5:
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        v9 = loggingConnection;
        v12 = 134217984;
        v13 = objc_msgSend(v4, "memoryCategory");
        _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "+[PGEnrichedMemoryFactory memoryGeneratorClassFromTriggeredMemory:] is not compatible with legacy category: %lu", (uint8_t *)&v12, 0xCu);

      }
      v5 = 0;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        v7 = PGSingleMomentMemoryGenerator;
        goto LABEL_38;
      case 2:
      case 5:
      case 11:
        goto LABEL_5;
      case 3:
        v7 = PGPersonMemoryGenerator;
        goto LABEL_38;
      case 4:
        v7 = PGEarlyMomentsWithPeopleMemoryGenerator;
        goto LABEL_38;
      case 6:
        v7 = PGSocialGroupMemoryGenerator;
        goto LABEL_38;
      case 7:
        v7 = PGLastMonthAtHomeMemoryGenerator;
        goto LABEL_38;
      case 8:
        v7 = PGYearInReviewMemoryGenerator;
        goto LABEL_38;
      case 9:
        v7 = PGFoodieMemoryGenerator;
        goto LABEL_38;
      case 10:
        v7 = PGMyPetMemoryGenerator;
        goto LABEL_38;
      case 12:
        v7 = PGPlaceLocationMemoryGenerator;
        goto LABEL_38;
      case 13:
        v7 = PGPlaceRegionMemoryGenerator;
        goto LABEL_38;
      case 14:
        v7 = PGPlaceAreaMemoryGenerator;
        goto LABEL_38;
      case 15:
      case 22:
        break;
      case 16:
        v7 = PGMeaningfulEventMemoryGenerator;
        goto LABEL_38;
      case 17:
        v7 = PGMeaningAggregationMemoryGenerator;
        goto LABEL_38;
      case 18:
        v7 = PGRecurrentTripMemoryGenerator;
        goto LABEL_38;
      case 19:
        v7 = PGTripMemoryGenerator;
        goto LABEL_38;
      case 20:
        v7 = PGPastSupersetMemoryGenerator;
        goto LABEL_38;
      case 21:
        v7 = PGSeasonMemoryGenerator;
        goto LABEL_38;
      case 23:
        v7 = PGDayInHistoryAggregationMemoryGenerator;
        goto LABEL_38;
      case 24:
        v7 = PGRecentHighlightsMemoryGenerator;
        goto LABEL_38;
      case 25:
        v7 = PGChildActivityMemoryGenerator;
        goto LABEL_38;
      case 26:
        v7 = PGExcitingMomentsMemoryGenerator;
        goto LABEL_38;
      case 27:
        v7 = PGTrendsMemoryGenerator;
        goto LABEL_38;
      case 28:
        v7 = PGMyPetOutdoorMemoryGenerator;
        goto LABEL_38;
      case 29:
        v7 = PGChildAndPersonMemoryGenerator;
        goto LABEL_38;
      case 30:
        v7 = PGChildOutdoorMemoryGenerator;
        goto LABEL_38;
      case 31:
        v7 = PGOngoingTripMemoryGenerator;
LABEL_38:
        v10 = objc_msgSend([v7 alloc], "initWithMemoryCurationSession:loggingConnection:", self->_memoryCurationSession, self->_loggingConnection);

        v5 = (PGMemoryGenerator *)v10;
        break;
      default:
        if ((unint64_t)(v6 - 101) < 2)
          goto LABEL_5;
        break;
    }
  }

  return v5;
}

- (id)debugEnrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5
{
  id v8;
  PGEnrichedMemory *v9;
  NSObject *loggingConnection;
  uint8_t v12[16];

  v8 = a3;
  -[PGEnrichedMemoryFactory enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:debug:](self, "enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:debug:", v8, a4, a5, 1);
  v9 = (PGEnrichedMemory *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] A non nil enrichedMemory with a failure reason should be specified when enriching triggered memory if debug = YES", v12, 2u);
    }
    v9 = -[PGEnrichedMemory initWithTriggeredMemory:]([PGEnrichedMemory alloc], "initWithTriggeredMemory:", v8);
    -[PGEnrichedMemory setFailureReason:](v9, "setFailureReason:", 1);
  }

  return v9;
}

- (id)enrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5
{
  return -[PGEnrichedMemoryFactory enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:debug:](self, "enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:debug:", a3, a4, a5, 0);
}

- (id)enrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5 debug:(BOOL)a6
{
  id v9;
  id v10;
  OS_os_log *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  PGEnrichedMemory *v15;
  PGEnrichedMemory *v16;
  objc_class *v17;
  id v18;
  int v19;
  OS_os_log *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint8_t v26;
  void *v27;
  uint8_t v28;
  OS_os_log *v30;
  objc_class *v31;
  void *v32;
  uint8_t v33;
  uint8_t v34;
  uint32_t denom;
  uint32_t numer;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  float v42;
  id v43;
  OS_os_log *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  uint8_t v50;
  void *v51;
  uint32_t v52;
  uint32_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  OS_os_log *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  int v64;
  NSObject *v65;
  id v66;
  NSObject *loggingConnection;
  uint8_t v68;
  void *v69;
  int v70;
  NSObject *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint32_t v75;
  uint32_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  float v80;
  id v81;
  OS_os_log *v82;
  os_signpost_id_t v83;
  unint64_t v84;
  uint8_t v85;
  int v86;
  NSObject *v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint32_t v92;
  uint32_t v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  id v97;
  unint64_t v98;
  unint64_t v99;
  int v100;
  unint64_t v101;
  double v102;
  double v103;
  OS_os_log *v104;
  os_signpost_id_t v105;
  unint64_t v106;
  void *v107;
  uint8_t v108;
  NSObject *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint32_t v113;
  uint32_t v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  float v118;
  id v119;
  OS_os_log *v120;
  os_signpost_id_t v121;
  unint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  _BOOL4 v126;
  uint32_t v127;
  uint32_t v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  id v132;
  NSObject *v133;
  uint8_t v134;
  NSObject *v135;
  uint8_t v136;
  NSObject *v137;
  id v138;
  uint8_t v139;
  NSObject *v140;
  id v141;
  uint8_t v142;
  NSObject *v143;
  id v144;
  OS_os_log *v145;
  uint8_t v146;
  NSObject *v147;
  id v148;
  OS_os_log *v149;
  os_signpost_id_t v150;
  NSObject *v151;
  NSObject *v152;
  unint64_t v153;
  void *v154;
  uint64_t v155;
  uint32_t v156;
  uint32_t v157;
  NSObject *v158;
  NSObject *v159;
  NSObject *v160;
  id v161;
  OS_os_log *v162;
  OS_os_log *v163;
  uint8_t v164;
  NSObject *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  uint8_t v171;
  id v172;
  OS_os_log *v173;
  void *v174;
  void *v175;
  void *v176;
  PGMoodGenerationContext *v177;
  PGMoodGenerator *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  mach_timebase_info v182;
  NSObject *v183;
  NSObject *v184;
  float v185;
  id v186;
  uint8_t v187;
  NSObject *v188;
  id v189;
  NSObject *v190;
  os_signpost_id_t v191;
  PGGraph *graph;
  void *v193;
  void *v194;
  uint64_t v195;
  mach_timebase_info v196;
  NSObject *v197;
  NSObject *v198;
  float v199;
  id v200;
  uint8_t v201;
  NSObject *v202;
  id v203;
  uint32_t v204;
  uint32_t v205;
  NSObject *v206;
  NSObject *v207;
  NSObject *v208;
  id v209;
  uint8_t v210;
  NSObject *v211;
  id v212;
  uint64_t v213;
  os_signpost_id_t v214;
  uint64_t v215;
  unint64_t v216;
  os_signpost_id_t v217;
  os_signpost_id_t v218;
  PGMoodKeywordComputer *moodKeywordComputer;
  NSObject *v220;
  OS_os_log *v221;
  NSObject *v222;
  os_log_t v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  PGMoodGenerator *v228;
  void *v229;
  os_signpost_id_t v230;
  os_signpost_id_t v231;
  PGMoodGeneratorOptions *v232;
  void *v233;
  void *v234;
  id v235;
  id v236;
  os_log_t v237;
  os_log_t v238;
  NSObject *v239;
  os_signpost_id_t v240;
  os_signpost_id_t v241;
  void *v242;
  os_signpost_id_t v243;
  os_signpost_id_t v244;
  void *v245;
  unint64_t v246;
  void *v247;
  id v248;
  id v249;
  void *v250;
  os_signpost_id_t spid;
  NSObject *spida;
  void *v253;
  void *v254;
  void *context;
  void *contexta;
  uint64_t v257;
  NSObject *v258;
  uint64_t v259;
  void *v260;
  id v261;
  void *v262;
  void *v263;
  NSObject *v264;
  uint64_t v265;
  void *v266;
  id v267;
  id v268;
  NSObject *v269;
  unsigned int log;
  NSObject *loga;
  void *v272;
  uint64_t v273;
  void *v274;
  _BOOL4 v275;
  uint64_t v276;
  void *v277;
  id v278;
  void *v279;
  id v280;
  mach_timebase_info v281;
  mach_timebase_info v282;
  mach_timebase_info v283;
  mach_timebase_info v284;
  _QWORD v285[4];
  id v286;
  uint8_t *v287;
  mach_timebase_info v288;
  _QWORD v289[4];
  id v290;
  uint8_t *v291;
  mach_timebase_info v292;
  _QWORD v293[4];
  id v294;
  uint8_t *v295;
  _QWORD v296[4];
  id v297;
  uint8_t *v298;
  mach_timebase_info v299;
  _QWORD v300[4];
  id v301;
  uint8_t *v302;
  mach_timebase_info v303;
  mach_timebase_info v304;
  uint8_t buf[8];
  uint8_t *v306;
  uint64_t v307;
  char v308;
  mach_timebase_info info;
  uint8_t v310[4];
  _BYTE v311[20];
  double v312;
  uint64_t v313;

  v275 = a6;
  v313 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v280 = a5;
  v11 = self->_loggingConnection;
  v12 = os_signpost_id_generate((os_log_t)v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MemoryElectionEnrichment", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v273 = mach_absolute_time();
  v15 = -[PGEnrichedMemory initWithTriggeredMemory:]([PGEnrichedMemory alloc], "initWithTriggeredMemory:", v9);
  if (!objc_msgSend(v10, "skipEnrichment"))
  {
    log = objc_msgSend(v10, "allowGuestAsset");
    -[PGEnrichedMemoryFactory _memoryEnricherFromTriggeredMemory:](self, "_memoryEnricherFromTriggeredMemory:", v9);
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v280;
    *(_QWORD *)buf = 0;
    v306 = buf;
    v307 = 0x2020000000;
    v308 = 0;
    v278 = v18;
    v19 = objc_msgSend(v18, "isCancelledWithProgress:", 0.0);
    v306[24] = v19;
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 242;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v16 = 0;
      goto LABEL_28;
    }
    v20 = self->_loggingConnection;
    v21 = os_signpost_id_generate((os_log_t)v20);
    v22 = v20;
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Feeder", ", v310, 2u);
    }
    v269 = v23;

    v304 = 0;
    mach_timebase_info(&v304);
    v24 = mach_absolute_time();
    objc_msgSend(v279, "relevantFeederForTriggeredMemory:inGraph:allowGuestAsset:progressReporter:", v9, self->_graph, log, v278);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = v25;
    if (!v25)
    {
      if (v306[24])
      {
        v306[24] = 1;
      }
      else
      {
        v28 = objc_msgSend(v278, "isCancelledWithProgress:", 1.0);
        v306[24] = v28;
        if ((v28 & 1) == 0)
        {
          v30 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v310 = 138412290;
            *(_QWORD *)v311 = v32;
            _os_log_impl(&dword_1CA237000, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] nil feeder for triggered memory from enricher %@", v310, 0xCu);

          }
          if (v275)
          {
            -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 2);
            v16 = v15;
            goto LABEL_22;
          }
LABEL_21:
          v16 = 0;
LABEL_22:
          v27 = v272;
LABEL_27:

LABEL_28:
          _Block_object_dispose(buf, 8);

          goto LABEL_29;
        }
      }
      v27 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 248;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v16 = 0;
      goto LABEL_27;
    }
    -[PGEnrichedMemory setNumberOfRelevantAssets:](v15, "setNumberOfRelevantAssets:", objc_msgSend(v25, "numberOfItems"));
    if (v306[24])
    {
      v306[24] = 1;
      goto LABEL_19;
    }
    v26 = objc_msgSend(v278, "isCancelledWithProgress:", 0.05);
    v306[24] = v26;
    if ((v26 & 1) != 0)
    {
LABEL_19:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 259;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      goto LABEL_21;
    }
    objc_msgSend(v279, "relevantCurationFeederForTriggeredMemory:relevantFeeder:inGraph:allowGuestAsset:progressReporter:", v9, v272, self->_graph, log, v278);
    v268 = (id)objc_claimAutoreleasedReturnValue();
    if (!v268)
      v268 = v272;
    if (v306[24])
    {
      v306[24] = 1;
LABEL_39:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 267;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v16 = 0;
      goto LABEL_42;
    }
    v33 = objc_msgSend(v278, "isCancelledWithProgress:", 0.1);
    v306[24] = v33;
    if ((v33 & 1) != 0)
      goto LABEL_39;
    objc_msgSend(v279, "relevantKeyCurationFeederForTriggeredMemory:inGraph:allowGuestAsset:progressReporter:", v9, self->_graph, log, v278);
    v267 = (id)objc_claimAutoreleasedReturnValue();
    if (!v267)
      v267 = v268;
    if (v306[24])
    {
      v306[24] = 1;
LABEL_48:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 275;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v16 = 0;
      goto LABEL_51;
    }
    v34 = objc_msgSend(v278, "isCancelledWithProgress:", 0.15);
    v306[24] = v34;
    if ((v34 & 1) != 0)
      goto LABEL_48;
    v265 = mach_absolute_time();
    numer = v304.numer;
    denom = v304.denom;
    v37 = v269;
    v38 = v37;
    v39 = v37;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v40 = os_signpost_enabled(v37);
      v38 = v39;
      if (v40)
      {
        *(_DWORD *)v310 = 138412290;
        *(_QWORD *)v311 = v274;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_END, v21, "Feeder", "%@", v310, 0xCu);
        v38 = v39;
      }
    }

    v41 = v39;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
      v42 = (float)((float)((float)(v265 - v24) * (float)numer) / (float)denom) / 1000000.0;
      v43 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(_QWORD *)v311 = "Feeder";
      *(_WORD *)&v311[8] = 2112;
      *(_QWORD *)&v311[10] = v43;
      *(_WORD *)&v311[18] = 2048;
      v312 = v42;
      _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

    }
    v44 = self->_loggingConnection;
    v45 = os_signpost_id_generate((os_log_t)v44);
    v46 = v44;
    v47 = v46;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "KeyAsset", ", v310, 2u);
    }
    v264 = v47;

    v303 = 0;
    mach_timebase_info(&v303);
    v259 = mach_absolute_time();
    objc_msgSend(v279, "keyAssetCurationOptionsWithTriggeredMemory:inGraph:", v9, self->_graph);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAllowGuestAsset:", log);
    v300[0] = MEMORY[0x1E0C809B0];
    v300[1] = 3221225472;
    v300[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke;
    v300[3] = &unk_1E84301E0;
    v302 = buf;
    v261 = v278;
    v263 = v48;
    v301 = v261;
    -[PGEnrichedMemoryFactory _keyAssetWithFeeder:options:progressBlock:](self, "_keyAssetWithFeeder:options:progressBlock:", v267, v48, v300);
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (v306[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 288;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        v49 = MEMORY[0x1E0C81028];
LABEL_70:
        _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
        goto LABEL_71;
      }
      goto LABEL_71;
    }
    if (!v266)
      goto LABEL_67;
    if (objc_msgSend(v266, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", 1, log))
    {
      if (v306[24])
      {
        v306[24] = 1;
LABEL_68:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 290;
          *(_WORD *)&v311[4] = 2080;
          *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
          v49 = MEMORY[0x1E0C81028];
          goto LABEL_70;
        }
LABEL_71:
        v16 = 0;
LABEL_72:

LABEL_51:
LABEL_42:

        goto LABEL_22;
      }
LABEL_67:
      v50 = objc_msgSend(v261, "isCancelledWithProgress:", 1.0);
      v306[24] = v50;
      if ((v50 & 1) == 0)
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v310 = 138412290;
          *(_QWORD *)v311 = v9;
          _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] No viable key asset found, returning nil enrichedMemory for %@", v310, 0xCu);
        }
        if (v275)
        {
          -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 3);
          v16 = v15;
          goto LABEL_72;
        }
        goto LABEL_71;
      }
      goto LABEL_68;
    }
    objc_msgSend(v266, "uuid");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGEnrichedMemory setKeyAssetUUID:](v15, "setKeyAssetUUID:", v51);

    v257 = mach_absolute_time();
    v53 = v303.numer;
    v52 = v303.denom;
    v54 = v264;
    v55 = v54;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_DWORD *)v310 = 138412290;
      *(_QWORD *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v55, OS_SIGNPOST_INTERVAL_END, v45, "KeyAsset", "%@", v310, 0xCu);
    }

    v56 = v55;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(_QWORD *)v311 = "KeyAsset";
      *(_WORD *)&v311[8] = 2112;
      *(_QWORD *)&v311[10] = v57;
      *(_WORD *)&v311[18] = 2048;
      v312 = (float)((float)((float)((float)(v257 - v259) * (float)v53) / (float)v52) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

    }
    objc_msgSend(v279, "uuidsOfRequiredAssetsWithKeyAsset:triggeredMemory:inGraph:progressReporter:", v266, v9, self->_graph, v261);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = self->_loggingConnection;
    v59 = os_signpost_id_generate((os_log_t)v58);
    v60 = v58;
    v61 = v60;
    spid = v59;
    v246 = v59 - 1;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "ExtendedCuratedAsset", ", v310, 2u);
    }
    v258 = v61;

    v299 = 0;
    mach_timebase_info(&v299);
    v243 = mach_absolute_time();
    context = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v279, "extendedCurationOptionsWithRequiredAssetUUIDs:triggeredMemory:", v260, v9);
    v62 = objc_claimAutoreleasedReturnValue();
    v296[0] = MEMORY[0x1E0C809B0];
    v296[1] = 3221225472;
    v296[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_189;
    v296[3] = &unk_1E84301E0;
    v298 = buf;
    v248 = v261;
    v297 = v248;
    v253 = (void *)v62;
    -[PGEnrichedMemoryFactory _extendedCuratedAssetsWithFeeder:options:progressBlock:](self, "_extendedCuratedAssetsWithFeeder:options:progressBlock:", v268, v62, v296);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v306[24];
    if (v306[24])
    {
      v65 = MEMORY[0x1E0C81028];
      v66 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 319;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, v65, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v262 = 0;
    }
    else
    {
      +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", v63);
      v65 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "extendedCurationOptionsWithRequiredAssetUUIDs:triggeredMemory:", v65, v9);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_autoreleasePoolPop(context);
    if (v64)
      goto LABEL_91;
    if (v306[24])
    {
      v306[24] = 1;
      goto LABEL_96;
    }
    v68 = objc_msgSend(v248, "isCancelledWithProgress:", 0.3);
    v306[24] = v68;
    if ((v68 & 1) != 0)
    {
LABEL_96:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 326;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
LABEL_91:
      v16 = 0;
LABEL_92:

      goto LABEL_72;
    }
    v69 = (void *)MEMORY[0x1CAA4EB2C]();
    v293[0] = MEMORY[0x1E0C809B0];
    v293[1] = 3221225472;
    v293[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_191;
    v293[3] = &unk_1E84301E0;
    v295 = buf;
    v249 = v248;
    v294 = v249;
    -[PGEnrichedMemoryFactory _extendedCuratedAssetsWithFeeder:options:progressBlock:](self, "_extendedCuratedAssetsWithFeeder:options:progressBlock:", v272, v262, v293);
    contexta = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v306[24];
    if (v306[24])
    {
      v71 = MEMORY[0x1E0C81028];
      v72 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 334;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }

    }
    objc_autoreleasePoolPop(v69);
    if (v70)
    {
      v16 = 0;
LABEL_119:

      goto LABEL_92;
    }
    +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", contexta);
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "allObjects");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGEnrichedMemory setExtendedCuratedAssetUUIDs:](v15, "setExtendedCuratedAssetUUIDs:", v73);

    v74 = mach_absolute_time();
    v75 = v299.numer;
    v76 = v299.denom;
    v77 = v258;
    v78 = v77;
    if (v246 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
    {
      *(_DWORD *)v310 = 138412290;
      *(_QWORD *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v78, OS_SIGNPOST_INTERVAL_END, spid, "ExtendedCuratedAsset", "%@", v310, 0xCu);
    }

    v79 = v78;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
      v80 = (float)((float)((float)(v74 - v243) * (float)v75) / (float)v76) / 1000000.0;
      v81 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(_QWORD *)v311 = "ExtendedCuratedAsset";
      *(_WORD *)&v311[8] = 2112;
      *(_QWORD *)&v311[10] = v81;
      *(_WORD *)&v311[18] = 2048;
      v312 = v80;
      _os_log_impl(&dword_1CA237000, v79, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

    }
    v82 = self->_loggingConnection;
    v83 = os_signpost_id_generate((os_log_t)v82);
    spida = v82;
    v244 = v83;
    v84 = v83 - 1;
    if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(spida))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, spida, OS_SIGNPOST_INTERVAL_BEGIN, v83, "CuratedAsset", ", v310, 2u);
    }

    v292 = 0;
    mach_timebase_info(&v292);
    v240 = mach_absolute_time();
    objc_msgSend(v279, "curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:", v260, v254, v9);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (v306[24])
    {
      v306[24] = 1;
LABEL_115:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 347;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v16 = 0;
      goto LABEL_118;
    }
    v85 = objc_msgSend(v249, "isCancelledWithProgress:", 0.3);
    v306[24] = v85;
    if ((v85 & 1) != 0)
      goto LABEL_115;
    v237 = (os_log_t)MEMORY[0x1CAA4EB2C]();
    v289[0] = MEMORY[0x1E0C809B0];
    v289[1] = 3221225472;
    v289[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_193;
    v289[3] = &unk_1E84301E0;
    v291 = buf;
    v235 = v249;
    v290 = v235;
    -[PGEnrichedMemoryFactory _curatedAssetsWithFeeder:options:progressBlock:](self, "_curatedAssetsWithFeeder:options:progressBlock:", v268, v247, v289);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v306[24];
    if (v306[24])
    {
      v87 = MEMORY[0x1E0C81028];
      v88 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 356;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }

    }
    objc_autoreleasePoolPop(v237);
    if (v86)
      goto LABEL_125;
    +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", v250);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "allObjects");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGEnrichedMemory setCuratedAssetUUIDs:](v15, "setCuratedAssetUUIDs:", v90);

    v91 = mach_absolute_time();
    v92 = v292.numer;
    v93 = v292.denom;
    v94 = spida;
    v95 = v94;
    if (v84 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
    {
      *(_DWORD *)v310 = 138412290;
      *(_QWORD *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v95, OS_SIGNPOST_INTERVAL_END, v244, "CuratedAsset", "%@", v310, 0xCu);
    }

    v96 = v95;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
      v97 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(_QWORD *)v311 = "CuratedAsset";
      *(_WORD *)&v311[8] = 2112;
      *(_QWORD *)&v311[10] = v97;
      *(_WORD *)&v311[18] = 2048;
      v312 = (float)((float)((float)((float)(v91 - v240) * (float)v92) / (float)v93) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v96, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

    }
    v98 = objc_msgSend(v250, "count");
    v99 = objc_msgSend(v10, "minimumNumberOfCuratedAssets");
    v100 = v99;
    if (v98 < v99)
    {
      if (v306[24])
      {
        v306[24] = 1;
LABEL_147:
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_125:
          v16 = 0;
LABEL_126:

LABEL_118:
          goto LABEL_119;
        }
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 366;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        v109 = MEMORY[0x1E0C81028];
LABEL_149:
        _os_log_impl(&dword_1CA237000, v109, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
        goto LABEL_125;
      }
      v108 = objc_msgSend(v235, "isCancelledWithProgress:", 1.0);
      v306[24] = v108;
      if ((v108 & 1) != 0)
        goto LABEL_147;
      v133 = self->_loggingConnection;
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v310 = 67109634;
        *(_DWORD *)v311 = v98;
        *(_WORD *)&v311[4] = 1024;
        *(_DWORD *)&v311[6] = v100;
        *(_WORD *)&v311[10] = 2112;
        *(_QWORD *)&v311[12] = v9;
        _os_log_impl(&dword_1CA237000, v133, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] Not enough curated assets, found %d but require at least %d, returning nil enrichedMemory for %@", v310, 0x18u);
      }
      if (!v275)
        goto LABEL_125;
      -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 4);
LABEL_174:
      v16 = v15;
      goto LABEL_126;
    }
    if (log)
    {
      v101 = -[PGEnrichedMemoryFactory _numberOfGuestAssetInAssets:](self, "_numberOfGuestAssetInAssets:", v250);
      objc_msgSend(v10, "maximumRatioOfGuestAssets");
      v102 = (double)v101 / (double)v98;
      if (v102 > v103)
      {
        if (v306[24])
        {
          v306[24] = 1;
        }
        else
        {
          v134 = objc_msgSend(v235, "isCancelledWithProgress:", 1.0);
          v306[24] = v134;
          if ((v134 & 1) == 0)
          {
            v135 = self->_loggingConnection;
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v310 = 138412802;
              *(_QWORD *)v311 = v9;
              *(_WORD *)&v311[8] = 2048;
              *(_QWORD *)&v311[10] = v101;
              *(_WORD *)&v311[18] = 2048;
              *(_QWORD *)&v312 = (unint64_t)(v102 * (double)v98);
              _os_log_impl(&dword_1CA237000, v135, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] Too many guest assets featured for %@: %lu > %lu", v310, 0x20u);
            }
            if (!v275)
              goto LABEL_125;
            -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 5);
            goto LABEL_174;
          }
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_125;
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 381;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        v109 = MEMORY[0x1E0C81028];
        goto LABEL_149;
      }
      -[PGEnrichedMemory setFeaturesGuestAssets:](v15, "setFeaturesGuestAssets:", v101 != 0);
    }
    else
    {
      -[PGEnrichedMemory setFeaturesGuestAssets:](v15, "setFeaturesGuestAssets:", 0);
    }
    v104 = self->_loggingConnection;
    v105 = os_signpost_id_generate((os_log_t)v104);
    loga = v104;
    v241 = v105;
    v106 = v105 - 1;
    if (v106 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(loga))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, loga, OS_SIGNPOST_INTERVAL_BEGIN, v241, "RepresentativeAssets", ", v310, 2u);
    }

    v288 = 0;
    mach_timebase_info(&v288);
    v238 = (os_log_t)mach_absolute_time();
    objc_msgSend(v272, "allItems");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v285[0] = MEMORY[0x1E0C809B0];
    v285[1] = 3221225472;
    v285[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_196;
    v285[3] = &unk_1E84301E0;
    v287 = buf;
    v236 = v235;
    v286 = v236;
    +[PGCurationManager representativeAssetsForAssets:extendedCuratedAssets:progressBlock:](PGCurationManager, "representativeAssetsForAssets:extendedCuratedAssets:progressBlock:", v107, contexta, v285);
    v245 = (void *)objc_claimAutoreleasedReturnValue();

    if (v306[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 402;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v16 = 0;
      goto LABEL_214;
    }
    +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", v245);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "allObjects");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGEnrichedMemory setRepresentativeAssetUUIDs:](v15, "setRepresentativeAssetUUIDs:", v111);

    v112 = mach_absolute_time();
    v113 = v288.numer;
    v114 = v288.denom;
    v115 = loga;
    v116 = v115;
    if (v106 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
    {
      *(_DWORD *)v310 = 138412290;
      *(_QWORD *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v116, OS_SIGNPOST_INTERVAL_END, v241, "RepresentativeAssets", "%@", v310, 0xCu);
    }

    v117 = v116;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
      v118 = (float)((float)((float)(v112 - (unint64_t)v238) * (float)v113) / (float)v114) / 1000000.0;
      v119 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(_QWORD *)v311 = "RepresentativeAssets";
      *(_WORD *)&v311[8] = 2112;
      *(_QWORD *)&v311[10] = v119;
      *(_WORD *)&v311[18] = 2048;
      v312 = v118;
      _os_log_impl(&dword_1CA237000, v117, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

    }
    v120 = self->_loggingConnection;
    v121 = os_signpost_id_generate((os_log_t)v120);
    v239 = v120;
    v230 = v121;
    v122 = v121 - 1;
    if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v239))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v239, OS_SIGNPOST_INTERVAL_BEGIN, v121, "TitleGeneration", ", v310, 2u);
    }

    v284 = 0;
    mach_timebase_info(&v284);
    v225 = mach_absolute_time();
    objc_msgSend(v279, "titleGeneratorForTriggeredMemory:withKeyAsset:curatedAssets:extendedCuratedAssets:titleGenerationContext:inGraph:", v9, v266, v250, contexta, self->_titleGenerationContext, self->_graph);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    if (v242)
    {
      objc_msgSend(v242, "title");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "stringValue");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
      v234 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v234, "length"))
      {
        -[PGEnrichedMemory setTitle:](v15, "setTitle:", v234);
        objc_msgSend(v242, "subtitle");
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "stringValue");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGEnrichedMemory setSubtitle:](v15, "setSubtitle:", v124);

        -[PGEnrichedMemory subtitle](v15, "subtitle");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = objc_msgSend(v125, "length") == 0;

        if (v126)
        {
          if (v306[24])
          {
            v306[24] = 1;
          }
          else
          {
            v146 = objc_msgSend(v236, "isCancelledWithProgress:", 1.0);
            v306[24] = v146;
            if ((v146 & 1) == 0)
            {
              v163 = self->_loggingConnection;
              if (os_log_type_enabled((os_log_t)v163, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v310 = 138412290;
                *(_QWORD *)v311 = v9;
                _os_log_error_impl(&dword_1CA237000, (os_log_t)v163, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] No subtitle generated, returning nil enrichedMemory for %@", v310, 0xCu);
              }

              if (v275)
              {
                -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 8);
                v16 = v15;
                goto LABEL_211;
              }
LABEL_210:
              v16 = 0;
LABEL_211:

              goto LABEL_212;
            }
          }
          v147 = MEMORY[0x1E0C81028];
          v148 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v310 = 67109378;
            *(_DWORD *)v311 = 440;
            *(_WORD *)&v311[4] = 2080;
            *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Memories/PGEnrichedMemoryFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          }
LABEL_209:

          goto LABEL_210;
        }
        -[PGEnrichedMemory setTitleCategory:](v15, "setTitleCategory:", objc_msgSend(v233, "category"));
        v276 = mach_absolute_time();
        v127 = v284.numer;
        v128 = v284.denom;
        v129 = v239;
        v130 = v129;
        if (v122 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v129))
        {
          *(_DWORD *)v310 = 138412290;
          *(_QWORD *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v130, OS_SIGNPOST_INTERVAL_END, v230, "TitleGeneration", "%@", v310, 0xCu);
        }

        v131 = v130;
        if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
          v132 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v310 = 136315650;
          *(_QWORD *)v311 = "TitleGeneration";
          *(_WORD *)&v311[8] = 2112;
          *(_QWORD *)&v311[10] = v132;
          *(_WORD *)&v311[18] = 2048;
          v312 = (float)((float)((float)((float)(v276 - v225) * (float)v127) / (float)v128) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v131, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

        }
        if (v306[24])
        {
          v306[24] = 1;
          goto LABEL_194;
        }
        v139 = objc_msgSend(v236, "isCancelledWithProgress:", 0.5);
        v306[24] = v139;
        if ((v139 & 1) != 0)
        {
LABEL_194:
          v140 = MEMORY[0x1E0C81028];
          v141 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v310 = 67109378;
            *(_DWORD *)v311 = 451;
            *(_WORD *)&v311[4] = 2080;
            *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Memories/PGEnrichedMemoryFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          }
          goto LABEL_209;
        }
        v149 = self->_loggingConnection;
        v150 = os_signpost_id_generate((os_log_t)v149);
        v151 = v149;
        v152 = v151;
        v231 = v150;
        v153 = v150 - 1;
        if (v153 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
        {
          *(_WORD *)v310 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v152, OS_SIGNPOST_INTERVAL_BEGIN, v231, "ChapterTitleGeneration", ", v310, 2u);
        }

        v283 = 0;
        mach_timebase_info(&v283);
        v226 = mach_absolute_time();
        objc_msgSend(v279, "chapterTitleGeneratorForTriggeredMemory:curatedAssets:extendedCuratedAssets:titleGenerationContext:inGraph:", v9, v250, contexta, self->_titleGenerationContext, self->_graph);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        if (v277)
        {
          objc_msgSend(v277, "generateChapterTitles");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGEnrichedMemory setChapterTitles:](v15, "setChapterTitles:", v154);

        }
        v155 = mach_absolute_time();
        v156 = v283.numer;
        v157 = v283.denom;
        v158 = v152;
        v159 = v158;
        if (v153 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v158))
        {
          *(_DWORD *)v310 = 138412290;
          *(_QWORD *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v159, OS_SIGNPOST_INTERVAL_END, v231, "ChapterTitleGeneration", "%@", v310, 0xCu);
        }

        v160 = v159;
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
          v161 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v310 = 136315650;
          *(_QWORD *)v311 = "ChapterTitleGeneration";
          *(_WORD *)&v311[8] = 2112;
          *(_QWORD *)&v311[10] = v161;
          *(_WORD *)&v311[18] = 2048;
          v312 = (float)((float)((float)((float)(v155 - v226) * (float)v156) / (float)v157) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v160, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

        }
        if (v306[24])
        {
          v306[24] = 1;
LABEL_236:
          v165 = MEMORY[0x1E0C81028];
          v166 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
          {
LABEL_239:
            v16 = 0;
LABEL_240:

            goto LABEL_211;
          }
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 460;
          *(_WORD *)&v311[4] = 2080;
          *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
LABEL_238:
          _os_log_impl(&dword_1CA237000, v165, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          goto LABEL_239;
        }
        v164 = objc_msgSend(v236, "isCancelledWithProgress:", 0.55);
        v306[24] = v164;
        if ((v164 & 1) != 0)
          goto LABEL_236;
        v167 = (void *)objc_opt_class();
        objc_msgSend(v10, "localDate");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGEnrichedMemory setNotificationLevel:](v15, "setNotificationLevel:", objc_msgSend(v167, "notificationLevelForTriggeredMemory:withLocalDate:graph:", v9, v168, self->_graph));

        v169 = (void *)objc_opt_class();
        v170 = -[PGEnrichedMemory notificationLevel](v15, "notificationLevel");
        -[PGEnrichedMemory electionScore](v15, "electionScore");
        objc_msgSend(v169, "notificationScoreForNotificationLevel:electionScore:", v170);
        -[PGEnrichedMemory setScore:](v15, "setScore:");
        if (v306[24])
        {
          v306[24] = 1;
LABEL_244:
          v165 = MEMORY[0x1E0C81028];
          v172 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
            goto LABEL_239;
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 466;
          *(_WORD *)&v311[4] = 2080;
          *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
          goto LABEL_238;
        }
        v171 = objc_msgSend(v236, "isCancelledWithProgress:", 0.6);
        v306[24] = v171;
        if ((v171 & 1) != 0)
          goto LABEL_244;
        v173 = self->_loggingConnection;
        v217 = os_signpost_id_generate((os_log_t)v173);
        v220 = v173;
        if (v217 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v220))
        {
          *(_WORD *)v310 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v220, OS_SIGNPOST_INTERVAL_BEGIN, v217, "MoodGenerator", ", v310, 2u);
        }

        v282 = 0;
        mach_timebase_info(&v282);
        v215 = mach_absolute_time();
        v232 = objc_alloc_init(PGMoodGeneratorOptions);
        -[PGMoodGeneratorOptions setPrefetchedAssets:](v232, "setPrefetchedAssets:", contexta);
        objc_msgSend(v10, "moodHistory");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMoodGeneratorOptions setMoodHistory:](v232, "setMoodHistory:", v174);

        v227 = (void *)MEMORY[0x1E0D4B130];
        objc_msgSend(v10, "localDate");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeZone");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v227, "universalDateFromLocalDate:inTimeZone:", v175, v176);
        v224 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGMoodGeneratorOptions setReferenceDate:](v232, "setReferenceDate:", v224);
        v177 = -[PGMoodGenerationContext initWithReferenceDate:]([PGMoodGenerationContext alloc], "initWithReferenceDate:", v224);
        -[PGMoodGeneratorOptions setMoodGenerationContext:](v232, "setMoodGenerationContext:", v177);

        v178 = [PGMoodGenerator alloc];
        -[PGMemoryCurationSession photoLibrary](self->_memoryCurationSession, "photoLibrary");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        v228 = -[PGMoodGenerator initWithEnrichedMemory:photoLibrary:options:](v178, "initWithEnrichedMemory:photoLibrary:options:", v15, v179, v232);

        -[PGEnrichedMemory setSuggestedMood:](v15, "setSuggestedMood:", -[PGMoodGenerator suggestedMoodWithGraph:](v228, "suggestedMoodWithGraph:", self->_graph));
        -[PGEnrichedMemory setForbiddenMoods:](v15, "setForbiddenMoods:", -[PGMoodGenerator forbiddenMoodsWithGraph:](v228, "forbiddenMoodsWithGraph:", self->_graph));
        -[PGEnrichedMemory setRecommendedMoods:](v15, "setRecommendedMoods:", -[PGMoodGenerator recommendedMoodsWithGraph:](v228, "recommendedMoodsWithGraph:", self->_graph));
        -[PGMoodGenerator positiveMoodVectorWithGraph:](v228, "positiveMoodVectorWithGraph:", self->_graph);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGEnrichedMemory setPositiveMoodVector:](v15, "setPositiveMoodVector:", v180);

        v181 = mach_absolute_time();
        v182 = v282;
        v183 = v220;
        v184 = v183;
        if (v217 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v183))
        {
          *(_DWORD *)v310 = 138412290;
          *(_QWORD *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v184, OS_SIGNPOST_INTERVAL_END, v217, "MoodGenerator", "%@", v310, 0xCu);
        }

        v165 = v184;
        if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
          v185 = (float)((float)((float)(v181 - v215) * (float)v182.numer) / (float)v182.denom) / 1000000.0;
          v186 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v310 = 136315650;
          *(_QWORD *)v311 = "MoodGenerator";
          *(_WORD *)&v311[8] = 2112;
          *(_QWORD *)&v311[10] = v186;
          *(_WORD *)&v311[18] = 2048;
          v312 = v185;
          _os_log_impl(&dword_1CA237000, v165, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

        }
        if (v306[24])
        {
          v306[24] = 1;
          goto LABEL_257;
        }
        v187 = objc_msgSend(v236, "isCancelledWithProgress:", 0.7);
        v306[24] = v187;
        if ((v187 & 1) != 0)
        {
LABEL_257:
          v188 = MEMORY[0x1E0C81028];
          v189 = MEMORY[0x1E0C81028];
          v190 = v188;
          if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v310 = 67109378;
            *(_DWORD *)v311 = 485;
            *(_WORD *)&v311[4] = 2080;
            *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Memories/PGEnrichedMemoryFactory.m";
            v190 = MEMORY[0x1E0C81028];
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          }
          goto LABEL_273;
        }
        v221 = self->_loggingConnection;
        v191 = os_signpost_id_generate((os_log_t)v221);
        v222 = v221;
        v214 = v191;
        v216 = v191 - 1;
        if (v191 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v222))
        {
          *(_WORD *)v310 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v222, OS_SIGNPOST_INTERVAL_BEGIN, v191, "MoodKeywordComputer", ", v310, 2u);
        }

        v281 = 0;
        mach_timebase_info(&v281);
        v213 = mach_absolute_time();
        moodKeywordComputer = self->_moodKeywordComputer;
        v218 = -[PGEnrichedMemory suggestedMood](v15, "suggestedMood");
        graph = self->_graph;
        -[PGMemoryCurationSession locationHelper](self->_memoryCurationSession, "locationHelper");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMoodKeywordComputer moodKeywordsForTriggeredMemory:suggestedMood:inGraph:locationHelper:](moodKeywordComputer, "moodKeywordsForTriggeredMemory:suggestedMood:inGraph:locationHelper:", v9, v218, graph, v193);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGEnrichedMemory setLegacyMoodKeywords:](v15, "setLegacyMoodKeywords:", v194);

        v195 = mach_absolute_time();
        v196 = v281;
        v197 = v222;
        v198 = v197;
        if (v216 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v197))
        {
          *(_DWORD *)v310 = 138412290;
          *(_QWORD *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v198, OS_SIGNPOST_INTERVAL_END, v214, "MoodKeywordComputer", "%@", v310, 0xCu);
        }

        v190 = v198;
        if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
          v199 = (float)((float)((float)(v195 - v213) * (float)v196.numer) / (float)v196.denom) / 1000000.0;
          v200 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v310 = 136315650;
          *(_QWORD *)v311 = "MoodKeywordComputer";
          *(_WORD *)&v311[8] = 2112;
          *(_QWORD *)&v311[10] = v200;
          *(_WORD *)&v311[18] = 2048;
          v312 = v199;
          _os_log_impl(&dword_1CA237000, v190, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

        }
        if (v306[24])
        {
          v306[24] = 1;
        }
        else
        {
          v201 = objc_msgSend(v236, "isCancelledWithProgress:", 0.8);
          v306[24] = v201;
          if ((v201 & 1) == 0)
          {
            v223 = (os_log_t)mach_absolute_time();
            v205 = info.numer;
            v204 = info.denom;
            v206 = v14;
            v207 = v206;
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v206))
            {
              *(_DWORD *)v310 = 138412290;
              *(_QWORD *)v311 = v274;
              _os_signpost_emit_with_name_impl(&dword_1CA237000, v207, OS_SIGNPOST_INTERVAL_END, v12, "MemoryElectionEnrichment", "%@", v310, 0xCu);
            }

            v208 = v207;
            if (os_log_type_enabled(v208, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v274);
              v209 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v310 = 136315650;
              *(_QWORD *)v311 = "MemoryElectionEnrichment";
              *(_WORD *)&v311[8] = 2112;
              *(_QWORD *)&v311[10] = v209;
              *(_WORD *)&v311[18] = 2048;
              v312 = (float)((float)((float)((float)((unint64_t)v223 - v273) * (float)v205) / (float)v204)
                           / 1000000.0);
              _os_log_impl(&dword_1CA237000, v208, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);

            }
            if (v306[24])
            {
              v306[24] = 1;
            }
            else
            {
              v210 = objc_msgSend(v236, "isCancelledWithProgress:", 1.0);
              v306[24] = v210;
              if ((v210 & 1) == 0)
              {
                v16 = v15;
                goto LABEL_274;
              }
            }
            v211 = MEMORY[0x1E0C81028];
            v212 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v310 = 67109378;
              *(_DWORD *)v311 = 495;
              *(_WORD *)&v311[4] = 2080;
              *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/PGEnrichedMemoryFactory.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
            }
            goto LABEL_272;
          }
        }
        v202 = MEMORY[0x1E0C81028];
        v203 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 492;
          *(_WORD *)&v311[4] = 2080;
          *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
        }
LABEL_272:

LABEL_273:
        v16 = 0;
LABEL_274:

        goto LABEL_240;
      }
      if (v306[24])
      {
        v306[24] = 1;
      }
      else
      {
        v142 = objc_msgSend(v236, "isCancelledWithProgress:", 1.0);
        v306[24] = v142;
        if ((v142 & 1) == 0)
        {
          v162 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v162, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v310 = 138412290;
            *(_QWORD *)v311 = v9;
            _os_log_error_impl(&dword_1CA237000, (os_log_t)v162, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] No title generated, returning nil enrichedMemory for %@", v310, 0xCu);
          }

          if (v275)
          {
            -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 7);
            v16 = v15;
            goto LABEL_212;
          }
          goto LABEL_201;
        }
      }
      v143 = MEMORY[0x1E0C81028];
      v144 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 426;
        *(_WORD *)&v311[4] = 2080;
        *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }

LABEL_201:
      v16 = 0;
LABEL_212:

      goto LABEL_213;
    }
    if (v306[24])
    {
      v306[24] = 1;
    }
    else
    {
      v136 = objc_msgSend(v236, "isCancelledWithProgress:", 1.0);
      v306[24] = v136;
      if ((v136 & 1) == 0)
      {
        v145 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v145, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v310 = 138412290;
          *(_QWORD *)v311 = v9;
          _os_log_impl(&dword_1CA237000, (os_log_t)v145, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] Nil titleGenerator, returning nil enrichedMemory for %@", v310, 0xCu);
        }

        if (v275)
        {
          -[PGEnrichedMemory setFailureReason:](v15, "setFailureReason:", 6);
          v16 = v15;
          goto LABEL_213;
        }
LABEL_192:
        v16 = 0;
LABEL_213:

LABEL_214:
        goto LABEL_126;
      }
    }
    v137 = MEMORY[0x1E0C81028];
    v138 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v310 = 67109378;
      *(_DWORD *)v311 = 412;
      *(_WORD *)&v311[4] = 2080;
      *(_QWORD *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
    }

    goto LABEL_192;
  }
  v16 = v15;
LABEL_29:

  return v16;
}

- (id)curatedAssetUUIDsWithTriggeredMemory:(id)a3 keyAsset:(id)a4 extendedCuratedAssetUUIDs:(id)a5 targetCurationDuration:(double)a6 allowGuestAsset:(BOOL)a7 progressReporter:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  OS_os_log *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  id v23;
  int v24;
  id v25;
  uint8_t v26;
  NSObject *v27;
  uint8_t v28;
  OS_os_log *v30;
  objc_class *v31;
  void *v32;
  uint8_t v33;
  void *v34;
  void *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  uint8_t v42;
  void *v43;
  uint32_t denom;
  uint32_t numer;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint32_t v50;
  uint32_t v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  uint8_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  os_signpost_id_t spid;
  void *spidb;
  os_signpost_id_t spida;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  OS_os_log *v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  uint8_t *v78;
  mach_timebase_info v79;
  _QWORD v80[4];
  id v81;
  uint8_t buf[8];
  uint8_t *v83;
  uint64_t v84;
  char v85;
  mach_timebase_info info;
  uint8_t v87[4];
  _BYTE v88[18];
  __int16 v89;
  double v90;
  uint64_t v91;

  v9 = a7;
  v91 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v74 = a4;
  v75 = a5;
  v15 = a8;
  v16 = self->_loggingConnection;
  v17 = os_signpost_id_generate((os_log_t)v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MemoryCurationForLength", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v20 = mach_absolute_time();
  -[PGEnrichedMemoryFactory _memoryEnricherFromTriggeredMemory:](self, "_memoryEnricherFromTriggeredMemory:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    *(_QWORD *)buf = 0;
    v83 = buf;
    v84 = 0x2020000000;
    v85 = 0;
    v24 = objc_msgSend(v23, "isCancelledWithProgress:", 0.0);
    v83[24] = v24;
    if (v24)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 509;
        *(_WORD *)&v88[4] = 2080;
        *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      v25 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_24;
    }
    objc_msgSend(v21, "relevantFeederForTriggeredMemory:inGraph:allowGuestAsset:progressReporter:", v14, self->_graph, v9, v23);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v72)
    {
      if (v83[24])
      {
        v83[24] = 1;
      }
      else
      {
        v28 = objc_msgSend(v23, "isCancelledWithProgress:", 1.0);
        v83[24] = v28;
        if ((v28 & 1) == 0)
        {
          v30 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v87 = 138412290;
            *(_QWORD *)v88 = v32;
            _os_log_impl(&dword_1CA237000, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] nil feeder for triggered memory from enricher %@", v87, 0xCu);

          }
          goto LABEL_22;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 513;
        *(_WORD *)&v88[4] = 2080;
        *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        v27 = MEMORY[0x1E0C81028];
        goto LABEL_21;
      }
LABEL_22:
      v25 = (id)MEMORY[0x1E0C9AA60];
LABEL_23:

LABEL_24:
      _Block_object_dispose(buf, 8);

      goto LABEL_25;
    }
    if (v83[24])
    {
      v83[24] = 1;
      goto LABEL_16;
    }
    v26 = objc_msgSend(v23, "isCancelledWithProgress:", 0.05);
    v83[24] = v26;
    if ((v26 & 1) != 0)
    {
LABEL_16:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 518;
        *(_WORD *)&v88[4] = 2080;
        *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        v27 = MEMORY[0x1E0C81028];
LABEL_21:
        _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    objc_msgSend(v21, "relevantCurationFeederForTriggeredMemory:relevantFeeder:inGraph:allowGuestAsset:progressReporter:", v14, v72, self->_graph, v9, v23);
    v71 = (id)objc_claimAutoreleasedReturnValue();
    if (!v71)
      v71 = v72;
    if (v83[24])
    {
      v83[24] = 1;
LABEL_34:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 526;
        *(_WORD *)&v88[4] = 2080;
        *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      v25 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_37;
    }
    v33 = objc_msgSend(v23, "isCancelledWithProgress:", 0.3);
    v83[24] = v33;
    if ((v33 & 1) != 0)
      goto LABEL_34;
    objc_msgSend(v21, "uuidsOfRequiredAssetsWithKeyAsset:triggeredMemory:inGraph:progressReporter:", v74, v14, self->_graph, v23);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0CB3880];
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke;
    v80[3] = &unk_1E8430208;
    v65 = v75;
    v81 = v65;
    objc_msgSend(v34, "predicateWithBlock:", v80);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "filteredSetUsingPredicate:", v35);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = self->_loggingConnection;
    v36 = os_signpost_id_generate((os_log_t)v69);
    v37 = v69;
    v38 = v37;
    v61 = v36 - 1;
    spid = v36;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v39 = v37;
      v40 = os_signpost_enabled(v37);
      v38 = v39;
      if (v40)
      {
        *(_WORD *)v87 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CuratedAsset", ", v87, 2u);
        v38 = v39;
      }
    }
    v70 = v38;

    v79 = 0;
    mach_timebase_info(&v79);
    v60 = mach_absolute_time();
    objc_msgSend(v21, "curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:", v67, v65, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setUseDurationBasedCuration:", 1);
    objc_msgSend(v41, "setMinimumDuration:", 0.0);
    objc_msgSend(v41, "setTargetDuration:", a6);
    objc_msgSend(v41, "setFailIfMinimumDurationNotReached:", 0);
    if (v83[24])
    {
      v83[24] = 1;
LABEL_44:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 543;
        *(_WORD *)&v88[4] = 2080;
        *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      v25 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_47;
    }
    v42 = objc_msgSend(v23, "isCancelledWithProgress:", 0.35);
    v83[24] = v42;
    if ((v42 & 1) != 0)
      goto LABEL_44;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke_213;
    v76[3] = &unk_1E84301E0;
    v78 = buf;
    v59 = v23;
    v77 = v59;
    -[PGEnrichedMemoryFactory _curatedAssetsWithFeeder:options:progressBlock:](self, "_curatedAssetsWithFeeder:options:progressBlock:", v71, v41, v76);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 548;
        *(_WORD *)&v88[4] = 2080;
        *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      v25 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_69;
    }
    +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", v66);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "allObjects");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = mach_absolute_time();
    numer = v79.numer;
    denom = v79.denom;
    v46 = v70;
    v47 = v46;
    if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_DWORD *)v87 = 138412290;
      *(_QWORD *)v88 = v73;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v47, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAsset", "%@", v87, 0xCu);
    }

    v48 = v47;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v73);
      v49 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v87 = 136315650;
      *(_QWORD *)v88 = "CuratedAsset";
      *(_WORD *)&v88[8] = 2112;
      *(_QWORD *)&v88[10] = v49;
      v89 = 2048;
      v90 = (float)((float)((float)((float)(v57 - v60) * (float)numer) / (float)denom) / 1000000.0);
      spidb = (void *)v49;
      _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v87, 0x20u);

    }
    spida = mach_absolute_time();
    v51 = info.numer;
    v50 = info.denom;
    v52 = v19;
    v53 = v52;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_DWORD *)v87 = 138412290;
      *(_QWORD *)v88 = v73;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v53, OS_SIGNPOST_INTERVAL_END, v17, "MemoryCurationForLength", "%@", v87, 0xCu);
    }

    v54 = v53;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v73);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v87 = 136315650;
      *(_QWORD *)v88 = "MemoryCurationForLength";
      *(_WORD *)&v88[8] = 2112;
      *(_QWORD *)&v88[10] = v55;
      v89 = 2048;
      v90 = (float)((float)((float)((float)(spida - v20) * (float)v51) / (float)v50) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v87, 0x20u);

    }
    if (v83[24])
    {
      v83[24] = 1;
    }
    else
    {
      v56 = objc_msgSend(v59, "isCancelledWithProgress:", 1.0);
      v83[24] = v56;
      if ((v56 & 1) == 0)
      {
        v25 = v58;
LABEL_68:

LABEL_69:
LABEL_47:

LABEL_37:
        goto LABEL_23;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v87 = 67109378;
      *(_DWORD *)v88 = 555;
      *(_WORD *)&v88[4] = 2080;
      *(_QWORD *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
    }
    v25 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_68;
  }
  v25 = (id)MEMORY[0x1E0C9AA60];
LABEL_25:

  return v25;
}

- (unint64_t)_numberOfGuestAssetInAssets:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sourceType") == 32)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_keyAssetWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PGKeyCurator_PHAsset *v14;
  void *v15;
  PGKeyCurator_PHAsset *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGMemoryCurationSession curationManager](self->_memoryCurationSession, "curationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "referencePersonLocalIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(v8, "allItems");
    v14 = (PGKeyCurator_PHAsset *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "referencePersonLocalIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestAssetInAssets:forReferencePersonLocalIdentifiers:requiredMinimumNumberOfReferencePersons:forMemories:allowGuestAsset:wantsGoodSquareCropScore:", v14, v15, objc_msgSend(v9, "minimumNumberOfReferencePersons"), 1, objc_msgSend(v9, "allowGuestAsset"), objc_msgSend(v9, "wantsGoodSquareCropScore"));
  }
  else
  {
    v16 = [PGKeyCurator_PHAsset alloc];
    objc_msgSend(v11, "curationCriteriaFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PGKeyCurator initWithCurationCriteriaFactory:](v16, "initWithCurationCriteriaFactory:", v17);

    objc_msgSend(v9, "curationCriteria");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGKeyCurator_PHAsset keyAssetWithFeeder:options:criteria:debugInfo:progressBlock:](v14, "keyAssetWithFeeder:options:criteria:debugInfo:progressBlock:", v8, v9, v15, 0, v10);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_curatedAssetsWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGCurator_PHAsset *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PGCurator_PHAsset);
  -[PGCurator setLoggingConnection:](v11, "setLoggingConnection:", self->_loggingConnection);
  -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v11, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v10, v9, 0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_extendedCuratedAssetsWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  char v12;
  id v13;
  void *v14;
  PGDejunkerDeduper_PHAsset *v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double Current;
  char v29;
  void *v31;
  PGCurationOptions *v32;
  id v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = a5;
  v10 = _Block_copy(v9);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = 0;
  if (!v10
    || (v11 = CFAbsoluteTimeGetCurrent(), v11 - v48[3] < 0.01)
    || (v48[3] = v11,
        v46 = 0,
        (*((void (**)(void *, char *, double))v10 + 2))(v10, &v46, 0.0),
        v12 = *((_BYTE *)v52 + 24) | v46,
        (*((_BYTE *)v52 + 24) = v12) == 0))
  {
    objc_msgSend(v8, "allItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      v13 = v14;
LABEL_27:

      goto LABEL_28;
    }
    -[PGMemoryCurationSession photoLibrary](self->_memoryCurationSession, "photoLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGDejunkerDeduper initWithSimilarityModelClass:]([PGDejunkerDeduper_PHAsset alloc], "initWithSimilarityModelClass:", objc_opt_class());
    -[PGDejunkerDeduper setLoggingConnection:](v15, "setLoggingConnection:", self->_loggingConnection);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke;
    v41[3] = &unk_1E8434F30;
    v33 = v10;
    v42 = v33;
    v43 = &v47;
    v44 = &v51;
    v45 = 0x3F847AE147AE147BLL;
    -[PGDejunkerDeduper_PHAsset dejunkedDedupedAssetsInAssets:options:debugInfo:progressBlock:](v15, "dejunkedDedupedAssetsInAssets:options:debugInfo:progressBlock:", v14, v35, 0, v41);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v52 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v56 = 607;
        v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/PGEnrichedMemoryFactory.m";
        v17 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v18 = +[PGCurationManager maximumNumberOfItemsForDuration:withTotalNumberOfItems:](PGCurationManager, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", 10, -1);
      if (objc_msgSend(v16, "count") > v18)
      {
        v32 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", objc_msgSend(v35, "duration"));
        -[PGCurationOptions setLastPassMovieAdditionEnabled:](v32, "setLastPassMovieAdditionEnabled:", 0);
        objc_msgSend(v35, "identifiersOfRequiredItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGCurationOptions setUuidsOfRequiredAssets:](v32, "setUuidsOfRequiredAssets:", v19);

        v20 = objc_alloc(MEMORY[0x1E0CD1620]);
        v21 = (void *)MEMORY[0x1E0C99E60];
        +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v20, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v16, v34, 0, v23, 0, 0);

        v24 = objc_alloc(MEMORY[0x1E0D4B1B8]);
        -[PGMemoryCurationSession curationContext](self->_memoryCurationSession, "curationContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithAssetFetchResult:curationContext:", v31, v25);

        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke_223;
        v36[3] = &unk_1E8434F30;
        v37 = v33;
        v38 = &v47;
        v39 = &v51;
        v40 = 0x3F847AE147AE147BLL;
        -[PGEnrichedMemoryFactory _curatedAssetsWithFeeder:options:progressBlock:](self, "_curatedAssetsWithFeeder:options:progressBlock:", v26, v32, v36);
        v27 = objc_claimAutoreleasedReturnValue();

        if (*((_BYTE *)v52 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v56 = 621;
            v57 = 2080;
            v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memo"
                  "ries/PGEnrichedMemoryFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v13 = (id)MEMORY[0x1E0C9AA60];
          v16 = (id)v27;
          goto LABEL_26;
        }

        v16 = (id)v27;
      }
      if (!v10
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v48[3] < 0.01)
        || (v48[3] = Current,
            v46 = 0,
            (*((void (**)(id, char *, double))v33 + 2))(v33, &v46, 1.0),
            v29 = *((_BYTE *)v52 + 24) | v46,
            (*((_BYTE *)v52 + 24) = v29) == 0))
      {
        v16 = v16;
        v13 = v16;
        goto LABEL_26;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v56 = 624;
        v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/PGEnrichedMemoryFactory.m";
        v17 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_26:

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v56 = 593;
    v57 = 2080;
    v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/PGE"
          "nrichedMemoryFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_28:
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_memoryCurationSession, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_moodKeywordComputer, 0);
}

void __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke_223(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke_213(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.05 + 0.25);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.05 + 0.15);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_189(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.05 + 0.2);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_191(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.05 + 0.25);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_193(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.05 + 0.3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_196(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.1 + 0.4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
