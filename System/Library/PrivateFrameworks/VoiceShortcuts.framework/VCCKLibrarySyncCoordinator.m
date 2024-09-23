@implementation VCCKLibrarySyncCoordinator

+ (BOOL)handleSavedLibraryRecord:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_1C1498234((uint64_t)v6, v7);

  return 1;
}

+ (uint64_t)handleFetchedLibraryRecord:(void *)a3 database:(void *)a4 logger:(void *)a5 error:
{
  id v8;
  id v9;
  id v10;

  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_1C1498E5C((uint64_t)v8, v9, a5);

  return 1;
}

+ (BOOL)handleUnknownItemErrorForRecord:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_1C1498FBC((uint64_t)v7, v7);

  return 1;
}

- (_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator)init
{
  return (_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator *)VCCKLibrarySyncCoordinator.init()();
}

@end
