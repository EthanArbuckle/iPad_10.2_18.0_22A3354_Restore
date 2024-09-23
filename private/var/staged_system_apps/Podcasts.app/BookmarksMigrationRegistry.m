@implementation BookmarksMigrationRegistry

+ (void)registerMigrationOfUUIDs:(id)a3 atVersion:(int64_t)a4
{
  uint64_t v5;

  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _s8Podcasts26BookmarksMigrationRegistryC08registerC02of2atySaySSG_SitFZ_0(v5, a4);
  swift_bridgeObjectRelease(v5);
}

+ (id)migrationRegisteredAtVersion:(int64_t)a3
{
  return (id)_s8Podcasts26BookmarksMigrationRegistryC19migrationRegistered2atAA0C0CSgSi_tFZ_0(a3);
}

+ (void)deleteMigrationRegistryAtVersion:(int64_t)a3
{
  _s8Podcasts26BookmarksMigrationRegistryC06deletecD02atySi_tFZ_0(a3);
}

- (_TtC8Podcasts26BookmarksMigrationRegistry)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BookmarksMigrationRegistry();
  return -[BookmarksMigrationRegistry init](&v3, "init");
}

@end
