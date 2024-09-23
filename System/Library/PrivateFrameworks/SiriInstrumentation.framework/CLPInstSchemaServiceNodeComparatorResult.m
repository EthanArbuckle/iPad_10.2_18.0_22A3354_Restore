@implementation CLPInstSchemaServiceNodeComparatorResult

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setComparatorName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_comparatorName = a3;
}

- (BOOL)hasComparatorName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasComparatorName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteComparatorName
{
  -[CLPInstSchemaServiceNodeComparatorResult setComparatorName:](self, "setComparatorName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsValidOriginalItem:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isValidOriginalItem = a3;
}

- (BOOL)hasIsValidOriginalItem
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsValidOriginalItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsValidOriginalItem
{
  -[CLPInstSchemaServiceNodeComparatorResult setIsValidOriginalItem:](self, "setIsValidOriginalItem:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsValidReplayedItem:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isValidReplayedItem = a3;
}

- (BOOL)hasIsValidReplayedItem
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsValidReplayedItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsValidReplayedItem
{
  -[CLPInstSchemaServiceNodeComparatorResult setIsValidReplayedItem:](self, "setIsValidReplayedItem:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsMatched:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isMatched = a3;
}

- (BOOL)hasIsMatched
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsMatched:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsMatched
{
  -[CLPInstSchemaServiceNodeComparatorResult setIsMatched:](self, "setIsMatched:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)clearMismatchedFields
{
  -[NSArray removeAllObjects](self->_mismatchedFields, "removeAllObjects");
}

- (void)addMismatchedFields:(unint64_t)a3
{
  NSArray *mismatchedFields;
  NSArray *v6;
  NSArray *v7;
  id v8;

  mismatchedFields = self->_mismatchedFields;
  if (!mismatchedFields)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mismatchedFields;
    self->_mismatchedFields = v6;

    mismatchedFields = self->_mismatchedFields;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](mismatchedFields, "addObject:", v8);

}

- (unint64_t)mismatchedFieldsCount
{
  return -[NSArray count](self->_mismatchedFields, "count");
}

- (unint64_t)mismatchedFieldsAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_mismatchedFields, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaServiceNodeComparatorResultReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_mismatchedFields;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedLongLongValue", (_QWORD)v11);
        PBDataWriterWriteUint64Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $BF0BA5941349B6B18C1F25CF79745885 has;
  unsigned int v6;
  int comparatorName;
  int v8;
  int isValidOriginalItem;
  int v10;
  int isValidReplayedItem;
  int v12;
  int isMatched;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    comparatorName = self->_comparatorName;
    if (comparatorName != objc_msgSend(v4, "comparatorName"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      isValidOriginalItem = self->_isValidOriginalItem;
      if (isValidOriginalItem != objc_msgSend(v4, "isValidOriginalItem"))
        goto LABEL_22;
      has = self->_has;
      v6 = v4[24];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        isValidReplayedItem = self->_isValidReplayedItem;
        if (isValidReplayedItem != objc_msgSend(v4, "isValidReplayedItem"))
          goto LABEL_22;
        has = self->_has;
        v6 = v4[24];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12 || (isMatched = self->_isMatched, isMatched == objc_msgSend(v4, "isMatched")))
        {
          -[CLPInstSchemaServiceNodeComparatorResult mismatchedFields](self, "mismatchedFields");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "mismatchedFields");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if ((v14 == 0) != (v15 != 0))
          {
            -[CLPInstSchemaServiceNodeComparatorResult mismatchedFields](self, "mismatchedFields");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {

LABEL_25:
              v22 = 1;
              goto LABEL_23;
            }
            v18 = (void *)v17;
            -[CLPInstSchemaServiceNodeComparatorResult mismatchedFields](self, "mismatchedFields");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "mismatchedFields");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if ((v21 & 1) != 0)
              goto LABEL_25;
          }
          else
          {

          }
        }
      }
    }
  }
LABEL_22:
  v22 = 0;
LABEL_23:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_comparatorName;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isValidOriginalItem;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSArray hash](self->_mismatchedFields, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_isValidReplayedItem;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_isMatched;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSArray hash](self->_mismatchedFields, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[CLPInstSchemaServiceNodeComparatorResult comparatorName](self, "comparatorName") - 1;
    if (v5 > 5)
      v6 = CFSTR("CLPCOMPARATORNAME_UNKNOWN");
    else
      v6 = off_1E562BFD8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("comparatorName"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaServiceNodeComparatorResult isMatched](self, "isMatched"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isMatched"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaServiceNodeComparatorResult isValidOriginalItem](self, "isValidOriginalItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isValidOriginalItem"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaServiceNodeComparatorResult isValidReplayedItem](self, "isValidReplayedItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isValidReplayedItem"));

  }
LABEL_10:
  if (-[NSArray count](self->_mismatchedFields, "count"))
  {
    -[CLPInstSchemaServiceNodeComparatorResult mismatchedFields](self, "mismatchedFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mismatchedFields"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaServiceNodeComparatorResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaServiceNodeComparatorResult)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaServiceNodeComparatorResult *v5;
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
    self = -[CLPInstSchemaServiceNodeComparatorResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaServiceNodeComparatorResult)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaServiceNodeComparatorResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CLPInstSchemaServiceNodeComparatorResult *v17;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLPInstSchemaServiceNodeComparatorResult;
  v5 = -[CLPInstSchemaServiceNodeComparatorResult init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("comparatorName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaServiceNodeComparatorResult setComparatorName:](v5, "setComparatorName:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isValidOriginalItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaServiceNodeComparatorResult setIsValidOriginalItem:](v5, "setIsValidOriginalItem:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isValidReplayedItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaServiceNodeComparatorResult setIsValidReplayedItem:](v5, "setIsValidReplayedItem:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMatched"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaServiceNodeComparatorResult setIsMatched:](v5, "setIsMatched:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mismatchedFields"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      v20 = v7;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[CLPInstSchemaServiceNodeComparatorResult addMismatchedFields:](v5, "addMismatchedFields:", objc_msgSend(v16, "unsignedLongLongValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v7 = v20;
      v6 = v21;
      v8 = v19;
    }
    v17 = v5;

  }
  return v5;
}

- (int)comparatorName
{
  return self->_comparatorName;
}

- (BOOL)isValidOriginalItem
{
  return self->_isValidOriginalItem;
}

- (BOOL)isValidReplayedItem
{
  return self->_isValidReplayedItem;
}

- (BOOL)isMatched
{
  return self->_isMatched;
}

- (NSArray)mismatchedFields
{
  return self->_mismatchedFields;
}

- (void)setMismatchedFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mismatchedFields, 0);
}

@end
