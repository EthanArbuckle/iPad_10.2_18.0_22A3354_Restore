@implementation USOSchemaUSOMatchInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMatchSignalBitset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_matchSignalBitset = a3;
}

- (BOOL)hasMatchSignalBitset
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasMatchSignalBitset:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteMatchSignalBitset
{
  -[USOSchemaUSOMatchInfo setMatchSignalBitset:](self, "setMatchSignalBitset:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setMatchScore:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_matchScore = a3;
}

- (BOOL)hasMatchScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasMatchScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteMatchScore
{
  double v2;

  LODWORD(v2) = 0;
  -[USOSchemaUSOMatchInfo setMatchScore:](self, "setMatchScore:", v2);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setMaxTokenCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxTokenCount = a3;
}

- (BOOL)hasMaxTokenCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasMaxTokenCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteMaxTokenCount
{
  -[USOSchemaUSOMatchInfo setMaxTokenCount:](self, "setMaxTokenCount:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setMatchedTokenCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_matchedTokenCount = a3;
}

- (BOOL)hasMatchedTokenCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasMatchedTokenCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteMatchedTokenCount
{
  -[USOSchemaUSOMatchInfo setMatchedTokenCount:](self, "setMatchedTokenCount:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setMaxStopWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxStopWordCount = a3;
}

- (BOOL)hasMaxStopWordCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasMaxStopWordCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteMaxStopWordCount
{
  -[USOSchemaUSOMatchInfo setMaxStopWordCount:](self, "setMaxStopWordCount:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setMatchedStopWordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_matchedStopWordCount = a3;
}

- (BOOL)hasMatchedStopWordCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasMatchedStopWordCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteMatchedStopWordCount
{
  -[USOSchemaUSOMatchInfo setMatchedStopWordCount:](self, "setMatchedStopWordCount:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setEditDistance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_editDistance = a3;
}

- (BOOL)hasEditDistance
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasEditDistance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteEditDistance
{
  -[USOSchemaUSOMatchInfo setEditDistance:](self, "setEditDistance:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setMaxAliasCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_maxAliasCount = a3;
}

- (BOOL)hasMaxAliasCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasMaxAliasCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteMaxAliasCount
{
  -[USOSchemaUSOMatchInfo setMaxAliasCount:](self, "setMaxAliasCount:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setMatchedAliasCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_matchedAliasCount = a3;
}

- (BOOL)hasMatchedAliasCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasMatchedAliasCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteMatchedAliasCount
{
  -[USOSchemaUSOMatchInfo setMatchedAliasCount:](self, "setMatchedAliasCount:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)clearMatchedAliasTypes
{
  -[NSArray removeAllObjects](self->_matchedAliasTypes, "removeAllObjects");
}

- (void)addMatchedAliasTypes:(int)a3
{
  uint64_t v3;
  NSArray *matchedAliasTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  matchedAliasTypes = self->_matchedAliasTypes;
  if (!matchedAliasTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchedAliasTypes;
    self->_matchedAliasTypes = v6;

    matchedAliasTypes = self->_matchedAliasTypes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](matchedAliasTypes, "addObject:", v8);

}

- (unint64_t)matchedAliasTypesCount
{
  return -[NSArray count](self->_matchedAliasTypes, "count");
}

- (int)matchedAliasTypesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_matchedAliasTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return USOSchemaUSOMatchInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_matchedAliasTypes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "intValue", (_QWORD)v11);
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $82F105DB2C6B60213E4FE09A026515AB has;
  unsigned int v6;
  unsigned int matchSignalBitset;
  int v8;
  float matchScore;
  float v10;
  int v11;
  unsigned int maxTokenCount;
  int v13;
  unsigned int matchedTokenCount;
  int v15;
  unsigned int maxStopWordCount;
  int v17;
  unsigned int matchedStopWordCount;
  int v19;
  unsigned int editDistance;
  int v21;
  unsigned int maxAliasCount;
  int v23;
  unsigned int matchedAliasCount;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    matchSignalBitset = self->_matchSignalBitset;
    if (matchSignalBitset != objc_msgSend(v4, "matchSignalBitset"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      matchScore = self->_matchScore;
      objc_msgSend(v4, "matchScore");
      if (matchScore != v10)
        goto LABEL_42;
      has = self->_has;
      v6 = v4[28];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        maxTokenCount = self->_maxTokenCount;
        if (maxTokenCount != objc_msgSend(v4, "maxTokenCount"))
          goto LABEL_42;
        has = self->_has;
        v6 = v4[28];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          matchedTokenCount = self->_matchedTokenCount;
          if (matchedTokenCount != objc_msgSend(v4, "matchedTokenCount"))
            goto LABEL_42;
          has = self->_has;
          v6 = v4[28];
        }
        v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            maxStopWordCount = self->_maxStopWordCount;
            if (maxStopWordCount != objc_msgSend(v4, "maxStopWordCount"))
              goto LABEL_42;
            has = self->_has;
            v6 = v4[28];
          }
          v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (v17)
            {
              matchedStopWordCount = self->_matchedStopWordCount;
              if (matchedStopWordCount != objc_msgSend(v4, "matchedStopWordCount"))
                goto LABEL_42;
              has = self->_has;
              v6 = v4[28];
            }
            v19 = (*(unsigned int *)&has >> 6) & 1;
            if (v19 == ((v6 >> 6) & 1))
            {
              if (v19)
              {
                editDistance = self->_editDistance;
                if (editDistance != objc_msgSend(v4, "editDistance"))
                  goto LABEL_42;
                has = self->_has;
                v6 = v4[28];
              }
              v21 = (*(unsigned int *)&has >> 7) & 1;
              if (v21 == ((v6 >> 7) & 1))
              {
                if (v21)
                {
                  maxAliasCount = self->_maxAliasCount;
                  if (maxAliasCount != objc_msgSend(v4, "maxAliasCount"))
                    goto LABEL_42;
                  has = self->_has;
                  v6 = v4[28];
                }
                v23 = (*(unsigned int *)&has >> 8) & 1;
                if (v23 == ((v6 >> 8) & 1))
                {
                  if (!v23
                    || (matchedAliasCount = self->_matchedAliasCount,
                        matchedAliasCount == objc_msgSend(v4, "matchedAliasCount")))
                  {
                    -[USOSchemaUSOMatchInfo matchedAliasTypes](self, "matchedAliasTypes");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "matchedAliasTypes");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = v26;
                    if ((v25 == 0) != (v26 != 0))
                    {
                      -[USOSchemaUSOMatchInfo matchedAliasTypes](self, "matchedAliasTypes");
                      v28 = objc_claimAutoreleasedReturnValue();
                      if (!v28)
                      {

LABEL_45:
                        v33 = 1;
                        goto LABEL_43;
                      }
                      v29 = (void *)v28;
                      -[USOSchemaUSOMatchInfo matchedAliasTypes](self, "matchedAliasTypes");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "matchedAliasTypes");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = objc_msgSend(v30, "isEqual:", v31);

                      if ((v32 & 1) != 0)
                        goto LABEL_45;
                    }
                    else
                    {

                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_42:
  v33 = 0;
LABEL_43:

  return v33;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  float matchScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_matchSignalBitset;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  matchScore = self->_matchScore;
  v6 = matchScore;
  if (matchScore < 0.0)
    v6 = -matchScore;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    v10 = 2654435761 * self->_maxTokenCount;
    if ((has & 8) != 0)
    {
LABEL_13:
      v11 = 2654435761 * self->_matchedTokenCount;
      if ((has & 0x10) != 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else
  {
    v10 = 0;
    if ((has & 8) != 0)
      goto LABEL_13;
  }
  v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_14:
    v12 = 2654435761 * self->_maxStopWordCount;
    if ((has & 0x20) != 0)
      goto LABEL_15;
    goto LABEL_22;
  }
LABEL_21:
  v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_15:
    v13 = 2654435761 * self->_matchedStopWordCount;
    if ((has & 0x40) != 0)
      goto LABEL_16;
    goto LABEL_23;
  }
LABEL_22:
  v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_16:
    v14 = 2654435761 * self->_editDistance;
    if ((has & 0x80) != 0)
      goto LABEL_17;
LABEL_24:
    v15 = 0;
    if ((has & 0x100) != 0)
      goto LABEL_18;
LABEL_25:
    v16 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSArray hash](self->_matchedAliasTypes, "hash");
  }
LABEL_23:
  v14 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_24;
LABEL_17:
  v15 = 2654435761 * self->_maxAliasCount;
  if ((has & 0x100) == 0)
    goto LABEL_25;
LABEL_18:
  v16 = 2654435761 * self->_matchedAliasCount;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSArray hash](self->_matchedAliasTypes, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo editDistance](self, "editDistance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("editDistance"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[USOSchemaUSOMatchInfo matchScore](self, "matchScore");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("matchScore"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchSignalBitset](self, "matchSignalBitset"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("matchSignalBitset"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchedAliasCount](self, "matchedAliasCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("matchedAliasCount"));

  }
LABEL_6:
  if (-[NSArray count](self->_matchedAliasTypes, "count"))
  {
    -[USOSchemaUSOMatchInfo matchedAliasTypes](self, "matchedAliasTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("matchedAliasTypes"));

  }
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchedStopWordCount](self, "matchedStopWordCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("matchedStopWordCount"));

    v8 = (__int16)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_10:
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo matchedTokenCount](self, "matchedTokenCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("matchedTokenCount"));

  v8 = (__int16)self->_has;
  if ((v8 & 0x80) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0)
      goto LABEL_12;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo maxStopWordCount](self, "maxStopWordCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("maxStopWordCount"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo maxAliasCount](self, "maxAliasCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("maxAliasCount"));

  v8 = (__int16)self->_has;
  if ((v8 & 0x10) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v8 & 4) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOMatchInfo maxTokenCount](self, "maxTokenCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("maxTokenCount"));

  }
LABEL_14:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOMatchInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOMatchInfo)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOMatchInfo *v5;
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
    self = -[USOSchemaUSOMatchInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOMatchInfo)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOMatchInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  USOSchemaUSOMatchInfo *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)USOSchemaUSOMatchInfo;
  v5 = -[USOSchemaUSOMatchInfo init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchSignalBitset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMatchSignalBitset:](v5, "setMatchSignalBitset:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[USOSchemaUSOMatchInfo setMatchScore:](v5, "setMatchScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxTokenCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMaxTokenCount:](v5, "setMaxTokenCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedTokenCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMatchedTokenCount:](v5, "setMatchedTokenCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxStopWordCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMaxStopWordCount:](v5, "setMaxStopWordCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedStopWordCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMatchedStopWordCount:](v5, "setMatchedStopWordCount:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editDistance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setEditDistance:](v5, "setEditDistance:", objc_msgSend(v12, "unsignedIntValue"));
    v31 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxAliasCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMaxAliasCount:](v5, "setMaxAliasCount:", objc_msgSend(v13, "unsignedIntValue"));
    v29 = v13;
    v30 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedAliasCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOMatchInfo setMatchedAliasCount:](v5, "setMatchedAliasCount:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedAliasTypes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v10;
      v25 = v9;
      v26 = v8;
      v27 = v7;
      v28 = v6;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[USOSchemaUSOMatchInfo addMatchedAliasTypes:](v5, "addMatchedAliasTypes:", objc_msgSend(v21, "intValue"));
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v18);
      }

      v7 = v27;
      v6 = v28;
      v9 = v25;
      v8 = v26;
      v10 = v24;
    }
    v22 = v5;

  }
  return v5;
}

- (unsigned)matchSignalBitset
{
  return self->_matchSignalBitset;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (unsigned)maxTokenCount
{
  return self->_maxTokenCount;
}

- (unsigned)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (unsigned)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (unsigned)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (unsigned)editDistance
{
  return self->_editDistance;
}

- (unsigned)maxAliasCount
{
  return self->_maxAliasCount;
}

- (unsigned)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (NSArray)matchedAliasTypes
{
  return self->_matchedAliasTypes;
}

- (void)setMatchedAliasTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedAliasTypes, 0);
}

@end
