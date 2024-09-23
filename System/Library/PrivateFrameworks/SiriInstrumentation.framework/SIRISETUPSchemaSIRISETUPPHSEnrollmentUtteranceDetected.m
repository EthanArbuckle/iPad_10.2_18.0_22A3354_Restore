@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected

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
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected deleteAudioId](self, "deleteAudioId");
  return v5;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pageNumber = a3;
}

- (BOOL)hasPageNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePageNumber
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setPageNumber:](self, "setPageNumber:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAudioId
{
  return self->_audioId != 0;
}

- (void)deleteAudioId
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setAudioId:](self, "setAudioId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int pageNumber;
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
        || (pageNumber = self->_pageNumber, pageNumber == objc_msgSend(v4, "pageNumber")))
      {
        -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "audioId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "audioId");
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
    v2 = 2654435761 * self->_pageNumber;
  else
    v2 = 0;
  return -[SISchemaUUID hash](self->_audioId, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioId)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected audioId](self, "audioId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected pageNumber](self, "pageNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pageNumber"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *v5;
  void *v6;
  void *v7;
  SISchemaUUID *v8;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setPageNumber:](v5, "setPageNumber:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v7);
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setAudioId:](v5, "setAudioId:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (SISchemaUUID)audioId
{
  return self->_audioId;
}

- (void)setAudioId:(id)a3
{
  objc_storeStrong((id *)&self->_audioId, a3);
}

- (void)setHasAudioId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioId, 0);
}

@end
