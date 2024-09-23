@implementation MHSchemaMHUnintendedResponseSuppressionStarted

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHUnintendedResponseSuppressionStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MHSchemaMHUnintendedResponseSuppressionStarted deleteAftmScore](self, "deleteAftmScore");
  -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MHSchemaMHUnintendedResponseSuppressionStarted deleteLrnnScore](self, "deleteLrnnScore");
  -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MHSchemaMHUnintendedResponseSuppressionStarted deleteUemScore](self, "deleteUemScore");

  return v5;
}

- (void)setNumAsrRecords:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numAsrRecords = a3;
}

- (BOOL)hasNumAsrRecords
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumAsrRecords:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumAsrRecords
{
  -[MHSchemaMHUnintendedResponseSuppressionStarted setNumAsrRecords:](self, "setNumAsrRecords:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumTokensTopPath:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numTokensTopPath = a3;
}

- (BOOL)hasNumTokensTopPath
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumTokensTopPath:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumTokensTopPath
{
  -[MHSchemaMHUnintendedResponseSuppressionStarted setNumTokensTopPath:](self, "setNumTokensTopPath:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTrailingSilenceDurationInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_trailingSilenceDurationInNs = a3;
}

- (BOOL)hasTrailingSilenceDurationInNs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTrailingSilenceDurationInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTrailingSilenceDurationInNs
{
  -[MHSchemaMHUnintendedResponseSuppressionStarted setTrailingSilenceDurationInNs:](self, "setTrailingSilenceDurationInNs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasAftmScore
{
  return self->_aftmScore != 0;
}

- (void)deleteAftmScore
{
  -[MHSchemaMHUnintendedResponseSuppressionStarted setAftmScore:](self, "setAftmScore:", 0);
}

- (BOOL)hasLrnnScore
{
  return self->_lrnnScore != 0;
}

- (void)deleteLrnnScore
{
  -[MHSchemaMHUnintendedResponseSuppressionStarted setLrnnScore:](self, "setLrnnScore:", 0);
}

- (BOOL)hasUemScore
{
  return self->_uemScore != 0;
}

- (void)deleteUemScore
{
  -[MHSchemaMHUnintendedResponseSuppressionStarted setUemScore:](self, "setUemScore:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUnintendedResponseSuppressionStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $EEDD6289D62485C6C22111D683E4F799 has;
  unsigned int v6;
  unsigned int numAsrRecords;
  int v8;
  unsigned int numTokensTopPath;
  int v10;
  unint64_t trailingSilenceDurationInNs;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_28;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numAsrRecords = self->_numAsrRecords;
    if (numAsrRecords != objc_msgSend(v4, "numAsrRecords"))
      goto LABEL_28;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      numTokensTopPath = self->_numTokensTopPath;
      if (numTokensTopPath != objc_msgSend(v4, "numTokensTopPath"))
        goto LABEL_28;
      has = self->_has;
      v6 = v4[48];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1))
      goto LABEL_28;
    if (v10)
    {
      trailingSilenceDurationInNs = self->_trailingSilenceDurationInNs;
      if (trailingSilenceDurationInNs != objc_msgSend(v4, "trailingSilenceDurationInNs"))
        goto LABEL_28;
    }
    -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aftmScore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_27;
    -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aftmScore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_28;
    }
    else
    {

    }
    -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lrnnScore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_27;
    -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lrnnScore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (!v23)
        goto LABEL_28;
    }
    else
    {

    }
    -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uemScore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) != (v13 != 0))
    {
      -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {

LABEL_31:
        v29 = 1;
        goto LABEL_29;
      }
      v25 = (void *)v24;
      -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uemScore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if ((v28 & 1) != 0)
        goto LABEL_31;
    }
    else
    {
LABEL_27:

    }
  }
LABEL_28:
  v29 = 0;
LABEL_29:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

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
  v3 = 2654435761 * self->_numAsrRecords;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_numTokensTopPath;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761u * self->_trailingSilenceDurationInNs;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated hash](self->_aftmScore, "hash");
  v7 = -[MHSchemaMHLatticeFalseTriggerMitigationEnded hash](self->_lrnnScore, "hash");
  return v6 ^ v7 ^ -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated hash](self->_uemScore, "hash");
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
  char has;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aftmScore)
  {
    -[MHSchemaMHUnintendedResponseSuppressionStarted aftmScore](self, "aftmScore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aftmScore"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aftmScore"));

    }
  }
  if (self->_lrnnScore)
  {
    -[MHSchemaMHUnintendedResponseSuppressionStarted lrnnScore](self, "lrnnScore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("lrnnScore"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("lrnnScore"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHUnintendedResponseSuppressionStarted numAsrRecords](self, "numAsrRecords"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numAsrRecords"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHUnintendedResponseSuppressionStarted numTokensTopPath](self, "numTokensTopPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numTokensTopPath"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHUnintendedResponseSuppressionStarted trailingSilenceDurationInNs](self, "trailingSilenceDurationInNs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("trailingSilenceDurationInNs"));

  }
LABEL_15:
  if (self->_uemScore)
  {
    -[MHSchemaMHUnintendedResponseSuppressionStarted uemScore](self, "uemScore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("uemScore"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("uemScore"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHUnintendedResponseSuppressionStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHUnintendedResponseSuppressionStarted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHUnintendedResponseSuppressionStarted *v5;
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
    self = -[MHSchemaMHUnintendedResponseSuppressionStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHUnintendedResponseSuppressionStarted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHUnintendedResponseSuppressionStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *v10;
  void *v11;
  MHSchemaMHLatticeFalseTriggerMitigationEnded *v12;
  void *v13;
  MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated *v14;
  MHSchemaMHUnintendedResponseSuppressionStarted *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MHSchemaMHUnintendedResponseSuppressionStarted;
  v5 = -[MHSchemaMHUnintendedResponseSuppressionStarted init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAsrRecords"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUnintendedResponseSuppressionStarted setNumAsrRecords:](v5, "setNumAsrRecords:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numTokensTopPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUnintendedResponseSuppressionStarted setNumTokensTopPath:](v5, "setNumTokensTopPath:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingSilenceDurationInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHUnintendedResponseSuppressionStarted setTrailingSilenceDurationInNs:](v5, "setTrailingSilenceDurationInNs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aftmScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated initWithDictionary:]([MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated alloc], "initWithDictionary:", v9);
      -[MHSchemaMHUnintendedResponseSuppressionStarted setAftmScore:](v5, "setAftmScore:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lrnnScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[MHSchemaMHLatticeFalseTriggerMitigationEnded initWithDictionary:]([MHSchemaMHLatticeFalseTriggerMitigationEnded alloc], "initWithDictionary:", v11);
      -[MHSchemaMHUnintendedResponseSuppressionStarted setLrnnScore:](v5, "setLrnnScore:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uemScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated initWithDictionary:]([MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated alloc], "initWithDictionary:", v13);
      -[MHSchemaMHUnintendedResponseSuppressionStarted setUemScore:](v5, "setUemScore:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (unsigned)numAsrRecords
{
  return self->_numAsrRecords;
}

- (unsigned)numTokensTopPath
{
  return self->_numTokensTopPath;
}

- (unint64_t)trailingSilenceDurationInNs
{
  return self->_trailingSilenceDurationInNs;
}

- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)aftmScore
{
  return self->_aftmScore;
}

- (void)setAftmScore:(id)a3
{
  objc_storeStrong((id *)&self->_aftmScore, a3);
}

- (MHSchemaMHLatticeFalseTriggerMitigationEnded)lrnnScore
{
  return self->_lrnnScore;
}

- (void)setLrnnScore:(id)a3
{
  objc_storeStrong((id *)&self->_lrnnScore, a3);
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated)uemScore
{
  return self->_uemScore;
}

- (void)setUemScore:(id)a3
{
  objc_storeStrong((id *)&self->_uemScore, a3);
}

- (void)setHasAftmScore:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLrnnScore:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasUemScore:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uemScore, 0);
  objc_storeStrong((id *)&self->_lrnnScore, 0);
  objc_storeStrong((id *)&self->_aftmScore, 0);
}

@end
