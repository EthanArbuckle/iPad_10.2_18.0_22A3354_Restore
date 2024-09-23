@implementation SignpostAggregationGroup

- (id)_initWithName:(id)a3 count:(unint64_t)a4 countUnit:(id)a5 telemetryEnabled:(BOOL)a6
{
  id v11;
  id v12;
  SignpostAggregationGroup *v13;
  SignpostAggregationGroup *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SignpostAggregationGroup;
  v13 = -[SignpostAggregationGroup init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_count = a4;
    objc_storeStrong((id *)&v13->_countUnit, a5);
    objc_storeStrong((id *)&v14->_name, a3);
    v14->_telemetryEnabled = a6;
  }

  return v14;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v42[0] = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostAggregationGroup count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = kAggTelemetryEnabledKey;
  v43[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v16, "_dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "type");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, kAggDurationDictKey);
  }
  -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          objc_msgSend(v28, "_dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v25);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, kAggMeasuredValueDictKey);
  }
  return v6;
}

- (id)_coreAnalyticsFieldName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostAggregationGroup name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__TotalCount"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)addToPayloadDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostAggregationGroup count](self, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAggregationGroup _coreAnalyticsFieldName](self, "_coreAnalyticsFieldName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          _addToPayloadDictionary(v4, *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          _addToPayloadDictionary(v4, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostAggregationGroup *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = [SignpostAggregationGroup alloc];
  -[SignpostAggregationGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SignpostAggregationGroup count](self, "count");
  -[SignpostAggregationGroup countUnit](self, "countUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SignpostAggregationGroup _initWithName:count:countUnit:telemetryEnabled:](v4, "_initWithName:count:countUnit:telemetryEnabled:", v5, v6, v7, -[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __41__SignpostAggregationGroup_copyWithZone___block_invoke;
  v22[3] = &unk_1E4601550;
  v12 = v9;
  v23 = v12;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);

  if (objc_msgSend(v12, "count"))
    objc_msgSend(v8, "setDurationTypeToDurationDict:", v12);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v18 = 3221225472;
  v19 = __41__SignpostAggregationGroup_copyWithZone___block_invoke_2;
  v20 = &unk_1E4601578;
  v15 = v13;
  v21 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v17);

  if (objc_msgSend(v15, "count", v17, v18, v19, v20))
    objc_msgSend(v8, "setMeasuredValueTypeToMeasuredValueDict:", v15);

  return v8;
}

void __41__SignpostAggregationGroup_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __41__SignpostAggregationGroup_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)_initWithMetadataSegment:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  SignpostAggregationGroup *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v38;
  SignpostAggregationGroup *v39;
  id *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "typeNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("signpost.aggregation"));

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = CFSTR("Invalid type namespace for aggregation group");
LABEL_28:
      objc_msgSend(v31, "errorWithCode:description:", 9, v32);
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_29:
    v30 = 0;
    goto LABEL_41;
  }
  objc_msgSend(v6, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("count"));

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = CFSTR("Invalid type for aggregation group");
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v6, "placeholderTokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v12)
  {

    v33 = 0;
    if (!a4)
    {
LABEL_48:
      v15 = 0;
      v29 = 0;
      v30 = 0;
      goto LABEL_40;
    }
LABEL_31:
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("No 'group' specified for aggregation group"));
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v34;
    v15 = 0;
    v29 = 0;
    v30 = 0;
    *a4 = v35;
    goto LABEL_40;
  }
  v13 = v12;
  v39 = self;
  v40 = a4;
  v41 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v43 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      _stringAfterPrefix(v18, (uint64_t)CFSTR("group="));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = v19;
        _checkTokenString(v19);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v36 = (void *)v21;
          self = v39;
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v21);
            *v40 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          if (!v15)
          {
            v15 = v20;
            continue;
          }
          self = v39;
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("'group' specified multiple times for aggregation group"));
            *v40 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

LABEL_38:
        v29 = 0;
        v30 = 0;
LABEL_39:
        v33 = v41;
        goto LABEL_40;
      }
      _stringAfterPrefix(v18, (uint64_t)CFSTR("unit="));
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        if (v41)
        {
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("'unit' specified multiple times for aggregation group"));
            *v40 = (id)objc_claimAutoreleasedReturnValue();
          }

          self = v39;
          goto LABEL_38;
        }
        v41 = (void *)v22;
      }
      else
      {
        v24 = objc_msgSend(v18, "isEqualToString:", CFSTR("telemetry=enabled"));
        if ((v24 & v14) == 1)
        {
          self = v39;
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("'telemetry=enabled' specified multiple times for aggregation group"));
            *v40 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_38;
        }
        v14 |= v24;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v13)
      continue;
    break;
  }

  if (!v15)
  {
    self = v39;
    a4 = v40;
    v33 = v41;
    if (!v40)
      goto LABEL_48;
    goto LABEL_31;
  }
  if (v41)
  {
    objc_msgSend(v6, "argument");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "type");

    if (v26 == 3)
    {
      objc_msgSend(v6, "argument");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "argumentObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v28;
        self = (SignpostAggregationGroup *)-[SignpostAggregationGroup _initWithName:count:countUnit:telemetryEnabled:](v39, "_initWithName:count:countUnit:telemetryEnabled:", v15, objc_msgSend(v29, "unsignedLongLongValue"), v41, v14 & 1);
        v30 = self;
      }
      else
      {
        if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Unexpected argument type for specified for aggregation group"));
          v29 = 0;
          v30 = 0;
          *v40 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
          v30 = 0;
        }
        self = v39;
      }

    }
    else
    {
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Unexpected argument type for specified for aggregation group"));
        v29 = 0;
        v30 = 0;
        *v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
        v30 = 0;
      }
      self = v39;
    }
    goto LABEL_39;
  }
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("No 'unit' specified for aggregation group"));
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v29 = 0;
    v30 = 0;
    *v40 = v38;
  }
  else
  {
    v33 = 0;
    v29 = 0;
    v30 = 0;
  }
  self = v39;
LABEL_40:

LABEL_41:
  return v30;
}

+ (id)_sumOfGroup0:(id)a3 group1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Tried to add two nil groups"));
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_17;
  }
  if (v7 && !v8)
  {
    v8 = v7;
LABEL_9:
    v10 = (id)objc_msgSend((id)v8, "copy");
    goto LABEL_17;
  }
  if (!v7 && v8)
    goto LABEL_9;
  v11 = (void *)objc_msgSend((id)v7, "copy");
  objc_msgSend(v11, "_addGroup:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
    *a5 = objc_retainAutorelease(v12);
  if (v13)
    v10 = 0;
  else
    v10 = v11;

LABEL_17:
  return v10;
}

- (id)_addGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSDictionary *durationTypeToDurationDict;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  NSDictionary *measuredValueTypeToMeasuredValueDict;
  NSDictionary *v71;
  id obj;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v12 = 0;
    goto LABEL_10;
  }
  -[SignpostAggregationGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostAggregationGroup name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Tried to add groups with different names: %@ vs. %@"), v14, v15);
LABEL_9:
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  -[SignpostAggregationGroup countUnit](self, "countUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostAggregationGroup countUnit](self, "countUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countUnit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Tried to add groups with same names but different units: %@ vs. %@"), v14, v15);
    goto LABEL_9;
  }
  v11 = -[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled");
  if (v11 == objc_msgSend(v4, "telemetryEnabled"))
  {
    -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0x1E0C99000uLL;
    v21 = 0x1E0C99000uLL;
    if (objc_msgSend(v19, "count"))
    {

    }
    else
    {
      objc_msgSend(v4, "durationTypeToDurationDict");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (!v23)
        goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObjectsFromArray:", v28);

    }
    objc_msgSend(v4, "durationTypeToDurationDict");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      objc_msgSend(v4, "durationTypeToDurationDict");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObjectsFromArray:", v32);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v71 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v24;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v81;
LABEL_20:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v81 != v35)
          objc_enumerationMutation(obj);
        v37 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v36);
        -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "durationTypeToDurationDict");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = 0;
        +[SignpostAggregationGroupDuration _sumOfDuration0:duration1:errorOut:](SignpostAggregationGroupDuration, "_sumOfDuration0:duration1:errorOut:", v39, v41, &v79);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v79;
        v44 = v43;
        if (v43)
          v73 = v43;
        else
          -[NSDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v42, v37);

        if (v44)
          goto LABEL_50;
        if (v34 == ++v36)
        {
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
          if (v34)
            goto LABEL_20;
          break;
        }
      }
    }

    durationTypeToDurationDict = self->_durationTypeToDurationDict;
    self->_durationTypeToDurationDict = v71;

    v21 = 0x1E0C99000;
    v20 = 0x1E0C99000;
LABEL_30:
    -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count"))
    {

    }
    else
    {
      objc_msgSend(v4, "measuredValueTypeToMeasuredValueDict");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (!v48)
        goto LABEL_49;
    }
    objc_msgSend(*(id *)(v20 + 3616), "set");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");

    if (v51)
    {
      -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "allKeys");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObjectsFromArray:", v53);

    }
    objc_msgSend(v4, "measuredValueTypeToMeasuredValueDict");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "count");

    if (v55)
    {
      objc_msgSend(v4, "measuredValueTypeToMeasuredValueDict");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "allKeys");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObjectsFromArray:", v57);

    }
    objc_msgSend(*(id *)(v21 + 3592), "dictionary");
    v71 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v49;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v76;
LABEL_39:
      v61 = 0;
      while (1)
      {
        if (*(_QWORD *)v76 != v60)
          objc_enumerationMutation(obj);
        v62 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v61);
        -[SignpostAggregationGroup measuredValueTypeToMeasuredValueDict](self, "measuredValueTypeToMeasuredValueDict");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "measuredValueTypeToMeasuredValueDict");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v62);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = 0;
        +[SignpostAggregationGroupMeasuredValue _sumOfValue0:value1:errorOut:](SignpostAggregationGroupMeasuredValue, "_sumOfValue0:value1:errorOut:", v64, v66, &v74);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v74;
        v69 = v68;
        if (v68)
          v73 = v68;
        else
          -[NSDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v67, v62);

        if (v69)
          break;
        if (v59 == ++v61)
        {
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
          if (v59)
            goto LABEL_39;
          goto LABEL_48;
        }
      }
LABEL_50:

      v12 = v73;
      goto LABEL_10;
    }
LABEL_48:

    measuredValueTypeToMeasuredValueDict = self->_measuredValueTypeToMeasuredValueDict;
    self->_measuredValueTypeToMeasuredValueDict = v71;

LABEL_49:
    v12 = 0;
    self->_count += objc_msgSend(v4, "count");
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Cannot add aggregation groups with different telemetry settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SignpostAggregationGroup *v5;
  SignpostAggregationGroup *v6;
  SignpostAggregationGroup *v7;
  unint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v5 = (SignpostAggregationGroup *)a3;
  v6 = v5;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_9;
  }
  if (v5 == self)
  {
    v10 = 1;
    goto LABEL_9;
  }
  v7 = v5;
  v8 = -[SignpostAggregationGroup count](self, "count");
  if (v8 != -[SignpostAggregationGroup count](v7, "count"))
    goto LABEL_5;
  v9 = -[SignpostAggregationGroup telemetryEnabled](self, "telemetryEnabled");
  if (v9 != -[SignpostAggregationGroup telemetryEnabled](v7, "telemetryEnabled"))
    goto LABEL_5;
  -[SignpostAggregationGroup name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroup name](v7, "name");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {

    goto LABEL_25;
  }
  v14 = (void *)v13;
  -[SignpostAggregationGroup name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SignpostAggregationGroup name](v7, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
      goto LABEL_28;
  }
  -[SignpostAggregationGroup name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 || (-[SignpostAggregationGroup name](v7, "name"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SignpostAggregationGroup name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAggregationGroup name](v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v17, "isEqual:", v18) ^ 1;

    if (v16)
    {

      goto LABEL_22;
    }
    v19 = 0;
  }
  else
  {
    v3 = 1;
  }

LABEL_22:
  if (v15)
  {

  }
  if ((v3 & 1) != 0)
    goto LABEL_5;
LABEL_25:
  -[SignpostAggregationGroup countUnit](self, "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroup countUnit](v7, "countUnit");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v20)
  {

    goto LABEL_40;
  }
  v14 = (void *)v20;
  -[SignpostAggregationGroup countUnit](self, "countUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15
    || (-[SignpostAggregationGroup countUnit](v7, "countUnit"),
        (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SignpostAggregationGroup countUnit](self, "countUnit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      || (-[SignpostAggregationGroup countUnit](v7, "countUnit"),
          (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SignpostAggregationGroup countUnit](self, "countUnit");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregationGroup countUnit](v7, "countUnit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v22, "isEqual:", v23) ^ 1;

      if (v21)
      {

        v24 = v35;
        if (!v15)
        {
LABEL_39:

          if ((v3 & 1) != 0)
            goto LABEL_5;
LABEL_40:
          -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationGroup durationTypeToDurationDict](v7, "durationTypeToDurationDict");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v26 == (void *)v27)
          {

            goto LABEL_55;
          }
          v28 = (void *)v27;
          -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            -[SignpostAggregationGroup durationTypeToDurationDict](v7, "durationTypeToDurationDict");
            v3 = objc_claimAutoreleasedReturnValue();
            if (!v3)
            {
              LOBYTE(v30) = 1;
              goto LABEL_54;
            }
          }
          -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31
            || (-[SignpostAggregationGroup durationTypeToDurationDict](v7, "durationTypeToDurationDict"),
                (v34 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SignpostAggregationGroup durationTypeToDurationDict](v7, "durationTypeToDurationDict");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v32, "isEqual:", v33) ^ 1;

            if (v31)
            {

              if (v29)
                goto LABEL_54;
              goto LABEL_48;
            }
            v34 = 0;
          }
          else
          {
            v30 = 1;
          }

          if (v29)
          {
LABEL_54:

            if ((v30 & 1) != 0)
              goto LABEL_5;
            goto LABEL_55;
          }
LABEL_48:

          if (v30)
            goto LABEL_5;
LABEL_55:
          v10 = 1;
          goto LABEL_6;
        }
LABEL_38:

        goto LABEL_39;
      }
      v25 = 0;
    }
    else
    {
      v3 = 1;
    }
    v24 = v35;

    if (!v15)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_28:

LABEL_5:
  v10 = 0;
LABEL_6:

LABEL_9:
  return v10;
}

- (double)countPerNs
{
  void *v3;
  unint64_t v4;

  -[SignpostAggregationGroup parentAggregation](self, "parentAggregation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "durationNs");

  if (v4)
    return (double)-[SignpostAggregationGroup count](self, "count") / (double)v4;
  else
    return 0.0;
}

- (double)countPerMs
{
  double v2;

  -[SignpostAggregationGroup countPerNs](self, "countPerNs");
  return v2 * 1000000.0;
}

- (double)countPerSecond
{
  double v2;

  -[SignpostAggregationGroup countPerNs](self, "countPerNs");
  return v2 * 1000000000.0;
}

- (id)_telemetryEnabledGroupDurations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SignpostAggregationGroup durationTypeToDurationDict](self, "durationTypeToDurationDict", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "telemetryEnabled"))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;

  return v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)countUnit
{
  return self->_countUnit;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (NSDictionary)durationTypeToDurationDict
{
  return self->_durationTypeToDurationDict;
}

- (void)setDurationTypeToDurationDict:(id)a3
{
  objc_storeStrong((id *)&self->_durationTypeToDurationDict, a3);
}

- (NSDictionary)measuredValueTypeToMeasuredValueDict
{
  return self->_measuredValueTypeToMeasuredValueDict;
}

- (void)setMeasuredValueTypeToMeasuredValueDict:(id)a3
{
  objc_storeStrong((id *)&self->_measuredValueTypeToMeasuredValueDict, a3);
}

- (SignpostAggregation)parentAggregation
{
  return (SignpostAggregation *)objc_loadWeakRetained((id *)&self->_parentAggregation);
}

- (void)setParentAggregation:(id)a3
{
  objc_storeWeak((id *)&self->_parentAggregation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAggregation);
  objc_storeStrong((id *)&self->_measuredValueTypeToMeasuredValueDict, 0);
  objc_storeStrong((id *)&self->_durationTypeToDurationDict, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_countUnit, 0);
}

@end
