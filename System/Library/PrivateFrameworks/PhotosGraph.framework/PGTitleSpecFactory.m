@implementation PGTitleSpecFactory

+ (id)specCollectionForMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "specCollectionForMemoryCategory:subcategory:personNodes:", a3, a4, 0);
}

+ (id)specCollectionForMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4 personNodes:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a5;
  switch(a4)
  {
    case 0xD4uLL:
      objc_msgSend(a1, "_specForPet");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0xD8uLL:
      objc_msgSend(a1, "_specForPeopleVisiting");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0xD9uLL:
      if (a3 == 219)
      {
        objc_msgSend(a1, "_specForBaby");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 220)
          goto LABEL_11;
        objc_msgSend(a1, "_specForBabyGrowingUp");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_14;
    case 0xDAuLL:
      objc_msgSend(a1, "_specForFoodieWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:", v8, 0, 0, 0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    default:
      if (a3 == 214)
      {
        objc_msgSend(a1, "_specForThrowbackThursday");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 219)
        {
LABEL_11:
          v10 = 0;
          goto LABEL_15;
        }
        objc_msgSend(a1, "_specForEarlyMomentsWithPersonNodes:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
      }
LABEL_14:
      v10 = (void *)v9;
LABEL_15:

      return v10;
  }
}

+ (id)specCollectionForMeaningLabel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Celebration")))
  {
    objc_msgSend(a1, "_specForCelebration");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_37:
    v6 = (void *)v5;
    goto LABEL_38;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Wedding")))
  {
    objc_msgSend(a1, "_specForWedding");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Birthday")))
  {
    objc_msgSend(a1, "_specForBirthday");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Anniversary")))
  {
    objc_msgSend(a1, "_specForAnniversary");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Entertainment")))
  {
    objc_msgSend(a1, "_specForEntertainment");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("NightOut")))
  {
    objc_msgSend(a1, "_specForNightOut");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SportEvent")))
  {
    objc_msgSend(a1, "_specForSportEvent");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Performance")))
  {
    objc_msgSend(a1, "_specForPerformance");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Activity")))
  {
    objc_msgSend(a1, "_specForActivity");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("WinterSport")))
  {
    objc_msgSend(a1, "_specForWinterSport");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Beaching")))
  {
    objc_msgSend(a1, "_specForBeaching");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Hiking")))
  {
    objc_msgSend(a1, "_specForHiking");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Climbing")))
  {
    objc_msgSend(a1, "_specForClimbing");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Diving")))
  {
    objc_msgSend(a1, "_specForDiving");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Breakfast")))
  {
    objc_msgSend(a1, "_specForBreakfast");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Lunch")))
  {
    objc_msgSend(a1, "_specForLunch");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Dinner")))
  {
    objc_msgSend(a1, "_specForDinner");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Gathering")))
  {
    objc_msgSend(a1, "_specForGathering");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "No spec for %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = 0;
LABEL_38:

  return v6;
}

+ (id)_specForCelebration
{
  void *v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration1"), CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration1"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration2"), CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration2"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration3"), CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration3"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration4"), CFSTR("PGMeaningfulEventMemoryTitleTypeCelebration4"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_specForWedding
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
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeWedding1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeWedding1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeWedding2"), CFSTR("PGMeaningfulEventMemoryTitleTypeWedding2"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_specForBirthday
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  PGTitleSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  PGTitleSpec *v22;
  PGTitleSpec *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@"), CFSTR("PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 3);

  +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecTimeArgument argumentWithTimeType:](PGTitleSpecTimeArgument, "argumentWithTimeType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v8);

  v9 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithName %@"), CFSTR("PGPeopleBirthdayTitleFormatWithName %@"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGTitleSpec initWithFormat:titleCategory:](v9, "initWithFormat:titleCategory:", v11, 3);

  v24 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v12, "setArguments:", v13);

  v23 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v15;
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_specForAnniversary
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeAnniversary1WithYearOrdinal %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeAnniversary1WithYearOrdinal %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 1);

  +[PGTitleSpecTimeArgument argumentWithTimeType:](PGTitleSpecTimeArgument, "argumentWithTimeType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
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

+ (id)_specForEntertainment
{
  PGTitleSpec *v3;
  void *v4;
  void *v5;
  PGTitleSpec *v6;
  void *v7;
  void *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  PGTitleSpec *v15;
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
  void *v26;
  _QWORD v28[3];
  _QWORD v29[2];
  PGTitleSpec *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 4);
  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v3, "setArguments:", v5);

  v6 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeEntertainment1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeEntertainment1WithLocationName %@"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGTitleSpec initWithFormat:titleCategory:](v6, "initWithFormat:titleCategory:", v8, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v9, "setArguments:", v11);

  v12 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeEntertainment2WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeEntertainment2WithLocationName %@"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGTitleSpec initWithFormat:titleCategory:](v12, "initWithFormat:titleCategory:", v14, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v15, "setArguments:", v17);

  objc_msgSend(a1, "_publicEventSpecEventName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v9;
  v29[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v20;
  v28[1] = v22;
  v28[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)_specForNightOut
{
  PGTitleSpec *v3;
  void *v4;
  void *v5;
  PGTitleSpec *v6;
  void *v7;
  void *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  PGTitleSpec *v15;
  void *v16;
  void *v17;
  PGTitleSpec *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[3];
  PGTitleSpec *v30;
  _QWORD v31[2];
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeNightOut1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeNightOut1WithLocationName %@"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGTitleSpec initWithFormat:titleCategory:](v3, "initWithFormat:titleCategory:", v5, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v6, "setArguments:", v8);

  v9 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeNightOut2WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeNightOut2WithLocationName %@"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGTitleSpec initWithFormat:titleCategory:](v9, "initWithFormat:titleCategory:", v11, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v12, "setArguments:", v14);

  v15 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeNightOut3"), CFSTR("PGMeaningfulEventMemoryTitleTypeNightOut3"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PGTitleSpec initWithFormat:titleCategory:](v15, "initWithFormat:titleCategory:", v17, 1);

  objc_msgSend(a1, "_publicEventSpecEventName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v6;
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v21;
  v29[1] = v23;
  v29[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_specForSportEvent
{
  PGTitleSpec *v3;
  void *v4;
  void *v5;
  PGTitleSpec *v6;
  void *v7;
  void *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSportEvent1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeSportEvent1WithLocationName %@"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGTitleSpec initWithFormat:titleCategory:](v3, "initWithFormat:titleCategory:", v5, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v6, "setArguments:", v8);

  -[PGTitleSpec setHasLineBreak:](v6, "setHasLineBreak:", 1);
  v9 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSportEvent2"), CFSTR("PGMeaningfulEventMemoryTitleTypeSportEvent2"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGTitleSpec initWithFormat:titleCategory:](v9, "initWithFormat:titleCategory:", v11, 1);

  objc_msgSend(a1, "_publicEventSpecEventName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v6;
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v15;
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_specForPerformance
{
  PGTitleSpec *v3;
  void *v4;
  void *v5;
  PGTitleSpec *v6;
  void *v7;
  void *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  PGTitleSpec *v24;
  PGTitleSpec *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypePerformance1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypePerformance1WithLocationName %@"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGTitleSpec initWithFormat:titleCategory:](v3, "initWithFormat:titleCategory:", v5, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v6, "setArguments:", v8);

  -[PGTitleSpec setHasLineBreak:](v6, "setHasLineBreak:", 1);
  v9 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypePerformance2"), CFSTR("PGMeaningfulEventMemoryTitleTypePerformance2"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGTitleSpec initWithFormat:titleCategory:](v9, "initWithFormat:titleCategory:", v11, 1);

  objc_msgSend(a1, "_publicEventSpecEventName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v15;
  v23[1] = v17;
  v23[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_specForActivity
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
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeActivity1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeActivity1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeActivity2"), CFSTR("PGMeaningfulEventMemoryTitleTypeActivity2"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 0);

  v18[0] = v5;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_specForWinterSport
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
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeWinterSport1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeWinterSport1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeWinterSport2"), CFSTR("PGMeaningfulEventMemoryTitleTypeWinterSport2"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 1);

  v18[0] = v5;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_specForBeaching
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
  PGTitleSpec *v14;
  void *v15;
  void *v16;
  PGTitleSpec *v17;
  void *v18;
  void *v19;
  PGTitleSpec *v20;
  void *v21;
  void *v22;
  PGTitleSpec *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  PGTitleSpec *v32;
  _QWORD v33[3];
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching2WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching2WithLocationName %@"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v11, "setArguments:", v13);

  -[PGTitleSpec setHasLineBreak:](v11, "setHasLineBreak:", 1);
  v14 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching3WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching3WithLocationName %@"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGTitleSpec initWithFormat:titleCategory:](v14, "initWithFormat:titleCategory:", v16, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v17, "setArguments:", v19);

  -[PGTitleSpec setHasLineBreak:](v17, "setHasLineBreak:", 1);
  v20 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching4"), CFSTR("PGMeaningfulEventMemoryTitleTypeBeaching4"), CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGTitleSpec initWithFormat:titleCategory:](v20, "initWithFormat:titleCategory:", v22, 1);

  v33[0] = v5;
  v33[1] = v11;
  v33[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v25;
  v31[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)_specForHiking
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
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeHiking1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeHiking1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeHiking2"), CFSTR("PGMeaningfulEventMemoryTitleTypeHiking2"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 1);

  v18[0] = v5;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_specForClimbing
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
  _QWORD v19[2];
  PGTitleSpec *v20;
  PGTitleSpec *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeClimbing1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeClimbing1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeClimbing2"), CFSTR("PGMeaningfulEventMemoryTitleTypeClimbing2"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 1);

  v21 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v13;
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_specForDiving
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
  PGTitleSpec *v14;
  void *v15;
  void *v16;
  PGTitleSpec *v17;
  PGTitleSpec *v18;
  void *v19;
  void *v20;
  PGTitleSpec *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeDiving1WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeDiving1WithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeDiving2WithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeDiving2WithLocationName %@"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 5, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v11, "setArguments:", v13);

  -[PGTitleSpec setHasLineBreak:](v11, "setHasLineBreak:", 1);
  v14 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeDiving3"), CFSTR("PGMeaningfulEventMemoryTitleTypeDiving3"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGTitleSpec initWithFormat:titleCategory:](v14, "initWithFormat:titleCategory:", v16, 1);

  v18 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeDiving4"), CFSTR("PGMeaningfulEventMemoryTitleTypeDiving4"), CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PGTitleSpec initWithFormat:titleCategory:](v18, "initWithFormat:titleCategory:", v20, 1);

  v31[0] = v5;
  v31[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v17;
  v30[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v23;
  v29[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_specForBreakfast
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
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  PGTitleSpec *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeBreakfastWithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeBreakfastWithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSaturdayBrunch"), CFSTR("PGMeaningfulEventMemoryTitleTypeSaturdayBrunch"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 1);

  -[PGTitleSpec setWeekdayCriteria:](v11, "setWeekdayCriteria:", 2);
  v12 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSundayBrunch"), CFSTR("PGMeaningfulEventMemoryTitleTypeSundayBrunch"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGTitleSpec initWithFormat:titleCategory:](v12, "initWithFormat:titleCategory:", v14, 1);

  -[PGTitleSpec setWeekdayCriteria:](v15, "setWeekdayCriteria:", 3);
  v22[0] = v5;
  v22[1] = v11;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_specForLunch
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
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  PGTitleSpec *v15;
  PGTitleSpec *v16;
  void *v17;
  void *v18;
  PGTitleSpec *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeLunchWithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeLunchWithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v7);

  v8 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSaturdayBrunch"), CFSTR("PGMeaningfulEventMemoryTitleTypeSaturdayBrunch"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGTitleSpec initWithFormat:titleCategory:](v8, "initWithFormat:titleCategory:", v10, 1);

  -[PGTitleSpec setWeekdayCriteria:](v11, "setWeekdayCriteria:", 2);
  v12 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSundayBrunch"), CFSTR("PGMeaningfulEventMemoryTitleTypeSundayBrunch"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGTitleSpec initWithFormat:titleCategory:](v12, "initWithFormat:titleCategory:", v14, 1);

  -[PGTitleSpec setWeekdayCriteria:](v15, "setWeekdayCriteria:", 3);
  v16 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeFamilyLunch"), CFSTR("PGMeaningfulEventMemoryTitleTypeFamilyLunch"), CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PGTitleSpec initWithFormat:titleCategory:](v16, "initWithFormat:titleCategory:", v18, 3);

  +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v19, "setArguments:", v21);

  v28[0] = v5;
  v28[1] = v11;
  v28[2] = v15;
  v28[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)_specForDinner
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PGTitleSpec *v7;
  void *v8;
  void *v9;
  PGTitleSpec *v10;
  PGTitleSpec *v11;
  void *v12;
  void *v13;
  PGTitleSpec *v14;
  PGTitleSpec *v15;
  void *v16;
  void *v17;
  PGTitleSpec *v18;
  PGTitleSpec *v19;
  void *v20;
  void *v21;
  PGTitleSpec *v22;
  void *v23;
  void *v24;
  PGTitleSpec *v25;
  void *v26;
  void *v27;
  PGTitleSpec *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PGTitleSpec *v34;
  void *v35;
  _QWORD v36[6];
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeDinnerWithLocationName %@"), CFSTR("PGMeaningfulEventMemoryTitleTypeDinnerWithLocationName %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 4);

  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v34, "setArguments:", v6);

  v7 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeFridayDinner"), CFSTR("PGMeaningfulEventMemoryTitleTypeFridayDinner"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGTitleSpec initWithFormat:titleCategory:](v7, "initWithFormat:titleCategory:", v9, 1);

  -[PGTitleSpec setWeekdayCriteria:](v10, "setWeekdayCriteria:", 1);
  v11 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSaturdayDinner"), CFSTR("PGMeaningfulEventMemoryTitleTypeSaturdayDinner"), CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PGTitleSpec initWithFormat:titleCategory:](v11, "initWithFormat:titleCategory:", v13, 1);

  -[PGTitleSpec setWeekdayCriteria:](v14, "setWeekdayCriteria:", 2);
  v15 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeSundayDinner"), CFSTR("PGMeaningfulEventMemoryTitleTypeSundayDinner"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PGTitleSpec initWithFormat:titleCategory:](v15, "initWithFormat:titleCategory:", v17, 1);

  -[PGTitleSpec setWeekdayCriteria:](v18, "setWeekdayCriteria:", 3);
  v19 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeFamilyDinner"), CFSTR("PGMeaningfulEventMemoryTitleTypeFamilyDinner"), CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PGTitleSpec initWithFormat:titleCategory:](v19, "initWithFormat:titleCategory:", v21, 3);

  +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v22, "setArguments:", v24);

  v25 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypeDinnerGeneric"), CFSTR("PGMeaningfulEventMemoryTitleTypeDinnerGeneric"), CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PGTitleSpec initWithFormat:titleCategory:](v25, "initWithFormat:titleCategory:", v27, 1);

  -[PGTitleSpec setHasLineBreak:](v28, "setHasLineBreak:", 1);
  v36[0] = v34;
  v36[1] = v10;
  v36[2] = v14;
  v36[3] = v18;
  v36[4] = v22;
  v36[5] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)_specForGathering
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  PGTitleSpec *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 4);
  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  v11 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_specForPet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGPetMemoryTypeFormatPet"), CFSTR("PGPetMemoryTypeFormatPet"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_specForBaby
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGBabyMemoryTypeFormat2"), CFSTR("PGBabyMemoryTypeFormat2"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PGBabyMemoryTypeFormat3"), CFSTR("PGBabyMemoryTypeFormat3"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v4;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
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

+ (id)_specForBabyGrowingUp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGBabyMemoryTypeFormat1"), CFSTR("PGBabyMemoryTypeFormat1"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_specForEarlyMomentsWithPersonNodes:(id)a3
{
  id v3;
  PGTitleSpec *v4;
  void *v5;
  void *v6;
  PGTitleSpec *v7;
  void *v8;
  void *v9;
  PGTitleSpec *v10;
  void *v11;
  void *v12;
  PGTitleSpec *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  PGTitleSpec *v22;
  PGTitleSpec *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PGEarlyMomentsWithPeopleTitleFormatOnePersonWithName %@"), CFSTR("PGEarlyMomentsWithPeopleTitleFormatOnePersonWithName %@"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGTitleSpec initWithFormat:titleCategory:](v4, "initWithFormat:titleCategory:", v6, 0);

  +[PGTitleSpecPeopleArgument argumentWithPeopleType:personNodes:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:personNodes:", 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v7, "setArguments:", v9);

  -[PGTitleSpec setHasLineBreak:](v7, "setHasLineBreak:", 1);
  v10 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PGEarlyMomentsWithPeopleTitleFormatWithUnnamedPerson"), CFSTR("PGEarlyMomentsWithPeopleTitleFormatWithUnnamedPerson"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGTitleSpec initWithFormat:titleCategory:](v10, "initWithFormat:titleCategory:", v12, 3);

  -[PGTitleSpec setHasLineBreak:](v13, "setHasLineBreak:", 1);
  v23 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v15;
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_specForPeopleVisiting
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGPeopleVisitingMemoryTitleStringVisiting"), CFSTR("PGPeopleVisitingMemoryTitleStringVisiting"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpec specWithFormat:titleCategory:](PGTitleSpec, "specWithFormat:titleCategory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_specForThrowbackThursday
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  PGTitleSpec *v5;
  void *v6;
  void *v7;
  PGTitleSpec *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  PGTitleSpec *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 5);
  +[PGTitleSpecTimeArgument argumentWithTimeType:](PGTitleSpecTimeArgument, "argumentWithTimeType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  -[PGTitleSpec setHasLineBreak:](v2, "setHasLineBreak:", 1);
  v5 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PGThrowbackThursdayTitleFormat2"), CFSTR("PGThrowbackThursdayTitleFormat2"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGTitleSpec initWithFormat:titleCategory:](v5, "initWithFormat:titleCategory:", v7, 5);

  v9 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PGThrowbackThursdayTitleFormat3"), CFSTR("PGThrowbackThursdayTitleFormat3"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGTitleSpec initWithFormat:titleCategory:](v9, "initWithFormat:titleCategory:", v11, 5);

  v19[0] = v2;
  v19[1] = v8;
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_specForFoodieWithPersonNodes:(id)a3 locationName:(id)a4 tripTitleLocationType:(unint64_t)a5 allowInspiredTastesTitle:(BOOL)a6 genericOnly:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  PGTitleSpec *v10;
  void *v11;
  void *v12;
  PGTitleSpec *v13;
  PGTitleSpec *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PGTitleSpec *v18;
  void *v19;
  void *v20;
  PGTitleSpec *v21;
  void *v22;
  void *v23;
  PGTitleSpec *v24;
  void *v25;
  id v26;
  PGTitleSpec *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PGTitleSpec *v33;
  void *v34;
  uint64_t v35;
  PGTitleSpec *v36;
  void *v37;
  void *v38;
  void *v39;
  void **v40;
  void *v41;
  PGTitleSpec *v42;
  void *v43;
  void *v44;
  void *v45;
  void **v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  PGTitleSpec *v53;
  void *v54;
  void **v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v61;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[3];
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[2];
  PGTitleSpec *v78;
  void *v79;
  void *v80;
  _QWORD v81[5];

  v7 = a7;
  v63 = a6;
  v81[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v67 = a4;
  v10 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleGeneric"), CFSTR("PGFoodieMemoryTitleGeneric"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGTitleSpec initWithFormat:titleCategory:](v10, "initWithFormat:titleCategory:", v12, 0);

  v14 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleGeneric2"), CFSTR("PGFoodieMemoryTitleGeneric2"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGTitleSpec initWithFormat:titleCategory:](v14, "initWithFormat:titleCategory:", v16, 0);

  v18 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleGeneric3"), CFSTR("PGFoodieMemoryTitleGeneric3"), CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PGTitleSpec initWithFormat:titleCategory:](v18, "initWithFormat:titleCategory:", v20, 0);

  v81[0] = v13;
  v81[1] = v17;
  v65 = (void *)v17;
  v81[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v9;
  if (v7)
  {
    v80 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v24 = (PGTitleSpec *)objc_claimAutoreleasedReturnValue();
    +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v9, "count"))
    {
      v26 = v9;
      v27 = [PGTitleSpec alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleWithPerson %@"), CFSTR("PGFoodieMemoryTitleWithPerson %@"), CFSTR("Localizable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PGTitleSpec initWithFormat:titleCategory:](v27, "initWithFormat:titleCategory:", v29, 3);

      +[PGTitleSpecPeopleArgument argumentWithPeopleType:personNodes:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:personNodes:", 0, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleSpec setArguments:](v24, "setArguments:", v31);

      -[PGTitleSpec setHasLineBreak:](v24, "setHasLineBreak:", 1);
      v78 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v32);
      v33 = (PGTitleSpec *)objc_claimAutoreleasedReturnValue();

      v77[0] = v33;
      v77[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = objc_msgSend(v67, "length");
      v36 = [PGTitleSpec alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleWithLocationName %@"), CFSTR("PGFoodieMemoryTitleWithLocationName %@"), CFSTR("Localizable"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PGTitleSpec initWithFormat:titleCategory:](v36, "initWithFormat:titleCategory:", v38, 4);

      if (v35)
      {
        +[PGTitleSpecLocationArgument argumentWithLocationTypeLocationForLocationName:](PGTitleSpecLocationArgument, "argumentWithLocationTypeLocationForLocationName:", v67);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v39;
        v40 = &v76;
      }
      else
      {
        +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v39;
        v40 = &v75;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleSpec setArguments:](v24, "setArguments:", v41);

      v42 = [PGTitleSpec alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleWithLocationName2 %@"), CFSTR("PGFoodieMemoryTitleWithLocationName2 %@"), CFSTR("Localizable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PGTitleSpec initWithFormat:titleCategory:](v42, "initWithFormat:titleCategory:", v44, 4);

      if (v35)
      {
        +[PGTitleSpecLocationArgument argumentWithLocationTypeLocationForLocationName:](PGTitleSpecLocationArgument, "argumentWithLocationTypeLocationForLocationName:", v67);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v45;
        v46 = &v74;
      }
      else
      {
        +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v45;
        v46 = &v73;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1, v35);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleSpec setArguments:](v33, "setArguments:", v47);

      if (v63)
      {
        switch(a5)
        {
          case 0uLL:
          case 1uLL:
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v50 = CFSTR("PGFoodieMemoryTitleWithCityLocationName %@");
            goto LABEL_19;
          case 2uLL:
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v50 = CFSTR("PGFoodieMemoryTitleWithStateLocationName %@");
            goto LABEL_19;
          case 3uLL:
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v50 = CFSTR("PGFoodieMemoryTitleWithCountryLocationName %@");
            goto LABEL_19;
          case 4uLL:
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v50 = CFSTR("PGFoodieMemoryTitleWithAOIName %@");
LABEL_19:
            objc_msgSend(v48, "localizedStringForKey:value:table:", v50, v50, CFSTR("Localizable"));
            v52 = objc_claimAutoreleasedReturnValue();

            break;
          default:
            v52 = 0;
            break;
        }
        v53 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", v52, 4);
        v64 = (void *)v52;
        if (v61)
        {
          +[PGTitleSpecLocationArgument argumentWithLocationTypeLocationForLocationName:](PGTitleSpecLocationArgument, "argumentWithLocationTypeLocationForLocationName:", v67);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v54;
          v55 = &v72;
        }
        else
        {
          +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v54;
          v55 = &v71;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGTitleSpec setArguments:](v53, "setArguments:", v56);

        v70[0] = v24;
        v70[1] = v33;
        v70[2] = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v57);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = v64;
      }
      else
      {
        v69[0] = v24;
        v69[1] = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v51);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v68[0] = v34;
      v68[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v58);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  v59 = v25;
  return v59;
}

+ (id)_publicEventSpecEventName
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 0);
  +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:](PGTitleSpecPublicEventArgument, "argumentWithPublicEventType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  return v2;
}

+ (id)_publicEventSpecPerformerNames
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 0);
  +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:](PGTitleSpecPublicEventArgument, "argumentWithPublicEventType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  return v2;
}

+ (id)_publicEventSpecCategoryNameAtBusiness
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  PGTitleSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGMeaningfulEventMemoryTitleTypePublicEvent %@ atBusiness %@"), CFSTR("PGMeaningfulEventMemoryTitleTypePublicEvent %@ atBusiness %@"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGTitleSpec initWithFormat:titleCategory:](v2, "initWithFormat:titleCategory:", v4, 0);

  +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:](PGTitleSpecPublicEventArgument, "argumentWithPublicEventType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v5, "setArguments:", v8);

  -[PGTitleSpec setHasLineBreak:](v5, "setHasLineBreak:", 1);
  return v5;
}

@end
