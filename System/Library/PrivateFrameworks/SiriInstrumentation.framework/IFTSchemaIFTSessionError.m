@implementation IFTSchemaIFTSessionError

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
  v19.super_class = (Class)IFTSchemaIFTSessionError;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTSessionError other](self, "other");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTSessionError deleteOther](self, "deleteOther");
  -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTSessionError deleteSessionCoordinatorError](self, "deleteSessionCoordinatorError");
  -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTSessionError deletePlannerError](self, "deletePlannerError");
  -[IFTSchemaIFTSessionError executorError](self, "executorError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTSessionError deleteExecutorError](self, "deleteExecutorError");

  return v5;
}

- (void)setOther:(id)a3
{
  IFTSchemaIFTIntelligenceFlowError *v4;
  IFTSchemaIFTSessionCoordinatorError *sessionCoordinatorError;
  IFTSchemaIFTPlannerError *plannerError;
  IFTSchemaIFTExecutorError *executorError;
  IFTSchemaIFTIntelligenceFlowError *other;

  v4 = (IFTSchemaIFTIntelligenceFlowError *)a3;
  sessionCoordinatorError = self->_sessionCoordinatorError;
  self->_sessionCoordinatorError = 0;

  plannerError = self->_plannerError;
  self->_plannerError = 0;

  executorError = self->_executorError;
  self->_executorError = 0;

  self->_whichOneof_Sessionerror = v4 != 0;
  other = self->_other;
  self->_other = v4;

}

- (IFTSchemaIFTIntelligenceFlowError)other
{
  if (self->_whichOneof_Sessionerror == 1)
    return self->_other;
  else
    return (IFTSchemaIFTIntelligenceFlowError *)0;
}

- (void)deleteOther
{
  IFTSchemaIFTIntelligenceFlowError *other;

  if (self->_whichOneof_Sessionerror == 1)
  {
    self->_whichOneof_Sessionerror = 0;
    other = self->_other;
    self->_other = 0;

  }
}

- (void)setSessionCoordinatorError:(id)a3
{
  IFTSchemaIFTSessionCoordinatorError *v4;
  IFTSchemaIFTIntelligenceFlowError *other;
  IFTSchemaIFTPlannerError *plannerError;
  IFTSchemaIFTExecutorError *executorError;
  IFTSchemaIFTSessionCoordinatorError *sessionCoordinatorError;

  v4 = (IFTSchemaIFTSessionCoordinatorError *)a3;
  other = self->_other;
  self->_other = 0;

  plannerError = self->_plannerError;
  self->_plannerError = 0;

  executorError = self->_executorError;
  self->_executorError = 0;

  self->_whichOneof_Sessionerror = 2 * (v4 != 0);
  sessionCoordinatorError = self->_sessionCoordinatorError;
  self->_sessionCoordinatorError = v4;

}

- (IFTSchemaIFTSessionCoordinatorError)sessionCoordinatorError
{
  if (self->_whichOneof_Sessionerror == 2)
    return self->_sessionCoordinatorError;
  else
    return (IFTSchemaIFTSessionCoordinatorError *)0;
}

- (void)deleteSessionCoordinatorError
{
  IFTSchemaIFTSessionCoordinatorError *sessionCoordinatorError;

  if (self->_whichOneof_Sessionerror == 2)
  {
    self->_whichOneof_Sessionerror = 0;
    sessionCoordinatorError = self->_sessionCoordinatorError;
    self->_sessionCoordinatorError = 0;

  }
}

- (void)setPlannerError:(id)a3
{
  IFTSchemaIFTPlannerError *v4;
  IFTSchemaIFTIntelligenceFlowError *other;
  IFTSchemaIFTSessionCoordinatorError *sessionCoordinatorError;
  IFTSchemaIFTExecutorError *executorError;
  unint64_t v8;
  IFTSchemaIFTPlannerError *plannerError;

  v4 = (IFTSchemaIFTPlannerError *)a3;
  other = self->_other;
  self->_other = 0;

  sessionCoordinatorError = self->_sessionCoordinatorError;
  self->_sessionCoordinatorError = 0;

  executorError = self->_executorError;
  self->_executorError = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichOneof_Sessionerror = v8;
  plannerError = self->_plannerError;
  self->_plannerError = v4;

}

- (IFTSchemaIFTPlannerError)plannerError
{
  if (self->_whichOneof_Sessionerror == 3)
    return self->_plannerError;
  else
    return (IFTSchemaIFTPlannerError *)0;
}

- (void)deletePlannerError
{
  IFTSchemaIFTPlannerError *plannerError;

  if (self->_whichOneof_Sessionerror == 3)
  {
    self->_whichOneof_Sessionerror = 0;
    plannerError = self->_plannerError;
    self->_plannerError = 0;

  }
}

- (void)setExecutorError:(id)a3
{
  IFTSchemaIFTExecutorError *v4;
  IFTSchemaIFTIntelligenceFlowError *other;
  IFTSchemaIFTSessionCoordinatorError *sessionCoordinatorError;
  IFTSchemaIFTPlannerError *plannerError;
  IFTSchemaIFTExecutorError *executorError;

  v4 = (IFTSchemaIFTExecutorError *)a3;
  other = self->_other;
  self->_other = 0;

  sessionCoordinatorError = self->_sessionCoordinatorError;
  self->_sessionCoordinatorError = 0;

  plannerError = self->_plannerError;
  self->_plannerError = 0;

  self->_whichOneof_Sessionerror = 4 * (v4 != 0);
  executorError = self->_executorError;
  self->_executorError = v4;

}

- (IFTSchemaIFTExecutorError)executorError
{
  if (self->_whichOneof_Sessionerror == 4)
    return self->_executorError;
  else
    return (IFTSchemaIFTExecutorError *)0;
}

- (void)deleteExecutorError
{
  IFTSchemaIFTExecutorError *executorError;

  if (self->_whichOneof_Sessionerror == 4)
  {
    self->_whichOneof_Sessionerror = 0;
    executorError = self->_executorError;
    self->_executorError = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSessionErrorReadFrom(self, (uint64_t)a3);
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
  -[IFTSchemaIFTSessionError other](self, "other");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTSessionError other](self, "other");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTSessionError executorError](self, "executorError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IFTSchemaIFTSessionError executorError](self, "executorError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Sessionerror;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichOneof_Sessionerror = self->_whichOneof_Sessionerror;
  if (whichOneof_Sessionerror != objc_msgSend(v4, "whichOneof_Sessionerror"))
    goto LABEL_23;
  -[IFTSchemaIFTSessionError other](self, "other");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "other");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[IFTSchemaIFTSessionError other](self, "other");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTSessionError other](self, "other");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "other");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionCoordinatorError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionCoordinatorError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plannerError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plannerError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[IFTSchemaIFTSessionError executorError](self, "executorError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executorError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTSessionError executorError](self, "executorError");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[IFTSchemaIFTSessionError executorError](self, "executorError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executorError");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[IFTSchemaIFTIntelligenceFlowError hash](self->_other, "hash");
  v4 = -[IFTSchemaIFTSessionCoordinatorError hash](self->_sessionCoordinatorError, "hash") ^ v3;
  v5 = -[IFTSchemaIFTPlannerError hash](self->_plannerError, "hash");
  return v4 ^ v5 ^ -[IFTSchemaIFTExecutorError hash](self->_executorError, "hash");
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
  if (self->_executorError)
  {
    -[IFTSchemaIFTSessionError executorError](self, "executorError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("executorError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("executorError"));

    }
  }
  if (self->_other)
  {
    -[IFTSchemaIFTSessionError other](self, "other");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("other"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("other"));

    }
  }
  if (self->_plannerError)
  {
    -[IFTSchemaIFTSessionError plannerError](self, "plannerError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("plannerError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("plannerError"));

    }
  }
  if (self->_sessionCoordinatorError)
  {
    -[IFTSchemaIFTSessionError sessionCoordinatorError](self, "sessionCoordinatorError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("sessionCoordinatorError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("sessionCoordinatorError"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTSessionError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTSessionError)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTSessionError *v5;
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
    self = -[IFTSchemaIFTSessionError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTSessionError)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTSessionError *v5;
  void *v6;
  IFTSchemaIFTIntelligenceFlowError *v7;
  void *v8;
  IFTSchemaIFTSessionCoordinatorError *v9;
  void *v10;
  IFTSchemaIFTPlannerError *v11;
  void *v12;
  IFTSchemaIFTExecutorError *v13;
  IFTSchemaIFTSessionError *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTSessionError;
  v5 = -[IFTSchemaIFTSessionError init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("other"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTIntelligenceFlowError initWithDictionary:]([IFTSchemaIFTIntelligenceFlowError alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTSessionError setOther:](v5, "setOther:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionCoordinatorError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTSessionCoordinatorError initWithDictionary:]([IFTSchemaIFTSessionCoordinatorError alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTSessionError setSessionCoordinatorError:](v5, "setSessionCoordinatorError:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerError"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTPlannerError initWithDictionary:]([IFTSchemaIFTPlannerError alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTSessionError setPlannerError:](v5, "setPlannerError:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executorError"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaIFTExecutorError initWithDictionary:]([IFTSchemaIFTExecutorError alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTSessionError setExecutorError:](v5, "setExecutorError:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Sessionerror
{
  return self->_whichOneof_Sessionerror;
}

- (BOOL)hasOther
{
  return self->_hasOther;
}

- (void)setHasOther:(BOOL)a3
{
  self->_hasOther = a3;
}

- (BOOL)hasSessionCoordinatorError
{
  return self->_hasSessionCoordinatorError;
}

- (void)setHasSessionCoordinatorError:(BOOL)a3
{
  self->_hasSessionCoordinatorError = a3;
}

- (BOOL)hasPlannerError
{
  return self->_hasPlannerError;
}

- (void)setHasPlannerError:(BOOL)a3
{
  self->_hasPlannerError = a3;
}

- (BOOL)hasExecutorError
{
  return self->_hasExecutorError;
}

- (void)setHasExecutorError:(BOOL)a3
{
  self->_hasExecutorError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorError, 0);
  objc_storeStrong((id *)&self->_plannerError, 0);
  objc_storeStrong((id *)&self->_sessionCoordinatorError, 0);
  objc_storeStrong((id *)&self->_other, 0);
}

@end
