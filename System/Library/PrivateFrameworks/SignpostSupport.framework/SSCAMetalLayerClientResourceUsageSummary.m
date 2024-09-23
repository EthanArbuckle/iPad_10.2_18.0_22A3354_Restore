@implementation SSCAMetalLayerClientResourceUsageSummary

- (id)dictionaryRepresentation
{
  id v3;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary peakPhysicalFootprintMiB](self, "peakPhysicalFootprintMiB");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSSCAMetalLayerClientResourceUsageSummaryKey_PeakPhysicalFootprintMiB);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary averagePhysicalFootprintMiB](self, "averagePhysicalFootprintMiB");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kSSCAMetalLayerClientResourceUsageSummaryKey_AveragePhysicalFootprintMiB);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kSSCAMetalLayerClientResourceUsageSummaryKey_TotalDurationSeconds);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary diskReadsMiB](self, "diskReadsMiB");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kSSCAMetalLayerClientResourceUsageSummaryKey_DiskReadsMiB);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary diskReadsMiBPerSec](self, "diskReadsMiBPerSec");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, kSSCAMetalLayerClientResourceUsageSummaryKey_DiskReadsMiBPerSec);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary diskWritesMiB](self, "diskWritesMiB");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, kSSCAMetalLayerClientResourceUsageSummaryKey_DiskWritesMiB);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary diskWritesMiBPerSec](self, "diskWritesMiBPerSec");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, kSSCAMetalLayerClientResourceUsageSummaryKey_DiskWritesMiBPerSec);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary diskLogicalWritesMiB](self, "diskLogicalWritesMiB");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, kSSCAMetalLayerClientResourceUsageSummaryKey_DiskLogicalWritesMiB);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary diskLogicalWritesMiBPerSec](self, "diskLogicalWritesMiBPerSec");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, kSSCAMetalLayerClientResourceUsageSummaryKey_DiskLogicalWritesMiBPerSec);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSummary instructionCount](self, "instructionCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, kSSCAMetalLayerClientResourceUsageSummaryKey_InstructionCount);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary instructionCountPerSec](self, "instructionCountPerSec");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, kSSCAMetalLayerClientResourceUsageSummaryKey_InstructionsPerSec);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSummary pCoreInstructionCount](self, "pCoreInstructionCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, kSSCAMetalLayerClientResourceUsageSummaryKey_PCoreInstructionCount);

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSummary pCoreInstructionCountPerSec](self, "pCoreInstructionCountPerSec");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, kSSCAMetalLayerClientResourceUsageSummaryKey_PCoreInstructionsPerSec);

  -[SSCAMetalLayerClientResourceUsageSummary averageMemoryLimitHeadroomMiB](self, "averageMemoryLimitHeadroomMiB");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SSCAMetalLayerClientResourceUsageSummary averageMemoryLimitHeadroomMiB](self, "averageMemoryLimitHeadroomMiB");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, kSSCAMetalLayerClientResourceUsageSummaryKey_AverageMemoryLimitHeadroomMiB);

  }
  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerClientResourceUsageSummary jsonDescription:](self, "jsonDescription:", 3);
}

- (SSCAMetalLayerClientResourceUsageSummary)initWithIntervals:(id)a3
{
  id v4;
  SSCAMetalLayerClientResourceUsageSummary *v5;
  SSCAMetalLayerClientResourceUsageSummary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  float v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  float v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  float v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  NSNumber *averageMemoryLimitHeadroomMiB;
  SSCAMetalLayerClientResourceUsageSummary *v56;
  id v57;
  id obj;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  float v64;
  double v65;
  double v66;
  double v67;
  float v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)SSCAMetalLayerClientResourceUsageSummary;
  v5 = -[SSCAMetalLayerClientResourceUsageSummary init](&v73, sel_init);
  v6 = v5;
  if (v5)
  {
    v56 = v5;
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deltaMemoryLimitHeadroomMiB");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v57 = v4;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = 0.0;
      v59 = *(_QWORD *)v70;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v70 != v59)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v20, "durationSeconds");
          v68 = v21;
          objc_msgSend(v20, "diskReadsMiB");
          v67 = v22;
          objc_msgSend(v20, "diskWritesMiB");
          v66 = v23;
          objc_msgSend(v20, "diskLogicalWritesMiB");
          v65 = v24;
          v25 = objc_msgSend(v20, "instructionCount");
          v26 = objc_msgSend(v20, "pCoreInstructionCount");
          objc_msgSend(v20, "endSnapshot");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "peakPhysicalFootprintMiB");
          v29 = v28;

          if (v15 < v29)
            v15 = v29;
          objc_msgSend(v20, "durationSeconds");
          v64 = v30;
          objc_msgSend(v20, "startSnapshot");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "physicalFootprintMiB");
          v63 = v32;
          objc_msgSend(v20, "endSnapshot");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "physicalFootprintMiB");
          v62 = v34;

          if (v60)
          {
            objc_msgSend(v20, "durationSeconds");
            v61 = v35;
            objc_msgSend(v20, "startSnapshot");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "memoryLimitHeadroomMiB");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "doubleValue");
            v38 = v17;
            v39 = v16;
            v40 = v18;
            v41 = v13;
            v42 = v12;
            v43 = v15;
            v44 = v14;
            v46 = v45;
            objc_msgSend(v20, "endSnapshot");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "memoryLimitHeadroomMiB");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "doubleValue");
            v50 = v46 + v49;
            v51 = v44;
            v15 = v43;
            v12 = v42;
            v13 = v41;
            v18 = v40;
            v16 = v39;
            v17 = v38;
            v52 = 0.5;
            v14 = v51 + v50 * v61 * 0.5;

          }
          else
          {
            v52 = 0.5;
          }
          v18 = v18 + v68;
          v17 = v17 + v67;
          v16 = v16 + v66;
          v12 = v12 + v65;
          v10 += v25;
          v11 += v26;
          v13 = v13 + (v63 + v62) * v64 * v52;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v12 = 0.0;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
    }

    v6 = v56;
    v4 = v57;
    v56->_totalDurationSeconds = v18;
    v56->_diskReadsMiB = v17;
    v56->_diskWritesMiB = v16;
    v56->_diskLogicalWritesMiB = v12;
    v56->_instructionCount = v10;
    v56->_pCoreInstructionCount = v11;
    v56->_peakPhysicalFootprintMiB = v15;
    v56->_averagePhysicalFootprintMiB = v13 / v18;
    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 / v18);
      v53 = objc_claimAutoreleasedReturnValue();
      averageMemoryLimitHeadroomMiB = v56->_averageMemoryLimitHeadroomMiB;
      v56->_averageMemoryLimitHeadroomMiB = (NSNumber *)v53;

    }
  }

  return v6;
}

- (double)diskReadsMiBPerSec
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[SSCAMetalLayerClientResourceUsageSummary diskReadsMiB](self, "diskReadsMiB", 0.0);
    v7 = v6;
    -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
    return v7 / v8;
  }
  return result;
}

- (double)diskWritesMiBPerSec
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[SSCAMetalLayerClientResourceUsageSummary diskWritesMiB](self, "diskWritesMiB", 0.0);
    v7 = v6;
    -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
    return v7 / v8;
  }
  return result;
}

- (double)diskLogicalWritesMiBPerSec
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;

  -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[SSCAMetalLayerClientResourceUsageSummary diskLogicalWritesMiB](self, "diskLogicalWritesMiB", 0.0);
    v7 = v6;
    -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
    return v7 / v8;
  }
  return result;
}

- (double)instructionCountPerSec
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;

  -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    v6 = (double)-[SSCAMetalLayerClientResourceUsageSummary instructionCount](self, "instructionCount", 0.0);
    -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
    return v6 / v7;
  }
  return result;
}

- (double)pCoreInstructionCountPerSec
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;

  -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    v6 = (double)-[SSCAMetalLayerClientResourceUsageSummary pCoreInstructionCount](self, "pCoreInstructionCount", 0.0);
    -[SSCAMetalLayerClientResourceUsageSummary totalDurationSeconds](self, "totalDurationSeconds");
    return v6 / v7;
  }
  return result;
}

- (double)peakPhysicalFootprintMiB
{
  return self->_peakPhysicalFootprintMiB;
}

- (double)averagePhysicalFootprintMiB
{
  return self->_averagePhysicalFootprintMiB;
}

- (NSNumber)averageMemoryLimitHeadroomMiB
{
  return self->_averageMemoryLimitHeadroomMiB;
}

- (double)diskReadsMiB
{
  return self->_diskReadsMiB;
}

- (double)diskWritesMiB
{
  return self->_diskWritesMiB;
}

- (double)diskLogicalWritesMiB
{
  return self->_diskLogicalWritesMiB;
}

- (unint64_t)instructionCount
{
  return self->_instructionCount;
}

- (unint64_t)pCoreInstructionCount
{
  return self->_pCoreInstructionCount;
}

- (double)totalDurationSeconds
{
  return self->_totalDurationSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageMemoryLimitHeadroomMiB, 0);
}

@end
