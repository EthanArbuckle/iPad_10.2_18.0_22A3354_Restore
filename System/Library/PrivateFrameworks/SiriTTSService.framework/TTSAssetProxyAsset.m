@implementation TTSAssetProxyAsset

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19ADB0594();

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19ADB07B4();

  return (TTSAssetSource *)v3;
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19ADB0824((uint64_t)v2);

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  return (TTSAssetQuality *)sub_19ADB0C68();
}

- (NSString)name
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19ADB0C84);
}

- (NSString)identifier
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19ADB0CA0);
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19ADB0DE8();

  return v3;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19ADB0E00);
}

- (NSArray)supportedLanguages
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  void *v3;

  v2 = self;
  sub_19ADB0ED4();

  v3 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)gender
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19ADB10BC();

  return v3;
}

- (NSNumber)age
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19ADB1114();

  return (NSNumber *)v3;
}

- (NSNumber)downloadSize
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19ADB114C();

  return (NSNumber *)v3;
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19ADB1184();

  return (NSNumber *)v3;
}

- (NSDictionary)attributes
{
  void *v2;

  sub_19ADB11E0();
  v2 = (void *)sub_19AE5537C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSBundle)bundle
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  void *v3;

  v2 = self;
  v3 = sub_19ADB1220((uint64_t)v2);

  return (NSBundle *)v3;
}

- (BOOL)locallyAvailable
{
  return sub_19ADB1558();
}

- (BOOL)purgeable
{
  return 1;
}

- (BOOL)downloading
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_19ADB15AC();

  return v3;
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC14SiriTTSService18TTSAssetProxyAsset *v15;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (a3)
  {
    v11 = sub_19AE55448();
    a3 = v12;
  }
  else
  {
    v11 = 0;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  v15 = self;
  sub_19ADB19FC(v11, (uint64_t)a3, 0, (uint64_t)sub_19AD97250, v13, (void (*)(id))sub_19AD973DC, (void (*)(id))v14);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14SiriTTSService18TTSAssetProxyAsset *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_19ADB25B4((void (*)(uint64_t, uint64_t))sub_19AD82948, v5);

  swift_release();
}

- (void)purge
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;

  v2 = self;
  sub_19ADB2F68();

}

- (void)purgeImmediately:(BOOL)a3
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v4;

  v4 = self;
  sub_19ADB2FB0(a3);

}

- (void)setPurgeCondition:(int64_t)a3
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v4;

  v4 = self;
  sub_19ADB3270(a3);

}

- (int64_t)purgeCondition
{
  _TtC14SiriTTSService18TTSAssetProxyAsset *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19ADB35DC();

  return v3;
}

- (_TtC14SiriTTSService18TTSAssetProxyAsset)init
{
  TTSAssetProxyAsset.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14SiriTTSService18TTSAssetProxyAsset_authorizedBundle));
  swift_bridgeObjectRelease();
}

@end
