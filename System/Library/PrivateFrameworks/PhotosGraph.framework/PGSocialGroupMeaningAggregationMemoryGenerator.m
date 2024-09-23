@implementation PGSocialGroupMeaningAggregationMemoryGenerator

+ (id)supportedMeaningLabels
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Hiking");
  v3[1] = CFSTR("Climbing");
  v3[2] = CFSTR("Beaching");
  v3[3] = CFSTR("Diving");
  v3[4] = CFSTR("WinterSport");
  v3[5] = CFSTR("Entertainment");
  v3[6] = CFSTR("Performance");
  v3[7] = CFSTR("SportEvent");
  v3[8] = CFSTR("NightOut");
  v3[9] = CFSTR("Lunch");
  v3[10] = CFSTR("Dinner");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode socialGroupInMoment](PGGraphMomentNode, "socialGroupInMoment");
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 11004;
  v3 = a3;
  if (a3 == 3)
    return 11005;
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v3;
    _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);

  }
  return 0;
}

@end
