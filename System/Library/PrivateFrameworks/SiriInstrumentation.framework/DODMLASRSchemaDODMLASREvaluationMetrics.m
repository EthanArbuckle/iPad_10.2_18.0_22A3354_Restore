@implementation DODMLASRSchemaDODMLASREvaluationMetrics

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASREvaluationMetrics;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASREvaluationMetrics trains](self, "trains", v15.receiver, v15.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASREvaluationMetrics setTrains:](self, "setTrains:", v7);

  -[DODMLASRSchemaDODMLASREvaluationMetrics devs](self, "devs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASREvaluationMetrics setDevs:](self, "setDevs:", v9);

  -[DODMLASRSchemaDODMLASREvaluationMetrics tests](self, "tests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASREvaluationMetrics setTests:](self, "setTests:", v11);

  -[DODMLASRSchemaDODMLASREvaluationMetrics externals](self, "externals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DODMLASRSchemaDODMLASREvaluationMetrics setExternals:](self, "setExternals:", v13);
  return v5;
}

- (void)setBestWeight:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bestWeight = a3;
}

- (BOOL)hasBestWeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBestWeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBestWeight
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASREvaluationMetrics setBestWeight:](self, "setBestWeight:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTotalDurationInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalDurationInMs = a3;
}

- (BOOL)hasTotalDurationInMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTotalDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTotalDurationInMs
{
  -[DODMLASRSchemaDODMLASREvaluationMetrics setTotalDurationInMs:](self, "setTotalDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearTrain
{
  -[NSArray removeAllObjects](self->_trains, "removeAllObjects");
}

- (void)addTrain:(id)a3
{
  id v4;
  NSArray *trains;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  trains = self->_trains;
  v8 = v4;
  if (!trains)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trains;
    self->_trains = v6;

    v4 = v8;
    trains = self->_trains;
  }
  -[NSArray addObject:](trains, "addObject:", v4);

}

- (unint64_t)trainCount
{
  return -[NSArray count](self->_trains, "count");
}

- (id)trainAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_trains, "objectAtIndexedSubscript:", a3);
}

- (void)clearDev
{
  -[NSArray removeAllObjects](self->_devs, "removeAllObjects");
}

- (void)addDev:(id)a3
{
  id v4;
  NSArray *devs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  devs = self->_devs;
  v8 = v4;
  if (!devs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_devs;
    self->_devs = v6;

    v4 = v8;
    devs = self->_devs;
  }
  -[NSArray addObject:](devs, "addObject:", v4);

}

- (unint64_t)devCount
{
  return -[NSArray count](self->_devs, "count");
}

- (id)devAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_devs, "objectAtIndexedSubscript:", a3);
}

- (void)clearTest
{
  -[NSArray removeAllObjects](self->_tests, "removeAllObjects");
}

- (void)addTest:(id)a3
{
  id v4;
  NSArray *tests;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  tests = self->_tests;
  v8 = v4;
  if (!tests)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tests;
    self->_tests = v6;

    v4 = v8;
    tests = self->_tests;
  }
  -[NSArray addObject:](tests, "addObject:", v4);

}

- (unint64_t)testCount
{
  return -[NSArray count](self->_tests, "count");
}

- (id)testAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tests, "objectAtIndexedSubscript:", a3);
}

- (void)clearExternal
{
  -[NSArray removeAllObjects](self->_externals, "removeAllObjects");
}

- (void)addExternal:(id)a3
{
  id v4;
  NSArray *externals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  externals = self->_externals;
  v8 = v4;
  if (!externals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_externals;
    self->_externals = v6;

    v4 = v8;
    externals = self->_externals;
  }
  -[NSArray addObject:](externals, "addObject:", v4);

}

- (unint64_t)externalCount
{
  return -[NSArray count](self->_externals, "count");
}

- (id)externalAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_externals, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return DODMLASRSchemaDODMLASREvaluationMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int128 v26;
  __int128 v27;
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
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = self->_trains;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_devs;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = self->_tests;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_externals;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1CE531AE613B3C6BBD4562066D3FA4A8 has;
  unsigned int v6;
  float bestWeight;
  float v8;
  int v9;
  unint64_t totalDurationInMs;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    bestWeight = self->_bestWeight;
    objc_msgSend(v4, "bestWeight");
    if (bestWeight != v8)
      goto LABEL_29;
    has = self->_has;
    v6 = v4[56];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_29;
  if (v9)
  {
    totalDurationInMs = self->_totalDurationInMs;
    if (totalDurationInMs != objc_msgSend(v4, "totalDurationInMs"))
      goto LABEL_29;
  }
  -[DODMLASRSchemaDODMLASREvaluationMetrics trains](self, "trains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_28;
  -[DODMLASRSchemaDODMLASREvaluationMetrics trains](self, "trains");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DODMLASRSchemaDODMLASREvaluationMetrics trains](self, "trains");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trains");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_29;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASREvaluationMetrics devs](self, "devs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_28;
  -[DODMLASRSchemaDODMLASREvaluationMetrics devs](self, "devs");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[DODMLASRSchemaDODMLASREvaluationMetrics devs](self, "devs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "devs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_29;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASREvaluationMetrics tests](self, "tests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_28;
  -[DODMLASRSchemaDODMLASREvaluationMetrics tests](self, "tests");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[DODMLASRSchemaDODMLASREvaluationMetrics tests](self, "tests");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tests");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_29;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASREvaluationMetrics externals](self, "externals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) != (v12 != 0))
  {
    -[DODMLASRSchemaDODMLASREvaluationMetrics externals](self, "externals");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_32:
      v33 = 1;
      goto LABEL_30;
    }
    v29 = (void *)v28;
    -[DODMLASRSchemaDODMLASREvaluationMetrics externals](self, "externals");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externals");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_32;
  }
  else
  {
LABEL_28:

  }
LABEL_29:
  v33 = 0;
LABEL_30:

  return v33;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float bestWeight;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    bestWeight = self->_bestWeight;
    v6 = bestWeight;
    if (bestWeight < 0.0)
      v6 = -bestWeight;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
    v9 = 2654435761u * self->_totalDurationInMs;
  else
    v9 = 0;
  v10 = v9 ^ v4 ^ -[NSArray hash](self->_trains, "hash");
  v11 = -[NSArray hash](self->_devs, "hash");
  v12 = v10 ^ v11 ^ -[NSArray hash](self->_tests, "hash");
  return v12 ^ -[NSArray hash](self->_externals, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
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
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASREvaluationMetrics bestWeight](self, "bestWeight");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bestWeight"));

  }
  if (-[NSArray count](self->_devs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v7 = self->_devs;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dev"));
  }
  if (-[NSArray count](self->_externals, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = self->_externals;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v14, "addObject:", v20);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("external"));
  }
  if (-[NSArray count](self->_tests, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v23 = self->_tests;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v22, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("test"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASREvaluationMetrics totalDurationInMs](self, "totalDurationInMs"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("totalDurationInMs"));

  }
  if (-[NSArray count](self->_trains, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v32 = self->_trains;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v41;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * m), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v31, "addObject:", v37);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v38);

          }
        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("train"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASREvaluationMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASREvaluationMetrics)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASREvaluationMetrics *v5;
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
    self = -[DODMLASRSchemaDODMLASREvaluationMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASREvaluationMetrics)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASREvaluationMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v39;
  DODMLASRSchemaDODMLASREvaluationMetrics *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  objc_super v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)DODMLASRSchemaDODMLASREvaluationMetrics;
  v5 = -[DODMLASRSchemaDODMLASREvaluationMetrics init](&v63, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bestWeight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[DODMLASRSchemaDODMLASREvaluationMetrics setBestWeight:](v5, "setBestWeight:");
    }
    v44 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDurationInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASREvaluationMetrics setTotalDurationInMs:](v5, "setTotalDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));
    v43 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("train"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v60 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[DODMLASRSchemaDODMLASRLanguageModelMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRLanguageModelMetrics alloc], "initWithDictionary:", v14);
              -[DODMLASRSchemaDODMLASREvaluationMetrics addTrain:](v5, "addTrain:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dev"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v56 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[DODMLASRSchemaDODMLASRLanguageModelMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRLanguageModelMetrics alloc], "initWithDictionary:", v22);
              -[DODMLASRSchemaDODMLASREvaluationMetrics addDev:](v5, "addDev:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        }
        while (v19);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("test"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v52;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v52 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = -[DODMLASRSchemaDODMLASRLanguageModelMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRLanguageModelMetrics alloc], "initWithDictionary:", v30);
              -[DODMLASRSchemaDODMLASREvaluationMetrics addTest:](v5, "addTest:", v31);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        }
        while (v27);
      }

      v24 = v42;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("external"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v33 = v32;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v48;
        do
        {
          for (m = 0; m != v35; ++m)
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = -[DODMLASRSchemaDODMLASRLanguageModelMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRLanguageModelMetrics alloc], "initWithDictionary:", v38);
              -[DODMLASRSchemaDODMLASREvaluationMetrics addExternal:](v5, "addExternal:", v39);

            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
        }
        while (v35);
      }

      v24 = v42;
    }
    v40 = v5;

  }
  return v5;
}

- (float)bestWeight
{
  return self->_bestWeight;
}

- (unint64_t)totalDurationInMs
{
  return self->_totalDurationInMs;
}

- (NSArray)trains
{
  return self->_trains;
}

- (void)setTrains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)devs
{
  return self->_devs;
}

- (void)setDevs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)externals
{
  return self->_externals;
}

- (void)setExternals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externals, 0);
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_devs, 0);
  objc_storeStrong((id *)&self->_trains, 0);
}

@end
