@implementation COMAPPLEPROACTIVEGMSGMSUberEvent

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasTestKey
{
  return self->_testKey != 0;
}

- (BOOL)hasBootSessionUUID
{
  return self->_bootSessionUUID != 0;
}

- (BOOL)hasModelManagerRequestIdentifier
{
  return self->_modelManagerRequestIdentifier != 0;
}

- (BOOL)hasModelManagerSessionIdentifier
{
  return self->_modelManagerSessionIdentifier != 0;
}

- (BOOL)hasInferenceProviderIdentifier
{
  return self->_inferenceProviderIdentifier != 0;
}

- (BOOL)hasUseCaseIdentifier
{
  return self->_useCaseIdentifier != 0;
}

- (BOOL)hasCatalogResourceIdentifier
{
  return self->_catalogResourceIdentifier != 0;
}

- (BOOL)hasClientRequestIdentifier
{
  return self->_clientRequestIdentifier != 0;
}

- (BOOL)hasClientSessionIdentifier
{
  return self->_clientSessionIdentifier != 0;
}

- (void)setThreadQualityOfService:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_threadQualityOfService = a3;
}

- (void)setHasThreadQualityOfService:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasThreadQualityOfService
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E2A41658 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_EVENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_EVENT_TYPE_INFERENCE_EVENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_EVENT_TYPE_ASSET_EVENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_EVENT_TYPE_GENERATIVE_FUNCTION_EVENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GMS_EVENT_TYPE_PREWARM_EVENT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasInferenceEvent
{
  return self->_inferenceEvent != 0;
}

- (BOOL)hasAssetEvent
{
  return self->_assetEvent != 0;
}

- (BOOL)hasGenerativeFunctionEvent
{
  return self->_generativeFunctionEvent != 0;
}

- (BOOL)hasPrewarmEvent
{
  return self->_prewarmEvent != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSUberEvent;
  -[COMAPPLEPROACTIVEGMSGMSUberEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEPROACTIVEGMSGMSUberEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *testKey;
  NSString *bootSessionUUID;
  NSString *modelManagerRequestIdentifier;
  NSString *modelManagerSessionIdentifier;
  NSString *inferenceProviderIdentifier;
  NSString *useCaseIdentifier;
  NSString *catalogResourceIdentifier;
  NSString *clientRequestIdentifier;
  NSString *clientSessionIdentifier;
  char has;
  void *v15;
  uint64_t eventType;
  void *v17;
  COMAPPLEPROACTIVEGMSGMSInferenceEvent *inferenceEvent;
  void *v19;
  COMAPPLEPROACTIVEGMSGMSAssetEvent *assetEvent;
  void *v21;
  COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *generativeFunctionEvent;
  void *v23;
  COMAPPLEPROACTIVEGMSGMSPrewarmEvent *prewarmEvent;
  void *v25;
  COMAPPLEPROACTIVEGMSGMSError *error;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  testKey = self->_testKey;
  if (testKey)
    objc_msgSend(v3, "setObject:forKey:", testKey, CFSTR("testKey"));
  bootSessionUUID = self->_bootSessionUUID;
  if (bootSessionUUID)
    objc_msgSend(v3, "setObject:forKey:", bootSessionUUID, CFSTR("bootSessionUUID"));
  modelManagerRequestIdentifier = self->_modelManagerRequestIdentifier;
  if (modelManagerRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", modelManagerRequestIdentifier, CFSTR("modelManagerRequestIdentifier"));
  modelManagerSessionIdentifier = self->_modelManagerSessionIdentifier;
  if (modelManagerSessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", modelManagerSessionIdentifier, CFSTR("modelManagerSessionIdentifier"));
  inferenceProviderIdentifier = self->_inferenceProviderIdentifier;
  if (inferenceProviderIdentifier)
    objc_msgSend(v3, "setObject:forKey:", inferenceProviderIdentifier, CFSTR("inferenceProviderIdentifier"));
  useCaseIdentifier = self->_useCaseIdentifier;
  if (useCaseIdentifier)
    objc_msgSend(v3, "setObject:forKey:", useCaseIdentifier, CFSTR("useCaseIdentifier"));
  catalogResourceIdentifier = self->_catalogResourceIdentifier;
  if (catalogResourceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", catalogResourceIdentifier, CFSTR("catalogResourceIdentifier"));
  clientRequestIdentifier = self->_clientRequestIdentifier;
  if (clientRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientRequestIdentifier, CFSTR("clientRequestIdentifier"));
  clientSessionIdentifier = self->_clientSessionIdentifier;
  if (clientSessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientSessionIdentifier, CFSTR("clientSessionIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_threadQualityOfService);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("threadQualityOfService"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = *(&off_1E2A41658 + eventType);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("eventType"));

  }
  inferenceEvent = self->_inferenceEvent;
  if (inferenceEvent)
  {
    -[COMAPPLEPROACTIVEGMSGMSInferenceEvent dictionaryRepresentation](inferenceEvent, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("inferenceEvent"));

  }
  assetEvent = self->_assetEvent;
  if (assetEvent)
  {
    -[COMAPPLEPROACTIVEGMSGMSAssetEvent dictionaryRepresentation](assetEvent, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("assetEvent"));

  }
  generativeFunctionEvent = self->_generativeFunctionEvent;
  if (generativeFunctionEvent)
  {
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent dictionaryRepresentation](generativeFunctionEvent, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("generativeFunctionEvent"));

  }
  prewarmEvent = self->_prewarmEvent;
  if (prewarmEvent)
  {
    -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent dictionaryRepresentation](prewarmEvent, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("prewarmEvent"));

  }
  error = self->_error;
  if (error)
  {
    -[COMAPPLEPROACTIVEGMSGMSError dictionaryRepresentation](error, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSUberEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_bootSessionUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_modelManagerRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_modelManagerSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inferenceProviderIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_useCaseIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_catalogResourceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inferenceEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_testKey)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_assetEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_generativeFunctionEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_clientRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_prewarmEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[18] = self->_eventType;
    *((_BYTE *)v4 + 144) |= 4u;
  }
  v5 = v4;
  if (self->_bootSessionUUID)
  {
    objc_msgSend(v4, "setBootSessionUUID:");
    v4 = v5;
  }
  if (self->_modelManagerRequestIdentifier)
  {
    objc_msgSend(v5, "setModelManagerRequestIdentifier:");
    v4 = v5;
  }
  if (self->_modelManagerSessionIdentifier)
  {
    objc_msgSend(v5, "setModelManagerSessionIdentifier:");
    v4 = v5;
  }
  if (self->_inferenceProviderIdentifier)
  {
    objc_msgSend(v5, "setInferenceProviderIdentifier:");
    v4 = v5;
  }
  if (self->_useCaseIdentifier)
  {
    objc_msgSend(v5, "setUseCaseIdentifier:");
    v4 = v5;
  }
  if (self->_catalogResourceIdentifier)
  {
    objc_msgSend(v5, "setCatalogResourceIdentifier:");
    v4 = v5;
  }
  if (self->_inferenceEvent)
  {
    objc_msgSend(v5, "setInferenceEvent:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_version;
    *((_BYTE *)v4 + 144) |= 2u;
  }
  if (self->_testKey)
  {
    objc_msgSend(v5, "setTestKey:");
    v4 = v5;
  }
  if (self->_assetEvent)
  {
    objc_msgSend(v5, "setAssetEvent:");
    v4 = v5;
  }
  if (self->_generativeFunctionEvent)
  {
    objc_msgSend(v5, "setGenerativeFunctionEvent:");
    v4 = v5;
  }
  if (self->_clientRequestIdentifier)
  {
    objc_msgSend(v5, "setClientRequestIdentifier:");
    v4 = v5;
  }
  if (self->_clientSessionIdentifier)
  {
    objc_msgSend(v5, "setClientSessionIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_threadQualityOfService;
    *((_BYTE *)v4 + 144) |= 1u;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }
  if (self->_prewarmEvent)
  {
    objc_msgSend(v5, "setPrewarmEvent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_eventType;
    *(_BYTE *)(v5 + 144) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_bootSessionUUID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSString copyWithZone:](self->_modelManagerRequestIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v9;

  v11 = -[NSString copyWithZone:](self->_modelManagerSessionIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v11;

  v13 = -[NSString copyWithZone:](self->_inferenceProviderIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v13;

  v15 = -[NSString copyWithZone:](self->_useCaseIdentifier, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v15;

  v17 = -[NSString copyWithZone:](self->_catalogResourceIdentifier, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v17;

  v19 = -[COMAPPLEPROACTIVEGMSGMSInferenceEvent copyWithZone:](self->_inferenceEvent, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v19;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_version;
    *(_BYTE *)(v6 + 144) |= 2u;
  }
  v21 = -[NSString copyWithZone:](self->_testKey, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v21;

  v23 = -[COMAPPLEPROACTIVEGMSGMSAssetEvent copyWithZone:](self->_assetEvent, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v23;

  v25 = -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent copyWithZone:](self->_generativeFunctionEvent, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v25;

  v27 = -[NSString copyWithZone:](self->_clientRequestIdentifier, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v27;

  v29 = -[NSString copyWithZone:](self->_clientSessionIdentifier, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v29;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_threadQualityOfService;
    *(_BYTE *)(v6 + 144) |= 1u;
  }
  v31 = -[COMAPPLEPROACTIVEGMSGMSError copyWithZone:](self->_error, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v31;

  v33 = -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent copyWithZone:](self->_prewarmEvent, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v33;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bootSessionUUID;
  NSString *modelManagerRequestIdentifier;
  NSString *modelManagerSessionIdentifier;
  NSString *inferenceProviderIdentifier;
  NSString *useCaseIdentifier;
  NSString *catalogResourceIdentifier;
  COMAPPLEPROACTIVEGMSGMSInferenceEvent *inferenceEvent;
  NSString *testKey;
  COMAPPLEPROACTIVEGMSGMSAssetEvent *assetEvent;
  COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *generativeFunctionEvent;
  NSString *clientRequestIdentifier;
  NSString *clientSessionIdentifier;
  COMAPPLEPROACTIVEGMSGMSError *error;
  COMAPPLEPROACTIVEGMSGMSPrewarmEvent *prewarmEvent;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 18))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 144) & 4) != 0)
  {
LABEL_45:
    v19 = 0;
    goto LABEL_46;
  }
  bootSessionUUID = self->_bootSessionUUID;
  if ((unint64_t)bootSessionUUID | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](bootSessionUUID, "isEqual:"))
  {
    goto LABEL_45;
  }
  modelManagerRequestIdentifier = self->_modelManagerRequestIdentifier;
  if ((unint64_t)modelManagerRequestIdentifier | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](modelManagerRequestIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  modelManagerSessionIdentifier = self->_modelManagerSessionIdentifier;
  if ((unint64_t)modelManagerSessionIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](modelManagerSessionIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  inferenceProviderIdentifier = self->_inferenceProviderIdentifier;
  if ((unint64_t)inferenceProviderIdentifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](inferenceProviderIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  useCaseIdentifier = self->_useCaseIdentifier;
  if ((unint64_t)useCaseIdentifier | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](useCaseIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  catalogResourceIdentifier = self->_catalogResourceIdentifier;
  if ((unint64_t)catalogResourceIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](catalogResourceIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  inferenceEvent = self->_inferenceEvent;
  if ((unint64_t)inferenceEvent | *((_QWORD *)v4 + 11))
  {
    if (!-[COMAPPLEPROACTIVEGMSGMSInferenceEvent isEqual:](inferenceEvent, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 2) == 0 || self->_version != *((_QWORD *)v4 + 2))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
    goto LABEL_45;
  }
  testKey = self->_testKey;
  if ((unint64_t)testKey | *((_QWORD *)v4 + 16) && !-[NSString isEqual:](testKey, "isEqual:"))
    goto LABEL_45;
  assetEvent = self->_assetEvent;
  if ((unint64_t)assetEvent | *((_QWORD *)v4 + 3))
  {
    if (!-[COMAPPLEPROACTIVEGMSGMSAssetEvent isEqual:](assetEvent, "isEqual:"))
      goto LABEL_45;
  }
  generativeFunctionEvent = self->_generativeFunctionEvent;
  if ((unint64_t)generativeFunctionEvent | *((_QWORD *)v4 + 10))
  {
    if (!-[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent isEqual:](generativeFunctionEvent, "isEqual:"))
      goto LABEL_45;
  }
  clientRequestIdentifier = self->_clientRequestIdentifier;
  if ((unint64_t)clientRequestIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](clientRequestIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  clientSessionIdentifier = self->_clientSessionIdentifier;
  if ((unint64_t)clientSessionIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](clientSessionIdentifier, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 1) == 0 || self->_threadQualityOfService != *((_QWORD *)v4 + 1))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
    goto LABEL_45;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 8) && !-[COMAPPLEPROACTIVEGMSGMSError isEqual:](error, "isEqual:"))
    goto LABEL_45;
  prewarmEvent = self->_prewarmEvent;
  if ((unint64_t)prewarmEvent | *((_QWORD *)v4 + 15))
    v19 = -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent isEqual:](prewarmEvent, "isEqual:");
  else
    v19 = 1;
LABEL_46:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_eventType;
  else
    v19 = 0;
  v18 = -[NSString hash](self->_bootSessionUUID, "hash");
  v17 = -[NSString hash](self->_modelManagerRequestIdentifier, "hash");
  v16 = -[NSString hash](self->_modelManagerSessionIdentifier, "hash");
  v15 = -[NSString hash](self->_inferenceProviderIdentifier, "hash");
  v14 = -[NSString hash](self->_useCaseIdentifier, "hash");
  v3 = -[NSString hash](self->_catalogResourceIdentifier, "hash");
  v4 = -[COMAPPLEPROACTIVEGMSGMSInferenceEvent hash](self->_inferenceEvent, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_version;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_testKey, "hash");
  v7 = -[COMAPPLEPROACTIVEGMSGMSAssetEvent hash](self->_assetEvent, "hash");
  v8 = -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent hash](self->_generativeFunctionEvent, "hash");
  v9 = -[NSString hash](self->_clientRequestIdentifier, "hash");
  v10 = -[NSString hash](self->_clientSessionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_threadQualityOfService;
  else
    v11 = 0;
  v12 = v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[COMAPPLEPROACTIVEGMSGMSError hash](self->_error, "hash");
  return v12 ^ -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent hash](self->_prewarmEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  COMAPPLEPROACTIVEGMSGMSInferenceEvent *inferenceEvent;
  uint64_t v7;
  COMAPPLEPROACTIVEGMSGMSAssetEvent *assetEvent;
  uint64_t v9;
  COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *generativeFunctionEvent;
  uint64_t v11;
  COMAPPLEPROACTIVEGMSGMSError *error;
  uint64_t v13;
  COMAPPLEPROACTIVEGMSGMSPrewarmEvent *prewarmEvent;
  uint64_t v15;
  _DWORD *v16;

  v4 = a3;
  v5 = v4;
  if ((v4[36] & 4) != 0)
  {
    self->_eventType = v4[18];
    *(_BYTE *)&self->_has |= 4u;
  }
  v16 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setBootSessionUUID:](self, "setBootSessionUUID:");
    v5 = v16;
  }
  if (v5[13])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setModelManagerRequestIdentifier:](self, "setModelManagerRequestIdentifier:");
    v5 = v16;
  }
  if (v5[14])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setModelManagerSessionIdentifier:](self, "setModelManagerSessionIdentifier:");
    v5 = v16;
  }
  if (v5[12])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setInferenceProviderIdentifier:](self, "setInferenceProviderIdentifier:");
    v5 = v16;
  }
  if (v5[17])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setUseCaseIdentifier:](self, "setUseCaseIdentifier:");
    v5 = v16;
  }
  if (v5[5])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setCatalogResourceIdentifier:](self, "setCatalogResourceIdentifier:");
    v5 = v16;
  }
  inferenceEvent = self->_inferenceEvent;
  v7 = v5[11];
  if (inferenceEvent)
  {
    if (!v7)
      goto LABEL_21;
    -[COMAPPLEPROACTIVEGMSGMSInferenceEvent mergeFrom:](inferenceEvent, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_21;
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setInferenceEvent:](self, "setInferenceEvent:");
  }
  v5 = v16;
LABEL_21:
  if ((v5[18] & 2) != 0)
  {
    self->_version = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v5[16])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setTestKey:](self, "setTestKey:");
    v5 = v16;
  }
  assetEvent = self->_assetEvent;
  v9 = v5[3];
  if (assetEvent)
  {
    if (!v9)
      goto LABEL_31;
    -[COMAPPLEPROACTIVEGMSGMSAssetEvent mergeFrom:](assetEvent, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_31;
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setAssetEvent:](self, "setAssetEvent:");
  }
  v5 = v16;
LABEL_31:
  generativeFunctionEvent = self->_generativeFunctionEvent;
  v11 = v5[10];
  if (generativeFunctionEvent)
  {
    if (!v11)
      goto LABEL_37;
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent mergeFrom:](generativeFunctionEvent, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_37;
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setGenerativeFunctionEvent:](self, "setGenerativeFunctionEvent:");
  }
  v5 = v16;
LABEL_37:
  if (v5[6])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setClientRequestIdentifier:](self, "setClientRequestIdentifier:");
    v5 = v16;
  }
  if (v5[7])
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setClientSessionIdentifier:](self, "setClientSessionIdentifier:");
    v5 = v16;
  }
  if ((v5[18] & 1) != 0)
  {
    self->_threadQualityOfService = v5[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  error = self->_error;
  v13 = v5[8];
  if (error)
  {
    if (!v13)
      goto LABEL_49;
    -[COMAPPLEPROACTIVEGMSGMSError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_49;
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setError:](self, "setError:");
  }
  v5 = v16;
LABEL_49:
  prewarmEvent = self->_prewarmEvent;
  v15 = v5[15];
  if (prewarmEvent)
  {
    if (v15)
    {
      -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent mergeFrom:](prewarmEvent, "mergeFrom:");
LABEL_54:
      v5 = v16;
    }
  }
  else if (v15)
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setPrewarmEvent:](self, "setPrewarmEvent:");
    goto LABEL_54;
  }

}

- (int64_t)version
{
  return self->_version;
}

- (NSString)testKey
{
  return self->_testKey;
}

- (void)setTestKey:(id)a3
{
  objc_storeStrong((id *)&self->_testKey, a3);
}

- (NSString)bootSessionUUID
{
  return self->_bootSessionUUID;
}

- (void)setBootSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bootSessionUUID, a3);
}

- (NSString)modelManagerRequestIdentifier
{
  return self->_modelManagerRequestIdentifier;
}

- (void)setModelManagerRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modelManagerRequestIdentifier, a3);
}

- (NSString)modelManagerSessionIdentifier
{
  return self->_modelManagerSessionIdentifier;
}

- (void)setModelManagerSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modelManagerSessionIdentifier, a3);
}

- (NSString)inferenceProviderIdentifier
{
  return self->_inferenceProviderIdentifier;
}

- (void)setInferenceProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceProviderIdentifier, a3);
}

- (NSString)useCaseIdentifier
{
  return self->_useCaseIdentifier;
}

- (void)setUseCaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_useCaseIdentifier, a3);
}

- (NSString)catalogResourceIdentifier
{
  return self->_catalogResourceIdentifier;
}

- (void)setCatalogResourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_catalogResourceIdentifier, a3);
}

- (NSString)clientRequestIdentifier
{
  return self->_clientRequestIdentifier;
}

- (void)setClientRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientRequestIdentifier, a3);
}

- (NSString)clientSessionIdentifier
{
  return self->_clientSessionIdentifier;
}

- (void)setClientSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientSessionIdentifier, a3);
}

- (int64_t)threadQualityOfService
{
  return self->_threadQualityOfService;
}

- (COMAPPLEPROACTIVEGMSGMSInferenceEvent)inferenceEvent
{
  return self->_inferenceEvent;
}

- (void)setInferenceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceEvent, a3);
}

- (COMAPPLEPROACTIVEGMSGMSAssetEvent)assetEvent
{
  return self->_assetEvent;
}

- (void)setAssetEvent:(id)a3
{
  objc_storeStrong((id *)&self->_assetEvent, a3);
}

- (COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent)generativeFunctionEvent
{
  return self->_generativeFunctionEvent;
}

- (void)setGenerativeFunctionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_generativeFunctionEvent, a3);
}

- (COMAPPLEPROACTIVEGMSGMSPrewarmEvent)prewarmEvent
{
  return self->_prewarmEvent;
}

- (void)setPrewarmEvent:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmEvent, a3);
}

- (COMAPPLEPROACTIVEGMSGMSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCaseIdentifier, 0);
  objc_storeStrong((id *)&self->_testKey, 0);
  objc_storeStrong((id *)&self->_prewarmEvent, 0);
  objc_storeStrong((id *)&self->_modelManagerSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_modelManagerRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inferenceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_inferenceEvent, 0);
  objc_storeStrong((id *)&self->_generativeFunctionEvent, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clientSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_catalogResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_bootSessionUUID, 0);
  objc_storeStrong((id *)&self->_assetEvent, 0);
}

@end
