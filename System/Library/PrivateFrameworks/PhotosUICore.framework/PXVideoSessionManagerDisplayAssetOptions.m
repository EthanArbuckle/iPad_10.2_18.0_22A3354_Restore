@implementation PXVideoSessionManagerDisplayAssetOptions

- (PXVideoSessionManagerDisplayAssetOptions)init
{
  PXVideoSessionManagerDisplayAssetOptions *v2;
  PXVideoSessionManagerDisplayAssetOptions *v3;
  NSMutableArray *v4;
  NSMutableArray *strategiesStore;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXVideoSessionManagerDisplayAssetOptions;
  v2 = -[PXVideoSessionManagerDisplayAssetOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isAudioAllowed = 1;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    strategiesStore = v3->_strategiesStore;
    v3->_strategiesStore = v4;

  }
  return v3;
}

- (NSArray)strategies
{
  void *v2;
  void *v3;

  -[PXVideoSessionManagerDisplayAssetOptions strategiesStore](self, "strategiesStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addContentDeliveryStrategyWithDeliveryQuality:(int64_t)a3 segmentTimeRange:(id *)a4 streamingAllowed:(BOOL)a5
{
  __int128 v5;
  _OWORD v6[3];

  v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:](self, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:", a3, v6, a5, 1);
}

- (void)addContentDeliveryStrategyWithDeliveryQuality:(int64_t)a3 segmentTimeRange:(id *)a4 streamingAllowed:(BOOL)a5 networkAccessAllowed:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  PXDisplayAssetVideoContentDeliveryStrategy *v11;
  __int128 v12;
  void *v13;
  _OWORD v14[3];

  v6 = a6;
  v7 = a5;
  v11 = objc_alloc_init(PXDisplayAssetVideoContentDeliveryStrategy);
  -[PXDisplayAssetVideoContentDeliveryStrategy setQuality:](v11, "setQuality:", a3);
  v12 = *(_OWORD *)&a4->var0.var3;
  v14[0] = *(_OWORD *)&a4->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a4->var1.var1;
  -[PXDisplayAssetVideoContentDeliveryStrategy setSegmentTimeRange:](v11, "setSegmentTimeRange:", v14);
  -[PXDisplayAssetVideoContentDeliveryStrategy setIsStreamingAllowed:](v11, "setIsStreamingAllowed:", v7);
  -[PXDisplayAssetVideoContentDeliveryStrategy setIsNetworkAccessAllowed:](v11, "setIsNetworkAccessAllowed:", v6);
  -[PXDisplayAssetVideoContentDeliveryStrategy setIsAudioAllowed:](v11, "setIsAudioAllowed:", -[PXVideoSessionManagerDisplayAssetOptions isAudioAllowed](self, "isAudioAllowed"));
  -[PXVideoSessionManagerDisplayAssetOptions strategiesStore](self, "strategiesStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

}

- (BOOL)shouldCreateUniqueVideoSession
{
  return self->_shouldCreateUniqueVideoSession;
}

- (void)setShouldCreateUniqueVideoSession:(BOOL)a3
{
  self->_shouldCreateUniqueVideoSession = a3;
}

- (BOOL)shouldStabilizeLivePhotosIfPossible
{
  return self->_shouldStabilizeLivePhotosIfPossible;
}

- (void)setShouldStabilizeLivePhotosIfPossible:(BOOL)a3
{
  self->_shouldStabilizeLivePhotosIfPossible = a3;
}

- (BOOL)shouldPlayLivePhotosWithSettlingEffectIfPossible
{
  return self->_shouldPlayLivePhotosWithSettlingEffectIfPossible;
}

- (void)setShouldPlayLivePhotosWithSettlingEffectIfPossible:(BOOL)a3
{
  self->_shouldPlayLivePhotosWithSettlingEffectIfPossible = a3;
}

- (BOOL)shouldCrossfadeLivePhotosWhenLooping
{
  return self->_shouldCrossfadeLivePhotosWhenLooping;
}

- (void)setShouldCrossfadeLivePhotosWhenLooping:(BOOL)a3
{
  self->_shouldCrossfadeLivePhotosWhenLooping = a3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)livePhotoLoopTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setLivePhotoLoopTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_livePhotoLoopTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_livePhotoLoopTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_livePhotoLoopTimeRange.start.value = v3;
}

- (BOOL)isAudioAllowed
{
  return self->_isAudioAllowed;
}

- (void)setIsAudioAllowed:(BOOL)a3
{
  self->_isAudioAllowed = a3;
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (NSMutableArray)strategiesStore
{
  return self->_strategiesStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategiesStore, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

@end
