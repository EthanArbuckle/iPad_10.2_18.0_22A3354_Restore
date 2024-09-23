@implementation STUIStatusBarIndicatorAirplaneModeItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0C70];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return CFSTR("airplane");
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end
