@implementation MTLibraryMigrationUtil

+ (void)migrateDatabasePropertiesToSharedContainerIfNeeded
{
  +[MTPreferences moveUserDefaultToSharedContainer:](MTPreferences, "moveUserDefaultToSharedContainer:", kMTLibraryMigrationVersion);
  +[MTPreferences moveUserDefaultToSharedContainer:](MTPreferences, "moveUserDefaultToSharedContainer:", kMTDetectedCorruptDB);
}

@end
