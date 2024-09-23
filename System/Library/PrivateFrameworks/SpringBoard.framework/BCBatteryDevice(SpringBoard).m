@implementation BCBatteryDevice(SpringBoard)

- (uint64_t)sb_supportsDetailedBatteryMetrics
{
  uint64_t result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(a1, "isInternal");
  if ((_DWORD)result)
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "supportsDetailedBatteryCapacity");

    return v3;
  }
  return result;
}

+ (id)localizedBatteryDetailTextForBatteryLevel:()SpringBoard
{
  id v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setNumberStyle:", 3);
  v4 = a1 / 100.0;
  *(float *)&v4 = a1 / 100.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
