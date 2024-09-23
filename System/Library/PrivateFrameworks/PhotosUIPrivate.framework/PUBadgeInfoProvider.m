@implementation PUBadgeInfoProvider

- (PUBadgeInfoProvider)init
{
  PUBadgeInfoProvider *v2;
  PUBadgeInfoProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUBadgeInfoProvider;
  v2 = -[PUBadgeInfoProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastPlayingTime = -1.79769313e308;
    objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObserver:context:", v3, PUBadgeTileEditOperationManagerObservationContext);

  }
  return v3;
}

- (void)prepareForReuse
{
  __int128 v3;
  _OWORD v4[2];

  -[PUBadgeInfoProvider setAssetViewModel:](self, "setAssetViewModel:", 0);
  v3 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v4[0] = *MEMORY[0x1E0D7CE00];
  v4[1] = v3;
  -[PUBadgeInfoProvider setBadgeInfo:](self, "setBadgeInfo:", v4);
  -[PUBadgeInfoProvider setLastPlayingTime:](self, "setLastPlayingTime:", -1.79769313e308);
}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *assetViewModel;
  void *v7;
  void *v8;
  PUAssetViewModel *v9;

  v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    v9 = v5;
    -[PUAssetViewModel videoPlayer](assetViewModel, "videoPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterChangeObserver:", self);

    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUBadgeInfoProvider _updatePlaying](self, "_updatePlaying");
    -[PUAssetViewModel videoPlayer](self->_assetViewModel, "videoPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:", self);

    v5 = v9;
  }

}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  PXAssetBadgeInfo *p_badgeInfo;
  __int128 v6;
  PXAssetBadgeInfo v7;
  PXAssetBadgeInfo badgeInfo;

  p_badgeInfo = &self->_badgeInfo;
  badgeInfo = self->_badgeInfo;
  v7 = *a3;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_badgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_badgeInfo->count = v6;
    -[PUBadgeInfoProvider _invalidateOutput](self, "_invalidateOutput", *(_OWORD *)&v7.badges, *(_OWORD *)&v7.count, *(_OWORD *)&badgeInfo.badges, *(_OWORD *)&badgeInfo.count);
  }
}

- (void)_updatePlaying
{
  id v3;

  -[PUAssetViewModel videoPlayer](self->_assetViewModel, "videoPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUBadgeInfoProvider setPlaying:](self, "setPlaying:", objc_msgSend(v3, "playState") == 3);

}

- (void)setPlaying:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[PUBadgeInfoProvider setLastPlayingTime:](self, "setLastPlayingTime:");
      objc_initWeak(&location, self);
      v4 = dispatch_time(0, 2500000000);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __34__PUBadgeInfoProvider_setPlaying___block_invoke;
      v5[3] = &unk_1E58AB2F8;
      objc_copyWeak(&v6, &location);
      dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PUBadgeInfoProvider setLastPlayingTime:](self, "setLastPlayingTime:", -1.79769313e308);
    }
  }
}

- (void)setLastPlayingTime:(double)a3
{
  if (self->_lastPlayingTime != a3)
  {
    self->_lastPlayingTime = a3;
    -[PUBadgeInfoProvider _invalidateOutput](self, "_invalidateOutput");
  }
}

- (void)invalidateOutput
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__PUBadgeInfoProvider_invalidateOutput__block_invoke;
  v2[3] = &unk_1E58A7340;
  v2[4] = self;
  -[PUBadgeInfoProvider performChanges:](self, "performChanges:", v2);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBadgeInfoProvider;
  -[PUBadgeInfoProvider performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBadgeInfoProvider;
  -[PUBadgeInfoProvider didPerformChanges](&v3, sel_didPerformChanges);
  -[PUBadgeInfoProvider _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setNeedsUpdate
{
  -[PUBadgeInfoProvider signalChange:](self, "signalChange:", 0);
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUBadgeInfoProvider _needsUpdate](self, "_needsUpdate"))
  {
    -[PUBadgeInfoProvider _updateOutputIfNeeded](self, "_updateOutputIfNeeded");
    if (-[PUBadgeInfoProvider _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeInfoProvider.m"), 134, CFSTR("update still needed after update pass"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.output;
}

- (void)_invalidateOutput
{
  self->_needsUpdateFlags.output = 1;
  -[PUBadgeInfoProvider _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateOutputIfNeeded
{
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  unsigned __int8 v6;

  if (self->_needsUpdateFlags.output)
  {
    self->_needsUpdateFlags.output = 0;
    v6 = 0;
    v4 = 0u;
    v5 = 0u;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PUBadgeInfoProvider _filteredBadgeInfoForTime:outShouldAnimate:](self, "_filteredBadgeInfoForTime:outShouldAnimate:", &v6);
    v3[0] = v4;
    v3[1] = v5;
    -[PUBadgeInfoProvider _setOutputBadgeInfo:shouldAnimate:](self, "_setOutputBadgeInfo:shouldAnimate:", v3, v6);
  }
}

- (PXAssetBadgeInfo)_filteredBadgeInfoForTime:(SEL)a3 outShouldAnimate:(double)a4
{
  double v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PXAssetBadgeInfo *result;
  unint64_t badges;
  unint64_t v30;

  *(_OWORD *)&retstr->badges = 0u;
  *(_OWORD *)&retstr->count = 0u;
  -[PUBadgeInfoProvider badgeInfo](self, "badgeInfo");
  -[PUBadgeInfoProvider lastPlayingTime](self, "lastPlayingTime");
  v10 = v9;
  if (v9 == -1.79769313e308)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    -[PUBadgeInfoProvider assetViewModel](self, "assetViewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = ((unint64_t)objc_msgSend(v13, "mediaSubtypes") >> 20) & 1;

    v15 = v10 + 2.5;
    if (v15 < a4)
      v11 = v14;
    else
      v11 = 0;
    if (v11)
      retstr->badges &= ~0x400uLL;
    -[PUBadgeInfoProvider assetViewModel](self, "assetViewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mediaSubtypes") & 0x200000;

    if (v15 < a4 && v18 != 0)
    {
      retstr->badges &= ~0x800000000uLL;
      LOBYTE(v11) = 1;
    }
    -[PUBadgeInfoProvider assetViewModel](self, "assetViewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "asset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "isProRes");
    if (v15 < a4 && v22)
    {
      retstr->badges &= ~0x400000000uLL;
      LOBYTE(v11) = 1;
    }
    if (objc_msgSend(v21, "isSpatialMedia"))
    {
      v23 = objc_msgSend(v21, "isVideo");
      if (v15 < a4)
      {
        if (v23)
        {
          retstr->badges &= ~0x20000000000uLL;
          LOBYTE(v11) = 1;
        }
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBadgeInfoProvider assetViewModel](self, "assetViewModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "asset");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "editOperationStatusForAsset:", v26);

  badges = retstr->badges;
  if ((retstr->badges & 0x2000) != 0 && v27 == 3)
  {
    badges |= 0x4000uLL;
    retstr->badges = badges;
  }
  else if ((badges & 0x4000) != 0 && v27 != 3)
  {
    badges &= ~0x4000uLL;
    retstr->badges = badges;
    goto LABEL_30;
  }
  if ((badges & 0x40000000000) != 0 && v27 == 3)
  {
    v30 = badges | 0x80000000000;
    goto LABEL_33;
  }
LABEL_30:
  if ((badges & 0x80000000000) == 0 || v27 == 3)
    goto LABEL_34;
  v30 = badges & 0xFFFFF7FFFFFFFFFFLL;
LABEL_33:
  retstr->badges = v30;
LABEL_34:
  if (a5)
    *a5 = v11;
  return result;
}

- (void)_setOutputBadgeInfo:(PXAssetBadgeInfo *)a3 shouldAnimate:(BOOL)a4
{
  PXAssetBadgeInfo *p_outputBadgeInfo;
  __int128 v8;
  PXAssetBadgeInfo v9;
  PXAssetBadgeInfo outputBadgeInfo;

  p_outputBadgeInfo = &self->_outputBadgeInfo;
  outputBadgeInfo = self->_outputBadgeInfo;
  v9 = *a3;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    v8 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_outputBadgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_outputBadgeInfo->count = v8;
    self->_outputShouldAnimate = a4;
    -[PUBadgeInfoProvider signalChange:](self, "signalChange:", 1, *(_OWORD *)&v9.badges, *(_OWORD *)&v9.count, *(_OWORD *)&outputBadgeInfo.badges, *(_OWORD *)&outputBadgeInfo.count);
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  _QWORD v5[5];

  if (objc_msgSend(a4, "playStateDidChange", a3))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__PUBadgeInfoProvider_viewModel_didChange___block_invoke;
    v5[3] = &unk_1E58A7340;
    v5[4] = self;
    -[PUBadgeInfoProvider performChanges:](self, "performChanges:", v5);
  }
}

- (void)assetEditOperationManager:(id)a3 didChangeEditOperationStatusForAsset:(id)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  if ((void *)PUBadgeTileEditOperationManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeInfoProvider.m"), 244, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  -[PUBadgeInfoProvider invalidateOutput](self, "invalidateOutput");

}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PXAssetBadgeInfo)badgeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].duration;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[3].fileSize;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (PXAssetBadgeInfo)outputBadgeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].duration;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[4].fileSize;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (BOOL)outputShouldAnimate
{
  return self->_outputShouldAnimate;
}

- (double)lastPlayingTime
{
  return self->_lastPlayingTime;
}

- (BOOL)playing
{
  return self->_playing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

uint64_t __43__PUBadgeInfoProvider_viewModel_didChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaying");
}

uint64_t __39__PUBadgeInfoProvider_invalidateOutput__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateOutput");
}

void __34__PUBadgeInfoProvider_setPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateOutput");

}

@end
