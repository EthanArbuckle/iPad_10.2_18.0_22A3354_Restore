@implementation PGFlexMusicCurator

+ (id)curateFlexMusicWithCurationParameters:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  _BYTE *v6;
  NSObject *v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = sub_1CA2F4700(v6, v7);

  return v8;
}

- (PGFlexMusicCurator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGFlexMusicCurator init](&v3, sel_init);
}

+ (id)generateDebugInformationForSongWithUID:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = sub_1CA85B534();
  v8 = v7;
  v9 = a4;
  sub_1CA379CF4(v6, v8);
  swift_bridgeObjectRelease();

  v10 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)generateDebugInformationForAssetCollection:(id)a3 graph:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v8;
  char **v9;
  char **v10;
  void *v11;

  v8 = a3;
  v9 = (char **)a4;
  v10 = (char **)a5;
  sub_1CA37A298(v8, v9, v10);

  v11 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v11;
}

@end
