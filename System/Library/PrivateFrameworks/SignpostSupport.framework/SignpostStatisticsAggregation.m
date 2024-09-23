@implementation SignpostStatisticsAggregation

+ (id)statisticsAggregationForObjects:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSignpostObjects:tier:", v4, 0);

  return v5;
}

uint64_t __65__SignpostStatisticsAggregation_statisticsAggregationForObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "beginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)aggregationForTimeInterval:(id)a3 containedOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SignpostStatisticsAggregation aggregatedSignpostObjects](self, "aggregatedSignpostObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "startMachContinuousTime");
      if (v14 >= objc_msgSend(v6, "endMachContinuousTime"))
        goto LABEL_16;
      v15 = objc_msgSend(v13, "startMachContinuousTime");
      v16 = objc_msgSend(v6, "startMachContinuousTime");
      v17 = v15 >= v16;
      if (v4)
        goto LABEL_10;
      if (v15 < v16)
        break;
LABEL_13:
      objc_msgSend(v7, "addObject:", v13);
LABEL_14:
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    v18 = objc_msgSend(v13, "endMachContinuousTime");
    v17 = v18 >= objc_msgSend(v6, "startMachContinuousTime");
LABEL_10:
    if (!v17)
      goto LABEL_14;
    v19 = objc_msgSend(v13, "endMachContinuousTime");
    if (v19 > objc_msgSend(v6, "endMachContinuousTime"))
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_16:

  v20 = -[SignpostStatisticsAggregation _initWithSignpostObjects:tier:]([SignpostStatisticsAggregation alloc], "_initWithSignpostObjects:tier:", v7, -[SignpostStatisticsAggregation tier](self, "tier"));
  return v20;
}

- (void)_calculateStats
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  float v8;
  double v9;
  unint64_t v10;
  float v11;
  double v12;
  void *v13;
  unint64_t v14;
  float v15;
  double v16;
  unint64_t v17;

  -[SignpostStatisticsAggregation aggregatedSignpostObjects](self, "aggregatedSignpostObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SignpostStatisticsAggregation aggregatedSignpostObjects](self, "aggregatedSignpostObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_count = objc_msgSend(v5, "count");

    -[SignpostStatisticsAggregation aggregatedSignpostObjects](self, "aggregatedSignpostObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = SignpostSupportTotalDurationMachContinuousTimeForIntervals(v6);
    -[SignpostStatisticsAggregation timeBaseRatio](self, "timeBaseRatio");
    v9 = (double)v7 * v8;
    *(float *)&v9 = (float)(unint64_t)v9;
    self->_totalDuration.mct = v7;
    self->_totalDuration.ns = *(float *)&v9;
    *(float64x2_t *)&self->_totalDuration.ms = vcvtq_f64_f32(vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v9, 0), (float32x2_t)0x4E6E6B2849742400));

    -[SignpostStatisticsAggregation totalDuration](self, "totalDuration");
    v10 = v17 / -[SignpostStatisticsAggregation count](self, "count");
    -[SignpostStatisticsAggregation timeBaseRatio](self, "timeBaseRatio");
    v12 = (double)v10 * v11;
    *(float *)&v12 = (float)(unint64_t)v12;
    self->_averageDuration.mct = v10;
    self->_averageDuration.ns = *(float *)&v12;
    *(float64x2_t *)&self->_averageDuration.ms = vcvtq_f64_f32(vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v12, 0), (float32x2_t)0x4E6E6B2849742400));
    -[SignpostStatisticsAggregation aggregatedSignpostObjects](self, "aggregatedSignpostObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = SignpostSupportStdDevMachContinuousTimeForIntervals(v13);
    -[SignpostStatisticsAggregation timeBaseRatio](self, "timeBaseRatio");
    v16 = (double)v14 * v15;
    *(float *)&v16 = (float)(unint64_t)v16;
    self->_stddevDuration.mct = v14;
    self->_stddevDuration.ns = *(float *)&v16;
    *(float64x2_t *)&self->_stddevDuration.ms = vcvtq_f64_f32(vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v16, 0), (float32x2_t)0x4E6E6B2849742400));

  }
}

- (NSString)tierString
{
  unsigned int v2;

  v2 = -[SignpostStatisticsAggregation tier](self, "tier");
  if (v2 > 3)
    return (NSString *)CFSTR("Unknown");
  else
    return &off_1E4601218[(char)v2]->isa;
}

- (id)_initWithSignpostObjects:(id)a3 tier:(unsigned __int8)a4
{
  int v4;
  id v7;
  SignpostStatisticsAggregation *v8;
  SignpostStatisticsAggregation *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  NSString *subsystem;
  void *v15;
  uint64_t v16;
  NSString *category;
  void *v18;
  uint64_t v19;
  NSString *name;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSDictionary *v33;
  NSDictionary *aggregationIdentifierToChildAggregationDict;
  NSDictionary *v35;
  SignpostStatisticsAggregation *v37;
  id v38;
  _QWORD v39[4];
  NSDictionary *v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SignpostStatisticsAggregation;
  v8 = -[SignpostStatisticsAggregation init](&v46, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_aggregatedSignpostObjects, a3);
    v9->_tier = v4;
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timebaseRatio");
    *(float *)&v11 = v11;
    v9->_timeBaseRatio = *(float *)&v11;

    if (-[SignpostStatisticsAggregation tier](v9, "tier"))
    {
      objc_msgSend(v7, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subsystem");
      v13 = objc_claimAutoreleasedReturnValue();
      subsystem = v9->_subsystem;
      v9->_subsystem = (NSString *)v13;

    }
    if (-[SignpostStatisticsAggregation tier](v9, "tier") >= 2)
    {
      objc_msgSend(v7, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "category");
      v16 = objc_claimAutoreleasedReturnValue();
      category = v9->_category;
      v9->_category = (NSString *)v16;

    }
    if (-[SignpostStatisticsAggregation tier](v9, "tier") >= 3)
    {
      objc_msgSend(v7, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = objc_claimAutoreleasedReturnValue();
      name = v9->_name;
      v9->_name = (NSString *)v19;

    }
    -[SignpostStatisticsAggregation _calculateStats](v9, "_calculateStats");
    if (-[SignpostStatisticsAggregation tier](v9, "tier") != 3)
    {
      v37 = v9;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v38 = v7;
      v22 = v7;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (!v23)
        goto LABEL_26;
      v24 = v23;
      v25 = *(_QWORD *)v43;
      while (1)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v22);
          v27 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
          v28 = v27;
          switch(v4)
          {
            case 2:
              objc_msgSend(v27, "name");
              v29 = objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            case 1:
              objc_msgSend(v27, "category");
              v29 = objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            case 0:
              objc_msgSend(v27, "subsystem");
              v29 = objc_claimAutoreleasedReturnValue();
LABEL_20:
              v30 = (void *)v29;
              goto LABEL_22;
          }
          v30 = 0;
LABEL_22:

          objc_msgSend(v21, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, v30);
          }
          objc_msgSend(v31, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (!v24)
        {
LABEL_26:

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __63__SignpostStatisticsAggregation__initWithSignpostObjects_tier___block_invoke;
          v39[3] = &unk_1E46011D0;
          v41 = v4 + 1;
          v33 = v32;
          v40 = v33;
          objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v39);
          v9 = v37;
          aggregationIdentifierToChildAggregationDict = v37->_aggregationIdentifierToChildAggregationDict;
          v37->_aggregationIdentifierToChildAggregationDict = v33;
          v35 = v33;

          v7 = v38;
          break;
        }
      }
    }
  }

  return v9;
}

void __63__SignpostStatisticsAggregation__initWithSignpostObjects_tier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[SignpostStatisticsAggregation _initWithSignpostObjects:tier:]([SignpostStatisticsAggregation alloc], "_initWithSignpostObjects:tier:", v5, *(unsigned __int8 *)(a1 + 40));

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

- (id)_dictRepresentation
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
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[5];
  _QWORD v34[6];

  v34[5] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostStatisticsAggregation count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  v33[1] = CFSTR("averageDurationNs");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostStatisticsAggregation averageDuration](self, "averageDuration");
  objc_msgSend(v4, "numberWithDouble:", v32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v5;
  v33[2] = CFSTR("totalDurationNs");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostStatisticsAggregation totalDuration](self, "totalDuration");
  objc_msgSend(v6, "numberWithDouble:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v7;
  v33[3] = CFSTR("stddevDurationNs");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostStatisticsAggregation stddevDuration](self, "stddevDuration");
  objc_msgSend(v8, "numberWithDouble:", v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v9;
  v33[4] = CFSTR("tier");
  -[SignpostStatisticsAggregation tierString](self, "tierString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[SignpostStatisticsAggregation subsystem](self, "subsystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SignpostStatisticsAggregation subsystem](self, "subsystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("subsystem"));

  }
  -[SignpostStatisticsAggregation category](self, "category");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SignpostStatisticsAggregation category](self, "category");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("category"));

  }
  -[SignpostStatisticsAggregation name](self, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SignpostStatisticsAggregation name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("name"));

  }
  -[SignpostStatisticsAggregation aggregationIdentifierToChildAggregationDict](self, "aggregationIdentifierToChildAggregationDict");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostStatisticsAggregation aggregationIdentifierToChildAggregationDict](self, "aggregationIdentifierToChildAggregationDict");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __52__SignpostStatisticsAggregation__dictRepresentation__block_invoke;
    v28 = &unk_1E46011F8;
    v29 = v21;
    v23 = v21;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v25);

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("childAggregations"), v25, v26, v27, v28);
  }
  return v12;
}

void __52__SignpostStatisticsAggregation__dictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "_dictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)jsonDescription:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  -[SignpostStatisticsAggregation _dictRepresentation](self, "_dictRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, a3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v5)
  {
    _signpost_debug_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SignpostStatisticsAggregation jsonDescription:].cold.1(v6, v7);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);

  return v8;
}

- (id)debugDescription
{
  return -[SignpostStatisticsAggregation jsonDescription:](self, "jsonDescription:", 1);
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)aggregatedSignpostObjects
{
  return self->_aggregatedSignpostObjects;
}

- (NSString)aggregationIdentifier
{
  return self->_aggregationIdentifier;
}

- (NSDictionary)aggregationIdentifierToChildAggregationDict
{
  return self->_aggregationIdentifierToChildAggregationDict;
}

- (unsigned)tier
{
  return self->_tier;
}

- (unint64_t)count
{
  return self->_count;
}

- ($BFD0544783004B6329B091033EEA470A)totalDuration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- ($BFD0544783004B6329B091033EEA470A)averageDuration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- ($BFD0544783004B6329B091033EEA470A)stddevDuration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (float)timeBaseRatio
{
  return self->_timeBaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationIdentifierToChildAggregationDict, 0);
  objc_storeStrong((id *)&self->_aggregationIdentifier, 0);
  objc_storeStrong((id *)&self->_aggregatedSignpostObjects, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (void)jsonDescription:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Unknown");
  if (v3)
    v5 = (const __CFString *)v3;
  v6 = 138412290;
  v7 = v5;
  _os_log_debug_impl(&dword_1A1A28000, a2, OS_LOG_TYPE_DEBUG, "ERROR: Could not encode SignpostStatisticsAggregation as JSON: %@", (uint8_t *)&v6, 0xCu);

}

@end
