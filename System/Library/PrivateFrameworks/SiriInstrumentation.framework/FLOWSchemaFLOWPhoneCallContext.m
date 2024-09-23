@implementation FLOWSchemaFLOWPhoneCallContext

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
  v9.super_class = (Class)FLOWSchemaFLOWPhoneCallContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[FLOWSchemaFLOWPhoneCallContext deleteEmergencyContext](self, "deleteEmergencyContext");
  return v5;
}

- (void)setPhoneCallType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_phoneCallType = a3;
}

- (BOOL)hasPhoneCallType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPhoneCallType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePhoneCallType
{
  -[FLOWSchemaFLOWPhoneCallContext setPhoneCallType:](self, "setPhoneCallType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearRecipientType
{
  -[NSArray removeAllObjects](self->_recipientTypes, "removeAllObjects");
}

- (void)addRecipientType:(int)a3
{
  uint64_t v3;
  NSArray *recipientTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  recipientTypes = self->_recipientTypes;
  if (!recipientTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recipientTypes;
    self->_recipientTypes = v6;

    recipientTypes = self->_recipientTypes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](recipientTypes, "addObject:", v8);

}

- (unint64_t)recipientTypeCount
{
  return -[NSArray count](self->_recipientTypes, "count");
}

- (int)recipientTypeAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_recipientTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setPhoneCallAppType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_phoneCallAppType = a3;
}

- (BOOL)hasPhoneCallAppType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPhoneCallAppType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePhoneCallAppType
{
  -[FLOWSchemaFLOWPhoneCallContext setPhoneCallAppType:](self, "setPhoneCallAppType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasEmergencyContext
{
  return self->_emergencyContext != 0;
}

- (void)deleteEmergencyContext
{
  -[FLOWSchemaFLOWPhoneCallContext setEmergencyContext:](self, "setEmergencyContext:", 0);
}

- (void)clearPersonType
{
  -[NSArray removeAllObjects](self->_personTypes, "removeAllObjects");
}

- (void)addPersonType:(int)a3
{
  uint64_t v3;
  NSArray *personTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  personTypes = self->_personTypes;
  if (!personTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_personTypes;
    self->_personTypes = v6;

    personTypes = self->_personTypes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](personTypes, "addObject:", v8);

}

- (unint64_t)personTypeCount
{
  return -[NSArray count](self->_personTypes, "count");
}

- (int)personTypeAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_personTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setIsThirdPartyFaceTime:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isThirdPartyFaceTime = a3;
}

- (BOOL)hasIsThirdPartyFaceTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsThirdPartyFaceTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsThirdPartyFaceTime
{
  -[FLOWSchemaFLOWPhoneCallContext setIsThirdPartyFaceTime:](self, "setIsThirdPartyFaceTime:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setSearchCallHistoryIntent:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_searchCallHistoryIntent = a3;
}

- (BOOL)hasSearchCallHistoryIntent
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSearchCallHistoryIntent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteSearchCallHistoryIntent
{
  -[FLOWSchemaFLOWPhoneCallContext setSearchCallHistoryIntent:](self, "setSearchCallHistoryIntent:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setUserPersona:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_userPersona = a3;
}

- (BOOL)hasUserPersona
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasUserPersona:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteUserPersona
{
  -[FLOWSchemaFLOWPhoneCallContext setUserPersona:](self, "setUserPersona:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPhoneCallContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char has;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_recipientTypes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "intValue");
        PBDataWriterWriteInt32Field();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_personTypes;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "intValue", (_QWORD)v18);
        PBDataWriterWriteInt32Field();
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_23;
LABEL_27:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_27;
LABEL_23:
  if ((has & 0x10) != 0)
LABEL_24:
    PBDataWriterWriteInt32Field();
LABEL_25:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int phoneCallType;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int phoneCallAppType;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  $FC3868DE7B08E39CDBE88B2822C3268C has;
  int v28;
  unsigned int v29;
  int isThirdPartyFaceTime;
  int v31;
  int searchCallHistoryIntent;
  int v33;
  int userPersona;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != (v4[60] & 1))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    phoneCallType = self->_phoneCallType;
    if (phoneCallType != objc_msgSend(v4, "phoneCallType"))
      goto LABEL_23;
  }
  -[FLOWSchemaFLOWPhoneCallContext recipientTypes](self, "recipientTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[FLOWSchemaFLOWPhoneCallContext recipientTypes](self, "recipientTypes");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWPhoneCallContext recipientTypes](self, "recipientTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipientTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  v13 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v13 != ((v4[60] >> 1) & 1))
    goto LABEL_23;
  if (v13)
  {
    phoneCallAppType = self->_phoneCallAppType;
    if (phoneCallAppType != objc_msgSend(v4, "phoneCallAppType"))
      goto LABEL_23;
  }
  -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emergencyContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emergencyContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_23;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPhoneCallContext personTypes](self, "personTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[FLOWSchemaFLOWPhoneCallContext personTypes](self, "personTypes");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[FLOWSchemaFLOWPhoneCallContext personTypes](self, "personTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personTypes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_23;
  }
  else
  {

  }
  has = self->_has;
  v28 = (*(unsigned int *)&has >> 2) & 1;
  v29 = v4[60];
  if (v28 == ((v29 >> 2) & 1))
  {
    if (v28)
    {
      isThirdPartyFaceTime = self->_isThirdPartyFaceTime;
      if (isThirdPartyFaceTime != objc_msgSend(v4, "isThirdPartyFaceTime"))
        goto LABEL_23;
      has = self->_has;
      v29 = v4[60];
    }
    v31 = (*(unsigned int *)&has >> 3) & 1;
    if (v31 == ((v29 >> 3) & 1))
    {
      if (v31)
      {
        searchCallHistoryIntent = self->_searchCallHistoryIntent;
        if (searchCallHistoryIntent != objc_msgSend(v4, "searchCallHistoryIntent"))
          goto LABEL_23;
        has = self->_has;
        v29 = v4[60];
      }
      v33 = (*(unsigned int *)&has >> 4) & 1;
      if (v33 == ((v29 >> 4) & 1))
      {
        if (!v33 || (userPersona = self->_userPersona, userPersona == objc_msgSend(v4, "userPersona")))
        {
          v25 = 1;
          goto LABEL_24;
        }
      }
    }
  }
LABEL_23:
  v25 = 0;
LABEL_24:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_phoneCallType;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_recipientTypes, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_phoneCallAppType;
  else
    v5 = 0;
  v6 = -[FLOWSchemaFLOWPhoneCallEmergencyContext hash](self->_emergencyContext, "hash");
  v7 = -[NSArray hash](self->_personTypes, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_13:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761 * self->_isThirdPartyFaceTime;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = 2654435761 * self->_searchCallHistoryIntent;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_10:
  v10 = 2654435761 * self->_userPersona;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  char has;
  unsigned int v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  unsigned int v22;
  const __CFString *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_emergencyContext)
  {
    -[FLOWSchemaFLOWPhoneCallContext emergencyContext](self, "emergencyContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("emergencyContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("emergencyContext"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWPhoneCallContext isThirdPartyFaceTime](self, "isThirdPartyFaceTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isThirdPartyFaceTime"));

  }
  if (-[NSArray count](self->_personTypes, "count"))
  {
    -[FLOWSchemaFLOWPhoneCallContext personTypes](self, "personTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("personType"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = -[FLOWSchemaFLOWPhoneCallContext phoneCallAppType](self, "phoneCallAppType") - 1;
    if (v11 > 3)
      v12 = CFSTR("FLOWPHONECALLAPPTYPE_UNKNOWN");
    else
      v12 = off_1E562E758[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("phoneCallAppType"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v13 = -[FLOWSchemaFLOWPhoneCallContext phoneCallType](self, "phoneCallType");
    v14 = CFSTR("FLOWPHONECALLTYPE_UNKNOWN");
    if (v13 == 1)
      v14 = CFSTR("FLOWPHONECALLTYPE_AUDIO");
    if (v13 == 2)
      v15 = CFSTR("FLOWPHONECALLTYPE_VIDEO");
    else
      v15 = v14;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("phoneCallType"));
  }
  if (-[NSArray count](self->_recipientTypes, "count"))
  {
    -[FLOWSchemaFLOWPhoneCallContext recipientTypes](self, "recipientTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("recipientType"));

  }
  v18 = (char)self->_has;
  if ((v18 & 8) != 0)
  {
    v19 = -[FLOWSchemaFLOWPhoneCallContext searchCallHistoryIntent](self, "searchCallHistoryIntent");
    v20 = CFSTR("FLOWSEARCHCALLHISTORYINTENT_UNKNOWN");
    if (v19 == 1)
      v20 = CFSTR("FLOWSEARCHCALLHISTORYINTENT_VOICEMAIL");
    if (v19 == 2)
      v21 = CFSTR("FLOWSEARCHCALLHISTORYINTENT_SEARCH_CALL_HISTORY");
    else
      v21 = v20;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("searchCallHistoryIntent"));
    v18 = (char)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    v22 = -[FLOWSchemaFLOWPhoneCallContext userPersona](self, "userPersona") - 1;
    if (v22 > 5)
      v23 = CFSTR("INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN");
    else
      v23 = off_1E562E778[v22];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("userPersona"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWPhoneCallContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWPhoneCallContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWPhoneCallContext *v5;
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
    self = -[FLOWSchemaFLOWPhoneCallContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWPhoneCallContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWPhoneCallContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  FLOWSchemaFLOWPhoneCallEmergencyContext *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  FLOWSchemaFLOWPhoneCallContext *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FLOWSchemaFLOWPhoneCallContext;
  v5 = -[FLOWSchemaFLOWPhoneCallContext init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneCallType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPhoneCallContext setPhoneCallType:](v5, "setPhoneCallType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipientType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v9 = v7;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v39;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v39 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWPhoneCallContext addRecipientType:](v5, "addRecipientType:", objc_msgSend(v15, "intValue"));
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v12);
      }

      v6 = v8;
      v7 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneCallAppType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPhoneCallContext setPhoneCallAppType:](v5, "setPhoneCallAppType:", objc_msgSend(v16, "intValue"));
    v33 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emergencyContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[FLOWSchemaFLOWPhoneCallEmergencyContext initWithDictionary:]([FLOWSchemaFLOWPhoneCallEmergencyContext alloc], "initWithDictionary:", v17);
      -[FLOWSchemaFLOWPhoneCallContext setEmergencyContext:](v5, "setEmergencyContext:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v7;
      v32 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v24);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWPhoneCallContext addPersonType:](v5, "addPersonType:", objc_msgSend(v25, "intValue"));
            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v22);
      }

      v7 = v31;
      v6 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isThirdPartyFaceTime"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPhoneCallContext setIsThirdPartyFaceTime:](v5, "setIsThirdPartyFaceTime:", objc_msgSend(v26, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchCallHistoryIntent"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPhoneCallContext setSearchCallHistoryIntent:](v5, "setSearchCallHistoryIntent:", objc_msgSend(v27, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPersona"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWPhoneCallContext setUserPersona:](v5, "setUserPersona:", objc_msgSend(v28, "intValue"));
    v29 = v5;

  }
  return v5;
}

- (int)phoneCallType
{
  return self->_phoneCallType;
}

- (NSArray)recipientTypes
{
  return self->_recipientTypes;
}

- (void)setRecipientTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)phoneCallAppType
{
  return self->_phoneCallAppType;
}

- (FLOWSchemaFLOWPhoneCallEmergencyContext)emergencyContext
{
  return self->_emergencyContext;
}

- (void)setEmergencyContext:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContext, a3);
}

- (NSArray)personTypes
{
  return self->_personTypes;
}

- (void)setPersonTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isThirdPartyFaceTime
{
  return self->_isThirdPartyFaceTime;
}

- (int)searchCallHistoryIntent
{
  return self->_searchCallHistoryIntent;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (void)setHasEmergencyContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personTypes, 0);
  objc_storeStrong((id *)&self->_emergencyContext, 0);
  objc_storeStrong((id *)&self->_recipientTypes, 0);
}

@end
