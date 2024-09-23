@implementation TTSAssetTrialAsset

- (TTSAssetSource)assetSource
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05A530, (id *)&qword_1ED059AD8);

  return (TTSAssetSource *)v3;
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19AD9054C();
  v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19AD94B28(self, (uint64_t)a2, (void (*)(void))sub_19AD905E4);
}

- (NSNumber)downloadSize
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD90718();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD90964();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSArray)supportedLanguages
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  void *v3;

  v2 = self;
  sub_19AD90BFC();

  v3 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSBundle)bundle
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD90DC8((uint64_t)v2);
  v4 = v3;

  return (NSBundle *)v4;
}

- (BOOL)downloading
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  char v3;

  v2 = self;
  v3 = sub_19AD90E5C();

  return v3 & 1;
}

- (BOOL)purgeable
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_19AD90F18();

  return v3 & 1;
}

- (BOOL)locallyAvailable
{
  return sub_19AD90FDC();
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC14SiriTTSService18TTSAssetTrialAsset *v14;
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
  sub_19AD91A04((uint64_t)v14, v15, a4, (uint64_t)sub_19AD97250, v12, (uint64_t)sub_19AD973DC, v13);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  void *v4;
  _TtC14SiriTTSService18TTSAssetTrialAsset *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_19AD9250C((char *)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)purge
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;

  v2 = self;
  sub_19AD92B54();

}

- (void)purgeImmediately:(BOOL)a3
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v4;

  v4 = self;
  sub_19AD92F84(a3);

}

- (void)setPurgeCondition:(int64_t)a3
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v3;

  v3 = self;
  sub_19AD933F8();

}

- (int64_t)purgeCondition
{
  _TtC14SiriTTSService18TTSAssetTrialAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19AD935BC();
  v4 = v3;

  return v4;
}

- (_TtC14SiriTTSService18TTSAssetTrialAsset)init
{
  TTSAssetTrialAsset.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14SiriTTSService18TTSAssetTrialAsset_progressQueue));
}

@end
