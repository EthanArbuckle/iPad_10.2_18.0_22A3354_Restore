@implementation PEGASUSSchemaPEGASUSEntityInfo

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
  v7.super_class = (Class)PEGASUSSchemaPEGASUSEntityInfo;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[PEGASUSSchemaPEGASUSEntityInfo deleteEntityId](self, "deleteEntityId");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[PEGASUSSchemaPEGASUSEntityInfo deleteEntityId](self, "deleteEntityId");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[PEGASUSSchemaPEGASUSEntityInfo deleteEntityId](self, "deleteEntityId");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[PEGASUSSchemaPEGASUSEntityInfo deleteEntityId](self, "deleteEntityId");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[PEGASUSSchemaPEGASUSEntityInfo deleteEntityId](self, "deleteEntityId");

  return v5;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (void)deleteEntityId
{
  -[PEGASUSSchemaPEGASUSEntityInfo setEntityId:](self, "setEntityId:", 0);
}

- (void)setConfidence:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteConfidence
{
  double v2;

  LODWORD(v2) = 0;
  -[PEGASUSSchemaPEGASUSEntityInfo setConfidence:](self, "setConfidence:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return PEGASUSSchemaPEGASUSEntityInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PEGASUSSchemaPEGASUSEntityInfo entityId](self, "entityId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
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
  float confidence;
  float v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[PEGASUSSchemaPEGASUSEntityInfo entityId](self, "entityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSEntityInfo entityId](self, "entityId");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[PEGASUSSchemaPEGASUSEntityInfo entityId](self, "entityId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entityId");
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
        || (confidence = self->_confidence, objc_msgSend(v4, "confidence"), confidence == v14))
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
  NSUInteger v3;
  unint64_t v4;
  float confidence;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_entityId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    confidence = self->_confidence;
    v6 = confidence;
    if (confidence < 0.0)
      v6 = -confidence;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[PEGASUSSchemaPEGASUSEntityInfo confidence](self, "confidence");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confidence"));

  }
  if (self->_entityId)
  {
    -[PEGASUSSchemaPEGASUSEntityInfo entityId](self, "entityId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSEntityInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSEntityInfo)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSEntityInfo *v5;
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
    self = -[PEGASUSSchemaPEGASUSEntityInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSEntityInfo)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSEntityInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  PEGASUSSchemaPEGASUSEntityInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEGASUSSchemaPEGASUSEntityInfo;
  v5 = -[PEGASUSSchemaPEGASUSEntityInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSEntityInfo setEntityId:](v5, "setEntityId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[PEGASUSSchemaPEGASUSEntityInfo setConfidence:](v5, "setConfidence:");
    }
    v9 = v5;

  }
  return v5;
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setHasEntityId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityId, 0);
}

@end
