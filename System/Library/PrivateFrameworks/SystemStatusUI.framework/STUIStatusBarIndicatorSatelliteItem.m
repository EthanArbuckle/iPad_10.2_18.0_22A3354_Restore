@implementation STUIStatusBarIndicatorSatelliteItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D30];
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "satelliteEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connectionStatus");

  if (v5 == 1)
    v6 = CFSTR("satellite.wave.2.fill");
  else
    v6 = CFSTR("satellite.fill");
  return v6;
}

@end
