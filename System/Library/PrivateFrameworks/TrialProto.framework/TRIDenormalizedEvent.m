@implementation TRIDenormalizedEvent

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (void)clearTreatments
{
  -[NSMutableArray removeAllObjects](self->_treatments, "removeAllObjects");
}

- (void)addTreatment:(id)a3
{
  id v4;
  NSMutableArray *treatments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  treatments = self->_treatments;
  v8 = v4;
  if (!treatments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_treatments;
    self->_treatments = v6;

    v4 = v8;
    treatments = self->_treatments;
  }
  -[NSMutableArray addObject:](treatments, "addObject:", v4);

}

- (unint64_t)treatmentsCount
{
  return -[NSMutableArray count](self->_treatments, "count");
}

- (id)treatmentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_treatments, "objectAtIndex:", a3);
}

+ (Class)treatmentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSystemDimensions
{
  return self->_systemDimensions != 0;
}

- (void)clearUserDimensions
{
  -[NSMutableArray removeAllObjects](self->_userDimensions, "removeAllObjects");
}

- (void)addUserDimension:(id)a3
{
  id v4;
  NSMutableArray *userDimensions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userDimensions = self->_userDimensions;
  v8 = v4;
  if (!userDimensions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_userDimensions;
    self->_userDimensions = v6;

    v4 = v8;
    userDimensions = self->_userDimensions;
  }
  -[NSMutableArray addObject:](userDimensions, "addObject:", v4);

}

- (unint64_t)userDimensionsCount
{
  return -[NSMutableArray count](self->_userDimensions, "count");
}

- (id)userDimensionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userDimensions, "objectAtIndex:", a3);
}

+ (Class)userDimensionType
{
  return (Class)objc_opt_class();
}

- (void)clearMetrics
{
  -[NSMutableArray removeAllObjects](self->_metrics, "removeAllObjects");
}

- (void)addMetric:(id)a3
{
  id v4;
  NSMutableArray *metrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  metrics = self->_metrics;
  v8 = v4;
  if (!metrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_metrics;
    self->_metrics = v6;

    v4 = v8;
    metrics = self->_metrics;
  }
  -[NSMutableArray addObject:](metrics, "addObject:", v4);

}

- (unint64_t)metricsCount
{
  return -[NSMutableArray count](self->_metrics, "count");
}

- (id)metricAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_metrics, "objectAtIndex:", a3);
}

+ (Class)metricType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTrialSystemTelemetry
{
  return self->_trialSystemTelemetry != 0;
}

- (BOOL)hasMlruntimeDimensions
{
  return self->_mlruntimeDimensions != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TRIDenormalizedEvent;
  -[TRIDenormalizedEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDenormalizedEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  TRISubject *subject;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  TRISystemDimensions *systemDimensions;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  TRITrialSystemTelemetry *trialSystemTelemetry;
  void *v30;
  TRIMLRuntimeDimensions *mlruntimeDimensions;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  subject = self->_subject;
  if (subject)
  {
    -[TRISubject dictionaryRepresentation](subject, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subject"));

  }
  if (-[NSMutableArray count](self->_treatments, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_treatments, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = self->_treatments;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v43 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("treatment"));
  }
  systemDimensions = self->_systemDimensions;
  if (systemDimensions)
  {
    -[TRISystemDimensions dictionaryRepresentation](systemDimensions, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("system_dimensions"));

  }
  if (-[NSMutableArray count](self->_userDimensions, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_userDimensions, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = self->_userDimensions;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("user_dimension"));
  }
  if (-[NSMutableArray count](self->_metrics, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = self->_metrics;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("metric"));
  }
  trialSystemTelemetry = self->_trialSystemTelemetry;
  if (trialSystemTelemetry)
  {
    -[TRITrialSystemTelemetry dictionaryRepresentation](trialSystemTelemetry, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("trial_system_telemetry"));

  }
  mlruntimeDimensions = self->_mlruntimeDimensions;
  if (mlruntimeDimensions)
  {
    -[TRIMLRuntimeDimensions dictionaryRepresentation](mlruntimeDimensions, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("mlruntime_dimensions"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRIDenormalizedEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_subject)
    PBDataWriterWriteSubmessage();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_treatments;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if (self->_systemDimensions)
    PBDataWriterWriteSubmessage();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_userDimensions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_metrics;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_trialSystemTelemetry)
    PBDataWriterWriteSubmessage();
  if (self->_mlruntimeDimensions)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (self->_subject)
    objc_msgSend(v17, "setSubject:");
  if (-[TRIDenormalizedEvent treatmentsCount](self, "treatmentsCount"))
  {
    objc_msgSend(v17, "clearTreatments");
    v4 = -[TRIDenormalizedEvent treatmentsCount](self, "treatmentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[TRIDenormalizedEvent treatmentAtIndex:](self, "treatmentAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTreatment:", v7);

      }
    }
  }
  if (self->_systemDimensions)
    objc_msgSend(v17, "setSystemDimensions:");
  if (-[TRIDenormalizedEvent userDimensionsCount](self, "userDimensionsCount"))
  {
    objc_msgSend(v17, "clearUserDimensions");
    v8 = -[TRIDenormalizedEvent userDimensionsCount](self, "userDimensionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[TRIDenormalizedEvent userDimensionAtIndex:](self, "userDimensionAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addUserDimension:", v11);

      }
    }
  }
  if (-[TRIDenormalizedEvent metricsCount](self, "metricsCount"))
  {
    objc_msgSend(v17, "clearMetrics");
    v12 = -[TRIDenormalizedEvent metricsCount](self, "metricsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[TRIDenormalizedEvent metricAtIndex:](self, "metricAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addMetric:", v15);

      }
    }
  }
  if (self->_trialSystemTelemetry)
    objc_msgSend(v17, "setTrialSystemTelemetry:");
  v16 = v17;
  if (self->_mlruntimeDimensions)
  {
    objc_msgSend(v17, "setMlruntimeDimensions:");
    v16 = v17;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[TRISubject copyWithZone:](self->_subject, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = self->_treatments;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addTreatment:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v10);
  }

  v14 = -[TRISystemDimensions copyWithZone:](self->_systemDimensions, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_userDimensions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addUserDimension:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v18);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = self->_metrics;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend(v5, "addMetric:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v24);
  }

  v28 = -[TRITrialSystemTelemetry copyWithZone:](self->_trialSystemTelemetry, "copyWithZone:", a3);
  v29 = (void *)v5[6];
  v5[6] = v28;

  v30 = -[TRIMLRuntimeDimensions copyWithZone:](self->_mlruntimeDimensions, "copyWithZone:", a3);
  v31 = (void *)v5[2];
  v5[2] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  TRISubject *subject;
  NSMutableArray *treatments;
  TRISystemDimensions *systemDimensions;
  NSMutableArray *userDimensions;
  NSMutableArray *metrics;
  TRITrialSystemTelemetry *trialSystemTelemetry;
  TRIMLRuntimeDimensions *mlruntimeDimensions;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((subject = self->_subject, !((unint64_t)subject | v4[3])) || -[TRISubject isEqual:](subject, "isEqual:"))
    && ((treatments = self->_treatments, !((unint64_t)treatments | v4[5]))
     || -[NSMutableArray isEqual:](treatments, "isEqual:"))
    && ((systemDimensions = self->_systemDimensions, !((unint64_t)systemDimensions | v4[4]))
     || -[TRISystemDimensions isEqual:](systemDimensions, "isEqual:"))
    && ((userDimensions = self->_userDimensions, !((unint64_t)userDimensions | v4[7]))
     || -[NSMutableArray isEqual:](userDimensions, "isEqual:"))
    && ((metrics = self->_metrics, !((unint64_t)metrics | v4[1]))
     || -[NSMutableArray isEqual:](metrics, "isEqual:"))
    && ((trialSystemTelemetry = self->_trialSystemTelemetry, !((unint64_t)trialSystemTelemetry | v4[6]))
     || -[TRITrialSystemTelemetry isEqual:](trialSystemTelemetry, "isEqual:")))
  {
    mlruntimeDimensions = self->_mlruntimeDimensions;
    if ((unint64_t)mlruntimeDimensions | v4[2])
      v12 = -[TRIMLRuntimeDimensions isEqual:](mlruntimeDimensions, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[TRISubject hash](self->_subject, "hash");
  v4 = -[NSMutableArray hash](self->_treatments, "hash") ^ v3;
  v5 = -[TRISystemDimensions hash](self->_systemDimensions, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_userDimensions, "hash");
  v7 = -[NSMutableArray hash](self->_metrics, "hash");
  v8 = v7 ^ -[TRITrialSystemTelemetry hash](self->_trialSystemTelemetry, "hash");
  return v6 ^ v8 ^ -[TRIMLRuntimeDimensions hash](self->_mlruntimeDimensions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  TRISubject *subject;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  TRISystemDimensions *systemDimensions;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  TRITrialSystemTelemetry *trialSystemTelemetry;
  uint64_t v25;
  TRIMLRuntimeDimensions *mlruntimeDimensions;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
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
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  subject = self->_subject;
  v6 = *((_QWORD *)v4 + 3);
  if (subject)
  {
    if (v6)
      -[TRISubject mergeFrom:](subject, "mergeFrom:");
  }
  else if (v6)
  {
    -[TRIDenormalizedEvent setSubject:](self, "setSubject:");
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        -[TRIDenormalizedEvent addTreatment:](self, "addTreatment:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  systemDimensions = self->_systemDimensions;
  v13 = *((_QWORD *)v4 + 4);
  if (systemDimensions)
  {
    if (v13)
      -[TRISystemDimensions mergeFrom:](systemDimensions, "mergeFrom:");
  }
  else if (v13)
  {
    -[TRIDenormalizedEvent setSystemDimensions:](self, "setSystemDimensions:");
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = *((id *)v4 + 7);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        -[TRIDenormalizedEvent addUserDimension:](self, "addUserDimension:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v16);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = *((id *)v4 + 1);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        -[TRIDenormalizedEvent addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k), (_QWORD)v28);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v21);
  }

  trialSystemTelemetry = self->_trialSystemTelemetry;
  v25 = *((_QWORD *)v4 + 6);
  if (trialSystemTelemetry)
  {
    if (v25)
      -[TRITrialSystemTelemetry mergeFrom:](trialSystemTelemetry, "mergeFrom:");
  }
  else if (v25)
  {
    -[TRIDenormalizedEvent setTrialSystemTelemetry:](self, "setTrialSystemTelemetry:");
  }
  mlruntimeDimensions = self->_mlruntimeDimensions;
  v27 = *((_QWORD *)v4 + 2);
  if (mlruntimeDimensions)
  {
    if (v27)
      -[TRIMLRuntimeDimensions mergeFrom:](mlruntimeDimensions, "mergeFrom:");
  }
  else if (v27)
  {
    -[TRIDenormalizedEvent setMlruntimeDimensions:](self, "setMlruntimeDimensions:");
  }

}

- (TRISubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSMutableArray)treatments
{
  return self->_treatments;
}

- (void)setTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_treatments, a3);
}

- (TRISystemDimensions)systemDimensions
{
  return self->_systemDimensions;
}

- (void)setSystemDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_systemDimensions, a3);
}

- (NSMutableArray)userDimensions
{
  return self->_userDimensions;
}

- (void)setUserDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_userDimensions, a3);
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (TRITrialSystemTelemetry)trialSystemTelemetry
{
  return self->_trialSystemTelemetry;
}

- (void)setTrialSystemTelemetry:(id)a3
{
  objc_storeStrong((id *)&self->_trialSystemTelemetry, a3);
}

- (TRIMLRuntimeDimensions)mlruntimeDimensions
{
  return self->_mlruntimeDimensions;
}

- (void)setMlruntimeDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_mlruntimeDimensions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDimensions, 0);
  objc_storeStrong((id *)&self->_trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->_treatments, 0);
  objc_storeStrong((id *)&self->_systemDimensions, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_mlruntimeDimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
