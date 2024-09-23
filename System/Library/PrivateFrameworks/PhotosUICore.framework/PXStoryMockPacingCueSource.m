@implementation PXStoryMockPacingCueSource

- (PXStoryMockPacingCueSource)initWithCueTimes:(id)a3
{
  id v4;
  PXStoryMockPacingCueSource *v5;
  uint64_t v6;
  NSArray *cueTimes;
  uint64_t v8;
  PXConcreteAudioCueSource *v9;
  uint64_t v10;
  uint64_t v11;
  PXAudioCueSource *audioCueSource;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryMockPacingCueSource;
  v5 = -[PXStoryMockPacingCueSource init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cueTimes = v5->_cueTimes;
    v5->_cueTimes = (NSArray *)v6;

    v8 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&v5->_currentTime.value = *MEMORY[0x1E0CA2E68];
    v5->_currentTime.epoch = *(_QWORD *)(v8 + 16);
    v9 = [PXConcreteAudioCueSource alloc];
    v10 = objc_msgSend(v4, "count");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__PXStoryMockPacingCueSource_initWithCueTimes___block_invoke;
    v14[3] = &unk_1E51191F0;
    v15 = v4;
    v11 = -[PXConcreteAudioCueSource initWithNumberOfCues:configuration:](v9, "initWithNumberOfCues:configuration:", v10, v14);
    audioCueSource = v5->_audioCueSource;
    v5->_audioCueSource = (PXAudioCueSource *)v11;

  }
  return v5;
}

- (PXStoryMockPacingCueSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMockPacingCueSource.m"), 35, CFSTR("%s is not available as initializer"), "-[PXStoryMockPacingCueSource init]");

  abort();
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  return CFSTR("Mock");
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5
{
  return CFSTR("Mock");
}

- (PXAudioCueSource)audioCueSource
{
  return self->_audioCueSource;
}

- (NSArray)cueTimes
{
  return self->_cueTimes;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setCurrentTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = a3->var3;
  *(_OWORD *)&self->_currentTime.value = v3;
}

- (int64_t)cuesVersion
{
  return self->_cuesVersion;
}

- (void)setCuesVersion:(int64_t)a3
{
  self->_cuesVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cueTimes, 0);
  objc_storeStrong((id *)&self->_audioCueSource, 0);
}

unint64_t __47__PXStoryMockPacingCueSource_initWithCueTimes___block_invoke(uint64_t a1, CMTime *a2)
{
  unint64_t result;
  unint64_t i;
  void *v6;
  Float64 v7;
  CMTime v8;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      CMTimeMakeWithSeconds(&v8, v7, 600);
      *a2 = v8;

      a2[1].value = 3;
      result = objc_msgSend(*(id *)(a1 + 32), "count");
      a2 = (CMTime *)((char *)a2 + 32);
    }
  }
  return result;
}

@end
