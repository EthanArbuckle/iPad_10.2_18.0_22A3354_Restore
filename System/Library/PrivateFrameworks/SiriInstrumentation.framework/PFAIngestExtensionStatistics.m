@implementation PFAIngestExtensionStatistics

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteBundleId
{
  -[PFAIngestExtensionStatistics setBundleId:](self, "setBundleId:", 0);
}

- (void)setResult:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_result = a3;
}

- (BOOL)hasResult
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResult:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResult
{
  -[PFAIngestExtensionStatistics setResult:](self, "setResult:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMessageCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_messageCount = a3;
}

- (BOOL)hasMessageCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMessageCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMessageCount
{
  -[PFAIngestExtensionStatistics setMessageCount:](self, "setMessageCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMissingTimestampCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_missingTimestampCount = a3;
}

- (BOOL)hasMissingTimestampCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMissingTimestampCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMissingTimestampCount
{
  -[PFAIngestExtensionStatistics setMissingTimestampCount:](self, "setMissingTimestampCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PFAIngestExtensionStatisticsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[PFAIngestExtensionStatistics bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
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
  $09D4D067779015D36E77362799C41D3B has;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int messageCount;
  int v18;
  unsigned int missingTimestampCount;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[PFAIngestExtensionStatistics bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[PFAIngestExtensionStatistics bundleId](self, "bundleId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PFAIngestExtensionStatistics bundleId](self, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v15 = self->_result;
    if (v15 != objc_msgSend(v4, "result"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    messageCount = self->_messageCount;
    if (messageCount == objc_msgSend(v4, "messageCount"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    missingTimestampCount = self->_missingTimestampCount;
    if (missingTimestampCount != objc_msgSend(v4, "missingTimestampCount"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_result;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_messageCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_missingTimestampCount;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleId)
  {
    -[PFAIngestExtensionStatistics bundleId](self, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleId"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFAIngestExtensionStatistics missingTimestampCount](self, "missingTimestampCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("missingTimestampCount"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFAIngestExtensionStatistics messageCount](self, "messageCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("messageCount"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_8;
LABEL_5:
  if ((has & 1) == 0)
    goto LABEL_13;
LABEL_9:
  v9 = -[PFAIngestExtensionStatistics result](self, "result") - 1;
  if (v9 > 3)
    v10 = CFSTR("EXTENSIONRESULT_UNKNOWN");
  else
    v10 = off_1E563D8B0[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("result"));
LABEL_13:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAIngestExtensionStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAIngestExtensionStatistics)initWithJSON:(id)a3
{
  void *v4;
  PFAIngestExtensionStatistics *v5;
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
    self = -[PFAIngestExtensionStatistics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAIngestExtensionStatistics)initWithDictionary:(id)a3
{
  id v4;
  PFAIngestExtensionStatistics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PFAIngestExtensionStatistics *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFAIngestExtensionStatistics;
  v5 = -[PFAIngestExtensionStatistics init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PFAIngestExtensionStatistics setBundleId:](v5, "setBundleId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAIngestExtensionStatistics setResult:](v5, "setResult:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAIngestExtensionStatistics setMessageCount:](v5, "setMessageCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("missingTimestampCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAIngestExtensionStatistics setMissingTimestampCount:](v5, "setMissingTimestampCount:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)result
{
  return self->_result;
}

- (unsigned)messageCount
{
  return self->_messageCount;
}

- (unsigned)missingTimestampCount
{
  return self->_missingTimestampCount;
}

- (void)setHasBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
