@implementation IDENTITYSchemaIDENTITYResultCandidateReceived

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
  v9.super_class = (Class)IDENTITYSchemaIDENTITYResultCandidateReceived;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IDENTITYSchemaIDENTITYResultCandidateReceived deleteIdentityScoreCard](self, "deleteIdentityScoreCard");
  return v5;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteResultCandidateId
{
  -[IDENTITYSchemaIDENTITYResultCandidateReceived setResultCandidateId:](self, "setResultCandidateId:", 0);
}

- (void)setIsSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSelected = a3;
}

- (BOOL)hasIsSelected
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSelected
{
  -[IDENTITYSchemaIDENTITYResultCandidateReceived setIsSelected:](self, "setIsSelected:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasIdentityScoreCard
{
  return self->_identityScoreCard != 0;
}

- (void)deleteIdentityScoreCard
{
  -[IDENTITYSchemaIDENTITYResultCandidateReceived setIdentityScoreCard:](self, "setIdentityScoreCard:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYResultCandidateReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IDENTITYSchemaIDENTITYResultCandidateReceived resultCandidateId](self, "resultCandidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
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
  int isSelected;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[IDENTITYSchemaIDENTITYResultCandidateReceived resultCandidateId](self, "resultCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[IDENTITYSchemaIDENTITYResultCandidateReceived resultCandidateId](self, "resultCandidateId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IDENTITYSchemaIDENTITYResultCandidateReceived resultCandidateId](self, "resultCandidateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isSelected = self->_isSelected;
    if (isSelected != objc_msgSend(v4, "isSelected"))
      goto LABEL_15;
  }
  -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityScoreCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityScoreCard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_resultCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isSelected;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[IDENTITYSchemaIDENTITYIDScoreCard hash](self->_identityScoreCard, "hash");
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
  if (self->_identityScoreCard)
  {
    -[IDENTITYSchemaIDENTITYResultCandidateReceived identityScoreCard](self, "identityScoreCard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identityScoreCard"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identityScoreCard"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IDENTITYSchemaIDENTITYResultCandidateReceived isSelected](self, "isSelected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSelected"));

  }
  if (self->_resultCandidateId)
  {
    -[IDENTITYSchemaIDENTITYResultCandidateReceived resultCandidateId](self, "resultCandidateId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("resultCandidateId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IDENTITYSchemaIDENTITYResultCandidateReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IDENTITYSchemaIDENTITYResultCandidateReceived)initWithJSON:(id)a3
{
  void *v4;
  IDENTITYSchemaIDENTITYResultCandidateReceived *v5;
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
    self = -[IDENTITYSchemaIDENTITYResultCandidateReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IDENTITYSchemaIDENTITYResultCandidateReceived)initWithDictionary:(id)a3
{
  id v4;
  IDENTITYSchemaIDENTITYResultCandidateReceived *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IDENTITYSchemaIDENTITYIDScoreCard *v10;
  IDENTITYSchemaIDENTITYResultCandidateReceived *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDENTITYSchemaIDENTITYResultCandidateReceived;
  v5 = -[IDENTITYSchemaIDENTITYResultCandidateReceived init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[IDENTITYSchemaIDENTITYResultCandidateReceived setResultCandidateId:](v5, "setResultCandidateId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSelected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IDENTITYSchemaIDENTITYResultCandidateReceived setIsSelected:](v5, "setIsSelected:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identityScoreCard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[IDENTITYSchemaIDENTITYIDScoreCard initWithDictionary:]([IDENTITYSchemaIDENTITYIDScoreCard alloc], "initWithDictionary:", v9);
      -[IDENTITYSchemaIDENTITYResultCandidateReceived setIdentityScoreCard:](v5, "setIdentityScoreCard:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard
{
  return self->_identityScoreCard;
}

- (void)setIdentityScoreCard:(id)a3
{
  objc_storeStrong((id *)&self->_identityScoreCard, a3);
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasIdentityScoreCard:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityScoreCard, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
}

@end
