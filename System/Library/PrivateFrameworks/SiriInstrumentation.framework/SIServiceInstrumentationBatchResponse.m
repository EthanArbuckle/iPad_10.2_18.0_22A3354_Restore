@implementation SIServiceInstrumentationBatchResponse

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasBatch_id
{
  return self->_batch_id != 0;
}

- (void)deleteBatch_id
{
  -[SIServiceInstrumentationBatchResponse setBatch_id:](self, "setBatch_id:", 0);
}

- (void)setStatus_code:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status_code = a3;
}

- (BOOL)hasStatus_code
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStatus_code:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStatus_code
{
  -[SIServiceInstrumentationBatchResponse setStatus_code:](self, "setStatus_code:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)deleteMessage
{
  -[SIServiceInstrumentationBatchResponse setMessage:](self, "setMessage:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceInstrumentationBatchResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SIServiceInstrumentationBatchResponse batch_id](self, "batch_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SIServiceInstrumentationBatchResponse message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
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
  int status_code;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[SIServiceInstrumentationBatchResponse batch_id](self, "batch_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batch_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[SIServiceInstrumentationBatchResponse batch_id](self, "batch_id");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SIServiceInstrumentationBatchResponse batch_id](self, "batch_id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batch_id");
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
    status_code = self->_status_code;
    if (status_code != objc_msgSend(v4, "status_code"))
      goto LABEL_15;
  }
  -[SIServiceInstrumentationBatchResponse message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SIServiceInstrumentationBatchResponse message](self, "message");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SIServiceInstrumentationBatchResponse message](self, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "message");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_batch_id, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_status_code;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_message, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_batch_id)
  {
    -[SIServiceInstrumentationBatchResponse batch_id](self, "batch_id");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("batchId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("batchId"));

    }
  }
  if (self->_message)
  {
    -[SIServiceInstrumentationBatchResponse message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("message"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if (-[SIServiceInstrumentationBatchResponse status_code](self, "status_code") == 1)
      v9 = CFSTR("FAILURE");
    else
      v9 = CFSTR("SUCCESS");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("statusCode"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIServiceInstrumentationBatchResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIServiceInstrumentationBatchResponse)initWithJSON:(id)a3
{
  void *v4;
  SIServiceInstrumentationBatchResponse *v5;
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
    self = -[SIServiceInstrumentationBatchResponse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIServiceInstrumentationBatchResponse)initWithDictionary:(id)a3
{
  id v4;
  SIServiceInstrumentationBatchResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SIServiceInstrumentationBatchResponse *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIServiceInstrumentationBatchResponse;
  v5 = -[SIServiceInstrumentationBatchResponse init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[SIServiceInstrumentationBatchResponse setBatch_id:](v5, "setBatch_id:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statusCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIServiceInstrumentationBatchResponse setStatus_code:](v5, "setStatus_code:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SIServiceInstrumentationBatchResponse setMessage:](v5, "setMessage:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSData)batch_id
{
  return self->_batch_id;
}

- (void)setBatch_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)status_code
{
  return self->_status_code;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasBatch_id:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMessage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_batch_id, 0);
}

@end
