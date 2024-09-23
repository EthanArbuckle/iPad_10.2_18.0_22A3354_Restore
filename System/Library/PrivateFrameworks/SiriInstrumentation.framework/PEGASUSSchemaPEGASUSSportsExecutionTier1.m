@implementation PEGASUSSchemaPEGASUSSportsExecutionTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSSportsExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteSportName](self, "deleteSportName");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteLeague](self, "deleteLeague");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteAthleteEntities](self, "deleteAthleteEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteTeamEntities](self, "deleteTeamEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteEventEntities](self, "deleteEventEntities");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteSportName](self, "deleteSportName");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteLeague](self, "deleteLeague");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteAthleteEntities](self, "deleteAthleteEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteTeamEntities](self, "deleteTeamEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteEventEntities](self, "deleteEventEntities");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteSportName](self, "deleteSportName");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteLeague](self, "deleteLeague");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteAthleteEntities](self, "deleteAthleteEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteTeamEntities](self, "deleteTeamEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteEventEntities](self, "deleteEventEntities");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteSportName](self, "deleteSportName");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteLeague](self, "deleteLeague");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteAthleteEntities](self, "deleteAthleteEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteTeamEntities](self, "deleteTeamEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteEventEntities](self, "deleteEventEntities");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteSportName](self, "deleteSportName");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteLeague](self, "deleteLeague");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteAthleteEntities](self, "deleteAthleteEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteTeamEntities](self, "deleteTeamEntities");
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 deleteEventEntities](self, "deleteEventEntities");
  }

  return v5;
}

- (void)clearSportName
{
  -[NSArray removeAllObjects](self->_sportNames, "removeAllObjects");
}

- (void)addSportName:(int)a3
{
  uint64_t v3;
  NSArray *sportNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  sportNames = self->_sportNames;
  if (!sportNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sportNames;
    self->_sportNames = v6;

    sportNames = self->_sportNames;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](sportNames, "addObject:", v8);

}

- (unint64_t)sportNameCount
{
  return -[NSArray count](self->_sportNames, "count");
}

- (int)sportNameAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_sportNames, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)clearLeague
{
  -[NSArray removeAllObjects](self->_leagues, "removeAllObjects");
}

- (void)addLeague:(id)a3
{
  id v4;
  NSArray *leagues;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  leagues = self->_leagues;
  v8 = v4;
  if (!leagues)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_leagues;
    self->_leagues = v6;

    v4 = v8;
    leagues = self->_leagues;
  }
  -[NSArray addObject:](leagues, "addObject:", v4);

}

- (unint64_t)leagueCount
{
  return -[NSArray count](self->_leagues, "count");
}

- (id)leagueAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_leagues, "objectAtIndexedSubscript:", a3);
}

- (void)clearAthleteEntities
{
  -[NSArray removeAllObjects](self->_athleteEntities, "removeAllObjects");
}

- (void)addAthleteEntities:(id)a3
{
  id v4;
  NSArray *athleteEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  athleteEntities = self->_athleteEntities;
  v8 = v4;
  if (!athleteEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_athleteEntities;
    self->_athleteEntities = v6;

    v4 = v8;
    athleteEntities = self->_athleteEntities;
  }
  -[NSArray addObject:](athleteEntities, "addObject:", v4);

}

- (unint64_t)athleteEntitiesCount
{
  return -[NSArray count](self->_athleteEntities, "count");
}

- (id)athleteEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_athleteEntities, "objectAtIndexedSubscript:", a3);
}

- (void)clearTeamEntities
{
  -[NSArray removeAllObjects](self->_teamEntities, "removeAllObjects");
}

- (void)addTeamEntities:(id)a3
{
  id v4;
  NSArray *teamEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  teamEntities = self->_teamEntities;
  v8 = v4;
  if (!teamEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_teamEntities;
    self->_teamEntities = v6;

    v4 = v8;
    teamEntities = self->_teamEntities;
  }
  -[NSArray addObject:](teamEntities, "addObject:", v4);

}

- (unint64_t)teamEntitiesCount
{
  return -[NSArray count](self->_teamEntities, "count");
}

- (id)teamEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_teamEntities, "objectAtIndexedSubscript:", a3);
}

- (void)clearEventEntities
{
  -[NSArray removeAllObjects](self->_eventEntities, "removeAllObjects");
}

- (void)addEventEntities:(id)a3
{
  id v4;
  NSArray *eventEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  eventEntities = self->_eventEntities;
  v8 = v4;
  if (!eventEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_eventEntities;
    self->_eventEntities = v6;

    v4 = v8;
    eventEntities = self->_eventEntities;
  }
  -[NSArray addObject:](eventEntities, "addObject:", v4);

}

- (unint64_t)eventEntitiesCount
{
  return -[NSArray count](self->_eventEntities, "count");
}

- (id)eventEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_eventEntities, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSSportsExecutionTier1ReadFrom(self, (uint64_t)a3);
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
  v5 = self->_sportNames;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v9), "intValue");
        PBDataWriterWriteInt32Field();
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
  v10 = self->_leagues;
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
        PBDataWriterWriteStringField();
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
  v15 = self->_athleteEntities;
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
        PBDataWriterWriteStringField();
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
  v20 = self->_teamEntities;
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
        PBDataWriterWriteStringField();
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
  v25 = self->_eventEntities;
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
        PBDataWriterWriteStringField();
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
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 sportNames](self, "sportNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sportNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 sportNames](self, "sportNames");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 sportNames](self, "sportNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 leagues](self, "leagues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leagues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 leagues](self, "leagues");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 leagues](self, "leagues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leagues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 athleteEntities](self, "athleteEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "athleteEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 athleteEntities](self, "athleteEntities");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 athleteEntities](self, "athleteEntities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "athleteEntities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 teamEntities](self, "teamEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 teamEntities](self, "teamEntities");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 teamEntities](self, "teamEntities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "teamEntities");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 eventEntities](self, "eventEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 eventEntities](self, "eventEntities");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 eventEntities](self, "eventEntities");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventEntities");
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

  v3 = -[NSArray hash](self->_sportNames, "hash");
  v4 = -[NSArray hash](self->_leagues, "hash") ^ v3;
  v5 = -[NSArray hash](self->_athleteEntities, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_teamEntities, "hash");
  return v6 ^ -[NSArray hash](self->_eventEntities, "hash");
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
  if (self->_athleteEntities)
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 athleteEntities](self, "athleteEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("athleteEntities"));

  }
  if (self->_eventEntities)
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 eventEntities](self, "eventEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventEntities"));

  }
  if (self->_leagues)
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 leagues](self, "leagues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("league"));

  }
  if (-[NSArray count](self->_sportNames, "count"))
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 sportNames](self, "sportNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sportName"));

  }
  if (self->_teamEntities)
  {
    -[PEGASUSSchemaPEGASUSSportsExecutionTier1 teamEntities](self, "teamEntities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("teamEntities"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSSportsExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSSportsExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSSportsExecutionTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSSportsExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSSportsExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSSportsExecutionTier1 *v5;
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
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  void *v43;
  void *v44;
  PEGASUSSchemaPEGASUSSportsExecutionTier1 *v45;
  void *v47;
  void *v48;
  void *v49;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)PEGASUSSchemaPEGASUSSportsExecutionTier1;
  v5 = -[PEGASUSSchemaPEGASUSSportsExecutionTier1 init](&v70, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v67 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PEGASUSSchemaPEGASUSSportsExecutionTier1 addSportName:](v5, "addSportName:", objc_msgSend(v12, "intValue"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("league"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v63 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = (void *)objc_msgSend(v19, "copy");
              -[PEGASUSSchemaPEGASUSSportsExecutionTier1 addLeague:](v5, "addLeague:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        }
        while (v16);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("athleteEntities"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v59 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = (void *)objc_msgSend(v27, "copy");
              -[PEGASUSSchemaPEGASUSSportsExecutionTier1 addAthleteEntities:](v5, "addAthleteEntities:", v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
        }
        while (v24);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("teamEntities"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v55;
        do
        {
          for (m = 0; m != v32; ++m)
          {
            if (*(_QWORD *)v55 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = (void *)objc_msgSend(v35, "copy");
              -[PEGASUSSchemaPEGASUSSportsExecutionTier1 addTeamEntities:](v5, "addTeamEntities:", v36);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
        }
        while (v32);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventEntities"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = v6;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v51;
        do
        {
          for (n = 0; n != v40; ++n)
          {
            if (*(_QWORD *)v51 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = (void *)objc_msgSend(v43, "copy");
              -[PEGASUSSchemaPEGASUSSportsExecutionTier1 addEventEntities:](v5, "addEventEntities:", v44);

            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v71, 16);
        }
        while (v40);
      }

      v6 = v47;
    }
    v45 = v5;

  }
  return v5;
}

- (NSArray)sportNames
{
  return self->_sportNames;
}

- (void)setSportNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)leagues
{
  return self->_leagues;
}

- (void)setLeagues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)athleteEntities
{
  return self->_athleteEntities;
}

- (void)setAthleteEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)teamEntities
{
  return self->_teamEntities;
}

- (void)setTeamEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)eventEntities
{
  return self->_eventEntities;
}

- (void)setEventEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEntities, 0);
  objc_storeStrong((id *)&self->_teamEntities, 0);
  objc_storeStrong((id *)&self->_athleteEntities, 0);
  objc_storeStrong((id *)&self->_leagues, 0);
  objc_storeStrong((id *)&self->_sportNames, 0);
}

@end
