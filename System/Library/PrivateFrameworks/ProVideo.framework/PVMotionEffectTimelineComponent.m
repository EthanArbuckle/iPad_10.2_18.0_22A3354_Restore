@implementation PVMotionEffectTimelineComponent

- (PVMotionEffectTimelineComponent)initWithMotionEffect:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  __int128 *v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  OZChannelBool *v14;
  OZChannelBool *v15;
  PCString v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PVMotionEffectTimelineComponent;
  v5 = -[PVMotionEffectComponent initWithMotionEffect:](&v18, sel_initWithMotionEffect_, v4);
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 6) = 0;
    *((_QWORD *)v5 + 4) = 0;
    v7 = (__int128 *)MEMORY[0x1E0CA2E68];
    v8 = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)v5 + 7) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)(v5 + 40) = v8;
    v9 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = 0;

    v10 = *v7;
    *((_QWORD *)v6 + 23) = *((_QWORD *)v7 + 2);
    *(_OWORD *)(v6 + 168) = v10;
    v11 = (__int128 *)MEMORY[0x1E0CA2E18];
    v12 = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v6 + 26) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *((_OWORD *)v6 + 12) = v12;
    v6[216] = 0;
    v13 = *v11;
    *(_QWORD *)(v6 + 236) = *((_QWORD *)v11 + 2);
    *(_OWORD *)(v6 + 220) = v13;
    v14 = (OZChannelBool *)operator new();
    PCString::PCString(&v17, "Build In Enable");
    OZChannelBool::OZChannelBool(v14, 1, &v17, 0, 1u, 0, 0, 0);
    *((_QWORD *)v6 + 31) = v14;
    PCString::~PCString(&v17);
    v15 = (OZChannelBool *)operator new();
    PCString::PCString(&v17, "Build Out Enable");
    OZChannelBool::OZChannelBool(v15, 1, &v17, 0, 2u, 0, 0, 0);
    *((_QWORD *)v6 + 32) = v15;
    PCString::~PCString(&v17);
    v6[264] = 1;
  }

  return (PVMotionEffectTimelineComponent *)v6;
}

- (void)dealloc
{
  OZChannelBool *buildInEnableChan;
  OZChannelBool *buildOutEnableChan;
  objc_super v5;

  buildInEnableChan = self->_buildInEnableChan;
  if (buildInEnableChan)
  {
    (*((void (**)(OZChannelBool *, SEL))buildInEnableChan->var0 + 1))(buildInEnableChan, a2);
    self->_buildInEnableChan = 0;
  }
  buildOutEnableChan = self->_buildOutEnableChan;
  if (buildOutEnableChan)
  {
    (*((void (**)(OZChannelBool *, SEL))buildOutEnableChan->var0 + 1))(buildOutEnableChan, a2);
    self->_buildOutEnableChan = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffectTimelineComponent;
  -[PVMotionEffectTimelineComponent dealloc](&v5, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v7[6];
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  uint64_t (*v12)();
  void *v13;

  v8 = 0;
  v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PVMotionEffectTimelineComponent_timelineDuration__block_invoke;
  v7[3] = &unk_1E64D6360;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v7);

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __51__PVMotionEffectTimelineComponent_timelineDuration__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double result;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timelineDuration_NoLock");
  }
  else
  {
    v5 = 0uLL;
    v6 = 0;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(_QWORD *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration_NoLock
{
  void *v5;
  void *v6;
  int64_t v7;
  double v8;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  v7 = 120000
     * -[PVMotionEffectTimelineComponent timelineDurationInFrames_NoLock](self, "timelineDurationInFrames_NoLock");
  -[PVMotionEffectTimelineComponent timelineFrameRate_NoLock](self, "timelineFrameRate_NoLock");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v7, (int)(v8 * 120000.0));
}

- (unsigned)timelineDurationInFrames
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PVMotionEffectTimelineComponent_timelineDurationInFrames__block_invoke;
  v5[3] = &unk_1E64D6360;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__PVMotionEffectTimelineComponent_timelineDurationInFrames__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "timelineDurationInFrames_NoLock");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)timelineDurationInFrames_NoLock
{
  void *v3;
  void *v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  return self->_numFrames;
}

- (double)timelineDurationInSeconds
{
  void *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PVMotionEffectTimelineComponent_timelineDurationInSeconds__block_invoke;
  v6[3] = &unk_1E64D6360;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__PVMotionEffectTimelineComponent_timelineDurationInSeconds__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "timelineDurationInSeconds_NoLock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)timelineDurationInSeconds_NoLock
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  LODWORD(v5) = self->_numFrames;
  return (double)v5 / self->_frameRate;
}

- (double)timelineFrameRate
{
  void *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PVMotionEffectTimelineComponent_timelineFrameRate__block_invoke;
  v6[3] = &unk_1E64D6360;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __52__PVMotionEffectTimelineComponent_timelineFrameRate__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "timelineFrameRate_NoLock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)timelineFrameRate_NoLock
{
  void *v3;
  void *v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  return self->_frameRate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v7[6];
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  uint64_t (*v12)();
  void *v13;

  v8 = 0;
  v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PVMotionEffectTimelineComponent_timelineFrameDuration__block_invoke;
  v7[3] = &unk_1E64D6360;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v7);

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __56__PVMotionEffectTimelineComponent_timelineFrameDuration__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double result;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timelineFrameDuration_NoLock");
  }
  else
  {
    v5 = 0uLL;
    v6 = 0;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(_QWORD *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration_NoLock
{
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_frameDuration;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v7[6];
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  uint64_t (*v12)();
  void *v13;

  v8 = 0;
  v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PVMotionEffectTimelineComponent_timelineLastFrame__block_invoke;
  v7[3] = &unk_1E64D6360;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v7);

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __52__PVMotionEffectTimelineComponent_timelineLastFrame__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double result;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timelineLastFrame_NoLock");
  }
  else
  {
    v5 = 0uLL;
    v6 = 0;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(_QWORD *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame_NoLock
{
  void *v5;
  void *v6;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 120000 * self->_numFrames - 120000, (int)(self->_frameRate * 120000.0));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3
{
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v9[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v12;
  uint64_t v13;
  __n128 (*v14)(__n128 *, __n128 *);
  uint64_t (*v15)();
  void *v16;

  v11 = 0;
  v12 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v11;
  v13 = 0x4812000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PVMotionEffectTimelineComponent_componentTimeFromTimelineTime___block_invoke;
  v9[3] = &unk_1E64D6388;
  v9[4] = self;
  v9[5] = &v11;
  v10 = *a4;
  objc_msgSend(v7, "runEnsuringDocumentReadyAndLockingDocument:", v9);

  *retstr = v12[2];
  _Block_object_dispose(&v11, 8);
  return result;
}

double __65__PVMotionEffectTimelineComponent_componentTimeFromTimelineTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    objc_msgSend(v3, "componentTimeFromTimelineTime_NoLock:documentInfo:", &v6, a2);
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v8;
  *(_OWORD *)(v4 + 48) = v8;
  *(_QWORD *)(v4 + 64) = v9;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3
{
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v9[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v12;
  uint64_t v13;
  __n128 (*v14)(__n128 *, __n128 *);
  uint64_t (*v15)();
  void *v16;

  v11 = 0;
  v12 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v11;
  v13 = 0x4812000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PVMotionEffectTimelineComponent_timelineTimeFromComponentTime___block_invoke;
  v9[3] = &unk_1E64D6388;
  v9[4] = self;
  v9[5] = &v11;
  v10 = *a4;
  objc_msgSend(v7, "runEnsuringDocumentReadyAndLockingDocument:", v9);

  *retstr = v12[2];
  _Block_object_dispose(&v11, 8);
  return result;
}

double __65__PVMotionEffectTimelineComponent_timelineTimeFromComponentTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    objc_msgSend(v3, "timelineTimeFromComponentTime_NoLock:documentInfo:", &v6, a2);
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v8;
  *(_OWORD *)(v4 + 48) = v8;
  *(_QWORD *)(v4 + 64) = v9;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3
{
  void *v7;
  __int128 v8;
  uint64_t *v9;
  __int128 v10;
  $202A6A048D39AE170264FF71A65A9479 *result;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  __n128 (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)();
  void *v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x6012000000;
  v19 = __Block_byref_object_copy__52;
  v20 = __Block_byref_object_dispose__53;
  v21 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PVMotionEffectTimelineComponent_componentTimeRangeFromTimelineTimeRange___block_invoke;
  v12[3] = &unk_1E64D63B0;
  v12[4] = self;
  v12[5] = &v16;
  v8 = *(_OWORD *)&a4->var0.var3;
  v13 = *(_OWORD *)&a4->var0.var0;
  v14 = v8;
  v15 = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v7, "runEnsuringDocumentReadyAndLockingDocument:", v12);

  v9 = v17;
  v10 = *((_OWORD *)v17 + 4);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->var0.var3 = v10;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v9 + 5);
  _Block_object_dispose(&v16, 8);
  return result;
}

double __75__PVMotionEffectTimelineComponent_componentTimeRangeFromTimelineTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  _OWORD *v5;
  __int128 v6;
  double result;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 80);
  if (v3)
  {
    objc_msgSend(v3, "componentTimeRangeFromTimelineTimeRange_NoLock:documentInfo:", v8, a2);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  v5 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v6 = v10;
  v5[3] = v9;
  v5[4] = v6;
  result = *(double *)&v11;
  v5[5] = v11;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3
{
  void *v7;
  __int128 v8;
  uint64_t *v9;
  __int128 v10;
  $202A6A048D39AE170264FF71A65A9479 *result;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  __n128 (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)();
  void *v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x6012000000;
  v19 = __Block_byref_object_copy__52;
  v20 = __Block_byref_object_dispose__53;
  v21 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PVMotionEffectTimelineComponent_timelineTimeRangeFromComponentTimeRange___block_invoke;
  v12[3] = &unk_1E64D63B0;
  v12[4] = self;
  v12[5] = &v16;
  v8 = *(_OWORD *)&a4->var0.var3;
  v13 = *(_OWORD *)&a4->var0.var0;
  v14 = v8;
  v15 = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v7, "runEnsuringDocumentReadyAndLockingDocument:", v12);

  v9 = v17;
  v10 = *((_OWORD *)v17 + 4);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->var0.var3 = v10;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v9 + 5);
  _Block_object_dispose(&v16, 8);
  return result;
}

double __75__PVMotionEffectTimelineComponent_timelineTimeRangeFromComponentTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  _OWORD *v5;
  __int128 v6;
  double result;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 80);
  if (v3)
  {
    objc_msgSend(v3, "componentTimeRangeFromTimelineTimeRange_NoLock:documentInfo:", v8, a2);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  v5 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v6 = v10;
  v5[3] = v9;
  v5[4] = v6;
  result = *(double *)&v11;
  v5[5] = v11;
  return result;
}

- (id)timelineMarkers
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__56;
  v11 = __Block_byref_object_dispose__57;
  v12 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PVMotionEffectTimelineComponent_timelineMarkers__block_invoke;
  v6[3] = &unk_1E64D6360;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__PVMotionEffectTimelineComponent_timelineMarkers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "timelineMarkers_NoLock:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)timelineMarkers_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  unsigned int i;
  void *v11;
  _BYTE v13[72];

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  v7 = OZXMarkerCount(*(_QWORD *)a3);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v8; ++i)
    {
      if (!OZXGetMarkerFigTime(*(_QWORD *)a3, i, (uint64_t)v13))
      {
        +[PVTimelineMarker markerWithOZXTimeMarkerFigTime:](PVTimelineMarker, "markerWithOZXTimeMarkerFigTime:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

      }
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)timelineMarkersOfType:(int)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__56;
  v14 = __Block_byref_object_dispose__57;
  v15 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PVMotionEffectTimelineComponent_timelineMarkersOfType___block_invoke;
  v8[3] = &unk_1E64D63D8;
  v8[4] = self;
  v8[5] = &v10;
  v9 = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __57__PVMotionEffectTimelineComponent_timelineMarkersOfType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "timelineMarkersOfType_NoLock:documentInfo:", *(unsigned int *)(a1 + 48), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)timelineMarkersOfType_NoLock:(int)a3 documentInfo:(const void *)a4
{
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  unsigned int i;
  void *v13;
  _BYTE v15[72];

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentStatusIsLoadedOrReady");

  v9 = OZXMarkerCount(*(_QWORD *)a4);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v10; ++i)
    {
      if (!OZXGetMarkerFigTimeOfType(*(_QWORD *)a4, i, a3, (uint64_t)v15))
      {
        +[PVTimelineMarker markerWithOZXTimeMarkerFigTime:](PVTimelineMarker, "markerWithOZXTimeMarkerFigTime:", v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v13);

      }
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)posterFrameMarker
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__56;
  v11 = __Block_byref_object_dispose__57;
  v12 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PVMotionEffectTimelineComponent_posterFrameMarker__block_invoke;
  v6[3] = &unk_1E64D6360;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__PVMotionEffectTimelineComponent_posterFrameMarker__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "posterFrameMarker_NoLock:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)posterFrameMarker_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  PVTimelineMarker *posterFrameMarker;
  void *v8;
  PVTimelineMarker *v9;
  PVTimelineMarker *v10;
  PVTimelineMarker *v11;
  __int128 v12;
  PVTimelineMarker *v13;
  PVTimelineMarker *v14;
  _OWORD v16[3];
  int v17;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  posterFrameMarker = self->_posterFrameMarker;
  if (!posterFrameMarker)
  {
    -[PVMotionEffectTimelineComponent timelineMarkersOfType_NoLock:documentInfo:](self, "timelineMarkersOfType_NoLock:documentInfo:", 8, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (PVTimelineMarker *)objc_claimAutoreleasedReturnValue();
    v10 = self->_posterFrameMarker;
    self->_posterFrameMarker = v9;

    v11 = self->_posterFrameMarker;
    if (!v11 || (-[PVTimelineMarker timeRange](v11, "timeRange"), (v17 & 1) == 0))
    {
      v12 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      v16[0] = *MEMORY[0x1E0CA2E50];
      v16[1] = v12;
      v16[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
      +[PVTimelineMarker markerWithType:timeRange:](PVTimelineMarker, "markerWithType:timeRange:", 8, v16);
      v13 = (PVTimelineMarker *)objc_claimAutoreleasedReturnValue();
      v14 = self->_posterFrameMarker;
      self->_posterFrameMarker = v13;

    }
    posterFrameMarker = self->_posterFrameMarker;
  }
  return posterFrameMarker;
}

- (void)setLoopTimeOverrideEnabled:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PVMotionEffectTimelineComponent_setLoopTimeOverrideEnabled___block_invoke;
  v6[3] = &unk_1E64D6400;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

}

uint64_t __62__PVMotionEffectTimelineComponent_setLoopTimeOverrideEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoopTimeOverrideEnabled_NoLock:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setLoopTimeOverrideEnabled_NoLock:(BOOL)a3
{
  void *v5;
  void *v6;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  self->_loopTimeOverrideEnabled = a3;
}

- (BOOL)loopTimeOverrideEnabled
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PVMotionEffectTimelineComponent_loopTimeOverrideEnabled__block_invoke;
  v5[3] = &unk_1E64D6360;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LOBYTE(v3) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __58__PVMotionEffectTimelineComponent_loopTimeOverrideEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "loopTimeOverrideEnabled_NoLock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)loopTimeOverrideEnabled_NoLock
{
  void *v3;
  void *v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  return self->_loopTimeOverrideEnabled;
}

- (void)setLoopTimeOverride:(id *)a3
{
  void *v5;
  _QWORD v6[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PVMotionEffectTimelineComponent_setLoopTimeOverride___block_invoke;
  v6[3] = &unk_1E64D6428;
  v6[4] = self;
  v7 = *a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

}

uint64_t __55__PVMotionEffectTimelineComponent_setLoopTimeOverride___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v3;
  uint64_t v4;

  v1 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v1, "setLoopTimeOverride_NoLock:", &v3);
}

- (void)setLoopTimeOverride_NoLock:(id *)a3
{
  void *v5;
  void *v6;
  int64_t var3;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  var3 = a3->var3;
  *(_OWORD *)(&self->_loopTimeOverrideEnabled + 4) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_loopTimeOverride.flags = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v7[6];
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v9;
  uint64_t v10;
  __n128 (*v11)(__n128 *, __n128 *);
  uint64_t (*v12)();
  void *v13;

  v8 = 0;
  v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = &unk_1B3948866;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PVMotionEffectTimelineComponent_loopTimeOverride__block_invoke;
  v7[3] = &unk_1E64D6360;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v7);

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __51__PVMotionEffectTimelineComponent_loopTimeOverride__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double result;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "loopTimeOverride_NoLock");
  }
  else
  {
    v5 = 0uLL;
    v6 = 0;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(_QWORD *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride_NoLock
{
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(&self->_loopTimeOverrideEnabled + 4);
  return result;
}

- (void)setUseLocalLoopTime:(BOOL)a3
{
  -[PVMotionEffectTimelineComponent setLoopTimeOverrideEnabled:](self, "setLoopTimeOverrideEnabled:", !a3);
}

- (BOOL)useLocalLoopTime
{
  return !-[PVMotionEffectTimelineComponent loopTimeOverrideEnabled](self, "loopTimeOverrideEnabled");
}

- (void)setForceDisableLoop:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PVMotionEffectTimelineComponent_setForceDisableLoop___block_invoke;
  v6[3] = &unk_1E64D6400;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

}

uint64_t __55__PVMotionEffectTimelineComponent_setForceDisableLoop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setForceDisableLoop_NoLock:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setForceDisableLoop_NoLock:(BOOL)a3
{
  void *v5;
  void *v6;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  METimeRemap::setForceDisableLoop(&self->_timeRemap, a3);
}

- (BOOL)forceDisableLoop
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PVMotionEffectTimelineComponent_forceDisableLoop__block_invoke;
  v5[3] = &unk_1E64D6360;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LOBYTE(v3) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __51__PVMotionEffectTimelineComponent_forceDisableLoop__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "forceDisableLoop_NoLock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)forceDisableLoop_NoLock
{
  void *v3;
  void *v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  return METimeRemap::forceDisableLoop(&self->_timeRemap);
}

- (void)setForceDisableBuildAnimation:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PVMotionEffectTimelineComponent_setForceDisableBuildAnimation___block_invoke;
  v6[3] = &unk_1E64D6400;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

}

uint64_t __65__PVMotionEffectTimelineComponent_setForceDisableBuildAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setForceDisableBuildAnimation_NoLock:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setForceDisableBuildAnimation_NoLock:(BOOL)a3
{
  void *v5;
  void *v6;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  METimeRemap::setForceDisableBuildAnimation(&self->_timeRemap, a3);
}

- (BOOL)forceDisableBuildAnimation
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PVMotionEffectTimelineComponent_forceDisableBuildAnimation__block_invoke;
  v5[3] = &unk_1E64D6360;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LOBYTE(v3) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __61__PVMotionEffectTimelineComponent_forceDisableBuildAnimation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "forceDisableBuildAnimation_NoLock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)forceDisableBuildAnimation_NoLock
{
  void *v3;
  void *v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  return METimeRemap::forceDisableBuildAnimation(&self->_timeRemap);
}

- (BOOL)isForceRenderAtPosterFrameEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inspectablePropertyForKey:", CFSTR("RenderAtPosterTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isForceRenderAtPosterFrameEnabled:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RenderAtPosterTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  _OWORD v14[3];
  __int128 v15;
  int64_t var3;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentStatusIsLoadedOrReady");

  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "effectRange");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
  }

  v12 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v14[0] = v17;
  v14[1] = v18;
  v14[2] = v19;
  v15 = v12;
  return -[PVMotionEffectTimelineComponent componentTimeFromTimelineTime_NoLock:editRange:documentInfo:](self, "componentTimeFromTimelineTime_NoLock:editRange:documentInfo:", &v15, v14, a5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  CMTime rhs;
  CMTime lhs;
  CMTime v22;
  CMTimeRange range;
  CMTimeRange range2;
  CMTimeRange range1;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect", a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDocumentStatusIsLoadedOrReady");

  v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range1.start.epoch = v12;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a5->var1.var1;
  v13 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&range2.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&range2.start.epoch = v13;
  *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  if (CMTimeRangeEqual(&range1, &range2))
  {
    v14 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v14;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    v15 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "debugDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WARNING: invalid effect edit range! %@ (%p, %@)"), v15, v16, v18);

  }
  memset(&v22, 0, sizeof(v22));
  METimeRemap::componentTimeFromMotionTime(&self->_timeRemap, (const CMTime *)a4, (const CMTimeRange *)a5, (uint64_t)&v22);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  lhs = v22;
  rhs = (CMTime)self->_renderStartOffset;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract((CMTime *)retstr, &lhs, &rhs);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  _OWORD v14[3];
  __int128 v15;
  int64_t var3;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentStatusIsLoadedOrReady");

  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "effectRange");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
  }

  v12 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v14[0] = v17;
  v14[1] = v18;
  v14[2] = v19;
  v15 = v12;
  return -[PVMotionEffectTimelineComponent timelineTimeFromComponentTime_NoLock:editRange:documentInfo:](self, "timelineTimeFromComponentTime_NoLock:editRange:documentInfo:", &v15, v14, a5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  CMTime *v26;
  CMTime *p_renderStartOffset;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTimeEpoch epoch;
  $95D729B680665BEAEFA1D6FCA8238556 *p_loopTime;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime rhs;
  CMTime lhs;
  CMTime renderStartOffset;
  CMTime var0;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  __int128 v42;
  int64_t v43;
  __int128 v44;
  int64_t v45;
  __int128 v46;
  int64_t var3;
  CMTimeRange range;
  CMTimeRange range2;
  CMTimeRange range1;
  CMTime v51;
  CMTime v52;
  __int128 v53;
  CMTime v54;
  CMTime v55;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect", a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDocumentStatusIsLoadedOrReady");

  v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range1.start.epoch = v12;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a5->var1.var1;
  v13 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&range2.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&range2.start.epoch = v13;
  *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  if (CMTimeRangeEqual(&range1, &range2))
  {
    v14 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v14;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    v15 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "debugDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WARNING: invalid effect edit range! %@ (%p, %@)"), v15, v16, v18);

  }
  v19 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  retstr->var3 = *(_QWORD *)(v19 + 16);
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isTranscription");

  if (!v21)
  {
    memset(&v55, 0, sizeof(v55));
    lhs = (CMTime)*a4;
    rhs = (CMTime)self->_renderStartOffset;
    CMTimeAdd(&v55, &lhs, &rhs);
    METimeRemap::motionTimeFromComponentTime(&self->_timeRemap, &v55, (const CMTimeRange *)a5, 0, (uint64_t)&v54);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v54.value;
    epoch = v54.epoch;
    goto LABEL_14;
  }
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isPreview");

  if (!v23)
  {
    v39 = (CMTime)*a4;
    var0 = (CMTime)a5->var0;
    CMTimeSubtract(&v40, &v39, &var0);
    renderStartOffset = (CMTime)self->_renderStartOffset;
    v26 = &v40;
    p_renderStartOffset = &renderStartOffset;
    goto LABEL_9;
  }
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isRecording");

  if (v25)
  {
    v46 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v44 = *(_OWORD *)&self->_renderStartOffset.value;
    v45 = self->_renderStartOffset.epoch;
    v26 = (CMTime *)&v46;
    p_renderStartOffset = (CMTime *)&v44;
LABEL_9:
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&v55, v26, p_renderStartOffset);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v55.value;
    epoch = v55.epoch;
    goto LABEL_14;
  }
  if (!self->_loopTimeOverrideEnabled
    || (p_loopTime = ($95D729B680665BEAEFA1D6FCA8238556 *)(&self->_loopTimeOverrideEnabled + 4),
        (self->_loopTimeOverride.timescale & 1) == 0))
  {
    p_loopTime = &self->_loopTime;
  }
  v42 = *(_OWORD *)&p_loopTime->value;
  v43 = p_loopTime->epoch;
  memset(&v41, 0, sizeof(v41));
  operator/((__int128 *)&a4->var0, (uint64_t)&v42, (uint64_t)&v41);
  CMTimeMake(&v51, 1, 1);
  v55 = v41;
  v54 = v51;
  PC_CMTimeFloorToSampleDuration(&v55, &v54, (uint64_t)&v52);
  v55 = v41;
  v54 = v52;
  PC_CMTimeSaferSubtract(&v55, &v54, (uint64_t)&v53);
  operator*(&v53, (uint64_t)&v42, (uint64_t)&v55);
  epoch = v55.epoch;
  v41 = v55;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v55.value;
LABEL_14:
  retstr->var3 = epoch;
  if ((retstr->var2 & 1) == 0)
  {
    v33 = (CMTime)*a4;
    v32 = (CMTime)a5->var0;
    CMTimeSubtract(&v34, &v33, &v32);
    v31 = (CMTime)self->_renderStartOffset;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&v55, &v34, &v31);
    *(CMTime *)retstr = v55;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 forcePosterFrame:(id *)a4 documentInfo:(BOOL)a5
{
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  _OWORD v16[3];
  __int128 v17;
  int64_t var3;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v7 = a5;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDocumentStatusIsLoadedOrReady");

  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "effectRange");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
  }

  v14 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v16[0] = v19;
  v16[1] = v20;
  v16[2] = v21;
  v17 = v14;
  return -[PVMotionEffectTimelineComponent timelineTimeFromComponentTime_NoLock:editRange:forcePosterFrame:documentInfo:](self, "timelineTimeFromComponentTime_NoLock:editRange:forcePosterFrame:documentInfo:", &v17, v16, v7, a6);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 editRange:(id *)a4 forcePosterFrame:(id *)a5 documentInfo:(BOOL)a6
{
  _BOOL4 v8;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];
  __int128 v21;
  int64_t var3;
  __int128 v23;
  int64_t v24;

  v8 = a6;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assertDocumentStatusIsLoadedOrReady");

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (!v8)
    goto LABEL_5;
  -[PVMotionEffectTimelineComponent posterFrameMarker_NoLock:](self, "posterFrameMarker_NoLock:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "timeRange");
    *(_OWORD *)&retstr->var0 = v23;
    retstr->var3 = v24;
  }

  if ((retstr->var2 & 1) == 0)
  {
LABEL_5:
    v18 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v19 = *(_OWORD *)&a5->var0.var3;
    v20[0] = *(_OWORD *)&a5->var0.var0;
    v20[1] = v19;
    v20[2] = *(_OWORD *)&a5->var1.var1;
    v21 = v18;
    result = -[PVMotionEffectTimelineComponent timelineTimeFromComponentTime_NoLock:editRange:documentInfo:](self, "timelineTimeFromComponentTime_NoLock:editRange:documentInfo:", &v21, v20, a7);
    *(_OWORD *)&retstr->var0 = v23;
    retstr->var3 = v24;
  }
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  _OWORD v14[3];
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentStatusIsLoadedOrReady");

  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "effectRange");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }

  v12 = *(_OWORD *)&a4->var0.var3;
  v15[0] = *(_OWORD *)&a4->var0.var0;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a4->var1.var1;
  v14[0] = v16;
  v14[1] = v17;
  v14[2] = v18;
  return -[PVMotionEffectTimelineComponent componentTimeRangeFromTimelineTimeRange_NoLock:editRange:documentInfo:](self, "componentTimeRangeFromTimelineTimeRange_NoLock:editRange:documentInfo:", v15, v14, a5);
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v18;
  CMTime v19;
  _OWORD v20[3];
  _OWORD v21[3];
  _BYTE v22[48];
  _OWORD v23[3];
  __int128 v24;
  int64_t var3;
  CMTime v26;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assertDocumentStatusIsLoadedOrReady");

  memset(&v26, 0, sizeof(v26));
  v13 = *(_OWORD *)&a4->var0.var0;
  var3 = a4->var0.var3;
  v14 = *(_OWORD *)&a5->var0.var3;
  v23[0] = *(_OWORD *)&a5->var0.var0;
  v23[1] = v14;
  v23[2] = *(_OWORD *)&a5->var1.var1;
  v24 = v13;
  -[PVMotionEffectTimelineComponent componentTimeFromTimelineTime_NoLock:editRange:documentInfo:](self, "componentTimeFromTimelineTime_NoLock:editRange:documentInfo:", &v24, v23, a6);
  memset(&v22[24], 0, 24);
  v15 = *(_OWORD *)&a4->var0.var3;
  v21[0] = *(_OWORD *)&a4->var0.var0;
  v21[1] = v15;
  v21[2] = *(_OWORD *)&a4->var1.var1;
  PC_CMTimeRangeEnd((uint64_t)v21, (uint64_t)v22);
  v16 = *(_OWORD *)&a5->var0.var3;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v16;
  v20[2] = *(_OWORD *)&a5->var1.var1;
  -[PVMotionEffectTimelineComponent componentTimeFromTimelineTime_NoLock:editRange:documentInfo:](self, "componentTimeFromTimelineTime_NoLock:editRange:documentInfo:", v22, v20, a6);
  v19 = v26;
  v18 = *(CMTime *)&v22[24];
  return ($202A6A048D39AE170264FF71A65A9479 *)PC_CMTimeRangeMakeWithStartEnd(&v19, &v18, (uint64_t)retstr);
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  _OWORD v14[3];
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentStatusIsLoadedOrReady");

  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "effectRange");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }

  v12 = *(_OWORD *)&a4->var0.var3;
  v15[0] = *(_OWORD *)&a4->var0.var0;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a4->var1.var1;
  v14[0] = v16;
  v14[1] = v17;
  v14[2] = v18;
  return -[PVMotionEffectTimelineComponent timelineTimeRangeFromComponentTimeRange_NoLock:editRange:documentInfo:](self, "timelineTimeRangeFromComponentTimeRange_NoLock:editRange:documentInfo:", v15, v14, a5);
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v18;
  CMTime v19;
  _OWORD v20[3];
  _OWORD v21[3];
  _BYTE v22[48];
  _OWORD v23[3];
  __int128 v24;
  int64_t var3;
  CMTime v26;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assertDocumentStatusIsLoadedOrReady");

  memset(&v26, 0, sizeof(v26));
  v13 = *(_OWORD *)&a4->var0.var0;
  var3 = a4->var0.var3;
  v14 = *(_OWORD *)&a5->var0.var3;
  v23[0] = *(_OWORD *)&a5->var0.var0;
  v23[1] = v14;
  v23[2] = *(_OWORD *)&a5->var1.var1;
  v24 = v13;
  -[PVMotionEffectTimelineComponent componentTimeFromTimelineTime_NoLock:editRange:documentInfo:](self, "componentTimeFromTimelineTime_NoLock:editRange:documentInfo:", &v24, v23, a6);
  memset(&v22[24], 0, 24);
  v15 = *(_OWORD *)&a4->var0.var3;
  v21[0] = *(_OWORD *)&a4->var0.var0;
  v21[1] = v15;
  v21[2] = *(_OWORD *)&a4->var1.var1;
  PC_CMTimeRangeEnd((uint64_t)v21, (uint64_t)v22);
  v16 = *(_OWORD *)&a5->var0.var3;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v16;
  v20[2] = *(_OWORD *)&a5->var1.var1;
  -[PVMotionEffectTimelineComponent componentTimeFromTimelineTime_NoLock:editRange:documentInfo:](self, "componentTimeFromTimelineTime_NoLock:editRange:documentInfo:", v22, v20, a6);
  v19 = v26;
  v18 = *(CMTime *)&v22[24];
  return ($202A6A048D39AE170264FF71A65A9479 *)PC_CMTimeRangeMakeWithStartEnd(&v19, &v18, (uint64_t)retstr);
}

- (void)updateSceneDuration_NoLock:(const void *)a3
{
  void *v5;
  void *v6;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  if (self->_needsToUpdateSceneDuration)
  {
    OZXGetSceneDuration(*(_QWORD *)a3, &self->_numFrames, &self->_frameRate, (__n128 *)&self->_frameDuration);
    self->_needsToUpdateSceneDuration = 0;
    -[PVMotionEffectTimelineComponent computeIntroOutroPoints_NoLock:](self, "computeIntroOutroPoints_NoLock:", a3);
  }
}

- (void)computeIntroOutroPoints_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t Description;
  CMTimeEpoch v13;
  const PCString *v14;
  uint64_t v15;
  CMTimeEpoch v16;
  CMTime v17;
  CMTime v18;
  int v19;
  CMTime v20;
  CMTime v21;
  CMTime v22[2];

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  memset(&v20, 0, sizeof(v20));
  -[PVMotionEffectTimelineComponent timelineDuration_NoLock](self, "timelineDuration_NoLock");
  v7 = OZXMarkerCount(*(_QWORD *)a3);
  if (!v7)
  {
    METimeRemap::setIntroDuration(&self->_timeRemap, MEMORY[0x1E0CA2E68]);
LABEL_18:
    METimeRemap::setOutroDuration(&self->_timeRemap, MEMORY[0x1E0CA2E68]);
    goto LABEL_19;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = 1;
  do
  {
    OZXGetMarkerFigTime(*(_QWORD *)a3, v11 - 1, (uint64_t)&v18);
    if ((v10 & 1) != 0 || (v19 - 3) > 1)
    {
      if ((v9 & 1) == 0)
      {
        if ((v19 - 5) > 2)
        {
          v9 = 0;
          goto LABEL_11;
        }
        v22[0] = v20;
        v21 = v18;
        PC_CMTimeSaferSubtract(v22, &v21, (uint64_t)&v17);
        METimeRemap::setOutroDuration(&self->_timeRemap, &v17);
        METimeRemap::setIsLoop(&self->_timeRemap, v19 == 7);
        METimeRemap::setIsOutroOptional(&self->_timeRemap, v19 == 6);
        self->_loopTime = ($95D729B680665BEAEFA1D6FCA8238556)v18;
      }
      v9 = 1;
    }
    else
    {
      METimeRemap::setIntroDuration(&self->_timeRemap, &v18);
      LiGrid::setGroundPlane((uint64_t)&self->_timeRemap, v19 == 4);
      v10 = 1;
    }
LABEL_11:
    if (v11 >= v8)
      break;
    ++v11;
  }
  while ((v10 & v9 & 1) == 0);
  if ((v10 & 1) == 0)
    METimeRemap::setIntroDuration(&self->_timeRemap, MEMORY[0x1E0CA2E68]);
  if ((v9 & 1) == 0)
    goto LABEL_18;
LABEL_19:
  Description = ProGL::Private::TextureImpl::getDescription((ProGL::Private::TextureImpl *)&self->_timeRemap);
  v18 = v20;
  v13 = *(_QWORD *)(Description + 16);
  *(_OWORD *)&v22[0].value = *(_OWORD *)Description;
  v22[0].epoch = v13;
  PC_CMTimeSaferSubtract(&v18, v22, (uint64_t)&v17);
  v15 = OZChannelBase::setRangeName((OZChannelBase *)&self->_timeRemap, v14);
  v18 = v17;
  v16 = *(_QWORD *)(v15 + 16);
  *(_OWORD *)&v22[0].value = *(_OWORD *)v15;
  v22[0].epoch = v16;
  PC_CMTimeSaferSubtract(&v18, v22, (uint64_t)&v21);
  METimeRemap::setScaleableDuration(&self->_timeRemap, &v21);
  METimeRemap::setBuildEnableChannels(&self->_timeRemap, self->_buildInEnableChan, self->_buildOutEnableChan);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)introDuration_NoLock
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)OZChannelBase::setRangeName((OZChannelBase *)&self->_timeRemap, (const PCString *)a3);
  *retstr = *result;
  return result;
}

- (void)setNeedsToUpdateSceneDuration_NoLock
{
  void *v3;
  void *v4;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentStatusIsLoadedOrReady");

  self->_needsToUpdateSceneDuration = 1;
}

- (void)setRenderStartOffset_NoLock:(id *)a3
{
  void *v5;
  void *v6;
  int64_t var3;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  var3 = a3->var3;
  *(_OWORD *)&self->_renderStartOffset.value = *(_OWORD *)&a3->var0;
  self->_renderStartOffset.epoch = var3;
}

- (void)setBuildInEnabled_NoLock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  (*((void (**)(OZChannelBool *, _QWORD, _QWORD, double))self->_buildInEnableChan->var0 + 89))(self->_buildInEnableChan, MEMORY[0x1E0CA2E68], 0, (double)v3);
}

- (void)setBuildOutEnabled_NoLock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  (*((void (**)(OZChannelBool *, _QWORD, _QWORD, double))self->_buildOutEnableChan->var0 + 89))(self->_buildOutEnableChan, MEMORY[0x1E0CA2E68], 0, (double)v3);
}

- (void)applyProperties_NoLock:(id)a3 defaultProperties:(id)a4 documentInfo:(const void *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE v23[24];

  v7 = a3;
  v8 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentStatusIsLoadedOrReady");

  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("RenderStartOffset"), v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "CMTimeValue");
    -[PVMotionEffectTimelineComponent setRenderStartOffset_NoLock:](self, "setRenderStartOffset_NoLock:", v23);
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("RenderAtPosterTime"), v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didSetCacheInvalidatingParameter_NoLock:forKey:", v13, CFSTR("RenderAtPosterTime"));

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("TitleBuildIn"), v7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    -[PVMotionEffectTimelineComponent setBuildInEnabled_NoLock:](self, "setBuildInEnabled_NoLock:", objc_msgSend(v15, "BOOLValue"));
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("TitleBuildOut"), v7, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    -[PVMotionEffectTimelineComponent setBuildOutEnabled_NoLock:](self, "setBuildOutEnabled_NoLock:", objc_msgSend(v17, "BOOLValue"));
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("ForceDisableLoop"), v7, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    -[PVMotionEffectTimelineComponent setForceDisableLoop_NoLock:](self, "setForceDisableLoop_NoLock:", objc_msgSend(v19, "BOOLValue"));
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("ForceDisableBuildAnimation"), v7, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    -[PVMotionEffectTimelineComponent setForceDisableBuildAnimation_NoLock:](self, "setForceDisableBuildAnimation_NoLock:", objc_msgSend(v21, "BOOLValue"));

}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTimelineComponent;
  -[PVMotionEffectComponent motionEffect:didBecomeReady:properties:](&v10, sel_motionEffect_didBecomeReady_properties_, v8, a4, v9);
  -[PVMotionEffectTimelineComponent updateSceneDuration_NoLock:](self, "updateSceneDuration_NoLock:", a4);
  -[PVMotionEffectTimelineComponent applyProperties_NoLock:defaultProperties:documentInfo:](self, "applyProperties_NoLock:defaultProperties:documentInfo:", 0, v9, a4);

}

- (void)motionEffectDidUnload:(id)a3
{
  id v4;
  __int128 *v5;
  __int128 v6;
  PVTimelineMarker *posterFrameMarker;
  __int128 v8;
  __int128 v9;
  OZChannelBool *buildInEnableChan;
  OZChannelBool *buildOutEnableChan;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PVMotionEffectTimelineComponent;
  -[PVMotionEffectComponent motionEffectDidUnload:](&v12, sel_motionEffectDidUnload_, v4);
  self->_numFrames = 0;
  self->_frameRate = 0.0;
  v5 = (__int128 *)MEMORY[0x1E0CA2E68];
  v6 = *MEMORY[0x1E0CA2E68];
  self->_frameDuration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)&self->_frameDuration.value = v6;
  posterFrameMarker = self->_posterFrameMarker;
  self->_posterFrameMarker = 0;

  v8 = *v5;
  self->_renderStartOffset.epoch = *((_QWORD *)v5 + 2);
  *(_OWORD *)&self->_renderStartOffset.value = v8;
  v9 = *MEMORY[0x1E0CA2E18];
  self->_loopTime.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_OWORD *)&self->_loopTime.value = v9;
  buildInEnableChan = self->_buildInEnableChan;
  if (buildInEnableChan)
    (*((void (**)(OZChannelBool *, _QWORD, _QWORD, double))buildInEnableChan->var0 + 89))(buildInEnableChan, MEMORY[0x1E0CA2E68], 0, 0.0);
  buildOutEnableChan = self->_buildOutEnableChan;
  if (buildOutEnableChan)
    (*((void (**)(OZChannelBool *, _QWORD, _QWORD, double))buildOutEnableChan->var0 + 89))(buildOutEnableChan, MEMORY[0x1E0CA2E68], 0, 0.0);
  self->_needsToUpdateSceneDuration = 1;

}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTimelineComponent;
  -[PVMotionEffectComponent effect:updateProperties:allProperties:](&v17, sel_effect_updateProperties_allProperties_, v8, v9, v10);
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PVMotionEffectTimelineComponent_effect_updateProperties_allProperties___block_invoke;
  v14[3] = &unk_1E64D4E50;
  v14[4] = self;
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "runWithDocument_NoLock:", v14);

}

uint64_t __73__PVMotionEffectTimelineComponent_effect_updateProperties_allProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyProperties_NoLock:defaultProperties:documentInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  objc_super v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a5;
  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffectTimelineComponent;
  return -[PVMotionEffectComponent motionEffect:propertiesDisableCache:time:forcePosterFrame:](&v7, sel_motionEffect_propertiesDisableCache_time_forcePosterFrame_, a3, a4, &v8)|| !a6;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTimelineComponent;
  -[PVMotionEffectComponent motionEffectPropertyKeysThatInvalidateCachedRender:](&v10, sel_motionEffectPropertyKeysThatInvalidateCachedRender_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E20];
  v11[0] = CFSTR("RenderAtPosterTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v7 == 0;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  return v6;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PVMotionEffectTimelineComponent;
  if (-[PVMotionEffectComponent motionEffect:shouldInvalidateCachedRenderForProperty:oldValue:newValue:](&v16, sel_motionEffect_shouldInvalidateCachedRenderForProperty_oldValue_newValue_, v10, v11, v12, v13))
  {
    LOBYTE(v14) = 1;
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RenderAtPosterTime")))
  {
    v14 = PVNumbersAreEqualAsBooleans(v12, v13) ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterFrameMarker, 0);
}

- (id).cxx_construct
{
  METimeRemap::METimeRemap(&self->_timeRemap);
  return self;
}

@end
