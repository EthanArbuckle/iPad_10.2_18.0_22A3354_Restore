@implementation SSCAMetalLayerClientResourceUsageInterval

- (SSCAMetalLayerClientResourceUsageInterval)initWithStartSnapshot:(id)a3 endSnapshot:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SSCAMetalLayerClientResourceUsageInterval *v10;
  unint64_t v11;
  SSCAMetalLayerClientResourceUsageInterval *v12;
  id *p_isa;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = objc_msgSend(v7, "snapshotMCT");
    if (v11 >= objc_msgSend(v9, "snapshotMCT"))
    {
      v10 = 0;
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)SSCAMetalLayerClientResourceUsageInterval;
      v12 = -[SSCAMetalLayerClientResourceUsageInterval init](&v15, sel_init);
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_startSnapshot, a3);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v10 = self;
    }
  }

  return v10;
}

- (double)diskReadsMiB
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDiskReadsMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDiskReadsMiB");
  v8 = v5 - v7;

  return v8;
}

- (double)diskReadsMiBPerSec
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDiskReadsMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDiskReadsMiB");
  v8 = v5 - v7;
  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  v10 = v8 / v9;

  return v10;
}

- (double)diskWritesMiB
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDiskWritesMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDiskWritesMiB");
  v8 = v5 - v7;

  return v8;
}

- (double)diskWritesMiBPerSec
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDiskWritesMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDiskWritesMiB");
  v8 = v5 - v7;
  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  v10 = v8 / v9;

  return v10;
}

- (double)diskLogicalWritesMiB
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDiskLogicalWritesMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDiskLogicalWritesMiB");
  v8 = v5 - v7;

  return v8;
}

- (double)diskLogicalWritesMiBPerSec
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDiskLogicalWritesMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalDiskLogicalWritesMiB");
  v8 = v5 - v7;
  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  v10 = v8 / v9;

  return v10;
}

- (unint64_t)instructionCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalInstructionCount");
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - objc_msgSend(v5, "totalInstructionCount");

  return v6;
}

- (double)instructionCountPerSec
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  float v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalInstructionCount");
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)(v4 - objc_msgSend(v5, "totalInstructionCount"));
  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  v8 = v6 / v7;

  return v8;
}

- (unint64_t)pCoreInstructionCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalPcoreInstructionCount");
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - objc_msgSend(v5, "totalPcoreInstructionCount");

  return v6;
}

- (double)pCoreInstructionCountPerSec
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  float v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalPcoreInstructionCount");
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)(v4 - objc_msgSend(v5, "totalPcoreInstructionCount"));
  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  v8 = v6 / v7;

  return v8;
}

- (double)deltaPhysicalFootprintMiB
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "physicalFootprintMiB");
  v5 = v4;
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "physicalFootprintMiB");
  v8 = v5 - v7;

  return v8;
}

- (double)peakPhysicalFootprintMiB
{
  void *v2;
  double v3;
  double v4;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peakPhysicalFootprintMiB");
  v4 = v3;

  return v4;
}

- (BOOL)_hasMemoryLimitHeadroom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memoryLimitHeadroomMiB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "memoryLimitHeadroomMiB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSNumber)deltaMemoryLimitHeadroomMiB
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  if (-[SSCAMetalLayerClientResourceUsageInterval _hasMemoryLimitHeadroom](self, "_hasMemoryLimitHeadroom"))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memoryLimitHeadroomMiB");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "memoryLimitHeadroomMiB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v3, "numberWithDouble:", v7 - v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return (NSNumber *)v11;
}

- (BOOL)isEqual:(id)a3
{
  SSCAMetalLayerClientResourceUsageInterval *v4;
  SSCAMetalLayerClientResourceUsageInterval *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SSCAMetalLayerClientResourceUsageInterval *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](v5, "startSnapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](v5, "endSnapshot");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (double)timebaseRatio
{
  void *v2;
  double v3;
  double v4;

  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timebaseRatio");
  v4 = v3;

  return v4;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "snapshotMCT");

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "snapshotMCT");

  return v3;
}

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerClientResourceUsageInterval startMachContinuousTime](self, "startMachContinuousTime");
  -[SSCAMetalLayerClientResourceUsageInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerClientResourceUsageInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SSCAMetalLayerClientResourceUsageInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSCAMetalLayerClientResourceUsageInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSCAMetalLayerClientResourceUsageInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSCAMetalLayerClientResourceUsageInterval endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSCAMetalLayerClientResourceUsageInterval startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSCAMetalLayerClientResourceUsageInterval startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSCAMetalLayerClientResourceUsageInterval endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSCAMetalLayerClientResourceUsageInterval startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSCAMetalLayerClientResourceUsageInterval endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSCAMetalLayerClientResourceUsageInterval durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  _timeIntervalDict(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalFootprintMiB");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kSSCAMetalLayerClientResourceUsageIntervalKey_StartPhysicalFootprintMiB);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "physicalFootprintMiB");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kSSCAMetalLayerClientResourceUsageIntervalKey_EndPhysicalFootprintMiB);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval deltaPhysicalFootprintMiB](self, "deltaPhysicalFootprintMiB");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kSSCAMetalLayerClientResourceUsageIntervalKey_DeltaPhysicalFootprintMiB);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval peakPhysicalFootprintMiB](self, "peakPhysicalFootprintMiB");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, kSSCAMetalLayerClientResourceUsageIntervalKey_PeakPhysicalFootprintMiB);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval deltaPeakPhysicalFootprintMiB](self, "deltaPeakPhysicalFootprintMiB");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, kSSCAMetalLayerClientResourceUsageIntervalKey_DeltaPeakPhysicalFootprintMiB);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval diskReadsMiB](self, "diskReadsMiB");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, kSSCAMetalLayerClientResourceUsageIntervalKey_DiskReadsMiB);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval diskReadsMiBPerSec](self, "diskReadsMiBPerSec");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, kSSCAMetalLayerClientResourceUsageIntervalKey_DiskReadsMiBPerSec);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval diskWritesMiB](self, "diskWritesMiB");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, kSSCAMetalLayerClientResourceUsageIntervalKey_DiskWritesMiB);

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval diskWritesMiBPerSec](self, "diskWritesMiBPerSec");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, kSSCAMetalLayerClientResourceUsageIntervalKey_DiskWritesMiBPerSec);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval diskLogicalWritesMiB](self, "diskLogicalWritesMiB");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, kSSCAMetalLayerClientResourceUsageIntervalKey_DiskLogicalWritesMiB);

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval diskLogicalWritesMiBPerSec](self, "diskLogicalWritesMiBPerSec");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, kSSCAMetalLayerClientResourceUsageIntervalKey_DiskLogicalWritesMiBPerSec);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageInterval instructionCount](self, "instructionCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, kSSCAMetalLayerClientResourceUsageIntervalKey_InstructionCount);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval instructionCountPerSec](self, "instructionCountPerSec");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, kSSCAMetalLayerClientResourceUsageIntervalKey_InstructionsPerSec);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageInterval pCoreInstructionCount](self, "pCoreInstructionCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, kSSCAMetalLayerClientResourceUsageIntervalKey_PCoreInstructionCount);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageInterval pCoreInstructionCountPerSec](self, "pCoreInstructionCountPerSec");
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, kSSCAMetalLayerClientResourceUsageIntervalKey_PCoreInstructionsPerSec);

  if (-[SSCAMetalLayerClientResourceUsageInterval _hasMemoryLimitHeadroom](self, "_hasMemoryLimitHeadroom"))
  {
    -[SSCAMetalLayerClientResourceUsageInterval startSnapshot](self, "startSnapshot");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "memoryLimitHeadroomMiB");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, kSSCAMetalLayerClientResourceUsageIntervalKey_StartMemoryLimitHeadroomMiB);

    -[SSCAMetalLayerClientResourceUsageInterval endSnapshot](self, "endSnapshot");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "memoryLimitHeadroomMiB");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, kSSCAMetalLayerClientResourceUsageIntervalKey_StartMemoryLimitHeadroomMiB);

    -[SSCAMetalLayerClientResourceUsageInterval deltaMemoryLimitHeadroomMiB](self, "deltaMemoryLimitHeadroomMiB");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, kSSCAMetalLayerClientResourceUsageIntervalKey_DeltaMemoryLimitHeadroomMiB);

  }
  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerClientResourceUsageInterval jsonDescription:](self, "jsonDescription:", 3);
}

- (SSCAMetalLayerClientResourceUsageSnapshot)startSnapshot
{
  return self->_startSnapshot;
}

- (SSCAMetalLayerClientResourceUsageSnapshot)endSnapshot
{
  return self->_endSnapshot;
}

- (double)deltaPeakPhysicalFootprintMiB
{
  return self->_deltaPeakPhysicalFootprintMiB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endSnapshot, 0);
  objc_storeStrong((id *)&self->_startSnapshot, 0);
}

@end
