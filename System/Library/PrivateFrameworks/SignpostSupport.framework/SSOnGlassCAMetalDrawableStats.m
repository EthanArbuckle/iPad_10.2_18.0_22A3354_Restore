@implementation SSOnGlassCAMetalDrawableStats

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSOnGlassCAMetalDrawableStats jsonDescription:](self, "jsonDescription:", 3);
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[8];
  _QWORD v22[10];

  v22[8] = *MEMORY[0x1E0C80C00];
  v21[0] = kSSOnGlassCAMetalDrawableStatsKey_OnGlassStats;
  -[SSOnGlassCAMetalDrawableStats onGlassIntervalStats](self, "onGlassIntervalStats");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  v21[1] = kSSOnGlassCAMetalDrawableStatsKey_InFlightTotalWalltimeStats;
  -[SSOnGlassCAMetalDrawableStats inFlightTotalEndToEndIntervalStats](self, "inFlightTotalEndToEndIntervalStats");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  v21[2] = kSSOnGlassCAMetalDrawableStatsKey_InFlightCPUWalltimeStats;
  -[SSOnGlassCAMetalDrawableStats inFlightCPUEndToEndIntervalStats](self, "inFlightCPUEndToEndIntervalStats");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v15;
  v21[3] = kSSOnGlassCAMetalDrawableStatsKey_InFlightGPUWalltimeStats;
  -[SSOnGlassCAMetalDrawableStats inFlightGPUEndToEndIntervalStats](self, "inFlightGPUEndToEndIntervalStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = kSSOnGlassCAMetalDrawableStatsKey_InFlightOnGPUTimeStats;
  -[SSOnGlassCAMetalDrawableStats inFlightOnGPUTimeStats](self, "inFlightOnGPUTimeStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = kSSOnGlassCAMetalDrawableStatsKey_InFlightWaitForGlassStats;
  -[SSOnGlassCAMetalDrawableStats inFlightWaitForGlassStats](self, "inFlightWaitForGlassStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = kSSOnGlassCAMetalDrawableStatsKey_InFlightGPUResidencyStats;
  -[SSOnGlassCAMetalDrawableStats inFlightGPUResidencyStats](self, "inFlightGPUResidencyStats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  v21[7] = kSSOnGlassCAMetalDrawableStatsKey_InFlightCommandBufferCountStats;
  -[SSOnGlassCAMetalDrawableStats inFlightCommandBufferCountStats](self, "inFlightCommandBufferCountStats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (SSOnGlassCAMetalDrawableStats)initWithOnGlassDrawableIntervals:(id)a3
{
  id v4;
  SSOnGlassCAMetalDrawableStats *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SignpostSupportValueStats *v14;
  SignpostSupportValueStats *onGlassIntervalStats;
  SignpostSupportValueStats *v16;
  SignpostSupportValueStats *inFlightTotalEndToEndIntervalStats;
  SignpostSupportValueStats *v18;
  SignpostSupportValueStats *inFlightCPUEndToEndIntervalStats;
  SignpostSupportValueStats *v20;
  SignpostSupportValueStats *inFlightGPUEndToEndIntervalStats;
  SignpostSupportValueStats *v22;
  SignpostSupportValueStats *inFlightOnGPUTimeStats;
  SignpostSupportValueStats *v24;
  SignpostSupportValueStats *inFlightWaitForGlassStats;
  SignpostSupportValueStats *v26;
  SignpostSupportValueStats *inFlightGPUResidencyStats;
  SignpostSupportValueStats *v28;
  SignpostSupportValueStats *inFlightCommandBufferCountStats;
  void *v30;
  int v31;
  void *v33;
  objc_super v34;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_25;
  v34.receiver = self;
  v34.super_class = (Class)SSOnGlassCAMetalDrawableStats;
  self = -[SSOnGlassCAMetalDrawableStats init](&v34, sel_init);
  if (!self)
    goto LABEL_26;
  _valuesForOnGlassIntervals(v4, &__block_literal_global_25);
  v5 = (SSOnGlassCAMetalDrawableStats *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _valuesForOnGlassIntervals(v4, &__block_literal_global_855);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      _valuesForOnGlassIntervals(v4, &__block_literal_global_856);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        _valuesForOnGlassIntervals(v4, &__block_literal_global_857);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          _valuesForOnGlassIntervals(v4, &__block_literal_global_858);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            _valuesForOnGlassIntervals(v4, &__block_literal_global_859);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              _valuesForOnGlassIntervals(v4, &__block_literal_global_860);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                _valuesForOnGlassIntervals(v4, &__block_literal_global_861);
                v13 = objc_claimAutoreleasedReturnValue();
                if (v13)
                {
                  v33 = (void *)v13;
                  v14 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v5, CFSTR("seconds"), 0);
                  onGlassIntervalStats = self->_onGlassIntervalStats;
                  self->_onGlassIntervalStats = v14;

                  v16 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v7, CFSTR("seconds"), 0);
                  inFlightTotalEndToEndIntervalStats = self->_inFlightTotalEndToEndIntervalStats;
                  self->_inFlightTotalEndToEndIntervalStats = v16;

                  v18 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v8, CFSTR("seconds"), 0);
                  inFlightCPUEndToEndIntervalStats = self->_inFlightCPUEndToEndIntervalStats;
                  self->_inFlightCPUEndToEndIntervalStats = v18;

                  v20 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v9, CFSTR("seconds"), 0);
                  inFlightGPUEndToEndIntervalStats = self->_inFlightGPUEndToEndIntervalStats;
                  self->_inFlightGPUEndToEndIntervalStats = v20;

                  v22 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v10, CFSTR("seconds"), 0);
                  inFlightOnGPUTimeStats = self->_inFlightOnGPUTimeStats;
                  self->_inFlightOnGPUTimeStats = v22;

                  v24 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v11, CFSTR("seconds"), 0);
                  inFlightWaitForGlassStats = self->_inFlightWaitForGlassStats;
                  self->_inFlightWaitForGlassStats = v24;

                  v26 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v12, CFSTR("dimensionless ratio"), 0);
                  inFlightGPUResidencyStats = self->_inFlightGPUResidencyStats;
                  self->_inFlightGPUResidencyStats = v26;

                  v28 = -[SignpostSupportValueStats initWithValues:unitsLabel:supportsDynamicPercentiles:]([SignpostSupportValueStats alloc], "initWithValues:unitsLabel:supportsDynamicPercentiles:", v33, CFSTR("command buffer count"), 0);
                  inFlightCommandBufferCountStats = self->_inFlightCommandBufferCountStats;
                  self->_inFlightCommandBufferCountStats = v28;

                  v30 = v33;
                  v31 = 0;
                }
                else
                {
                  v30 = 0;
                  v31 = 1;
                }

              }
              else
              {
                v31 = 1;
              }

            }
            else
            {
              v31 = 1;
            }

          }
          else
          {
            v31 = 1;
          }

        }
        else
        {
          v31 = 1;
        }

      }
      else
      {
        v31 = 1;
      }

      if (v31)
        goto LABEL_25;
LABEL_26:
      self = self;
      v5 = self;
      goto LABEL_27;
    }

LABEL_25:
    v5 = 0;
  }
LABEL_27:

  return v5;
}

uint64_t __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "durationSeconds");
  return objc_msgSend(v2, "numberWithFloat:");
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "durationSeconds");
  objc_msgSend(v2, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cpuEndToEndWalltime");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gpuEndToEndWalltime");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onGPUTime");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitForGlassWalltime");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gpuResidencyRatio");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "inFlightDrawableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "commandBufferCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SignpostSupportValueStats)onGlassIntervalStats
{
  return self->_onGlassIntervalStats;
}

- (SignpostSupportValueStats)inFlightTotalEndToEndIntervalStats
{
  return self->_inFlightTotalEndToEndIntervalStats;
}

- (SignpostSupportValueStats)inFlightCPUEndToEndIntervalStats
{
  return self->_inFlightCPUEndToEndIntervalStats;
}

- (SignpostSupportValueStats)inFlightGPUEndToEndIntervalStats
{
  return self->_inFlightGPUEndToEndIntervalStats;
}

- (SignpostSupportValueStats)inFlightWaitForGlassStats
{
  return self->_inFlightWaitForGlassStats;
}

- (SignpostSupportValueStats)inFlightOnGPUTimeStats
{
  return self->_inFlightOnGPUTimeStats;
}

- (SignpostSupportValueStats)inFlightCommandBufferCountStats
{
  return self->_inFlightCommandBufferCountStats;
}

- (SignpostSupportValueStats)inFlightGPUResidencyStats
{
  return self->_inFlightGPUResidencyStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightGPUResidencyStats, 0);
  objc_storeStrong((id *)&self->_inFlightCommandBufferCountStats, 0);
  objc_storeStrong((id *)&self->_inFlightOnGPUTimeStats, 0);
  objc_storeStrong((id *)&self->_inFlightWaitForGlassStats, 0);
  objc_storeStrong((id *)&self->_inFlightGPUEndToEndIntervalStats, 0);
  objc_storeStrong((id *)&self->_inFlightCPUEndToEndIntervalStats, 0);
  objc_storeStrong((id *)&self->_inFlightTotalEndToEndIntervalStats, 0);
  objc_storeStrong((id *)&self->_onGlassIntervalStats, 0);
}

@end
