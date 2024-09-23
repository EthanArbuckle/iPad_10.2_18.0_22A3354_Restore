@implementation TAInterVisitMetricPerDevice

- (TAInterVisitMetricPerDevice)init
{
  TAInterVisitMetricPerDeviceSettings *v3;
  TAInterVisitMetricPerDevice *v4;

  v3 = objc_alloc_init(TAInterVisitMetricPerDeviceSettings);
  v4 = -[TAInterVisitMetricPerDevice initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (TAInterVisitMetricPerDevice)initWithSettings:(id)a3
{
  id v5;
  TAInterVisitMetricPerDevice *v6;
  TAInterVisitMetricPerDevice *v7;
  uint64_t v8;
  NSArray *sampledObservedLocations;
  TASPAdvertisement *latestAdvertisement;
  uint64_t v11;
  NSDictionary *durationPerMotionState;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TAInterVisitMetricPerDevice;
  v6 = -[TAInterVisitMetricPerDevice init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numOfAssociatedLocs = 0;
    v6->_duration = 0.0;
    v6->_distance = 0.0;
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    sampledObservedLocations = v7->_sampledObservedLocations;
    v7->_sampledObservedLocations = (NSArray *)v8;

    latestAdvertisement = v7->_latestAdvertisement;
    v7->_latestAdvertisement = 0;

    objc_storeStrong((id *)&v7->_settings, a3);
    v7->_segmentSpeedExceedsLimit = 0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    durationPerMotionState = v7->_durationPerMotionState;
    v7->_durationPerMotionState = (NSDictionary *)v11;

  }
  return v7;
}

- (void)accumulate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[TAInterVisitMetricPerDevice accumulateNumOfAssociatedLocs:](self, "accumulateNumOfAssociatedLocs:", objc_msgSend(v4, "numOfAssociatedLocs"));
    objc_msgSend(v9, "duration");
    -[TAInterVisitMetricPerDevice accumulateDuration:](self, "accumulateDuration:");
    objc_msgSend(v9, "distance");
    -[TAInterVisitMetricPerDevice accumulateDistance:](self, "accumulateDistance:");
    objc_msgSend(v9, "sampledObservedLocations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TAInterVisitMetricPerDevice accumulateSampledObservedLocations:](self, "accumulateSampledObservedLocations:", v5);

    objc_msgSend(v9, "latestAdvertisement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TAInterVisitMetricPerDevice accumulateLatestAdvertisement:](self, "accumulateLatestAdvertisement:", v6);

    if (-[TAInterVisitMetricPerDevice segmentSpeedExceedsLimit](self, "segmentSpeedExceedsLimit"))
      v7 = 1;
    else
      v7 = objc_msgSend(v9, "segmentSpeedExceedsLimit");
    -[TAInterVisitMetricPerDevice setSegmentSpeedExceedsLimit:](self, "setSegmentSpeedExceedsLimit:", v7);
    objc_msgSend(v9, "durationPerMotionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TAInterVisitMetricPerDevice accumulateDurationPerMotionState:](self, "accumulateDurationPerMotionState:", v8);

    v4 = v9;
  }

}

- (void)accumulateNumOfAssociatedLocs:(unint64_t)a3
{
  self->_numOfAssociatedLocs += a3;
}

- (void)accumulateDuration:(double)a3
{
  self->_duration = self->_duration + a3;
}

- (void)accumulateDistance:(double)a3
{
  self->_distance = self->_distance + a3;
}

- (void)accumulateSampledObservedLocations:(id)a3
{
  id v4;
  NSArray *sampledObservedLocations;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSArray *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sampledObservedLocations = self->_sampledObservedLocations;
  if (!sampledObservedLocations)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sampledObservedLocations;
    self->_sampledObservedLocations = v6;

    sampledObservedLocations = self->_sampledObservedLocations;
  }
  v26 = v4;
  -[NSArray arrayByAddingObjectsFromArray:](sampledObservedLocations, "arrayByAddingObjectsFromArray:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
      v16 = -[NSArray count](v9, "count");
      if (v16 >= -[TAInterVisitMetricPerDeviceSettings sampledObservationLocationsBufferSize](self->_settings, "sampledObservationLocationsBufferSize"))break;
      if (-[NSArray count](v9, "count"))
      {
        -[NSArray lastObject](v9, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "getDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "getDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", v19);
        v21 = v20;
        -[TAInterVisitMetricPerDeviceSettings sampledObservationLocationsInterval](self->_settings, "sampledObservationLocationsInterval");
        v23 = v22;

        if (v21 >= v23)
          -[NSArray addObject:](v9, "addObject:", v15);

      }
      else
      {
        -[NSArray addObject:](v9, "addObject:", v15);
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
          goto LABEL_5;
        break;
      }
    }
  }

  v24 = self->_sampledObservedLocations;
  self->_sampledObservedLocations = v9;

}

uint64_t __66__TAInterVisitMetricPerDevice_accumulateSampledObservedLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)accumulateLatestAdvertisement:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_latestAdvertisement, a3);
    v5 = v6;
  }

}

- (void)accumulateDurationPerMotionState:(id)a3
{
  id v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  NSDictionary *durationPerMotionState;
  TAInterVisitMetricPerDevice *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = self;
  v5 = (NSDictionary *)-[NSDictionary mutableCopy](self->_durationPerMotionState, "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSDictionary objectForKey:](v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;
          -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(v13, "numberWithDouble:", v16 + v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, v11);

        }
        else
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  durationPerMotionState = v21->_durationPerMotionState;
  v21->_durationPerMotionState = v5;

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAInterVisitMetricPerDevice *v5;
  TAInterVisitMetricPerDevice *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
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

  v5 = (TAInterVisitMetricPerDevice *)a3;
  if (self == v5)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[TAInterVisitMetricPerDevice numOfAssociatedLocs](self, "numOfAssociatedLocs");
      if (v7 != -[TAInterVisitMetricPerDevice numOfAssociatedLocs](v6, "numOfAssociatedLocs")
        || (-[TAInterVisitMetricPerDevice duration](self, "duration"),
            v9 = v8,
            -[TAInterVisitMetricPerDevice duration](v6, "duration"),
            v9 != v10)
        || (-[TAInterVisitMetricPerDevice distance](self, "distance"),
            v12 = v11,
            -[TAInterVisitMetricPerDevice distance](v6, "distance"),
            v12 != v13))
      {
        v17 = 0;
LABEL_12:

        goto LABEL_13;
      }
      -[TAInterVisitMetricPerDevice sampledObservedLocations](self, "sampledObservedLocations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricPerDevice sampledObservedLocations](v6, "sampledObservedLocations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[TAInterVisitMetricPerDevice sampledObservedLocations](self, "sampledObservedLocations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricPerDevice sampledObservedLocations](v6, "sampledObservedLocations");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v16;
        if (!objc_msgSend(v16, "isEqual:", v3))
        {
          v17 = 0;
          goto LABEL_31;
        }
      }
      -[TAInterVisitMetricPerDevice latestAdvertisement](self, "latestAdvertisement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricPerDevice latestAdvertisement](v6, "latestAdvertisement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 != v20)
      {
        -[TAInterVisitMetricPerDevice latestAdvertisement](self, "latestAdvertisement");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricPerDevice latestAdvertisement](v6, "latestAdvertisement");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "isEqual:"))
        {
          v17 = 0;
LABEL_29:

LABEL_30:
          if (v14 == v15)
          {
LABEL_32:

            goto LABEL_12;
          }
LABEL_31:

          goto LABEL_32;
        }
        v36 = v21;
      }
      -[TAInterVisitMetricPerDevice settings](self, "settings");
      v22 = objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricPerDevice settings](v6, "settings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)v22;
      if ((void *)v22 == v23)
      {
        v32 = v20;
        v33 = v19;
      }
      else
      {
        -[TAInterVisitMetricPerDevice settings](self, "settings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricPerDevice settings](v6, "settings");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          v17 = 0;
          v30 = v37;
          goto LABEL_27;
        }
        v32 = v20;
        v33 = v19;
      }
      -[TAInterVisitMetricPerDevice durationPerMotionState](self, "durationPerMotionState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAInterVisitMetricPerDevice durationPerMotionState](v6, "durationPerMotionState");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

        v17 = 1;
      }
      else
      {
        v27 = (void *)v26;
        -[TAInterVisitMetricPerDevice durationPerMotionState](self, "durationPerMotionState");
        v31 = v3;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAInterVisitMetricPerDevice durationPerMotionState](v6, "durationPerMotionState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v28, "isEqual:", v29);

        v3 = v31;
      }
      v30 = v37;
      v20 = v32;
      v19 = v33;
      if (v37 == v23)
      {
LABEL_28:

        v21 = v36;
        if (v19 == v20)
          goto LABEL_30;
        goto LABEL_29;
      }
LABEL_27:

      goto LABEL_28;
    }
    v17 = 0;
  }
LABEL_13:

  return v17;
}

- (id)descriptionDictionary
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
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("NumOfAssociatedLocs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAInterVisitMetricPerDevice numOfAssociatedLocs](self, "numOfAssociatedLocs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("Duration");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[TAInterVisitMetricPerDevice duration](self, "duration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v15[2] = CFSTR("Distance");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[TAInterVisitMetricPerDevice distance](self, "distance");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("NumOfSampledObservationLocations");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[TAInterVisitMetricPerDevice sampledObservedLocations](self, "sampledObservedLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  v15[4] = CFSTR("LatestAdvertisement");
  -[TASPAdvertisement descriptionDictionary](self->_latestAdvertisement, "descriptionDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v11;
  v15[5] = CFSTR("DurationPerMotionState");
  -[TAInterVisitMetricPerDevice durationPerMotionState](self, "durationPerMotionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  -[TAInterVisitMetricPerDevice descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v2, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAInterVisitMetricPerDevice description].cold.1(v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAInterVisitMetricPerDevice)initWithCoder:(id)a3
{
  id v4;
  TAInterVisitMetricPerDevice *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *sampledObservedLocations;
  uint64_t v13;
  TASPAdvertisement *latestAdvertisement;
  uint64_t v15;
  TAInterVisitMetricPerDeviceSettings *settings;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *durationPerMotionState;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TAInterVisitMetricPerDevice;
  v5 = -[TAInterVisitMetricPerDevice init](&v23, sel_init);
  if (v5)
  {
    v5->_numOfAssociatedLocs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumOfAssociatedLocs"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Duration"));
    v5->_duration = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Distance"));
    v5->_distance = v7;
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("SampledObservedLocations"));
    v11 = objc_claimAutoreleasedReturnValue();
    sampledObservedLocations = v5->_sampledObservedLocations;
    v5->_sampledObservedLocations = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatestAdvertisement"));
    v13 = objc_claimAutoreleasedReturnValue();
    latestAdvertisement = v5->_latestAdvertisement;
    v5->_latestAdvertisement = (TASPAdvertisement *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Settings"));
    v15 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (TAInterVisitMetricPerDeviceSettings *)v15;

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("DurationPerMotionState"));
    v20 = objc_claimAutoreleasedReturnValue();
    durationPerMotionState = v5->_durationPerMotionState;
    v5->_durationPerMotionState = (NSDictionary *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numOfAssociatedLocs;
  id v5;

  numOfAssociatedLocs = self->_numOfAssociatedLocs;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", numOfAssociatedLocs, CFSTR("NumOfAssociatedLocs"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Duration"), self->_duration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Distance"), self->_distance);
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampledObservedLocations, CFSTR("SampledObservedLocations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestAdvertisement, CFSTR("LatestAdvertisement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_settings, CFSTR("Settings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_durationPerMotionState, CFSTR("DurationPerMotionState"));

}

- (unint64_t)numOfAssociatedLocs
{
  return self->_numOfAssociatedLocs;
}

- (double)duration
{
  return self->_duration;
}

- (double)distance
{
  return self->_distance;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (BOOL)segmentSpeedExceedsLimit
{
  return self->_segmentSpeedExceedsLimit;
}

- (void)setSegmentSpeedExceedsLimit:(BOOL)a3
{
  self->_segmentSpeedExceedsLimit = a3;
}

- (NSDictionary)durationPerMotionState
{
  return self->_durationPerMotionState;
}

- (TAInterVisitMetricPerDeviceSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (NSArray)sampledObservedLocations
{
  return self->_sampledObservedLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampledObservedLocations, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_durationPerMotionState, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
}

- (void)description
{
  void *v1;
  id v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_217877000, v5, v6, "%@ instance failed to create description:%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

@end
