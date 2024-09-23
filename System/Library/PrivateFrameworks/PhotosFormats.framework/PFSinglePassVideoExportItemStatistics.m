@implementation PFSinglePassVideoExportItemStatistics

- (PFSinglePassVideoExportItemStatistics)init
{
  PFSinglePassVideoExportItemStatistics *v2;
  __uint64_t v3;
  uint64_t v4;
  NSMutableArray *outputChunkMeasurements;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFSinglePassVideoExportItemStatistics;
  v2 = -[PFSinglePassVideoExportItemStatistics init](&v7, sel_init);
  if (v2)
  {
    v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    outputChunkMeasurements = v2->_outputChunkMeasurements;
    v2->_outputChunkMeasurements = (NSMutableArray *)v4;

    v2->_lastOutputChunkTimestamp = v3;
  }
  return v2;
}

- (void)addMeasurementForBytesDelivered:(unint64_t)a3
{
  __uint64_t v5;
  NSMutableArray *outputChunkMeasurements;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  outputChunkMeasurements = self->_outputChunkMeasurements;
  v7 = (double)(v5 - self->_lastOutputChunkTimestamp) / 1000000000.0;
  self->_lastOutputChunkTimestamp = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](outputChunkMeasurements, "addObject:", v10);

  self->_processedOutputTotalBytes += a3;
  self->_conversionDuration = v7 + self->_conversionDuration;
}

- (void)enumerateOutputChunkMeasurementsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *, double);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _BYTE *, double))a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_outputChunkMeasurements;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      v16 = 0;
      v4[2](v4, v15, &v16, v13);
      if (v16)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)processedOutputBytesPerSecond
{
  return vcvtad_u64_f64((double)self->_processedOutputTotalBytes / self->_conversionDuration);
}

- (double)averageOutputChunkTimeInterval
{
  double conversionDuration;

  conversionDuration = self->_conversionDuration;
  return conversionDuration / (double)(unint64_t)-[NSMutableArray count](self->_outputChunkMeasurements, "count");
}

- (unint64_t)averageOutputChunkBytes
{
  unint64_t processedOutputTotalBytes;

  processedOutputTotalBytes = self->_processedOutputTotalBytes;
  return processedOutputTotalBytes / -[NSMutableArray count](self->_outputChunkMeasurements, "count");
}

- (float)processingFramesPerSecond
{
  double conversionDuration;

  conversionDuration = self->_conversionDuration;
  if (conversionDuration == 0.0)
    return NAN;
  else
    return (double)self->_processedOutputFrameCount / conversionDuration;
}

- (int64_t)targetEncodingBitRate
{
  return vcvtd_n_s64_f64((double)self->_targetOutputTotalBytes / self->_targetPlaybackDuration, 3uLL);
}

- (int64_t)effectiveEncodingBitRate
{
  int64_t processedOutputFrameCount;

  processedOutputFrameCount = self->_processedOutputFrameCount;
  if (processedOutputFrameCount)
    return vcvtd_n_u64_f64(roundf((float)self->_processedVideoSampleBytes / (float)((float)processedOutputFrameCount / self->_frameRate)), 3uLL);
  else
    return 0;
}

- (id)outputChunkMeasurementsDescription
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD v11[4];

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Sample Time\tTotal Bytes\tSample Bytes\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PFSinglePassVideoExportItemStatistics_outputChunkMeasurementsDescription__block_invoke;
  v6[3] = &unk_1E45A4348;
  v8 = v11;
  v9 = v10;
  v4 = v3;
  v7 = v4;
  -[PFSinglePassVideoExportItemStatistics enumerateOutputChunkMeasurementsWithHandler:](self, "enumerateOutputChunkMeasurementsWithHandler:", v6);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  return v4;
}

- (id)summaryDescription
{
  void *v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  float v9;
  double v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PFSinglePassVideoExportItemStatistics processedOutputTotalBytes](self, "processedOutputTotalBytes");
  v5 = (float)((float)-[PFSinglePassVideoExportItemStatistics processedOutputTotalBytes](self, "processedOutputTotalBytes")* 0.00000095367);
  -[PFSinglePassVideoExportItemStatistics conversionDuration](self, "conversionDuration");
  v7 = v6;
  v8 = (float)((float)-[PFSinglePassVideoExportItemStatistics processedOutputBytesPerSecond](self, "processedOutputBytesPerSecond")* 0.00000095367);
  -[PFSinglePassVideoExportItemStatistics processingFramesPerSecond](self, "processingFramesPerSecond");
  v10 = v9;
  -[PFSinglePassVideoExportItemStatistics averageOutputChunkTimeInterval](self, "averageOutputChunkTimeInterval");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Exported %lu bytes (%.2fMB) in %.1fs (%.2fMB/s), %.2fps, average output interval = %.2fs, average output size = %.2fKB"), v4, *(_QWORD *)&v5, v7, *(_QWORD *)&v8, *(_QWORD *)&v10, v11, (float)((float)-[PFSinglePassVideoExportItemStatistics averageOutputChunkBytes](self, "averageOutputChunkBytes")* 0.00097656));
}

- (unint64_t)lastOutputChunkTimestamp
{
  return self->_lastOutputChunkTimestamp;
}

- (void)setLastOutputChunkTimestamp:(unint64_t)a3
{
  self->_lastOutputChunkTimestamp = a3;
}

- (NSMutableArray)outputChunkMeasurements
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputChunkMeasurements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)processedOutputTotalBytes
{
  return self->_processedOutputTotalBytes;
}

- (void)setProcessedOutputTotalBytes:(unint64_t)a3
{
  self->_processedOutputTotalBytes = a3;
}

- (unint64_t)processedVideoSampleBytes
{
  return self->_processedVideoSampleBytes;
}

- (void)setProcessedVideoSampleBytes:(unint64_t)a3
{
  self->_processedVideoSampleBytes = a3;
}

- (unint64_t)processedAdditionalSampleBytes
{
  return self->_processedAdditionalSampleBytes;
}

- (void)setProcessedAdditionalSampleBytes:(unint64_t)a3
{
  self->_processedAdditionalSampleBytes = a3;
}

- (double)conversionDuration
{
  return self->_conversionDuration;
}

- (void)setConversionDuration:(double)a3
{
  self->_conversionDuration = a3;
}

- (double)lastProcessedInputFramePresentationTime
{
  return self->_lastProcessedInputFramePresentationTime;
}

- (void)setLastProcessedInputFramePresentationTime:(double)a3
{
  self->_lastProcessedInputFramePresentationTime = a3;
}

- (int64_t)processedOutputFrameCount
{
  return self->_processedOutputFrameCount;
}

- (void)setProcessedOutputFrameCount:(int64_t)a3
{
  self->_processedOutputFrameCount = a3;
}

- (unint64_t)targetOutputTotalBytes
{
  return self->_targetOutputTotalBytes;
}

- (void)setTargetOutputTotalBytes:(unint64_t)a3
{
  self->_targetOutputTotalBytes = a3;
}

- (double)targetPlaybackDuration
{
  return self->_targetPlaybackDuration;
}

- (void)setTargetPlaybackDuration:(double)a3
{
  self->_targetPlaybackDuration = a3;
}

- (float)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(float)a3
{
  self->_frameRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputChunkMeasurements, 0);
}

uint64_t __75__PFSinglePassVideoExportItemStatistics_outputChunkMeasurementsDescription__block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a2;
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%f\t%lu\t%lu\n"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a2);
}

+ (id)statisticsWithTargetPlaybackDuration:(id *)a3 frameRate:(float)a4 targetOutputTotalBytes:(unint64_t)a5
{
  void *v8;
  double v9;
  CMTime v11;

  v8 = (void *)objc_opt_new();
  v11 = *(CMTime *)a3;
  objc_msgSend(v8, "setTargetPlaybackDuration:", CMTimeGetSeconds(&v11));
  *(float *)&v9 = a4;
  objc_msgSend(v8, "setFrameRate:", v9);
  objc_msgSend(v8, "setTargetOutputTotalBytes:", a5);
  return v8;
}

@end
