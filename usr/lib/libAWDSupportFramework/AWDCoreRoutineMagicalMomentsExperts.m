@implementation AWDCoreRoutineMagicalMomentsExperts

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicalMomentsExperts setExperts:](self, "setExperts:", 0);
  -[AWDCoreRoutineMagicalMomentsExperts setSuggestions:](self, "setSuggestions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExperts;
  -[AWDCoreRoutineMagicalMomentsExperts dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDurationSinceLastSuccessfulTraining:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationSinceLastSuccessfulTraining = a3;
}

- (void)setHasDurationSinceLastSuccessfulTraining:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSinceLastSuccessfulTraining
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTrainingTime:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_trainingTime = a3;
}

- (void)setHasTrainingTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrainingTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearExperts
{
  -[NSMutableArray removeAllObjects](self->_experts, "removeAllObjects");
}

- (void)addExperts:(id)a3
{
  NSMutableArray *experts;

  experts = self->_experts;
  if (!experts)
  {
    experts = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_experts = experts;
  }
  -[NSMutableArray addObject:](experts, "addObject:", a3);
}

- (unint64_t)expertsCount
{
  return -[NSMutableArray count](self->_experts, "count");
}

- (id)expertsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_experts, "objectAtIndex:", a3);
}

+ (Class)expertsType
{
  return (Class)objc_opt_class();
}

- (void)clearSuggestions
{
  -[NSMutableArray removeAllObjects](self->_suggestions, "removeAllObjects");
}

- (void)addSuggestions:(id)a3
{
  NSMutableArray *suggestions;

  suggestions = self->_suggestions;
  if (!suggestions)
  {
    suggestions = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_suggestions = suggestions;
  }
  -[NSMutableArray addObject:](suggestions, "addObject:", a3);
}

- (unint64_t)suggestionsCount
{
  return -[NSMutableArray count](self->_suggestions, "count");
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestions, "objectAtIndex:", a3);
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExperts;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicalMomentsExperts description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsExperts dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *experts;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *suggestions;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_durationSinceLastSuccessfulTraining), CFSTR("durationSinceLastSuccessfulTraining"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_trainingTime), CFSTR("trainingTime"));
LABEL_5:
  if (-[NSMutableArray count](self->_experts, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_experts, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    experts = self->_experts;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experts, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(experts);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experts, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("experts"));

  }
  if (-[NSMutableArray count](self->_suggestions, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    suggestions = self->_suggestions;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(suggestions);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("suggestions"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsExpertsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *experts;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *suggestions;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  experts = self->_experts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experts, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(experts);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experts, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  suggestions = self->_suggestions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(suggestions);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_15:
    *((_DWORD *)a3 + 4) = self->_durationSinceLastSuccessfulTraining;
    *((_BYTE *)a3 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)a3 + 1) = self->_timestamp;
  *((_BYTE *)a3 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 10) = self->_trainingTime;
    *((_BYTE *)a3 + 44) |= 4u;
  }
LABEL_5:
  if (-[AWDCoreRoutineMagicalMomentsExperts expertsCount](self, "expertsCount"))
  {
    objc_msgSend(a3, "clearExperts");
    v6 = -[AWDCoreRoutineMagicalMomentsExperts expertsCount](self, "expertsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addExperts:", -[AWDCoreRoutineMagicalMomentsExperts expertsAtIndex:](self, "expertsAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineMagicalMomentsExperts suggestionsCount](self, "suggestionsCount"))
  {
    objc_msgSend(a3, "clearSuggestions");
    v9 = -[AWDCoreRoutineMagicalMomentsExperts suggestionsCount](self, "suggestionsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addSuggestions:", -[AWDCoreRoutineMagicalMomentsExperts suggestionsAtIndex:](self, "suggestionsAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *experts;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *suggestions;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_durationSinceLastSuccessfulTraining;
  *(_BYTE *)(v5 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_trainingTime;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
LABEL_5:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  experts = self->_experts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experts, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(experts);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addExperts:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experts, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  suggestions = self->_suggestions;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(suggestions);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addSuggestions:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestions, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *experts;
  NSMutableArray *suggestions;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_durationSinceLastSuccessfulTraining != *((_DWORD *)a3 + 4))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_trainingTime != *((_DWORD *)a3 + 10))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_21;
    }
    experts = self->_experts;
    if (!((unint64_t)experts | *((_QWORD *)a3 + 3))
      || (v5 = -[NSMutableArray isEqual:](experts, "isEqual:")) != 0)
    {
      suggestions = self->_suggestions;
      if ((unint64_t)suggestions | *((_QWORD *)a3 + 4))
        LOBYTE(v5) = -[NSMutableArray isEqual:](suggestions, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_durationSinceLastSuccessfulTraining;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_trainingTime;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_experts, "hash");
  return v6 ^ -[NSMutableArray hash](self->_suggestions, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_durationSinceLastSuccessfulTraining = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 44) & 4) != 0)
  {
LABEL_4:
    self->_trainingTime = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[AWDCoreRoutineMagicalMomentsExperts addExperts:](self, "addExperts:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[AWDCoreRoutineMagicalMomentsExperts addSuggestions:](self, "addSuggestions:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)durationSinceLastSuccessfulTraining
{
  return self->_durationSinceLastSuccessfulTraining;
}

- (int)trainingTime
{
  return self->_trainingTime;
}

- (NSMutableArray)experts
{
  return self->_experts;
}

- (void)setExperts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
