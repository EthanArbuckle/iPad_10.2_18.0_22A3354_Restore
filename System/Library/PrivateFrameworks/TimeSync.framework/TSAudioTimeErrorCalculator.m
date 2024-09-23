@implementation TSAudioTimeErrorCalculator

- (TSAudioTimeErrorCalculator)initWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9
{
  return -[TSAudioTimeErrorCalculator initWithChannelA:andChannelB:ofLength:withInterval:correlationLength:upscaleFactor:atSamplingRate:correlationType:](self, "initWithChannelA:andChannelB:ofLength:withInterval:correlationLength:upscaleFactor:atSamplingRate:correlationType:", a3, a4, a5, a6, a7, a8, a9, 1);
}

- (TSAudioTimeErrorCalculator)initWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9 correlationType:(int64_t)a10
{
  TSAudioTimeErrorCalculator *v17;
  TSAudioTimeErrorCalculator *v18;
  size_t v19;
  double *v20;
  float *channelASamples;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)TSAudioTimeErrorCalculator;
  v17 = -[TSAudioTimeErrorCalculator init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_interval = a6;
    v17->_correlationLength = a7;
    v17->_numberOfSamples = a5;
    v17->_samplingRate = a9;
    v17->_upscaleFactor = a8;
    v17->_correlationType = a10;
    v17->_channelASamples = (const float *)malloc_type_calloc(a5, 4uLL, 0x100004052888210uLL);
    v18->_channelBSamples = (const float *)malloc_type_calloc(v18->_numberOfSamples, 4uLL, 0x100004052888210uLL);
    v19 = (a6 + v18->_numberOfSamples - 1) / a6;
    v18->_maxMeasurements = v19;
    v18->_sampleTimestamps = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v20 = (double *)malloc_type_calloc(v18->_maxMeasurements, 8uLL, 0x100004000313F17uLL);
    v18->_timeErrors = v20;
    channelASamples = (float *)v18->_channelASamples;
    if (channelASamples && v18->_channelBSamples && v18->_sampleTimestamps && v20)
    {
      memcpy(channelASamples, a3, 4 * v18->_numberOfSamples);
      memcpy((void *)v18->_channelBSamples, a4, 4 * v18->_numberOfSamples);
      bzero(v18->_sampleTimestamps, 8 * v18->_maxMeasurements);
      bzero(v18->_timeErrors, 8 * v18->_maxMeasurements);
    }
    else
    {

      return 0;
    }
  }
  return v18;
}

- (id)initNoCopyWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9
{
  return -[TSAudioTimeErrorCalculator initNoCopyWithChannelA:andChannelB:ofLength:withInterval:correlationLength:upscaleFactor:atSamplingRate:correlationType:](self, "initNoCopyWithChannelA:andChannelB:ofLength:withInterval:correlationLength:upscaleFactor:atSamplingRate:correlationType:", a3, a4, a5, a6, a7, a8, a9, 1);
}

- (id)initNoCopyWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9 correlationType:(int64_t)a10
{
  TSAudioTimeErrorCalculator *v17;
  TSAudioTimeErrorCalculator *v18;
  size_t v19;
  double *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TSAudioTimeErrorCalculator;
  v17 = -[TSAudioTimeErrorCalculator init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_noCopy = 1;
    v17->_interval = a6;
    v17->_correlationLength = a7;
    v17->_samplingRate = a9;
    v17->_upscaleFactor = a8;
    v17->_correlationType = a10;
    v17->_channelASamples = a3;
    v17->_channelBSamples = a4;
    v19 = (a5 + a6 - 1) / a6;
    v18->_numberOfSamples = a5;
    v18->_maxMeasurements = v19;
    v18->_sampleTimestamps = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v20 = (double *)malloc_type_calloc(v18->_maxMeasurements, 8uLL, 0x100004000313F17uLL);
    v18->_timeErrors = v20;
    if (v18->_channelASamples && v18->_channelBSamples && v18->_sampleTimestamps && v20)
    {
      bzero(v18->_sampleTimestamps, 8 * v18->_maxMeasurements);
      bzero(v18->_timeErrors, 8 * v18->_maxMeasurements);
    }
    else
    {

      return 0;
    }
  }
  return v18;
}

- (void)_processTimeErrorFromStartOffset:(int64_t)a3 atIndex:(int64_t)a4 withCount:(int64_t)a5
{
  unint64_t correlationType;
  void *v10;
  double (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  int64_t v12;
  id v13;

  correlationType = self->_correlationType;
  if (correlationType > 2)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(*off_1E694B038[correlationType]), "initWithMaxCorrelationLength:andUpscaleFactor:forSamplingRate:", self->_correlationLength, self->_upscaleFactor, self->_samplingRate);
  v13 = v10;
  objc_msgSend(v10, "correlationBlock");
  v11 = (double (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (a5 >= 1)
  {
    v12 = a5 + a4;
    do
    {
      self->_sampleTimestamps[a4] = (double)a3 / self->_samplingRate;
      self->_timeErrors[a4++] = ((double (**)(_QWORD, const float *, const float *, int64_t))v11)[2](v11, &self->_channelASamples[a3], &self->_channelBSamples[a3], self->_correlationLength);
      a3 += self->_interval;
    }
    while (a4 < v12);
  }

}

- (void)calculateTimeError
{
  -[TSAudioTimeErrorCalculator calculateTimeErrorWithThreadingOption:](self, "calculateTimeErrorWithThreadingOption:", 0);
}

- (void)calculateTimeErrorWithThreadingOption:(int64_t)a3
{
  -[TSAudioTimeErrorCalculator calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:](self, "calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:", 0, self->_numberOfSamples - 1, a3);
}

- (void)calculateTimeErrorFromStartOffset:(int64_t)a3 toEndOffset:(int64_t)a4
{
  -[TSAudioTimeErrorCalculator calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:](self, "calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:", a3, a4, 0);
}

- (void)calculateTimeErrorFromStartOffset:(int64_t)a3 toEndOffset:(int64_t)a4 withThreadingOption:(int64_t)a5
{
  uint64_t v9;
  int64_t v10;
  int64_t numberOfSamples;
  int64_t v12;
  uint64_t v13;
  void *v14;
  intptr_t v15;
  dispatch_queue_t v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  dispatch_group_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  TSAudioTimeErrorCalculator *v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  v9 = mach_absolute_time();
  v10 = a3 & ~(a3 >> 63);
  numberOfSamples = self->_numberOfSamples;
  if (numberOfSamples <= a4)
    v12 = numberOfSamples - 1;
  else
    v12 = a4;
  v13 = (v12 - v10 + 1) / self->_interval;
  if (a5 != 1 && (a5 || v13 <= 10000 / self->_upscaleFactor)
    || (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "activeProcessorCount"),
        v14,
        v15 == 1))
  {
    -[TSAudioTimeErrorCalculator _processTimeErrorFromStartOffset:atIndex:withCount:](self, "_processTimeErrorFromStartOffset:atIndex:withCount:", v10, 0, v13);
  }
  else
  {
    v24 = v9;
    v16 = dispatch_queue_create("com.apple.timesync.TSAudioTimeErrorCalculator.parallel", MEMORY[0x1E0C80D50]);
    v17 = dispatch_queue_create("com.apple.timesync.TSAudioTimeErrorCalculator.sequence", 0);
    v18 = dispatch_semaphore_create(v15);
    v19 = dispatch_group_create();
    if (v13 >= 1)
    {
      v20 = 0;
      v21 = v13 / v15;
      do
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        if (v20 + v21 > v13)
          v21 = v13 - v20;
        block[2] = __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke;
        block[3] = &unk_1E694B018;
        v26 = v18;
        v22 = v19;
        v27 = v22;
        v28 = v16;
        v29 = self;
        v30 = v10;
        v31 = v20;
        v32 = v21;
        dispatch_group_async(v22, v17, block);
        v20 += v21;
        v10 += self->_interval * v21;

      }
      while (v20 < v13);
    }
    dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

    v9 = v24;
  }
  v23 = mach_absolute_time();
  self->_calculatedTimeError = 1;
  self->_measurementsInBuffer = v13;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[TSAudioTimeErrorCalculator calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:].cold.1(v23, v9);
}

intptr_t __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(a1 + 40);
  v3 = *(NSObject **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke_2;
  v5[3] = &unk_1E694AFF0;
  v5[4] = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  dispatch_group_async(v2, v3, v5);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processTimeErrorFromStartOffset:atIndex:withCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (NSArray)audioTimeErrors
{
  void *v3;
  int64_t v4;
  TSAudioTimeErrorValue *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_calculatedTimeError)
    -[TSAudioTimeErrorCalculator calculateTimeError](self, "calculateTimeError");
  if (self->_measurementsInBuffer >= 1)
  {
    v4 = 0;
    do
    {
      v5 = -[TSAudioTimeErrorValue initWithSampleTimestamp:andTimeError:]([TSAudioTimeErrorValue alloc], "initWithSampleTimestamp:andTimeError:", self->_sampleTimestamps[v4], self->_timeErrors[v4]);
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < self->_measurementsInBuffer);
  }
  return (NSArray *)v3;
}

- (NSArray)timeErrors
{
  void *v3;
  int64_t v4;
  TSTimeErrorValue *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_calculatedTimeError)
    -[TSAudioTimeErrorCalculator calculateTimeError](self, "calculateTimeError");
  if (self->_measurementsInBuffer >= 1)
  {
    v4 = 0;
    do
    {
      v5 = -[TSTimeErrorValue initWithTimestamp:andError:]([TSTimeErrorValue alloc], "initWithTimestamp:andError:", (unint64_t)(self->_sampleTimestamps[v4] * 1000000000.0), (uint64_t)(self->_timeErrors[v4] * 1000000000.0));
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < self->_measurementsInBuffer);
  }
  return (NSArray *)v3;
}

- (BOOL)exportTimeErrorToDirectoryURL:(id)a3
{
  return -[TSAudioTimeErrorCalculator exportTimeErrorToDirectoryURL:withFilename:](self, "exportTimeErrorToDirectoryURL:withFilename:", a3, CFSTR("time_error.csv"));
}

- (BOOL)exportTimeErrorToDirectoryURL:(id)a3 withFilename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFileURL"))
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[TSAudioTimeErrorCalculator exportTimeErrorToPath:](self, "exportTimeErrorToPath:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)exportTimeErrorToPath:(id)a3
{
  FILE *v4;
  int64_t v5;

  v4 = fopen((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), "w");
  if (v4)
  {
    if (!self->_calculatedTimeError)
      -[TSAudioTimeErrorCalculator calculateTimeError](self, "calculateTimeError");
    fwrite("index,time,time error\n", 0x16uLL, 1uLL, v4);
    if (self->_measurementsInBuffer >= 1)
    {
      v5 = 0;
      do
      {
        fprintf(v4, "%ld,%.9f,%.9f\n", v5, self->_sampleTimestamps[v5], self->_timeErrors[v5]);
        ++v5;
      }
      while (v5 < self->_measurementsInBuffer);
    }
    fclose(v4);
  }
  return v4 != 0;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_noCopy)
  {
    free((void *)self->_channelASamples);
    free((void *)self->_channelBSamples);
  }
  free(self->_sampleTimestamps);
  free(self->_timeErrors);
  v3.receiver = self;
  v3.super_class = (Class)TSAudioTimeErrorCalculator;
  -[TSAudioTimeErrorCalculator dealloc](&v3, sel_dealloc);
}

- (void)calculateTimeErrorFromStartOffset:(uint64_t)a1 toEndOffset:(uint64_t)a2 withThreadingOption:.cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1 - a2;
  v4 = 2048;
  v5 = (double)(unint64_t)(a1 - a2) / 1000000000.0;
  _os_log_debug_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Elapsed time %llu, %f\n", (uint8_t *)&v2, 0x16u);
}

@end
