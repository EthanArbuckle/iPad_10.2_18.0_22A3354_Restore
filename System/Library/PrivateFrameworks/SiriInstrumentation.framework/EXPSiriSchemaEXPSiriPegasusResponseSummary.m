@implementation EXPSiriSchemaEXPSiriPegasusResponseSummary

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setResultDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resultDomain = a3;
}

- (BOOL)hasResultDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResultDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResultDomain
{
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary setResultDomain:](self, "setResultDomain:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResponseStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_responseStatus = a3;
}

- (BOOL)hasResponseStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResponseStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResponseStatus
{
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary setResponseStatus:](self, "setResponseStatus:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearCanonicalIds
{
  -[NSArray removeAllObjects](self->_canonicalIds, "removeAllObjects");
}

- (void)addCanonicalIds:(id)a3
{
  id v4;
  NSArray *canonicalIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  canonicalIds = self->_canonicalIds;
  v8 = v4;
  if (!canonicalIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_canonicalIds;
    self->_canonicalIds = v6;

    v4 = v8;
    canonicalIds = self->_canonicalIds;
  }
  -[NSArray addObject:](canonicalIds, "addObject:", v4);

}

- (unint64_t)canonicalIdsCount
{
  return -[NSArray count](self->_canonicalIds, "count");
}

- (id)canonicalIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_canonicalIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCatId
{
  return self->_catId != 0;
}

- (void)deleteCatId
{
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary setCatId:](self, "setCatId:", 0);
}

- (void)setConfidenceScore:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_confidenceScore = a3;
}

- (BOOL)hasConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteConfidenceScore
{
  double v2;

  LODWORD(v2) = 0;
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary setConfidenceScore:](self, "setConfidenceScore:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return EXPSiriSchemaEXPSiriPegasusResponseSummaryReadFrom(self, (uint64_t)a3, v3);
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
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_canonicalIds;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[EXPSiriSchemaEXPSiriPegasusResponseSummary catId](self, "catId", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A45F7D47595F4E6FCF4F2CAD6FEB87BE has;
  unsigned int v6;
  int resultDomain;
  int v8;
  int responseStatus;
  void *v10;
  void *v11;
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
  BOOL v22;
  int v24;
  float confidenceScore;
  float v26;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    resultDomain = self->_resultDomain;
    if (resultDomain != objc_msgSend(v4, "resultDomain"))
      goto LABEL_19;
    has = self->_has;
    v6 = v4[36];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    responseStatus = self->_responseStatus;
    if (responseStatus != objc_msgSend(v4, "responseStatus"))
      goto LABEL_19;
  }
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary canonicalIds](self, "canonicalIds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_18;
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary canonicalIds](self, "canonicalIds");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[EXPSiriSchemaEXPSiriPegasusResponseSummary canonicalIds](self, "canonicalIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalIds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_19;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary catId](self, "catId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[EXPSiriSchemaEXPSiriPegasusResponseSummary catId](self, "catId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[EXPSiriSchemaEXPSiriPegasusResponseSummary catId](self, "catId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_19;
  }
  else
  {

  }
  v24 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v24 == ((v4[36] >> 2) & 1))
  {
    if (!v24 || (confidenceScore = self->_confidenceScore, objc_msgSend(v4, "confidenceScore"), confidenceScore == v26))
    {
      v22 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  v22 = 0;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  float confidenceScore;
  double v9;
  long double v10;
  double v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_resultDomain;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_responseStatus;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSArray hash](self->_canonicalIds, "hash");
  v6 = -[NSString hash](self->_catId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    confidenceScore = self->_confidenceScore;
    v9 = confidenceScore;
    if (confidenceScore < 0.0)
      v9 = -confidenceScore;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_canonicalIds)
  {
    -[EXPSiriSchemaEXPSiriPegasusResponseSummary canonicalIds](self, "canonicalIds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("canonicalIds"));

  }
  if (self->_catId)
  {
    -[EXPSiriSchemaEXPSiriPegasusResponseSummary catId](self, "catId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("catId"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[EXPSiriSchemaEXPSiriPegasusResponseSummary confidenceScore](self, "confidenceScore");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("confidenceScore"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v11 = -[EXPSiriSchemaEXPSiriPegasusResponseSummary responseStatus](self, "responseStatus") - 1;
  if (v11 > 2)
    v12 = CFSTR("PEGASUSRESPONSESTATUS_UNKNOWN");
  else
    v12 = off_1E5638BC8[v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("responseStatus"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    v13 = -[EXPSiriSchemaEXPSiriPegasusResponseSummary resultDomain](self, "resultDomain") - 1;
    if (v13 > 0x1B)
      v14 = CFSTR("PEGASUSDOMAIN_UNKNOWN");
    else
      v14 = off_1E5638BE0[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("resultDomain"));
  }
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSiriSchemaEXPSiriPegasusResponseSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)initWithJSON:(id)a3
{
  void *v4;
  EXPSiriSchemaEXPSiriPegasusResponseSummary *v5;
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
    self = -[EXPSiriSchemaEXPSiriPegasusResponseSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)initWithDictionary:(id)a3
{
  id v4;
  EXPSiriSchemaEXPSiriPegasusResponseSummary *v5;
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
  EXPSiriSchemaEXPSiriPegasusResponseSummary *v19;
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
  v26.super_class = (Class)EXPSiriSchemaEXPSiriPegasusResponseSummary;
  v5 = -[EXPSiriSchemaEXPSiriPegasusResponseSummary init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultDomain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setResultDomain:](v5, "setResultDomain:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setResponseStatus:](v5, "setResponseStatus:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canonicalIds"));
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
            {
              v15 = (void *)objc_msgSend(v14, "copy");
              -[EXPSiriSchemaEXPSiriPegasusResponseSummary addCanonicalIds:](v5, "addCanonicalIds:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v11);
      }

      v6 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setCatId:](v5, "setCatId:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidenceScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setConfidenceScore:](v5, "setConfidenceScore:");
    }
    v19 = v5;

  }
  return v5;
}

- (int)resultDomain
{
  return self->_resultDomain;
}

- (int)responseStatus
{
  return self->_responseStatus;
}

- (NSArray)canonicalIds
{
  return self->_canonicalIds;
}

- (void)setCanonicalIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setHasCatId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_canonicalIds, 0);
}

@end
