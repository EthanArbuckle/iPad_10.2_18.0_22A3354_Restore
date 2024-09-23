@implementation SISchemaUUFRSaid

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRSaid;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[SISchemaUUFRSaid deleteDialogIdentifier](self, "deleteDialogIdentifier");
  -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUUFRSaid deleteSiriResponseContext](self, "deleteSiriResponseContext");
  -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaUUFRSaid deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (BOOL)hasDialogIdentifier
{
  return self->_dialogIdentifier != 0;
}

- (void)deleteDialogIdentifier
{
  -[SISchemaUUFRSaid setDialogIdentifier:](self, "setDialogIdentifier:", 0);
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
}

- (void)deleteSiriResponseContext
{
  -[SISchemaUUFRSaid setSiriResponseContext:](self, "setSiriResponseContext:", 0);
}

- (BOOL)hasAceViewID
{
  return self->_aceViewID != 0;
}

- (void)deleteAceViewID
{
  -[SISchemaUUFRSaid setAceViewID:](self, "setAceViewID:", 0);
}

- (BOOL)hasAceViewClass
{
  return self->_aceViewClass != 0;
}

- (void)deleteAceViewClass
{
  -[SISchemaUUFRSaid setAceViewClass:](self, "setAceViewClass:", 0);
}

- (void)setSonicResponse:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sonicResponse = a3;
}

- (BOOL)hasSonicResponse
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSonicResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSonicResponse
{
  -[SISchemaUUFRSaid setSonicResponse:](self, "setSonicResponse:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResponseCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_responseCategory = a3;
}

- (BOOL)hasResponseCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResponseCategory
{
  -[SISchemaUUFRSaid setResponseCategory:](self, "setResponseCategory:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[SISchemaUUFRSaid setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRSaidReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SISchemaUUFRSaid dialogIdentifier](self, "dialogIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUUFRSaid aceViewID](self, "aceViewID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[SISchemaUUFRSaid aceViewClass](self, "aceViewClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  $9311C121FD5B727C6808945B96CF5D73 has;
  unsigned int v28;
  int sonicResponse;
  int v30;
  int responseCategory;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[SISchemaUUFRSaid dialogIdentifier](self, "dialogIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaUUFRSaid dialogIdentifier](self, "dialogIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaUUFRSaid dialogIdentifier](self, "dialogIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriResponseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriResponseContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  -[SISchemaUUFRSaid aceViewID](self, "aceViewID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceViewID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaUUFRSaid aceViewID](self, "aceViewID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaUUFRSaid aceViewID](self, "aceViewID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_34;
  }
  else
  {

  }
  -[SISchemaUUFRSaid aceViewClass](self, "aceViewClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceViewClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaUUFRSaid aceViewClass](self, "aceViewClass");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SISchemaUUFRSaid aceViewClass](self, "aceViewClass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_34;
  }
  else
  {

  }
  has = self->_has;
  v28 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v28 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sonicResponse = self->_sonicResponse;
    if (sonicResponse != objc_msgSend(v4, "sonicResponse"))
      goto LABEL_34;
    has = self->_has;
    v28 = v4[56];
  }
  v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1))
    goto LABEL_34;
  if (v30)
  {
    responseCategory = self->_responseCategory;
    if (responseCategory != objc_msgSend(v4, "responseCategory"))
      goto LABEL_34;
  }
  -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_37:
    v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_37;
LABEL_34:
  v37 = 0;
LABEL_35:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_dialogIdentifier, "hash");
  v4 = -[SISchemaSiriResponseContext hash](self->_siriResponseContext, "hash");
  v5 = -[NSString hash](self->_aceViewID, "hash");
  v6 = -[NSString hash](self->_aceViewClass, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_sonicResponse;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_responseCategory;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
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
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceViewClass)
  {
    -[SISchemaUUFRSaid aceViewClass](self, "aceViewClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceViewClass"));

  }
  if (self->_aceViewID)
  {
    -[SISchemaUUFRSaid aceViewID](self, "aceViewID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aceViewID"));

  }
  if (self->_dialogIdentifier)
  {
    -[SISchemaUUFRSaid dialogIdentifier](self, "dialogIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dialogIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = -[SISchemaUUFRSaid responseCategory](self, "responseCategory") - 1;
    if (v10 > 0xC)
      v11 = CFSTR("RESPONSECATEGORY_UNKNOWN");
    else
      v11 = off_1E56378D8[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("responseCategory"));
  }
  if (self->_siriResponseContext)
  {
    -[SISchemaUUFRSaid siriResponseContext](self, "siriResponseContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("siriResponseContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("siriResponseContext"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = -[SISchemaUUFRSaid sonicResponse](self, "sonicResponse") - 1;
    if (v15 > 3)
      v16 = CFSTR("UEISONICRESPONSE_UNKNOWN");
    else
      v16 = off_1E5637940[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("sonicResponse"));
  }
  if (self->_subRequestId)
  {
    -[SISchemaUUFRSaid subRequestId](self, "subRequestId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("subRequestId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUUFRSaid dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUUFRSaid)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUUFRSaid *v5;
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
    self = -[SISchemaUUFRSaid initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUUFRSaid)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUUFRSaid *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaSiriResponseContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SISchemaUUID *v17;
  SISchemaUUFRSaid *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaUUFRSaid;
  v5 = -[SISchemaUUFRSaid init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaUUFRSaid setDialogIdentifier:](v5, "setDialogIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriResponseContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaSiriResponseContext initWithDictionary:]([SISchemaSiriResponseContext alloc], "initWithDictionary:", v8);
      -[SISchemaUUFRSaid setSiriResponseContext:](v5, "setSiriResponseContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaUUFRSaid setAceViewID:](v5, "setAceViewID:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[SISchemaUUFRSaid setAceViewClass:](v5, "setAceViewClass:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sonicResponse"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRSaid setSonicResponse:](v5, "setSonicResponse:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseCategory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRSaid setResponseCategory:](v5, "setResponseCategory:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[SISchemaUUFRSaid setSubRequestId:](v5, "setSubRequestId:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (void)setDialogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (void)setSiriResponseContext:(id)a3
{
  objc_storeStrong((id *)&self->_siriResponseContext, a3);
}

- (NSString)aceViewID
{
  return self->_aceViewID;
}

- (void)setAceViewID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)aceViewClass
{
  return self->_aceViewClass;
}

- (void)setAceViewClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)sonicResponse
{
  return self->_sonicResponse;
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (void)setHasDialogIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAceViewID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasAceViewClass:(BOOL)a3
{
  self->_hasDialogIdentifier = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSiriResponseContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_aceViewClass, 0);
  objc_storeStrong((id *)&self->_aceViewID, 0);
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
}

@end
