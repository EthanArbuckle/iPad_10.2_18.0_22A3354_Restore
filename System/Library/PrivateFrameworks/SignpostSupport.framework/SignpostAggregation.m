@implementation SignpostAggregation

- (void)dropRawIntervals
{
  NSArray *v3;
  NSArray *rawIntervals;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rawIntervals = self->_rawIntervals;
  self->_rawIntervals = v3;

}

- (id)_handleCountSegment:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v4 = a3;
  v18 = 0;
  v5 = -[SignpostAggregationGroup _initWithMetadataSegment:errorOut:]([SignpostAggregationGroup alloc], "_initWithMetadataSegment:errorOut:", v4, &v18);

  v6 = v18;
  v7 = v6;
  if (v5)
  {
    -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Duplicate group: '%@'"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, v16);

      v14 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      if (_unknownAggregationError_onceToken != -1)
        dispatch_once(&_unknownAggregationError_onceToken, &__block_literal_global_646);
      v7 = (id)_unknownAggregationError_unknownAggregationError;
    }
    v7 = v7;
    v14 = v7;
  }

  return v14;
}

- (id)_updateValueDict:(id)a3 withParser:(id)a4 placeholderType:(unsigned __int8)a5 class:(Class)a6
{
  int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  const __CFString *v22;
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
  void *v39;

  v6 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

  }
  objc_msgSend(v9, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithParser:", v9);
    if (!v14)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("Failed to init duration/value");
LABEL_22:
      objc_msgSend(v21, "errorWithCode:description:", 9, v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    objc_msgSend(v9, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v15);

  }
  objc_msgSend(v9, "unit");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_8;
  v17 = (void *)v16;
  objc_msgSend(v9, "unit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "unit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Mismatched unit values: %@ vs. %@"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    switch(v6)
    {
      case 0:
      case 1:
      case 12:
      case 13:
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = CFSTR("Unexpected placeholder type");
        goto LABEL_22;
      case 2:
      case 7:
        objc_msgSend(v14, "stats");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_rawTotal");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Collision on stats property: '_rawTotal'");
          goto LABEL_22;
        }
        objc_msgSend(v9, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stats");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "set_rawTotal:", v38);
        goto LABEL_28;
      case 3:
      case 8:
        objc_msgSend(v14, "stats");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_rawAverage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Collision on stats property: '_rawAverage'");
          goto LABEL_22;
        }
        objc_msgSend(v9, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stats");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "set_rawAverage:", v38);
        goto LABEL_28;
      case 4:
      case 9:
        objc_msgSend(v14, "stats");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "min");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Collision on stats property: 'min'");
          goto LABEL_22;
        }
        objc_msgSend(v9, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stats");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setMin:", v38);
        goto LABEL_28;
      case 5:
      case 10:
        objc_msgSend(v14, "stats");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "max");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Collision on stats property: 'max'");
          goto LABEL_22;
        }
        objc_msgSend(v9, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stats");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setMax:", v38);
        goto LABEL_28;
      case 6:
      case 11:
        objc_msgSend(v14, "stats");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stddev");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Collision on stats property: 'stddev'");
          goto LABEL_22;
        }
        objc_msgSend(v9, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stats");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setStddev:", v38);
LABEL_28:

LABEL_29:
        if ((objc_msgSend(v14, "telemetryEnabled") & 1) == 0)
          objc_msgSend(v14, "setTelemetryEnabled:", objc_msgSend(v9, "telemetryEnabled"));
        v27 = 0;
        break;
      default:
        goto LABEL_29;
    }
  }
LABEL_32:

  return v27;
}

- (id)_handleValueSegment:(id)a3 placeholderType:(unsigned __int8)a4 parser:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((v6 - 7) < 5)
  {
    -[SignpostAggregation _groupToTypeToMeasuredValue](self, "_groupToTypeToMeasuredValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((v6 - 2) <= 4)
  {
    -[SignpostAggregation _groupToTypeToDuration](self, "_groupToTypeToDuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = objc_opt_class();
    goto LABEL_6;
  }
  v11 = 0;
  v10 = 0;
LABEL_6:
  objc_msgSend(v9, "processSegment:placeholderType:", v8, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[SignpostAggregation _updateValueDict:withParser:placeholderType:class:](self, "_updateValueDict:withParser:placeholderType:class:", v10, v9, v6, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_clearFields");
  }

  return v14;
}

- (id)_processDescription:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *aggregationDescription;

  v4 = a3;
  objc_msgSend(v4, "argument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Description specified multiple times"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "argument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "argumentObject");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      aggregationDescription = self->_aggregationDescription;
      self->_aggregationDescription = v11;

      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected argument type for 'signpost.aggregation:description'"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_processMetadataSegment:(id)a3 parser:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = _placeholderTypeForSegment(v6);
  if ((v8 - 2) >= 0xA)
  {
    if ((_DWORD)v8 == 12)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Unknown aggregation namespace type '%@'"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    if ((_DWORD)v8 == 1)
    {
      -[SignpostAggregation _handleCountSegment:](self, "_handleCountSegment:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_DWORD)v8)
      {
        v10 = 0;
        goto LABEL_4;
      }
      -[SignpostAggregation _processDescription:](self, "_processDescription:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[SignpostAggregation _handleValueSegment:placeholderType:parser:](self, "_handleValueSegment:placeholderType:parser:", v6, v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_4:

  return v10;
}

- (void)_fixupGroupsAndDurationsWithErrors:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  SignpostAggregation *v75;
  uint64_t v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  -[SignpostAggregation _groupToTypeToDuration](self, "_groupToTypeToDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    -[SignpostAggregation _groupToTypeToMeasuredValue](self, "_groupToTypeToMeasuredValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      goto LABEL_52;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  -[SignpostAggregation _groupToTypeToDuration](self, "_groupToTypeToDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  v71 = v10;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v95 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Group '%@' was specified by one or more durations but has no count"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObject:", v19);

          v10 = v71;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    }
    while (v14);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[SignpostAggregation _groupToTypeToMeasuredValue](self, "_groupToTypeToMeasuredValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v91 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
        if ((objc_msgSend(v10, "containsObject:", v26) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Group '%@' was specified by one or more measured values but has no count"), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObject:", v28);

          v10 = v71;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    }
    while (v23);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v30;
  v72 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
  if (v72)
  {
    v70 = *(_QWORD *)v87;
    v75 = self;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v87 != v70)
          objc_enumerationMutation(obj);
        v76 = v31;
        v32 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v31);
        objc_msgSend(v32, "setParentAggregation:", self);
        -[SignpostAggregation _groupToTypeToDuration](self, "_groupToTypeToDuration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v35, "count"))
        {
          objc_msgSend(v32, "setDurationTypeToDurationDict:", v35);
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v73 = v35;
          objc_msgSend(v35, "allValues");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v83;
            do
            {
              for (k = 0; k != v38; ++k)
              {
                if (*(_QWORD *)v83 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v32, "count"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stats");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setCount:", v42);

                objc_msgSend(v41, "stats");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "_finalizeState");
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                if (v45)
                {
                  v46 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v41, "groupName");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "type");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "stringWithFormat:", CFSTR("Group '%@', duration type '%@': %@"), v47, v48, v45);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v49);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "addObject:", v50);

                }
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
            }
            while (v38);
          }

          v35 = v73;
          self = v75;
        }

        -[SignpostAggregation _groupToTypeToMeasuredValue](self, "_groupToTypeToMeasuredValue");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v53, "count"))
        {
          objc_msgSend(v32, "setMeasuredValueTypeToMeasuredValueDict:", v53);
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v74 = v53;
          objc_msgSend(v53, "allValues");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v78, v98, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v79;
            do
            {
              for (m = 0; m != v56; ++m)
              {
                if (*(_QWORD *)v79 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * m);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v32, "count"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "stats");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "setCount:", v60);

                objc_msgSend(v59, "stats");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "_finalizeState");
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                if (v63)
                {
                  v64 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v59, "groupName");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "type");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "stringWithFormat:", CFSTR("Group '%@', measured value type '%@': %@"), v65, v66, v63);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "addObject:", v68);

                }
              }
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v78, v98, 16);
            }
            while (v56);
          }

          v53 = v74;
          self = v75;
        }

        v31 = v76 + 1;
      }
      while (v76 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
    }
    while (v72);
  }

  -[SignpostAggregation set_groupToTypeToDuration:](self, "set_groupToTypeToDuration:", 0);
  -[SignpostAggregation set_groupToTypeToMeasuredValue:](self, "set_groupToTypeToMeasuredValue:", 0);

LABEL_52:
}

- (id)_processInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _SignpostAggregationValueSegmentParser *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v10 = objc_alloc_init(_SignpostAggregationValueSegmentParser);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "beginEvent", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadataSegments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          -[SignpostAggregation _processMetadataSegment:parser:](self, "_processMetadataSegment:parser:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v5, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("No valid aggregation groups provided"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v20);

    }
    -[SignpostAggregation _fixupGroupsAndDurationsWithErrors:](self, "_fixupGroupsAndDurationsWithErrors:", v5);
    if (objc_msgSend(v5, "count"))
      v9 = v5;
    else
      v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Aggregations must be a time interval represented by a single event"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);
    v9 = v5;

  }
  return v9;
}

- (id)_initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 rawIntervals:(id)a6 durationNs:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SignpostAggregation *v17;
  SignpostAggregation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SignpostAggregation;
  v17 = -[SignpostAggregation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_subsystem, a3);
    objc_storeStrong((id *)&v18->_category, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_rawIntervals, a6);
    v18->_durationNs = a7;
  }

  return v18;
}

+ (id)_timeRangeDictForInterval:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = kAggBeginTimeMCTKey;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "startMachContinuousTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = kAggBeginTimeNsKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "startNanoseconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = kAggEndTimeMCTKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "endMachContinuousTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = kAggEndTimeNsKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "endNanoseconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v4, "beginWallTimeStringWithTimeZoneName:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endWallTimeStringWithTimeZoneName:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v12)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, kAggBeginTimeDateKey);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kAggEndTimeDateKey);
  }

  return v10;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _QWORD v39[4];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v39[0] = kAggSubsystemKey;
  -[SignpostAggregation subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v3;
  v39[1] = kAggCategoryKey;
  -[SignpostAggregation category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v4;
  v39[2] = kAggNameKey;
  -[SignpostAggregation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v5;
  v39[3] = kAggDurationNsKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostAggregation durationNs](self, "durationNs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v16, "_dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v13);
  }

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kAggGroupNameToGroupKey);
  -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, kAggDescriptionKey);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[SignpostAggregation rawIntervals](self, "rawIntervals", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend((id)objc_opt_class(), "_timeRangeDictForInterval:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v24);
  }

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, kAggTimeRangeArrayKey);
  return v8;
}

- (SignpostAggregation)initWithInterval:(id)a3 errorsOut:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *groupToTypeToDuration;
  NSMutableDictionary *v17;
  NSMutableDictionary *groupToTypeToMeasuredValue;
  NSDictionary *v19;
  NSDictionary *groupNameToGroupDict;
  NSDate *v21;
  NSDate *earliestDate;
  NSDate *v23;
  NSDate *latestDate;
  void *v25;
  void *v26;
  SignpostAggregation *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "beginDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "subsystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "category");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      self = -[SignpostAggregation _initWithSubsystem:category:name:rawIntervals:durationNs:](self, "_initWithSubsystem:category:name:rawIntervals:durationNs:", v10, v11, v12, v14, objc_msgSend(v6, "durationNanoseconds"));

      if (!self)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      groupToTypeToDuration = self->__groupToTypeToDuration;
      self->__groupToTypeToDuration = v15;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      groupToTypeToMeasuredValue = self->__groupToTypeToMeasuredValue;
      self->__groupToTypeToMeasuredValue = v17;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      groupNameToGroupDict = self->_groupNameToGroupDict;
      self->_groupNameToGroupDict = v19;

      objc_msgSend(v6, "beginDate");
      v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
      earliestDate = self->_earliestDate;
      self->_earliestDate = v21;

      objc_msgSend(v6, "endDate");
      v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
      latestDate = self->_latestDate;
      self->_latestDate = v23;

      self->_earliestMCT = objc_msgSend(v6, "startMachContinuousTime");
      self->_latestMCT = objc_msgSend(v6, "endMachContinuousTime");
      -[SignpostAggregation _processInterval:](self, "_processInterval:", v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
LABEL_9:
        self = self;
        v27 = self;
        goto LABEL_10;
      }
      v26 = v25;
      if (a4)
        *a4 = objc_retainAutorelease(v25);

    }
  }
  v27 = 0;
LABEL_10:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostAggregation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  _QWORD *v31;

  v4 = [SignpostAggregation alloc];
  -[SignpostAggregation subsystem](self, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation rawIntervals](self, "rawIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = -[SignpostAggregation _initWithSubsystem:category:name:rawIntervals:durationNs:](v4, "_initWithSubsystem:category:name:rawIntervals:durationNs:", v5, v6, v7, v9, -[SignpostAggregation durationNs](self, "durationNs"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __36__SignpostAggregation_copyWithZone___block_invoke;
  v29 = &unk_1E46015A0;
  v13 = v11;
  v30 = v13;
  v14 = v10;
  v31 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v26);

  v15 = (void *)v14[9];
  v14[9] = v13;
  v16 = v13;

  -[SignpostAggregation aggregationDescription](self, "aggregationDescription", v26, v27, v28, v29);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v14[4];
  v14[4] = v17;

  -[SignpostAggregation earliestDate](self, "earliestDate");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v14[7];
  v14[7] = v19;

  -[SignpostAggregation latestDate](self, "latestDate");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v14[8];
  v14[8] = v21;

  v23 = v31;
  v24 = v14;

  return v24;
}

void __36__SignpostAggregation_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v8 = (id)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
  objc_msgSend(v8, "setParentAggregation:", *(_QWORD *)(a1 + 40));

}

- (id)_canAdd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
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
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  unint64_t v62;
  unint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SignpostAggregation subsystem](self, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    -[SignpostAggregation category](self, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      -[SignpostAggregation name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
      {
        -[SignpostAggregation name](self, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(v4, "aggregationDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {

LABEL_23:
              v36 = (void *)MEMORY[0x1E0CB3940];
              -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "aggregationDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringWithFormat:", CFSTR("Aggregation descriptions do not match: %@ vs. %@"), v21, v22);
              goto LABEL_14;
            }
          }
          -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v4, "aggregationDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            if (!v19)
              goto LABEL_23;
          }
          else
          {

            if (v17)
          }
          -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            objc_msgSend(v4, "aggregationDescription");
            v31 = objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v32 = (void *)v31;
              -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "aggregationDescription");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v33, "isEqualToString:", v34);

              if ((v35 & 1) == 0)
                goto LABEL_23;
            }
            else
            {

            }
          }
          -[SignpostAggregation earliestDate](self, "earliestDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "timeIntervalSince1970");
          v39 = v38;
          objc_msgSend(v4, "latestDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "timeIntervalSince1970");
          if (v39 >= v41)
          {

          }
          else
          {
            -[SignpostAggregation latestDate](self, "latestDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "timeIntervalSince1970");
            v44 = v43;
            objc_msgSend(v4, "earliestDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "timeIntervalSince1970");
            v47 = v46;

            if (v44 > v47)
            {
              -[SignpostAggregation rawIntervals](self, "rawIntervals");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v48, "count"))
              {
                objc_msgSend(v4, "rawIntervals");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v49, "count");

                if (v50)
                {
                  v70 = 0u;
                  v71 = 0u;
                  v68 = 0u;
                  v69 = 0u;
                  -[SignpostAggregation rawIntervals](self, "rawIntervals");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
                  if (v52)
                  {
                    v53 = v52;
                    v54 = *(_QWORD *)v69;
                    do
                    {
                      for (i = 0; i != v53; ++i)
                      {
                        if (*(_QWORD *)v69 != v54)
                          objc_enumerationMutation(v51);
                        v56 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                        v64 = 0u;
                        v65 = 0u;
                        v66 = 0u;
                        v67 = 0u;
                        objc_msgSend(v4, "rawIntervals");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
                        if (v58)
                        {
                          v59 = v58;
                          v60 = *(_QWORD *)v65;
                          while (2)
                          {
                            for (j = 0; j != v59; ++j)
                            {
                              if (*(_QWORD *)v65 != v60)
                                objc_enumerationMutation(v57);
                              if ((objc_msgSend(v56, "intersectsInterval:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j)) & 1) != 0)
                              {
                                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Cannot add add aggregations that cover intersecting periods of time"));
                                v26 = (void *)objc_claimAutoreleasedReturnValue();

                                goto LABEL_15;
                              }
                            }
                            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
                            if (v59)
                              continue;
                            break;
                          }
                        }

                      }
                      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
                    }
                    while (v53);
                  }

                  goto LABEL_46;
                }
              }
              else
              {

              }
              v62 = -[SignpostAggregation earliestMCT](self, "earliestMCT");
              if (v62 < objc_msgSend(v4, "latestMCT"))
              {
                v63 = -[SignpostAggregation latestMCT](self, "latestMCT");
                if (v63 > objc_msgSend(v4, "earliestMCT"))
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Cannot add add aggregations that cover intersecting periods of time"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_15;
                }
              }
            }
          }
LABEL_46:
          v26 = 0;
          goto LABEL_15;
        }
      }
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[SignpostAggregation name](self, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Names do not match: %@ vs. %@"), v21, v22);
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      -[SignpostAggregation category](self, "category");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "category");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Categories do not match: %@ vs. %@"), v21, v22);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostAggregation subsystem](self, "subsystem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subsystem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Subsystems do not match: %@ vs. %@"), v21, v22);
  }
LABEL_14:
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v26;
}

- (void)_sortRawIntervals
{
  void *v3;
  unint64_t v4;
  id v5;
  id v6;

  -[SignpostAggregation rawIntervals](self, "rawIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    -[SignpostAggregation rawIntervals](self, "rawIntervals");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_496);

  }
}

uint64_t __40__SignpostAggregation__sortRawIntervals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "beginDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "compare:", v7);
  }
  else
  {
    v10 = objc_msgSend(v4, "startMachContinuousTime");
    if (v10 >= objc_msgSend(v5, "startMachContinuousTime"))
    {
      v11 = objc_msgSend(v4, "startMachContinuousTime");
      v9 = v11 > objc_msgSend(v5, "startMachContinuousTime");
    }
    else
    {
      v9 = -1;
    }
  }

  return v9;
}

- (id)addAggregation:(id)a3
{
  SignpostAggregation *v4;
  void *v5;
  void *v6;
  id v7;
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
  uint64_t v19;
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
  id v30;
  void *v31;
  NSArray *v32;
  void *v33;
  NSArray *rawIntervals;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  SignpostAggregation *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  SignpostAggregation *v61;
  NSDate *v62;
  NSDate *earliestDate;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  SignpostAggregation *v69;
  NSDate *v70;
  NSDate *latestDate;
  void *v73;
  void *v74;
  id v75;
  id obj;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = (SignpostAggregation *)a3;
  if (v4)
  {
    -[SignpostAggregation _canAdd:](self, "_canAdd:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99E20];
      -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SignpostAggregation groupNameToGroupDict](v4, "groupNameToGroupDict");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v13);

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v77 = (id)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation rawIntervals](self, "rawIntervals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SignpostAggregation rawIntervals](v4, "rawIntervals");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "beginDate");
      v19 = objc_claimAutoreleasedReturnValue();

      v73 = (void *)v19;
      v74 = v16;
      if (v16 && v19 && objc_msgSend(v16, "compare:", v19) != 1)
      {
        -[SignpostAggregation rawIntervals](self, "rawIntervals");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostAggregation rawIntervals](v4, "rawIntervals");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObjectsFromArray:", v29);

      }
      else
      {
        -[SignpostAggregation rawIntervals](self, "rawIntervals");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "beginDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[SignpostAggregation rawIntervals](v4, "rawIntervals");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 && v25 && objc_msgSend(v25, "compare:", v22) != 1)
        {
          v30 = objc_alloc(MEMORY[0x1E0C99DE8]);
          -[SignpostAggregation rawIntervals](v4, "rawIntervals");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (NSArray *)objc_msgSend(v30, "initWithArray:", v31);

          -[SignpostAggregation rawIntervals](self, "rawIntervals");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v32, "addObjectsFromArray:", v33);

          rawIntervals = self->_rawIntervals;
          self->_rawIntervals = v32;

        }
        else
        {

          -[SignpostAggregation rawIntervals](self, "rawIntervals");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregation rawIntervals](v4, "rawIntervals");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObjectsFromArray:", v27);

          -[SignpostAggregation _sortRawIntervals](self, "_sortRawIntervals");
        }
      }
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      obj = v11;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v80;
        while (2)
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v80 != v37)
              objc_enumerationMutation(obj);
            v39 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
            -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v42 = v4;
            -[SignpostAggregation groupNameToGroupDict](v4, "groupNameToGroupDict");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v39);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v78 = 0;
            +[SignpostAggregationGroup _sumOfGroup0:group1:errorOut:](SignpostAggregationGroup, "_sumOfGroup0:group1:errorOut:", v41, v44, &v78);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v78;
            v47 = v46;
            if (v45)
            {
              objc_msgSend(v77, "setObject:forKeyedSubscript:", v45, v39);
              objc_msgSend(v45, "setParentAggregation:", self);
            }
            else
            {
              v75 = v46;
            }

            if (!v45)
            {
              v48 = obj;
              v49 = v77;
              v64 = obj;
              v4 = v42;
              v6 = 0;
              v7 = v75;
              goto LABEL_39;
            }
            v4 = v42;
          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
          if (v36)
            continue;
          break;
        }
      }
      v48 = obj;

      v49 = v77;
      objc_storeStrong((id *)&self->_groupNameToGroupDict, v77);
      self->_durationNs += -[SignpostAggregation durationNs](v4, "durationNs");
      v50 = -[SignpostAggregation earliestMCT](self, "earliestMCT");
      v51 = -[SignpostAggregation earliestMCT](v4, "earliestMCT");
      if (v50 >= v51)
        v52 = v51;
      else
        v52 = v50;
      -[SignpostAggregation setEarliestMCT:](self, "setEarliestMCT:", v52);
      v53 = -[SignpostAggregation latestMCT](self, "latestMCT");
      v54 = -[SignpostAggregation latestMCT](v4, "latestMCT");
      if (v53 <= v54)
        v55 = v54;
      else
        v55 = v53;
      -[SignpostAggregation setLatestMCT:](self, "setLatestMCT:", v55);
      -[SignpostAggregation earliestDate](self, "earliestDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "timeIntervalSince1970");
      v58 = v57;
      -[SignpostAggregation earliestDate](v4, "earliestDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "timeIntervalSince1970");
      if (v58 <= v60)
        v61 = self;
      else
        v61 = v4;
      -[SignpostAggregation earliestDate](v61, "earliestDate");
      v62 = (NSDate *)objc_claimAutoreleasedReturnValue();
      earliestDate = self->_earliestDate;
      self->_earliestDate = v62;

      -[SignpostAggregation latestDate](self, "latestDate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "timeIntervalSince1970");
      v66 = v65;
      -[SignpostAggregation latestDate](v4, "latestDate");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "timeIntervalSince1970");
      if (v66 > v68)
        v69 = self;
      else
        v69 = v4;
      -[SignpostAggregation latestDate](v69, "latestDate");
      v70 = (NSDate *)objc_claimAutoreleasedReturnValue();
      latestDate = self->_latestDate;
      self->_latestDate = v70;

      v7 = 0;
      v6 = 0;
LABEL_39:

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)sumOfAggregation0:(id)a3 aggregation1:(id)a4 errorOut:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v8, "addAggregation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);
  if (v9)
    v10 = 0;
  else
    v10 = v8;

  return v10;
}

- (double)durationMs
{
  return (double)-[SignpostAggregation durationNs](self, "durationNs") / 1000000.0;
}

- (double)durationSeconds
{
  return (double)-[SignpostAggregation durationNs](self, "durationNs") / 1000000000.0;
}

- (BOOL)isEqual:(id)a3
{
  SignpostAggregation *v3;
  SignpostAggregation *v5;
  SignpostAggregation *v6;
  SignpostAggregation *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  SignpostAggregation *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v5 = (SignpostAggregation *)a3;
  v6 = v5;
  if (v5)
  {
    if (v5 != self)
    {
      v7 = v5;
      v8 = -[SignpostAggregation durationNs](self, "durationNs");
      if (v8 != -[SignpostAggregation durationNs](v7, "durationNs"))
      {
LABEL_100:
        v13 = 0;
LABEL_101:

        goto LABEL_102;
      }
      -[SignpostAggregation subsystem](self, "subsystem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation subsystem](v7, "subsystem");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v10)
      {

        goto LABEL_21;
      }
      v11 = (void *)v10;
      -[SignpostAggregation subsystem](self, "subsystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation subsystem](v7, "subsystem");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_99;
      }
      -[SignpostAggregation subsystem](self, "subsystem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        || (-[SignpostAggregation subsystem](v7, "subsystem"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation subsystem](self, "subsystem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation subsystem](v7, "subsystem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16) ^ 1;

        if (v14)
        {

          v7 = v3;
          goto LABEL_18;
        }
        v18 = 0;
        v7 = v3;
      }
      else
      {
        v17 = 1;
      }

LABEL_18:
      if (v12)
      {

      }
      if ((v17 & 1) != 0)
        goto LABEL_100;
LABEL_21:
      -[SignpostAggregation category](self, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation category](v7, "category");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v19)
      {

        goto LABEL_36;
      }
      v11 = (void *)v19;
      -[SignpostAggregation category](self, "category");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation category](v7, "category");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_99;
      }
      -[SignpostAggregation category](self, "category");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (-[SignpostAggregation category](v7, "category"), (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation category](self, "category");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation category](v7, "category");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22) ^ 1;

        if (v20)
        {

          v7 = v3;
          goto LABEL_33;
        }
        v24 = 0;
        v7 = v3;
      }
      else
      {
        v23 = 1;
      }

LABEL_33:
      if (v12)
      {

      }
      if ((v23 & 1) != 0)
        goto LABEL_100;
LABEL_36:
      -[SignpostAggregation name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation name](v7, "name");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v25)
      {

        goto LABEL_51;
      }
      v11 = (void *)v25;
      -[SignpostAggregation name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation name](v7, "name");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_99;
      }
      -[SignpostAggregation name](self, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 || (-[SignpostAggregation name](v7, "name"), (v30 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation name](self, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation name](v7, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqual:", v28) ^ 1;

        if (v26)
        {

          v7 = v3;
          goto LABEL_48;
        }
        v30 = 0;
        v7 = v3;
      }
      else
      {
        v29 = 1;
      }

LABEL_48:
      if (v12)
      {

      }
      if ((v29 & 1) != 0)
        goto LABEL_100;
LABEL_51:
      -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation aggregationDescription](v7, "aggregationDescription");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v31)
      {

        goto LABEL_66;
      }
      v11 = (void *)v31;
      -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation aggregationDescription](v7, "aggregationDescription");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_99;
      }
      -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32
        || (-[SignpostAggregation aggregationDescription](v7, "aggregationDescription"),
            (v36 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation aggregationDescription](v7, "aggregationDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isEqual:", v34) ^ 1;

        if (v32)
        {

          v7 = v3;
          goto LABEL_63;
        }
        v36 = 0;
        v7 = v3;
      }
      else
      {
        v35 = 1;
      }

LABEL_63:
      if (v12)
      {

      }
      if ((v35 & 1) != 0)
        goto LABEL_100;
LABEL_66:
      -[SignpostAggregation rawIntervals](self, "rawIntervals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation rawIntervals](v7, "rawIntervals");
      v37 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v37)
      {

        goto LABEL_81;
      }
      v11 = (void *)v37;
      -[SignpostAggregation rawIntervals](self, "rawIntervals");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation rawIntervals](v7, "rawIntervals");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_99;
      }
      -[SignpostAggregation rawIntervals](self, "rawIntervals");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38
        || (-[SignpostAggregation rawIntervals](v7, "rawIntervals"),
            (v42 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation rawIntervals](self, "rawIntervals");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation rawIntervals](v7, "rawIntervals");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "isEqual:", v40) ^ 1;

        if (v38)
        {

          v7 = v3;
          goto LABEL_78;
        }
        v42 = 0;
        v7 = v3;
      }
      else
      {
        v41 = 1;
      }

LABEL_78:
      if (v12)
      {

      }
      if ((v41 & 1) != 0)
        goto LABEL_100;
LABEL_81:
      -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation groupNameToGroupDict](v7, "groupNameToGroupDict");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v43)
      {

        goto LABEL_96;
      }
      v11 = (void *)v43;
      -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation groupNameToGroupDict](v7, "groupNameToGroupDict");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_99;
      }
      -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44
        || (-[SignpostAggregation groupNameToGroupDict](v7, "groupNameToGroupDict"),
            (v48 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation groupNameToGroupDict](v7, "groupNameToGroupDict");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "isEqual:", v46) ^ 1;

        if (v44)
        {

          v7 = v3;
          goto LABEL_93;
        }
        v48 = 0;
        v7 = v3;
      }
      else
      {
        v47 = 1;
      }

LABEL_93:
      if (v12)
      {

      }
      if ((v47 & 1) != 0)
        goto LABEL_100;
LABEL_96:
      -[SignpostAggregation earliestDate](self, "earliestDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation earliestDate](v7, "earliestDate");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v49)
      {

        goto LABEL_114;
      }
      v11 = (void *)v49;
      -[SignpostAggregation earliestDate](self, "earliestDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SignpostAggregation earliestDate](v7, "earliestDate");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
        {
LABEL_99:

          goto LABEL_100;
        }
      }
      -[SignpostAggregation earliestDate](self, "earliestDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51
        || (-[SignpostAggregation earliestDate](v7, "earliestDate"),
            (v55 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation earliestDate](self, "earliestDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7;
        -[SignpostAggregation earliestDate](v7, "earliestDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v52, "isEqual:", v53) ^ 1;

        if (v51)
        {

          v7 = v3;
          goto LABEL_111;
        }
        v55 = 0;
        v7 = v3;
      }
      else
      {
        v54 = 1;
      }

LABEL_111:
      if (v12)
      {

      }
      if ((v54 & 1) != 0)
        goto LABEL_100;
LABEL_114:
      -[SignpostAggregation latestDate](self, "latestDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregation latestDate](v7, "latestDate");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v56 == (void *)v57)
      {

        v13 = 1;
        goto LABEL_101;
      }
      v58 = (void *)v57;
      -[SignpostAggregation latestDate](self, "latestDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        -[SignpostAggregation latestDate](v7, "latestDate");
        v3 = (SignpostAggregation *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v60 = v7;
          LOBYTE(v7) = 1;
          goto LABEL_128;
        }
      }
      -[SignpostAggregation latestDate](self, "latestDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61
        || (-[SignpostAggregation latestDate](v7, "latestDate"),
            (v64 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregation latestDate](self, "latestDate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v7;
        -[SignpostAggregation latestDate](v7, "latestDate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v62, "isEqual:", v63) ^ 1;

        if (v61)
        {

          if (v59)
            goto LABEL_128;
          goto LABEL_122;
        }
        v64 = 0;
      }
      else
      {
        v60 = v7;
        LODWORD(v7) = 1;
      }

      if (v59)
      {
LABEL_128:

        if ((v7 & 1) != 0)
          goto LABEL_129;
        goto LABEL_123;
      }
LABEL_122:

      if ((_DWORD)v7)
      {
LABEL_129:
        v13 = 0;
        goto LABEL_130;
      }
LABEL_123:
      v13 = 1;
LABEL_130:
      v7 = v60;
      goto LABEL_101;
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
LABEL_102:

  return v13;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SignpostAggregation jsonDescription:](self, "jsonDescription:", 1);
}

- (id)_telemetryEnabledGroupDurations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict", 0);
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
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "_telemetryEnabledGroupDurations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
          objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
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

- (id)_telemetryEnabledGroups
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
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict", 0);
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

- (id)_coreAnalyticsEventName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregation subsystem](self, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_coreAnalyticsEventPayloadDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9++), "addToPayloadDictionary:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kCAFieldValue_DynamicDescription);

    }
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAggregation durationSeconds](self, "durationSeconds");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, kCAFieldValue_WindowDuration);

    v14 = v3;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_signatureForSubsystem:(id)a3 category:(id)a4 name:(id)a5 aggregationDescription:(id)a6
{
  uint64_t v7;

  if (a6)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@__%@__%@__%@"), a3, a4, a5, a6);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@__%@__%@"), a3, a4, a5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_aggregationDescriptionStringForInterval:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "beginEvent", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataSegments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
      if (!_placeholderTypeForSegment(v9))
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    objc_msgSend(v9, "argument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "type") == 1)
    {
      objc_msgSend(v9, "argument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "argumentObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_13;
      objc_msgSend(v9, "argument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "argumentObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
LABEL_13:
    v14 = 0;
  }

  return v14;
}

- (NSString)signatureString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  -[SignpostAggregation subsystem](self, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregation aggregationDescription](self, "aggregationDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_signatureForSubsystem:category:name:aggregationDescription:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)telemetryEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SignpostAggregation groupNameToGroupDict](self, "groupNameToGroupDict", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "telemetryEnabled") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
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

- (NSString)aggregationDescription
{
  return self->_aggregationDescription;
}

- (NSArray)rawIntervals
{
  return self->_rawIntervals;
}

- (unint64_t)durationNs
{
  return self->_durationNs;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (NSDictionary)groupNameToGroupDict
{
  return self->_groupNameToGroupDict;
}

- (NSMutableDictionary)_groupToTypeToDuration
{
  return self->__groupToTypeToDuration;
}

- (void)set_groupToTypeToDuration:(id)a3
{
  objc_storeStrong((id *)&self->__groupToTypeToDuration, a3);
}

- (NSMutableDictionary)_groupToTypeToMeasuredValue
{
  return self->__groupToTypeToMeasuredValue;
}

- (void)set_groupToTypeToMeasuredValue:(id)a3
{
  objc_storeStrong((id *)&self->__groupToTypeToMeasuredValue, a3);
}

- (unint64_t)earliestMCT
{
  return self->_earliestMCT;
}

- (void)setEarliestMCT:(unint64_t)a3
{
  self->_earliestMCT = a3;
}

- (unint64_t)latestMCT
{
  return self->_latestMCT;
}

- (void)setLatestMCT:(unint64_t)a3
{
  self->_latestMCT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__groupToTypeToMeasuredValue, 0);
  objc_storeStrong((id *)&self->__groupToTypeToDuration, 0);
  objc_storeStrong((id *)&self->_groupNameToGroupDict, 0);
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_rawIntervals, 0);
  objc_storeStrong((id *)&self->_aggregationDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
