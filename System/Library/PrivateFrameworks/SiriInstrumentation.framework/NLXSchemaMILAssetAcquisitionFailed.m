@implementation NLXSchemaMILAssetAcquisitionFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAcquisitionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_acquisitionType = a3;
}

- (BOOL)hasAcquisitionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAcquisitionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAcquisitionType
{
  -[NLXSchemaMILAssetAcquisitionFailed setAcquisitionType:](self, "setAcquisitionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteErrorCode
{
  -[NLXSchemaMILAssetAcquisitionFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorMessage
{
  -[NLXSchemaMILAssetAcquisitionFailed setErrorMessage:](self, "setErrorMessage:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMILAssetAcquisitionFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[NLXSchemaMILAssetAcquisitionFailed errorMessage](self, "errorMessage");
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
  unsigned __int8 *v4;
  $E47D04E33ECD8651FFE07BDED7CBF157 has;
  unsigned int v6;
  int acquisitionType;
  int v8;
  int errorCode;
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
    acquisitionType = self->_acquisitionType;
    if (acquisitionType != objc_msgSend(v4, "acquisitionType"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (errorCode = self->_errorCode, errorCode == objc_msgSend(v4, "errorCode")))
    {
      -[NLXSchemaMILAssetAcquisitionFailed errorMessage](self, "errorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[NLXSchemaMILAssetAcquisitionFailed errorMessage](self, "errorMessage");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[NLXSchemaMILAssetAcquisitionFailed errorMessage](self, "errorMessage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "errorMessage");
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
    v2 = 2654435761 * self->_acquisitionType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_errorMessage, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ -[NSString hash](self->_errorMessage, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[NLXSchemaMILAssetAcquisitionFailed acquisitionType](self, "acquisitionType");
    v6 = CFSTR("MILASSETACQUISITIONTYPE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("MILASSETACQUISITIONTYPE_CACHE");
    if (v5 == 2)
      v7 = CFSTR("MILASSETACQUISITIONTYPE_RECOMPILE");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("acquisitionType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = -[NLXSchemaMILAssetAcquisitionFailed errorCode](self, "errorCode") - 1;
    if (v8 > 6)
      v9 = CFSTR("MILASSETACQUISITIONERRORCODE_UNKNOWN");
    else
      v9 = off_1E563B0B8[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("errorCode"));
  }
  if (self->_errorMessage)
  {
    -[NLXSchemaMILAssetAcquisitionFailed errorMessage](self, "errorMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("errorMessage"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaMILAssetAcquisitionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaMILAssetAcquisitionFailed)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaMILAssetAcquisitionFailed *v5;
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
    self = -[NLXSchemaMILAssetAcquisitionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaMILAssetAcquisitionFailed)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaMILAssetAcquisitionFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLXSchemaMILAssetAcquisitionFailed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaMILAssetAcquisitionFailed;
  v5 = -[NLXSchemaMILAssetAcquisitionFailed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acquisitionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaMILAssetAcquisitionFailed setAcquisitionType:](v5, "setAcquisitionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaMILAssetAcquisitionFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NLXSchemaMILAssetAcquisitionFailed setErrorMessage:](v5, "setErrorMessage:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)acquisitionType
{
  return self->_acquisitionType;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
