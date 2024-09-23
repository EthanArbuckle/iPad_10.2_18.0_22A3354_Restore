@implementation SISchemaPunchOut

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
  v9.super_class = (Class)SISchemaPunchOut;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaPunchOut viewContainer](self, "viewContainer", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaPunchOut deleteViewContainer](self, "deleteViewContainer");
  return v5;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (void)deleteAppID
{
  -[SISchemaPunchOut setAppID:](self, "setAppID:", 0);
}

- (BOOL)hasUrlScheme
{
  return self->_urlScheme != 0;
}

- (void)deleteUrlScheme
{
  -[SISchemaPunchOut setUrlScheme:](self, "setUrlScheme:", 0);
}

- (BOOL)hasViewContainer
{
  return self->_viewContainer != 0;
}

- (void)deleteViewContainer
{
  -[SISchemaPunchOut setViewContainer:](self, "setViewContainer:", 0);
}

- (BOOL)hasViewElementID
{
  return self->_viewElementID != 0;
}

- (void)deleteViewElementID
{
  -[SISchemaPunchOut setViewElementID:](self, "setViewElementID:", 0);
}

- (void)setPunchOutUI:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_punchOutUI = a3;
}

- (BOOL)hasPunchOutUI
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPunchOutUI:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePunchOutUI
{
  -[SISchemaPunchOut setPunchOutUI:](self, "setPunchOutUI:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsPunchoutToHomeScreen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isPunchoutToHomeScreen = a3;
}

- (BOOL)hasIsPunchoutToHomeScreen
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsPunchoutToHomeScreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsPunchoutToHomeScreen
{
  -[SISchemaPunchOut setIsPunchoutToHomeScreen:](self, "setIsPunchoutToHomeScreen:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasAceID
{
  return self->_aceID != 0;
}

- (void)deleteAceID
{
  -[SISchemaPunchOut setAceID:](self, "setAceID:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPunchOutReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
  -[SISchemaPunchOut appID](self, "appID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaPunchOut urlScheme](self, "urlScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaPunchOut viewContainer](self, "viewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaPunchOut viewContainer](self, "viewContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaPunchOut viewElementID](self, "viewElementID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[SISchemaPunchOut aceID](self, "aceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v10)
  {
    PBDataWriterWriteStringField();
    v11 = v12;
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
  $B07984093DBDE6FD095F2C080453EFAF has;
  unsigned int v28;
  int punchOutUI;
  int v30;
  int isPunchoutToHomeScreen;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[SISchemaPunchOut appID](self, "appID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaPunchOut appID](self, "appID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaPunchOut appID](self, "appID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[SISchemaPunchOut urlScheme](self, "urlScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaPunchOut urlScheme](self, "urlScheme");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaPunchOut urlScheme](self, "urlScheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlScheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  -[SISchemaPunchOut viewContainer](self, "viewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaPunchOut viewContainer](self, "viewContainer");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaPunchOut viewContainer](self, "viewContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_34;
  }
  else
  {

  }
  -[SISchemaPunchOut viewElementID](self, "viewElementID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElementID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[SISchemaPunchOut viewElementID](self, "viewElementID");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SISchemaPunchOut viewElementID](self, "viewElementID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewElementID");
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
    punchOutUI = self->_punchOutUI;
    if (punchOutUI != objc_msgSend(v4, "punchOutUI"))
      goto LABEL_34;
    has = self->_has;
    v28 = v4[56];
  }
  v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1))
    goto LABEL_34;
  if (v30)
  {
    isPunchoutToHomeScreen = self->_isPunchoutToHomeScreen;
    if (isPunchoutToHomeScreen != objc_msgSend(v4, "isPunchoutToHomeScreen"))
      goto LABEL_34;
  }
  -[SISchemaPunchOut aceID](self, "aceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[SISchemaPunchOut aceID](self, "aceID");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_37:
    v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  -[SISchemaPunchOut aceID](self, "aceID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceID");
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
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_appID, "hash");
  v4 = -[NSString hash](self->_urlScheme, "hash");
  v5 = -[SISchemaViewContainer hash](self->_viewContainer, "hash");
  v6 = -[NSData hash](self->_viewElementID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_punchOutUI;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_aceID, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_isPunchoutToHomeScreen;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_aceID, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceID)
  {
    -[SISchemaPunchOut aceID](self, "aceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceID"));

  }
  if (self->_appID)
  {
    -[SISchemaPunchOut appID](self, "appID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appID"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaPunchOut isPunchoutToHomeScreen](self, "isPunchoutToHomeScreen"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isPunchoutToHomeScreen"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v10 = -[SISchemaPunchOut punchOutUI](self, "punchOutUI") - 1;
    if (v10 > 6)
      v11 = CFSTR("PUNCHOUTUI_UNKNOWN");
    else
      v11 = off_1E5636F08[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("punchOutUI"));
  }
  if (self->_urlScheme)
  {
    -[SISchemaPunchOut urlScheme](self, "urlScheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("urlScheme"));

  }
  if (self->_viewContainer)
  {
    -[SISchemaPunchOut viewContainer](self, "viewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("viewContainer"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("viewContainer"));

    }
  }
  if (self->_viewElementID)
  {
    -[SISchemaPunchOut viewElementID](self, "viewElementID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("viewElementID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("viewElementID"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaPunchOut dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaPunchOut)initWithJSON:(id)a3
{
  void *v4;
  SISchemaPunchOut *v5;
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
    self = -[SISchemaPunchOut initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaPunchOut)initWithDictionary:(id)a3
{
  id v4;
  SISchemaPunchOut *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaViewContainer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SISchemaPunchOut *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaPunchOut;
  v5 = -[SISchemaPunchOut init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaPunchOut setAppID:](v5, "setAppID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlScheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaPunchOut setUrlScheme:](v5, "setUrlScheme:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewContainer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaViewContainer initWithDictionary:]([SISchemaViewContainer alloc], "initWithDictionary:", v10);
      -[SISchemaPunchOut setViewContainer:](v5, "setViewContainer:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewElementID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
      -[SISchemaPunchOut setViewElementID:](v5, "setViewElementID:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchOutUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPunchOut setPunchOutUI:](v5, "setPunchOutUI:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPunchoutToHomeScreen"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPunchOut setIsPunchoutToHomeScreen:](v5, "setIsPunchoutToHomeScreen:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[SISchemaPunchOut setAceID:](v5, "setAceID:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)urlScheme
{
  return self->_urlScheme;
}

- (void)setUrlScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaViewContainer)viewContainer
{
  return self->_viewContainer;
}

- (void)setViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_viewContainer, a3);
}

- (NSData)viewElementID
{
  return self->_viewElementID;
}

- (void)setViewElementID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)punchOutUI
{
  return self->_punchOutUI;
}

- (BOOL)isPunchoutToHomeScreen
{
  return self->_isPunchoutToHomeScreen;
}

- (NSString)aceID
{
  return self->_aceID;
}

- (void)setAceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasAppID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUrlScheme:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasViewContainer:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasViewElementID:(BOOL)a3
{
  self->_hasAppID = a3;
}

- (void)setHasAceID:(BOOL)a3
{
  self->_hasUrlScheme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceID, 0);
  objc_storeStrong((id *)&self->_viewElementID, 0);
  objc_storeStrong((id *)&self->_viewContainer, 0);
  objc_storeStrong((id *)&self->_urlScheme, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
