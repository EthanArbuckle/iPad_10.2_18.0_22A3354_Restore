@implementation PHAMetricsHelper

+ (id)memoryCategoryValueToDataAggregationKeyLookup
{
  if (memoryCategoryValueToDataAggregationKeyLookup_onceToken != -1)
    dispatch_once(&memoryCategoryValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_1028);
  return (id)memoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;
}

+ (id)legacyMemoryCategoryValueToDataAggregationKeyLookup
{
  if (legacyMemoryCategoryValueToDataAggregationKeyLookup_onceToken != -1)
    dispatch_once(&legacyMemoryCategoryValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_173);
  return (id)legacyMemoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;
}

+ (id)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup
{
  if (memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_onceToken != -1)
    dispatch_once(&memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_204);
  return (id)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;
}

+ (id)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup
{
  if (memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_onceToken[0] != -1)
    dispatch_once(memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_210);
  return (id)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;
}

+ (id)aggregatedStatsForSuggestedMoodCountVector:(id)a3
{
  void *v3;
  id v4;
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
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("dreamySuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("sentimentalSuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("gentleSuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("chillSuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("happySuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("upliftingSuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 128);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("epicSuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 256);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("clubSuggestedMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 512);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("extremeSuggestedMoodCount"));

  objc_msgSend(v4, "valueForMood:", 16);
  v16 = v15;
  v17 = (unint64_t)v15;
  objc_msgSend(v4, "sum");
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v19 - (double)(unint64_t)v16));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v20, CFSTR("suggestedMoodCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("nonSuggestedMoodCount"));

  return v5;
}

+ (id)aggregatedStatsForPossibleMoodCountVector:(id)a3
{
  void *v3;
  id v4;
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

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("dreamyPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("sentimentalPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("gentlePossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("chillPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("happyPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("upliftingPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 128);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("epicPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 256);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("clubPossibleMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 512);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("extremePossibleMoodCount"));
  return v5;
}

+ (id)aggregatedStatsForMiroMoodCountVector:(id)a3
{
  void *v3;
  id v4;
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

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("dreamyMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("sentimentalMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("gentleMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("chillMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("happyMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("upliftingMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 128);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("epicMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 256);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("clubMiroMoodCount"));

  objc_msgSend(v4, "objectAtIndexedSubscript:", 512);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("extremeMiroMoodCount"));
  return v5;
}

+ (id)aggregatedStatsForMoodKeywordCountedSet:(id)a3
{
  void *v3;
  id v4;
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
  uint64_t v26;
  void *v27;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76520]));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("disneyKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76578]));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("universalKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76550]));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("newYorkCityKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76540]));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("londonKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76558]));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("parisKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76538]));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("hawaiiKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76570]));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("sportsKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D764F8]));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("anniversaryKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76510]));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("birthdayKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76580]));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("weddingKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76528]));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v16, CFSTR("familyKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76560]));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("partyKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76530]));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v18, CFSTR("gatheringKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76568]));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("petsKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76500]));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v20, CFSTR("babiesKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76588]));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("winterHolidayKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76508]));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v22, CFSTR("beachKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76548]));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v23, CFSTR("natureKeywordCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E0D76518]));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v24, CFSTR("chineseLunarNewYearKeywordCount"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  v26 = objc_msgSend(v4, "countForObject:", CFSTR("None"));

  objc_msgSend(v25, "numberWithUnsignedInteger:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v27, CFSTR("noneKeywordCount"));

  return v5;
}

+ (id)dataAggregationKeyForCategory:(unint64_t)a3 subCategory:(unint64_t)a4 lookupTable:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v10;
  }

  return v12;
}

+ (BOOL)shouldAggregateDataForReporting:(unint64_t)a3
{
  return a3 == 2;
}

+ (id)fullMemoryTypeStringForMemory:(id)a3 withWorkingContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  __CFString *v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1014;
  v24 = __Block_byref_object_dispose__1015;
  v25 = CFSTR("Unknown");
  objc_msgSend(v5, "photosGraphProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("memoryCategorySubcategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v5, "photosGraphProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("encodedFeatures"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D75D28], "featuresForEncodedFeatures:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PHAMetricsHelper_fullMemoryTypeStringForMemory_withWorkingContext___block_invoke;
  v16[3] = &unk_1E851F828;
  v13 = v12;
  v17 = v13;
  v18 = &v20;
  v19 = v9;
  objc_msgSend(v6, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __69__PHAMetricsHelper_fullMemoryTypeStringForMemory_withWorkingContext___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "graph");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75F90], "featureNodeCollectionWithFeatures:inGraph:", a1[4], v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75FB8], "fullMemoryTypeStringWithMemoryCategorySubcategory:featureNodes:", a1[6], v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __75__PHAMetricsHelper_memoryBlockedFeatureTypeValueToDataAggregationKeyLookup__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E85408C8;
  v2[1] = &unk_1E85408E0;
  v3[0] = CFSTR("numberOfLocationBlacklistedFeatures");
  v3[1] = CFSTR("numberOfAreaBlacklistedFeatures");
  v2[2] = &unk_1E85408F8;
  v2[3] = &unk_1E8540538;
  v3[2] = CFSTR("numberOfPersonBlacklistedFeatures");
  v3[3] = CFSTR("numberOfDateBlacklistedFeatures");
  v2[4] = &unk_1E8540910;
  v2[5] = &unk_1E8540928;
  v3[4] = CFSTR("numberOfDateBlacklistedFeatures");
  v3[5] = CFSTR("numberOfHolidayBlacklistedFeatures");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;
  memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable = v0;

}

void __77__PHAMetricsHelper_memoryBlockableFeatureTypeValueToDataAggregationKeyLookup__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E85408C8;
  v2[1] = &unk_1E85408E0;
  v3[0] = CFSTR("numberOfLocationBlacklistableFeatures");
  v3[1] = CFSTR("numberOfAreaBlacklistableFeatures");
  v2[2] = &unk_1E85408F8;
  v2[3] = &unk_1E8540538;
  v3[2] = CFSTR("numberOfPersonBlacklistableFeatures");
  v3[3] = CFSTR("numberOfDateBlacklistableFeatures");
  v2[4] = &unk_1E8540910;
  v2[5] = &unk_1E8540928;
  v3[4] = CFSTR("numberOfDateBlacklistableFeatures");
  v3[5] = CFSTR("numberOfHolidayBlacklistableFeatures");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;
  memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable = v0;

}

void __71__PHAMetricsHelper_legacyMemoryCategoryValueToDataAggregationKeyLookup__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[10];
  _QWORD v9[10];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[16];
  _QWORD v13[16];
  _QWORD v14[22];
  _QWORD v15[24];

  v15[22] = *MEMORY[0x1E0C80C00];
  v14[0] = &unk_1E85405F8;
  v14[1] = &unk_1E8540610;
  v15[0] = CFSTR("dayInHistoryMemoriesCount");
  v15[1] = CFSTR("holidayInHistoryMemoriesCount");
  v14[2] = &unk_1E8540628;
  v14[3] = &unk_1E8540640;
  v15[2] = CFSTR("celebrationInHistoryMemoriesCount");
  v15[3] = CFSTR("lastWeekendMemoriesCount");
  v14[4] = &unk_1E8540658;
  v14[5] = &unk_1E8540670;
  v15[4] = CFSTR("lastWeekMemoriesCount");
  v15[5] = CFSTR("weekInHistoryMemoriesCount");
  v14[6] = &unk_1E8540688;
  v14[7] = &unk_1E85406A0;
  v15[6] = CFSTR("throwbackThursdayMemoriesCount");
  v15[7] = CFSTR("peopleOverTimeMemoriesCount");
  v14[8] = &unk_1E85406B8;
  v14[9] = &unk_1E85406D0;
  v15[8] = CFSTR("earlyMomentWithPeopleMemoriesCount");
  v15[9] = CFSTR("lastSeasonMemoriesCount");
  v14[10] = &unk_1E85406E8;
  v14[11] = &unk_1E8540700;
  v15[10] = CFSTR("seasonInHistoryMemoriesCount");
  v15[11] = CFSTR("contextualMemoriesCount");
  v14[12] = &unk_1E8540718;
  v14[13] = &unk_1E8540730;
  v15[12] = CFSTR("nearbyMemoriesCount");
  v15[13] = CFSTR("yearSummaryMemoriesCount");
  v14[14] = &unk_1E8540748;
  v14[15] = &unk_1E8540760;
  v15[14] = CFSTR("bestOfPastMemoriesCount");
  v15[15] = CFSTR("celebrationOverTimeMemoriesCount");
  v14[16] = &unk_1E8540778;
  v14[17] = &unk_1E8540790;
  v15[16] = CFSTR("keyPeopleForUpcomingHolidayEventMemoriesCount");
  v15[17] = CFSTR("homeAggregationMemoriesCount");
  v14[18] = &unk_1E85407A8;
  v12[0] = &unk_1E8540730;
  v12[1] = &unk_1E85405F8;
  v13[0] = CFSTR("breakOutOfRoutineMemoriesCount");
  v13[1] = CFSTR("crowdMemoriesCount");
  v12[2] = &unk_1E85407C0;
  v12[3] = &unk_1E85407D8;
  v13[2] = CFSTR("tripMemoriesCount");
  v13[3] = CFSTR("weekendMemoriesCount");
  v12[4] = &unk_1E8540748;
  v12[5] = &unk_1E85407F0;
  v13[4] = CFSTR("pastSupersetMemoriesCount");
  v13[5] = CFSTR("sometimeMemoriesCount");
  v12[6] = &unk_1E8540640;
  v12[7] = &unk_1E8540658;
  v13[6] = CFSTR("socialGroupMemoriesCount");
  v13[7] = CFSTR("personMemoriesCount");
  v12[8] = &unk_1E8540808;
  v12[9] = &unk_1E85406D0;
  v13[8] = CFSTR("personBirthdayMemoriesCount");
  v13[9] = CFSTR("peopleVisitingMemoriesCount");
  v12[10] = &unk_1E8540610;
  v12[11] = &unk_1E8540688;
  v13[10] = CFSTR("meaningfulEventMemoriesCount");
  v13[11] = CFSTR("meaningfulEventAggregationMemoriesCount");
  v12[12] = &unk_1E8540628;
  v12[13] = &unk_1E85406E8;
  v13[12] = CFSTR("petMemoriesCount");
  v13[13] = CFSTR("babyMemoriesCount");
  v12[14] = &unk_1E8540760;
  v12[15] = &unk_1E8540778;
  v13[14] = CFSTR("recurrentTripMemoriesCount");
  v13[15] = CFSTR("foodieMemoriesCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 16);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[19] = &unk_1E8540820;
  v10[0] = &unk_1E8540838;
  v10[1] = &unk_1E8540850;
  v11[0] = CFSTR("locationOfInterestMemoriesCount");
  v11[1] = CFSTR("regionOfInterestMemoriesCount");
  v15[18] = v0;
  v10[2] = &unk_1E8540868;
  v11[2] = CFSTR("areaOfInterestMemoriesCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[19] = v1;
  v14[20] = &unk_1E8540880;
  v9[0] = CFSTR("recentEventMemoriesCount");
  v9[1] = CFSTR("recentEventPeopleMemoriesCount");
  v8[0] = &unk_1E8540898;
  v8[1] = &unk_1E8540700;
  v9[2] = CFSTR("recentEventHolidayMemoriesCount");
  v9[3] = CFSTR("recentEventCalendarMemoriesCount");
  v8[2] = &unk_1E8540718;
  v8[3] = &unk_1E85408B0;
  v8[4] = &unk_1E8540730;
  v8[5] = &unk_1E85405F8;
  v9[4] = CFSTR("recentEventBreakOutOfRoutineMemoriesCount");
  v9[5] = CFSTR("recentEventCrowdMemoriesCount");
  v8[6] = &unk_1E85407C0;
  v8[7] = &unk_1E85407D8;
  v9[6] = CFSTR("recentEventTripMemoriesCount");
  v9[7] = CFSTR("recentEventWeekendMemoriesCount");
  v8[8] = &unk_1E8540640;
  v8[9] = &unk_1E8540658;
  v9[8] = CFSTR("recentEventSocialEventMemoriesCount");
  v9[9] = CFSTR("recentEventPersonMemoriesCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[20] = v2;
  v14[21] = &unk_1E8540808;
  v6[0] = &unk_1E8540700;
  v6[1] = &unk_1E8540718;
  v7[0] = CFSTR("upcomingEventPeopleMemoriesCount");
  v7[1] = CFSTR("upcomingEventHolidayMemoriesCount");
  v6[2] = &unk_1E85408B0;
  v7[2] = CFSTR("upcomingEventCalendarMemoriesCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[21] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 22);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)legacyMemoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;
  legacyMemoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable = v4;

}

void __65__PHAMetricsHelper_memoryCategoryValueToDataAggregationKeyLookup__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E8540400;
  v2[1] = &unk_1E8540418;
  v3[0] = CFSTR("personMemoriesCount");
  v3[1] = CFSTR("personMemoriesCount");
  v2[2] = &unk_1E8540430;
  v2[3] = &unk_1E8540448;
  v3[2] = CFSTR("personMemoriesCount");
  v3[3] = CFSTR("socialGroupMemoriesCount");
  v2[4] = &unk_1E8540460;
  v2[5] = &unk_1E8540478;
  v3[4] = CFSTR("socialGroupMemoriesCount");
  v3[5] = CFSTR("homeAggregationMemoriesCount");
  v2[6] = &unk_1E8540490;
  v2[7] = &unk_1E85404A8;
  v3[6] = CFSTR("yearSummaryMemoriesCount");
  v3[7] = CFSTR("foodieMemoriesCount");
  v2[8] = &unk_1E85404C0;
  v2[9] = &unk_1E85404D8;
  v3[8] = CFSTR("petMemoriesCount");
  v3[9] = CFSTR("babyMemoriesCount");
  v2[10] = &unk_1E85404F0;
  v2[11] = &unk_1E8540508;
  v3[10] = CFSTR("locationOfInterestMemoriesCount");
  v3[11] = CFSTR("regionOfInterestMemoriesCount");
  v2[12] = &unk_1E8540520;
  v2[13] = &unk_1E8540538;
  v3[12] = CFSTR("areaOfInterestMemoriesCount");
  v3[13] = CFSTR("meaningfulEventMemoriesCount");
  v2[14] = &unk_1E8540550;
  v2[15] = &unk_1E8540568;
  v3[14] = CFSTR("meaningfulEventAggregationMemoriesCount");
  v3[15] = CFSTR("recurrentTripMemoriesCount");
  v2[16] = &unk_1E8540580;
  v2[17] = &unk_1E8540598;
  v3[16] = CFSTR("tripMemoriesCount");
  v3[17] = CFSTR("pastSupersetMemoriesCount");
  v2[18] = &unk_1E85405B0;
  v2[19] = &unk_1E85405C8;
  v3[18] = CFSTR("seasonInHistoryMemoriesCount");
  v3[19] = CFSTR("dayInHistoryMemoriesCount");
  v2[20] = &unk_1E85405E0;
  v3[20] = CFSTR("bestOfPastMemoriesCount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)memoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;
  memoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable = v0;

}

@end
