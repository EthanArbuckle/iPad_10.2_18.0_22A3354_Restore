@implementation ORCHSchemaORCHIntelligenceFlowQuerySent

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
  v19.super_class = (Class)ORCHSchemaORCHIntelligenceFlowQuerySent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHIntelligenceFlowQuerySent deletePlannerQueryId](self, "deletePlannerQueryId");
  -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHIntelligenceFlowQuerySent deleteTrpId](self, "deleteTrpId");
  -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHIntelligenceFlowQuerySent deleteSubRequestId](self, "deleteSubRequestId");
  -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ORCHSchemaORCHIntelligenceFlowQuerySent deleteTraceId](self, "deleteTraceId");

  return v5;
}

- (BOOL)hasPlannerQueryId
{
  return self->_plannerQueryId != 0;
}

- (void)deletePlannerQueryId
{
  -[ORCHSchemaORCHIntelligenceFlowQuerySent setPlannerQueryId:](self, "setPlannerQueryId:", 0);
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[ORCHSchemaORCHIntelligenceFlowQuerySent setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[ORCHSchemaORCHIntelligenceFlowQuerySent setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
}

- (void)deleteTraceId
{
  -[ORCHSchemaORCHIntelligenceFlowQuerySent setTraceId:](self, "setTraceId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHIntelligenceFlowQuerySentReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
  -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plannerQueryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plannerQueryId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traceId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SISchemaUUID hash](self->_plannerQueryId, "hash");
  v4 = -[SISchemaUUID hash](self->_trpId, "hash") ^ v3;
  v5 = -[SISchemaUUID hash](self->_subRequestId, "hash");
  return v4 ^ v5 ^ -[SISchemaUUID hash](self->_traceId, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_plannerQueryId)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent plannerQueryId](self, "plannerQueryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("plannerQueryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("plannerQueryId"));

    }
  }
  if (self->_subRequestId)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent subRequestId](self, "subRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("subRequestId"));

    }
  }
  if (self->_traceId)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent traceId](self, "traceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("traceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("traceId"));

    }
  }
  if (self->_trpId)
  {
    -[ORCHSchemaORCHIntelligenceFlowQuerySent trpId](self, "trpId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("trpId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHIntelligenceFlowQuerySent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHIntelligenceFlowQuerySent)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHIntelligenceFlowQuerySent *v5;
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
    self = -[ORCHSchemaORCHIntelligenceFlowQuerySent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHIntelligenceFlowQuerySent)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHIntelligenceFlowQuerySent *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  SISchemaUUID *v13;
  ORCHSchemaORCHIntelligenceFlowQuerySent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHIntelligenceFlowQuerySent;
  v5 = -[ORCHSchemaORCHIntelligenceFlowQuerySent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerQueryId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHIntelligenceFlowQuerySent setPlannerQueryId:](v5, "setPlannerQueryId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHIntelligenceFlowQuerySent setTrpId:](v5, "setTrpId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[ORCHSchemaORCHIntelligenceFlowQuerySent setSubRequestId:](v5, "setSubRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traceId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[ORCHSchemaORCHIntelligenceFlowQuerySent setTraceId:](v5, "setTraceId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)plannerQueryId
{
  return self->_plannerQueryId;
}

- (void)setPlannerQueryId:(id)a3
{
  objc_storeStrong((id *)&self->_plannerQueryId, a3);
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (SISchemaUUID)traceId
{
  return self->_traceId;
}

- (void)setTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_traceId, a3);
}

- (void)setHasPlannerQueryId:(BOOL)a3
{
  self->_hasPlannerQueryId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setHasTraceId:(BOOL)a3
{
  self->_hasTraceId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_plannerQueryId, 0);
}

@end
