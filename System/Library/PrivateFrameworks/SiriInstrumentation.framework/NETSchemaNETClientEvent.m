@implementation NETSchemaNETClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "netId");
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
  void *v4;
  void *v5;
  uint64_t v6;

  -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "netId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 18;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
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
  void *v33;
  void *v34;
  int v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NETSchemaNETClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v37, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NETSchemaNETClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NETSchemaNETClientEvent deleteSessionConnectionHttpHeaderCreated](self, "deleteSessionConnectionHttpHeaderCreated");
  -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NETSchemaNETClientEvent deleteSessionConnectionSnapshotCaptured](self, "deleteSessionConnectionSnapshotCaptured");
  -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NETSchemaNETClientEvent deleteDebugSessionConnectionSnapshotCaptured](self, "deleteDebugSessionConnectionSnapshotCaptured");
  -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NETSchemaNETClientEvent deleteSessionConnectionFailed](self, "deleteSessionConnectionFailed");
  -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[NETSchemaNETClientEvent deletePeerConnectionFailed](self, "deletePeerConnectionFailed");
  -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[NETSchemaNETClientEvent deleteNetworkConnectionStatePreparationSnapshotCaptured](self, "deleteNetworkConnectionStatePreparationSnapshotCaptured");
  -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[NETSchemaNETClientEvent deleteDebugNetworkConnectionStatePreparationSnapshotCaptured](self, "deleteDebugNetworkConnectionStatePreparationSnapshotCaptured");
  -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[NETSchemaNETClientEvent deleteNetworkConnectionStateReadySnapshotCaptured](self, "deleteNetworkConnectionStateReadySnapshotCaptured");
  -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[NETSchemaNETClientEvent deleteDebugNetworkConnectionStateReadySnapshotCaptured](self, "deleteDebugNetworkConnectionStateReadySnapshotCaptured");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[NETSchemaNETClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 8)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629F68[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8)
    return 0;
  else
    return off_1E5629FB0[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[NETSchemaNETClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 8)
    return CFSTR("com.apple.aiml.siri.net.NETClientEvent");
  else
    return off_1E5631618[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[NETSchemaNETClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setSessionConnectionHttpHeaderCreated:(id)a3
{
  NETSchemaNETSessionConnectionHttpHeaderCreated *v4;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;

  v4 = (NETSchemaNETSessionConnectionHttpHeaderCreated *)a3;
  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 101;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = v4;

}

- (NETSchemaNETSessionConnectionHttpHeaderCreated)sessionConnectionHttpHeaderCreated
{
  if (self->_whichEvent_Type == 101)
    return self->_sessionConnectionHttpHeaderCreated;
  else
    return (NETSchemaNETSessionConnectionHttpHeaderCreated *)0;
}

- (void)deleteSessionConnectionHttpHeaderCreated
{
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
    self->_sessionConnectionHttpHeaderCreated = 0;

  }
}

- (void)setSessionConnectionSnapshotCaptured:(id)a3
{
  NETSchemaNETSessionConnectionSnapshotCaptured *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;

  v4 = (NETSchemaNETSessionConnectionSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 102;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = v4;

}

- (NETSchemaNETSessionConnectionSnapshotCaptured)sessionConnectionSnapshotCaptured
{
  if (self->_whichEvent_Type == 102)
    return self->_sessionConnectionSnapshotCaptured;
  else
    return (NETSchemaNETSessionConnectionSnapshotCaptured *)0;
}

- (void)deleteSessionConnectionSnapshotCaptured
{
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
    self->_sessionConnectionSnapshotCaptured = 0;

  }
}

- (void)setDebugSessionConnectionSnapshotCaptured:(id)a3
{
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;

  v4 = (NETSchemaNETDebugSessionConnectionSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 103;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = v4;

}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)debugSessionConnectionSnapshotCaptured
{
  if (self->_whichEvent_Type == 103)
    return self->_debugSessionConnectionSnapshotCaptured;
  else
    return (NETSchemaNETDebugSessionConnectionSnapshotCaptured *)0;
}

- (void)deleteDebugSessionConnectionSnapshotCaptured
{
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
    self->_debugSessionConnectionSnapshotCaptured = 0;

  }
}

- (void)setSessionConnectionFailed:(id)a3
{
  NETSchemaNETSessionConnectionFailed *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;

  v4 = (NETSchemaNETSessionConnectionFailed *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 104;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = v4;

}

- (NETSchemaNETSessionConnectionFailed)sessionConnectionFailed
{
  if (self->_whichEvent_Type == 104)
    return self->_sessionConnectionFailed;
  else
    return (NETSchemaNETSessionConnectionFailed *)0;
}

- (void)deleteSessionConnectionFailed
{
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    sessionConnectionFailed = self->_sessionConnectionFailed;
    self->_sessionConnectionFailed = 0;

  }
}

- (void)setPeerConnectionFailed:(id)a3
{
  NETSchemaNETPeerConnectionFailed *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;

  v4 = (NETSchemaNETPeerConnectionFailed *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 105;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = v4;

}

- (NETSchemaNETPeerConnectionFailed)peerConnectionFailed
{
  if (self->_whichEvent_Type == 105)
    return self->_peerConnectionFailed;
  else
    return (NETSchemaNETPeerConnectionFailed *)0;
}

- (void)deletePeerConnectionFailed
{
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    peerConnectionFailed = self->_peerConnectionFailed;
    self->_peerConnectionFailed = 0;

  }
}

- (void)setNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;

  v4 = (NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 106;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = v4;

}

- (NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured)networkConnectionStatePreparationSnapshotCaptured
{
  if (self->_whichEvent_Type == 106)
    return self->_networkConnectionStatePreparationSnapshotCaptured;
  else
    return (NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *)0;
}

- (void)deleteNetworkConnectionStatePreparationSnapshotCaptured
{
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
    self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  }
}

- (void)setDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;

  v4 = (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 107;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = v4;

}

- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)debugNetworkConnectionStatePreparationSnapshotCaptured
{
  if (self->_whichEvent_Type == 107)
    return self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  else
    return (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)0;
}

- (void)deleteDebugNetworkConnectionStatePreparationSnapshotCaptured
{
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
    self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  }
}

- (void)setNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;

  v4 = (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  v13 = 108;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = v4;

}

- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)networkConnectionStateReadySnapshotCaptured
{
  if (self->_whichEvent_Type == 108)
    return self->_networkConnectionStateReadySnapshotCaptured;
  else
    return (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)0;
}

- (void)deleteNetworkConnectionStateReadySnapshotCaptured
{
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
    self->_networkConnectionStateReadySnapshotCaptured = 0;

  }
}

- (void)setDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *v4;
  NETSchemaNETSessionConnectionHttpHeaderCreated *sessionConnectionHttpHeaderCreated;
  NETSchemaNETSessionConnectionSnapshotCaptured *sessionConnectionSnapshotCaptured;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *debugSessionConnectionSnapshotCaptured;
  NETSchemaNETSessionConnectionFailed *sessionConnectionFailed;
  NETSchemaNETPeerConnectionFailed *peerConnectionFailed;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *networkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *debugNetworkConnectionStatePreparationSnapshotCaptured;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *networkConnectionStateReadySnapshotCaptured;
  unint64_t v13;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;

  v4 = (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  v13 = 109;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = v4;

}

- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)debugNetworkConnectionStateReadySnapshotCaptured
{
  if (self->_whichEvent_Type == 109)
    return self->_debugNetworkConnectionStateReadySnapshotCaptured;
  else
    return (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)0;
}

- (void)deleteDebugNetworkConnectionStateReadySnapshotCaptured
{
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *debugNetworkConnectionStateReadySnapshotCaptured;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
    self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETClientEventReadFrom(self, (uint64_t)a3);
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
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_53;
  -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionConnectionHttpHeaderCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionConnectionHttpHeaderCreated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionConnectionSnapshotCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionConnectionSnapshotCaptured");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugSessionConnectionSnapshotCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugSessionConnectionSnapshotCaptured");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionConnectionFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionConnectionFailed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerConnectionFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peerConnectionFailed");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkConnectionStatePreparationSnapshotCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkConnectionStatePreparationSnapshotCaptured");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugNetworkConnectionStatePreparationSnapshotCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugNetworkConnectionStatePreparationSnapshotCaptured");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkConnectionStateReadySnapshotCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkConnectionStateReadySnapshotCaptured");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_53;
  }
  else
  {

  }
  -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugNetworkConnectionStateReadySnapshotCaptured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {

LABEL_56:
      v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugNetworkConnectionStateReadySnapshotCaptured");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) != 0)
      goto LABEL_56;
  }
  else
  {
LABEL_52:

  }
LABEL_53:
  v58 = 0;
LABEL_54:

  return v58;
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
  unint64_t v11;

  v3 = -[NETSchemaNETClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[NETSchemaNETSessionConnectionHttpHeaderCreated hash](self->_sessionConnectionHttpHeaderCreated, "hash") ^ v3;
  v5 = -[NETSchemaNETSessionConnectionSnapshotCaptured hash](self->_sessionConnectionSnapshotCaptured, "hash");
  v6 = v4 ^ v5 ^ -[NETSchemaNETDebugSessionConnectionSnapshotCaptured hash](self->_debugSessionConnectionSnapshotCaptured, "hash");
  v7 = -[NETSchemaNETSessionConnectionFailed hash](self->_sessionConnectionFailed, "hash");
  v8 = v7 ^ -[NETSchemaNETPeerConnectionFailed hash](self->_peerConnectionFailed, "hash");
  v9 = v6 ^ v8 ^ -[NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured hash](self->_networkConnectionStatePreparationSnapshotCaptured, "hash");
  v10 = -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured hash](self->_debugNetworkConnectionStatePreparationSnapshotCaptured, "hash");
  v11 = v10 ^ -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured hash](self->_networkConnectionStateReadySnapshotCaptured, "hash");
  return v9 ^ v11 ^ -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured hash](self->_debugNetworkConnectionStateReadySnapshotCaptured, "hash");
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
  void *v31;
  void *v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_debugNetworkConnectionStatePreparationSnapshotCaptured)
  {
    -[NETSchemaNETClientEvent debugNetworkConnectionStatePreparationSnapshotCaptured](self, "debugNetworkConnectionStatePreparationSnapshotCaptured");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("debugNetworkConnectionStatePreparationSnapshotCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("debugNetworkConnectionStatePreparationSnapshotCaptured"));

    }
  }
  if (self->_debugNetworkConnectionStateReadySnapshotCaptured)
  {
    -[NETSchemaNETClientEvent debugNetworkConnectionStateReadySnapshotCaptured](self, "debugNetworkConnectionStateReadySnapshotCaptured");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("debugNetworkConnectionStateReadySnapshotCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("debugNetworkConnectionStateReadySnapshotCaptured"));

    }
  }
  if (self->_debugSessionConnectionSnapshotCaptured)
  {
    -[NETSchemaNETClientEvent debugSessionConnectionSnapshotCaptured](self, "debugSessionConnectionSnapshotCaptured");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("debugSessionConnectionSnapshotCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("debugSessionConnectionSnapshotCaptured"));

    }
  }
  if (self->_eventMetadata)
  {
    -[NETSchemaNETClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_networkConnectionStatePreparationSnapshotCaptured)
  {
    -[NETSchemaNETClientEvent networkConnectionStatePreparationSnapshotCaptured](self, "networkConnectionStatePreparationSnapshotCaptured");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("networkConnectionStatePreparationSnapshotCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("networkConnectionStatePreparationSnapshotCaptured"));

    }
  }
  if (self->_networkConnectionStateReadySnapshotCaptured)
  {
    -[NETSchemaNETClientEvent networkConnectionStateReadySnapshotCaptured](self, "networkConnectionStateReadySnapshotCaptured");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("networkConnectionStateReadySnapshotCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("networkConnectionStateReadySnapshotCaptured"));

    }
  }
  if (self->_peerConnectionFailed)
  {
    -[NETSchemaNETClientEvent peerConnectionFailed](self, "peerConnectionFailed");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("peerConnectionFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("peerConnectionFailed"));

    }
  }
  if (self->_sessionConnectionFailed)
  {
    -[NETSchemaNETClientEvent sessionConnectionFailed](self, "sessionConnectionFailed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("sessionConnectionFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("sessionConnectionFailed"));

    }
  }
  if (self->_sessionConnectionHttpHeaderCreated)
  {
    -[NETSchemaNETClientEvent sessionConnectionHttpHeaderCreated](self, "sessionConnectionHttpHeaderCreated");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sessionConnectionHttpHeaderCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("sessionConnectionHttpHeaderCreated"));

    }
  }
  if (self->_sessionConnectionSnapshotCaptured)
  {
    -[NETSchemaNETClientEvent sessionConnectionSnapshotCaptured](self, "sessionConnectionSnapshotCaptured");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("sessionConnectionSnapshotCaptured"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("sessionConnectionSnapshotCaptured"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETClientEvent)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETClientEvent *v5;
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
    self = -[NETSchemaNETClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETClientEvent)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETClientEvent *v5;
  uint64_t v6;
  NETSchemaNETClientEventMetadata *v7;
  uint64_t v8;
  NETSchemaNETSessionConnectionHttpHeaderCreated *v9;
  uint64_t v10;
  NETSchemaNETSessionConnectionSnapshotCaptured *v11;
  uint64_t v12;
  NETSchemaNETDebugSessionConnectionSnapshotCaptured *v13;
  void *v14;
  NETSchemaNETSessionConnectionFailed *v15;
  void *v16;
  NETSchemaNETPeerConnectionFailed *v17;
  void *v18;
  NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *v19;
  void *v20;
  void *v21;
  NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *v22;
  void *v23;
  NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *v24;
  void *v25;
  NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *v26;
  NETSchemaNETClientEvent *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NETSchemaNETClientEvent;
  v5 = -[NETSchemaNETClientEvent init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NETSchemaNETClientEventMetadata initWithDictionary:]([NETSchemaNETClientEventMetadata alloc], "initWithDictionary:", v6);
      -[NETSchemaNETClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionConnectionHttpHeaderCreated"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NETSchemaNETSessionConnectionHttpHeaderCreated initWithDictionary:]([NETSchemaNETSessionConnectionHttpHeaderCreated alloc], "initWithDictionary:", v8);
      -[NETSchemaNETClientEvent setSessionConnectionHttpHeaderCreated:](v5, "setSessionConnectionHttpHeaderCreated:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionConnectionSnapshotCaptured"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NETSchemaNETSessionConnectionSnapshotCaptured initWithDictionary:]([NETSchemaNETSessionConnectionSnapshotCaptured alloc], "initWithDictionary:", v10);
      -[NETSchemaNETClientEvent setSessionConnectionSnapshotCaptured:](v5, "setSessionConnectionSnapshotCaptured:", v11);

    }
    v30 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugSessionConnectionSnapshotCaptured"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NETSchemaNETDebugSessionConnectionSnapshotCaptured initWithDictionary:]([NETSchemaNETDebugSessionConnectionSnapshotCaptured alloc], "initWithDictionary:", v12);
      -[NETSchemaNETClientEvent setDebugSessionConnectionSnapshotCaptured:](v5, "setDebugSessionConnectionSnapshotCaptured:", v13);

    }
    v29 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionConnectionFailed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NETSchemaNETSessionConnectionFailed initWithDictionary:]([NETSchemaNETSessionConnectionFailed alloc], "initWithDictionary:", v14);
      -[NETSchemaNETClientEvent setSessionConnectionFailed:](v5, "setSessionConnectionFailed:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerConnectionFailed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[NETSchemaNETPeerConnectionFailed initWithDictionary:]([NETSchemaNETPeerConnectionFailed alloc], "initWithDictionary:", v16);
      -[NETSchemaNETClientEvent setPeerConnectionFailed:](v5, "setPeerConnectionFailed:", v17);

    }
    v31 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkConnectionStatePreparationSnapshotCaptured"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured initWithDictionary:]([NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured alloc], "initWithDictionary:", v18);
      -[NETSchemaNETClientEvent setNetworkConnectionStatePreparationSnapshotCaptured:](v5, "setNetworkConnectionStatePreparationSnapshotCaptured:", v19);

    }
    v20 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugNetworkConnectionStatePreparationSnapshotCaptured"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured initWithDictionary:]([NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured alloc], "initWithDictionary:", v21);
      -[NETSchemaNETClientEvent setDebugNetworkConnectionStatePreparationSnapshotCaptured:](v5, "setDebugNetworkConnectionStatePreparationSnapshotCaptured:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkConnectionStateReadySnapshotCaptured"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured initWithDictionary:]([NETSchemaNETNetworkConnectionStateReadySnapshotCaptured alloc], "initWithDictionary:", v23);
      -[NETSchemaNETClientEvent setNetworkConnectionStateReadySnapshotCaptured:](v5, "setNetworkConnectionStateReadySnapshotCaptured:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugNetworkConnectionStateReadySnapshotCaptured"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured initWithDictionary:]([NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured alloc], "initWithDictionary:", v25);
      -[NETSchemaNETClientEvent setDebugNetworkConnectionStateReadySnapshotCaptured:](v5, "setDebugNetworkConnectionStateReadySnapshotCaptured:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (NETSchemaNETClientEventMetadata)eventMetadata
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

- (BOOL)hasSessionConnectionHttpHeaderCreated
{
  return self->_hasSessionConnectionHttpHeaderCreated;
}

- (void)setHasSessionConnectionHttpHeaderCreated:(BOOL)a3
{
  self->_hasSessionConnectionHttpHeaderCreated = a3;
}

- (BOOL)hasSessionConnectionSnapshotCaptured
{
  return self->_hasSessionConnectionSnapshotCaptured;
}

- (void)setHasSessionConnectionSnapshotCaptured:(BOOL)a3
{
  self->_hasSessionConnectionSnapshotCaptured = a3;
}

- (BOOL)hasDebugSessionConnectionSnapshotCaptured
{
  return self->_hasDebugSessionConnectionSnapshotCaptured;
}

- (void)setHasDebugSessionConnectionSnapshotCaptured:(BOOL)a3
{
  self->_hasDebugSessionConnectionSnapshotCaptured = a3;
}

- (BOOL)hasSessionConnectionFailed
{
  return self->_hasSessionConnectionFailed;
}

- (void)setHasSessionConnectionFailed:(BOOL)a3
{
  self->_hasSessionConnectionFailed = a3;
}

- (BOOL)hasPeerConnectionFailed
{
  return self->_hasPeerConnectionFailed;
}

- (void)setHasPeerConnectionFailed:(BOOL)a3
{
  self->_hasPeerConnectionFailed = a3;
}

- (BOOL)hasNetworkConnectionStatePreparationSnapshotCaptured
{
  return self->_hasNetworkConnectionStatePreparationSnapshotCaptured;
}

- (void)setHasNetworkConnectionStatePreparationSnapshotCaptured:(BOOL)a3
{
  self->_hasNetworkConnectionStatePreparationSnapshotCaptured = a3;
}

- (BOOL)hasDebugNetworkConnectionStatePreparationSnapshotCaptured
{
  return self->_hasDebugNetworkConnectionStatePreparationSnapshotCaptured;
}

- (void)setHasDebugNetworkConnectionStatePreparationSnapshotCaptured:(BOOL)a3
{
  self->_hasDebugNetworkConnectionStatePreparationSnapshotCaptured = a3;
}

- (BOOL)hasNetworkConnectionStateReadySnapshotCaptured
{
  return self->_hasNetworkConnectionStateReadySnapshotCaptured;
}

- (void)setHasNetworkConnectionStateReadySnapshotCaptured:(BOOL)a3
{
  self->_hasNetworkConnectionStateReadySnapshotCaptured = a3;
}

- (BOOL)hasDebugNetworkConnectionStateReadySnapshotCaptured
{
  return self->_hasDebugNetworkConnectionStateReadySnapshotCaptured;
}

- (void)setHasDebugNetworkConnectionStateReadySnapshotCaptured:(BOOL)a3
{
  self->_hasDebugNetworkConnectionStateReadySnapshotCaptured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugNetworkConnectionStateReadySnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_networkConnectionStateReadySnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_debugNetworkConnectionStatePreparationSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_networkConnectionStatePreparationSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_peerConnectionFailed, 0);
  objc_storeStrong((id *)&self->_sessionConnectionFailed, 0);
  objc_storeStrong((id *)&self->_debugSessionConnectionSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_sessionConnectionSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_sessionConnectionHttpHeaderCreated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 32;
}

@end
