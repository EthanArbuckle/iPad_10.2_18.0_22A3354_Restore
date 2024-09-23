@implementation INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals

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
  v9.super_class = (Class)INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals deleteCommonIndependent](self, "deleteCommonIndependent");
  return v5;
}

- (BOOL)hasCommonIndependent
{
  return self->_commonIndependent != 0;
}

- (void)deleteCommonIndependent
{
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setCommonIndependent:](self, "setCommonIndependent:", 0);
}

- (void)setIsNotebookTitlePresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) |= 1u;
  self->_isNotebookTitlePresent = a3;
}

- (BOOL)hasIsNotebookTitlePresent
{
  return *(&self->_isNotebookGroupPresent + 1);
}

- (void)setHasIsNotebookTitlePresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) = *(&self->_isNotebookGroupPresent + 1) & 0xFE | a3;
}

- (void)deleteIsNotebookTitlePresent
{
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookTitlePresent:](self, "setIsNotebookTitlePresent:", 0);
  *(&self->_isNotebookGroupPresent + 1) &= ~1u;
}

- (void)setIsNotebookPayloadPresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) |= 2u;
  self->_isNotebookPayloadPresent = a3;
}

- (BOOL)hasIsNotebookPayloadPresent
{
  return (*((unsigned __int8 *)&self->_isNotebookGroupPresent + 1) >> 1) & 1;
}

- (void)setHasIsNotebookPayloadPresent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isNotebookGroupPresent + 1) = *(&self->_isNotebookGroupPresent + 1) & 0xFD | v3;
}

- (void)deleteIsNotebookPayloadPresent
{
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookPayloadPresent:](self, "setIsNotebookPayloadPresent:", 0);
  *(&self->_isNotebookGroupPresent + 1) &= ~2u;
}

- (void)setIsNotebookGroupPresent:(BOOL)a3
{
  *(&self->_isNotebookGroupPresent + 1) |= 4u;
  self->_isNotebookGroupPresent = a3;
}

- (BOOL)hasIsNotebookGroupPresent
{
  return (*((unsigned __int8 *)&self->_isNotebookGroupPresent + 1) >> 2) & 1;
}

- (void)setHasIsNotebookGroupPresent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isNotebookGroupPresent + 1) = *(&self->_isNotebookGroupPresent + 1) & 0xFB | v3;
}

- (void)deleteIsNotebookGroupPresent
{
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookGroupPresent:](self, "setIsNotebookGroupPresent:", 0);
  *(&self->_isNotebookGroupPresent + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v6 = *(&self->_isNotebookGroupPresent + 1);
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = *(&self->_isNotebookGroupPresent + 1);
  }
  v7 = v8;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = v8;
    v6 = *(&self->_isNotebookGroupPresent + 1);
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int isNotebookTitlePresent;
  int v16;
  int isNotebookPayloadPresent;
  int v18;
  int isNotebookGroupPresent;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonIndependent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonIndependent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isNotebookGroupPresent + 1);
  v14 = v4[19];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((v13 & 1) != 0)
  {
    isNotebookTitlePresent = self->_isNotebookTitlePresent;
    if (isNotebookTitlePresent != objc_msgSend(v4, "isNotebookTitlePresent"))
      goto LABEL_20;
    v13 = *((unsigned __int8 *)&self->_isNotebookGroupPresent + 1);
    v14 = v4[19];
  }
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    isNotebookPayloadPresent = self->_isNotebookPayloadPresent;
    if (isNotebookPayloadPresent == objc_msgSend(v4, "isNotebookPayloadPresent"))
    {
      v13 = *((unsigned __int8 *)&self->_isNotebookGroupPresent + 1);
      v14 = v4[19];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    isNotebookGroupPresent = self->_isNotebookGroupPresent;
    if (isNotebookGroupPresent != objc_msgSend(v4, "isNotebookGroupPresent"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[INFERENCESchemaINFERENCECommonAppIndependentSignals hash](self->_commonIndependent, "hash");
  if (!*(&self->_isNotebookGroupPresent + 1))
  {
    v4 = 0;
    if ((*(&self->_isNotebookGroupPresent + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(&self->_isNotebookGroupPresent + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_isNotebookTitlePresent;
  if ((*(&self->_isNotebookGroupPresent + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_isNotebookPayloadPresent;
  if ((*(&self->_isNotebookGroupPresent + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_isNotebookGroupPresent;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_commonIndependent)
  {
    -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commonIndependent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commonIndependent"));

    }
  }
  v7 = *(&self->_isNotebookGroupPresent + 1);
  if ((v7 & 4) == 0)
  {
    if ((*(&self->_isNotebookGroupPresent + 1) & 2) == 0)
      goto LABEL_8;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals isNotebookPayloadPresent](self, "isNotebookPayloadPresent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isNotebookPayloadPresent"));

    if (!*(&self->_isNotebookGroupPresent + 1))
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals isNotebookGroupPresent](self, "isNotebookGroupPresent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isNotebookGroupPresent"));

  v7 = *(&self->_isNotebookGroupPresent + 1);
  if ((v7 & 2) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v7 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals isNotebookTitlePresent](self, "isNotebookTitlePresent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isNotebookTitlePresent"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *v5;
  void *v6;
  INFERENCESchemaINFERENCECommonAppIndependentSignals *v7;
  void *v8;
  void *v9;
  void *v10;
  INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals;
  v5 = -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonIndependent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCECommonAppIndependentSignals initWithDictionary:]([INFERENCESchemaINFERENCECommonAppIndependentSignals alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setCommonIndependent:](v5, "setCommonIndependent:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNotebookTitlePresent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookTitlePresent:](v5, "setIsNotebookTitlePresent:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNotebookPayloadPresent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookPayloadPresent:](v5, "setIsNotebookPayloadPresent:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNotebookGroupPresent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCENotebookAppSelectionTrainingIndependentSignals setIsNotebookGroupPresent:](v5, "setIsNotebookGroupPresent:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)commonIndependent
{
  return self->_commonIndependent;
}

- (void)setCommonIndependent:(id)a3
{
  objc_storeStrong((id *)&self->_commonIndependent, a3);
}

- (BOOL)isNotebookTitlePresent
{
  return self->_isNotebookTitlePresent;
}

- (BOOL)isNotebookPayloadPresent
{
  return self->_isNotebookPayloadPresent;
}

- (BOOL)isNotebookGroupPresent
{
  return self->_isNotebookGroupPresent;
}

- (void)setHasCommonIndependent:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonIndependent, 0);
}

@end
