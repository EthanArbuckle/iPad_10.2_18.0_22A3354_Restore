@implementation NLGSchemaNLGScoredDialogSelected

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
  v16.super_class = (Class)NLGSchemaNLGScoredDialogSelected;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLGSchemaNLGScoredDialogSelected deleteDialogScorer](self, "deleteDialogScorer");
  -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLGSchemaNLGScoredDialogSelected deleteDialogCandidateStatistics](self, "deleteDialogCandidateStatistics");
  -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLGSchemaNLGScoredDialogSelected deleteSelectedScoredDialog](self, "deleteSelectedScoredDialog");

  return v5;
}

- (BOOL)hasDialogScorer
{
  return self->_dialogScorer != 0;
}

- (void)deleteDialogScorer
{
  -[NLGSchemaNLGScoredDialogSelected setDialogScorer:](self, "setDialogScorer:", 0);
}

- (BOOL)hasDialogCandidateStatistics
{
  return self->_dialogCandidateStatistics != 0;
}

- (void)deleteDialogCandidateStatistics
{
  -[NLGSchemaNLGScoredDialogSelected setDialogCandidateStatistics:](self, "setDialogCandidateStatistics:", 0);
}

- (BOOL)hasSelectedScoredDialog
{
  return self->_selectedScoredDialog != 0;
}

- (void)deleteSelectedScoredDialog
{
  -[NLGSchemaNLGScoredDialogSelected setSelectedScoredDialog:](self, "setSelectedScoredDialog:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLGSchemaNLGScoredDialogSelectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogScorer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogScorer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogCandidateStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogCandidateStatistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedScoredDialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedScoredDialog");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[NLGSchemaNLGDialogScorer hash](self->_dialogScorer, "hash");
  v4 = -[NLGSchemaNLGDialogCandidateStatistics hash](self->_dialogCandidateStatistics, "hash") ^ v3;
  return v4 ^ -[NLGSchemaNLGScoredDialog hash](self->_selectedScoredDialog, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dialogCandidateStatistics)
  {
    -[NLGSchemaNLGScoredDialogSelected dialogCandidateStatistics](self, "dialogCandidateStatistics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dialogCandidateStatistics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dialogCandidateStatistics"));

    }
  }
  if (self->_dialogScorer)
  {
    -[NLGSchemaNLGScoredDialogSelected dialogScorer](self, "dialogScorer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dialogScorer"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dialogScorer"));

    }
  }
  if (self->_selectedScoredDialog)
  {
    -[NLGSchemaNLGScoredDialogSelected selectedScoredDialog](self, "selectedScoredDialog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("selectedScoredDialog"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("selectedScoredDialog"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLGSchemaNLGScoredDialogSelected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLGSchemaNLGScoredDialogSelected)initWithJSON:(id)a3
{
  void *v4;
  NLGSchemaNLGScoredDialogSelected *v5;
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
    self = -[NLGSchemaNLGScoredDialogSelected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLGSchemaNLGScoredDialogSelected)initWithDictionary:(id)a3
{
  id v4;
  NLGSchemaNLGScoredDialogSelected *v5;
  void *v6;
  NLGSchemaNLGDialogScorer *v7;
  void *v8;
  NLGSchemaNLGDialogCandidateStatistics *v9;
  void *v10;
  NLGSchemaNLGScoredDialog *v11;
  NLGSchemaNLGScoredDialogSelected *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLGSchemaNLGScoredDialogSelected;
  v5 = -[NLGSchemaNLGScoredDialogSelected init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogScorer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLGSchemaNLGDialogScorer initWithDictionary:]([NLGSchemaNLGDialogScorer alloc], "initWithDictionary:", v6);
      -[NLGSchemaNLGScoredDialogSelected setDialogScorer:](v5, "setDialogScorer:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogCandidateStatistics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NLGSchemaNLGDialogCandidateStatistics initWithDictionary:]([NLGSchemaNLGDialogCandidateStatistics alloc], "initWithDictionary:", v8);
      -[NLGSchemaNLGScoredDialogSelected setDialogCandidateStatistics:](v5, "setDialogCandidateStatistics:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedScoredDialog"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLGSchemaNLGScoredDialog initWithDictionary:]([NLGSchemaNLGScoredDialog alloc], "initWithDictionary:", v10);
      -[NLGSchemaNLGScoredDialogSelected setSelectedScoredDialog:](v5, "setSelectedScoredDialog:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NLGSchemaNLGDialogScorer)dialogScorer
{
  return self->_dialogScorer;
}

- (void)setDialogScorer:(id)a3
{
  objc_storeStrong((id *)&self->_dialogScorer, a3);
}

- (NLGSchemaNLGDialogCandidateStatistics)dialogCandidateStatistics
{
  return self->_dialogCandidateStatistics;
}

- (void)setDialogCandidateStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_dialogCandidateStatistics, a3);
}

- (NLGSchemaNLGScoredDialog)selectedScoredDialog
{
  return self->_selectedScoredDialog;
}

- (void)setSelectedScoredDialog:(id)a3
{
  objc_storeStrong((id *)&self->_selectedScoredDialog, a3);
}

- (void)setHasDialogScorer:(BOOL)a3
{
  self->_hasDialogScorer = a3;
}

- (void)setHasDialogCandidateStatistics:(BOOL)a3
{
  self->_hasDialogCandidateStatistics = a3;
}

- (void)setHasSelectedScoredDialog:(BOOL)a3
{
  self->_hasSelectedScoredDialog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedScoredDialog, 0);
  objc_storeStrong((id *)&self->_dialogCandidateStatistics, 0);
  objc_storeStrong((id *)&self->_dialogScorer, 0);
}

@end
