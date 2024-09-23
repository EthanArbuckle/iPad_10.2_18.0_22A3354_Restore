@implementation PPPortraitSystem

+ (void)start
{
  id v2;
  id v3;
  id v4;

  +[PPMaintenance registerMaintenanceTasksInternal](PPMaintenance, "registerMaintenanceTasksInternal");
  +[PPSWHarvestingSystem start](PPSWHarvestingSystem, "start");
  v2 = +[PPNamedEntityExtractionPlugin sharedInstance](PPNamedEntityExtractionPlugin, "sharedInstance");
  v3 = +[PPECRMessageTermCountsPlugin sharedInstance](PPECRMessageTermCountsPlugin, "sharedInstance");
  v4 = +[PPSettings sharedInstance](PPSettings, "sharedInstance");
}

@end
