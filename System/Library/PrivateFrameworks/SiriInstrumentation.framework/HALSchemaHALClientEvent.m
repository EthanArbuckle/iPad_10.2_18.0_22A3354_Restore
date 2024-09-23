@implementation HALSchemaHALClientEvent

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

  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "halId");
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
  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
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

  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "halId");
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
    v9 = 17;
  }
  else
  {
LABEL_5:
    -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
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
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HALSchemaHALClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v31, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[HALSchemaHALClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[HALSchemaHALClientEvent deleteCrossDeviceCommandContext](self, "deleteCrossDeviceCommandContext");
  -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[HALSchemaHALClientEvent deleteLocalFetchContext](self, "deleteLocalFetchContext");
  -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[HALSchemaHALClientEvent deleteContextCollectorFetchContext](self, "deleteContextCollectorFetchContext");
  -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[HALSchemaHALClientEvent deleteForceFetchContext](self, "deleteForceFetchContext");
  -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[HALSchemaHALClientEvent deleteCompanionDeviceDiscoveryContext](self, "deleteCompanionDeviceDiscoveryContext");
  -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[HALSchemaHALClientEvent deleteCompanionDeviceCommunicationContext](self, "deleteCompanionDeviceCommunicationContext");
  -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[HALSchemaHALClientEvent deleteNearbyPersonalDevicesReported](self, "deleteNearbyPersonalDevicesReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[HALSchemaHALClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 6)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629678[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return 0;
  else
    return off_1E56296B0[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[HALSchemaHALClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 6)
    return CFSTR("com.apple.aiml.siri.hal.HALClientEvent");
  else
    return off_1E562F430[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[HALSchemaHALClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setCrossDeviceCommandContext:(id)a3
{
  HALSchemaHALCrossDeviceCommandExecutionContext *v4;
  HALSchemaHALLocalFetchContext *localFetchContext;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;
  HALSchemaHALForceFetchContext *forceFetchContext;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;

  v4 = (HALSchemaHALCrossDeviceCommandExecutionContext *)a3;
  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = v4;

}

- (HALSchemaHALCrossDeviceCommandExecutionContext)crossDeviceCommandContext
{
  if (self->_whichEvent_Type == 2)
    return self->_crossDeviceCommandContext;
  else
    return (HALSchemaHALCrossDeviceCommandExecutionContext *)0;
}

- (void)deleteCrossDeviceCommandContext
{
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    crossDeviceCommandContext = self->_crossDeviceCommandContext;
    self->_crossDeviceCommandContext = 0;

  }
}

- (void)setLocalFetchContext:(id)a3
{
  HALSchemaHALLocalFetchContext *v4;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;
  HALSchemaHALForceFetchContext *forceFetchContext;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;
  unint64_t v11;
  HALSchemaHALLocalFetchContext *localFetchContext;

  v4 = (HALSchemaHALLocalFetchContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  v11 = 3;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = v4;

}

- (HALSchemaHALLocalFetchContext)localFetchContext
{
  if (self->_whichEvent_Type == 3)
    return self->_localFetchContext;
  else
    return (HALSchemaHALLocalFetchContext *)0;
}

- (void)deleteLocalFetchContext
{
  HALSchemaHALLocalFetchContext *localFetchContext;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    localFetchContext = self->_localFetchContext;
    self->_localFetchContext = 0;

  }
}

- (void)setContextCollectorFetchContext:(id)a3
{
  HALSchemaHALContextCollectorFetchContext *v4;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;
  HALSchemaHALLocalFetchContext *localFetchContext;
  HALSchemaHALForceFetchContext *forceFetchContext;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;

  v4 = (HALSchemaHALContextCollectorFetchContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = v4;

}

- (HALSchemaHALContextCollectorFetchContext)contextCollectorFetchContext
{
  if (self->_whichEvent_Type == 4)
    return self->_contextCollectorFetchContext;
  else
    return (HALSchemaHALContextCollectorFetchContext *)0;
}

- (void)deleteContextCollectorFetchContext
{
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    contextCollectorFetchContext = self->_contextCollectorFetchContext;
    self->_contextCollectorFetchContext = 0;

  }
}

- (void)setForceFetchContext:(id)a3
{
  HALSchemaHALForceFetchContext *v4;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;
  HALSchemaHALLocalFetchContext *localFetchContext;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;
  unint64_t v11;
  HALSchemaHALForceFetchContext *forceFetchContext;

  v4 = (HALSchemaHALForceFetchContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  v11 = 5;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = v4;

}

- (HALSchemaHALForceFetchContext)forceFetchContext
{
  if (self->_whichEvent_Type == 5)
    return self->_forceFetchContext;
  else
    return (HALSchemaHALForceFetchContext *)0;
}

- (void)deleteForceFetchContext
{
  HALSchemaHALForceFetchContext *forceFetchContext;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    forceFetchContext = self->_forceFetchContext;
    self->_forceFetchContext = 0;

  }
}

- (void)setCompanionDeviceDiscoveryContext:(id)a3
{
  HALSchemaHALCompanionDeviceDiscoveryContext *v4;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;
  HALSchemaHALLocalFetchContext *localFetchContext;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;
  HALSchemaHALForceFetchContext *forceFetchContext;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;
  unint64_t v11;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;

  v4 = (HALSchemaHALCompanionDeviceDiscoveryContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  v11 = 6;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = v4;

}

- (HALSchemaHALCompanionDeviceDiscoveryContext)companionDeviceDiscoveryContext
{
  if (self->_whichEvent_Type == 6)
    return self->_companionDeviceDiscoveryContext;
  else
    return (HALSchemaHALCompanionDeviceDiscoveryContext *)0;
}

- (void)deleteCompanionDeviceDiscoveryContext
{
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;

  if (self->_whichEvent_Type == 6)
  {
    self->_whichEvent_Type = 0;
    companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
    self->_companionDeviceDiscoveryContext = 0;

  }
}

- (void)setCompanionDeviceCommunicationContext:(id)a3
{
  HALSchemaHALCompanionDeviceCommunicationContext *v4;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;
  HALSchemaHALLocalFetchContext *localFetchContext;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;
  HALSchemaHALForceFetchContext *forceFetchContext;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;
  unint64_t v11;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;

  v4 = (HALSchemaHALCompanionDeviceCommunicationContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  v11 = 7;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = v4;

}

- (HALSchemaHALCompanionDeviceCommunicationContext)companionDeviceCommunicationContext
{
  if (self->_whichEvent_Type == 7)
    return self->_companionDeviceCommunicationContext;
  else
    return (HALSchemaHALCompanionDeviceCommunicationContext *)0;
}

- (void)deleteCompanionDeviceCommunicationContext
{
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;

  if (self->_whichEvent_Type == 7)
  {
    self->_whichEvent_Type = 0;
    companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
    self->_companionDeviceCommunicationContext = 0;

  }
}

- (void)setNearbyPersonalDevicesReported:(id)a3
{
  HALSchemaHALNearbyPersonalDevicesReported *v4;
  HALSchemaHALCrossDeviceCommandExecutionContext *crossDeviceCommandContext;
  HALSchemaHALLocalFetchContext *localFetchContext;
  HALSchemaHALContextCollectorFetchContext *contextCollectorFetchContext;
  HALSchemaHALForceFetchContext *forceFetchContext;
  HALSchemaHALCompanionDeviceDiscoveryContext *companionDeviceDiscoveryContext;
  HALSchemaHALCompanionDeviceCommunicationContext *companionDeviceCommunicationContext;
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;

  v4 = (HALSchemaHALNearbyPersonalDevicesReported *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  self->_whichEvent_Type = 8 * (v4 != 0);
  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = v4;

}

- (HALSchemaHALNearbyPersonalDevicesReported)nearbyPersonalDevicesReported
{
  if (self->_whichEvent_Type == 8)
    return self->_nearbyPersonalDevicesReported;
  else
    return (HALSchemaHALNearbyPersonalDevicesReported *)0;
}

- (void)deleteNearbyPersonalDevicesReported
{
  HALSchemaHALNearbyPersonalDevicesReported *nearbyPersonalDevicesReported;

  if (self->_whichEvent_Type == 8)
  {
    self->_whichEvent_Type = 0;
    nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
    self->_nearbyPersonalDevicesReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALClientEventReadFrom(self, (uint64_t)a3);
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
  id v20;

  v20 = a3;
  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v47;
  BOOL v48;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_43;
  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossDeviceCommandContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossDeviceCommandContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localFetchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localFetchContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextCollectorFetchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextCollectorFetchContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceFetchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forceFetchContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionDeviceDiscoveryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionDeviceDiscoveryContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionDeviceCommunicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionDeviceCommunicationContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_43;
  }
  else
  {

  }
  -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nearbyPersonalDevicesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {

LABEL_46:
      v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nearbyPersonalDevicesReported");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if ((v47 & 1) != 0)
      goto LABEL_46;
  }
  else
  {
LABEL_42:

  }
LABEL_43:
  v48 = 0;
LABEL_44:

  return v48;
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

  v3 = -[HALSchemaHALClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[HALSchemaHALCrossDeviceCommandExecutionContext hash](self->_crossDeviceCommandContext, "hash") ^ v3;
  v5 = -[HALSchemaHALLocalFetchContext hash](self->_localFetchContext, "hash");
  v6 = v4 ^ v5 ^ -[HALSchemaHALContextCollectorFetchContext hash](self->_contextCollectorFetchContext, "hash");
  v7 = -[HALSchemaHALForceFetchContext hash](self->_forceFetchContext, "hash");
  v8 = v7 ^ -[HALSchemaHALCompanionDeviceDiscoveryContext hash](self->_companionDeviceDiscoveryContext, "hash");
  v9 = v6 ^ v8 ^ -[HALSchemaHALCompanionDeviceCommunicationContext hash](self->_companionDeviceCommunicationContext, "hash");
  return v9 ^ -[HALSchemaHALNearbyPersonalDevicesReported hash](self->_nearbyPersonalDevicesReported, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_companionDeviceCommunicationContext)
  {
    -[HALSchemaHALClientEvent companionDeviceCommunicationContext](self, "companionDeviceCommunicationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("companionDeviceCommunicationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("companionDeviceCommunicationContext"));

    }
  }
  if (self->_companionDeviceDiscoveryContext)
  {
    -[HALSchemaHALClientEvent companionDeviceDiscoveryContext](self, "companionDeviceDiscoveryContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("companionDeviceDiscoveryContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("companionDeviceDiscoveryContext"));

    }
  }
  if (self->_contextCollectorFetchContext)
  {
    -[HALSchemaHALClientEvent contextCollectorFetchContext](self, "contextCollectorFetchContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("contextCollectorFetchContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("contextCollectorFetchContext"));

    }
  }
  if (self->_crossDeviceCommandContext)
  {
    -[HALSchemaHALClientEvent crossDeviceCommandContext](self, "crossDeviceCommandContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("crossDeviceCommandContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("crossDeviceCommandContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[HALSchemaHALClientEvent eventMetadata](self, "eventMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("eventMetadata"));

    }
  }
  if (self->_forceFetchContext)
  {
    -[HALSchemaHALClientEvent forceFetchContext](self, "forceFetchContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("forceFetchContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("forceFetchContext"));

    }
  }
  if (self->_localFetchContext)
  {
    -[HALSchemaHALClientEvent localFetchContext](self, "localFetchContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("localFetchContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("localFetchContext"));

    }
  }
  if (self->_nearbyPersonalDevicesReported)
  {
    -[HALSchemaHALClientEvent nearbyPersonalDevicesReported](self, "nearbyPersonalDevicesReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("nearbyPersonalDevicesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("nearbyPersonalDevicesReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HALSchemaHALClientEvent)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALClientEvent *v5;
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
    self = -[HALSchemaHALClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALClientEvent)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALClientEvent *v5;
  uint64_t v6;
  HALSchemaHALClientEventMetadata *v7;
  void *v8;
  HALSchemaHALCrossDeviceCommandExecutionContext *v9;
  void *v10;
  HALSchemaHALLocalFetchContext *v11;
  void *v12;
  HALSchemaHALContextCollectorFetchContext *v13;
  void *v14;
  HALSchemaHALForceFetchContext *v15;
  void *v16;
  HALSchemaHALCompanionDeviceDiscoveryContext *v17;
  void *v18;
  HALSchemaHALCompanionDeviceCommunicationContext *v19;
  void *v20;
  HALSchemaHALNearbyPersonalDevicesReported *v21;
  HALSchemaHALClientEvent *v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HALSchemaHALClientEvent;
  v5 = -[HALSchemaHALClientEvent init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[HALSchemaHALClientEventMetadata initWithDictionary:]([HALSchemaHALClientEventMetadata alloc], "initWithDictionary:", v6);
      -[HALSchemaHALClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    v24 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossDeviceCommandContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[HALSchemaHALCrossDeviceCommandExecutionContext initWithDictionary:]([HALSchemaHALCrossDeviceCommandExecutionContext alloc], "initWithDictionary:", v8);
      -[HALSchemaHALClientEvent setCrossDeviceCommandContext:](v5, "setCrossDeviceCommandContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localFetchContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[HALSchemaHALLocalFetchContext initWithDictionary:]([HALSchemaHALLocalFetchContext alloc], "initWithDictionary:", v10);
      -[HALSchemaHALClientEvent setLocalFetchContext:](v5, "setLocalFetchContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextCollectorFetchContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[HALSchemaHALContextCollectorFetchContext initWithDictionary:]([HALSchemaHALContextCollectorFetchContext alloc], "initWithDictionary:", v12);
      -[HALSchemaHALClientEvent setContextCollectorFetchContext:](v5, "setContextCollectorFetchContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceFetchContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[HALSchemaHALForceFetchContext initWithDictionary:]([HALSchemaHALForceFetchContext alloc], "initWithDictionary:", v14);
      -[HALSchemaHALClientEvent setForceFetchContext:](v5, "setForceFetchContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companionDeviceDiscoveryContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[HALSchemaHALCompanionDeviceDiscoveryContext initWithDictionary:]([HALSchemaHALCompanionDeviceDiscoveryContext alloc], "initWithDictionary:", v16);
      -[HALSchemaHALClientEvent setCompanionDeviceDiscoveryContext:](v5, "setCompanionDeviceDiscoveryContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companionDeviceCommunicationContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[HALSchemaHALCompanionDeviceCommunicationContext initWithDictionary:]([HALSchemaHALCompanionDeviceCommunicationContext alloc], "initWithDictionary:", v18);
      -[HALSchemaHALClientEvent setCompanionDeviceCommunicationContext:](v5, "setCompanionDeviceCommunicationContext:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nearbyPersonalDevicesReported"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[HALSchemaHALNearbyPersonalDevicesReported initWithDictionary:]([HALSchemaHALNearbyPersonalDevicesReported alloc], "initWithDictionary:", v20);
      -[HALSchemaHALClientEvent setNearbyPersonalDevicesReported:](v5, "setNearbyPersonalDevicesReported:", v21);

    }
    v22 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (HALSchemaHALClientEventMetadata)eventMetadata
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

- (BOOL)hasCrossDeviceCommandContext
{
  return self->_hasCrossDeviceCommandContext;
}

- (void)setHasCrossDeviceCommandContext:(BOOL)a3
{
  self->_hasCrossDeviceCommandContext = a3;
}

- (BOOL)hasLocalFetchContext
{
  return self->_hasLocalFetchContext;
}

- (void)setHasLocalFetchContext:(BOOL)a3
{
  self->_hasLocalFetchContext = a3;
}

- (BOOL)hasContextCollectorFetchContext
{
  return self->_hasContextCollectorFetchContext;
}

- (void)setHasContextCollectorFetchContext:(BOOL)a3
{
  self->_hasContextCollectorFetchContext = a3;
}

- (BOOL)hasForceFetchContext
{
  return self->_hasForceFetchContext;
}

- (void)setHasForceFetchContext:(BOOL)a3
{
  self->_hasForceFetchContext = a3;
}

- (BOOL)hasCompanionDeviceDiscoveryContext
{
  return self->_hasCompanionDeviceDiscoveryContext;
}

- (void)setHasCompanionDeviceDiscoveryContext:(BOOL)a3
{
  self->_hasCompanionDeviceDiscoveryContext = a3;
}

- (BOOL)hasCompanionDeviceCommunicationContext
{
  return self->_hasCompanionDeviceCommunicationContext;
}

- (void)setHasCompanionDeviceCommunicationContext:(BOOL)a3
{
  self->_hasCompanionDeviceCommunicationContext = a3;
}

- (BOOL)hasNearbyPersonalDevicesReported
{
  return self->_hasNearbyPersonalDevicesReported;
}

- (void)setHasNearbyPersonalDevicesReported:(BOOL)a3
{
  self->_hasNearbyPersonalDevicesReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyPersonalDevicesReported, 0);
  objc_storeStrong((id *)&self->_companionDeviceCommunicationContext, 0);
  objc_storeStrong((id *)&self->_companionDeviceDiscoveryContext, 0);
  objc_storeStrong((id *)&self->_forceFetchContext, 0);
  objc_storeStrong((id *)&self->_contextCollectorFetchContext, 0);
  objc_storeStrong((id *)&self->_localFetchContext, 0);
  objc_storeStrong((id *)&self->_crossDeviceCommandContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 31;
}

@end
