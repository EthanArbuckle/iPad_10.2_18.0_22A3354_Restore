@implementation PREUMResponseList

- (BOOL)hasExperiment
{
  return self->_experiment != 0;
}

- (BOOL)hasMsgMetadata
{
  return self->_msgMetadata != 0;
}

- (void)clearItems
{
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
}

- (void)addItems:(id)a3
{
  id v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  items = self->_items;
  v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_items;
    self->_items = v6;

    v4 = v8;
    items = self->_items;
  }
  -[NSMutableArray addObject:](items, "addObject:", v4);

}

- (unint64_t)itemsCount
{
  return -[NSMutableArray count](self->_items, "count");
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

- (void)setIsCached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isCached = a3;
}

- (void)setHasIsCached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsCached
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setResponseTimePerf:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseTimePerf = a3;
}

- (void)setHasResponseTimePerf:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTimePerf
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)generationStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_generationStatus;
  else
    return 0;
}

- (void)setGenerationStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_generationStatus = a3;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)generationStatusAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7D9DFA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGenerationStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NORMAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CACHED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FALLBACK_TO_RK_NIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FALLBACK_TO_RK_ERROR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONLY_CANNED_QR_EMPTY_ARRAY")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)PREUMResponseList;
  -[PREUMResponseList description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREUMResponseList dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PREUMTrialExperiment *experiment;
  void *v5;
  PREUMMessageMetadata *msgMetadata;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char has;
  void *v16;
  void *v17;
  uint64_t generationStatus;
  __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  experiment = self->_experiment;
  if (experiment)
  {
    -[PREUMTrialExperiment dictionaryRepresentation](experiment, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("experiment"));

  }
  msgMetadata = self->_msgMetadata;
  if (msgMetadata)
  {
    -[PREUMMessageMetadata dictionaryRepresentation](msgMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("msg_metadata"));

  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_items;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("items"));
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_16;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_responseTimePerf);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("response_time_perf"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCached);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("is_cached"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_19;
LABEL_16:
  if ((has & 2) == 0)
    return v3;
LABEL_20:
  generationStatus = self->_generationStatus;
  if (generationStatus >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_generationStatus);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E7D9DFA0[generationStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("generation_status"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PREUMResponseListReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_experiment)
    PBDataWriterWriteSubmessage();
  if (self->_msgMetadata)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_14;
LABEL_18:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_18;
LABEL_14:
  if ((has & 2) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  id v9;

  v9 = a3;
  if (self->_experiment)
    objc_msgSend(v9, "setExperiment:");
  if (self->_msgMetadata)
    objc_msgSend(v9, "setMsgMetadata:");
  if (-[PREUMResponseList itemsCount](self, "itemsCount"))
  {
    objc_msgSend(v9, "clearItems");
    v4 = -[PREUMResponseList itemsCount](self, "itemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PREUMResponseList itemsAtIndex:](self, "itemsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addItems:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
LABEL_15:
    *((_QWORD *)v9 + 1) = self->_responseTimePerf;
    *((_BYTE *)v9 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_BYTE *)v9 + 48) = self->_isCached;
  *((_BYTE *)v9 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v9 + 6) = self->_generationStatus;
    *((_BYTE *)v9 + 52) |= 2u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char has;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PREUMTrialExperiment copyWithZone:](self->_experiment, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[PREUMMessageMetadata copyWithZone:](self->_msgMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_items;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addItems:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_10;
LABEL_14:
    *(_QWORD *)(v5 + 8) = self->_responseTimePerf;
    *(_BYTE *)(v5 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_11;
  }
  *(_BYTE *)(v5 + 48) = self->_isCached;
  *(_BYTE *)(v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if ((has & 2) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 24) = self->_generationStatus;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PREUMTrialExperiment *experiment;
  PREUMMessageMetadata *msgMetadata;
  NSMutableArray *items;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  experiment = self->_experiment;
  if ((unint64_t)experiment | *((_QWORD *)v4 + 2))
  {
    if (!-[PREUMTrialExperiment isEqual:](experiment, "isEqual:"))
      goto LABEL_25;
  }
  msgMetadata = self->_msgMetadata;
  if ((unint64_t)msgMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[PREUMMessageMetadata isEqual:](msgMetadata, "isEqual:"))
      goto LABEL_25;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) != 0)
    {
      if (self->_isCached)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_25;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_16;
    }
LABEL_25:
    v8 = 0;
    goto LABEL_26;
  }
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
    goto LABEL_25;
LABEL_16:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_responseTimePerf != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_25;
  }
  v8 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_generationStatus != *((_DWORD *)v4 + 6))
      goto LABEL_25;
    v8 = 1;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[PREUMTrialExperiment hash](self->_experiment, "hash");
  v4 = -[PREUMMessageMetadata hash](self->_msgMetadata, "hash");
  v5 = -[NSMutableArray hash](self->_items, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v6 = 2654435761 * self->_isCached;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v7 = 2654435761u * self->_responseTimePerf;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v8 = 2654435761 * self->_generationStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PREUMTrialExperiment *experiment;
  uint64_t v6;
  PREUMMessageMetadata *msgMetadata;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  experiment = self->_experiment;
  v6 = *((_QWORD *)v4 + 2);
  if (experiment)
  {
    if (v6)
      -[PREUMTrialExperiment mergeFrom:](experiment, "mergeFrom:");
  }
  else if (v6)
  {
    -[PREUMResponseList setExperiment:](self, "setExperiment:");
  }
  msgMetadata = self->_msgMetadata;
  v8 = *((_QWORD *)v4 + 5);
  if (msgMetadata)
  {
    if (v8)
      -[PREUMMessageMetadata mergeFrom:](msgMetadata, "mergeFrom:");
  }
  else if (v8)
  {
    -[PREUMResponseList setMsgMetadata:](self, "setMsgMetadata:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = *((id *)v4 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[PREUMResponseList addItems:](self, "addItems:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  v14 = *((_BYTE *)v4 + 52);
  if ((v14 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0)
      goto LABEL_20;
LABEL_24:
    self->_responseTimePerf = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  self->_isCached = *((_BYTE *)v4 + 48);
  *(_BYTE *)&self->_has |= 4u;
  v14 = *((_BYTE *)v4 + 52);
  if ((v14 & 1) != 0)
    goto LABEL_24;
LABEL_20:
  if ((v14 & 2) != 0)
  {
LABEL_21:
    self->_generationStatus = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_22:

}

- (PREUMTrialExperiment)experiment
{
  return self->_experiment;
}

- (void)setExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_experiment, a3);
}

- (PREUMMessageMetadata)msgMetadata
{
  return self->_msgMetadata;
}

- (void)setMsgMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_msgMetadata, a3);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (unint64_t)responseTimePerf
{
  return self->_responseTimePerf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgMetadata, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

@end
