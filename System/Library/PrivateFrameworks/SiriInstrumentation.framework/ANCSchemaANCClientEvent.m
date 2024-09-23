@implementation ANCSchemaANCClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ancId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_8;
    }
  }
  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "value");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v4 = v10;
LABEL_8:
      v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ancId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = 12;
  }
  else
  {
LABEL_5:
    -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "value");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v14, "length") != 0;

      }
      else
      {
        v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

+ (int)joinability
{
  return 2;
}

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ANCSchemaANCClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[ANCSchemaANCClientEvent deleteNotificationReceivedTier1](self, "deleteNotificationReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[ANCSchemaANCClientEvent deleteNotificationReceivedTier1](self, "deleteNotificationReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[ANCSchemaANCClientEvent deleteNotificationReceivedTier1](self, "deleteNotificationReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[ANCSchemaANCClientEvent deleteNotificationReceivedTier1](self, "deleteNotificationReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[ANCSchemaANCClientEvent deleteNotificationReceivedTier1](self, "deleteNotificationReceivedTier1");
  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ANCSchemaANCClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ANCSchemaANCClientEvent deleteNotificationReceived](self, "deleteNotificationReceived");
  -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ANCSchemaANCClientEvent deleteUserResponseEvaluated](self, "deleteUserResponseEvaluated");
  -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ANCSchemaANCClientEvent deleteNotificationReceivedTier1](self, "deleteNotificationReceivedTier1");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[ANCSchemaANCClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5628C70[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 2)
    return 0;
  else
    return off_1E5628C88[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[ANCSchemaANCClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 2)
    return CFSTR("com.apple.aiml.siri.anc.ANCClientEvent");
  else
    return off_1E562B0B0[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ANCSchemaANCClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setNotificationReceived:(id)a3
{
  ANCSchemaANCNotificationReceived *v4;
  ANCSchemaANCUserResponseEvaluated *userResponseEvaluated;
  ANCSchemaANCNotificationReceivedTier1 *notificationReceivedTier1;
  ANCSchemaANCNotificationReceived *notificationReceived;

  v4 = (ANCSchemaANCNotificationReceived *)a3;
  userResponseEvaluated = self->_userResponseEvaluated;
  self->_userResponseEvaluated = 0;

  notificationReceivedTier1 = self->_notificationReceivedTier1;
  self->_notificationReceivedTier1 = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  notificationReceived = self->_notificationReceived;
  self->_notificationReceived = v4;

}

- (ANCSchemaANCNotificationReceived)notificationReceived
{
  if (self->_whichEvent_Type == 2)
    return self->_notificationReceived;
  else
    return (ANCSchemaANCNotificationReceived *)0;
}

- (void)deleteNotificationReceived
{
  ANCSchemaANCNotificationReceived *notificationReceived;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    notificationReceived = self->_notificationReceived;
    self->_notificationReceived = 0;

  }
}

- (void)setUserResponseEvaluated:(id)a3
{
  ANCSchemaANCUserResponseEvaluated *v4;
  ANCSchemaANCNotificationReceived *notificationReceived;
  ANCSchemaANCNotificationReceivedTier1 *notificationReceivedTier1;
  unint64_t v7;
  ANCSchemaANCUserResponseEvaluated *userResponseEvaluated;

  v4 = (ANCSchemaANCUserResponseEvaluated *)a3;
  notificationReceived = self->_notificationReceived;
  self->_notificationReceived = 0;

  notificationReceivedTier1 = self->_notificationReceivedTier1;
  self->_notificationReceivedTier1 = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  userResponseEvaluated = self->_userResponseEvaluated;
  self->_userResponseEvaluated = v4;

}

- (ANCSchemaANCUserResponseEvaluated)userResponseEvaluated
{
  if (self->_whichEvent_Type == 3)
    return self->_userResponseEvaluated;
  else
    return (ANCSchemaANCUserResponseEvaluated *)0;
}

- (void)deleteUserResponseEvaluated
{
  ANCSchemaANCUserResponseEvaluated *userResponseEvaluated;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    userResponseEvaluated = self->_userResponseEvaluated;
    self->_userResponseEvaluated = 0;

  }
}

- (void)setNotificationReceivedTier1:(id)a3
{
  ANCSchemaANCNotificationReceivedTier1 *v4;
  ANCSchemaANCNotificationReceived *notificationReceived;
  ANCSchemaANCUserResponseEvaluated *userResponseEvaluated;
  ANCSchemaANCNotificationReceivedTier1 *notificationReceivedTier1;

  v4 = (ANCSchemaANCNotificationReceivedTier1 *)a3;
  notificationReceived = self->_notificationReceived;
  self->_notificationReceived = 0;

  userResponseEvaluated = self->_userResponseEvaluated;
  self->_userResponseEvaluated = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  notificationReceivedTier1 = self->_notificationReceivedTier1;
  self->_notificationReceivedTier1 = v4;

}

- (ANCSchemaANCNotificationReceivedTier1)notificationReceivedTier1
{
  if (self->_whichEvent_Type == 4)
    return self->_notificationReceivedTier1;
  else
    return (ANCSchemaANCNotificationReceivedTier1 *)0;
}

- (void)deleteNotificationReceivedTier1
{
  ANCSchemaANCNotificationReceivedTier1 *notificationReceivedTier1;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    notificationReceivedTier1 = self->_notificationReceivedTier1;
    self->_notificationReceivedTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_23;
  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationReceived");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userResponseEvaluated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userResponseEvaluated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationReceivedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationReceivedTier1");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ANCSchemaANCClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[ANCSchemaANCNotificationReceived hash](self->_notificationReceived, "hash") ^ v3;
  v5 = -[ANCSchemaANCUserResponseEvaluated hash](self->_userResponseEvaluated, "hash");
  return v4 ^ v5 ^ -[ANCSchemaANCNotificationReceivedTier1 hash](self->_notificationReceivedTier1, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[ANCSchemaANCClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_notificationReceived)
  {
    -[ANCSchemaANCClientEvent notificationReceived](self, "notificationReceived");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("notificationReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("notificationReceived"));

    }
  }
  if (self->_notificationReceivedTier1)
  {
    -[ANCSchemaANCClientEvent notificationReceivedTier1](self, "notificationReceivedTier1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("notificationReceivedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("notificationReceivedTier1"));

    }
  }
  if (self->_userResponseEvaluated)
  {
    -[ANCSchemaANCClientEvent userResponseEvaluated](self, "userResponseEvaluated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userResponseEvaluated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userResponseEvaluated"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ANCSchemaANCClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ANCSchemaANCClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ANCSchemaANCClientEvent *v5;
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
    self = -[ANCSchemaANCClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ANCSchemaANCClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ANCSchemaANCClientEvent *v5;
  void *v6;
  ANCSchemaANCClientEventMetadata *v7;
  void *v8;
  ANCSchemaANCNotificationReceived *v9;
  void *v10;
  ANCSchemaANCUserResponseEvaluated *v11;
  void *v12;
  ANCSchemaANCNotificationReceivedTier1 *v13;
  ANCSchemaANCClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANCSchemaANCClientEvent;
  v5 = -[ANCSchemaANCClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ANCSchemaANCClientEventMetadata initWithDictionary:]([ANCSchemaANCClientEventMetadata alloc], "initWithDictionary:", v6);
      -[ANCSchemaANCClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ANCSchemaANCNotificationReceived initWithDictionary:]([ANCSchemaANCNotificationReceived alloc], "initWithDictionary:", v8);
      -[ANCSchemaANCClientEvent setNotificationReceived:](v5, "setNotificationReceived:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userResponseEvaluated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ANCSchemaANCUserResponseEvaluated initWithDictionary:]([ANCSchemaANCUserResponseEvaluated alloc], "initWithDictionary:", v10);
      -[ANCSchemaANCClientEvent setUserResponseEvaluated:](v5, "setUserResponseEvaluated:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationReceivedTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ANCSchemaANCNotificationReceivedTier1 initWithDictionary:]([ANCSchemaANCNotificationReceivedTier1 alloc], "initWithDictionary:", v12);
      -[ANCSchemaANCClientEvent setNotificationReceivedTier1:](v5, "setNotificationReceivedTier1:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ANCSchemaANCClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasNotificationReceived
{
  return self->_hasNotificationReceived;
}

- (void)setHasNotificationReceived:(BOOL)a3
{
  self->_hasNotificationReceived = a3;
}

- (BOOL)hasUserResponseEvaluated
{
  return self->_hasUserResponseEvaluated;
}

- (void)setHasUserResponseEvaluated:(BOOL)a3
{
  self->_hasUserResponseEvaluated = a3;
}

- (BOOL)hasNotificationReceivedTier1
{
  return self->_hasNotificationReceivedTier1;
}

- (void)setHasNotificationReceivedTier1:(BOOL)a3
{
  self->_hasNotificationReceivedTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationReceivedTier1, 0);
  objc_storeStrong((id *)&self->_userResponseEvaluated, 0);
  objc_storeStrong((id *)&self->_notificationReceived, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 28;
}

@end
