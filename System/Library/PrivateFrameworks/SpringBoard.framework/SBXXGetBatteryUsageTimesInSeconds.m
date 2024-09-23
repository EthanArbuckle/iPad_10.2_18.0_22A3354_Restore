@implementation SBXXGetBatteryUsageTimesInSeconds

uint64_t ___SBXXGetBatteryUsageTimesInSeconds_block_invoke(uint64_t a1)
{
  float BatteryUsageTimeInSeconds;
  float BatteryStandbyTimeInSeconds;
  uint64_t result;

  BatteryUsageTimeInSeconds = _SBWorkspaceGetBatteryUsageTimeInSeconds();
  **(float **)(a1 + 32) = BatteryUsageTimeInSeconds;
  BatteryStandbyTimeInSeconds = _SBWorkspaceGetBatteryStandbyTimeInSeconds();
  **(float **)(a1 + 40) = BatteryStandbyTimeInSeconds;
  **(_BYTE **)(a1 + 48) = _SBWorkspaceAreUsageTimesTrusted();
  result = _SBWorkspaceHaveChargedPartially();
  **(_BYTE **)(a1 + 56) = result;
  return result;
}

@end
