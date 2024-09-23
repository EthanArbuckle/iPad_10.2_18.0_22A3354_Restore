@implementation ODDSiriSchemaODDiOSAssistantProperties

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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ODDSiriSchemaODDiOSAssistantProperties;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteResponse](self, "deleteResponse");
  -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteAccessibility](self, "deleteAccessibility");
  -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteCarPlay](self, "deleteCarPlay");
  -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteSiriInCall](self, "deleteSiriInCall");
  -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteAnnounce](self, "deleteAnnounce");
  -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteAutoSendMessage](self, "deleteAutoSendMessage");
  -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[ODDSiriSchemaODDiOSAssistantProperties deleteHeadGestures](self, "deleteHeadGestures");

  return v5;
}

- (void)setIsPressSideButtonForSiriEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isPressSideButtonForSiriEnabled = a3;
}

- (BOOL)hasIsPressSideButtonForSiriEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsPressSideButtonForSiriEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsPressSideButtonForSiriEnabled
{
  -[ODDSiriSchemaODDiOSAssistantProperties setIsPressSideButtonForSiriEnabled:](self, "setIsPressSideButtonForSiriEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsAllowSiriWhenLockedEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAllowSiriWhenLockedEnabled = a3;
}

- (BOOL)hasIsAllowSiriWhenLockedEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsAllowSiriWhenLockedEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsAllowSiriWhenLockedEnabled
{
  -[ODDSiriSchemaODDiOSAssistantProperties setIsAllowSiriWhenLockedEnabled:](self, "setIsAllowSiriWhenLockedEnabled:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (void)deleteResponse
{
  -[ODDSiriSchemaODDiOSAssistantProperties setResponse:](self, "setResponse:", 0);
}

- (BOOL)hasAccessibility
{
  return self->_accessibility != 0;
}

- (void)deleteAccessibility
{
  -[ODDSiriSchemaODDiOSAssistantProperties setAccessibility:](self, "setAccessibility:", 0);
}

- (BOOL)hasCarPlay
{
  return self->_carPlay != 0;
}

- (void)deleteCarPlay
{
  -[ODDSiriSchemaODDiOSAssistantProperties setCarPlay:](self, "setCarPlay:", 0);
}

- (BOOL)hasSiriInCall
{
  return self->_siriInCall != 0;
}

- (void)deleteSiriInCall
{
  -[ODDSiriSchemaODDiOSAssistantProperties setSiriInCall:](self, "setSiriInCall:", 0);
}

- (BOOL)hasAnnounce
{
  return self->_announce != 0;
}

- (void)deleteAnnounce
{
  -[ODDSiriSchemaODDiOSAssistantProperties setAnnounce:](self, "setAnnounce:", 0);
}

- (BOOL)hasAutoSendMessage
{
  return self->_autoSendMessage != 0;
}

- (void)deleteAutoSendMessage
{
  -[ODDSiriSchemaODDiOSAssistantProperties setAutoSendMessage:](self, "setAutoSendMessage:", 0);
}

- (void)clearActiveSubscriptions
{
  -[NSArray removeAllObjects](self->_activeSubscriptions, "removeAllObjects");
}

- (void)addActiveSubscriptions:(int)a3
{
  uint64_t v3;
  NSArray *activeSubscriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  activeSubscriptions = self->_activeSubscriptions;
  if (!activeSubscriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeSubscriptions;
    self->_activeSubscriptions = v6;

    activeSubscriptions = self->_activeSubscriptions;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](activeSubscriptions, "addObject:", v8);

}

- (unint64_t)activeSubscriptionsCount
{
  return -[NSArray count](self->_activeSubscriptions, "count");
}

- (int)activeSubscriptionsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_activeSubscriptions, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)hasHeadGestures
{
  return self->_headGestures != 0;
}

- (void)deleteHeadGestures
{
  -[ODDSiriSchemaODDiOSAssistantProperties setHeadGestures:](self, "setHeadGestures:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDiOSAssistantPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_activeSubscriptions;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "intValue", (_QWORD)v25);
        PBDataWriterWriteInt32Field();
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $D474A29A4B6CA4DA5C3495753A56B993 has;
  unsigned int v6;
  int isPressSideButtonForSiriEnabled;
  int v8;
  int isAllowSiriWhenLockedEnabled;
  void *v10;
  void *v11;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  has = self->_has;
  v6 = v4[80];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_49;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isPressSideButtonForSiriEnabled = self->_isPressSideButtonForSiriEnabled;
    if (isPressSideButtonForSiriEnabled != objc_msgSend(v4, "isPressSideButtonForSiriEnabled"))
      goto LABEL_49;
    has = self->_has;
    v6 = v4[80];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_49;
  if (v8)
  {
    isAllowSiriWhenLockedEnabled = self->_isAllowSiriWhenLockedEnabled;
    if (isAllowSiriWhenLockedEnabled != objc_msgSend(v4, "isAllowSiriWhenLockedEnabled"))
      goto LABEL_49;
  }
  -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibility");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibility");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carPlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carPlay");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInCall");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInCall");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announce");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "announce");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoSendMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoSendMessage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties activeSubscriptions](self, "activeSubscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSubscriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_48;
  -[ODDSiriSchemaODDiOSAssistantProperties activeSubscriptions](self, "activeSubscriptions");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[ODDSiriSchemaODDiOSAssistantProperties activeSubscriptions](self, "activeSubscriptions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSubscriptions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_49;
  }
  else
  {

  }
  -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headGestures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
    {

LABEL_52:
      v52 = 1;
      goto LABEL_50;
    }
    v48 = (void *)v47;
    -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headGestures");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if ((v51 & 1) != 0)
      goto LABEL_52;
  }
  else
  {
LABEL_48:

  }
LABEL_49:
  v52 = 0;
LABEL_50:

  return v52;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_isPressSideButtonForSiriEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_isAllowSiriWhenLockedEnabled;
LABEL_6:
  v5 = v4 ^ v3 ^ -[ODDSiriSchemaODDiOSResponseProperties hash](self->_response, "hash");
  v6 = -[ODDSiriSchemaODDiOSAccessibilityProperties hash](self->_accessibility, "hash");
  v7 = v5 ^ v6 ^ -[ODDSiriSchemaODDCarPlayProperties hash](self->_carPlay, "hash");
  v8 = -[ODDSiriSchemaODDSiriInCallProperties hash](self->_siriInCall, "hash");
  v9 = v8 ^ -[ODDSiriSchemaODDAnnounceProperties hash](self->_announce, "hash");
  v10 = v7 ^ v9 ^ -[ODDSiriSchemaODDAutoSendMessageProperties hash](self->_autoSendMessage, "hash");
  v11 = -[NSArray hash](self->_activeSubscriptions, "hash");
  return v10 ^ v11 ^ -[ODDSiriSchemaODDHeadGestureProperties hash](self->_headGestures, "hash");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char has;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accessibility)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties accessibility](self, "accessibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessibility"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accessibility"));

    }
  }
  if (-[NSArray count](self->_activeSubscriptions, "count"))
  {
    -[ODDSiriSchemaODDiOSAssistantProperties activeSubscriptions](self, "activeSubscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("activeSubscriptions"));

  }
  if (self->_announce)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties announce](self, "announce");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("announce"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("announce"));

    }
  }
  if (self->_autoSendMessage)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties autoSendMessage](self, "autoSendMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("autoSendMessage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("autoSendMessage"));

    }
  }
  if (self->_carPlay)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties carPlay](self, "carPlay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("carPlay"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("carPlay"));

    }
  }
  if (self->_headGestures)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties headGestures](self, "headGestures");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("headGestures"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("headGestures"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAssistantProperties isAllowSiriWhenLockedEnabled](self, "isAllowSiriWhenLockedEnabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isAllowSiriWhenLockedEnabled"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDiOSAssistantProperties isPressSideButtonForSiriEnabled](self, "isPressSideButtonForSiriEnabled"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isPressSideButtonForSiriEnabled"));

  }
  if (self->_response)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties response](self, "response");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("response"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("response"));

    }
  }
  if (self->_siriInCall)
  {
    -[ODDSiriSchemaODDiOSAssistantProperties siriInCall](self, "siriInCall");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("siriInCall"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("siriInCall"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDiOSAssistantProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDiOSAssistantProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDiOSAssistantProperties *v5;
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
    self = -[ODDSiriSchemaODDiOSAssistantProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDiOSAssistantProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDiOSAssistantProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  ODDSiriSchemaODDiOSResponseProperties *v9;
  uint64_t v10;
  ODDSiriSchemaODDiOSAccessibilityProperties *v11;
  uint64_t v12;
  ODDSiriSchemaODDCarPlayProperties *v13;
  uint64_t v14;
  ODDSiriSchemaODDSiriInCallProperties *v15;
  uint64_t v16;
  ODDSiriSchemaODDAnnounceProperties *v17;
  void *v18;
  ODDSiriSchemaODDAutoSendMessageProperties *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  ODDSiriSchemaODDHeadGestureProperties *v28;
  ODDSiriSchemaODDiOSAssistantProperties *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ODDSiriSchemaODDiOSAssistantProperties;
  v5 = -[ODDSiriSchemaODDiOSAssistantProperties init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPressSideButtonForSiriEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAssistantProperties setIsPressSideButtonForSiriEnabled:](v5, "setIsPressSideButtonForSiriEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAllowSiriWhenLockedEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDiOSAssistantProperties setIsAllowSiriWhenLockedEnabled:](v5, "setIsAllowSiriWhenLockedEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("response"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDiOSResponseProperties initWithDictionary:]([ODDSiriSchemaODDiOSResponseProperties alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDiOSAssistantProperties setResponse:](v5, "setResponse:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessibility"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODDSiriSchemaODDiOSAccessibilityProperties initWithDictionary:]([ODDSiriSchemaODDiOSAccessibilityProperties alloc], "initWithDictionary:", v10);
      -[ODDSiriSchemaODDiOSAssistantProperties setAccessibility:](v5, "setAccessibility:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlay"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ODDSiriSchemaODDCarPlayProperties initWithDictionary:]([ODDSiriSchemaODDCarPlayProperties alloc], "initWithDictionary:", v12);
      -[ODDSiriSchemaODDiOSAssistantProperties setCarPlay:](v5, "setCarPlay:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInCall"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = (void *)v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ODDSiriSchemaODDSiriInCallProperties initWithDictionary:]([ODDSiriSchemaODDSiriInCallProperties alloc], "initWithDictionary:", v14);
      -[ODDSiriSchemaODDiOSAssistantProperties setSiriInCall:](v5, "setSiriInCall:", v15);

    }
    v35 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announce"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ODDSiriSchemaODDAnnounceProperties initWithDictionary:]([ODDSiriSchemaODDAnnounceProperties alloc], "initWithDictionary:", v16);
      -[ODDSiriSchemaODDiOSAssistantProperties setAnnounce:](v5, "setAnnounce:", v17);

    }
    v34 = (void *)v16;
    v36 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoSendMessage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[ODDSiriSchemaODDAutoSendMessageProperties initWithDictionary:]([ODDSiriSchemaODDAutoSendMessageProperties alloc], "initWithDictionary:", v18);
      -[ODDSiriSchemaODDiOSAssistantProperties setAutoSendMessage:](v5, "setAutoSendMessage:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeSubscriptions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v8;
      v32 = v7;
      v33 = v6;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODDSiriSchemaODDiOSAssistantProperties addActiveSubscriptions:](v5, "addActiveSubscriptions:", objc_msgSend(v26, "intValue"));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v23);
      }

      v7 = v32;
      v6 = v33;
      v8 = v31;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headGestures"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[ODDSiriSchemaODDHeadGestureProperties initWithDictionary:]([ODDSiriSchemaODDHeadGestureProperties alloc], "initWithDictionary:", v27);
      -[ODDSiriSchemaODDiOSAssistantProperties setHeadGestures:](v5, "setHeadGestures:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (BOOL)isPressSideButtonForSiriEnabled
{
  return self->_isPressSideButtonForSiriEnabled;
}

- (BOOL)isAllowSiriWhenLockedEnabled
{
  return self->_isAllowSiriWhenLockedEnabled;
}

- (ODDSiriSchemaODDiOSResponseProperties)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (ODDSiriSchemaODDiOSAccessibilityProperties)accessibility
{
  return self->_accessibility;
}

- (void)setAccessibility:(id)a3
{
  objc_storeStrong((id *)&self->_accessibility, a3);
}

- (ODDSiriSchemaODDCarPlayProperties)carPlay
{
  return self->_carPlay;
}

- (void)setCarPlay:(id)a3
{
  objc_storeStrong((id *)&self->_carPlay, a3);
}

- (ODDSiriSchemaODDSiriInCallProperties)siriInCall
{
  return self->_siriInCall;
}

- (void)setSiriInCall:(id)a3
{
  objc_storeStrong((id *)&self->_siriInCall, a3);
}

- (ODDSiriSchemaODDAnnounceProperties)announce
{
  return self->_announce;
}

- (void)setAnnounce:(id)a3
{
  objc_storeStrong((id *)&self->_announce, a3);
}

- (ODDSiriSchemaODDAutoSendMessageProperties)autoSendMessage
{
  return self->_autoSendMessage;
}

- (void)setAutoSendMessage:(id)a3
{
  objc_storeStrong((id *)&self->_autoSendMessage, a3);
}

- (NSArray)activeSubscriptions
{
  return self->_activeSubscriptions;
}

- (void)setActiveSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (ODDSiriSchemaODDHeadGestureProperties)headGestures
{
  return self->_headGestures;
}

- (void)setHeadGestures:(id)a3
{
  objc_storeStrong((id *)&self->_headGestures, a3);
}

- (void)setHasResponse:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAccessibility:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasCarPlay:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSiriInCall:(BOOL)a3
{
  self->_hasResponse = a3;
}

- (void)setHasAnnounce:(BOOL)a3
{
  self->_hasAccessibility = a3;
}

- (void)setHasAutoSendMessage:(BOOL)a3
{
  self->_hasCarPlay = a3;
}

- (void)setHasHeadGestures:(BOOL)a3
{
  self->_hasSiriInCall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestures, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
  objc_storeStrong((id *)&self->_autoSendMessage, 0);
  objc_storeStrong((id *)&self->_announce, 0);
  objc_storeStrong((id *)&self->_siriInCall, 0);
  objc_storeStrong((id *)&self->_carPlay, 0);
  objc_storeStrong((id *)&self->_accessibility, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
