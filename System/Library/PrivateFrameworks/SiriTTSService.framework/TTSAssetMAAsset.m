@implementation TTSAssetMAAsset

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADB5C98();
  v4 = v3;

  return (TTSAssetType *)v4;
}

- (TTSAssetSource)assetSource
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05AF28, (id *)&qword_1ED05AF58);

  return (TTSAssetSource *)v3;
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19ADB5D88((uint64_t)v2);

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADB64BC((uint64_t)v2);
  v4 = v3;

  return (TTSAssetQuality *)v4;
}

- (NSString)name
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19ADB68EC);
}

- (NSString)identifier
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19ADB6C18);
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19ADB7B48();
  v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19ADB7BD4);
}

- (NSArray)supportedLanguages
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;

  v2 = self;
  sub_19ADB8174();

  v3 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)gender
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19ADB8470((uint64_t)v2);
  v4 = v3;

  return v4;
}

- (NSNumber)age
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADB883C();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSDictionary)attributes
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;

  v2 = self;
  sub_19ADB8998();

  v3 = (void *)sub_19AE5537C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSNumber)downloadSize
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADB8E88();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADB8E88();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSBundle)bundle
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19ADB8FB4();

  return (NSBundle *)v3;
}

- (BOOL)downloading
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_19ADB9178();

  return v3;
}

- (BOOL)purgeable
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_19ADB91D8();

  return v3;
}

- (BOOL)locallyAvailable
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_19ADB923C();

  return v3 & 1;
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC14SiriTTSService15TTSAssetMAAsset *v14;
  uint64_t v15;

  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  if (a3)
    sub_19AE55448();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = self;
  sub_19ADB9264((uint64_t)v14, v15, a4, (uint64_t)sub_19ADB9F64, v12, (uint64_t)sub_19AD78028, v13);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14SiriTTSService15TTSAssetMAAsset *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_19ADB9678((uint64_t)sub_19AD77DFC, v5);

  swift_release();
}

- (void)purge
{
  _TtC14SiriTTSService15TTSAssetMAAsset *v2;

  v2 = self;
  sub_19ADB984C((uint64_t)v2);

}

- (_TtC14SiriTTSService15TTSAssetMAAsset)init
{
  TTSAssetMAAsset.init()();
}

- (void).cxx_destruct
{

}

@end
