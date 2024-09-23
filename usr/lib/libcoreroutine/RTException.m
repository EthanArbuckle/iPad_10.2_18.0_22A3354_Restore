@implementation RTException

+ (void)dontOpenDeadInside
{
  NSObject *v3;
  int v4;
  id v5;

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = a1;
    _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "A tombstoned object was modified when it shouldn't have been.\n%@", (uint8_t *)&v4, 0xCu);
  }

  __break(1u);
}

@end
