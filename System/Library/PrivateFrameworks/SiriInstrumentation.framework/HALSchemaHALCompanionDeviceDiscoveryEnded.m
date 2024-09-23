@implementation HALSchemaHALCompanionDeviceDiscoveryEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setDiscoveryType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_discoveryType = a3;
}

- (BOOL)hasDiscoveryType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDiscoveryType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDiscoveryType
{
  -[HALSchemaHALCompanionDeviceDiscoveryEnded setDiscoveryType:](self, "setDiscoveryType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsMeDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isMeDevice = a3;
}

- (BOOL)hasIsMeDevice
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsMeDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsMeDevice
{
  -[HALSchemaHALCompanionDeviceDiscoveryEnded setIsMeDevice:](self, "setIsMeDevice:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHasOtheriOSActiveDevices:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasOtheriOSActiveDevices = a3;
}

- (BOOL)hasHasOtheriOSActiveDevices
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHasOtheriOSActiveDevices:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHasOtheriOSActiveDevices
{
  -[HALSchemaHALCompanionDeviceDiscoveryEnded setHasOtheriOSActiveDevices:](self, "setHasOtheriOSActiveDevices:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setHasNullPeerIdentityServicesId:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hasNullPeerIdentityServicesId = a3;
}

- (BOOL)hasHasNullPeerIdentityServicesId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasHasNullPeerIdentityServicesId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteHasNullPeerIdentityServicesId
{
  -[HALSchemaHALCompanionDeviceDiscoveryEnded setHasNullPeerIdentityServicesId:](self, "setHasNullPeerIdentityServicesId:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setDeviceProximity:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_deviceProximity = a3;
}

- (BOOL)hasDeviceProximity
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasDeviceProximity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteDeviceProximity
{
  -[HALSchemaHALCompanionDeviceDiscoveryEnded setDeviceProximity:](self, "setDeviceProximity:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALCompanionDeviceDiscoveryEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $F5A7E65BE5A8F16E45AD300151EDB83C has;
  unsigned int v6;
  int discoveryType;
  int v8;
  int isMeDevice;
  int v10;
  int hasOtheriOSActiveDevices;
  int v12;
  int hasNullPeerIdentityServicesId;
  int v14;
  int deviceProximity;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    discoveryType = self->_discoveryType;
    if (discoveryType != objc_msgSend(v4, "discoveryType"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    isMeDevice = self->_isMeDevice;
    if (isMeDevice != objc_msgSend(v4, "isMeDevice"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[20];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    hasOtheriOSActiveDevices = self->_hasOtheriOSActiveDevices;
    if (hasOtheriOSActiveDevices != objc_msgSend(v4, "hasOtheriOSActiveDevices"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[20];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    hasNullPeerIdentityServicesId = self->_hasNullPeerIdentityServicesId;
    if (hasNullPeerIdentityServicesId == objc_msgSend(v4, "hasNullPeerIdentityServicesId"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_18;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_22;
  if (v14)
  {
    deviceProximity = self->_deviceProximity;
    if (deviceProximity != objc_msgSend(v4, "deviceProximity"))
      goto LABEL_22;
  }
  v16 = 1;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_discoveryType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isMeDevice;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_hasOtheriOSActiveDevices;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_hasNullPeerIdentityServicesId;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_deviceProximity;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = -[HALSchemaHALCompanionDeviceDiscoveryEnded deviceProximity](self, "deviceProximity") - 1;
    if (v5 > 3)
      v6 = CFSTR("HALDEVICEPROXIMITY_UNKNOWN");
    else
      v6 = off_1E5639FE8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceProximity"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[HALSchemaHALCompanionDeviceDiscoveryEnded discoveryType](self, "discoveryType") - 1;
    if (v7 > 2)
      v8 = CFSTR("HALDISCOVERYTYPE_UNKNOWN");
    else
      v8 = off_1E563A008[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("discoveryType"));
    has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HALSchemaHALCompanionDeviceDiscoveryEnded hasOtheriOSActiveDevices](self, "hasOtheriOSActiveDevices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasOtheriOSActiveDevices"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HALSchemaHALCompanionDeviceDiscoveryEnded hasNullPeerIdentityServicesId](self, "hasNullPeerIdentityServicesId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasNullPeerIdentityServicesId"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HALSchemaHALCompanionDeviceDiscoveryEnded isMeDevice](self, "isMeDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isMeDevice"));

  }
LABEL_15:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALCompanionDeviceDiscoveryEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HALSchemaHALCompanionDeviceDiscoveryEnded)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALCompanionDeviceDiscoveryEnded *v5;
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
    self = -[HALSchemaHALCompanionDeviceDiscoveryEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALCompanionDeviceDiscoveryEnded)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALCompanionDeviceDiscoveryEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HALSchemaHALCompanionDeviceDiscoveryEnded *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HALSchemaHALCompanionDeviceDiscoveryEnded;
  v5 = -[HALSchemaHALCompanionDeviceDiscoveryEnded init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discoveryType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setDiscoveryType:](v5, "setDiscoveryType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMeDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setIsMeDevice:](v5, "setIsMeDevice:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasOtheriOSActiveDevices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setHasOtheriOSActiveDevices:](v5, "setHasOtheriOSActiveDevices:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasNullPeerIdentityServicesId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setHasNullPeerIdentityServicesId:](v5, "setHasNullPeerIdentityServicesId:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceProximity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALCompanionDeviceDiscoveryEnded setDeviceProximity:](v5, "setDeviceProximity:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (int)discoveryType
{
  return self->_discoveryType;
}

- (BOOL)isMeDevice
{
  return self->_isMeDevice;
}

- (BOOL)hasOtheriOSActiveDevices
{
  return self->_hasOtheriOSActiveDevices;
}

- (BOOL)hasNullPeerIdentityServicesId
{
  return self->_hasNullPeerIdentityServicesId;
}

- (int)deviceProximity
{
  return self->_deviceProximity;
}

@end
