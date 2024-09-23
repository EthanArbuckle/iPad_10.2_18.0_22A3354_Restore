@implementation ASGeoCodeCacheEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DB_GeoCodeCache"));
}

@end
