@implementation MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFirstBufferReceiptTimeOffsetInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_firstBufferReceiptTimeOffsetInNs = a3;
}

- (BOOL)hasFirstBufferReceiptTimeOffsetInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFirstBufferReceiptTimeOffsetInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFirstBufferReceiptTimeOffsetInNs
{
  -[MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt setFirstBufferReceiptTimeOffsetInNs:](self, "setFirstBufferReceiptTimeOffsetInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceiptReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t firstBufferReceiptTimeOffsetInNs;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (firstBufferReceiptTimeOffsetInNs = self->_firstBufferReceiptTimeOffsetInNs,
            firstBufferReceiptTimeOffsetInNs == objc_msgSend(v4, "firstBufferReceiptTimeOffsetInNs")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761u * self->_firstBufferReceiptTimeOffsetInNs;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt firstBufferReceiptTimeOffsetInNs](self, "firstBufferReceiptTimeOffsetInNs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("firstBufferReceiptTimeOffsetInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt *v5;
  void *v6;
  MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt;
  v5 = -[MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstBufferReceiptTimeOffsetInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordinFirstBufferReceipt setFirstBufferReceiptTimeOffsetInNs:](v5, "setFirstBufferReceiptTimeOffsetInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    v7 = v5;

  }
  return v5;
}

- (unint64_t)firstBufferReceiptTimeOffsetInNs
{
  return self->_firstBufferReceiptTimeOffsetInNs;
}

@end
