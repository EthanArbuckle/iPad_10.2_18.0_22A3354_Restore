@implementation SSCAMetalLayerClientResourceUsageSnapshot

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
  id v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[9];
  _QWORD v24[11];

  v24[9] = *MEMORY[0x1E0C80C00];
  v23[0] = kSSCAMetalLayerClientResourceUsageSnapshotKey_Date;
  -[SSCAMetalLayerClientResourceUsageSnapshot snapshotDate](self, "snapshotDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForDate(v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v23[1] = kSSCAMetalLayerClientResourceUsageSnapshotKey_MCT;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSnapshot snapshotMCT](self, "snapshotMCT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = kSSCAMetalLayerClientResourceUsageSnapshotKey_physicalFootprintMiB;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSnapshot physicalFootprintMiB](self, "physicalFootprintMiB");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = kSSCAMetalLayerClientResourceUsageSnapshotKey_peakPhysicalFootprintMiB;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSnapshot peakPhysicalFootprintMiB](self, "peakPhysicalFootprintMiB");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalDiskReadsMiB;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskReadsMiB](self, "totalDiskReadsMiB");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v9;
  v23[5] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalDiskWritesMiB;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskWritesMiB](self, "totalDiskWritesMiB");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v11;
  v23[6] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalDiskLogicalWritesMiB;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskLogicalWritesMiB](self, "totalDiskLogicalWritesMiB");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v13;
  v23[7] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalInstructionCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSnapshot totalInstructionCount](self, "totalInstructionCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v14;
  v23[8] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalPcoreInstructionCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSnapshot totalPcoreInstructionCount](self, "totalPcoreInstructionCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](self, "memoryLimitHeadroomMiB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (id)objc_msgSend(v16, "mutableCopy");
    -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](self, "memoryLimitHeadroomMiB");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, kSSCAMetalLayerClientResourceUsageSnapshotKey_memoryLimitHeadroomMiB);

  }
  else
  {
    v18 = v16;
  }

  return v18;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerClientResourceUsageSnapshot jsonDescription:](self, "jsonDescription:", 3);
}

- (SSCAMetalLayerClientResourceUsageSnapshot)initWithPhysicalFootprintMiB:(id)a3 peakPhysicalFootprint:(id)a4 totalDiskReads:(id)a5 totalDiskWrites:(id)a6 totalDiskLogicalWrites:(id)a7 totalInstructionCount:(id)a8 totalPcoreInstructionCount:(id)a9 date:(id)a10 mct:(unint64_t)a11 optionalMemoryLimitHeadroom:(id)a12 timebaseRatio:(double)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SSCAMetalLayerClientResourceUsageSnapshot *v28;
  void *v29;
  SSCAMetalLayerClientResourceUsageSnapshot *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v37;
  void *v38;
  id v39;
  objc_super v40;

  v20 = a3;
  v21 = a4;
  v39 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a12;
  v28 = 0;
  v38 = v20;
  if (v20)
  {
    v29 = v21;
    if (v21 && v39 && v22 && v23 && v24 && v25 && v26 && a11 && a13 != 0.0)
    {
      v37 = v27;
      v40.receiver = self;
      v40.super_class = (Class)SSCAMetalLayerClientResourceUsageSnapshot;
      v30 = -[SSCAMetalLayerClientResourceUsageSnapshot init](&v40, sel_init);
      if (v30)
      {
        objc_msgSend(v38, "doubleValue");
        v30->_physicalFootprintMiB = v31;
        objc_msgSend(v21, "doubleValue");
        v30->_peakPhysicalFootprintMiB = v32;
        objc_storeStrong((id *)&v30->_memoryLimitHeadroomMiB, a12);
        objc_msgSend(v39, "doubleValue");
        v30->_totalDiskReadsMiB = v33;
        objc_msgSend(v22, "doubleValue");
        v30->_totalDiskWritesMiB = v34;
        objc_msgSend(v23, "doubleValue");
        v30->_totalDiskLogicalWritesMiB = v35;
        v30->_totalInstructionCount = objc_msgSend(v24, "unsignedLongLongValue");
        v30->_totalPcoreInstructionCount = objc_msgSend(v25, "unsignedLongLongValue");
        objc_storeStrong((id *)&v30->_snapshotDate, a10);
        v30->_snapshotMCT = a11;
        v30->_timebaseRatio = a13;
      }
      self = v30;
      v28 = self;
      v27 = v37;
    }
  }
  else
  {
    v29 = v21;
  }

  return v28;
}

+ (id)snapshotFromSignpostEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SSCAMetalLayerClientResourceUsageSnapshot *v26;
  SSCAMetalLayerClientResourceUsageSnapshot *v27;

  v3 = a3;
  objc_msgSend(v3, "placeholderTokenValueDictForTokenKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [SSCAMetalLayerClientResourceUsageSnapshot alloc];
  v5 = v4;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_phys_footprint"), v5, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_lifetime_max_phys_footprint"), v6, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_diskio_bytesread"), v7, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_diskio_byteswritten"), v8, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_logical_writes"), v9, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_instructions"), v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v10;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("ri_pinstructions"), v12, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "beginDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "startMachContinuousTime");
  v16 = v12;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("os_proc_available_memory"), v16, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "timebaseRatio");
  v19 = v18;

  v27 = -[SSCAMetalLayerClientResourceUsageSnapshot initWithPhysicalFootprintMiB:peakPhysicalFootprint:totalDiskReads:totalDiskWrites:totalDiskLogicalWrites:totalInstructionCount:totalPcoreInstructionCount:date:mct:optionalMemoryLimitHeadroom:timebaseRatio:](v26, "initWithPhysicalFootprintMiB:peakPhysicalFootprint:totalDiskReads:totalDiskWrites:totalDiskLogicalWrites:totalInstructionCount:totalPcoreInstructionCount:date:mct:optionalMemoryLimitHeadroom:timebaseRatio:", v25, v24, v23, v22, v21, v11, v19, v13, v14, v15, v17);
  return v27;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SSCAMetalLayerClientResourceUsageSnapshot *v5;
  SSCAMetalLayerClientResourceUsageSnapshot *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;

  v5 = (SSCAMetalLayerClientResourceUsageSnapshot *)a3;
  if (self == v5)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](self, "memoryLimitHeadroomMiB");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7
        || (-[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](v6, "memoryLimitHeadroomMiB"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](self, "memoryLimitHeadroomMiB");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

          if (v7)
          {

          }
        }
        else
        {
          -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](v6, "memoryLimitHeadroomMiB");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {

          }
          if (v10)
            goto LABEL_26;
        }
        -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](self, "memoryLimitHeadroomMiB");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11
          || (-[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](self, "memoryLimitHeadroomMiB"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SSCAMetalLayerClientResourceUsageSnapshot memoryLimitHeadroomMiB](v6, "memoryLimitHeadroomMiB"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v12, "isEqualToNumber:", v13),
              v13,
              v12,
              v14))
        {
          -[SSCAMetalLayerClientResourceUsageSnapshot snapshotDate](self, "snapshotDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSCAMetalLayerClientResourceUsageSnapshot snapshotDate](v6, "snapshotDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToDate:", v16);

          if (v17)
          {
            v18 = -[SSCAMetalLayerClientResourceUsageSnapshot snapshotMCT](self, "snapshotMCT");
            if (v18 == -[SSCAMetalLayerClientResourceUsageSnapshot snapshotMCT](v6, "snapshotMCT"))
            {
              -[SSCAMetalLayerClientResourceUsageSnapshot physicalFootprintMiB](self, "physicalFootprintMiB");
              v20 = v19;
              -[SSCAMetalLayerClientResourceUsageSnapshot physicalFootprintMiB](v6, "physicalFootprintMiB");
              if (v20 == v21)
              {
                -[SSCAMetalLayerClientResourceUsageSnapshot peakPhysicalFootprintMiB](self, "peakPhysicalFootprintMiB");
                v23 = v22;
                -[SSCAMetalLayerClientResourceUsageSnapshot peakPhysicalFootprintMiB](v6, "peakPhysicalFootprintMiB");
                if (v23 == v24)
                {
                  -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskReadsMiB](self, "totalDiskReadsMiB");
                  v26 = v25;
                  -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskReadsMiB](v6, "totalDiskReadsMiB");
                  if (v26 == v27)
                  {
                    -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskWritesMiB](self, "totalDiskWritesMiB");
                    v29 = v28;
                    -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskWritesMiB](v6, "totalDiskWritesMiB");
                    if (v29 == v30)
                    {
                      -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskLogicalWritesMiB](self, "totalDiskLogicalWritesMiB");
                      v32 = v31;
                      -[SSCAMetalLayerClientResourceUsageSnapshot totalDiskLogicalWritesMiB](v6, "totalDiskLogicalWritesMiB");
                      if (v32 == v33)
                      {
                        v34 = -[SSCAMetalLayerClientResourceUsageSnapshot totalInstructionCount](self, "totalInstructionCount");
                        if (v34 == -[SSCAMetalLayerClientResourceUsageSnapshot totalInstructionCount](v6, "totalInstructionCount"))
                        {
                          v35 = -[SSCAMetalLayerClientResourceUsageSnapshot totalPcoreInstructionCount](self, "totalPcoreInstructionCount");
                          if (v35 == -[SSCAMetalLayerClientResourceUsageSnapshot totalPcoreInstructionCount](v6, "totalPcoreInstructionCount"))
                          {
                            -[SSCAMetalLayerClientResourceUsageSnapshot timebaseRatio](self, "timebaseRatio");
                            v37 = v36;
                            -[SSCAMetalLayerClientResourceUsageSnapshot timebaseRatio](v6, "timebaseRatio");
                            v8 = v37 == v38;
LABEL_27:

                            goto LABEL_28;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {

      }
LABEL_26:
      v8 = 0;
      goto LABEL_27;
    }
    v8 = 0;
  }
LABEL_28:

  return v8;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (unint64_t)snapshotMCT
{
  return self->_snapshotMCT;
}

- (double)physicalFootprintMiB
{
  return self->_physicalFootprintMiB;
}

- (double)peakPhysicalFootprintMiB
{
  return self->_peakPhysicalFootprintMiB;
}

- (double)totalDiskReadsMiB
{
  return self->_totalDiskReadsMiB;
}

- (double)totalDiskWritesMiB
{
  return self->_totalDiskWritesMiB;
}

- (double)totalDiskLogicalWritesMiB
{
  return self->_totalDiskLogicalWritesMiB;
}

- (unint64_t)totalInstructionCount
{
  return self->_totalInstructionCount;
}

- (unint64_t)totalPcoreInstructionCount
{
  return self->_totalPcoreInstructionCount;
}

- (NSNumber)memoryLimitHeadroomMiB
{
  return self->_memoryLimitHeadroomMiB;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryLimitHeadroomMiB, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
}

@end
