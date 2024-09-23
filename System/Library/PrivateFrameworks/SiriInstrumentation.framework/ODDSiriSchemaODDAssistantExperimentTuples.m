@implementation ODDSiriSchemaODDAssistantExperimentTuples

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearLaunchTimeInMs
{
  -[NSArray removeAllObjects](self->_launchTimeInMs, "removeAllObjects");
}

- (void)addLaunchTimeInMs:(float)a3
{
  NSArray *launchTimeInMs;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  launchTimeInMs = self->_launchTimeInMs;
  if (!launchTimeInMs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_launchTimeInMs;
    self->_launchTimeInMs = v6;

    launchTimeInMs = self->_launchTimeInMs;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](launchTimeInMs, "addObject:", v9);

}

- (unint64_t)launchTimeInMsCount
{
  return -[NSArray count](self->_launchTimeInMs, "count");
}

- (float)launchTimeInMsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_launchTimeInMs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)clearEndpointDelayInMs
{
  -[NSArray removeAllObjects](self->_endpointDelayInMs, "removeAllObjects");
}

- (void)addEndpointDelayInMs:(float)a3
{
  NSArray *endpointDelayInMs;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  endpointDelayInMs = self->_endpointDelayInMs;
  if (!endpointDelayInMs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_endpointDelayInMs;
    self->_endpointDelayInMs = v6;

    endpointDelayInMs = self->_endpointDelayInMs;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](endpointDelayInMs, "addObject:", v9);

}

- (unint64_t)endpointDelayInMsCount
{
  return -[NSArray count](self->_endpointDelayInMs, "count");
}

- (float)endpointDelayInMsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_endpointDelayInMs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)clearSiriResponseTimeInMs
{
  -[NSArray removeAllObjects](self->_siriResponseTimeInMs, "removeAllObjects");
}

- (void)addSiriResponseTimeInMs:(float)a3
{
  NSArray *siriResponseTimeInMs;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  siriResponseTimeInMs = self->_siriResponseTimeInMs;
  if (!siriResponseTimeInMs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_siriResponseTimeInMs;
    self->_siriResponseTimeInMs = v6;

    siriResponseTimeInMs = self->_siriResponseTimeInMs;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](siriResponseTimeInMs, "addObject:", v9);

}

- (unint64_t)siriResponseTimeInMsCount
{
  return -[NSArray count](self->_siriResponseTimeInMs, "count");
}

- (float)siriResponseTimeInMsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_siriResponseTimeInMs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)clearTimeToUufrInMs
{
  -[NSArray removeAllObjects](self->_timeToUufrInMs, "removeAllObjects");
}

- (void)addTimeToUufrInMs:(float)a3
{
  NSArray *timeToUufrInMs;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  timeToUufrInMs = self->_timeToUufrInMs;
  if (!timeToUufrInMs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_timeToUufrInMs;
    self->_timeToUufrInMs = v6;

    timeToUufrInMs = self->_timeToUufrInMs;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](timeToUufrInMs, "addObject:", v9);

}

- (unint64_t)timeToUufrInMsCount
{
  return -[NSArray count](self->_timeToUufrInMs, "count");
}

- (float)timeToUufrInMsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_timeToUufrInMs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)clearTimeToFirstWordInMs
{
  -[NSArray removeAllObjects](self->_timeToFirstWordInMs, "removeAllObjects");
}

- (void)addTimeToFirstWordInMs:(float)a3
{
  NSArray *timeToFirstWordInMs;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  timeToFirstWordInMs = self->_timeToFirstWordInMs;
  if (!timeToFirstWordInMs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_timeToFirstWordInMs;
    self->_timeToFirstWordInMs = v6;

    timeToFirstWordInMs = self->_timeToFirstWordInMs;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](timeToFirstWordInMs, "addObject:", v9);

}

- (unint64_t)timeToFirstWordInMsCount
{
  return -[NSArray count](self->_timeToFirstWordInMs, "count");
}

- (float)timeToFirstWordInMsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_timeToFirstWordInMs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return ODDSiriSchemaODDAssistantExperimentTuplesReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_launchTimeInMs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v9), "floatValue");
        PBDataWriterWriteFloatField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_endpointDelayInMs;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v14), "floatValue");
        PBDataWriterWriteFloatField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_siriResponseTimeInMs;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v19), "floatValue");
        PBDataWriterWriteFloatField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_timeToUufrInMs;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "floatValue");
        PBDataWriterWriteFloatField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_timeToFirstWordInMs;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v29), "floatValue", (_QWORD)v30);
        PBDataWriterWriteFloatField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[ODDSiriSchemaODDAssistantExperimentTuples launchTimeInMs](self, "launchTimeInMs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchTimeInMs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ODDSiriSchemaODDAssistantExperimentTuples launchTimeInMs](self, "launchTimeInMs");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssistantExperimentTuples launchTimeInMs](self, "launchTimeInMs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchTimeInMs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointDelayInMs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ODDSiriSchemaODDAssistantExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssistantExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointDelayInMs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriResponseTimeInMs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ODDSiriSchemaODDAssistantExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDAssistantExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriResponseTimeInMs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeToUufrInMs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ODDSiriSchemaODDAssistantExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDAssistantExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeToUufrInMs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeToFirstWordInMs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDAssistantExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[ODDSiriSchemaODDAssistantExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeToFirstWordInMs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_launchTimeInMs, "hash");
  v4 = -[NSArray hash](self->_endpointDelayInMs, "hash") ^ v3;
  v5 = -[NSArray hash](self->_siriResponseTimeInMs, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_timeToUufrInMs, "hash");
  return v6 ^ -[NSArray hash](self->_timeToFirstWordInMs, "hash");
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
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_endpointDelayInMs, "count"))
  {
    -[ODDSiriSchemaODDAssistantExperimentTuples endpointDelayInMs](self, "endpointDelayInMs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endpointDelayInMs"));

  }
  if (-[NSArray count](self->_launchTimeInMs, "count"))
  {
    -[ODDSiriSchemaODDAssistantExperimentTuples launchTimeInMs](self, "launchTimeInMs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("launchTimeInMs"));

  }
  if (-[NSArray count](self->_siriResponseTimeInMs, "count"))
  {
    -[ODDSiriSchemaODDAssistantExperimentTuples siriResponseTimeInMs](self, "siriResponseTimeInMs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriResponseTimeInMs"));

  }
  if (-[NSArray count](self->_timeToFirstWordInMs, "count"))
  {
    -[ODDSiriSchemaODDAssistantExperimentTuples timeToFirstWordInMs](self, "timeToFirstWordInMs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timeToFirstWordInMs"));

  }
  if (-[NSArray count](self->_timeToUufrInMs, "count"))
  {
    -[ODDSiriSchemaODDAssistantExperimentTuples timeToUufrInMs](self, "timeToUufrInMs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("timeToUufrInMs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantExperimentTuples dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (ODDSiriSchemaODDAssistantExperimentTuples)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantExperimentTuples *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[ODDSiriSchemaODDAssistantExperimentTuples initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentTuples)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantExperimentTuples *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  ODDSiriSchemaODDAssistantExperimentTuples *v41;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)ODDSiriSchemaODDAssistantExperimentTuples;
  v5 = -[ODDSiriSchemaODDAssistantExperimentTuples init](&v66, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launchTimeInMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v63 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "floatValue");
              -[ODDSiriSchemaODDAssistantExperimentTuples addLaunchTimeInMs:](v5, "addLaunchTimeInMs:");
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointDelayInMs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v59 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v19, "floatValue");
              -[ODDSiriSchemaODDAssistantExperimentTuples addEndpointDelayInMs:](v5, "addEndpointDelayInMs:");
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v16);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriResponseTimeInMs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v55;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v55 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v26, "floatValue");
              -[ODDSiriSchemaODDAssistantExperimentTuples addSiriResponseTimeInMs:](v5, "addSiriResponseTimeInMs:");
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
        }
        while (v23);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToUufrInMs"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v51;
        do
        {
          for (m = 0; m != v30; ++m)
          {
            if (*(_QWORD *)v51 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v33, "floatValue");
              -[ODDSiriSchemaODDAssistantExperimentTuples addTimeToUufrInMs:](v5, "addTimeToUufrInMs:");
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
        }
        while (v30);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToFirstWordInMs"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v6;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v35 = v34;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v47;
        do
        {
          for (n = 0; n != v37; ++n)
          {
            if (*(_QWORD *)v47 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v40, "floatValue");
              -[ODDSiriSchemaODDAssistantExperimentTuples addTimeToFirstWordInMs:](v5, "addTimeToFirstWordInMs:");
            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
        }
        while (v37);
      }

      v6 = v43;
    }
    v41 = v5;

  }
  return v5;
}

- (NSArray)launchTimeInMs
{
  return self->_launchTimeInMs;
}

- (void)setLaunchTimeInMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)endpointDelayInMs
{
  return self->_endpointDelayInMs;
}

- (void)setEndpointDelayInMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)siriResponseTimeInMs
{
  return self->_siriResponseTimeInMs;
}

- (void)setSiriResponseTimeInMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)timeToUufrInMs
{
  return self->_timeToUufrInMs;
}

- (void)setTimeToUufrInMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)timeToFirstWordInMs
{
  return self->_timeToFirstWordInMs;
}

- (void)setTimeToFirstWordInMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToFirstWordInMs, 0);
  objc_storeStrong((id *)&self->_timeToUufrInMs, 0);
  objc_storeStrong((id *)&self->_siriResponseTimeInMs, 0);
  objc_storeStrong((id *)&self->_endpointDelayInMs, 0);
  objc_storeStrong((id *)&self->_launchTimeInMs, 0);
}

@end
