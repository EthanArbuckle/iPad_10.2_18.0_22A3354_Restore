@implementation AudiobookNowPlayingPresenter

- (void)cancelDownload
{
  sub_1004CAD34((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_1002A02DC);
}

- (void)clearAudiobook
{
  unsigned __int8 *interactor;
  _QWORD *v4;
  uint64_t v5;
  _BYTE v6[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v6, 0, 0);
  v4 = (_QWORD *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v4, &v5, 0, 0);
  sub_10003F198(v4, v4[3]);
  swift_retain(self);
  sub_1003F7D3C();
  swift_release(self);
}

- (void)setPlaybackRateTo:(float)a3
{
  unsigned __int8 *interactor;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, float);
  _BYTE v10[24];
  _BYTE v11[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v11, 0, 0);
  v6 = *sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
     + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager;
  swift_beginAccess(v6, v10, 33, 0);
  v7 = *(_QWORD *)(v6 + 24);
  v8 = *(_QWORD *)(v6 + 32);
  sub_100063750(v6, v7);
  v9 = *(void (**)(uint64_t, uint64_t, float))(v8 + 152);
  swift_retain(self);
  v9(v7, v8, a3);
  swift_endAccess(v10);
  swift_release(self);
}

- (double)coverSkipEnd
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  double result;
  uint64_t v7;
  _BYTE v8[24];

  v2 = (_QWORD *)(a1 + 24);
  swift_beginAccess(a1 + 24, v8, 0, 0);
  v3 = (_QWORD *)(*sub_10003F198(v2, *(_QWORD *)(a1 + 48))
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v3, &v7, 0, 0);
  v4 = *(void **)(*sub_10003F198(v3, v3[3]) + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  v5 = objc_msgSend(v4, "skipController", swift_retain(a1).n128_f64[0]);
  objc_msgSend(v5, "endSkip");
  swift_release(a1);
  *(_QWORD *)&result = swift_unknownObjectRelease(v5).n128_u64[0];
  return result;
}

- (void)goToChapterIndex:(int64_t)a3
{
  unsigned __int8 *interactor;
  _BYTE v6[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v6, 0, 0);
  sub_10003F198(interactor, *(_QWORD *)&self->interactor[24]);
  swift_retain(self);
  sub_1002A0718(a3);
  swift_release(self);
}

- (void)pause
{
  sub_1004CA7E0((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_pause);
}

- (void)play
{
  unsigned __int8 *interactor;
  _BYTE v4[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v4, 0, 0);
  sub_10003F198(interactor, *(_QWORD *)&self->interactor[24]);
  swift_retain(self);
  sub_1002A1CE8(0);
  swift_release(self);
}

- (void)stop
{
  sub_1004CA7E0((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_stop);
}

- (void)scrubTo:(float)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(char);
  _BYTE v10[24];

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject(&unk_10090B568, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v9 = sub_1002028E0;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  swift_beginAccess(self->interactor, v10, 0, 0);
  sub_10003F198(self->interactor, *(_QWORD *)&self->interactor[24]);
  swift_retain(self);
  sub_1002A084C((uint64_t)v9, v8, a3);
  sub_10002AD00((uint64_t)v9, v8);
  swift_release(self);
}

- (void)setVolume:(float)a3
{
  unsigned __int8 *interactor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, float);
  _BYTE v9[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v9, 33, 0);
  v6 = *(_QWORD *)&self->interactor[24];
  v7 = *(_QWORD *)&self->interactor[32];
  sub_100063750((uint64_t)interactor, v6);
  v8 = *(void (**)(uint64_t, uint64_t, float))(v7 + 256);
  swift_retain(self);
  v8(v6, v7, a3);
  swift_endAccess(v9);
  swift_release(self);
}

- (void)setBuyButtonProgress:(double)a3
{
  unsigned __int8 *interactor;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _BYTE v9[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v9, 0, 0);
  v6 = (_QWORD *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v6, &v8, 0, 0);
  v7 = sub_10003F198(v6, v6[3]);
  sub_10003F198((_QWORD *)(*v7 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sharedStateProvider), *(_QWORD *)(*v7 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sharedStateProvider + 24));
  swift_retain(self);
  sub_10042FDEC(a3);
  swift_release(self);
}

- (void)setWithDownloadState:(int64_t)a3 assetState:(signed __int16)a4 progressValue:(float)a5
{
  unsigned __int8 *interactor;
  _BYTE v10[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v10, 0, 0);
  sub_10003F198(interactor, *(_QWORD *)&self->interactor[24]);
  swift_retain(self);
  sub_1002A0B40(a3, a4, a5);
  swift_release(self);
}

- (void)startDownload
{
  sub_1004CAD34((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_1002A10F0);
}

- (void)startSkipBackwardWithActionSource:(unint64_t)a3
{
  sub_1004CAB44((uint64_t)self, (uint64_t)a2, a3, 0);
}

- (void)startSkipForwardWithActionSource:(unint64_t)a3
{
  sub_1004CAB44((uint64_t)self, (uint64_t)a2, a3, 1);
}

- (void)toolbarStartSkipBackward
{
  sub_1004CACF8((uint64_t)self, (uint64_t)a2, 0);
}

- (void)toolbarStartSkipForward
{
  sub_1004CACF8((uint64_t)self, (uint64_t)a2, 1);
}

- (void)togglePlayPause
{
  sub_1004CAD34((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_1002A1C40);
}

- (void)updateFollowingDormantPeriod
{
  unsigned __int8 *interactor;
  _BYTE v4[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v4, 0, 0);
  sub_10003F198(interactor, *(_QWORD *)&self->interactor[24]);
  swift_retain(self);
  sub_1002A22F4();
  swift_release(self);
}

- (void)viewSupplementalContentWithViewController:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain(self);
  sub_1004CAE00(v4);

  swift_release(self);
}

- (id)contextMenuItemsFor:(id)a3 from:(id)a4 actionSource:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD *v14;
  Class isa;
  uint64_t v17;
  _BYTE v18[24];

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  swift_beginAccess(self->interactor, v18, 0, 0);
  v11 = (_QWORD *)(*sub_10003F198(self->interactor, *(_QWORD *)&self->interactor[24])
                 + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v11, &v17, 0, 0);
  sub_10003F198(v11, v11[3]);
  v12 = a3;
  v13 = a4;
  swift_retain(self);
  v14 = sub_1003F72F4((uint64_t)v12, v13, v8, v10);

  swift_release(self);
  swift_bridgeObjectRelease(v10);
  sub_1004CD474();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

- (id)analyticsAssetPropertyProviderFor:(id)a3 actionSource:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  uint64_t v19;
  _BYTE v20[24];

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  swift_beginAccess(self->interactor, v20, 0, 0);
  v9 = (_QWORD *)(*sub_10003F198(self->interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v9, &v19, 0, 0);
  v10 = sub_10003F198(v9, v9[3]);
  v11 = *v10;
  v12 = *(void **)(*v10 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  v13 = a3;
  v14 = objc_msgSend(v12, "currentAudiobook", swift_retain(self).n128_f64[0]);
  v15 = (void *)sub_1003F73DC((uint64_t)v14, v13, v6, v8);
  *(_QWORD *)&v16 = swift_unknownObjectRelease(v14).n128_u64[0];
  if (v15)
  {
    v17 = objc_msgSend(*(id *)(v11 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_contextMenuProvider), "analyticsAssetPropertyProviderForDataModel:", v15, v16);
    swift_release(self);
    swift_bridgeObjectRelease(v8);

  }
  else
  {
    swift_release(self);
    swift_bridgeObjectRelease(v8);
    v17 = 0;
  }

  return v17;
}

- (id)analyticsData
{
  unsigned __int8 *interactor;
  _QWORD *v4;
  void *v5;
  uint64_t v7;
  _BYTE v8[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v8, 0, 0);
  v4 = (_QWORD *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v4, &v7, 0, 0);
  sub_10003F198(v4, v4[3]);
  swift_retain(self);
  v5 = (void *)sub_1003F758C();
  swift_release(self);
  return v5;
}

- (BOOL)activeMode
{
  unsigned __int8 *interactor;
  _BYTE v5[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v5, 0, 0);
  return *(_BYTE *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                  + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor__activeMode);
}

- (void)setActiveMode:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 *interactor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t, __n128);
  __n128 v9;
  _BYTE v10[24];

  v3 = a3;
  interactor = self->interactor;
  swift_beginAccess(self->interactor, v10, 33, 0);
  v6 = *(_QWORD *)&self->interactor[24];
  v7 = *(_QWORD *)&self->interactor[32];
  sub_100063750((uint64_t)interactor, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t, __n128))(v7 + 40);
  v9 = swift_retain(self);
  v8(v3, v6, v7, v9);
  swift_endAccess(v10);
  swift_release(self);
}

- (AEAssetAudiobookStatus)assetStatus
{
  return (AEAssetAudiobookStatus *)*(id *)self->assetAudiobookStatus;
}

- (BOOL)audiobookTimeRemainingMode
{
  return byte_1009D7320;
}

- (void)setAudiobookTimeRemainingMode:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 *interactor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t, __n128);
  __n128 v9;
  _BYTE v10[24];

  v3 = a3;
  interactor = self->interactor;
  swift_beginAccess(self->interactor, v10, 33, 0);
  v6 = *(_QWORD *)&self->interactor[24];
  v7 = *(_QWORD *)&self->interactor[32];
  sub_100063750((uint64_t)interactor, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t, __n128))(v7 + 80);
  v9 = swift_retain(self);
  v8(v3, v6, v7, v9);
  swift_endAccess(v10);
  swift_release(self);
}

- (BOOL)isScrubbing
{
  unsigned __int8 *interactor;
  _QWORD *v4;
  void *v5;
  _BYTE v7[24];
  _BYTE v8[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v8, 32, 0);
  v4 = (_QWORD *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v4, v7, 32, 0);
  v5 = *(void **)(*sub_10003F198(v4, v4[3]) + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  LOBYTE(v5) = objc_msgSend(v5, "isScrubbing", swift_retain(self).n128_f64[0]);
  swift_endAccess(v7);
  swift_endAccess(v8);
  swift_release(self);
  return (char)v5;
}

- (void)setIsScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 *interactor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t, __n128);
  __n128 v9;
  _BYTE v10[24];

  v3 = a3;
  interactor = self->interactor;
  swift_beginAccess(self->interactor, v10, 33, 0);
  v6 = *(_QWORD *)&self->interactor[24];
  v7 = *(_QWORD *)&self->interactor[32];
  sub_100063750((uint64_t)interactor, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t, __n128))(v7 + 168);
  v9 = swift_retain(self);
  v8(v3, v6, v7, v9);
  swift_endAccess(v10);
  swift_release(self);
}

- (int64_t)sleepTimerOption
{
  unsigned __int8 *interactor;
  _QWORD *v4;
  int64_t v5;
  _BYTE v7[24];
  _BYTE v8[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v8, 32, 0);
  v4 = (_QWORD *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v4, v7, 32, 0);
  sub_10003F198(v4, v4[3]);
  swift_retain(self);
  v5 = sub_1003F67D4();
  swift_endAccess(v7);
  swift_endAccess(v8);
  swift_release(self);
  return v5;
}

- (void)setSleepTimerOption:(int64_t)a3
{
  unsigned __int8 *interactor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(int64_t, uint64_t, uint64_t, __n128);
  __n128 v9;
  _BYTE v10[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v10, 33, 0);
  v6 = *(_QWORD *)&self->interactor[24];
  v7 = *(_QWORD *)&self->interactor[32];
  sub_100063750((uint64_t)interactor, v6);
  v8 = *(void (**)(int64_t, uint64_t, uint64_t, __n128))(v7 + 200);
  v9 = swift_retain(self);
  v8(a3, v6, v7, v9);
  swift_endAccess(v10);
  swift_release(self);
}

- (NSArray)playbackRates
{
  _QWORD *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_1004CBD5C();
  swift_release(self);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (float)playbackRate
{
  unsigned __int8 *interactor;
  _QWORD *v4;
  void *v5;
  float v6;
  float v7;
  _QWORD *v8;
  float v9;
  _BYTE v11[24];
  _BYTE v12[24];

  interactor = self->interactor;
  swift_beginAccess(self->interactor, v12, 0, 0);
  v4 = (_QWORD *)(*sub_10003F198(interactor, *(_QWORD *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess(v4, v11, 32, 0);
  v5 = *(void **)(*sub_10003F198(v4, v4[3]) + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  objc_msgSend(v5, "playbackRate", swift_retain(self).n128_f64[0]);
  v7 = v6;
  sub_10003F198(v4, v4[3]);
  swift_endAccess(v11);
  v8 = sub_1003F6888();
  v9 = sub_1002A25F4((uint64_t)v8, v7);
  swift_release(self);
  swift_bridgeObjectRelease(v8);
  return v9;
}

@end
