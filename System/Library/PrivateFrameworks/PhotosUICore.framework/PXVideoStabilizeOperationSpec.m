@implementation PXVideoStabilizeOperationSpec

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int64_t epoch;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXVideoStabilizeOperationSpec;
  v4 = -[PXVideoProcessingOperationSpec copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_storeStrong((id *)v4 + 5, self->_recipeSource);
  v5 = *(_OWORD *)&self->_startTime.value;
  *((_QWORD *)v4 + 8) = self->_startTime.epoch;
  *((_OWORD *)v4 + 3) = v5;
  v6 = *(_OWORD *)&self->_timeRange.start.value;
  v7 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *((_OWORD *)v4 + 7) = *(_OWORD *)&self->_timeRange.start.epoch;
  *((_OWORD *)v4 + 8) = v7;
  *((_OWORD *)v4 + 6) = v6;
  epoch = self->_crossfadeDuration.epoch;
  *(_OWORD *)(v4 + 72) = *(_OWORD *)&self->_crossfadeDuration.value;
  *((_QWORD *)v4 + 11) = epoch;
  v4[32] = self->_performStabilization;
  v4[33] = self->_abortIfStabilizationFails;
  v4[34] = self->_wantsAudio;
  return v4;
}

- (PXVideoStabilizationRecipeSource)recipeSource
{
  return self->_recipeSource;
}

- (void)setRecipeSource:(id)a3
{
  objc_storeStrong((id *)&self->_recipeSource, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setCrossfadeDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_crossfadeDuration.value = *(_OWORD *)&a3->var0;
  self->_crossfadeDuration.epoch = var3;
}

- (BOOL)performStabilization
{
  return self->_performStabilization;
}

- (void)setPerformStabilization:(BOOL)a3
{
  self->_performStabilization = a3;
}

- (BOOL)abortIfStabilizationFails
{
  return self->_abortIfStabilizationFails;
}

- (void)setAbortIfStabilizationFails:(BOOL)a3
{
  self->_abortIfStabilizationFails = a3;
}

- (BOOL)wantsAudio
{
  return self->_wantsAudio;
}

- (void)setWantsAudio:(BOOL)a3
{
  self->_wantsAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeSource, 0);
}

@end
