@implementation DIMSchemaDIMClientEvent

+ (int)joinability
{
  return 4;
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
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DIMSchemaDIMClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DIMSchemaDIMClientEvent deleteDeviceFixedContext](self, "deleteDeviceFixedContext");
  -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DIMSchemaDIMClientEvent deleteSiriAccountInformation](self, "deleteSiriAccountInformation");
  -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DIMSchemaDIMClientEvent deleteLocaleNotRecognized](self, "deleteLocaleNotRecognized");
  -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[DIMSchemaDIMClientEvent deleteOnDeviceDigest](self, "deleteOnDeviceDigest");
  -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[DIMSchemaDIMClientEvent deleteEphemeralIdentifiers](self, "deleteEphemeralIdentifiers");
  -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[DIMSchemaDIMClientEvent deleteEphemeralToAggregationIdentifierMap](self, "deleteEphemeralToAggregationIdentifierMap");
  -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[DIMSchemaDIMClientEvent deleteExperimentContext](self, "deleteExperimentContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[DIMSchemaDIMClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 6)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E56293E8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 6)
    return 0;
  else
    return off_1E5629420[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[DIMSchemaDIMClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 6)
    return CFSTR("com.apple.aiml.siri.dim.DIMClientEvent");
  else
    return off_1E562C750[v2 - 101];
}

- (void)setDeviceFixedContext:(id)a3
{
  DIMSchemaDIMDeviceFixedContext *v4;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;
  DIMSchemaDIMExperimentContext *experimentContext;
  unint64_t v11;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;

  v4 = (DIMSchemaDIMDeviceFixedContext *)a3;
  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  v11 = 101;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = v4;

}

- (DIMSchemaDIMDeviceFixedContext)deviceFixedContext
{
  if (self->_whichEvent_Type == 101)
    return self->_deviceFixedContext;
  else
    return (DIMSchemaDIMDeviceFixedContext *)0;
}

- (void)deleteDeviceFixedContext
{
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    deviceFixedContext = self->_deviceFixedContext;
    self->_deviceFixedContext = 0;

  }
}

- (void)setSiriAccountInformation:(id)a3
{
  DIMSchemaDIMSiriAccountInformation *v4;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;
  DIMSchemaDIMExperimentContext *experimentContext;
  unint64_t v11;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;

  v4 = (DIMSchemaDIMSiriAccountInformation *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  v11 = 102;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = v4;

}

- (DIMSchemaDIMSiriAccountInformation)siriAccountInformation
{
  if (self->_whichEvent_Type == 102)
    return self->_siriAccountInformation;
  else
    return (DIMSchemaDIMSiriAccountInformation *)0;
}

- (void)deleteSiriAccountInformation
{
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    siriAccountInformation = self->_siriAccountInformation;
    self->_siriAccountInformation = 0;

  }
}

- (void)setLocaleNotRecognized:(id)a3
{
  DIMSchemaDIMLocaleNotRecognized *v4;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;
  DIMSchemaDIMExperimentContext *experimentContext;
  unint64_t v11;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;

  v4 = (DIMSchemaDIMLocaleNotRecognized *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  v11 = 103;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = v4;

}

- (DIMSchemaDIMLocaleNotRecognized)localeNotRecognized
{
  if (self->_whichEvent_Type == 103)
    return self->_localeNotRecognized;
  else
    return (DIMSchemaDIMLocaleNotRecognized *)0;
}

- (void)deleteLocaleNotRecognized
{
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    localeNotRecognized = self->_localeNotRecognized;
    self->_localeNotRecognized = 0;

  }
}

- (void)setOnDeviceDigest:(id)a3
{
  DIMSchemaDIMOnDeviceDigest *v4;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;
  DIMSchemaDIMExperimentContext *experimentContext;
  unint64_t v11;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;

  v4 = (DIMSchemaDIMOnDeviceDigest *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  v11 = 104;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = v4;

}

- (DIMSchemaDIMOnDeviceDigest)onDeviceDigest
{
  if (self->_whichEvent_Type == 104)
    return self->_onDeviceDigest;
  else
    return (DIMSchemaDIMOnDeviceDigest *)0;
}

- (void)deleteOnDeviceDigest
{
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    onDeviceDigest = self->_onDeviceDigest;
    self->_onDeviceDigest = 0;

  }
}

- (void)setEphemeralIdentifiers:(id)a3
{
  DIMSchemaDIMEphemeralIdentifiers *v4;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;
  DIMSchemaDIMExperimentContext *experimentContext;
  unint64_t v11;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;

  v4 = (DIMSchemaDIMEphemeralIdentifiers *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  v11 = 105;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = v4;

}

- (DIMSchemaDIMEphemeralIdentifiers)ephemeralIdentifiers
{
  if (self->_whichEvent_Type == 105)
    return self->_ephemeralIdentifiers;
  else
    return (DIMSchemaDIMEphemeralIdentifiers *)0;
}

- (void)deleteEphemeralIdentifiers
{
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    ephemeralIdentifiers = self->_ephemeralIdentifiers;
    self->_ephemeralIdentifiers = 0;

  }
}

- (void)setEphemeralToAggregationIdentifierMap:(id)a3
{
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *v4;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;
  DIMSchemaDIMExperimentContext *experimentContext;
  unint64_t v11;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;

  v4 = (DIMSchemaDIMEphemeralToAggregationIdentifierMap *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  experimentContext = self->_experimentContext;
  self->_experimentContext = 0;

  v11 = 106;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = v4;

}

- (DIMSchemaDIMEphemeralToAggregationIdentifierMap)ephemeralToAggregationIdentifierMap
{
  if (self->_whichEvent_Type == 106)
    return self->_ephemeralToAggregationIdentifierMap;
  else
    return (DIMSchemaDIMEphemeralToAggregationIdentifierMap *)0;
}

- (void)deleteEphemeralToAggregationIdentifierMap
{
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
    self->_ephemeralToAggregationIdentifierMap = 0;

  }
}

- (void)setExperimentContext:(id)a3
{
  DIMSchemaDIMExperimentContext *v4;
  DIMSchemaDIMDeviceFixedContext *deviceFixedContext;
  DIMSchemaDIMSiriAccountInformation *siriAccountInformation;
  DIMSchemaDIMLocaleNotRecognized *localeNotRecognized;
  DIMSchemaDIMOnDeviceDigest *onDeviceDigest;
  DIMSchemaDIMEphemeralIdentifiers *ephemeralIdentifiers;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *ephemeralToAggregationIdentifierMap;
  unint64_t v11;
  DIMSchemaDIMExperimentContext *experimentContext;

  v4 = (DIMSchemaDIMExperimentContext *)a3;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  localeNotRecognized = self->_localeNotRecognized;
  self->_localeNotRecognized = 0;

  onDeviceDigest = self->_onDeviceDigest;
  self->_onDeviceDigest = 0;

  ephemeralIdentifiers = self->_ephemeralIdentifiers;
  self->_ephemeralIdentifiers = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  v11 = 107;
  if (!v4)
    v11 = 0;
  self->_whichEvent_Type = v11;
  experimentContext = self->_experimentContext;
  self->_experimentContext = v4;

}

- (DIMSchemaDIMExperimentContext)experimentContext
{
  if (self->_whichEvent_Type == 107)
    return self->_experimentContext;
  else
    return (DIMSchemaDIMExperimentContext *)0;
}

- (void)deleteExperimentContext
{
  DIMSchemaDIMExperimentContext *experimentContext;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    experimentContext = self->_experimentContext;
    self->_experimentContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMClientEventReadFrom(self, (uint64_t)a3);
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
  id v18;

  v18 = a3;
  -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_38;
  -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceFixedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceFixedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_38;
  }
  else
  {

  }
  -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriAccountInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeNotRecognized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeNotRecognized");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onDeviceDigest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onDeviceDigest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ephemeralIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ephemeralIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ephemeralToAggregationIdentifierMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ephemeralToAggregationIdentifierMap");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
    {

LABEL_41:
      v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if ((v42 & 1) != 0)
      goto LABEL_41;
  }
  else
  {
LABEL_37:

  }
LABEL_38:
  v43 = 0;
LABEL_39:

  return v43;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[DIMSchemaDIMDeviceFixedContext hash](self->_deviceFixedContext, "hash");
  v4 = -[DIMSchemaDIMSiriAccountInformation hash](self->_siriAccountInformation, "hash") ^ v3;
  v5 = -[DIMSchemaDIMLocaleNotRecognized hash](self->_localeNotRecognized, "hash");
  v6 = v4 ^ v5 ^ -[DIMSchemaDIMOnDeviceDigest hash](self->_onDeviceDigest, "hash");
  v7 = -[DIMSchemaDIMEphemeralIdentifiers hash](self->_ephemeralIdentifiers, "hash");
  v8 = v7 ^ -[DIMSchemaDIMEphemeralToAggregationIdentifierMap hash](self->_ephemeralToAggregationIdentifierMap, "hash");
  return v6 ^ v8 ^ -[DIMSchemaDIMExperimentContext hash](self->_experimentContext, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceFixedContext)
  {
    -[DIMSchemaDIMClientEvent deviceFixedContext](self, "deviceFixedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceFixedContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceFixedContext"));

    }
  }
  if (self->_ephemeralIdentifiers)
  {
    -[DIMSchemaDIMClientEvent ephemeralIdentifiers](self, "ephemeralIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ephemeralIdentifiers"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ephemeralIdentifiers"));

    }
  }
  if (self->_ephemeralToAggregationIdentifierMap)
  {
    -[DIMSchemaDIMClientEvent ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ephemeralToAggregationIdentifierMap"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ephemeralToAggregationIdentifierMap"));

    }
  }
  if (self->_experimentContext)
  {
    -[DIMSchemaDIMClientEvent experimentContext](self, "experimentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("experimentContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("experimentContext"));

    }
  }
  if (self->_localeNotRecognized)
  {
    -[DIMSchemaDIMClientEvent localeNotRecognized](self, "localeNotRecognized");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("localeNotRecognized"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("localeNotRecognized"));

    }
  }
  if (self->_onDeviceDigest)
  {
    -[DIMSchemaDIMClientEvent onDeviceDigest](self, "onDeviceDigest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("onDeviceDigest"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("onDeviceDigest"));

    }
  }
  if (self->_siriAccountInformation)
  {
    -[DIMSchemaDIMClientEvent siriAccountInformation](self, "siriAccountInformation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("siriAccountInformation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("siriAccountInformation"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaDIMClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DIMSchemaDIMClientEvent)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaDIMClientEvent *v5;
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
    self = -[DIMSchemaDIMClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaDIMClientEvent)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaDIMClientEvent *v5;
  void *v6;
  DIMSchemaDIMDeviceFixedContext *v7;
  void *v8;
  DIMSchemaDIMSiriAccountInformation *v9;
  void *v10;
  DIMSchemaDIMLocaleNotRecognized *v11;
  void *v12;
  DIMSchemaDIMOnDeviceDigest *v13;
  void *v14;
  DIMSchemaDIMEphemeralIdentifiers *v15;
  void *v16;
  DIMSchemaDIMEphemeralToAggregationIdentifierMap *v17;
  void *v18;
  DIMSchemaDIMExperimentContext *v19;
  DIMSchemaDIMClientEvent *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DIMSchemaDIMClientEvent;
  v5 = -[DIMSchemaDIMClientEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceFixedContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[DIMSchemaDIMDeviceFixedContext initWithDictionary:]([DIMSchemaDIMDeviceFixedContext alloc], "initWithDictionary:", v6);
      -[DIMSchemaDIMClientEvent setDeviceFixedContext:](v5, "setDeviceFixedContext:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriAccountInformation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[DIMSchemaDIMSiriAccountInformation initWithDictionary:]([DIMSchemaDIMSiriAccountInformation alloc], "initWithDictionary:", v8);
      -[DIMSchemaDIMClientEvent setSiriAccountInformation:](v5, "setSiriAccountInformation:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localeNotRecognized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[DIMSchemaDIMLocaleNotRecognized initWithDictionary:]([DIMSchemaDIMLocaleNotRecognized alloc], "initWithDictionary:", v10);
      -[DIMSchemaDIMClientEvent setLocaleNotRecognized:](v5, "setLocaleNotRecognized:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onDeviceDigest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[DIMSchemaDIMOnDeviceDigest initWithDictionary:]([DIMSchemaDIMOnDeviceDigest alloc], "initWithDictionary:", v12);
      -[DIMSchemaDIMClientEvent setOnDeviceDigest:](v5, "setOnDeviceDigest:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ephemeralIdentifiers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[DIMSchemaDIMEphemeralIdentifiers initWithDictionary:]([DIMSchemaDIMEphemeralIdentifiers alloc], "initWithDictionary:", v14);
      -[DIMSchemaDIMClientEvent setEphemeralIdentifiers:](v5, "setEphemeralIdentifiers:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ephemeralToAggregationIdentifierMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[DIMSchemaDIMEphemeralToAggregationIdentifierMap initWithDictionary:]([DIMSchemaDIMEphemeralToAggregationIdentifierMap alloc], "initWithDictionary:", v16);
      -[DIMSchemaDIMClientEvent setEphemeralToAggregationIdentifierMap:](v5, "setEphemeralToAggregationIdentifierMap:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[DIMSchemaDIMExperimentContext initWithDictionary:]([DIMSchemaDIMExperimentContext alloc], "initWithDictionary:", v18);
      -[DIMSchemaDIMClientEvent setExperimentContext:](v5, "setExperimentContext:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasDeviceFixedContext
{
  return self->_hasDeviceFixedContext;
}

- (void)setHasDeviceFixedContext:(BOOL)a3
{
  self->_hasDeviceFixedContext = a3;
}

- (BOOL)hasSiriAccountInformation
{
  return self->_hasSiriAccountInformation;
}

- (void)setHasSiriAccountInformation:(BOOL)a3
{
  self->_hasSiriAccountInformation = a3;
}

- (BOOL)hasLocaleNotRecognized
{
  return self->_hasLocaleNotRecognized;
}

- (void)setHasLocaleNotRecognized:(BOOL)a3
{
  self->_hasLocaleNotRecognized = a3;
}

- (BOOL)hasOnDeviceDigest
{
  return self->_hasOnDeviceDigest;
}

- (void)setHasOnDeviceDigest:(BOOL)a3
{
  self->_hasOnDeviceDigest = a3;
}

- (BOOL)hasEphemeralIdentifiers
{
  return self->_hasEphemeralIdentifiers;
}

- (void)setHasEphemeralIdentifiers:(BOOL)a3
{
  self->_hasEphemeralIdentifiers = a3;
}

- (BOOL)hasEphemeralToAggregationIdentifierMap
{
  return self->_hasEphemeralToAggregationIdentifierMap;
}

- (void)setHasEphemeralToAggregationIdentifierMap:(BOOL)a3
{
  self->_hasEphemeralToAggregationIdentifierMap = a3;
}

- (BOOL)hasExperimentContext
{
  return self->_hasExperimentContext;
}

- (void)setHasExperimentContext:(BOOL)a3
{
  self->_hasExperimentContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentContext, 0);
  objc_storeStrong((id *)&self->_ephemeralToAggregationIdentifierMap, 0);
  objc_storeStrong((id *)&self->_ephemeralIdentifiers, 0);
  objc_storeStrong((id *)&self->_onDeviceDigest, 0);
  objc_storeStrong((id *)&self->_localeNotRecognized, 0);
  objc_storeStrong((id *)&self->_siriAccountInformation, 0);
  objc_storeStrong((id *)&self->_deviceFixedContext, 0);
}

- (int)getAnyEventType
{
  return 17;
}

@end
