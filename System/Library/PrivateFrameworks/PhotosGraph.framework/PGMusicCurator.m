@implementation PGMusicCurator

+ (id)generateDebugInformationForSongWithAdamID:(id)a3 context:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;

  v8 = sub_1CA85B534();
  v10 = v9;
  v11 = a4;
  v12 = a5;
  sub_1CA38A09C(v8, v10, (uint64_t)v11);
  swift_bridgeObjectRelease();

  v13 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v13;
}

+ (id)generateDebugInformationForAssetCollection:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  char **v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (char **)a6;
  sub_1CA38B2F0(v10, v11, (uint64_t)v12, v13);

  v14 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)extractMusicCurationFeaturesForMemory:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  char **v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (char **)a6;
  v14 = (void *)sub_1CA402E9C(v10, (char **)a4, (uint64_t)v12, v13);

  return v14;
}

+ (id)extractMusicCurationFeaturesForEnrichedMemory:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  swift_unknownObjectRetain();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_1CA469940(a3, a4, (uint64_t)v12);
  v15 = v14;

  swift_unknownObjectRelease();
  return v15;
}

+ (id)extractMusicCurationFeaturesForAssets:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  sub_1CA24EEC0(0, (unint64_t *)&qword_1ED8723B0);
  v10 = sub_1CA85B7B0();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)sub_1CA48A4D0(v10, a4, v12);
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)curateMusicForFeatures:(id)a3 context:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  char *v10;
  id v11;
  NSObject *v12;

  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = (char *)a4;
  v11 = a5;
  v12 = static MusicCurator.curateMusic(for:context:progressReporter:)((uint64_t)v9, v10);

  return v12;
}

- (PGMusicCurator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGMusicCurator init](&v3, sel_init);
}

+ (id)emptyCuration
{
  return _s11PhotosGraph12MusicCuratorC13emptyCurationAA0cF0CyFZ_0();
}

+ (void)inflateDisplayMetadataForMusicCuration:(id)a3 inflationContext:(id)a4 curatorContext:(id)a5 progressReporter:(id)a6 completionHandler:(id)a7
{
  void *v11;
  id v12;
  char *v13;
  id v14;
  id v15;

  v11 = _Block_copy(a7);
  _Block_copy(v11);
  v12 = a3;
  v13 = (char *)a4;
  v14 = a5;
  v15 = a6;
  sub_1CA4DA8A8(v12, v13, v15, (void (**)(_QWORD, _QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

}

+ (void)fetchSongDisplayMetadataJSONForAdamIDs:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  void *v8;
  _QWORD *v9;
  void *ObjCClassMetadata;
  _BYTE *v11;
  id v12;

  v8 = _Block_copy(a6);
  v9 = (_QWORD *)sub_1CA85B7B0();
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  _Block_copy(v8);
  v11 = a4;
  v12 = a5;
  sub_1CA4DAE08(v9, v11, v12, ObjCClassMetadata, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

+ (void)fetchSongAdamIDsForPurchasedSongID:(id)a3 inflationContext:(id)a4 progressReport:(id)a5 completionHandler:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;

  v8 = _Block_copy(a6);
  v9 = sub_1CA85B534();
  v11 = v10;
  _Block_copy(v8);
  v12 = a4;
  v13 = a5;
  sub_1CA4DBA84(v9, v11, (uint64_t)v12, v13, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

@end
