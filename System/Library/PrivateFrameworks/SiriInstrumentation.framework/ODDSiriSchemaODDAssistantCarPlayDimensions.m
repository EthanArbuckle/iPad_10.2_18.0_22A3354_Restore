@implementation ODDSiriSchemaODDAssistantCarPlayDimensions

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
  v9.super_class = (Class)ODDSiriSchemaODDAssistantCarPlayDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDAssistantCarPlayDimensions deleteAssistantDimensions](self, "deleteAssistantDimensions");
  return v5;
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

- (void)deleteAssistantDimensions
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setAssistantDimensions:](self, "setAssistantDimensions:", 0);
}

- (BOOL)hasVehicleManufacturer
{
  return self->_vehicleManufacturer != 0;
}

- (void)deleteVehicleManufacturer
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setVehicleManufacturer:](self, "setVehicleManufacturer:", 0);
}

- (BOOL)hasVehicleName
{
  return self->_vehicleName != 0;
}

- (void)deleteVehicleName
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setVehicleName:](self, "setVehicleName:", 0);
}

- (BOOL)hasVehicleModel
{
  return self->_vehicleModel != 0;
}

- (void)deleteVehicleModel
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setVehicleModel:](self, "setVehicleModel:", 0);
}

- (void)setEnhancedVoiceTriggerMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enhancedVoiceTriggerMode = a3;
}

- (BOOL)hasEnhancedVoiceTriggerMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEnhancedVoiceTriggerMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEnhancedVoiceTriggerMode
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setEnhancedVoiceTriggerMode:](self, "setEnhancedVoiceTriggerMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDirectAction:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_directAction = a3;
}

- (BOOL)hasDirectAction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDirectAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDirectAction
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setDirectAction:](self, "setDirectAction:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCarPlayConnection:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_carPlayConnection = a3;
}

- (BOOL)hasCarPlayConnection
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCarPlayConnection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCarPlayConnection
{
  -[ODDSiriSchemaODDAssistantCarPlayDimensions setCarPlayConnection:](self, "setCarPlayConnection:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantCarPlayDimensionsReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleManufacturer](self, "vehicleManufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleName](self, "vehicleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleModel](self, "vehicleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v10 = v11;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
LABEL_15:
    PBDataWriterWriteInt32Field();
    v10 = v11;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  v10 = v11;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v10 = v11;
  }
LABEL_13:

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
  BOOL v27;
  $D1A9539ABAD353427EFED0B769EB1DDA has;
  unsigned int v30;
  int enhancedVoiceTriggerMode;
  int v32;
  int directAction;
  int v34;
  int carPlayConnection;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleManufacturer](self, "vehicleManufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vehicleManufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleManufacturer](self, "vehicleManufacturer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleManufacturer](self, "vehicleManufacturer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vehicleManufacturer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleName](self, "vehicleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vehicleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleName](self, "vehicleName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleName](self, "vehicleName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vehicleName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleModel](self, "vehicleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vehicleModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleModel](self, "vehicleModel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleModel](self, "vehicleModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vehicleModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  has = self->_has;
  v30 = v4[52];
  if ((*(_BYTE *)&has & 1) == (v30 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      enhancedVoiceTriggerMode = self->_enhancedVoiceTriggerMode;
      if (enhancedVoiceTriggerMode != objc_msgSend(v4, "enhancedVoiceTriggerMode"))
        goto LABEL_22;
      has = self->_has;
      v30 = v4[52];
    }
    v32 = (*(unsigned int *)&has >> 1) & 1;
    if (v32 == ((v30 >> 1) & 1))
    {
      if (v32)
      {
        directAction = self->_directAction;
        if (directAction != objc_msgSend(v4, "directAction"))
          goto LABEL_22;
        has = self->_has;
        v30 = v4[52];
      }
      v34 = (*(unsigned int *)&has >> 2) & 1;
      if (v34 == ((v30 >> 2) & 1))
      {
        if (!v34
          || (carPlayConnection = self->_carPlayConnection,
              carPlayConnection == objc_msgSend(v4, "carPlayConnection")))
        {
          v27 = 1;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[ODDSiriSchemaODDAssistantDimensions hash](self->_assistantDimensions, "hash");
  v4 = -[NSString hash](self->_vehicleManufacturer, "hash");
  v5 = -[NSString hash](self->_vehicleName, "hash");
  v6 = -[NSString hash](self->_vehicleModel, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v7 = 2654435761 * self->_enhancedVoiceTriggerMode;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_directAction;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = 2654435761 * self->_carPlayConnection;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assistantDimensions)
  {
    -[ODDSiriSchemaODDAssistantCarPlayDimensions assistantDimensions](self, "assistantDimensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assistantDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assistantDimensions"));

    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = -[ODDSiriSchemaODDAssistantCarPlayDimensions carPlayConnection](self, "carPlayConnection") - 1;
    if (v8 > 2)
      v9 = CFSTR("CARPLAYCONNECTION_UNKNOWN");
    else
      v9 = off_1E563C448[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("carPlayConnection"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 1) == 0)
        goto LABEL_22;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_8;
  }
  v10 = -[ODDSiriSchemaODDAssistantCarPlayDimensions directAction](self, "directAction") - 1;
  if (v10 > 9)
    v11 = CFSTR("SIRIDIRECTACTION_UNKNOWN_DIRECT_ACTION");
  else
    v11 = off_1E563C460[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("directAction"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_18:
    v12 = -[ODDSiriSchemaODDAssistantCarPlayDimensions enhancedVoiceTriggerMode](self, "enhancedVoiceTriggerMode") - 1;
    if (v12 > 3)
      v13 = CFSTR("ENHANCEDVOICETRIGGERMODE_UNKNOWN");
    else
      v13 = off_1E563C4B0[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("enhancedVoiceTriggerMode"));
  }
LABEL_22:
  if (self->_vehicleManufacturer)
  {
    -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleManufacturer](self, "vehicleManufacturer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("vehicleManufacturer"));

  }
  if (self->_vehicleModel)
  {
    -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleModel](self, "vehicleModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("vehicleModel"));

  }
  if (self->_vehicleName)
  {
    -[ODDSiriSchemaODDAssistantCarPlayDimensions vehicleName](self, "vehicleName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("vehicleName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantCarPlayDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantCarPlayDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantCarPlayDimensions *v5;
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
    self = -[ODDSiriSchemaODDAssistantCarPlayDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantCarPlayDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantCarPlayDimensions *v5;
  void *v6;
  ODDSiriSchemaODDAssistantDimensions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ODDSiriSchemaODDAssistantCarPlayDimensions *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDAssistantCarPlayDimensions;
  v5 = -[ODDSiriSchemaODDAssistantCarPlayDimensions init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssistantDimensions initWithDictionary:]([ODDSiriSchemaODDAssistantDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setAssistantDimensions:](v5, "setAssistantDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vehicleManufacturer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setVehicleManufacturer:](v5, "setVehicleManufacturer:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vehicleName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setVehicleName:](v5, "setVehicleName:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vehicleModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setVehicleModel:](v5, "setVehicleModel:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enhancedVoiceTriggerMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setEnhancedVoiceTriggerMode:](v5, "setEnhancedVoiceTriggerMode:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directAction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setDirectAction:](v5, "setDirectAction:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayConnection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setCarPlayConnection:](v5, "setCarPlayConnection:", objc_msgSend(v16, "intValue"));
    v17 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (void)setAssistantDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_assistantDimensions, a3);
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (void)setVehicleManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)vehicleModel
{
  return self->_vehicleModel;
}

- (void)setVehicleModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)enhancedVoiceTriggerMode
{
  return self->_enhancedVoiceTriggerMode;
}

- (int)directAction
{
  return self->_directAction;
}

- (int)carPlayConnection
{
  return self->_carPlayConnection;
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasVehicleManufacturer:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasVehicleName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasVehicleModel:(BOOL)a3
{
  self->_hasAssistantDimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleModel, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

@end
