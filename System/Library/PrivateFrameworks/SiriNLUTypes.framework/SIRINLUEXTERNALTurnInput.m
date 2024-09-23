@implementation SIRINLUEXTERNALTurnInput

- (BOOL)hasSystemDialogActGroup
{
  return self->_systemDialogActGroup != 0;
}

- (void)clearSalientEntities
{
  -[NSMutableArray removeAllObjects](self->_salientEntities, "removeAllObjects");
}

- (void)addSalientEntities:(id)a3
{
  id v4;
  NSMutableArray *salientEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  salientEntities = self->_salientEntities;
  v8 = v4;
  if (!salientEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_salientEntities;
    self->_salientEntities = v6;

    v4 = v8;
    salientEntities = self->_salientEntities;
  }
  -[NSMutableArray addObject:](salientEntities, "addObject:", v4);

}

- (unint64_t)salientEntitiesCount
{
  return -[NSMutableArray count](self->_salientEntities, "count");
}

- (id)salientEntitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_salientEntities, "objectAtIndex:", a3);
}

- (void)clearActiveTasks
{
  -[NSMutableArray removeAllObjects](self->_activeTasks, "removeAllObjects");
}

- (void)addActiveTasks:(id)a3
{
  id v4;
  NSMutableArray *activeTasks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  activeTasks = self->_activeTasks;
  v8 = v4;
  if (!activeTasks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_activeTasks;
    self->_activeTasks = v6;

    v4 = v8;
    activeTasks = self->_activeTasks;
  }
  -[NSMutableArray addObject:](activeTasks, "addObject:", v4);

}

- (unint64_t)activeTasksCount
{
  return -[NSMutableArray count](self->_activeTasks, "count");
}

- (id)activeTasksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activeTasks, "objectAtIndex:", a3);
}

- (void)clearExecutedTasks
{
  -[NSMutableArray removeAllObjects](self->_executedTasks, "removeAllObjects");
}

- (void)addExecutedTasks:(id)a3
{
  id v4;
  NSMutableArray *executedTasks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  executedTasks = self->_executedTasks;
  v8 = v4;
  if (!executedTasks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_executedTasks;
    self->_executedTasks = v6;

    v4 = v8;
    executedTasks = self->_executedTasks;
  }
  -[NSMutableArray addObject:](executedTasks, "addObject:", v4);

}

- (unint64_t)executedTasksCount
{
  return -[NSMutableArray count](self->_executedTasks, "count");
}

- (id)executedTasksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_executedTasks, "objectAtIndex:", a3);
}

- (void)clearAsrOutputs
{
  -[NSMutableArray removeAllObjects](self->_asrOutputs, "removeAllObjects");
}

- (void)addAsrOutputs:(id)a3
{
  id v4;
  NSMutableArray *asrOutputs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  asrOutputs = self->_asrOutputs;
  v8 = v4;
  if (!asrOutputs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_asrOutputs;
    self->_asrOutputs = v6;

    v4 = v8;
    asrOutputs = self->_asrOutputs;
  }
  -[NSMutableArray addObject:](asrOutputs, "addObject:", v4);

}

- (unint64_t)asrOutputsCount
{
  return -[NSMutableArray count](self->_asrOutputs, "count");
}

- (id)asrOutputsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_asrOutputs, "objectAtIndex:", a3);
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setTapToEdit:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tapToEdit = a3;
}

- (void)setHasTapToEdit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTapToEdit
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCorrectionOutcomeOverride
{
  return self->_correctionOutcomeOverride != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALTurnInput;
  -[SIRINLUEXTERNALTurnInput description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALSystemDialogActGroup *systemDialogActGroup;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  SIRINLUEXTERNALTurnContext *turnContext;
  void *v35;
  NSString *locale;
  char has;
  void *v38;
  void *v39;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcomeOverride;
  void *v41;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  systemDialogActGroup = self->_systemDialogActGroup;
  if (systemDialogActGroup)
  {
    -[SIRINLUEXTERNALSystemDialogActGroup dictionaryRepresentation](systemDialogActGroup, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("system_dialog_act_group"));

  }
  if (-[NSMutableArray count](self->_salientEntities, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v7 = self->_salientEntities;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("salient_entities"));
  }
  if (-[NSMutableArray count](self->_activeTasks, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_activeTasks, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v14 = self->_activeTasks;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v52 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("active_tasks"));
  }
  if (-[NSMutableArray count](self->_executedTasks, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_executedTasks, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v21 = self->_executedTasks;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v48 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("executed_tasks"));
  }
  if (-[NSMutableArray count](self->_asrOutputs, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_asrOutputs, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v28 = self->_asrOutputs;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v44;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v43);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("asr_outputs"));
  }
  turnContext = self->_turnContext;
  if (turnContext)
  {
    -[SIRINLUEXTERNALTurnContext dictionaryRepresentation](turnContext, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("turn_context"));

  }
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tapToEdit);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("tap_to_edit"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startTimestamp);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("start_timestamp"));

  }
  correctionOutcomeOverride = self->_correctionOutcomeOverride;
  if (correctionOutcomeOverride)
  {
    -[SIRINLUEXTERNALCorrectionOutcome dictionaryRepresentation](correctionOutcomeOverride, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("correction_outcome_override"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALTurnInputReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  char has;
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
  if (self->_systemDialogActGroup)
    PBDataWriterWriteSubmessage();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = self->_salientEntities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_activeTasks;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_executedTasks;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self->_asrOutputs;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v22);
  }

  if (self->_turnContext)
    PBDataWriterWriteSubmessage();
  if (self->_locale)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_correctionOutcomeOverride)
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  _BYTE *v20;
  char has;
  id v22;

  v22 = a3;
  if (self->_systemDialogActGroup)
    objc_msgSend(v22, "setSystemDialogActGroup:");
  if (-[SIRINLUEXTERNALTurnInput salientEntitiesCount](self, "salientEntitiesCount"))
  {
    objc_msgSend(v22, "clearSalientEntities");
    v4 = -[SIRINLUEXTERNALTurnInput salientEntitiesCount](self, "salientEntitiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALTurnInput salientEntitiesAtIndex:](self, "salientEntitiesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSalientEntities:", v7);

      }
    }
  }
  if (-[SIRINLUEXTERNALTurnInput activeTasksCount](self, "activeTasksCount"))
  {
    objc_msgSend(v22, "clearActiveTasks");
    v8 = -[SIRINLUEXTERNALTurnInput activeTasksCount](self, "activeTasksCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUEXTERNALTurnInput activeTasksAtIndex:](self, "activeTasksAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addActiveTasks:", v11);

      }
    }
  }
  if (-[SIRINLUEXTERNALTurnInput executedTasksCount](self, "executedTasksCount"))
  {
    objc_msgSend(v22, "clearExecutedTasks");
    v12 = -[SIRINLUEXTERNALTurnInput executedTasksCount](self, "executedTasksCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[SIRINLUEXTERNALTurnInput executedTasksAtIndex:](self, "executedTasksAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addExecutedTasks:", v15);

      }
    }
  }
  if (-[SIRINLUEXTERNALTurnInput asrOutputsCount](self, "asrOutputsCount"))
  {
    objc_msgSend(v22, "clearAsrOutputs");
    v16 = -[SIRINLUEXTERNALTurnInput asrOutputsCount](self, "asrOutputsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[SIRINLUEXTERNALTurnInput asrOutputsAtIndex:](self, "asrOutputsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAsrOutputs:", v19);

      }
    }
  }
  if (self->_turnContext)
    objc_msgSend(v22, "setTurnContext:");
  v20 = v22;
  if (self->_locale)
  {
    objc_msgSend(v22, "setLocale:");
    v20 = v22;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v20[80] = self->_tapToEdit;
    v20[84] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v20 + 1) = self->_startTimestamp;
    v20[84] |= 1u;
  }
  if (self->_correctionOutcomeOverride)
  {
    objc_msgSend(v22, "setCorrectionOutcomeOverride:");
    v20 = v22;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char has;
  id v37;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALSystemDialogActGroup copyWithZone:](self->_systemDialogActGroup, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = self->_salientEntities;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSalientEntities:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v10);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = self->_activeTasks;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addActiveTasks:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v16);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = self->_executedTasks;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addExecutedTasks:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v22);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = self->_asrOutputs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addAsrOutputs:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v28);
  }

  v32 = -[SIRINLUEXTERNALTurnContext copyWithZone:](self->_turnContext, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v32;

  v34 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v34;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_tapToEdit;
    *(_BYTE *)(v5 + 84) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_startTimestamp;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v37 = -[SIRINLUEXTERNALCorrectionOutcome copyWithZone:](self->_correctionOutcomeOverride, "copyWithZone:", a3, (_QWORD)v40);
  v38 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v37;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALSystemDialogActGroup *systemDialogActGroup;
  NSMutableArray *salientEntities;
  NSMutableArray *activeTasks;
  NSMutableArray *executedTasks;
  NSMutableArray *asrOutputs;
  SIRINLUEXTERNALTurnContext *turnContext;
  NSString *locale;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcomeOverride;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  systemDialogActGroup = self->_systemDialogActGroup;
  if ((unint64_t)systemDialogActGroup | *((_QWORD *)v4 + 8))
  {
    if (!-[SIRINLUEXTERNALSystemDialogActGroup isEqual:](systemDialogActGroup, "isEqual:"))
      goto LABEL_31;
  }
  salientEntities = self->_salientEntities;
  if ((unint64_t)salientEntities | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](salientEntities, "isEqual:"))
      goto LABEL_31;
  }
  activeTasks = self->_activeTasks;
  if ((unint64_t)activeTasks | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](activeTasks, "isEqual:"))
      goto LABEL_31;
  }
  executedTasks = self->_executedTasks;
  if ((unint64_t)executedTasks | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](executedTasks, "isEqual:"))
      goto LABEL_31;
  }
  asrOutputs = self->_asrOutputs;
  if ((unint64_t)asrOutputs | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](asrOutputs, "isEqual:"))
      goto LABEL_31;
  }
  turnContext = self->_turnContext;
  if ((unint64_t)turnContext | *((_QWORD *)v4 + 9))
  {
    if (!-[SIRINLUEXTERNALTurnContext isEqual:](turnContext, "isEqual:"))
      goto LABEL_31;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) != 0)
    {
      if (self->_tapToEdit)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_31;
        goto LABEL_24;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_24;
    }
LABEL_31:
    v13 = 0;
    goto LABEL_32;
  }
  if ((*((_BYTE *)v4 + 84) & 2) != 0)
    goto LABEL_31;
LABEL_24:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_startTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_31;
  }
  correctionOutcomeOverride = self->_correctionOutcomeOverride;
  if ((unint64_t)correctionOutcomeOverride | *((_QWORD *)v4 + 4))
    v13 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcomeOverride, "isEqual:");
  else
    v13 = 1;
LABEL_32:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;

  v3 = -[SIRINLUEXTERNALSystemDialogActGroup hash](self->_systemDialogActGroup, "hash");
  v4 = -[NSMutableArray hash](self->_salientEntities, "hash");
  v5 = -[NSMutableArray hash](self->_activeTasks, "hash");
  v6 = -[NSMutableArray hash](self->_executedTasks, "hash");
  v7 = -[NSMutableArray hash](self->_asrOutputs, "hash");
  v8 = -[SIRINLUEXTERNALTurnContext hash](self->_turnContext, "hash");
  v9 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_tapToEdit;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[SIRINLUEXTERNALCorrectionOutcome hash](self->_correctionOutcomeOverride, "hash");
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v11 = 2654435761u * self->_startTimestamp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[SIRINLUEXTERNALCorrectionOutcome hash](self->_correctionOutcomeOverride, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALSystemDialogActGroup *systemDialogActGroup;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  SIRINLUEXTERNALTurnContext *turnContext;
  uint64_t v28;
  char v29;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcomeOverride;
  uint64_t v31;
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
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  systemDialogActGroup = self->_systemDialogActGroup;
  v6 = *((_QWORD *)v4 + 8);
  if (systemDialogActGroup)
  {
    if (v6)
      -[SIRINLUEXTERNALSystemDialogActGroup mergeFrom:](systemDialogActGroup, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALTurnInput setSystemDialogActGroup:](self, "setSystemDialogActGroup:");
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALTurnInput addSalientEntities:](self, "addSalientEntities:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = *((id *)v4 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALTurnInput addActiveTasks:](self, "addActiveTasks:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v14);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = *((id *)v4 + 5);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        -[SIRINLUEXTERNALTurnInput addExecutedTasks:](self, "addExecutedTasks:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v19);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = *((id *)v4 + 3);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        -[SIRINLUEXTERNALTurnInput addAsrOutputs:](self, "addAsrOutputs:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * m), (_QWORD)v32);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v24);
  }

  turnContext = self->_turnContext;
  v28 = *((_QWORD *)v4 + 9);
  if (turnContext)
  {
    if (v28)
      -[SIRINLUEXTERNALTurnContext mergeFrom:](turnContext, "mergeFrom:");
  }
  else if (v28)
  {
    -[SIRINLUEXTERNALTurnInput setTurnContext:](self, "setTurnContext:");
  }
  if (*((_QWORD *)v4 + 6))
    -[SIRINLUEXTERNALTurnInput setLocale:](self, "setLocale:");
  v29 = *((_BYTE *)v4 + 84);
  if ((v29 & 2) != 0)
  {
    self->_tapToEdit = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 2u;
    v29 = *((_BYTE *)v4 + 84);
  }
  if ((v29 & 1) != 0)
  {
    self->_startTimestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  correctionOutcomeOverride = self->_correctionOutcomeOverride;
  v31 = *((_QWORD *)v4 + 4);
  if (correctionOutcomeOverride)
  {
    if (v31)
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcomeOverride, "mergeFrom:");
  }
  else if (v31)
  {
    -[SIRINLUEXTERNALTurnInput setCorrectionOutcomeOverride:](self, "setCorrectionOutcomeOverride:");
  }

}

- (SIRINLUEXTERNALSystemDialogActGroup)systemDialogActGroup
{
  return self->_systemDialogActGroup;
}

- (void)setSystemDialogActGroup:(id)a3
{
  objc_storeStrong((id *)&self->_systemDialogActGroup, a3);
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setSalientEntities:(id)a3
{
  objc_storeStrong((id *)&self->_salientEntities, a3);
}

- (NSMutableArray)activeTasks
{
  return self->_activeTasks;
}

- (void)setActiveTasks:(id)a3
{
  objc_storeStrong((id *)&self->_activeTasks, a3);
}

- (NSMutableArray)executedTasks
{
  return self->_executedTasks;
}

- (void)setExecutedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_executedTasks, a3);
}

- (NSMutableArray)asrOutputs
{
  return self->_asrOutputs;
}

- (void)setAsrOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_asrOutputs, a3);
}

- (SIRINLUEXTERNALTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setTurnContext:(id)a3
{
  objc_storeStrong((id *)&self->_turnContext, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)tapToEdit
{
  return self->_tapToEdit;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcomeOverride
{
  return self->_correctionOutcomeOverride;
}

- (void)setCorrectionOutcomeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_correctionOutcomeOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_systemDialogActGroup, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_correctionOutcomeOverride, 0);
  objc_storeStrong((id *)&self->_asrOutputs, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

+ (Class)salientEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)activeTasksType
{
  return (Class)objc_opt_class();
}

+ (Class)executedTasksType
{
  return (Class)objc_opt_class();
}

+ (Class)asrOutputsType
{
  return (Class)objc_opt_class();
}

@end
