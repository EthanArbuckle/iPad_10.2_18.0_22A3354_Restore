@implementation MTSchemaMTBatchRequestStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumParagraphs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numParagraphs = a3;
}

- (BOOL)hasNumParagraphs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumParagraphs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumParagraphs
{
  -[MTSchemaMTBatchRequestStarted setNumParagraphs:](self, "setNumParagraphs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSequenceNumber
{
  return self->_sequenceNumber != 0;
}

- (void)deleteSequenceNumber
{
  -[MTSchemaMTBatchRequestStarted setSequenceNumber:](self, "setSequenceNumber:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTBatchRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[MTSchemaMTBatchRequestStarted sequenceNumber](self, "sequenceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int numParagraphs;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (numParagraphs = self->_numParagraphs, numParagraphs == objc_msgSend(v4, "numParagraphs")))
      {
        -[MTSchemaMTBatchRequestStarted sequenceNumber](self, "sequenceNumber");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sequenceNumber");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[MTSchemaMTBatchRequestStarted sequenceNumber](self, "sequenceNumber");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[MTSchemaMTBatchRequestStarted sequenceNumber](self, "sequenceNumber");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sequenceNumber");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_numParagraphs;
  else
    v2 = 0;
  return -[NSString hash](self->_sequenceNumber, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MTSchemaMTBatchRequestStarted numParagraphs](self, "numParagraphs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("numParagraphs"));

  }
  if (self->_sequenceNumber)
  {
    -[MTSchemaMTBatchRequestStarted sequenceNumber](self, "sequenceNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sequenceNumber"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTBatchRequestStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTBatchRequestStarted)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTBatchRequestStarted *v5;
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
    self = -[MTSchemaMTBatchRequestStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTBatchRequestStarted)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTBatchRequestStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  MTSchemaMTBatchRequestStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSchemaMTBatchRequestStarted;
  v5 = -[MTSchemaMTBatchRequestStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numParagraphs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTBatchRequestStarted setNumParagraphs:](v5, "setNumParagraphs:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[MTSchemaMTBatchRequestStarted setSequenceNumber:](v5, "setSequenceNumber:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (unsigned)numParagraphs
{
  return self->_numParagraphs;
}

- (NSString)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
}

@end
