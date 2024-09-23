@implementation APOdmlAppUsageVectorBuilder

- (id)eventsBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  APOdmlBiomeSQLQuery *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(APOdmlBiomeSQLQuery);
  objc_msgSend_query_startDate_endDate_(v7, v8, (uint64_t)CFSTR("App.InFocus"), v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)eventName
{
  return CFSTR("AppUsageEvent");
}

@end
