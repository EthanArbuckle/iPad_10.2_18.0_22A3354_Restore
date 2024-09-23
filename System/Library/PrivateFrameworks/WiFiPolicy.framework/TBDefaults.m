@implementation TBDefaults

+ (double)nearbyTileSearchRadius
{
  if (nearbyTileSearchRadius_nearbyRadiusToken != -1)
    dispatch_once(&nearbyTileSearchRadius_nearbyRadiusToken, &__block_literal_global_4);
  return *(double *)&_nearbyTileSearchRadius;
}

+ (unsigned)zoomLevel
{
  char *v2;

  if (zoomLevel_zoomToken != -1)
    dispatch_once(&zoomLevel_zoomToken, &__block_literal_global_5_0);
  if (_overrideZoomLevel)
  {
    NSLog(CFSTR("%s: returning override zoom level of %d (actual zoom level: %d)"), "+[TBDefaults zoomLevel]", _overrideZoomLevel, _zoomLevel);
    v2 = &_overrideZoomLevel;
  }
  else
  {
    v2 = &_zoomLevel;
  }
  return *v2;
}

+ (double)tileSearchRadius
{
  if (tileSearchRadius_radiusToken != -1)
    dispatch_once(&tileSearchRadius_radiusToken, &__block_literal_global_9);
  return *(double *)&_tileSearchRadius;
}

void __30__TBDefaults_tileSearchRadius__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D27210], "sharedService");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wiFiQualitySearchRadiusMeters");
  _tileSearchRadius = v0;

}

void __36__TBDefaults_nearbyTileSearchRadius__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D27210], "sharedService");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wiFiQualitySmallSearchRadiusMeters");
  _nearbyTileSearchRadius = v0;

}

void __23__TBDefaults_zoomLevel__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D27210], "sharedService");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _zoomLevel = objc_msgSend(v0, "wiFiQualitySearchZoomLevel");

}

+ (void)setOverrideZoomLevel:(unsigned __int8)a3
{
  NSLog(CFSTR("%s: setting override zoom level to %d"), a2, "+[TBDefaults setOverrideZoomLevel:]", a3);
  _overrideZoomLevel = a3;
}

@end
