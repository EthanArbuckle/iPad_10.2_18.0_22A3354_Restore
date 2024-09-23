@implementation SignpostEvent

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (void)set_machContinuousTimestamp:(unint64_t)a3
{
  self->__machContinuousTimestamp = a3;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (void)setProcessUniqueID:(unint64_t)a3
{
  self->_processUniqueID = a3;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setSenderImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_senderImageUUID, a3);
}

- (void)setSenderImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_senderImagePath, a3);
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void)setMetadataSegments:(id)a3
{
  objc_storeStrong((id *)&self->_metadataSegments, a3);
}

- (void)setProcessImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_processImageUUID, a3);
}

- (void)setProcessImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_processImagePath, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setOverridingBeginMachContinuousTime:(unint64_t)a3
{
  self->_overridingBeginMachContinuousTime = a3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SignpostEvent;
  if (-[SignpostObject isEqual:](&v26, sel_isEqual_, v5))
  {
    v6 = v5;
    v7 = -[SignpostEvent eventType](self, "eventType");
    if (v7 != objc_msgSend(v6, "eventType") || !_archiveEventsAreEqual(self, v6))
      goto LABEL_22;
    -[SignpostEvent metadata](self, "metadata");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "metadata");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v9 = 0;
LABEL_36:

        goto LABEL_23;
      }
    }
    -[SignpostEvent metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

      if (v8)
      {

      }
    }
    else
    {
      objc_msgSend(v6, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {

      }
      if (v11)
        goto LABEL_22;
    }
    -[SignpostEvent metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SignpostEvent metadata](self, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (!v15)
      {
LABEL_22:
        v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[SignpostEvent metadataSegments](self, "metadataSegments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadataSegments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = v17;
    v20 = v19;
    if (v18)
    {
      if (v18 == v19)
      {

LABEL_26:
        -[SignpostEvent stackFrames](self, "stackFrames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stackFrames");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v23;
        v25 = v24;
        v18 = v25;
        if (v8)
        {
          if (v8 == v25)
          {
            v9 = 1;
          }
          else if (v25)
          {
            v9 = objc_msgSend(v8, "isEqualToArray:", v25);
          }
          else
          {
            v9 = 0;
          }
        }
        else
        {
          v9 = v25 == 0;
        }

        goto LABEL_35;
      }
      if (!v19)
      {
        v9 = 0;
        v8 = v18;
LABEL_35:

        goto LABEL_36;
      }
      v21 = objc_msgSend(v18, "isEqualToArray:", v19);
    }
    else
    {
      v21 = v19 == 0;
    }

    if ((v21 & 1) == 0)
      goto LABEL_22;
    goto LABEL_26;
  }
  v9 = 0;
LABEL_24:

  return v9;
}

- (void)setAnimationTypeFromRawMetadata:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = objc_retainAutorelease(a3);
  if (strstr((char *)objc_msgSend(v5, "UTF8String"), "animation_type=1"))
    v4 = 1;
  else
    v4 = 2 * (strstr((char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "animation_type=2") != 0);
  -[SignpostEvent setAnimationType:](self, "setAnimationType:", v4);

}

+ (id)_nameStringFromFormatPrefix:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char i;
  unsigned int v11;
  int v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "UTF8String");
  v7 = (char *)(v6 + v4 - 1);
  if (*v7 != 61)
    goto LABEL_19;
  v8 = MEMORY[0x1E0C80978];
  if (v4 == 1)
  {
    v11 = 61;
    v9 = v7;
    goto LABEL_13;
  }
  v9 = (char *)v6;
  for (i = 61; (i & 0x80) == 0; i = v9[v4-- - 2])
  {
    if ((*(_DWORD *)(v8 + 4 * i + 60) & 0x4000) != 0)
      goto LABEL_11;
LABEL_8:
    if (v4 == 2)
      goto LABEL_12;
  }
  if (!__maskrune(i, 0x4000uLL))
    goto LABEL_8;
LABEL_11:
  v9 = &v9[v4 - 1];
LABEL_12:
  v11 = *v9;
  if ((v11 & 0x80000000) != 0)
    v12 = __maskrune(v11, 0x4000uLL);
  else
LABEL_13:
    v12 = *(_DWORD *)(v8 + 4 * v11 + 60) & 0x4000;
  if (v12)
    ++v9;
  if (v7 == v9)
  {
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, v7 - v9, 4);
LABEL_20:

  return v13;
}

- (id)_nameStringFromSegment:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "stringPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v3, "stringPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_nameStringFromFormatPrefix:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

- (void)_populateMetrics
{
  SignpostMetrics *v3;
  SignpostMetrics *metrics;

  v3 = +[SignpostMetrics newMetricsForSignpostEvent:](SignpostMetrics, "newMetricsForSignpostEvent:", self);
  metrics = self->_metrics;
  self->_metrics = v3;

}

- (BOOL)_overridesOwnTime
{
  unint64_t v3;

  v3 = -[SignpostEvent _resolvedEventType](self, "_resolvedEventType");
  switch(v3)
  {
    case 4uLL:
      return -[SignpostEvent overridesEmitTime](self, "overridesEmitTime");
    case 2uLL:
      return -[SignpostEvent overridesEndTime](self, "overridesEndTime");
    case 1uLL:
      return -[SignpostEvent overridesBeginTime](self, "overridesBeginTime");
  }
  return 1;
}

- (BOOL)overridesEmitTime
{
  return -[SignpostEvent overridingEmitMachContinuousTime](self, "overridingEmitMachContinuousTime") != 0;
}

- (unint64_t)overridingEmitMachContinuousTime
{
  return self->_overridingEmitMachContinuousTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_stackFrames, 0);
  objc_storeStrong((id *)&self->_metadataSegments, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_senderImageUUID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processImagePath, 0);
  objc_storeStrong((id *)&self->_processImageUUID, 0);
}

- (BOOL)isGenerator
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SignpostEvent metadataSegments](self, "metadataSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[SignpostEvent metadataSegments](self, "metadataSegments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isGenerator") & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)_argumentObjectWithName:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name=%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SignpostEvent metadataSegments](self, "metadataSegments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "placeholderTokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "isEqualToString:", v4) & 1) != 0)
              {
                objc_msgSend(v10, "argument");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "argumentObject");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v16 = 0;
    }
    while (v7);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (NSArray)metadataSegments
{
  return self->_metadataSegments;
}

- (int)processID
{
  return self->_processID;
}

- (BOOL)isAnimationStart
{
  return self->_isAnimationStart;
}

- (unint64_t)_machContinuousTimestamp
{
  return self->__machContinuousTimestamp;
}

- (unint64_t)_resolvedEndTime
{
  unint64_t result;

  result = -[SignpostEvent _resolvedEventType](self, "_resolvedEventType");
  if (result - 2 < 2)
  {
    result = -[SignpostEvent overridingEndMachContinuousTime](self, "overridingEndMachContinuousTime");
    if (result)
      return result;
    return -[SignpostEvent _machContinuousTimestamp](self, "_machContinuousTimestamp");
  }
  if (result == 1)
  {
    result = -[SignpostEvent overridingBeginMachContinuousTime](self, "overridingBeginMachContinuousTime");
    if (result)
      return result;
    return -[SignpostEvent _machContinuousTimestamp](self, "_machContinuousTimestamp");
  }
  if (result == 4)
  {
    result = -[SignpostEvent overridingEmitMachContinuousTime](self, "overridingEmitMachContinuousTime");
    if (!result)
      return -[SignpostEvent _machContinuousTimestamp](self, "_machContinuousTimestamp");
  }
  return result;
}

- (BOOL)overridesEndTime
{
  return -[SignpostEvent overridingEndMachContinuousTime](self, "overridingEndMachContinuousTime") != 0;
}

- (unint64_t)overridingEndMachContinuousTime
{
  return self->_overridingEndMachContinuousTime;
}

- (NSString)_key
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostSupportObject subsystem](self, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostObject name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__%@__%#llx"), v4, v5, v6, -[SignpostObject signpostId](self, "signpostId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)_resolvedBeginTime
{
  unint64_t result;

  result = -[SignpostEvent _resolvedEventType](self, "_resolvedEventType");
  switch(result)
  {
    case 1uLL:
    case 3uLL:
      result = -[SignpostEvent overridingBeginMachContinuousTime](self, "overridingBeginMachContinuousTime");
      if (!result)
        goto LABEL_7;
      break;
    case 2uLL:
      result = -[SignpostEvent overridingEndMachContinuousTime](self, "overridingEndMachContinuousTime");
      if (!result)
        goto LABEL_7;
      break;
    case 4uLL:
      result = -[SignpostEvent overridingEmitMachContinuousTime](self, "overridingEmitMachContinuousTime");
      if (!result)
LABEL_7:
        result = -[SignpostEvent _machContinuousTimestamp](self, "_machContinuousTimestamp");
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_resolvedEventType
{
  unint64_t v4;
  unint64_t v5;

  if (-[SignpostEvent isSyntheticIntervalEvent](self, "isSyntheticIntervalEvent"))
    return 3;
  v4 = -[SignpostEvent eventType](self, "eventType");
  v5 = 1;
  if (v4 == 1)
    v5 = 2;
  if (v4 == 2)
    return 4;
  else
    return v5;
}

- (BOOL)isSyntheticIntervalEvent
{
  if (-[SignpostEvent eventType](self, "eventType") != 2)
    return 0;
  if (-[SignpostEvent overridesBeginTime](self, "overridesBeginTime"))
    return 1;
  return -[SignpostEvent overridesEndTime](self, "overridesEndTime");
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (BOOL)overridesBeginTime
{
  return -[SignpostEvent overridingBeginMachContinuousTime](self, "overridingBeginMachContinuousTime") != 0;
}

- (unint64_t)overridingBeginMachContinuousTime
{
  return self->_overridingBeginMachContinuousTime;
}

- (SignpostEvent)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5 unixDate:(timeval *)a6 unixTimeZone:(timezone *)a7 stackFrames:(id)a8
{
  id v15;
  SignpostEvent *v16;
  SignpostEvent *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SignpostEvent;
  v16 = -[SignpostSupportObject initWithSubsystem:category:timebaseRatio:](&v19, sel_initWithSubsystem_category_timebaseRatio_, a3, a4, a5);
  v17 = v16;
  if (v16)
  {
    if (a6)
    {
      v16->_tv_sec = a6->tv_sec;
      v16->_tv_usec = a6->tv_usec;
    }
    if (a7)
    {
      v16->_tz_minuteswest = a7->tz_minuteswest;
      v16->_tz_dsttime = a7->tz_dsttime;
    }
    objc_storeStrong((id *)&v16->_stackFrames, a8);
  }

  return v17;
}

- (void)setOverridingEndMachContinuousTime:(unint64_t)a3
{
  self->_overridingEndMachContinuousTime = a3;
}

- (void)set_totalSkyLightCompositeCount:(unint64_t)a3
{
  self->__totalSkyLightCompositeCount = a3;
}

- (void)set_hasTotalSkyLightCompositeCount:(BOOL)a3
{
  self->__hasTotalSkyLightCompositeCount = a3;
}

- (unint64_t)_totalSkyLightCompositeCount
{
  return self->__totalSkyLightCompositeCount;
}

- (id)_numberArgumentWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SignpostEvent _argumentObjectWithName:expectedClass:](self, "_argumentObjectWithName:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_argumentObjectWithName:(id)a3 expectedClass:(Class)a4
{
  void *v4;
  id v5;

  -[SignpostEvent _argumentObjectWithName:](self, "_argumentObjectWithName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (id)_stringArgumentWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SignpostEvent _argumentObjectWithName:expectedClass:](self, "_argumentObjectWithName:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (BOOL)_hasTotalSkyLightCompositeCount
{
  return self->__hasTotalSkyLightCompositeCount;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)setIsAnimationStart:(BOOL)a3
{
  self->_isAnimationStart = a3;
}

- (unint64_t)durationMachContinuousTime
{
  return 0;
}

+ (id)serializationTypeNumber
{
  if (serializationTypeNumber_onceToken != -1)
    dispatch_once(&serializationTypeNumber_onceToken, &__block_literal_global_16);
  return (id)serializationTypeNumber_serializationTypeNumber;
}

void __55__SignpostEvent_Serialization__serializationTypeNumber__block_invoke()
{
  void *v0;

  v0 = (void *)serializationTypeNumber_serializationTypeNumber;
  serializationTypeNumber_serializationTypeNumber = (uint64_t)&unk_1E462E8A0;

}

- (id)humanReadableType
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[SignpostEvent eventType](self, "eventType");
  v3 = CFSTR("SignpostEvent_Standalone");
  if (!v2)
    v3 = CFSTR("SignpostEvent_IntervalBegin");
  if (v2 == 1)
    return CFSTR("SignpostEvent_IntervalEnd");
  else
    return (id)v3;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  int v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  const __CFString *v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v4 = a4;
  v5 = a3;
  v61 = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)SignpostEvent;
  -[SignpostObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v58, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _addArchiveEventFieldsInDictionaryWithArchiveEvent(v7, self, v5);
  -[SignpostEvent metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SignpostEvent metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v10 = CFSTR("MetadataString");
    else
      v10 = CFSTR("Meta");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SignpostEvent eventType](self, "eventType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v12 = CFSTR("EventType");
  else
    v12 = CFSTR("EType");
  if (v5)
    v13 = CFSTR("IsAnimation");
  else
    v13 = CFSTR("IsAni");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SignpostEvent isAnimationStart](self, "isAnimationStart"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

  if (-[SignpostEvent overridesBeginTime](self, "overridesBeginTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostEvent overridingBeginMachContinuousTime](self, "overridingBeginMachContinuousTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v16 = CFSTR("OverridingBeginMCTimestamp");
    else
      v16 = CFSTR("OBegin");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

  }
  if (-[SignpostEvent overridesEndTime](self, "overridesEndTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostEvent overridingEndMachContinuousTime](self, "overridingEndMachContinuousTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v18 = CFSTR("OverridingEndMCTimestamp");
    else
      v18 = CFSTR("OEnd");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);

  }
  if (-[SignpostEvent overridesEmitTime](self, "overridesEmitTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostEvent overridingEmitMachContinuousTime](self, "overridingEmitMachContinuousTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v20 = CFSTR("OverridingEmitMCTimestamp");
    else
      v20 = CFSTR("OEmit");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v20);

  }
  -[SignpostEvent metadataSegments](self, "metadataSegments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0x1E0C99000uLL;
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[SignpostEvent metadataSegments](self, "metadataSegments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v25)
    {
      v26 = v25;
      v48 = v7;
      v27 = 0;
      v28 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v53 = 0;
          objc_msgSend(v30, "_dictionaryRepresentationWithIsHumanReadable:shouldRedact:didRedactOut:", v5, v4, &v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString addObject:](v23, "addObject:", v31);

          v32 = v53 | v27;
          v27 = v32 != 0;
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v26);
      v33 = v32;

      v7 = v48;
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v23, CFSTR("Placeholders"));
      v22 = 0x1E0C99000;
      if (!v33)
        goto LABEL_43;
      -[SignpostEvent metadata](self, "metadata");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_43;
      if (v5)
        v35 = CFSTR("MetadataString");
      else
        v35 = CFSTR("Meta");
      v36 = CFSTR("<redacted>");
      v37 = v48;
    }
    else
    {

      v35 = CFSTR("Placeholders");
      v37 = v7;
      v36 = v23;
    }
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v35);
LABEL_43:

  }
  -[SignpostEvent stackFrames](self, "stackFrames");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(*(id *)(v22 + 3560), "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[SignpostEvent stackFrames](self, "stackFrames");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v50 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "_serializableArrayRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v42);
    }

    if (v5)
      v46 = CFSTR("StackFrames");
    else
      v46 = CFSTR("Stack");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, v46);

  }
  return v7;
}

- (SignpostEvent)initWithDictionary:(id)a3
{
  id v4;
  SignpostEvent *v5;
  SignpostEvent *v6;
  SignpostEvent *v7;
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
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  SignpostSupportMetadataSegment *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  SignpostStackFrame *v32;
  SignpostEvent *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_35;
  v48.receiver = self;
  v48.super_class = (Class)SignpostEvent;
  v5 = -[SignpostObject initWithDictionary:](&v48, sel_initWithDictionary_, v4);
  self = v5;
  if (!v5)
  {
LABEL_33:
    self = self;
    v7 = self;
    goto LABEL_36;
  }
  if (!_initArchiveEventFieldsWithSerializedObjectDictionary(v5, v4))
  {
LABEL_35:
    v7 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EType"));
  v6 = (SignpostEvent *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[SignpostEvent setEventType:](self, "setEventType:", -[SignpostEvent unsignedIntegerValue](v6, "unsignedIntegerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsAni"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v38 = v8;
      -[SignpostEvent setIsAnimationStart:](self, "setIsAnimationStart:", objc_msgSend(v8, "BOOLValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Meta"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostEvent setMetadata:](self, "setMetadata:", v9);

      if (-[SignpostEvent isAnimationStart](self, "isAnimationStart"))
      {
        -[SignpostEvent metadata](self, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostEvent setAnimationTypeFromRawMetadata:](self, "setAnimationTypeFromRawMetadata:", v10);

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OBegin"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        -[SignpostEvent setOverridingBeginMachContinuousTime:](self, "setOverridingBeginMachContinuousTime:", objc_msgSend(v11, "unsignedLongLongValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OEnd"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        -[SignpostEvent setOverridingEndMachContinuousTime:](self, "setOverridingEndMachContinuousTime:", objc_msgSend(v13, "unsignedLongLongValue"));
      v36 = v14;
      v37 = v12;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OEmit"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        -[SignpostEvent setOverridingEmitMachContinuousTime:](self, "setOverridingEmitMachContinuousTime:", objc_msgSend(v15, "unsignedLongLongValue"));
      v35 = v16;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Placeholders"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v17;
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v45 != v22)
                objc_enumerationMutation(v19);
              v24 = -[SignpostSupportMetadataSegment initWithDictionary:]([SignpostSupportMetadataSegment alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
              objc_msgSend(v18, "addObject:", v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
          }
          while (v21);
        }

        -[SignpostEvent setMetadataSegments:](self, "setMetadataSegments:", v18);
        -[SignpostEvent _populateMetrics](self, "_populateMetrics");

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Stack"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v34 = v7;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v27 = v25;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v41 != v30)
                objc_enumerationMutation(v27);
              v32 = -[SignpostStackFrame initWithArrayRepresentation:]([SignpostStackFrame alloc], "initWithArrayRepresentation:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
              objc_msgSend(v26, "addObject:", v32);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v29);
        }

        -[SignpostEvent setStackFrames:](self, "setStackFrames:", v26);
        v7 = v34;
        v17 = v39;
      }

      goto LABEL_33;
    }

    goto LABEL_35;
  }
LABEL_36:

  return v7;
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v12;
  void *v13;
  unint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SignpostEvent;
  -[SignpostObject _descriptionStringForColumn:timeFormat:asBegin:](&v15, sel__descriptionStringForColumn_timeFormat_asBegin_, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
LABEL_3:
    v10 = v9;
    goto LABEL_4;
  }
  v10 = 0;
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), -[SignpostEvent threadID](self, "threadID"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 18)
        goto LABEL_4;
      -[SignpostEvent metadata](self, "metadata");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_3;
  }
  if (a3 == 5)
  {
    v14 = -[SignpostEvent _resolvedEventType](self, "_resolvedEventType");
    if (v14 - 1 > 3)
      v10 = CFSTR("UNKNOWN");
    else
      v10 = *(&off_1E46019A8 + v14 - 1);
  }
  else if (a3 == 9)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostEvent processName](self, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@[%d]"), v13, -[SignpostEvent processID](self, "processID"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return v10;
}

- (id)_debugDescription:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
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
  _BOOL4 v18;
  const __CFString *v19;
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
  __CFString *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  const __CFString *v49;
  unint64_t v50;
  const __CFString *v51;
  _BOOL4 v52;
  const __CFString *v53;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  void *v61;
  unint64_t v62;
  id v63;
  id v64;
  __CFString *v65;
  __CFString *v66;
  void *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v3 = a3;
  v76 = *MEMORY[0x1E0C80C00];
  -[SignpostObject attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0x1E0CB3000uLL;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostObject attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Attributes:\n%@\n"), v9);
    v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v70 = &stru_1E4610268;
  }
  -[SignpostEvent metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostEvent metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("\nMetadata:\n%@\n"), v12);
    v69 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v69 = &stru_1E4610268;
  }
  -[SignpostEvent metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostEvent metrics](self, "metrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("\nPerformance Metrics:\n%@\n"), v16);
    v68 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = &stru_1E4610268;
  }
  v17 = (void *)MEMORY[0x1E0CB37A0];
  v18 = -[SignpostObject telemetryEnabled](self, "telemetryEnabled");
  v19 = CFSTR("Disabled");
  if (v18)
    v19 = CFSTR("Enabled");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Telemetry:%@\n"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostObject string1Name](self, "string1Name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SignpostObject string1Name](self, "string1Name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostObject string1Value](self, "string1Value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", CFSTR("String1: %@ -> %@\n"), v22, v23);

  }
  -[SignpostObject string2Name](self, "string2Name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SignpostObject string2Name](self, "string2Name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostObject string2Value](self, "string2Value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", CFSTR("String2: %@ -> %@\n"), v25, v26);

  }
  -[SignpostObject number1Name](self, "number1Name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SignpostObject number1Name](self, "number1Name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostObject number1Value](self, "number1Value");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", CFSTR("Number1: %@ -> %@\n"), v28, v29);

  }
  -[SignpostObject number2Name](self, "number2Name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[SignpostObject number2Name](self, "number2Name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostObject number2Value](self, "number2Value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", CFSTR("Number2: %@ -> %@\n"), v31, v32);

  }
  if (-[SignpostEvent _overridesOwnTime](self, "_overridesOwnTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (Overrides %llu)"), -[SignpostEvent timeRecordedMachContinuousTime](self, "timeRecordedMachContinuousTime"));
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = &stru_1E4610268;
  }
  if (-[SignpostObject signpostId](self, "signpostId") == 0xEEEEB0B5B2B2EEEELL
    || -[SignpostObject signpostId](self, "signpostId") == 0xCABA71571CC0FFEELL)
  {
    v65 = CFSTR("OS_SIGNPOST_ID_EXCLUSIVE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), -[SignpostObject signpostId](self, "signpostId"));
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v67 = v20;
  -[SignpostEvent stackFrames](self, "stackFrames");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0CB37A0];
    -[SignpostEvent stackFrames](self, "stackFrames");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Stack Frames (%lu frames):\n"), objc_msgSend(v35, "count"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    -[SignpostEvent stackFrames](self, "stackFrames");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v72 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "debugDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v36, "appendFormat:", CFSTR("%@\n"), v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v39);
    }

    v6 = 0x1E0CB3000;
  }
  else
  {
    v36 = &stru_1E4610268;
  }
  v63 = *(id *)(v6 + 2368);
  if (v3)
    v43 = -[SignpostEvent startMachContinuousTime](self, "startMachContinuousTime");
  else
    v43 = -[SignpostEvent endMachContinuousTime](self, "endMachContinuousTime");
  v62 = v43;
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  v45 = v44;
  v60 = -[SignpostEvent tv_sec](self, "tv_sec");
  v59 = -[SignpostEvent tv_usec](self, "tv_usec");
  v58 = -[SignpostEvent tz_minuteswest](self, "tz_minuteswest");
  v57 = -[SignpostEvent tz_dsttime](self, "tz_dsttime");
  -[SignpostEvent processName](self, "processName");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[SignpostEvent processID](self, "processID");
  -[SignpostSupportObject subsystem](self, "subsystem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject category](self, "category");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostObject name](self, "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[SignpostObject scope](self, "scope");
  if (v48 > 2)
    v49 = CFSTR("UNKNOWN");
  else
    v49 = *(&off_1E4601990 + v48);
  v50 = -[SignpostEvent _resolvedEventType](self, "_resolvedEventType") - 1;
  if (v50 > 3)
    v51 = CFSTR("UNKNOWN");
  else
    v51 = *(&off_1E46019A8 + v50);
  v52 = -[SignpostEvent isAnimationStart](self, "isAnimationStart");
  v53 = CFSTR("Animation Start");
  if (!v52)
    v53 = &stru_1E4610268;
  objc_msgSend(v63, "stringWithFormat:", CFSTR("mach_continuous_time: %llu%@\nTimebase Ratio:%f\nUnix Date Seconds:%lu Usec: %d\nUnix Time Zone Minutes West: %d DSTTime: %d\nProcess:%@[%d]\nSubsystem:%@\nCategory:%@\nName:%@\nScope:%@\nID:%@\nType:%@\n%@%@%@%@%@%@"), v62, v66, v45, v60, v59, v58, v57, v61, v55, v46, v47, v56, v49, v65, v51, v53,
    v70,
    v67,
    v69,
    v36,
    v68);
  v64 = (id)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (NSString)debugDescription
{
  return (NSString *)-[SignpostEvent _debugDescription:](self, "_debugDescription:", 1);
}

- (unint64_t)timeRecordedNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostEvent timeRecordedMachContinuousTime](self, "timeRecordedMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)overridingBeginNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostEvent overridingBeginMachContinuousTime](self, "overridingBeginMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)overridingEndNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostEvent overridingEndMachContinuousTime](self, "overridingEndMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)overridingEmitNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostEvent overridingEmitMachContinuousTime](self, "overridingEmitMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (BOOL)overridesTime
{
  return -[SignpostEvent overridesEmitTime](self, "overridesEmitTime")
      || -[SignpostEvent overridesBeginTime](self, "overridesBeginTime")
      || -[SignpostEvent overridesEndTime](self, "overridesEndTime");
}

- (float)durationSeconds
{
  return 0.0;
}

- (void)_adjustTimeStruct:(timeval *)a3 asBegin:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;

  v4 = a4;
  a3->tv_sec = -[SignpostEvent tv_sec](self, "tv_sec");
  a3->tv_usec = -[SignpostEvent tv_usec](self, "tv_usec");
  if (v4)
    v7 = -[SignpostSupportObject startNanoseconds](self, "startNanoseconds");
  else
    v7 = -[SignpostSupportObject endNanoseconds](self, "endNanoseconds");
  _adjustTimeVal(&a3->tv_sec, v7 - -[SignpostEvent timeRecordedNanoseconds](self, "timeRecordedNanoseconds"));
}

- (void)_adjustBeginTimeVal:(timeval *)a3
{
  -[SignpostEvent _adjustTimeStruct:asBegin:](self, "_adjustTimeStruct:asBegin:", a3, 1);
}

- (void)_adjustEndTimeVal:(timeval *)a3
{
  -[SignpostEvent _adjustTimeStruct:asBegin:](self, "_adjustTimeStruct:asBegin:", a3, 0);
}

- (id)_dataArgumentWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SignpostEvent _argumentObjectWithName:expectedClass:](self, "_argumentObjectWithName:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SignpostEvent)initWithName:(id)a3 beginMct:(unint64_t)a4 endMct:(unint64_t)a5 emitMct:(unint64_t)a6 signpostId:(unint64_t)a7 generatorEvent:(id)a8
{
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  SignpostEvent *v26;
  void *v28;
  void *v29;
  SignpostEvent *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v14 = a3;
  v15 = a8;
  v16 = v15;
  v17 = a5 | a4;
  if (a5 | a4 && a6)
  {
    _signpost_debug_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SignpostEvent initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:].cold.3();
LABEL_13:

LABEL_14:
    v26 = 0;
    goto LABEL_15;
  }
  if (!(v17 | a6))
  {
    _signpost_debug_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SignpostEvent initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:].cold.1((uint64_t)v14, v18, v20, v21, v22, v23, v24, v25);
    goto LABEL_13;
  }
  if (a4 > a5 && v17)
  {
    _signpost_debug_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SignpostEvent initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:].cold.2(a4, a5, v19);

    goto LABEL_14;
  }
  objc_msgSend(v15, "subsystem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "category");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timebaseRatio");
  v37.receiver = self;
  v37.super_class = (Class)SignpostEvent;
  v30 = -[SignpostSupportObject initWithSubsystem:category:timebaseRatio:](&v37, sel_initWithSubsystem_category_timebaseRatio_, v28, v29);

  if (v30)
  {
    -[SignpostObject setName:](v30, "setName:", v14);
    -[SignpostEvent setOverridingBeginMachContinuousTime:](v30, "setOverridingBeginMachContinuousTime:", a4);
    -[SignpostEvent setOverridingEndMachContinuousTime:](v30, "setOverridingEndMachContinuousTime:", a5);
    -[SignpostEvent setOverridingEmitMachContinuousTime:](v30, "setOverridingEmitMachContinuousTime:", a6);
    -[SignpostObject setSignpostId:](v30, "setSignpostId:", a7);
    -[SignpostEvent setEventType:](v30, "setEventType:", 2);
    -[SignpostEvent set_machContinuousTimestamp:](v30, "set_machContinuousTimestamp:", objc_msgSend(v16, "_machContinuousTimestamp"));
    -[SignpostEvent setProcessID:](v30, "setProcessID:", objc_msgSend(v16, "processID"));
    -[SignpostEvent setProcessUniqueID:](v30, "setProcessUniqueID:", objc_msgSend(v16, "processUniqueID"));
    -[SignpostEvent setThreadID:](v30, "setThreadID:", objc_msgSend(v16, "threadID"));
    objc_msgSend(v16, "processImageUUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostEvent setProcessImageUUID:](v30, "setProcessImageUUID:", v31);

    objc_msgSend(v16, "processImagePath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostEvent setProcessImagePath:](v30, "setProcessImagePath:", v32);

    objc_msgSend(v16, "processName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostEvent setProcessName:](v30, "setProcessName:", v33);

    objc_msgSend(v16, "senderImageUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostEvent setSenderImageUUID:](v30, "setSenderImageUUID:", v34);

    objc_msgSend(v16, "senderImagePath");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostEvent setSenderImagePath:](v30, "setSenderImagePath:", v35);

    objc_msgSend(v16, "stackFrames");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostEvent setStackFrames:](v30, "setStackFrames:", v36);

    -[SignpostObject setScope:](v30, "setScope:", objc_msgSend(v16, "scope"));
    -[SignpostEvent setTv_sec:](v30, "setTv_sec:", objc_msgSend(v16, "tv_sec"));
    -[SignpostEvent setTv_usec:](v30, "setTv_usec:", objc_msgSend(v16, "tv_usec"));
    -[SignpostEvent setTz_minuteswest:](v30, "setTz_minuteswest:", objc_msgSend(v16, "tz_minuteswest"));
    -[SignpostEvent setTz_dsttime:](v30, "setTz_dsttime:", objc_msgSend(v16, "tz_dsttime"));
  }
  self = v30;
  v26 = self;
LABEL_15:

  return v26;
}

+ (id)_generatedEventFromMetadata:(id)a3 generatorEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SignpostEvent *v21;
  void *v22;
  SignpostEvent *v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "baseMct");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(v5, "beginMct");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "beginMct");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue") + v8;

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v5, "endMct");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "endMct");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongLongValue") + v8;

  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v5, "emitMct");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v5, "emitMct");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedLongLongValue") + v8;

  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v5, "signpostId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v5, "signpostId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedLongLongValue");

  }
  else
  {
    v20 = objc_msgSend(v6, "signpostId");
  }

  if (!v11 || v14)
  {
    if (v14 && !v11)
      v11 = objc_msgSend(v6, "_machContinuousTimestamp");
  }
  else
  {
    v14 = objc_msgSend(v6, "_machContinuousTimestamp");
  }
  v21 = [SignpostEvent alloc];
  objc_msgSend(v5, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SignpostEvent initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:](v21, "initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:", v22, v11, v14, v17, v20, v6);

  return v23;
}

+ (id)_generatedEventArrayForEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  _GeneratedSignpostMetadata *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  unsigned int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  unint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  _BYTE v73[15];
  char v74;
  _BYTE v75[15];
  char v76;
  _BYTE v77[15];
  char v78;
  _BYTE v79[15];
  char v80;
  _BYTE v81[15];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint8_t v87[4];
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v59 = v4;
  objc_msgSend(v4, "metadataSegments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (!v7)
  {
    v63 = 0;
    goto LABEL_63;
  }
  v8 = v7;
  v63 = 0;
  v9 = *(_QWORD *)v83;
  v62 = v5;
  v60 = v6;
  v61 = a1;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v83 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isGenerator"))
      {
        objc_msgSend(v11, "typeNamespace");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12
          || (v13 = (void *)v12,
              objc_msgSend(v11, "type"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              !v14))
        {
          _signpost_debug_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            +[SignpostEvent _generatedEventArrayForEvent:].cold.1(&v80, v81);
          goto LABEL_25;
        }
        objc_msgSend(v11, "argument");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "type");

        if (v16 != 3)
        {
          _signpost_debug_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            +[SignpostEvent _generatedEventArrayForEvent:].cold.6(&v78, v79);
          goto LABEL_25;
        }
        objc_msgSend(v11, "argument");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "argumentObject");
        v18 = objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "type");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("base_mct"));

            if (v20)
            {
              if (v63)
              {
                _signpost_debug_log();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                  +[SignpostEvent _generatedEventArrayForEvent:].cold.3(&v72, v73);
                goto LABEL_24;
              }
              v18 = v18;
              v63 = v18;
LABEL_25:

              goto LABEL_26;
            }
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            objc_msgSend(v11, "placeholderTokens");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v69;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v69 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                  if (objc_msgSend(v27, "hasPrefix:", CFSTR("name=")))
                  {
                    objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:", CFSTR("name="), &stru_1E4610268);
                    v28 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_38;
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
                if (v24)
                  continue;
                break;
              }
              v28 = 0;
LABEL_38:
              v5 = v62;
              v6 = v60;
            }
            else
            {
              v28 = 0;
            }

            objc_msgSend(v5, "objectForKeyedSubscript:", v28);
            v29 = (_GeneratedSignpostMetadata *)objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              v29 = -[_GeneratedSignpostMetadata initWithName:]([_GeneratedSignpostMetadata alloc], "initWithName:", v28);
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v28);
            }
            v30 = (void *)v28;
            objc_msgSend(v11, "type");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("id"));

            if (v32)
            {
              -[_GeneratedSignpostMetadata setSignpostId:](v29, "setSignpostId:", v18);
LABEL_55:
              a1 = v61;

              v5 = v62;
              goto LABEL_25;
            }
            objc_msgSend(v11, "type");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("begin"));

            if (v34)
            {
              -[_GeneratedSignpostMetadata setBeginMct:](v29, "setBeginMct:", v18);
              goto LABEL_55;
            }
            objc_msgSend(v11, "type");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("end"));

            if (v36)
            {
              -[_GeneratedSignpostMetadata setEndMct:](v29, "setEndMct:", v18);
              goto LABEL_55;
            }
            objc_msgSend(v11, "type");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("begin_end_16b"));

            if (v38)
            {
              v39 = -[NSObject unsignedIntValue](v18, "unsignedIntValue");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIWORD(v39));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[_GeneratedSignpostMetadata setBeginMct:](v29, "setBeginMct:", v40);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (unsigned __int16)v39);
              v41 = objc_claimAutoreleasedReturnValue();
              goto LABEL_53;
            }
            objc_msgSend(v11, "type");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("begin_end_32b"));

            if (v43)
            {
              v44 = -[NSObject unsignedLongLongValue](v18, "unsignedLongLongValue");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", HIDWORD(v44));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[_GeneratedSignpostMetadata setBeginMct:](v29, "setBeginMct:", v45);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v44);
              v41 = objc_claimAutoreleasedReturnValue();
LABEL_53:
              v46 = v41;
              -[_GeneratedSignpostMetadata setEndMct:](v29, "setEndMct:", v41);
            }
            else
            {
              objc_msgSend(v11, "type");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("event"));

              if (v48)
              {
                -[_GeneratedSignpostMetadata setEmitMct:](v29, "setEmitMct:", v18);
                goto LABEL_55;
              }
              _signpost_debug_log();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                +[SignpostEvent _generatedEventArrayForEvent:].cold.4(v87, v11, &v88, v46);
            }

            goto LABEL_55;
          }
          _signpost_debug_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            +[SignpostEvent _generatedEventArrayForEvent:].cold.5(&v74, v75);
        }
        else
        {
          _signpost_debug_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            +[SignpostEvent _generatedEventArrayForEvent:].cold.2(&v76, v77);
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_26:
      ++v10;
    }
    while (v10 != v8);
    v49 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    v8 = v49;
  }
  while (v49);
LABEL_63:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v5, "allValues");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v65 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
        objc_msgSend(v56, "setBaseMct:", v63);
        objc_msgSend(a1, "_generatedEventFromMetadata:generatorEvent:", v56, v59);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
          objc_msgSend(v50, "addObject:", v57);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
    }
    while (v53);
  }

  objc_msgSend(v50, "addObject:", v59);
  objc_msgSend(v50, "sortUsingComparator:", &__block_literal_global_26);

  return v50;
}

uint64_t __46__SignpostEvent__generatedEventArrayForEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "startMachContinuousTime");
  if (v6 >= objc_msgSend(v5, "startMachContinuousTime"))
  {
    v8 = objc_msgSend(v4, "startMachContinuousTime");
    v7 = v8 > objc_msgSend(v5, "startMachContinuousTime");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)metadataSegmentsWithPlaceholderTokenKey:(id)a3 value:(id)a4
{
  void *v4;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3940];
    v8 = a4;
    v9 = a3;
    v10 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR("%@=%@"), v9, v8);

    -[SignpostEvent metadataSegmentsWithPlaceholderToken:](self, "metadataSegmentsWithPlaceholderToken:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)metadataSegmentsWithPlaceholderToken:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (-[SignpostEvent metadataSegments](self, "metadataSegments"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SignpostEvent metadataSegments](self, "metadataSegments", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPlaceholderToken:", v4))
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
      v14 = v7;
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)placeholderTokenValueDictForTokenKey:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  id v14;
  id v15;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  if (v19)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SignpostEvent metadataSegments](self, "metadataSegments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v6, "placeholderTokensForKey:", v19);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v21 = v7;
            v8 = v7;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v23;
              do
              {
                for (j = 0; j != v10; ++j)
                {
                  if (*(_QWORD *)v23 != v11)
                    objc_enumerationMutation(v8);
                  v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
                  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
                  v14 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v14)
                  {
                    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);
                  }
                  objc_msgSend(v14, "addObject:", v6);

                }
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v10);
            }

            v7 = v21;
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }

    if (objc_msgSend(v4, "count"))
      v15 = v4;
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)tv_sec
{
  return self->_tv_sec;
}

- (void)setTv_sec:(int64_t)a3
{
  self->_tv_sec = a3;
}

- (int)tv_usec
{
  return self->_tv_usec;
}

- (void)setTv_usec:(int)a3
{
  self->_tv_usec = a3;
}

- (int)tz_minuteswest
{
  return self->_tz_minuteswest;
}

- (void)setTz_minuteswest:(int)a3
{
  self->_tz_minuteswest = a3;
}

- (int)tz_dsttime
{
  return self->_tz_dsttime;
}

- (void)setTz_dsttime:(int)a3
{
  self->_tz_dsttime = a3;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (void)setOverridingEmitMachContinuousTime:(unint64_t)a3
{
  self->_overridingEmitMachContinuousTime = a3;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (NSArray)stackFrames
{
  return self->_stackFrames;
}

- (void)setStackFrames:(id)a3
{
  objc_storeStrong((id *)&self->_stackFrames, a3);
}

- (SignpostMetrics)metrics
{
  return self->_metrics;
}

- (void)initWithName:(uint64_t)a3 beginMct:(uint64_t)a4 endMct:(uint64_t)a5 emitMct:(uint64_t)a6 signpostId:(uint64_t)a7 generatorEvent:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a2, a3, "No timestamps provided for generated event/interval with name %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithName:(NSObject *)a3 beginMct:endMct:emitMct:signpostId:generatorEvent:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_6(&dword_1A1A28000, a3, (uint64_t)a3, "Begin timestamp %llu > end timestamp %llu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithName:beginMct:endMct:emitMct:signpostId:generatorEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "Generator for event provided both interval and event timestamps", v2);
  OUTLINED_FUNCTION_9();
}

+ (void)_generatedEventArrayForEvent:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v2, (uint64_t)v2, "Skipping argument lacking type namespace and/or type", v3);
}

+ (void)_generatedEventArrayForEvent:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v2, (uint64_t)v2, "Skipping nil argument when generating event", v3);
}

+ (void)_generatedEventArrayForEvent:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v2, (uint64_t)v2, "Base MCT specified multiple times. Ignoring subsequent values...", v3);
}

+ (void)_generatedEventArrayForEvent:(_QWORD *)a3 .cold.4(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A1A28000, a4, OS_LOG_TYPE_DEBUG, "Unknown generator type: %@", a1, 0xCu);

}

+ (void)_generatedEventArrayForEvent:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v2, (uint64_t)v2, "Skipping generator argument with invalid type", v3);
}

+ (void)_generatedEventArrayForEvent:(_BYTE *)a1 .cold.6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v2, (uint64_t)v2, "Skipping non-number argument when generating event", v3);
}

@end
