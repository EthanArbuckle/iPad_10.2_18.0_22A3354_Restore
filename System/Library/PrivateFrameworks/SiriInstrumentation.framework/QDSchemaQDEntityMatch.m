@implementation QDSchemaQDEntityMatch

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
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QDSchemaQDEntityMatch;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v8, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6)
    -[QDSchemaQDEntityMatch deleteOriginAppBundleId](self, "deleteOriginAppBundleId");
  return v5;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startIndex = a3;
}

- (BOOL)hasStartIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStartIndex
{
  -[QDSchemaQDEntityMatch setStartIndex:](self, "setStartIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endIndex = a3;
}

- (BOOL)hasEndIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEndIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEndIndex
{
  -[QDSchemaQDEntityMatch setEndIndex:](self, "setEndIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearMatchingTransforms
{
  -[NSArray removeAllObjects](self->_matchingTransforms, "removeAllObjects");
}

- (void)addMatchingTransforms:(int)a3
{
  uint64_t v3;
  NSArray *matchingTransforms;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  matchingTransforms = self->_matchingTransforms;
  if (!matchingTransforms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchingTransforms;
    self->_matchingTransforms = v6;

    matchingTransforms = self->_matchingTransforms;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](matchingTransforms, "addObject:", v8);

}

- (unint64_t)matchingTransformsCount
{
  return -[NSArray count](self->_matchingTransforms, "count");
}

- (int)matchingTransformsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_matchingTransforms, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setMatcher:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_matcher = a3;
}

- (BOOL)hasMatcher
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMatcher:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMatcher
{
  -[QDSchemaQDEntityMatch setMatcher:](self, "setMatcher:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setMatchScore:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_matchScore = a3;
}

- (BOOL)hasMatchScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMatchScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteMatchScore
{
  double v2;

  LODWORD(v2) = 0;
  -[QDSchemaQDEntityMatch setMatchScore:](self, "setMatchScore:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasOriginAppBundleId
{
  return self->_originAppBundleId != 0;
}

- (void)deleteOriginAppBundleId
{
  -[QDSchemaQDEntityMatch setOriginAppBundleId:](self, "setOriginAppBundleId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return QDSchemaQDEntityMatchReadFrom(self, (uint64_t)a3, v3);
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
  char v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_matchingTransforms;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue", (_QWORD)v13);
        PBDataWriterWriteInt32Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0)
    PBDataWriterWriteFloatField();
  -[QDSchemaQDEntityMatch originAppBundleId](self, "originAppBundleId", (_QWORD)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $FCEBA31F971276F4F09CAE3A65545F0F has;
  unsigned int v6;
  unsigned int startIndex;
  int v8;
  unsigned int endIndex;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  $FCEBA31F971276F4F09CAE3A65545F0F v17;
  int v18;
  unsigned int v19;
  int matcher;
  int v21;
  float matchScore;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startIndex = self->_startIndex;
    if (startIndex != objc_msgSend(v4, "startIndex"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    endIndex = self->_endIndex;
    if (endIndex != objc_msgSend(v4, "endIndex"))
      goto LABEL_26;
  }
  -[QDSchemaQDEntityMatch matchingTransforms](self, "matchingTransforms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingTransforms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_25;
  -[QDSchemaQDEntityMatch matchingTransforms](self, "matchingTransforms");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[QDSchemaQDEntityMatch matchingTransforms](self, "matchingTransforms");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchingTransforms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_26;
  }
  else
  {

  }
  v17 = self->_has;
  v18 = (*(unsigned int *)&v17 >> 2) & 1;
  v19 = v4[40];
  if (v18 != ((v19 >> 2) & 1))
    goto LABEL_26;
  if (v18)
  {
    matcher = self->_matcher;
    if (matcher != objc_msgSend(v4, "matcher"))
      goto LABEL_26;
    v17 = self->_has;
    v19 = v4[40];
  }
  v21 = (*(unsigned int *)&v17 >> 3) & 1;
  if (v21 != ((v19 >> 3) & 1))
    goto LABEL_26;
  if (v21)
  {
    matchScore = self->_matchScore;
    objc_msgSend(v4, "matchScore");
    if (matchScore != v23)
      goto LABEL_26;
  }
  -[QDSchemaQDEntityMatch originAppBundleId](self, "originAppBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originAppBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_25:

    goto LABEL_26;
  }
  -[QDSchemaQDEntityMatch originAppBundleId](self, "originAppBundleId");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_29:
    v29 = 1;
    goto LABEL_27;
  }
  v25 = (void *)v24;
  -[QDSchemaQDEntityMatch originAppBundleId](self, "originAppBundleId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originAppBundleId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_29;
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float matchScore;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_startIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_endIndex;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSArray hash](self->_matchingTransforms, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_matcher;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_13:
    v11 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v5 ^ -[NSString hash](self->_originAppBundleId, "hash");
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_8:
  matchScore = self->_matchScore;
  v8 = matchScore;
  if (matchScore < 0.0)
    v8 = -matchScore;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v5 ^ -[NSString hash](self->_originAppBundleId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_3;
LABEL_18:
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[QDSchemaQDEntityMatch matchScore](self, "matchScore");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("matchScore"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_10;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[QDSchemaQDEntityMatch endIndex](self, "endIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("endIndex"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_3:
  if ((has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  v5 = -[QDSchemaQDEntityMatch matcher](self, "matcher");
  v6 = CFSTR("QDSPANMATCHERTYPE_UNKNOWN");
  if (v5 == 1)
    v6 = CFSTR("QDSPANMATCHERTYPE_SIRI_ENTITY_MATCHER");
  if (v5 == 2)
    v7 = CFSTR("QDSPANMATCHERTYPE_GLOBAL_ENTITY_MATCHER");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("matcher"));
LABEL_10:
  if (-[NSArray count](self->_matchingTransforms, "count"))
  {
    -[QDSchemaQDEntityMatch matchingTransforms](self, "matchingTransforms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("matchingTransforms"));

  }
  if (self->_originAppBundleId)
  {
    -[QDSchemaQDEntityMatch originAppBundleId](self, "originAppBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("originAppBundleId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[QDSchemaQDEntityMatch startIndex](self, "startIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDEntityMatch dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDEntityMatch)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDEntityMatch *v5;
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
    self = -[QDSchemaQDEntityMatch initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDEntityMatch)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDEntityMatch *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  QDSchemaQDEntityMatch *v19;
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
  v26.super_class = (Class)QDSchemaQDEntityMatch;
  v5 = -[QDSchemaQDEntityMatch init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDEntityMatch setStartIndex:](v5, "setStartIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDEntityMatch setEndIndex:](v5, "setEndIndex:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchingTransforms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[QDSchemaQDEntityMatch addMatchingTransforms:](v5, "addMatchingTransforms:", objc_msgSend(v14, "intValue"));
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v11);
      }

      v6 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matcher"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDEntityMatch setMatcher:](v5, "setMatcher:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchScore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "floatValue");
      -[QDSchemaQDEntityMatch setMatchScore:](v5, "setMatchScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originAppBundleId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[QDSchemaQDEntityMatch setOriginAppBundleId:](v5, "setOriginAppBundleId:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (NSArray)matchingTransforms
{
  return self->_matchingTransforms;
}

- (void)setMatchingTransforms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)matcher
{
  return self->_matcher;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (NSString)originAppBundleId
{
  return self->_originAppBundleId;
}

- (void)setOriginAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasOriginAppBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppBundleId, 0);
  objc_storeStrong((id *)&self->_matchingTransforms, 0);
}

@end
