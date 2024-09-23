@implementation _PXStoryExport_VideoHighlightInfo

- (_PXStoryExport_VideoHighlightInfo)initWithAsset:(id)a3 loadingVideoTimeRange:(id *)a4 loadedVideoPlaybackStartTime:(id *)a5 storyPlaybackRange:(id *)a6 audioInfo:(id *)a7
{
  id v13;
  _PXStoryExport_VideoHighlightInfo *v14;
  _PXStoryExport_VideoHighlightInfo *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v25;

  v13 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_PXStoryExport_VideoHighlightInfo;
  v14 = -[_PXStoryExport_VideoHighlightInfo init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    v16 = *(_OWORD *)&a5->var0;
    v15->_loadedVideoPlaybackStartTime.epoch = a5->var3;
    *(_OWORD *)&v15->_loadedVideoPlaybackStartTime.value = v16;
    v17 = *(_OWORD *)&a4->var0.var0;
    v18 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v15->_loadingVideoTimeRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v15->_loadingVideoTimeRange.start.epoch = v18;
    *(_OWORD *)&v15->_loadingVideoTimeRange.start.value = v17;
    v19 = *(_OWORD *)&a6->var0.var0;
    v20 = *(_OWORD *)&a6->var0.var3;
    *(_OWORD *)&v15->_storyPlaybackRange.duration.timescale = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)&v15->_storyPlaybackRange.start.epoch = v20;
    *(_OWORD *)&v15->_storyPlaybackRange.start.value = v19;
    v21 = *(_OWORD *)&a7->var0;
    v22 = *(_OWORD *)&a7->var2;
    v23 = *(_OWORD *)&a7->var4;
    v15->_audioInfo.fadeOut = a7->var6;
    *(_OWORD *)&v15->_audioInfo.LCutLength = v23;
    *(_OWORD *)&v15->_audioInfo.volume = v22;
    *(_OWORD *)&v15->_audioInfo.mode = v21;
  }

  return v15;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[56];
  _BYTE v14[48];
  CMTime v15;
  _BYTE v16[48];

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExport_VideoHighlightInfo asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExport_VideoHighlightInfo loadingVideoTimeRange](self, "loadingVideoTimeRange");
  PXStoryTimeRangeDescription((uint64_t)v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExport_VideoHighlightInfo loadedVideoPlaybackStartTime](self, "loadedVideoPlaybackStartTime");
  PXStoryTimeDescription(&v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExport_VideoHighlightInfo storyPlaybackRange](self, "storyPlaybackRange");
  PXStoryTimeRangeDescription((uint64_t)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExport_VideoHighlightInfo audioInfo](self, "audioInfo");
  PXStoryClipAudioInfoDescription((uint64_t)v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; asset: %@; loadingVideoTimeRange: %@; loadedVideoPlaybackStartTime: %@; storyPlaybackRange: %@ audio:%@>"),
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10);

  return v11;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)loadingVideoTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setLoadingVideoTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_loadingVideoTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_loadingVideoTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_loadingVideoTimeRange.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loadedVideoPlaybackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setLoadedVideoPlaybackStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_loadedVideoPlaybackStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_loadedVideoPlaybackStartTime.value = v3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)storyPlaybackRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (void)setStoryPlaybackRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_storyPlaybackRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_storyPlaybackRange.start.epoch = v4;
  *(_OWORD *)&self->_storyPlaybackRange.start.value = v3;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[3].var0;
  retstr->var6 = *(double *)&self[3].var2;
  return self;
}

- (void)setAudioInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  v5 = *(_OWORD *)&a3->var4;
  self->_audioInfo.fadeOut = a3->var6;
  *(_OWORD *)&self->_audioInfo.LCutLength = v5;
  *(_OWORD *)&self->_audioInfo.volume = v4;
  *(_OWORD *)&self->_audioInfo.mode = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
