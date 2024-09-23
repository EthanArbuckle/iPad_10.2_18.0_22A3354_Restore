@implementation PXStoryMockAutoEditDecisionList

- (PXStoryMockAutoEditDecisionList)init
{
  return -[PXStoryMockAutoEditDecisionList initWithSong:](self, "initWithSong:", 0);
}

- (PXStoryMockAutoEditDecisionList)initWithSong:(id)a3
{
  id v5;
  PXStoryMockAutoEditDecisionList *v6;
  PXStoryMockAutoEditDecisionList *v7;
  uint64_t v8;
  NSString *colorGradeCategory;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  CMTime v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryMockAutoEditDecisionList;
  v6 = -[PXStoryMockAutoEditDecisionList init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numberOfClips = 0;
    objc_msgSend(v5, "colorGradeCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    colorGradeCategory = v7->_colorGradeCategory;
    v7->_colorGradeCategory = (NSString *)v8;

    objc_storeStrong((id *)&v7->_song, a3);
    CMTimeMakeWithSeconds(&v14, 2.0, 600);
    v7->_defaultDisplayAssetPresentationDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
    v7->_allowsNUp = 0;
    v7->_overallDurationInfo.kind = 4;
    v10 = MEMORY[0x1E0D759A0];
    v11 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 48);
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.preferredDuration.timescale = *(_OWORD *)(MEMORY[0x1E0D759A0] + 32);
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.maximumDuration.value = v11;
    v7->_overallDurationInfo.specificDurationInfo.maximumDuration.epoch = *(_QWORD *)(v10 + 64);
    v12 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.minimumDuration.value = *(_OWORD *)v10;
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.minimumDuration.epoch = v12;
    CMTimeMakeWithSeconds(&v14, 1.5, 600);
    v7->_outroDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
  }

  return v7;
}

- (id)clipForDisplayAsset:(id)a3
{
  return 0;
}

- (id)clipAtIndex:(int64_t)a3
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMockAutoEditDecisionList.m"), 44, CFSTR("Index (%ld) out of range"), a3);

  abort();
}

- (NSString)diagnosticDescription
{
  return (NSString *)CFSTR("PXStoryMockAutoEditDecisionList");
}

- (NSString)decisionPapertrail
{
  return (NSString *)CFSTR("PXStoryMockAutoEditDecisionList papertrail");
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (PXAudioAsset)song
{
  return self->_song;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (BOOL)allowsNUp
{
  return self->_allowsNUp;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)overallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].var1.var0.var3;
  v4 = *(_OWORD *)&self[1].var1.var2.var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var1.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v4;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[1].var1.var2.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1.var0.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  return self;
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
}

@end
