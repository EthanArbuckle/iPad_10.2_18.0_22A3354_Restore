@implementation JRSchemaJRModelOutputs

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
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)JRSchemaJRModelOutputs;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaJRModelOutputs action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[JRSchemaJRModelOutputs deleteAction](self, "deleteAction");
  -[JRSchemaJRModelOutputs candidates](self, "candidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[JRSchemaJRModelOutputs deleteCandidates](self, "deleteCandidates");
  -[JRSchemaJRModelOutputs ranking](self, "ranking");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[JRSchemaJRModelOutputs deleteRanking](self, "deleteRanking");
  -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[JRSchemaJRModelOutputs deleteJrAnonymizedHistoryAndContext](self, "deleteJrAnonymizedHistoryAndContext");
  -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[JRSchemaJRModelOutputs deleteModelDiagnosticSignals](self, "deleteModelDiagnosticSignals");

  return v5;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (void)deleteAction
{
  -[JRSchemaJRModelOutputs setAction:](self, "setAction:", 0);
}

- (BOOL)hasCandidates
{
  return self->_candidates != 0;
}

- (void)deleteCandidates
{
  -[JRSchemaJRModelOutputs setCandidates:](self, "setCandidates:", 0);
}

- (BOOL)hasRanking
{
  return self->_ranking != 0;
}

- (void)deleteRanking
{
  -[JRSchemaJRModelOutputs setRanking:](self, "setRanking:", 0);
}

- (BOOL)hasJrAnonymizedHistoryAndContext
{
  return self->_jrAnonymizedHistoryAndContext != 0;
}

- (void)deleteJrAnonymizedHistoryAndContext
{
  -[JRSchemaJRModelOutputs setJrAnonymizedHistoryAndContext:](self, "setJrAnonymizedHistoryAndContext:", 0);
}

- (void)setDidJRForcePrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_didJRForcePrompt = a3;
}

- (BOOL)hasDidJRForcePrompt
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDidJRForcePrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDidJRForcePrompt
{
  -[JRSchemaJRModelOutputs setDidJRForcePrompt:](self, "setDidJRForcePrompt:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasModelDiagnosticSignals
{
  return self->_modelDiagnosticSignals != 0;
}

- (void)deleteModelDiagnosticSignals
{
  -[JRSchemaJRModelOutputs setModelDiagnosticSignals:](self, "setModelDiagnosticSignals:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRModelOutputsReadFrom(self, (uint64_t)a3);
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
  void *v14;
  id v15;

  v15 = a3;
  -[JRSchemaJRModelOutputs action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[JRSchemaJRModelOutputs action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRModelOutputs candidates](self, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JRSchemaJRModelOutputs candidates](self, "candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRModelOutputs ranking](self, "ranking");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[JRSchemaJRModelOutputs ranking](self, "ranking");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int didJRForcePrompt;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[JRSchemaJRModelOutputs action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[JRSchemaJRModelOutputs action](self, "action");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[JRSchemaJRModelOutputs action](self, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[JRSchemaJRModelOutputs candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[JRSchemaJRModelOutputs candidates](self, "candidates");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[JRSchemaJRModelOutputs candidates](self, "candidates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[JRSchemaJRModelOutputs ranking](self, "ranking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ranking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[JRSchemaJRModelOutputs ranking](self, "ranking");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[JRSchemaJRModelOutputs ranking](self, "ranking");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ranking");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jrAnonymizedHistoryAndContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jrAnonymizedHistoryAndContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    didJRForcePrompt = self->_didJRForcePrompt;
    if (didJRForcePrompt != objc_msgSend(v4, "didJRForcePrompt"))
      goto LABEL_30;
  }
  -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelDiagnosticSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelDiagnosticSignals");
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
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[JRSchemaJRAction hash](self->_action, "hash");
  v4 = -[JRSchemaJRActionCandidateTuple hash](self->_candidates, "hash");
  v5 = -[JRSchemaRanking hash](self->_ranking, "hash");
  v6 = -[JRSchemaJRAnonymizedHistoryAndContext hash](self->_jrAnonymizedHistoryAndContext, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_didJRForcePrompt;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[JRSchemaJRModelDiagnosticsSignals hash](self->_modelDiagnosticSignals, "hash");
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_action)
  {
    -[JRSchemaJRModelOutputs action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("action"));

    }
  }
  if (self->_candidates)
  {
    -[JRSchemaJRModelOutputs candidates](self, "candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("candidates"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("candidates"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[JRSchemaJRModelOutputs didJRForcePrompt](self, "didJRForcePrompt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("didJRForcePrompt"));

  }
  if (self->_jrAnonymizedHistoryAndContext)
  {
    -[JRSchemaJRModelOutputs jrAnonymizedHistoryAndContext](self, "jrAnonymizedHistoryAndContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("jrAnonymizedHistoryAndContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("jrAnonymizedHistoryAndContext"));

    }
  }
  if (self->_modelDiagnosticSignals)
  {
    -[JRSchemaJRModelOutputs modelDiagnosticSignals](self, "modelDiagnosticSignals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("modelDiagnosticSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("modelDiagnosticSignals"));

    }
  }
  if (self->_ranking)
  {
    -[JRSchemaJRModelOutputs ranking](self, "ranking");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ranking"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ranking"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaJRModelOutputs dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaJRModelOutputs)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaJRModelOutputs *v5;
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
    self = -[JRSchemaJRModelOutputs initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaJRModelOutputs)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaJRModelOutputs *v5;
  void *v6;
  JRSchemaJRAction *v7;
  void *v8;
  JRSchemaJRActionCandidateTuple *v9;
  void *v10;
  JRSchemaRanking *v11;
  void *v12;
  JRSchemaJRAnonymizedHistoryAndContext *v13;
  void *v14;
  void *v15;
  JRSchemaJRModelDiagnosticsSignals *v16;
  JRSchemaJRModelOutputs *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)JRSchemaJRModelOutputs;
  v5 = -[JRSchemaJRModelOutputs init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[JRSchemaJRAction initWithDictionary:]([JRSchemaJRAction alloc], "initWithDictionary:", v6);
      -[JRSchemaJRModelOutputs setAction:](v5, "setAction:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[JRSchemaJRActionCandidateTuple initWithDictionary:]([JRSchemaJRActionCandidateTuple alloc], "initWithDictionary:", v8);
      -[JRSchemaJRModelOutputs setCandidates:](v5, "setCandidates:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ranking"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[JRSchemaRanking initWithDictionary:]([JRSchemaRanking alloc], "initWithDictionary:", v10);
      -[JRSchemaJRModelOutputs setRanking:](v5, "setRanking:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jrAnonymizedHistoryAndContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[JRSchemaJRAnonymizedHistoryAndContext initWithDictionary:]([JRSchemaJRAnonymizedHistoryAndContext alloc], "initWithDictionary:", v12);
      -[JRSchemaJRModelOutputs setJrAnonymizedHistoryAndContext:](v5, "setJrAnonymizedHistoryAndContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didJRForcePrompt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[JRSchemaJRModelOutputs setDidJRForcePrompt:](v5, "setDidJRForcePrompt:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelDiagnosticSignals"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[JRSchemaJRModelDiagnosticsSignals initWithDictionary:]([JRSchemaJRModelDiagnosticsSignals alloc], "initWithDictionary:", v15);
      -[JRSchemaJRModelOutputs setModelDiagnosticSignals:](v5, "setModelDiagnosticSignals:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (JRSchemaJRAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (JRSchemaJRActionCandidateTuple)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (JRSchemaRanking)ranking
{
  return self->_ranking;
}

- (void)setRanking:(id)a3
{
  objc_storeStrong((id *)&self->_ranking, a3);
}

- (JRSchemaJRAnonymizedHistoryAndContext)jrAnonymizedHistoryAndContext
{
  return self->_jrAnonymizedHistoryAndContext;
}

- (void)setJrAnonymizedHistoryAndContext:(id)a3
{
  objc_storeStrong((id *)&self->_jrAnonymizedHistoryAndContext, a3);
}

- (BOOL)didJRForcePrompt
{
  return self->_didJRForcePrompt;
}

- (JRSchemaJRModelDiagnosticsSignals)modelDiagnosticSignals
{
  return self->_modelDiagnosticSignals;
}

- (void)setModelDiagnosticSignals:(id)a3
{
  objc_storeStrong((id *)&self->_modelDiagnosticSignals, a3);
}

- (void)setHasAction:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCandidates:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasRanking:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasJrAnonymizedHistoryAndContext:(BOOL)a3
{
  self->_hasAction = a3;
}

- (void)setHasModelDiagnosticSignals:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDiagnosticSignals, 0);
  objc_storeStrong((id *)&self->_jrAnonymizedHistoryAndContext, 0);
  objc_storeStrong((id *)&self->_ranking, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
