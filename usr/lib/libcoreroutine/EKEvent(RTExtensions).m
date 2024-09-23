@implementation EKEvent(RTExtensions)

- (uint64_t)needsSuggestedLocation
{
  return objc_msgSend(MEMORY[0x1E0CAA160], "shouldDoLocationPredictionForEvent:", a1);
}

- (uint64_t)hasSuggestedLocation
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "-[EKEvent(RTExtensions) hasSuggestedLocation]";
    v9 = 1024;
    v10 = 32;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "hasSuggestedLocation has an issue. Use EventModelProvider._hasSuggestedLocationForEvent (in %s:%d)", (uint8_t *)&v7, 0x12u);
  }

  objc_msgSend(a1, "structuredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "structuredLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrediction");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasConfirmedSuggestedLocation
{
  return objc_msgSend(a1, "locationPredictionState") == 2;
}

- (BOOL)hasRejectedSuggestion
{
  return objc_msgSend(a1, "locationPredictionState") == 3;
}

- (BOOL)hasUserSpecifiedLocation
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "preferredLocationWithoutPrediction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "preferredLocationWithoutPrediction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "geoLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
