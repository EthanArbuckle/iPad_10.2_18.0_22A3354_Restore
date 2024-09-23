@implementation UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMobileAssetDownloadErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mobileAssetDownloadErrorCode = a3;
}

- (BOOL)hasMobileAssetDownloadErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMobileAssetDownloadErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMobileAssetDownloadErrorCode
{
  -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency setMobileAssetDownloadErrorCode:](self, "setMobileAssetDownloadErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTimesOccurred:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timesOccurred = a3;
}

- (BOOL)hasTimesOccurred
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTimesOccurred:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTimesOccurred
{
  -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency setTimesOccurred:](self, "setTimesOccurred:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFMobileAssetDownloadErrorCodeFrequencyReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $5F679CBEC03C2785C6C351C1025FF84A has;
  unsigned int v6;
  unsigned int mobileAssetDownloadErrorCode;
  int v8;
  unsigned int timesOccurred;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    mobileAssetDownloadErrorCode = self->_mobileAssetDownloadErrorCode;
    if (mobileAssetDownloadErrorCode != objc_msgSend(v4, "mobileAssetDownloadErrorCode"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    timesOccurred = self->_timesOccurred;
    if (timesOccurred != objc_msgSend(v4, "timesOccurred"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_mobileAssetDownloadErrorCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_timesOccurred;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency mobileAssetDownloadErrorCode](self, "mobileAssetDownloadErrorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mobileAssetDownloadErrorCode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency timesOccurred](self, "timesOccurred"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timesOccurred"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency *v5;
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
    self = -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency *v5;
  void *v6;
  void *v7;
  UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency;
  v5 = -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobileAssetDownloadErrorCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency setMobileAssetDownloadErrorCode:](v5, "setMobileAssetDownloadErrorCode:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timesOccurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFMobileAssetDownloadErrorCodeFrequency setTimesOccurred:](v5, "setTimesOccurred:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = v5;

  }
  return v5;
}

- (unsigned)mobileAssetDownloadErrorCode
{
  return self->_mobileAssetDownloadErrorCode;
}

- (unsigned)timesOccurred
{
  return self->_timesOccurred;
}

@end
