@implementation SignpostMetrics

+ (id)newMetricsForSignpostEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "_overridesOwnTime") & 1) == 0)
  {
    objc_msgSend(v4, "metadataSegments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "placeholderTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(CFSTR("signpost:metrics"), "isEqual:", v9) & 1) == 0)
      {

        v5 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v7, "argument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "type");

      if (v11 == 2)
      {
        objc_msgSend(v7, "argument");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "argumentObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = (void *)objc_msgSend(a1, "_newMetricsFromData:", v8);
LABEL_9:

        goto LABEL_10;
      }
    }
    v5 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (SignpostMetrics)initWithSnapshotDict:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  SignpostMetrics *v8;
  SignpostMetrics *v9;
  uint64_t v10;
  NSNumber *cpuTimeNsec;
  SignpostMetrics *v12;
  uint64_t v13;
  NSNumber *dirtyMemoryKB;
  uint64_t v15;
  NSNumber *dirtyMemoryLifetimePeakKB;
  uint64_t v17;
  NSNumber *storageDirtiedKB;
  uint64_t v19;
  NSNumber *cpuInstructionsKI;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SignpostMetrics;
  v8 = -[SignpostMetrics init](&v22, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  objc_storeStrong((id *)&v8->_binarySnapshot, a4);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cpu_time"));
  v10 = objc_claimAutoreleasedReturnValue();
  cpuTimeNsec = v9->_cpuTimeNsec;
  v9->_cpuTimeNsec = (NSNumber *)v10;

  -[SignpostMetrics cpuTimeNsec](v9, "cpuTimeNsec");
  v12 = (SignpostMetrics *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("current_mem"));
    v13 = objc_claimAutoreleasedReturnValue();
    dirtyMemoryKB = v9->_dirtyMemoryKB;
    v9->_dirtyMemoryKB = (NSNumber *)v13;

    -[SignpostMetrics dirtyMemoryKB](v9, "dirtyMemoryKB");
    v12 = (SignpostMetrics *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lifetime_peak"));
      v15 = objc_claimAutoreleasedReturnValue();
      dirtyMemoryLifetimePeakKB = v9->_dirtyMemoryLifetimePeakKB;
      v9->_dirtyMemoryLifetimePeakKB = (NSNumber *)v15;

      -[SignpostMetrics dirtyMemoryLifetimePeakKB](v9, "dirtyMemoryLifetimePeakKB");
      v12 = (SignpostMetrics *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storage_dirtied"));
        v17 = objc_claimAutoreleasedReturnValue();
        storageDirtiedKB = v9->_storageDirtiedKB;
        v9->_storageDirtiedKB = (NSNumber *)v17;

        -[SignpostMetrics storageDirtiedKB](v9, "storageDirtiedKB");
        v12 = (SignpostMetrics *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cpu_instrs"));
          v19 = objc_claimAutoreleasedReturnValue();
          cpuInstructionsKI = v9->_cpuInstructionsKI;
          v9->_cpuInstructionsKI = (NSNumber *)v19;

LABEL_7:
          v12 = v9;
        }
      }
    }
  }

  return v12;
}

+ (id)_newMetricsFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  SignpostMetrics *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v50;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v50 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v50);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v50;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (!v8)
    {
      _signpost_debug_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[SignpostMetrics _newMetricsFromData:].cold.1(v7 != 0, v7, v9);
LABEL_18:
      v10 = 0;
LABEL_32:

      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _signpost_debug_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[SignpostMetrics _newMetricsFromData:].cold.6(v9, v13, v14, v15, v16, v17, v18, v19);
      goto LABEL_18;
    }
    v9 = v5;
    if (-[NSObject count](v9, "count") != 1)
    {
      _signpost_debug_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[SignpostMetrics _newMetricsFromData:].cold.5(v11, v20, v21, v22, v23, v24, v25, v26);
      v10 = 0;
      goto LABEL_31;
    }
    -[NSObject firstObject](v9, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("meas"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[SignpostMetrics initWithSnapshotDict:data:]([SignpostMetrics alloc], "initWithSnapshotDict:data:", v12, v4);
LABEL_30:

LABEL_31:
          goto LABEL_32;
        }
        _signpost_debug_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          +[SignpostMetrics _newMetricsFromData:].cold.3(v34, v42, v43, v44, v45, v46, v47, v48);
      }
      else
      {
        _signpost_debug_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          +[SignpostMetrics _newMetricsFromData:].cold.2(v34, v35, v36, v37, v38, v39, v40, v41);
      }

    }
    else
    {
      _signpost_debug_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[SignpostMetrics _newMetricsFromData:].cold.4(v12, v27, v28, v29, v30, v31, v32, v33);
    }
    v10 = 0;
    goto LABEL_30;
  }
  v10 = 0;
LABEL_33:

  return v10;
}

- (id)debugDescription
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostMetrics cpuTimeNsec](self, "cpuTimeNsec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostMetrics dirtyMemoryKB](self, "dirtyMemoryKB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostMetrics dirtyMemoryLifetimePeakKB](self, "dirtyMemoryLifetimePeakKB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostMetrics storageDirtiedKB](self, "storageDirtiedKB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostMetrics cpuInstructionsKI](self, "cpuInstructionsKI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostMetrics cpuInstructionsKI](self, "cpuInstructionsKI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("CPU Instructions:\t%@ kI"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("CPU Time:\t%@ ns\nDirty Memory:\t%@ kB\nDirty Memory (Peak):\t%@ kB\nStorage Dirtied:\t%@ kB\n%@"), v4, v5, v6, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("CPU Time:\t%@ ns\nDirty Memory:\t%@ kB\nDirty Memory (Peak):\t%@ kB\nStorage Dirtied:\t%@ kB\n%@"), v4, v5, v6, v7, &stru_1E4610268);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_deltaDescription:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;

  v3 = a3;
  objc_msgSend(v3, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metrics");
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "endEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metrics");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5 | v7)
  {
    if (!v5 || v7)
    {
      if (v5 || !v7)
      {
        if (!v5)
          goto LABEL_12;
        if (!v7)
          goto LABEL_12;
        objc_msgSend(v3, "beginEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "processID");
        objc_msgSend(v3, "endEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "processID");

        if (v11 != v13)
        {
          v8 = CFSTR("Begin and End PID differ");
        }
        else
        {
LABEL_12:
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v7, "cpuTimeNsec");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedLongLongValue");
          objc_msgSend((id)v5, "cpuTimeNsec");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedLongLongValue");

          if (v15 != v17)
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)v7, "cpuTimeNsec");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedLongLongValue");
            objc_msgSend((id)v5, "cpuTimeNsec");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%s Delta:\t%lld %s\n"), "CPU Time", v20 - objc_msgSend(v21, "unsignedLongLongValue"), "ns");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v8, "appendString:", v22);

          }
          objc_msgSend((id)v7, "cpuInstructionsKI");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedLongLongValue");
          objc_msgSend((id)v5, "cpuInstructionsKI");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedLongLongValue");

          if (v24 != v26)
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)v7, "cpuInstructionsKI");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "unsignedLongLongValue");
            objc_msgSend((id)v5, "cpuInstructionsKI");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%s Delta:\t%lld %s\n"), "CPU Instructions", v29 - objc_msgSend(v30, "unsignedLongLongValue"), "kI");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v8, "appendString:", v31);

          }
          objc_msgSend((id)v7, "dirtyMemoryKB");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "unsignedLongLongValue");
          objc_msgSend((id)v5, "dirtyMemoryKB");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "unsignedLongLongValue");

          if (v33 != v35)
          {
            v36 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)v7, "dirtyMemoryKB");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "unsignedLongLongValue");
            objc_msgSend((id)v5, "dirtyMemoryKB");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", CFSTR("%s Delta:\t%lld %s\n"), "Dirty Memory", v38 - objc_msgSend(v39, "unsignedLongLongValue"), "kB");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v8, "appendString:", v40);

          }
          objc_msgSend((id)v7, "dirtyMemoryLifetimePeakKB");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "unsignedLongLongValue");
          objc_msgSend((id)v5, "dirtyMemoryLifetimePeakKB");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "unsignedLongLongValue");

          if (v42 != v44)
          {
            v45 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)v7, "dirtyMemoryLifetimePeakKB");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "unsignedLongLongValue");
            objc_msgSend((id)v5, "dirtyMemoryLifetimePeakKB");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR("%s Delta:\t%lld %s\n"), "Dirty Memory (Peak)", v47 - objc_msgSend(v48, "unsignedLongLongValue"), "kB");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v8, "appendString:", v49);

          }
          objc_msgSend((id)v7, "storageDirtiedKB");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "unsignedLongLongValue");
          objc_msgSend((id)v5, "storageDirtiedKB");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "unsignedLongLongValue");

          if (v51 != v53)
          {
            v54 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend((id)v7, "storageDirtiedKB");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "unsignedLongLongValue");
            objc_msgSend((id)v5, "storageDirtiedKB");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringWithFormat:", CFSTR("%s Delta:\t%lld %s\n"), "Dirtied Storage", v56 - objc_msgSend(v57, "unsignedLongLongValue"), "kB");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v8, "appendString:", v58);

          }
        }
      }
      else
      {
        v8 = CFSTR("No begin event metrics");
      }
    }
    else
    {
      v8 = CFSTR("No end event metrics");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nPerformance Metrics Deltas:\n%@\n\n"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E4610268;
  }

  return v9;
}

- (NSData)binarySnapshot
{
  return self->_binarySnapshot;
}

- (NSNumber)cpuTimeNsec
{
  return self->_cpuTimeNsec;
}

- (NSNumber)dirtyMemoryKB
{
  return self->_dirtyMemoryKB;
}

- (NSNumber)dirtyMemoryLifetimePeakKB
{
  return self->_dirtyMemoryLifetimePeakKB;
}

- (NSNumber)storageDirtiedKB
{
  return self->_storageDirtiedKB;
}

- (NSNumber)cpuInstructionsKI
{
  return self->_cpuInstructionsKI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuInstructionsKI, 0);
  objc_storeStrong((id *)&self->_storageDirtiedKB, 0);
  objc_storeStrong((id *)&self->_dirtyMemoryLifetimePeakKB, 0);
  objc_storeStrong((id *)&self->_dirtyMemoryKB, 0);
  objc_storeStrong((id *)&self->_cpuTimeNsec, 0);
  objc_storeStrong((id *)&self->_binarySnapshot, 0);
}

+ (void)_newMetricsFromData:(NSObject *)a3 .cold.1(char a1, void *a2, NSObject *a3)
{
  __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
  {
    objc_msgSend(a2, "localizedDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Unknown");
  }
  v6 = 136315394;
  v7 = "+[SignpostMetrics _newMetricsFromData:]";
  v8 = 2112;
  v9 = v5;
  OUTLINED_FUNCTION_6(&dword_1A1A28000, a3, (uint64_t)a3, "%s: Error deserializing: %@", (uint8_t *)&v6);
  if ((a1 & 1) != 0)

}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "%s: Could not find metrics dictionary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "%s: Expected dictionary as third level plist object", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "%s: Expected dictionary as second level plist object", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "%s: Unexpected number of process snapshots", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "%s: Expected array as top level plist object", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
