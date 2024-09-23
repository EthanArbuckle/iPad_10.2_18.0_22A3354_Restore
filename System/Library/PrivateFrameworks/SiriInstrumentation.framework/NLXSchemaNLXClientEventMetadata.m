@implementation NLXSchemaNLXClientEventMetadata

- (BOOL)hasNlId
{
  return self->_nlId != 0;
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEventMetadata resultCandidateId](self, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }

}

- (SISchemaUUID)nlId
{
  return self->_nlId;
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setNlId:(id)a3
{
  objc_storeStrong((id *)&self->_nlId, a3);
}

- (void)setComponentInvocationSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_componentInvocationSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_nlId, 0);
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NLXSchemaNLXClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaNLXClientEventMetadata deleteNlId](self, "deleteNlId");
  -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaNLXClientEventMetadata deleteRequestId](self, "deleteRequestId");
  -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaNLXClientEventMetadata deleteTrpId](self, "deleteTrpId");
  -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLXSchemaNLXClientEventMetadata deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (void)deleteNlId
{
  -[NLXSchemaNLXClientEventMetadata setNlId:](self, "setNlId:", 0);
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteResultCandidateId
{
  -[NLXSchemaNLXClientEventMetadata setResultCandidateId:](self, "setResultCandidateId:", 0);
}

- (BOOL)hasComponentInvocationSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasComponentInvocationSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteComponentInvocationSource
{
  -[NLXSchemaNLXClientEventMetadata setComponentInvocationSource:](self, "setComponentInvocationSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[NLXSchemaNLXClientEventMetadata setRequestId:](self, "setRequestId:", 0);
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[NLXSchemaNLXClientEventMetadata setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[NLXSchemaNLXClientEventMetadata setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXClientEventMetadataReadFrom(self, (uint64_t)a3);
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
  int componentInvocationSource;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEventMetadata resultCandidateId](self, "resultCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[NLXSchemaNLXClientEventMetadata resultCandidateId](self, "resultCandidateId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaNLXClientEventMetadata resultCandidateId](self, "resultCandidateId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    componentInvocationSource = self->_componentInvocationSource;
    if (componentInvocationSource != objc_msgSend(v4, "componentInvocationSource"))
      goto LABEL_30;
  }
  -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_30;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[SISchemaUUID hash](self->_nlId, "hash");
  v4 = -[NSString hash](self->_resultCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_componentInvocationSource;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_requestId, "hash");
  v7 = -[SISchemaUUID hash](self->_trpId, "hash");
  return v6 ^ v7 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[NLXSchemaNLXClientEventMetadata componentInvocationSource](self, "componentInvocationSource") - 1;
    if (v4 > 6)
      v5 = CFSTR("COMPONENTINVOCATIONSOURCE_UNKNOWN");
    else
      v5 = off_1E5632318[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("componentInvocationSource"));
  }
  if (self->_nlId)
  {
    -[NLXSchemaNLXClientEventMetadata nlId](self, "nlId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("nlId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nlId"));

    }
  }
  if (self->_requestId)
  {
    -[NLXSchemaNLXClientEventMetadata requestId](self, "requestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("requestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requestId"));

    }
  }
  if (self->_resultCandidateId)
  {
    -[NLXSchemaNLXClientEventMetadata resultCandidateId](self, "resultCandidateId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("resultCandidateId"));

  }
  if (self->_subRequestId)
  {
    -[NLXSchemaNLXClientEventMetadata subRequestId](self, "subRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("subRequestId"));

    }
  }
  if (self->_trpId)
  {
    -[NLXSchemaNLXClientEventMetadata trpId](self, "trpId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("trpId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaNLXClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaNLXClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaNLXClientEventMetadata *v5;
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
    self = -[NLXSchemaNLXClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaNLXClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaNLXClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  void *v13;
  SISchemaUUID *v14;
  void *v15;
  SISchemaUUID *v16;
  NLXSchemaNLXClientEventMetadata *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NLXSchemaNLXClientEventMetadata;
  v5 = -[NLXSchemaNLXClientEventMetadata init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLXSchemaNLXClientEventMetadata setNlId:](v5, "setNlId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NLXSchemaNLXClientEventMetadata setResultCandidateId:](v5, "setResultCandidateId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentInvocationSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaNLXClientEventMetadata setComponentInvocationSource:](v5, "setComponentInvocationSource:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[NLXSchemaNLXClientEventMetadata setRequestId:](v5, "setRequestId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v13);
      -[NLXSchemaNLXClientEventMetadata setTrpId:](v5, "setTrpId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[NLXSchemaNLXClientEventMetadata setSubRequestId:](v5, "setSubRequestId:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (int)componentInvocationSource
{
  return self->_componentInvocationSource;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (void)setHasNlId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasNlId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

@end
