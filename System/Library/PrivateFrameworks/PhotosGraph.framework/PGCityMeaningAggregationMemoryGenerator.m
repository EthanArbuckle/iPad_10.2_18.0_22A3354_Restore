@implementation PGCityMeaningAggregationMemoryGenerator

+ (id)supportedMeaningLabels
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Entertainment");
  v3[1] = CFSTR("Performance");
  v3[2] = CFSTR("SportEvent");
  v3[3] = CFSTR("NightOut");
  v3[4] = CFSTR("Lunch");
  v3[5] = CFSTR("Dinner");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode cityOfMoment](PGGraphMomentNode, "cityOfMoment");
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
    return 11008;
  v3 = a3;
  if (a3 == 3)
    return 11009;
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
