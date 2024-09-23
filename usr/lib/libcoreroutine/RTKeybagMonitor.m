@implementation RTKeybagMonitor

- (int)getDeviceLockState
{
  return MKBGetDeviceLockState();
}

- (BOOL)getUnlockedSinceBoot
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Failed to determine unlocked since boot, %d", (uint8_t *)v5, 8u);
    }

  }
  return v2 > 0;
}

- (BOOL)lockDevice
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  MEMORY[0x1D8231608](v2, 1);
  return 1;
}

@end
