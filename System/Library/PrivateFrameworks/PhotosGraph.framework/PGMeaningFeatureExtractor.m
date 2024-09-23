@implementation PGMeaningFeatureExtractor

- (PGMeaningFeatureExtractor)initWithError:(id *)a3
{
  return -[PGMeaningFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGMeaningFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  PGMeaningFeatureExtractor *v9;
  objc_super v11;
  _QWORD v12[5];

  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMeaningFeatureExtractor name](PGMeaningFeatureExtractor, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode meaningHierarchyOfMoment](PGGraphMomentNode, "meaningHierarchyOfMoment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = 3221225472;
  v12[2] = __51__PGMeaningFeatureExtractor_initWithVersion_error___block_invoke;
  v12[3] = &__block_descriptor_40_e42___NSString_24__0__PGGraphMeaningNode_8__16l;
  v12[4] = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGMeaningFeatureExtractor;
  v12[0] = MEMORY[0x1E0C809B0];
  v9 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v11, sel_initWithName_featureNames_relation_labelForTargetBlock_, v7, v6, v8, v12);

  return v9;
}

id __51__PGMeaningFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMeaningFeatureExtractor _labelProcessingForVersion:label:](PGMeaningFeatureExtractor, "_labelProcessingForVersion:label:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)name
{
  return CFSTR("Meaning");
}

+ (id)prefix
{
  return +[PGMeaningFeatureExtractor name](PGMeaningFeatureExtractor, "name");
}

+ (id)_labelsForVersion:(int64_t)a3
{
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[26];
  _QWORD v23[20];

  v23[19] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v22[0] = CFSTR("Activity");
    v22[1] = CFSTR("Hiking");
    v22[2] = CFSTR("Climbing");
    v22[3] = CFSTR("Beaching");
    v22[4] = CFSTR("Diving");
    v22[5] = CFSTR("WinterSport");
    v22[6] = CFSTR("Entertainment");
    v22[7] = CFSTR("AmusementPark");
    v22[8] = CFSTR("Performance");
    v22[9] = CFSTR("Concert");
    v22[10] = CFSTR("Festival");
    v22[11] = CFSTR("Theater");
    v22[12] = CFSTR("Dance");
    v22[13] = CFSTR("SportEvent");
    v22[14] = CFSTR("NightOut");
    v22[15] = CFSTR("Museum");
    v22[16] = CFSTR("Celebration");
    v22[17] = CFSTR("Birthday");
    v22[18] = CFSTR("Anniversary");
    v22[19] = CFSTR("Wedding");
    v22[20] = CFSTR("HolidayEvent");
    v22[21] = CFSTR("Gathering");
    v22[22] = CFSTR("Restaurant");
    v22[23] = CFSTR("Breakfast");
    v22[24] = CFSTR("Lunch");
    v22[25] = CFSTR("Dinner");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v22;
    v7 = 26;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v23[0] = CFSTR("Activity");
    v23[1] = CFSTR("Beaching");
    v23[2] = CFSTR("Birthday");
    v23[3] = CFSTR("Breakfast");
    v23[4] = CFSTR("Celebration");
    v23[5] = CFSTR("Concert");
    v23[6] = CFSTR("Dinner");
    v23[7] = CFSTR("Entertainment");
    v23[8] = CFSTR("Gathering");
    v23[9] = CFSTR("Hiking");
    v23[10] = CFSTR("HolidayEvent");
    v23[11] = CFSTR("Lunch");
    v23[12] = CFSTR("Museum");
    v23[13] = CFSTR("NightOut");
    v23[14] = CFSTR("Performance");
    v23[15] = CFSTR("Restaurant");
    v23[16] = CFSTR("SportEvent");
    v23[17] = CFSTR("Theater");
    v23[18] = CFSTR("WinterSport");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v23;
    v7 = 19;
LABEL_5:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_7:
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "_labelProcessingForVersion:label:", a3, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v9;
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "prefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v10, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3 == 1)
  {
    v8 = (__CFString *)v6;
  }
  else
  {
    v8 = CFSTR("unknown");
  }

  return v8;
}

@end
