@implementation TISKSessionStats

- (id)init:(id)a3 endDate:(id)a4 identifier:(id)a5 version:(id)a6 inputMode:(id)a7 sessionIds:(id)a8 layout:(id)a9
{
  id v16;
  id v17;
  id v18;
  TISKSessionStats *v19;
  uint64_t v20;
  NSMutableDictionary *keyedMetrics;
  TISKEvent *startTimerEvent;
  uint64_t v23;
  NSMutableArray *sessionIds;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)TISKSessionStats;
  v19 = -[TISKSessionStats init](&v30, sel_init);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v26, v27, v28, v29);
    v20 = objc_claimAutoreleasedReturnValue();
    keyedMetrics = v19->_keyedMetrics;
    v19->_keyedMetrics = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v19->_startTime, a3);
    objc_storeStrong((id *)&v19->_endTime, a4);
    startTimerEvent = v19->_startTimerEvent;
    v19->_startTimerEvent = 0;

    objc_storeStrong((id *)&v19->_identifier, a5);
    objc_storeStrong((id *)&v19->_version, a6);
    objc_storeStrong((id *)&v19->_inputMode, a7);
    v23 = objc_msgSend(v17, "mutableCopy");
    sessionIds = v19->_sessionIds;
    v19->_sessionIds = (NSMutableArray *)v23;

    objc_storeStrong((id *)&v19->_layout, a9);
    v19->_isEmpty = 1;
    -[TISKSessionStats setup](v19, "setup");
  }

  return v19;
}

- (void)startTypingTimerWithEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startTimerEvent, a3);
}

- (void)haltTypingTimerWithEvent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  TISKEvent *startTimerEvent;

  if (self->_startTimerEvent)
  {
    objc_msgSend(a3, "touchUpTimestamp");
    v5 = v4;
    -[TISKEvent touchDownTimestamp](self->_startTimerEvent, "touchDownTimestamp");
    v7 = v5 - v6;
    if (v7 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TISKSessionStats addSample:forKey:](self, "addSample:forKey:", v8, kTISKTotalSessionTypingDuration);

      -[TISKSessionStats addToDurationForRateMetric:forKey:](self, "addToDurationForRateMetric:forKey:", kTISKTapTypingSpeed, v7);
    }
    startTimerEvent = self->_startTimerEvent;
    self->_startTimerEvent = 0;

  }
}

- (void)haltTypingTimer
{
  TISKEvent *startTimerEvent;

  startTimerEvent = self->_startTimerEvent;
  self->_startTimerEvent = 0;

}

- (BOOL)isTypingTimerHalted
{
  return self->_startTimerEvent == 0;
}

- (void)setup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  NSMutableDictionary *keyedMetrics;
  uint64_t v12;
  __objc2_class *v13;
  void *v14;
  void *v15;
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
  +[TISKMetricDefinition metricDefinitions](TISKMetricDefinition, "metricDefinitions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v6 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v8);

        switch(objc_msgSend(v6, "metricType"))
        {
          case 0u:
            keyedMetrics = self->_keyedMetrics;
            LODWORD(v10) = 0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 1u:
            keyedMetrics = self->_keyedMetrics;
            v13 = TISKSingleMetricSample;
            goto LABEL_10;
          case 2u:
            keyedMetrics = self->_keyedMetrics;
            v13 = TISKRateMetricSample;
LABEL_10:
            -[__objc2_class makeMetric](v13, "makeMetric");
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 3u:
            keyedMetrics = self->_keyedMetrics;
            +[TISKPositionalMetricSample makeMetric:](TISKPositionalMetricSample, "makeMetric:", objc_msgSend(v6, "positionalSize"));
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v14 = (void *)v12;
            objc_msgSend(v6, "metricName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](keyedMetrics, "setObject:forKey:", v14, v15);

            break;
          default:
            break;
        }
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);

  }
}

- (void)merge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *keyedMetrics;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDate *v27;
  NSDate *startTime;
  void *v29;
  uint64_t v30;
  NSDate *v31;
  NSDate *endTime;
  NSMutableArray *sessionIds;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isEmpty") & 1) != 0)
    goto LABEL_36;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "keyedMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v38)
    goto LABEL_30;
  v8 = *(_QWORD *)v40;
  v37 = *(_QWORD *)v40;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v40 != v8)
        objc_enumerationMutation(v7);
      v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v9);
      -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyedMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[NSMutableDictionary setObject:forKey:](self->_keyedMetrics, "setObject:forKey:", v13, v10);

        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          keyedMetrics = self->_keyedMetrics;
          v15 = v7;
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "floatValue");
          v18 = v17;
          objc_msgSend(v13, "floatValue");
          objc_msgSend(v16, "numberWithInteger:", (uint64_t)(float)(v18 + v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](keyedMetrics, "setObject:forKey:", v20, v10);

          v7 = v15;
          v8 = v37;
          goto LABEL_25;
        }
        IXADefaultLogFacility();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
LABEL_28:
        v35 = (void *)MEMORY[0x1E0CB3940];
        v36 = v7;
        v22 = objc_opt_class();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%s [SensorKit] otherObject has different class: %@ than ownObject: %@ for key: %@"), "-[TISKSessionStats merge:]", v22, objc_opt_class(), v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v23;
        _os_log_error_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        v7 = v36;
LABEL_17:

        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          IXADefaultLogFacility();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_28;
          goto LABEL_17;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            IXADefaultLogFacility();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              goto LABEL_28;
            goto LABEL_17;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            IXADefaultLogFacility();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              goto LABEL_28;
            goto LABEL_17;
          }
        }
      }
      objc_msgSend(v11, "merge:", v13);
LABEL_25:

      ++v9;
    }
    while (v38 != v9);
    v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    v38 = v24;
  }
  while (v24);
LABEL_30:

  objc_msgSend(v5, "startTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "compare:", self->_startTime);

  if (v26 == -1)
  {
    objc_msgSend(v5, "startTime");
    v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v27;

  }
  objc_msgSend(v5, "endTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "compare:", self->_endTime);

  if (v30 == 1)
  {
    objc_msgSend(v5, "endTime");
    v31 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endTime = self->_endTime;
    self->_endTime = v31;

  }
  sessionIds = self->_sessionIds;
  objc_msgSend(v5, "sessionIds");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](sessionIds, "addObjectsFromArray:", v34);

  self->_isEmpty = 0;
LABEL_36:

}

- (BOOL)isEqual:(id)a3
{
  TISKSessionStats *v4;
  TISKSessionStats *v5;
  NSDate *startTime;
  void *v7;
  NSDate *endTime;
  void *v9;
  TIKeyboardLayout *layout;
  void *v11;
  NSString *version;
  void *v13;
  NSString *identifier;
  void *v15;
  NSString *inputMode;
  void *v17;
  NSMutableArray *sessionIds;
  void *v19;
  NSMutableDictionary *keyedMetrics;
  char v21;

  v4 = (TISKSessionStats *)a3;
  v5 = v4;
  if (self != v4)
  {
    startTime = self->_startTime;
    -[TISKSessionStats startTime](v4, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate isEqual:](startTime, "isEqual:", v7))
    {
      endTime = self->_endTime;
      -[TISKSessionStats endTime](v5, "endTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSDate isEqual:](endTime, "isEqual:", v9) & 1) != 0)
      {
        layout = self->_layout;
        -[TISKSessionStats layout](v5, "layout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[TIKeyboardLayout isEqual:](layout, "isEqual:", v11) & 1) != 0)
        {
          version = self->_version;
          -[TISKSessionStats version](v5, "version");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqual:](version, "isEqual:", v13))
          {
            identifier = self->_identifier;
            -[TISKSessionStats identifier](v5, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqual:](identifier, "isEqual:", v15))
            {
              inputMode = self->_inputMode;
              -[TISKSessionStats inputMode](v5, "inputMode");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSString isEqual:](inputMode, "isEqual:", v17))
              {
                sessionIds = self->_sessionIds;
                -[TISKSessionStats sessionIds](v5, "sessionIds");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(sessionIds) = -[NSMutableArray isEqual:](sessionIds, "isEqual:", v19);

                if (!(_DWORD)sessionIds)
                {
                  v21 = 0;
                  goto LABEL_18;
                }
                keyedMetrics = self->_keyedMetrics;
                -[TISKSessionStats keyedMetrics](v5, "keyedMetrics");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[NSMutableDictionary isEqual:](keyedMetrics, "isEqual:", v7);
                goto LABEL_17;
              }

            }
          }

        }
      }

    }
    v21 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v21 = 1;
LABEL_18:

  return v21;
}

- (BOOL)_isPublishable
{
  return self->_identifier && self->_version && self->_layout && self->_inputMode && self->_sessionIds != 0;
}

- (void)addSample:(id)a3 forKey:(id)a4 withPosition:(unint64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "addSample:withPosition:", v9, a5);
  self->_isEmpty = 0;

}

- (void)addSample:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *keyedMetrics;
  void *v9;
  float v10;
  float v11;
  float v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "addSample:", v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      keyedMetrics = self->_keyedMetrics;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "floatValue");
      v11 = v10;
      objc_msgSend(v15, "floatValue");
      *(float *)&v13 = v11 + v12;
      objc_msgSend(v9, "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](keyedMetrics, "setObject:forKey:", v14, v6);

    }
  }
  self->_isEmpty = 0;

}

- (void)addToCounterForRateMetric:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&a3;
  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "addToCounter:", v4);

}

- (void)addToDurationForRateMetric:(double)a3 forKey:(id)a4
{
  id v5;

  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "addToDuration:", a3);

}

- (id)counter:(id)a3
{
  void *v3;
  id v4;

  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)samples:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "samples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)samples:(id)a3 withPosition:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (objc_msgSend(v6, "size") <= a4)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "positionalMetricSample");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "samples");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)singleMetric:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a3);
}

- (id)positionalMetric:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", a3);
}

- (id)description:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v17 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v23.receiver = self;
  v23.super_class = (Class)TISKSessionStats;
  -[TISKSessionStats description](&v23, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_keyedMetrics, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_keyedMetrics, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "description");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v12, "intValue"));
            v14 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_16;
            objc_msgSend(v12, "description:", v17);
            v14 = objc_claimAutoreleasedReturnValue();
          }
        }
        v15 = (void *)v14;

        v13 = v15;
LABEL_16:
        objc_msgSend(v6, "appendFormat:", CFSTR("%@ %@\n"), v11, v13);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_roundUpToNearestHalfHour:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 252, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "minute");
  v8 = 60;
  if (v7 < 45)
    v8 = 30;
  if (v7 >= 15)
    v9 = v8;
  else
    v9 = 0;
  objc_msgSend(v6, "setMinute:", v9);
  objc_msgSend(v6, "setSecond:", 0);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_roundedSessionInterval
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[TISKSessionStats _roundUpToNearestHalfHour:](self, "_roundUpToNearestHalfHour:", self->_startTime);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISKSessionStats _roundUpToNearestHalfHour:](self, "_roundUpToNearestHalfHour:", self->_endTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToDate:", v3))
  {
    objc_msgSend(v3, "dateByAddingTimeInterval:", 1800.0);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);

  return v6;
}

- (id)generateDataForSR
{
  NSObject *v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id *v27;
  void *v28;
  NSMutableArray *sessionIds;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  NSMutableDictionary *keyedMetrics;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  double v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[128];
  _QWORD v69[5];
  id v70;
  _QWORD v71[6];
  __int128 buf;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (!self->_identifier)
  {
    self->_identifier = (NSString *)CFSTR("KEYBOARD-digest");
    IXADefaultLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] _identifier is nil"), "-[TISKSessionStats generateDataForSR]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v55;
      _os_log_error_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

    }
  }
  if (-[TISKSessionStats _isPublishable](self, "_isPublishable"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v4 = (id *)getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr;
    v74 = (void *)getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr)
    {
      v5 = (void *)SensorKitLibrary_17284();
      v4 = (id *)dlsym(v5, "SRKeyboardMetaInformationIdentifierKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v4;
      getSRKeyboardMetaInformationIdentifierKeySymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&buf, 8);
    if (!v4)
      goto LABEL_54;
    v6 = *v4;
    v69[0] = v6;
    v71[0] = self->_identifier;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v7 = (id *)getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr;
    v74 = (void *)getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr)
    {
      v8 = (void *)SensorKitLibrary_17284();
      v7 = (id *)dlsym(v8, "SRKeyboardMetaInformationVersionKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v7;
      getSRKeyboardMetaInformationVersionKeySymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&buf, 8);
    if (!v7)
      goto LABEL_54;
    v9 = *v7;
    v69[1] = v9;
    v71[1] = self->_version;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v10 = (id *)getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr;
    v74 = (void *)getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr)
    {
      v11 = (void *)SensorKitLibrary_17284();
      v10 = (id *)dlsym(v11, "SRKeyboardMetaInformationWidthKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v10;
      getSRKeyboardMetaInformationWidthKeySymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(&buf, 8);
    if (!v10)
      goto LABEL_54;
    v12 = *v10;
    v69[2] = v12;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[TIKeyboardLayout frame](self->_layout, "frame");
    +[TISKMetricDefinition pointsToMM:](TISKMetricDefinition, "pointsToMM:", v14);
    objc_msgSend(v13, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v15;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v16 = (id *)getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr;
    v74 = (void *)getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr)
    {
      v17 = (void *)SensorKitLibrary_17284();
      v16 = (id *)dlsym(v17, "SRKeyboardMetaInformationHeightKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v16;
      getSRKeyboardMetaInformationHeightKeySymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(&buf, 8);
    if (!v16)
      goto LABEL_54;
    v58 = v12;
    v18 = *v16;
    v69[3] = v18;
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[TIKeyboardLayout frame](self->_layout, "frame");
    +[TISKMetricDefinition pointsToMM:](TISKMetricDefinition, "pointsToMM:", v20);
    objc_msgSend(v19, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v21;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v22 = (id *)getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr;
    v74 = (void *)getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr)
    {
      v23 = (void *)SensorKitLibrary_17284();
      v22 = (id *)dlsym(v23, "SRKeyboardMetaInformationInputModesKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v22;
      getSRKeyboardMetaInformationInputModesKeySymbolLoc_ptr = (uint64_t)v22;
    }
    _Block_object_dispose(&buf, 8);
    if (!v22)
      goto LABEL_54;
    v24 = v9;
    v56 = v6;
    v25 = *v22;
    v69[4] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_inputMode, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v26;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x2020000000;
    v27 = (id *)getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr;
    v74 = (void *)getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr;
    if (!getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr)
    {
      v28 = (void *)SensorKitLibrary_17284();
      v27 = (id *)dlsym(v28, "SRKeyboardMetaInformationSessionIdentifiersKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v27;
      getSRKeyboardMetaInformationSessionIdentifiersKeySymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(&buf, 8);
    if (!v27)
    {
LABEL_54:
      dlerror();
      abort_report_np();
    }
    v70 = *v27;
    sessionIds = self->_sessionIds;
    v30 = v70;
    v31 = (void *)-[NSMutableArray copy](sessionIds, "copy");
    v71[5] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v69, 6);
    v32 = objc_claimAutoreleasedReturnValue();

    v64 = 0;
    v65 = &v64;
    v66 = 0x2050000000;
    v33 = (void *)getSRKeyboardMetricsClass_softClass;
    v67 = getSRKeyboardMetricsClass_softClass;
    if (!getSRKeyboardMetricsClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v73 = (uint64_t)__getSRKeyboardMetricsClass_block_invoke;
      v74 = &unk_1EA107058;
      v75 = &v64;
      __getSRKeyboardMetricsClass_block_invoke((uint64_t)&buf);
      v33 = (void *)v65[3];
    }
    v34 = objc_retainAutorelease(v33);
    _Block_object_dispose(&v64, 8);
    v35 = [v34 alloc];
    -[TISKSessionStats _roundedSessionInterval](self, "_roundedSessionInterval");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (id)objc_msgSend(v35, "initWithInterval:metaInformation:", v36, v32);

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    +[TISKMetricDefinition metricDefinitions](TISKMetricDefinition, "metricDefinitions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v38)
    {
      v39 = v38;
      v57 = v32;
      v40 = 0;
      v41 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          v43 = v40;
          if (*(_QWORD *)v61 != v41)
            objc_enumerationMutation(v37);
          v40 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * i);

          keyedMetrics = self->_keyedMetrics;
          objc_msgSend(v40, "metricName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](keyedMetrics, "objectForKey:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            switch(objc_msgSend(v40, "metricType"))
            {
              case 0u:
                objc_msgSend(v46, "doubleValue");
                if (v47 != 0.0)
                {
                  objc_msgSend(v59, "mutableScalarMetrics");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "metricName");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "setObject:forKey:", v46, v49);
                  goto LABEL_44;
                }
                break;
              case 1u:
                if ((objc_msgSend(v46, "isEmpty") & 1) == 0)
                {
                  objc_msgSend(v46, "generateDataForSR:", v40);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v48)
                    goto LABEL_45;
                  objc_msgSend(v59, "mutableProbabilityMetrics");
                  v50 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_43;
                }
                break;
              case 2u:
                objc_msgSend(v46, "rate");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "doubleValue");
                if (v51 == 0.0)
                  goto LABEL_45;
                objc_msgSend(v59, "mutableScalarMetrics");
                v50 = objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              case 3u:
                if ((objc_msgSend(v46, "isEmpty") & 1) == 0)
                {
                  objc_msgSend(v46, "generateDataForSR:", v40);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v48)
                  {
                    objc_msgSend(v59, "mutablePositionalMetrics");
                    v50 = objc_claimAutoreleasedReturnValue();
LABEL_43:
                    v49 = (void *)v50;
                    objc_msgSend(v40, "metricName");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setObject:forKey:", v48, v52);

LABEL_44:
                  }
LABEL_45:

                }
                break;
              default:
                break;
            }
          }

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v39);

      v32 = v57;
    }

  }
  else
  {
    IXADefaultLogFacility();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISKSessionStats has metadata that resolves to nil and cannot be published"), "-[TISKSessionStats generateDataForSR]");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v54;
      _os_log_error_impl(&dword_1DA6F2000, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

    }
    v59 = 0;
  }

  return v59;
}

- (TISKSessionStats)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *keyedMetrics;
  NSDate *v18;
  NSDate *startTime;
  NSDate *v20;
  NSDate *endTime;
  NSString *v22;
  NSString *identifier;
  NSString *v24;
  NSString *version;
  NSString *v26;
  NSString *inputMode;
  NSMutableArray *v28;
  NSMutableArray *sessionIds;
  TIKeyboardLayout *v30;
  TIKeyboardLayout *layout;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("MetricSampleDictionary"));
  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  keyedMetrics = self->_keyedMetrics;
  self->_keyedMetrics = v16;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDateKey"));
  v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v18;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDateKey"));
  v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endTime = self->_endTime;
  self->_endTime = v20;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentifierKey"));
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v22;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VersionKey"));
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  self->_version = v24;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InputModeKey"));
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  inputMode = self->_inputMode;
  self->_inputMode = v26;

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("SessionIdsKey"));
  v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  sessionIds = self->_sessionIds;
  self->_sessionIds = v28;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LayoutKey"));
  v30 = (TIKeyboardLayout *)objc_claimAutoreleasedReturnValue();

  layout = self->_layout;
  self->_layout = v30;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *keyedMetrics;
  id v5;

  keyedMetrics = self->_keyedMetrics;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyedMetrics, CFSTR("MetricSampleDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTime, CFSTR("StartDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTime, CFSTR("EndDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("IdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("VersionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputMode, CFSTR("InputModeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIds, CFSTR("SessionIdsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layout, CFSTR("LayoutKey"));

}

- (NSMutableDictionary)keyedMetrics
{
  return self->_keyedMetrics;
}

- (void)setKeyedMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_keyedMetrics, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (NSMutableArray)sessionIds
{
  return self->_sessionIds;
}

- (void)setSessionIds:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIds, a3);
}

- (TIKeyboardLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void)setIsEmpty:(BOOL)a3
{
  self->_isEmpty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_sessionIds, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_keyedMetrics, 0);
  objc_storeStrong((id *)&self->_startTimerEvent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
