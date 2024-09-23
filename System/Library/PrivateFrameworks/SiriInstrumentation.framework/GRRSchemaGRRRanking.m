@implementation GRRSchemaGRRRanking

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GRRSchemaGRRRanking;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRRSchemaGRRRanking parseId](self, "parseId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[GRRSchemaGRRRanking deleteParseId](self, "deleteParseId");
  return v5;
}

- (BOOL)hasParseId
{
  return self->_parseId != 0;
}

- (void)deleteParseId
{
  -[GRRSchemaGRRRanking setParseId:](self, "setParseId:", 0);
}

- (void)setParseType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_parseType = a3;
}

- (BOOL)hasParseType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasParseType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteParseType
{
  -[GRRSchemaGRRRanking setParseType:](self, "setParseType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteScore
{
  -[GRRSchemaGRRRanking setScore:](self, "setScore:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRRankingReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[GRRSchemaGRRRanking parseId](self, "parseId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GRRSchemaGRRRanking parseId](self, "parseId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $23D9E48D5B502C3ED30316D3535A2798 has;
  unsigned int v14;
  int parseType;
  int v16;
  double score;
  double v18;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GRRSchemaGRRRanking parseId](self, "parseId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parseId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[GRRSchemaGRRRanking parseId](self, "parseId");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[GRRSchemaGRRRanking parseId](self, "parseId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parseId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_15;
    }
    else
    {

    }
    has = self->_has;
    v14 = v4[32];
    if ((*(_BYTE *)&has & 1) == (v14 & 1))
    {
      if ((*(_BYTE *)&has & 1) != 0)
      {
        parseType = self->_parseType;
        if (parseType != objc_msgSend(v4, "parseType"))
          goto LABEL_15;
        has = self->_has;
        v14 = v4[32];
      }
      v16 = (*(unsigned int *)&has >> 1) & 1;
      if (v16 == ((v14 >> 1) & 1))
      {
        if (!v16 || (score = self->_score, objc_msgSend(v4, "score"), score == v18))
        {
          v19 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {

  }
LABEL_15:
  v19 = 0;
LABEL_16:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[SISchemaUUID hash](self->_parseId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_parseType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  score = self->_score;
  v6 = -score;
  if (score >= 0.0)
    v6 = self->_score;
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
  return v4 ^ v3 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_parseId)
  {
    -[GRRSchemaGRRRanking parseId](self, "parseId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("parseId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("parseId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = -[GRRSchemaGRRRanking parseType](self, "parseType") - 1;
    if (v8 > 5)
      v9 = CFSTR("GRRPARSETYPE_UNKNOWN");
    else
      v9 = off_1E562F390[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("parseType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[GRRSchemaGRRRanking score](self, "score");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("score"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRRSchemaGRRRanking dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRRSchemaGRRRanking)initWithJSON:(id)a3
{
  void *v4;
  GRRSchemaGRRRanking *v5;
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
    self = -[GRRSchemaGRRRanking initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRRSchemaGRRRanking)initWithDictionary:(id)a3
{
  id v4;
  GRRSchemaGRRRanking *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  GRRSchemaGRRRanking *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GRRSchemaGRRRanking;
  v5 = -[GRRSchemaGRRRanking init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parseId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[GRRSchemaGRRRanking setParseId:](v5, "setParseId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parseType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRRanking setParseType:](v5, "setParseType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[GRRSchemaGRRRanking setScore:](v5, "setScore:");
    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)parseId
{
  return self->_parseId;
}

- (void)setParseId:(id)a3
{
  objc_storeStrong((id *)&self->_parseId, a3);
}

- (int)parseType
{
  return self->_parseType;
}

- (double)score
{
  return self->_score;
}

- (void)setHasParseId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseId, 0);
}

@end
