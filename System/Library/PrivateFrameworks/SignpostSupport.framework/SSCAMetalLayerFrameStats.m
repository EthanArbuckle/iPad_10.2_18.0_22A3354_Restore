@implementation SSCAMetalLayerFrameStats

- (SSCAMetalLayerFrameStats)initWithSignpostAggregation:(id)a3 parentIntervalStats:(id)a4
{
  id v6;
  id v7;
  SSCAMetalLayerFrameStats *v8;
  SSCAMetalLayerFrameStats *v9;
  uint64_t v10;
  SSCAMLDurationStats *totalEndToEndWalltimeStats;
  uint64_t v12;
  SSCAMLDurationStats *cpuEndToEndWalltimeStats;
  uint64_t v14;
  SSCAMLDurationStats *gpuEndToEndWalltimeStats;
  uint64_t v16;
  SSCAMLDurationStats *onGPUWalltimeStats;
  uint64_t v18;
  SSCAMLDurationStats *gpuDoneToCompletedWalltimeStats;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSCAMetalLayerFrameStats;
  v8 = -[SSCAMetalLayerFrameStats init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentIntervalStats, v7);
    _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_TotalEndToEndWalltime);
    v10 = objc_claimAutoreleasedReturnValue();
    totalEndToEndWalltimeStats = v9->_totalEndToEndWalltimeStats;
    v9->_totalEndToEndWalltimeStats = (SSCAMLDurationStats *)v10;

    _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_CPUEndToEndWalltime);
    v12 = objc_claimAutoreleasedReturnValue();
    cpuEndToEndWalltimeStats = v9->_cpuEndToEndWalltimeStats;
    v9->_cpuEndToEndWalltimeStats = (SSCAMLDurationStats *)v12;

    _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_GPUEndToEndWalltime);
    v14 = objc_claimAutoreleasedReturnValue();
    gpuEndToEndWalltimeStats = v9->_gpuEndToEndWalltimeStats;
    v9->_gpuEndToEndWalltimeStats = (SSCAMLDurationStats *)v14;

    _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_TotalOnGPUWalltime);
    v16 = objc_claimAutoreleasedReturnValue();
    onGPUWalltimeStats = v9->_onGPUWalltimeStats;
    v9->_onGPUWalltimeStats = (SSCAMLDurationStats *)v16;

    _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_GPUDoneToCompletion);
    v18 = objc_claimAutoreleasedReturnValue();
    gpuDoneToCompletedWalltimeStats = v9->_gpuDoneToCompletedWalltimeStats;
    v9->_gpuDoneToCompletedWalltimeStats = (SSCAMLDurationStats *)v18;

    -[SSCAMetalLayerFrameStats totalEndToEndWalltimeStats](v9, "totalEndToEndWalltimeStats");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_frameCount = objc_msgSend(v20, "durationCount");

    objc_msgSend(v6, "groupNameToGroupDict");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", kSSCAMLFPGroup_FrameCommandBuffers);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_commandBufferCount = objc_msgSend(v22, "count");

  }
  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[9];
  _QWORD v22[11];

  v22[9] = *MEMORY[0x1E0C80C00];
  v21[0] = kSSCAMLFrameStatsKey_FrameCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerFrameStats frameCount](self, "frameCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = kSSCAMLFrameStatsKey_FramesPerSecond;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerFrameStats framesPerSecond](self, "framesPerSecond");
  objc_msgSend(v3, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = kSSCAMLFrameStatsKey_TotalEndToEndWalltimeStats;
  -[SSCAMetalLayerFrameStats totalEndToEndWalltimeStats](self, "totalEndToEndWalltimeStats");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  v21[3] = kSSCAMLFrameStatsKey_CPUEndToEndWalltimeStats;
  -[SSCAMetalLayerFrameStats cpuEndToEndWalltimeStats](self, "cpuEndToEndWalltimeStats");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = kSSCAMLFrameStatsKey_GPUEndToEndWalltimeStats;
  -[SSCAMetalLayerFrameStats gpuEndToEndWalltimeStats](self, "gpuEndToEndWalltimeStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = kSSCAMLFrameStatsKey_OnGPUWalltimeStats;
  -[SSCAMetalLayerFrameStats onGPUWalltimeStats](self, "onGPUWalltimeStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = kSSCAMLFrameStatsKey_GPUDoneToCompletedWalltimeStats;
  -[SSCAMetalLayerFrameStats gpuDoneToCompletedWalltimeStats](self, "gpuDoneToCompletedWalltimeStats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  v21[7] = kSSCAMLFrameStatsKey_CommandBufferCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerFrameStats commandBufferCount](self, "commandBufferCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v11;
  v21[8] = kSSCAMLFrameStatsKey_CommandBuffersPerSecond;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerFrameStats commandBuffersPerSecond](self, "commandBuffersPerSecond");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerFrameStats jsonDescription:](self, "jsonDescription:", 3);
}

- (double)framesPerSecond
{
  void *v3;
  double v4;
  double v5;
  double result;

  -[SSCAMetalLayerFrameStats parentIntervalStats](self, "parentIntervalStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSeconds");
  v5 = v4;

  result = 0.0;
  if (v5 != 0.0)
    return (double)-[SSCAMetalLayerFrameStats frameCount](self, "frameCount", 0.0) / v5;
  return result;
}

- (double)commandBuffersPerSecond
{
  void *v3;
  double v4;
  double v5;
  double result;

  -[SSCAMetalLayerFrameStats parentIntervalStats](self, "parentIntervalStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSeconds");
  v5 = v4;

  result = 0.0;
  if (v5 != 0.0)
    return (double)-[SSCAMetalLayerFrameStats commandBufferCount](self, "commandBufferCount", 0.0) / v5;
  return result;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (SSCAMLDurationStats)totalEndToEndWalltimeStats
{
  return self->_totalEndToEndWalltimeStats;
}

- (SSCAMLDurationStats)cpuEndToEndWalltimeStats
{
  return self->_cpuEndToEndWalltimeStats;
}

- (SSCAMLDurationStats)gpuEndToEndWalltimeStats
{
  return self->_gpuEndToEndWalltimeStats;
}

- (SSCAMLDurationStats)onGPUWalltimeStats
{
  return self->_onGPUWalltimeStats;
}

- (SSCAMLDurationStats)gpuDoneToCompletedWalltimeStats
{
  return self->_gpuDoneToCompletedWalltimeStats;
}

- (unint64_t)commandBufferCount
{
  return self->_commandBufferCount;
}

- (SSCAMetalLayerStats)parentIntervalStats
{
  return (SSCAMetalLayerStats *)objc_loadWeakRetained((id *)&self->_parentIntervalStats);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentIntervalStats);
  objc_storeStrong((id *)&self->_gpuDoneToCompletedWalltimeStats, 0);
  objc_storeStrong((id *)&self->_onGPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_gpuEndToEndWalltimeStats, 0);
  objc_storeStrong((id *)&self->_cpuEndToEndWalltimeStats, 0);
  objc_storeStrong((id *)&self->_totalEndToEndWalltimeStats, 0);
}

@end
