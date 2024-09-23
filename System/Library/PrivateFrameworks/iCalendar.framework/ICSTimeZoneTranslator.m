@implementation ICSTimeZoneTranslator

+ (id)timeZoneNameForNonstandardTimeZone:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = timeZoneNameForNonstandardTimeZone__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&timeZoneNameForNonstandardTimeZone__onceToken, &__block_literal_global_9);
  objc_msgSend((id)timeZoneNameForNonstandardTimeZone__nonstandardTimeZones, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __60__ICSTimeZoneTranslator_timeZoneNameForNonstandardTimeZone___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("nonstandardTimeZones"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v0);
  v2 = (void *)timeZoneNameForNonstandardTimeZone__nonstandardTimeZones;
  timeZoneNameForNonstandardTimeZone__nonstandardTimeZones = v1;

}

@end
