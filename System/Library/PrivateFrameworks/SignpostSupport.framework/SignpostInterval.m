@implementation SignpostInterval

- (id)string2Value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string2Value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string2Value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)string2Name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string2Name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string2Name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)string1Value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string1Value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string1Value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)string1Name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string1Name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string1Name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)number1Name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "number1Name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "number1Name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)number1Value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "number1Value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "number1Value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_beginEvent, 0);
}

- (SignpostInterval)initWithBeginEvent:(id)a3 endEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  SignpostInterval *v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  SignpostInterval *v41;
  id obj;
  id v43;
  SignpostInterval *v44;
  void *v45;
  void *v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.6();
    goto LABEL_11;
  }
  v10 = objc_msgSend(v7, "signpostId");
  if (v10 != objc_msgSend(v9, "signpostId"))
  {
    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.5();
    goto LABEL_11;
  }
  if ((objc_msgSend(v7, "_resolvedEventType") & 1) == 0)
  {
    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.1();
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v9, "_resolvedEventType") & 2) == 0)
  {
    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.2();
    goto LABEL_11;
  }
  v14 = objc_msgSend(v7, "scope");
  if (v14 != objc_msgSend(v9, "scope"))
  {
    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.4();
    goto LABEL_11;
  }
  v15 = objc_msgSend(v7, "startMachContinuousTime");
  if (objc_msgSend(v9, "overridesBeginTime"))
    v15 = objc_msgSend(v9, "overridingBeginMachContinuousTime");
  v16 = objc_msgSend(v9, "endMachContinuousTime");
  if (objc_msgSend(v7, "overridesEndTime"))
    v16 = objc_msgSend(v7, "overridingEndMachContinuousTime");
  if (v15 >= v16)
  {
    _signpost_debug_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SignpostInterval initWithBeginEvent:endEvent:].cold.3(v7, v9, v11);
    goto LABEL_11;
  }
  obj = a3;
  v43 = a4;
  v44 = self;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v7, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v53 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v7, "attributes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v24, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v19);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v9, "attributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
  v45 = v9;
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
        -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          _signpost_debug_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "subsystem");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "category");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v57 = v30;
            v58 = 2112;
            v59 = v46;
            v60 = 2112;
            v61 = v33;
            v62 = 2112;
            v63 = v34;
            _os_log_debug_impl(&dword_1A1A28000, v32, OS_LOG_TYPE_DEBUG, "Collision on attribute key %@ in %@/%@/%@", buf, 0x2Au);

            v9 = v45;
          }
        }
        else
        {
          objc_msgSend(v9, "attributes");
          v32 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v35, v30);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    }
    while (v27);
  }

  objc_msgSend(v7, "subsystem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "category");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v7, "signpostId");
  v40 = objc_msgSend(v7, "scope");
  objc_msgSend(v7, "timebaseRatio");
  v47.receiver = v44;
  v47.super_class = (Class)SignpostInterval;
  v41 = -[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:](&v47, sel_initWithSubsystem_category_name_signpostId_scope_timebaseRatio_attributes_, v36, v37, v38, v39, v40, v11);

  if (v41)
  {
    objc_storeStrong((id *)&v41->_beginEvent, obj);
    objc_storeStrong((id *)&v41->_endEvent, v43);
  }
  self = v41;
  v12 = self;
  v9 = v45;
LABEL_12:

  return v12;
}

- (unint64_t)endMachContinuousTime
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overridesEndTime");

  if (v4)
  {
    -[SignpostInterval beginEvent](self, "beginEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "overridingEndMachContinuousTime");
  }
  else
  {
    -[SignpostInterval endEvent](self, "endEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "endMachContinuousTime");
  }
  v7 = v6;

  return v7;
}

- (SignpostEvent)beginEvent
{
  return self->_beginEvent;
}

- (BOOL)isSyntheticInterval
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostInterval endEvent](self, "endEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    -[SignpostInterval beginEvent](self, "beginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isSyntheticIntervalEvent");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SignpostInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (unint64_t)startMachContinuousTime
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SignpostInterval endEvent](self, "endEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overridesBeginTime");

  if (v4)
  {
    -[SignpostInterval endEvent](self, "endEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "overridingBeginMachContinuousTime");
  }
  else
  {
    -[SignpostInterval beginEvent](self, "beginEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "startMachContinuousTime");
  }
  v7 = v6;

  return v7;
}

- (SignpostEvent)endEvent
{
  return self->_endEvent;
}

+ (id)serializationTypeNumber
{
  return 0;
}

- (SignpostInterval)initWithDictionary:(id)a3
{

  return 0;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  if (a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)SignpostInterval;
    -[SignpostObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v17, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_, 1, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostInterval beginEvent](self, "beginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "humanReadableDictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SignpostInterval endEvent](self, "endEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "humanReadableDictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("IntervalBeginEvent"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("IntervalEndEvent"));
    -[SignpostInterval endEvent](self, "endEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "overridesBeginTime");

    if (v11)
    {
      -[SignpostSupportObject beginWallTimeStringWithTimeZoneName:](self, "beginWallTimeStringWithTimeZoneName:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("OverridingBeginWalltime"));

    }
    -[SignpostInterval beginEvent](self, "beginEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "overridesEndTime");

    if (v14)
    {
      -[SignpostSupportObject endWallTimeStringWithTimeZoneName:](self, "endWallTimeStringWithTimeZoneName:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("OverridingEndWalltime"));

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)humanReadableType
{
  return CFSTR("SignpostInterval");
}

- (BOOL)intersectsInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  unint64_t v25;

  v4 = a3;
  -[SignpostSupportObject beginDate](self, "beginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");
  v10 = objc_msgSend(v4, "endMachContinuousTime");
  if (!v5 || !v6 || !v7 || !v8)
  {
    if (v9 < v10)
    {
      v25 = objc_msgSend(v4, "startMachContinuousTime");
      v24 = v25 < -[SignpostInterval endMachContinuousTime](self, "endMachContinuousTime");
      goto LABEL_14;
    }
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  if (v9 == v10)
  {
    objc_msgSend(v5, "timeIntervalSince1970");
    v12 = (unint64_t)v11;
    objc_msgSend(v8, "timeIntervalSince1970");
    if (v12 == (unint64_t)v13)
      goto LABEL_13;
  }
  v14 = -[SignpostInterval endMachContinuousTime](self, "endMachContinuousTime");
  if (v14 == objc_msgSend(v4, "startMachContinuousTime"))
  {
    objc_msgSend(v6, "timeIntervalSince1970");
    v16 = (unint64_t)v15;
    objc_msgSend(v7, "timeIntervalSince1970");
    if (v16 == (unint64_t)v17)
      goto LABEL_13;
  }
  objc_msgSend(v5, "timeIntervalSince1970");
  v19 = v18;
  objc_msgSend(v8, "timeIntervalSince1970");
  if (v19 >= v20)
    goto LABEL_13;
  objc_msgSend(v7, "timeIntervalSince1970");
  v22 = v21;
  objc_msgSend(v6, "timeIntervalSince1970");
  v24 = v22 < v23;
LABEL_14:

  return v24;
}

- (NSString)_intervalTypeString
{
  return (NSString *)CFSTR("Interval");
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SignpostInterval;
  -[SignpostObject _descriptionStringForColumn:timeFormat:asBegin:](&v33, sel__descriptionStringForColumn_timeFormat_asBegin_, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    goto LABEL_3;
  }
  if (a3 == 10)
  {
    -[SignpostInterval beginEvent](self, "beginEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "threadID");
    -[SignpostInterval endEvent](self, "endEvent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "threadID");

    v25 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostInterval beginEvent](self, "beginEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v16, "threadID");
    v27 = v26;
    if (v22 == v24)
    {
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%#llx"), v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SignpostInterval endEvent](self, "endEvent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%#llx->%#llx"), v27, objc_msgSend(v31, "threadID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_16:

    goto LABEL_17;
  }
  if (a3 == 9)
  {
    -[SignpostInterval beginEvent](self, "beginEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "processID");
    -[SignpostInterval endEvent](self, "endEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "processID");

    v15 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostInterval beginEvent](self, "beginEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostInterval beginEvent](self, "beginEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "processID");
    v20 = v19;
    if (v12 == v14)
    {
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@[%d]"), v17, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SignpostInterval endEvent](self, "endEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "processName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostInterval endEvent](self, "endEvent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@[%d]->%@[%d]"), v17, v20, v29, objc_msgSend(v30, "processID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  if (a3 != 5)
  {
    v10 = 0;
    goto LABEL_17;
  }
  -[SignpostInterval _intervalTypeString](self, "_intervalTypeString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v10 = v9;
LABEL_17:

  return v10;
}

- (id)descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  if (a4 == 2)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v15.receiver = self;
    v15.super_class = (Class)SignpostInterval;
    -[SignpostSupportObject descriptionWithTimeFormat:verbosity:](&v15, sel_descriptionWithTimeFormat_verbosity_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostInterval beginEvent](self, "beginEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_descriptionWithTimeFormat:verbosity:asBegin:", a3, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostInterval endEvent](self, "endEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_descriptionWithTimeFormat:verbosity:asBegin:", a3, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("--------\n%@\n↳ %@\n↳ %@\n--------"), v7, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SignpostInterval;
    -[SignpostSupportObject descriptionWithTimeFormat:verbosity:](&v14, sel_descriptionWithTimeFormat_verbosity_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_adjustBeginTimeVal:(timeval *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "overridesBeginTime");

  -[SignpostInterval beginEvent](self, "beginEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  if (v6)
  {
    a3->tv_sec = objc_msgSend(v7, "tv_sec");

    -[SignpostInterval beginEvent](self, "beginEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a3->tv_usec = objc_msgSend(v8, "tv_usec");

    -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
    v10 = v9;
    -[SignpostInterval endEvent](self, "endEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "overridingBeginMachContinuousTime");
    -[SignpostInterval beginEvent](self, "beginEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (uint64_t)(v10 * (double)(v12 - objc_msgSend(v13, "timeRecordedMachContinuousTime")));

    _adjustTimeVal(&a3->tv_sec, v14);
  }
  else
  {
    objc_msgSend(v7, "_adjustBeginTimeVal:", a3);

  }
}

- (void)_adjustEndTimeVal:(timeval *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "overridesEndTime");

  -[SignpostInterval endEvent](self, "endEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  if (v6)
  {
    a3->tv_sec = objc_msgSend(v7, "tv_sec");

    -[SignpostInterval endEvent](self, "endEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a3->tv_usec = objc_msgSend(v8, "tv_usec");

    -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
    v10 = v9;
    -[SignpostInterval beginEvent](self, "beginEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "overridingEndMachContinuousTime");
    -[SignpostInterval endEvent](self, "endEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (uint64_t)(v10 * (double)(v12 - objc_msgSend(v13, "timeRecordedMachContinuousTime")));

    _adjustTimeVal(&a3->tv_sec, v14);
  }
  else
  {
    objc_msgSend(v7, "_adjustEndTimeVal:", a3);

  }
}

- (BOOL)_hasBeginTimeval
{
  void *v2;
  char v3;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasBeginTimeval");

  return v3;
}

- (BOOL)_hasEndTimeval
{
  void *v2;
  char v3;

  -[SignpostInterval endEvent](self, "endEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasEndTimeval");

  return v3;
}

- (BOOL)beginTimezone:(timezone *)a3
{
  void *v4;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "beginTimezone:", a3);

  return (char)a3;
}

- (BOOL)endTimezone:(timezone *)a3
{
  void *v4;

  -[SignpostInterval endEvent](self, "endEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "endTimezone:", a3);

  return (char)a3;
}

- (unint64_t)scope
{
  void *v2;
  unint64_t v3;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scope");

  return v3;
}

- (id)number2Name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "number2Name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "number2Name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)number2Value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "number2Value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SignpostInterval beginEvent](self, "beginEvent");
  else
    -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "number2Value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)telemetryEnabled
{
  void *v3;
  char v4;
  void *v5;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "telemetryEnabled") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SignpostInterval endEvent](self, "endEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "telemetryEnabled");

  }
  return v4;
}

- (int64_t)tv_sec
{
  void *v2;
  int64_t v3;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_sec");

  return v3;
}

- (int)tv_usec
{
  void *v2;
  int v3;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_usec");

  return v3;
}

- (int)tz_minuteswest
{
  void *v2;
  int v3;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tz_minuteswest");

  return v3;
}

- (int)tz_dsttime
{
  void *v2;
  int v3;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tz_dsttime");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SignpostInterval;
  if (-[SignpostObject isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    -[SignpostInterval beginEvent](self, "beginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      -[SignpostInterval endEvent](self, "endEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SignpostInterval endEvent](self, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (float)durationSeconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostInterval durationMachContinuousTime](self, "durationMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (float)(unint64_t)(v4 * v3) / 1000000000.0;
}

- (id)_eventDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_debugDescription:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostInterval endEvent](self, "endEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_debugDescription:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Start Event:\n%@%@%@End Event:\n%@%@%@"), CFSTR("---------------\n"), v5, CFSTR("---------------\n"), CFSTR("---------------\n"), v7, CFSTR("---------------\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  float v7;
  double v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostObject name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");
  v6 = -[SignpostInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SignpostInterval durationSeconds](self, "durationSeconds");
  v8 = v7;
  if (-[SignpostInterval telemetryEnabled](self, "telemetryEnabled"))
    v9 = CFSTR("Enabled");
  else
    v9 = CFSTR("Disabled");
  +[SignpostMetrics _deltaDescription:](SignpostMetrics, "_deltaDescription:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostInterval _eventDescriptions](self, "_eventDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Interval \"%@\" [%llu - %llu]\nDuration: %.4fs\nTelemetry:%@\n%@%@"), v4, v5, v6, *(_QWORD *)&v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setBeginEvent:(id)a3
{
  objc_storeStrong((id *)&self->_beginEvent, a3);
}

- (void)setEndEvent:(id)a3
{
  objc_storeStrong((id *)&self->_endEvent, a3);
}

- (void)initWithBeginEvent:endEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "Unexpected beginEvent type", v2);
  OUTLINED_FUNCTION_9();
}

- (void)initWithBeginEvent:endEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "Unexpected endEvent type", v2);
  OUTLINED_FUNCTION_9();
}

- (void)initWithBeginEvent:(NSObject *)a3 endEvent:.cold.3(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413314;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 2048;
  v16 = objc_msgSend(a2, "startMachContinuousTime");
  v17 = 2048;
  v18 = objc_msgSend(a1, "startMachContinuousTime");
  _os_log_debug_impl(&dword_1A1A28000, a3, OS_LOG_TYPE_DEBUG, "%@/%@/%@: End timestamp (%llu) <= start timestamp (%llu)", (uint8_t *)&v9, 0x34u);

}

- (void)initWithBeginEvent:endEvent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "Mismatched event scopes", v2);
  OUTLINED_FUNCTION_9();
}

- (void)initWithBeginEvent:endEvent:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "Trying to create SignpostInterval with mismatched event IDs", v2);
  OUTLINED_FUNCTION_9();
}

- (void)initWithBeginEvent:endEvent:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "Passed nil event(s)", v2);
  OUTLINED_FUNCTION_9();
}

@end
