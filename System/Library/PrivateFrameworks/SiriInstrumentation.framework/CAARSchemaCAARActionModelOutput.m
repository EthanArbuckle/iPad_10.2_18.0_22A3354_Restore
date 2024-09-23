@implementation CAARSchemaCAARActionModelOutput

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
  v9.super_class = (Class)CAARSchemaCAARActionModelOutput;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[CAARSchemaCAARActionModelOutput deleteActionCandidateId](self, "deleteActionCandidateId");
  return v5;
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

- (void)deleteActionCandidateId
{
  -[CAARSchemaCAARActionModelOutput setActionCandidateId:](self, "setActionCandidateId:", 0);
}

- (void)setModelScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modelScore = a3;
}

- (BOOL)hasModelScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasModelScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteModelScore
{
  double v2;

  LODWORD(v2) = 0;
  -[CAARSchemaCAARActionModelOutput setModelScore:](self, "setModelScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return CAARSchemaCAARActionModelOutputReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  float modelScore;
  float v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionCandidateId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_11;
    }
    else
    {

    }
    if ((*(_BYTE *)&self->_has & 1) == (v4[20] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (modelScore = self->_modelScore, objc_msgSend(v4, "modelScore"), modelScore == v14))
      {
        v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {

  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  float modelScore;
  double v6;
  long double v7;
  double v8;

  v3 = -[SISchemaUUID hash](self->_actionCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    modelScore = self->_modelScore;
    v6 = modelScore;
    if (modelScore < 0.0)
      v6 = -modelScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionCandidateId)
  {
    -[CAARSchemaCAARActionModelOutput actionCandidateId](self, "actionCandidateId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCandidateId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionCandidateId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CAARSchemaCAARActionModelOutput modelScore](self, "modelScore");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARActionModelOutput dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARActionModelOutput)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARActionModelOutput *v5;
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
    self = -[CAARSchemaCAARActionModelOutput initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARActionModelOutput)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARActionModelOutput *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  CAARSchemaCAARActionModelOutput *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAARSchemaCAARActionModelOutput;
  v5 = -[CAARSchemaCAARActionModelOutput init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidateId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CAARSchemaCAARActionModelOutput setActionCandidateId:](v5, "setActionCandidateId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[CAARSchemaCAARActionModelOutput setModelScore:](v5, "setModelScore:");
    }
    v9 = v5;

  }
  return v5;
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (void)setActionCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_actionCandidateId, a3);
}

- (float)modelScore
{
  return self->_modelScore;
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

@end
