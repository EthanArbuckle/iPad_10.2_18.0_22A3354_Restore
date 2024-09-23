@implementation SISchemaUEIUUFRReady

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
  v13.super_class = (Class)SISchemaUEIUUFRReady;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[SISchemaUEIUUFRReady deleteDialogIdentifiers](self, "deleteDialogIdentifiers");
  -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUEIUUFRReady deleteSubRequestId](self, "deleteSubRequestId");
  -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaUEIUUFRReady deleteAceCommandId](self, "deleteAceCommandId");

  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[SISchemaUEIUUFRReady setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAceCommandClass
{
  return self->_aceCommandClass != 0;
}

- (void)deleteAceCommandClass
{
  -[SISchemaUEIUUFRReady setAceCommandClass:](self, "setAceCommandClass:", 0);
}

- (BOOL)hasAceViewId
{
  return self->_aceViewId != 0;
}

- (void)deleteAceViewId
{
  -[SISchemaUEIUUFRReady setAceViewId:](self, "setAceViewId:", 0);
}

- (void)setUufrReadySource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uufrReadySource = a3;
}

- (BOOL)hasUufrReadySource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUufrReadySource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUufrReadySource
{
  -[SISchemaUEIUUFRReady setUufrReadySource:](self, "setUufrReadySource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setDialogPhase:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dialogPhase = a3;
}

- (BOOL)hasDialogPhase
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDialogPhase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteDialogPhase
{
  -[SISchemaUEIUUFRReady setDialogPhase:](self, "setDialogPhase:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)clearDialogIdentifiers
{
  -[NSArray removeAllObjects](self->_dialogIdentifiers, "removeAllObjects");
}

- (void)addDialogIdentifiers:(id)a3
{
  id v4;
  NSArray *dialogIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  dialogIdentifiers = self->_dialogIdentifiers;
  v8 = v4;
  if (!dialogIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dialogIdentifiers;
    self->_dialogIdentifiers = v6;

    v4 = v8;
    dialogIdentifiers = self->_dialogIdentifiers;
  }
  -[NSArray addObject:](dialogIdentifiers, "addObject:", v4);

}

- (unint64_t)dialogIdentifiersCount
{
  return -[NSArray count](self->_dialogIdentifiers, "count");
}

- (id)dialogIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_dialogIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[SISchemaUEIUUFRReady setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)hasAceCommandId
{
  return self->_aceCommandId != 0;
}

- (void)deleteAceCommandId
{
  -[SISchemaUEIUUFRReady setAceCommandId:](self, "setAceCommandId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIUUFRReadyReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char has;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[SISchemaUEIUUFRReady aceCommandClass](self, "aceCommandClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaUEIUUFRReady aceViewId](self, "aceViewId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_dialogIdentifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  $629E95A5DEF085DEE62B15EE530D4E36 has;
  int v19;
  unsigned int v20;
  int uufrReadySource;
  int v22;
  int dialogPhase;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  if ((*(_BYTE *)&self->_has & 1) != (v4[64] & 1))
    goto LABEL_37;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_37;
  }
  -[SISchemaUEIUUFRReady aceCommandClass](self, "aceCommandClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceCommandClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_36;
  -[SISchemaUEIUUFRReady aceCommandClass](self, "aceCommandClass");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUEIUUFRReady aceCommandClass](self, "aceCommandClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceCommandClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_37;
  }
  else
  {

  }
  -[SISchemaUEIUUFRReady aceViewId](self, "aceViewId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceViewId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_36;
  -[SISchemaUEIUUFRReady aceViewId](self, "aceViewId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaUEIUUFRReady aceViewId](self, "aceViewId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_37;
  }
  else
  {

  }
  has = self->_has;
  v19 = (*(unsigned int *)&has >> 1) & 1;
  v20 = v4[64];
  if (v19 != ((v20 >> 1) & 1))
    goto LABEL_37;
  if (v19)
  {
    uufrReadySource = self->_uufrReadySource;
    if (uufrReadySource != objc_msgSend(v4, "uufrReadySource"))
      goto LABEL_37;
    has = self->_has;
    v20 = v4[64];
  }
  v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v20 >> 2) & 1))
    goto LABEL_37;
  if (v22)
  {
    dialogPhase = self->_dialogPhase;
    if (dialogPhase != objc_msgSend(v4, "dialogPhase"))
      goto LABEL_37;
  }
  -[SISchemaUEIUUFRReady dialogIdentifiers](self, "dialogIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_36;
  -[SISchemaUEIUUFRReady dialogIdentifiers](self, "dialogIdentifiers");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[SISchemaUEIUUFRReady dialogIdentifiers](self, "dialogIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_37;
  }
  else
  {

  }
  -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_36;
  -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_37;
  }
  else
  {

  }
  -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceCommandId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {

LABEL_40:
    v39 = 1;
    goto LABEL_38;
  }
  v35 = (void *)v34;
  -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceCommandId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqual:", v37);

  if ((v38 & 1) != 0)
    goto LABEL_40;
LABEL_37:
  v39 = 0;
LABEL_38:

  return v39;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_aceCommandClass, "hash");
  v5 = -[NSString hash](self->_aceViewId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_uufrReadySource;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v7 = 2654435761 * self->_dialogPhase;
LABEL_9:
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSArray hash](self->_dialogIdentifiers, "hash");
  v10 = v8 ^ v9 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
  return v10 ^ -[SISchemaUUID hash](self->_aceCommandId, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  char has;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const __CFString *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceCommandClass)
  {
    -[SISchemaUEIUUFRReady aceCommandClass](self, "aceCommandClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceCommandClass"));

  }
  if (self->_aceCommandId)
  {
    -[SISchemaUEIUUFRReady aceCommandId](self, "aceCommandId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aceCommandId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("aceCommandId"));

    }
  }
  if (self->_aceViewId)
  {
    -[SISchemaUEIUUFRReady aceViewId](self, "aceViewId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("aceViewId"));

  }
  if (self->_dialogIdentifiers)
  {
    -[SISchemaUEIUUFRReady dialogIdentifiers](self, "dialogIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("dialogIdentifiers"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = -[SISchemaUEIUUFRReady dialogPhase](self, "dialogPhase") - 1;
    if (v14 > 0xA)
      v15 = CFSTR("UEIUUFRREADYDIALOGPHASE_UNKNOWN");
    else
      v15 = off_1E5637480[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("dialogPhase"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEIUUFRReady exists](self, "exists"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("exists"));

  }
  if (self->_subRequestId)
  {
    -[SISchemaUEIUUFRReady subRequestId](self, "subRequestId");
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v20 = -[SISchemaUEIUUFRReady uufrReadySource](self, "uufrReadySource") - 1;
    if (v20 > 3)
      v21 = CFSTR("UUFRREADYSOURCE_UNKNOWN");
    else
      v21 = off_1E56374D8[v20];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("uufrReadySource"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIUUFRReady dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIUUFRReady)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIUUFRReady *v5;
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
    self = -[SISchemaUEIUUFRReady initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIUUFRReady)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIUUFRReady *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SISchemaUUID *v22;
  void *v23;
  SISchemaUUID *v24;
  SISchemaUEIUUFRReady *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SISchemaUEIUUFRReady;
  v5 = -[SISchemaUEIUUFRReady init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIUUFRReady setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceCommandClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SISchemaUEIUUFRReady setAceCommandClass:](v5, "setAceCommandClass:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SISchemaUEIUUFRReady setAceViewId:](v5, "setAceViewId:", v10);

    }
    v29 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uufrReadySource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIUUFRReady setUufrReadySource:](v5, "setUufrReadySource:", objc_msgSend(v11, "intValue"));
    v28 = v11;
    v30 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogPhase"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIUUFRReady setDialogPhase:](v5, "setDialogPhase:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogIdentifiers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v6;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = (void *)objc_msgSend(v19, "copy");
              -[SISchemaUEIUUFRReady addDialogIdentifiers:](v5, "addDialogIdentifiers:", v20);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v16);
      }

      v6 = v27;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"), v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v21);
      -[SISchemaUEIUUFRReady setSubRequestId:](v5, "setSubRequestId:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceCommandId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v23);
      -[SISchemaUEIUUFRReady setAceCommandId:](v5, "setAceCommandId:", v24);

    }
    v25 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NSString)aceCommandClass
{
  return self->_aceCommandClass;
}

- (void)setAceCommandClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)aceViewId
{
  return self->_aceViewId;
}

- (void)setAceViewId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)uufrReadySource
{
  return self->_uufrReadySource;
}

- (int)dialogPhase
{
  return self->_dialogPhase;
}

- (NSArray)dialogIdentifiers
{
  return self->_dialogIdentifiers;
}

- (void)setDialogIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (SISchemaUUID)aceCommandId
{
  return self->_aceCommandId;
}

- (void)setAceCommandId:(id)a3
{
  objc_storeStrong((id *)&self->_aceCommandId, a3);
}

- (void)setHasAceCommandClass:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAceViewId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasAceCommandId:(BOOL)a3
{
  self->_hasAceCommandClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceCommandId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_dialogIdentifiers, 0);
  objc_storeStrong((id *)&self->_aceViewId, 0);
  objc_storeStrong((id *)&self->_aceCommandClass, 0);
}

@end
