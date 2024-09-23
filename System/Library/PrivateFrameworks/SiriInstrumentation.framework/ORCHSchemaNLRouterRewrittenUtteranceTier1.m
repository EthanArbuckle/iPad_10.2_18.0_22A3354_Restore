@implementation ORCHSchemaNLRouterRewrittenUtteranceTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaNLRouterRewrittenUtteranceTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 deleteUtteranceText](self, "deleteUtteranceText");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 deleteUtteranceText](self, "deleteUtteranceText");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 deleteUtteranceText](self, "deleteUtteranceText");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 deleteUtteranceText](self, "deleteUtteranceText");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 deleteUtteranceText](self, "deleteUtteranceText");
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)hasUtteranceText
{
  return self->_utteranceText != 0;
}

- (void)deleteUtteranceText
{
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setUtteranceText:](self, "setUtteranceText:", 0);
}

- (void)setUtteranceIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_utteranceIndex = a3;
}

- (BOOL)hasUtteranceIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUtteranceIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteUtteranceIndex
{
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setUtteranceIndex:](self, "setUtteranceIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaNLRouterRewrittenUtteranceTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceText](self, "utteranceText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int utteranceIndex;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceText](self, "utteranceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utteranceText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceText](self, "utteranceText");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceText](self, "utteranceText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utteranceText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (utteranceIndex = self->_utteranceIndex, utteranceIndex == objc_msgSend(v4, "utteranceIndex")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_subRequestId, "hash");
  v4 = -[NSString hash](self->_utteranceText, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_utteranceIndex;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_subRequestId)
  {
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 subRequestId](self, "subRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("subRequestId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceIndex](self, "utteranceIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("utteranceIndex"));

  }
  if (self->_utteranceText)
  {
    -[ORCHSchemaNLRouterRewrittenUtteranceTier1 utteranceText](self, "utteranceText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("utteranceText"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaNLRouterRewrittenUtteranceTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaNLRouterRewrittenUtteranceTier1)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *v5;
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
    self = -[ORCHSchemaNLRouterRewrittenUtteranceTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaNLRouterRewrittenUtteranceTier1)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaNLRouterRewrittenUtteranceTier1;
  v5 = -[ORCHSchemaNLRouterRewrittenUtteranceTier1 init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setSubRequestId:](v5, "setSubRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setUtteranceText:](v5, "setUtteranceText:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaNLRouterRewrittenUtteranceTier1 setUtteranceIndex:](v5, "setUtteranceIndex:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setUtteranceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)utteranceIndex
{
  return self->_utteranceIndex;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUtteranceText:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceText, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
}

@end
