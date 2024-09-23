@implementation CLPInstSchemaCLPNLv4SampleEvaluationStarted

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
  v9.super_class = (Class)CLPInstSchemaCLPNLv4SampleEvaluationStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[CLPInstSchemaCLPNLv4SampleEvaluationStarted deleteSyntheticRequestId](self, "deleteSyntheticRequestId");
  return v5;
}

- (void)setBatchNumChunks:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_batchNumChunks = a3;
}

- (BOOL)hasBatchNumChunks
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBatchNumChunks:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBatchNumChunks
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setBatchNumChunks:](self, "setBatchNumChunks:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setBatchChunkId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_batchChunkId = a3;
}

- (BOOL)hasBatchChunkId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasBatchChunkId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteBatchChunkId
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setBatchChunkId:](self, "setBatchChunkId:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasSyntheticRequestId
{
  return self->_syntheticRequestId != 0;
}

- (void)deleteSyntheticRequestId
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setSyntheticRequestId:](self, "setSyntheticRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4SampleEvaluationStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $194062262D93EA6A2D456AE6314F4529 has;
  unsigned int v6;
  unsigned int batchNumChunks;
  int v8;
  unsigned int batchChunkId;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    batchNumChunks = self->_batchNumChunks;
    if (batchNumChunks != objc_msgSend(v4, "batchNumChunks"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (batchChunkId = self->_batchChunkId, batchChunkId == objc_msgSend(v4, "batchChunkId")))
    {
      -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "syntheticRequestId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "syntheticRequestId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_batchNumChunks;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SISchemaUUID hash](self->_syntheticRequestId, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_batchChunkId;
  return v3 ^ v2 ^ -[SISchemaUUID hash](self->_syntheticRequestId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4SampleEvaluationStarted batchChunkId](self, "batchChunkId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("batchChunkId"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4SampleEvaluationStarted batchNumChunks](self, "batchNumChunks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("batchNumChunks"));

  }
  if (self->_syntheticRequestId)
  {
    -[CLPInstSchemaCLPNLv4SampleEvaluationStarted syntheticRequestId](self, "syntheticRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("syntheticRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("syntheticRequestId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPNLv4SampleEvaluationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPNLv4SampleEvaluationStarted)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationStarted *v5;
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
    self = -[CLPInstSchemaCLPNLv4SampleEvaluationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPNLv4SampleEvaluationStarted)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPNLv4SampleEvaluationStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  CLPInstSchemaCLPNLv4SampleEvaluationStarted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLPInstSchemaCLPNLv4SampleEvaluationStarted;
  v5 = -[CLPInstSchemaCLPNLv4SampleEvaluationStarted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchNumChunks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setBatchNumChunks:](v5, "setBatchNumChunks:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchChunkId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setBatchChunkId:](v5, "setBatchChunkId:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syntheticRequestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setSyntheticRequestId:](v5, "setSyntheticRequestId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unsigned)batchNumChunks
{
  return self->_batchNumChunks;
}

- (unsigned)batchChunkId
{
  return self->_batchChunkId;
}

- (SISchemaUUID)syntheticRequestId
{
  return self->_syntheticRequestId;
}

- (void)setSyntheticRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_syntheticRequestId, a3);
}

- (void)setHasSyntheticRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticRequestId, 0);
}

@end
