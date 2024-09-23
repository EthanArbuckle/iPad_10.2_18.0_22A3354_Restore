@implementation PGAggregationsTitleSpecFactory

+ (id)specCollectionForMeaningLabel:(id)a3
{
  return (id)objc_msgSend(a1, "specCollectionForMeaningLabel:features:", a3, 0);
}

+ (id)specCollectionForMeaningLabel:(id)a3 features:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Birthday")))
  {
    objc_msgSend(a1, "_specCollectionForBirthday");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Entertainment")))
  {
    objc_msgSend(a1, "_specDefinitionForEntertainment");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_31:
    v10 = (void *)v11;
    goto LABEL_32;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("NightOut")))
  {
    objc_msgSend(a1, "_specDefinitionForNightOut");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SportEvent")))
  {
    objc_msgSend(a1, "_specDefinitionForSportEvent");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Performance")))
  {
    objc_msgSend(a1, "_specDefinitionForPerformance");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Activity")))
  {
    objc_msgSend(a1, "_specDefinitionForActivity");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WinterSport")))
  {
    objc_msgSend(a1, "_specDefinitionForWinterSport");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Beaching")))
  {
    objc_msgSend(a1, "_specDefinitionForBeaching");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Hiking")))
  {
    objc_msgSend(a1, "_specDefinitionForHiking");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Diving")))
  {
    objc_msgSend(a1, "_specDefinitionForDiving");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Climbing")))
  {
    objc_msgSend(a1, "_specDefinitionForClimbing");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Breakfast")))
  {
    objc_msgSend(a1, "_specDefinitionForBreakfast");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Lunch")))
  {
    objc_msgSend(a1, "_specDefinitionForLunch");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Dinner")))
  {
    objc_msgSend(a1, "_specDefinitionForDinner");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Gathering")))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "No spec definition for %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_4;
  }
  objc_msgSend(a1, "_specCollectionForGathering");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v9 = (void *)v8;
  if (!v8)
  {
LABEL_4:
    v10 = 0;
LABEL_32:
    objc_msgSend(a1, "_buildSpecCollectionForMeaningLabel:withSpecDefinition:features:", v6, v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)_specCollectionForBirthday
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  PGTitleSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  PGTitleSpec *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventAggregationMemoryTitleTypeBirthdayWithPerson %@"), CFSTR("PGMeaningfulEventAggregationMemoryTitleTypeBirthdayWithPerson %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 3);

  +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  v14 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_specDefinitionForEntertainment
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("LocationIncludingAOI");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29C0;
  v4[1] = &unk_1E84E29D8;
  v3[2] = CFSTR("SocialGroup");
  v3[3] = CFSTR("Family");
  v4[2] = &unk_1E84E29C0;
  v4[3] = &unk_1E84E29C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForNightOut
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Location");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29C0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("SocialGroup");
  v3[3] = CFSTR("Family");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForSportEvent
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("LocationIncludingAOI");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29C0;
  v3[2] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForPerformance
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("LocationIncludingLineBreak");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("SocialGroup");
  v3[3] = CFSTR("Family");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForActivity
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("LocationIncludingLineBreak");
  v4[0] = &unk_1E84E29C0;
  v4[1] = &unk_1E84E29C0;
  v3[2] = CFSTR("Person");
  v3[3] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29C0;
  v4[3] = &unk_1E84E29C0;
  v3[4] = CFSTR("Family");
  v4[4] = &unk_1E84E29C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForBeaching
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("LocationIncludingLineBreak");
  v4[0] = &unk_1E84E29C0;
  v4[1] = &unk_1E84E29C0;
  v3[2] = CFSTR("Person");
  v3[3] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29C0;
  v4[3] = &unk_1E84E29C0;
  v3[4] = CFSTR("Family");
  v4[4] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForDiving
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("LocationIncludingAOI");
  v4[0] = &unk_1E84E29C0;
  v4[1] = &unk_1E84E29C0;
  v3[2] = CFSTR("Person");
  v3[3] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29C0;
  v4[3] = &unk_1E84E29C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForHiking
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("LocationIncludingAOI");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("Person");
  v3[3] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  v3[4] = CFSTR("Family");
  v4[4] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForWinterSport
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("LocationIncludingAOI");
  v4[0] = &unk_1E84E29C0;
  v4[1] = &unk_1E84E29C0;
  v3[2] = CFSTR("Person");
  v3[3] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29C0;
  v4[3] = &unk_1E84E29C0;
  v3[4] = CFSTR("Family");
  v4[4] = &unk_1E84E29C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForClimbing
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("LocationIncludingAOI");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("Person");
  v3[3] = CFSTR("SocialGroup");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForBreakfast
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Location");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("SocialGroup");
  v3[3] = CFSTR("Family");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForLunch
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Location");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("SocialGroup");
  v3[3] = CFSTR("Family");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specDefinitionForDinner
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Location");
  v3[1] = CFSTR("Person");
  v4[0] = &unk_1E84E29F0;
  v4[1] = &unk_1E84E29F0;
  v3[2] = CFSTR("SocialGroup");
  v3[3] = CFSTR("Family");
  v4[2] = &unk_1E84E29F0;
  v4[3] = &unk_1E84E29F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_specCollectionForGathering
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  PGTitleSpec *v5;
  void *v6;
  void *v7;
  PGTitleSpec *v8;
  void *v9;
  void *v10;
  PGTitleSpec *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventAggregationMemoryTitleTypeGatheringWithLocation %@"), CFSTR("PGMeaningfulEventAggregationMemoryTitleTypeGatheringWithLocation %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventAggregationMemoryTitleTypeFamilyGatheringWithLocation %@"), CFSTR("PGMeaningfulEventAggregationMemoryTitleTypeFamilyGatheringWithLocation %@"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v11, "setArguments:", v14);

  v21[0] = v5;
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_featureTypesFromFeatureKey:(id)a3
{
  id v3;
  id v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("LocationIncludingAOI"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Location")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("LocationIncludingLineBreak")) | v5) == 1)
  {
    objc_msgSend(v4, "addObject:", &unk_1E84E2A08);
    objc_msgSend(v4, "addObject:", &unk_1E84E2A20);
    if ((v5 & 1) != 0)
    {
      v6 = &unk_1E84E2A38;
LABEL_10:
      objc_msgSend(v4, "addObject:", v6);
    }
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Person")) & 1) != 0)
    {
      v6 = &unk_1E84E2A50;
      goto LABEL_10;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Family")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("SocialGroup")))
    {
      v6 = &unk_1E84E2A68;
      goto LABEL_10;
    }
  }

  return v4;
}

+ (id)_buildSpecCollectionForMeaningLabel:(id)a3 withSpecDefinition:(id)a4 features:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v28 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = v9;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v39;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v17), "type"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v15);
    }

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __98__PGAggregationsTitleSpecFactory__buildSpecCollectionForMeaningLabel_withSpecDefinition_features___block_invoke;
    v31[3] = &unk_1E8428720;
    v32 = v12;
    v37 = v28;
    v33 = v8;
    v19 = v30;
    v34 = v30;
    v35 = v11;
    v36 = v10;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v31);
    +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v23;
    v42[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v29;
  }
  else
  {
    v26 = 0;
    v19 = v30;
  }

  return v26;
}

void __98__PGAggregationsTitleSpecFactory__buildSpecCollectionForMeaningLabel_withSpecDefinition_features___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PGTitleSpec *v28;
  void *v29;
  __CFString *v30;
  int v31;
  __CFString *v32;
  unsigned int v33;
  char v34;
  unint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v35 = objc_msgSend(a3, "unsignedIntegerValue");
  v6 = (__CFString *)v5;
  v34 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("none"));
  v7 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("LocationIncludingAOI"));
  v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("LocationIncludingLineBreak"));
  v33 = v7 | v8;
  if (((v7 | v8) & 1) != 0 || (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Location")) & 1) != 0)
  {
    v9 = 1;
    v31 = 1;
  }
  else
  {
    v31 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Person"));
    v9 = 0;
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 72), "_featureTypesFromFeatureKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "intersectsSet:", v11);

  v30 = v6;
  if (!v9)
  {
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Person")))
    {
      v16 = 0;
    }
    else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Family")))
    {
      v16 = 3;
    }
    else
    {
      if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("SocialGroup")))
      {
        v21 = 0;
        goto LABEL_20;
      }
      v16 = 1;
    }
    +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v14 = 0;
    v32 = v6;
    goto LABEL_21;
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    v35 += v14;
    v15 = 21;
  }
  else
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Location"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("LocationIncludingAOI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");

      v14 = v20 + v18;
      v35 += v14;
    }
    else
    {
      v14 = 0;
    }
    v15 = 17;
  }

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", v15, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = CFSTR("Location");
LABEL_21:
  if (v14 < v35)
  {
    if (v12)
      v22 = 64;
    else
      v22 = 56;
    do
    {
      if ((v34 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGMeaningfulEventAggregationMemoryTitleType%@%lu"), *(_QWORD *)(a1 + 48), v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGMeaningfulEventAggregationMemoryTitleType%@%luWith%@"), *(_QWORD *)(a1 + 48), v14, v32, v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v24;
        if (v31)
        {
          objc_msgSend(v24, "stringByAppendingString:", CFSTR(" %@"));
          v25 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v25;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", v23, v23, CFSTR("Localizable"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", v27, 0);
      -[PGTitleSpec setHasLineBreak:](v28, "setHasLineBreak:", v33);
      if (v21)
      {
        v36[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGTitleSpec setArguments:](v28, "setArguments:", v29);

      }
      objc_msgSend(*(id *)(a1 + v22), "addObject:", v28);

      ++v14;
    }
    while (v35 != v14);
  }

}

@end
