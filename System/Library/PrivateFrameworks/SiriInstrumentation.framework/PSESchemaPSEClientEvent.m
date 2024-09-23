@implementation PSESchemaPSEClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalLastRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (int)componentName
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalLastRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "value"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PSESchemaPSEClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PSESchemaPSEClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PSESchemaPSEClientEvent deleteGenericSignalGenerated](self, "deleteGenericSignalGenerated");
  -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PSESchemaPSEClientEvent deleteCallSignalGenerated](self, "deleteCallSignalGenerated");
  -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PSESchemaPSEClientEvent deleteMessageSignalGenerated](self, "deleteMessageSignalGenerated");
  -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PSESchemaPSEClientEvent deleteMediaSignalGenerated](self, "deleteMediaSignalGenerated");
  -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PSESchemaPSEClientEvent deleteHomeFollowupSignalGenerated](self, "deleteHomeFollowupSignalGenerated");
  -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PSESchemaPSEClientEvent deleteMapsSignalGenerated](self, "deleteMapsSignalGenerated");
  -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PSESchemaPSEClientEvent deleteAlarmSignalGenerated](self, "deleteAlarmSignalGenerated");
  -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PSESchemaPSEClientEvent deleteAppIntentSignalGenerated](self, "deleteAppIntentSignalGenerated");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PSESchemaPSEClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 7)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AA48[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7)
    return 0;
  else
    return off_1E562AA88[a3 - 101];
}

- (int)clockIsolationLevel
{
  if (-[PSESchemaPSEClientEvent whichEvent_Type](self, "whichEvent_Type") - 101 >= 8)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PSESchemaPSEClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 7)
    return CFSTR("com.apple.aiml.engagement.pse.PSEClientEvent");
  else
    return off_1E5638DA8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PSESchemaPSEClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setGenericSignalGenerated:(id)a3
{
  PSESchemaPSEGenericSignalGenerated *v4;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;

  v4 = (PSESchemaPSEGenericSignalGenerated *)a3;
  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 101;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = v4;

}

- (PSESchemaPSEGenericSignalGenerated)genericSignalGenerated
{
  if (self->_whichEvent_Type == 101)
    return self->_genericSignalGenerated;
  else
    return (PSESchemaPSEGenericSignalGenerated *)0;
}

- (void)deleteGenericSignalGenerated
{
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    genericSignalGenerated = self->_genericSignalGenerated;
    self->_genericSignalGenerated = 0;

  }
}

- (void)setCallSignalGenerated:(id)a3
{
  PSESchemaPSECallSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;

  v4 = (PSESchemaPSECallSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 102;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = v4;

}

- (PSESchemaPSECallSignalGenerated)callSignalGenerated
{
  if (self->_whichEvent_Type == 102)
    return self->_callSignalGenerated;
  else
    return (PSESchemaPSECallSignalGenerated *)0;
}

- (void)deleteCallSignalGenerated
{
  PSESchemaPSECallSignalGenerated *callSignalGenerated;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    callSignalGenerated = self->_callSignalGenerated;
    self->_callSignalGenerated = 0;

  }
}

- (void)setMessageSignalGenerated:(id)a3
{
  PSESchemaPSEMessageSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;

  v4 = (PSESchemaPSEMessageSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 103;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = v4;

}

- (PSESchemaPSEMessageSignalGenerated)messageSignalGenerated
{
  if (self->_whichEvent_Type == 103)
    return self->_messageSignalGenerated;
  else
    return (PSESchemaPSEMessageSignalGenerated *)0;
}

- (void)deleteMessageSignalGenerated
{
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    messageSignalGenerated = self->_messageSignalGenerated;
    self->_messageSignalGenerated = 0;

  }
}

- (void)setMediaSignalGenerated:(id)a3
{
  PSESchemaPSEMediaSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;

  v4 = (PSESchemaPSEMediaSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 104;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = v4;

}

- (PSESchemaPSEMediaSignalGenerated)mediaSignalGenerated
{
  if (self->_whichEvent_Type == 104)
    return self->_mediaSignalGenerated;
  else
    return (PSESchemaPSEMediaSignalGenerated *)0;
}

- (void)deleteMediaSignalGenerated
{
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    mediaSignalGenerated = self->_mediaSignalGenerated;
    self->_mediaSignalGenerated = 0;

  }
}

- (void)setHomeFollowupSignalGenerated:(id)a3
{
  PSESchemaPSEHomeFollowupSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;

  v4 = (PSESchemaPSEHomeFollowupSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 105;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = v4;

}

- (PSESchemaPSEHomeFollowupSignalGenerated)homeFollowupSignalGenerated
{
  if (self->_whichEvent_Type == 105)
    return self->_homeFollowupSignalGenerated;
  else
    return (PSESchemaPSEHomeFollowupSignalGenerated *)0;
}

- (void)deleteHomeFollowupSignalGenerated
{
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
    self->_homeFollowupSignalGenerated = 0;

  }
}

- (void)setMapsSignalGenerated:(id)a3
{
  PSESchemaPSEMapsSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;

  v4 = (PSESchemaPSEMapsSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 106;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = v4;

}

- (PSESchemaPSEMapsSignalGenerated)mapsSignalGenerated
{
  if (self->_whichEvent_Type == 106)
    return self->_mapsSignalGenerated;
  else
    return (PSESchemaPSEMapsSignalGenerated *)0;
}

- (void)deleteMapsSignalGenerated
{
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    mapsSignalGenerated = self->_mapsSignalGenerated;
    self->_mapsSignalGenerated = 0;

  }
}

- (void)setAlarmSignalGenerated:(id)a3
{
  PSESchemaPSEAlarmSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;
  unint64_t v12;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;

  v4 = (PSESchemaPSEAlarmSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = 0;

  v12 = 107;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = v4;

}

- (PSESchemaPSEAlarmSignalGenerated)alarmSignalGenerated
{
  if (self->_whichEvent_Type == 107)
    return self->_alarmSignalGenerated;
  else
    return (PSESchemaPSEAlarmSignalGenerated *)0;
}

- (void)deleteAlarmSignalGenerated
{
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    alarmSignalGenerated = self->_alarmSignalGenerated;
    self->_alarmSignalGenerated = 0;

  }
}

- (void)setAppIntentSignalGenerated:(id)a3
{
  PSESchemaPSEAppIntentSignalGenerated *v4;
  PSESchemaPSEGenericSignalGenerated *genericSignalGenerated;
  PSESchemaPSECallSignalGenerated *callSignalGenerated;
  PSESchemaPSEMessageSignalGenerated *messageSignalGenerated;
  PSESchemaPSEMediaSignalGenerated *mediaSignalGenerated;
  PSESchemaPSEHomeFollowupSignalGenerated *homeFollowupSignalGenerated;
  PSESchemaPSEMapsSignalGenerated *mapsSignalGenerated;
  PSESchemaPSEAlarmSignalGenerated *alarmSignalGenerated;
  unint64_t v12;
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;

  v4 = (PSESchemaPSEAppIntentSignalGenerated *)a3;
  genericSignalGenerated = self->_genericSignalGenerated;
  self->_genericSignalGenerated = 0;

  callSignalGenerated = self->_callSignalGenerated;
  self->_callSignalGenerated = 0;

  messageSignalGenerated = self->_messageSignalGenerated;
  self->_messageSignalGenerated = 0;

  mediaSignalGenerated = self->_mediaSignalGenerated;
  self->_mediaSignalGenerated = 0;

  homeFollowupSignalGenerated = self->_homeFollowupSignalGenerated;
  self->_homeFollowupSignalGenerated = 0;

  mapsSignalGenerated = self->_mapsSignalGenerated;
  self->_mapsSignalGenerated = 0;

  alarmSignalGenerated = self->_alarmSignalGenerated;
  self->_alarmSignalGenerated = 0;

  v12 = 108;
  if (!v4)
    v12 = 0;
  self->_whichEvent_Type = v12;
  appIntentSignalGenerated = self->_appIntentSignalGenerated;
  self->_appIntentSignalGenerated = v4;

}

- (PSESchemaPSEAppIntentSignalGenerated)appIntentSignalGenerated
{
  if (self->_whichEvent_Type == 108)
    return self->_appIntentSignalGenerated;
  else
    return (PSESchemaPSEAppIntentSignalGenerated *)0;
}

- (void)deleteAppIntentSignalGenerated
{
  PSESchemaPSEAppIntentSignalGenerated *appIntentSignalGenerated;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    appIntentSignalGenerated = self->_appIntentSignalGenerated;
    self->_appIntentSignalGenerated = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEClientEventReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_48;
  -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "genericSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "genericSignalGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callSignalGenerated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageSignalGenerated");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSignalGenerated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeFollowupSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeFollowupSignalGenerated");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsSignalGenerated");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_47;
  -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmSignalGenerated");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_48;
  }
  else
  {

  }
  -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIntentSignalGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_51:
      v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIntentSignalGenerated");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_51;
  }
  else
  {
LABEL_47:

  }
LABEL_48:
  v53 = 0;
LABEL_49:

  return v53;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[PSESchemaPSEClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PSESchemaPSEGenericSignalGenerated hash](self->_genericSignalGenerated, "hash") ^ v3;
  v5 = -[PSESchemaPSECallSignalGenerated hash](self->_callSignalGenerated, "hash");
  v6 = v4 ^ v5 ^ -[PSESchemaPSEMessageSignalGenerated hash](self->_messageSignalGenerated, "hash");
  v7 = -[PSESchemaPSEMediaSignalGenerated hash](self->_mediaSignalGenerated, "hash");
  v8 = v7 ^ -[PSESchemaPSEHomeFollowupSignalGenerated hash](self->_homeFollowupSignalGenerated, "hash");
  v9 = v6 ^ v8 ^ -[PSESchemaPSEMapsSignalGenerated hash](self->_mapsSignalGenerated, "hash");
  v10 = -[PSESchemaPSEAlarmSignalGenerated hash](self->_alarmSignalGenerated, "hash");
  return v9 ^ v10 ^ -[PSESchemaPSEAppIntentSignalGenerated hash](self->_appIntentSignalGenerated, "hash");
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alarmSignalGenerated)
  {
    -[PSESchemaPSEClientEvent alarmSignalGenerated](self, "alarmSignalGenerated");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alarmSignalGenerated"));

    }
  }
  if (self->_appIntentSignalGenerated)
  {
    -[PSESchemaPSEClientEvent appIntentSignalGenerated](self, "appIntentSignalGenerated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appIntentSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appIntentSignalGenerated"));

    }
  }
  if (self->_callSignalGenerated)
  {
    -[PSESchemaPSEClientEvent callSignalGenerated](self, "callSignalGenerated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("callSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("callSignalGenerated"));

    }
  }
  if (self->_eventMetadata)
  {
    -[PSESchemaPSEClientEvent eventMetadata](self, "eventMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("eventMetadata"));

    }
  }
  if (self->_genericSignalGenerated)
  {
    -[PSESchemaPSEClientEvent genericSignalGenerated](self, "genericSignalGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("genericSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("genericSignalGenerated"));

    }
  }
  if (self->_homeFollowupSignalGenerated)
  {
    -[PSESchemaPSEClientEvent homeFollowupSignalGenerated](self, "homeFollowupSignalGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("homeFollowupSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("homeFollowupSignalGenerated"));

    }
  }
  if (self->_mapsSignalGenerated)
  {
    -[PSESchemaPSEClientEvent mapsSignalGenerated](self, "mapsSignalGenerated");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("mapsSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("mapsSignalGenerated"));

    }
  }
  if (self->_mediaSignalGenerated)
  {
    -[PSESchemaPSEClientEvent mediaSignalGenerated](self, "mediaSignalGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("mediaSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("mediaSignalGenerated"));

    }
  }
  if (self->_messageSignalGenerated)
  {
    -[PSESchemaPSEClientEvent messageSignalGenerated](self, "messageSignalGenerated");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("messageSignalGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("messageSignalGenerated"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEClientEvent)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEClientEvent *v5;
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
    self = -[PSESchemaPSEClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEClientEvent)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEClientEvent *v5;
  uint64_t v6;
  PSESchemaPSEClientEventMetadata *v7;
  uint64_t v8;
  PSESchemaPSEGenericSignalGenerated *v9;
  void *v10;
  PSESchemaPSECallSignalGenerated *v11;
  void *v12;
  PSESchemaPSEMessageSignalGenerated *v13;
  void *v14;
  PSESchemaPSEMediaSignalGenerated *v15;
  void *v16;
  PSESchemaPSEHomeFollowupSignalGenerated *v17;
  void *v18;
  PSESchemaPSEMapsSignalGenerated *v19;
  void *v20;
  PSESchemaPSEAlarmSignalGenerated *v21;
  void *v22;
  PSESchemaPSEAppIntentSignalGenerated *v23;
  PSESchemaPSEClientEvent *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PSESchemaPSEClientEvent;
  v5 = -[PSESchemaPSEClientEvent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PSESchemaPSEClientEventMetadata initWithDictionary:]([PSESchemaPSEClientEventMetadata alloc], "initWithDictionary:", v6);
      -[PSESchemaPSEClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    v27 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("genericSignalGenerated"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PSESchemaPSEGenericSignalGenerated initWithDictionary:]([PSESchemaPSEGenericSignalGenerated alloc], "initWithDictionary:", v8);
      -[PSESchemaPSEClientEvent setGenericSignalGenerated:](v5, "setGenericSignalGenerated:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callSignalGenerated"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PSESchemaPSECallSignalGenerated initWithDictionary:]([PSESchemaPSECallSignalGenerated alloc], "initWithDictionary:", v10);
      -[PSESchemaPSEClientEvent setCallSignalGenerated:](v5, "setCallSignalGenerated:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageSignalGenerated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PSESchemaPSEMessageSignalGenerated initWithDictionary:]([PSESchemaPSEMessageSignalGenerated alloc], "initWithDictionary:", v12);
      -[PSESchemaPSEClientEvent setMessageSignalGenerated:](v5, "setMessageSignalGenerated:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaSignalGenerated"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PSESchemaPSEMediaSignalGenerated initWithDictionary:]([PSESchemaPSEMediaSignalGenerated alloc], "initWithDictionary:", v14);
      -[PSESchemaPSEClientEvent setMediaSignalGenerated:](v5, "setMediaSignalGenerated:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeFollowupSignalGenerated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PSESchemaPSEHomeFollowupSignalGenerated initWithDictionary:]([PSESchemaPSEHomeFollowupSignalGenerated alloc], "initWithDictionary:", v16);
      -[PSESchemaPSEClientEvent setHomeFollowupSignalGenerated:](v5, "setHomeFollowupSignalGenerated:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsSignalGenerated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PSESchemaPSEMapsSignalGenerated initWithDictionary:]([PSESchemaPSEMapsSignalGenerated alloc], "initWithDictionary:", v18);
      -[PSESchemaPSEClientEvent setMapsSignalGenerated:](v5, "setMapsSignalGenerated:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmSignalGenerated"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PSESchemaPSEAlarmSignalGenerated initWithDictionary:]([PSESchemaPSEAlarmSignalGenerated alloc], "initWithDictionary:", v20);
      -[PSESchemaPSEClientEvent setAlarmSignalGenerated:](v5, "setAlarmSignalGenerated:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIntentSignalGenerated"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PSESchemaPSEAppIntentSignalGenerated initWithDictionary:]([PSESchemaPSEAppIntentSignalGenerated alloc], "initWithDictionary:", v22);
      -[PSESchemaPSEClientEvent setAppIntentSignalGenerated:](v5, "setAppIntentSignalGenerated:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PSESchemaPSEClientEventMetadata)eventMetadata
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

- (BOOL)hasGenericSignalGenerated
{
  return self->_hasGenericSignalGenerated;
}

- (void)setHasGenericSignalGenerated:(BOOL)a3
{
  self->_hasGenericSignalGenerated = a3;
}

- (BOOL)hasCallSignalGenerated
{
  return self->_hasCallSignalGenerated;
}

- (void)setHasCallSignalGenerated:(BOOL)a3
{
  self->_hasCallSignalGenerated = a3;
}

- (BOOL)hasMessageSignalGenerated
{
  return self->_hasMessageSignalGenerated;
}

- (void)setHasMessageSignalGenerated:(BOOL)a3
{
  self->_hasMessageSignalGenerated = a3;
}

- (BOOL)hasMediaSignalGenerated
{
  return self->_hasMediaSignalGenerated;
}

- (void)setHasMediaSignalGenerated:(BOOL)a3
{
  self->_hasMediaSignalGenerated = a3;
}

- (BOOL)hasHomeFollowupSignalGenerated
{
  return self->_hasHomeFollowupSignalGenerated;
}

- (void)setHasHomeFollowupSignalGenerated:(BOOL)a3
{
  self->_hasHomeFollowupSignalGenerated = a3;
}

- (BOOL)hasMapsSignalGenerated
{
  return self->_hasMapsSignalGenerated;
}

- (void)setHasMapsSignalGenerated:(BOOL)a3
{
  self->_hasMapsSignalGenerated = a3;
}

- (BOOL)hasAlarmSignalGenerated
{
  return self->_hasAlarmSignalGenerated;
}

- (void)setHasAlarmSignalGenerated:(BOOL)a3
{
  self->_hasAlarmSignalGenerated = a3;
}

- (BOOL)hasAppIntentSignalGenerated
{
  return self->_hasAppIntentSignalGenerated;
}

- (void)setHasAppIntentSignalGenerated:(BOOL)a3
{
  self->_hasAppIntentSignalGenerated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIntentSignalGenerated, 0);
  objc_storeStrong((id *)&self->_alarmSignalGenerated, 0);
  objc_storeStrong((id *)&self->_mapsSignalGenerated, 0);
  objc_storeStrong((id *)&self->_homeFollowupSignalGenerated, 0);
  objc_storeStrong((id *)&self->_mediaSignalGenerated, 0);
  objc_storeStrong((id *)&self->_messageSignalGenerated, 0);
  objc_storeStrong((id *)&self->_callSignalGenerated, 0);
  objc_storeStrong((id *)&self->_genericSignalGenerated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 65;
}

@end
