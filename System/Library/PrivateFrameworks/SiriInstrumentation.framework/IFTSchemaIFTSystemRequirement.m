@implementation IFTSchemaIFTSystemRequirement

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
  v9.super_class = (Class)IFTSchemaIFTSystemRequirement;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTSystemRequirement deleteProtectedAppApprovalRequired](self, "deleteProtectedAppApprovalRequired");
  return v5;
}

- (void)setDeviceUnlockRequired:(BOOL)a3
{
  IFTSchemaIFTSystemRequirementProtectedAppRequest *protectedAppApprovalRequired;

  self->_authenticationRequired = 0;
  self->_appLaunchRequired = 0;
  self->_carPlayIncompatible = 0;
  self->_carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  self->_whichOneof_Systemrequirement = 1;
  self->_deviceUnlockRequired = a3;
}

- (BOOL)deviceUnlockRequired
{
  return self->_whichOneof_Systemrequirement == 1 && self->_deviceUnlockRequired;
}

- (void)deleteDeviceUnlockRequired
{
  if (self->_whichOneof_Systemrequirement == 1)
  {
    self->_whichOneof_Systemrequirement = 0;
    self->_deviceUnlockRequired = 0;
  }
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  IFTSchemaIFTSystemRequirementProtectedAppRequest *protectedAppApprovalRequired;

  self->_deviceUnlockRequired = 0;
  self->_appLaunchRequired = 0;
  self->_carPlayIncompatible = 0;
  self->_carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  self->_whichOneof_Systemrequirement = 2;
  self->_authenticationRequired = a3;
}

- (BOOL)authenticationRequired
{
  return self->_whichOneof_Systemrequirement == 2 && self->_authenticationRequired;
}

- (void)deleteAuthenticationRequired
{
  if (self->_whichOneof_Systemrequirement == 2)
  {
    self->_whichOneof_Systemrequirement = 0;
    self->_authenticationRequired = 0;
  }
}

- (void)setAppLaunchRequired:(BOOL)a3
{
  IFTSchemaIFTSystemRequirementProtectedAppRequest *protectedAppApprovalRequired;

  self->_deviceUnlockRequired = 0;
  self->_authenticationRequired = 0;
  self->_carPlayIncompatible = 0;
  self->_carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  self->_whichOneof_Systemrequirement = 3;
  self->_appLaunchRequired = a3;
}

- (BOOL)appLaunchRequired
{
  return self->_whichOneof_Systemrequirement == 3 && self->_appLaunchRequired;
}

- (void)deleteAppLaunchRequired
{
  if (self->_whichOneof_Systemrequirement == 3)
  {
    self->_whichOneof_Systemrequirement = 0;
    self->_appLaunchRequired = 0;
  }
}

- (void)setCarPlayIncompatible:(BOOL)a3
{
  IFTSchemaIFTSystemRequirementProtectedAppRequest *protectedAppApprovalRequired;

  self->_deviceUnlockRequired = 0;
  self->_authenticationRequired = 0;
  self->_appLaunchRequired = 0;
  self->_carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  self->_whichOneof_Systemrequirement = 4;
  self->_carPlayIncompatible = a3;
}

- (BOOL)carPlayIncompatible
{
  return self->_whichOneof_Systemrequirement == 4 && self->_carPlayIncompatible;
}

- (void)deleteCarPlayIncompatible
{
  if (self->_whichOneof_Systemrequirement == 4)
  {
    self->_whichOneof_Systemrequirement = 0;
    self->_carPlayIncompatible = 0;
  }
}

- (void)setCarBluetoothIncompatible:(BOOL)a3
{
  IFTSchemaIFTSystemRequirementProtectedAppRequest *protectedAppApprovalRequired;

  self->_deviceUnlockRequired = 0;
  self->_authenticationRequired = 0;
  self->_appLaunchRequired = 0;
  self->_carPlayIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  self->_whichOneof_Systemrequirement = 5;
  self->_carBluetoothIncompatible = a3;
}

- (BOOL)carBluetoothIncompatible
{
  return self->_whichOneof_Systemrequirement == 5 && self->_carBluetoothIncompatible;
}

- (void)deleteCarBluetoothIncompatible
{
  if (self->_whichOneof_Systemrequirement == 5)
  {
    self->_whichOneof_Systemrequirement = 0;
    self->_carBluetoothIncompatible = 0;
  }
}

- (void)setProtectedAppApprovalRequired:(id)a3
{
  unint64_t v3;

  self->_deviceUnlockRequired = 0;
  self->_authenticationRequired = 0;
  self->_appLaunchRequired = 0;
  self->_carPlayIncompatible = 0;
  self->_carBluetoothIncompatible = 0;
  v3 = 6;
  if (!a3)
    v3 = 0;
  self->_whichOneof_Systemrequirement = v3;
  objc_storeStrong((id *)&self->_protectedAppApprovalRequired, a3);
}

- (IFTSchemaIFTSystemRequirementProtectedAppRequest)protectedAppApprovalRequired
{
  if (self->_whichOneof_Systemrequirement == 6)
    return self->_protectedAppApprovalRequired;
  else
    return (IFTSchemaIFTSystemRequirementProtectedAppRequest *)0;
}

- (void)deleteProtectedAppApprovalRequired
{
  IFTSchemaIFTSystemRequirementProtectedAppRequest *protectedAppApprovalRequired;

  if (self->_whichOneof_Systemrequirement == 6)
  {
    self->_whichOneof_Systemrequirement = 0;
    protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
    self->_protectedAppApprovalRequired = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSystemRequirementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichOneof_Systemrequirement;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  if (whichOneof_Systemrequirement == 1)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 2)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 3)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 4)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 5)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Systemrequirement;
  int deviceUnlockRequired;
  int authenticationRequired;
  int appLaunchRequired;
  int carPlayIncompatible;
  int carBluetoothIncompatible;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
    if (whichOneof_Systemrequirement == objc_msgSend(v4, "whichOneof_Systemrequirement"))
    {
      deviceUnlockRequired = self->_deviceUnlockRequired;
      if (deviceUnlockRequired == objc_msgSend(v4, "deviceUnlockRequired"))
      {
        authenticationRequired = self->_authenticationRequired;
        if (authenticationRequired == objc_msgSend(v4, "authenticationRequired"))
        {
          appLaunchRequired = self->_appLaunchRequired;
          if (appLaunchRequired == objc_msgSend(v4, "appLaunchRequired"))
          {
            carPlayIncompatible = self->_carPlayIncompatible;
            if (carPlayIncompatible == objc_msgSend(v4, "carPlayIncompatible"))
            {
              carBluetoothIncompatible = self->_carBluetoothIncompatible;
              if (carBluetoothIncompatible == objc_msgSend(v4, "carBluetoothIncompatible"))
              {
                -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "protectedAppApprovalRequired");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = v12;
                if ((v11 == 0) != (v12 != 0))
                {
                  -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired");
                  v14 = objc_claimAutoreleasedReturnValue();
                  if (!v14)
                  {

LABEL_16:
                    v19 = 1;
                    goto LABEL_14;
                  }
                  v15 = (void *)v14;
                  -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "protectedAppApprovalRequired");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v16, "isEqual:", v17);

                  if ((v18 & 1) != 0)
                    goto LABEL_16;
                }
                else
                {

                }
              }
            }
          }
        }
      }
    }
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_whichOneof_Systemrequirement - 1;
  if (v2 > 4)
    v3 = 0;
  else
    v3 = 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E563DBD8[v2]);
  return -[IFTSchemaIFTSystemRequirementProtectedAppRequest hash](self->_protectedAppApprovalRequired, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Systemrequirement;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  if (whichOneof_Systemrequirement == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemRequirement appLaunchRequired](self, "appLaunchRequired"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appLaunchRequired"));

    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemRequirement authenticationRequired](self, "authenticationRequired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("authenticationRequired"));

    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemRequirement carBluetoothIncompatible](self, "carBluetoothIncompatible"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("carBluetoothIncompatible"));

    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemRequirement carPlayIncompatible](self, "carPlayIncompatible"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("carPlayIncompatible"));

    whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTSystemRequirement deviceUnlockRequired](self, "deviceUnlockRequired"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceUnlockRequired"));

  }
  if (self->_protectedAppApprovalRequired)
  {
    -[IFTSchemaIFTSystemRequirement protectedAppApprovalRequired](self, "protectedAppApprovalRequired");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("protectedAppApprovalRequired"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("protectedAppApprovalRequired"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTSystemRequirement dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTSystemRequirement)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTSystemRequirement *v5;
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
    self = -[IFTSchemaIFTSystemRequirement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTSystemRequirement)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTSystemRequirement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IFTSchemaIFTSystemRequirementProtectedAppRequest *v12;
  IFTSchemaIFTSystemRequirement *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTSystemRequirement;
  v5 = -[IFTSchemaIFTSystemRequirement init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceUnlockRequired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemRequirement setDeviceUnlockRequired:](v5, "setDeviceUnlockRequired:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authenticationRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemRequirement setAuthenticationRequired:](v5, "setAuthenticationRequired:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLaunchRequired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemRequirement setAppLaunchRequired:](v5, "setAppLaunchRequired:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayIncompatible"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemRequirement setCarPlayIncompatible:](v5, "setCarPlayIncompatible:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carBluetoothIncompatible"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTSystemRequirement setCarBluetoothIncompatible:](v5, "setCarBluetoothIncompatible:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protectedAppApprovalRequired"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[IFTSchemaIFTSystemRequirementProtectedAppRequest initWithDictionary:]([IFTSchemaIFTSystemRequirementProtectedAppRequest alloc], "initWithDictionary:", v11);
      -[IFTSchemaIFTSystemRequirement setProtectedAppApprovalRequired:](v5, "setProtectedAppApprovalRequired:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Systemrequirement
{
  return self->_whichOneof_Systemrequirement;
}

- (BOOL)hasDeviceUnlockRequired
{
  return self->_hasDeviceUnlockRequired;
}

- (void)setHasDeviceUnlockRequired:(BOOL)a3
{
  self->_hasDeviceUnlockRequired = a3;
}

- (BOOL)hasAuthenticationRequired
{
  return self->_hasAuthenticationRequired;
}

- (void)setHasAuthenticationRequired:(BOOL)a3
{
  self->_hasAuthenticationRequired = a3;
}

- (BOOL)hasAppLaunchRequired
{
  return self->_hasAppLaunchRequired;
}

- (void)setHasAppLaunchRequired:(BOOL)a3
{
  self->_hasAppLaunchRequired = a3;
}

- (BOOL)hasCarPlayIncompatible
{
  return self->_hasCarPlayIncompatible;
}

- (void)setHasCarPlayIncompatible:(BOOL)a3
{
  self->_hasCarPlayIncompatible = a3;
}

- (BOOL)hasCarBluetoothIncompatible
{
  return self->_hasCarBluetoothIncompatible;
}

- (void)setHasCarBluetoothIncompatible:(BOOL)a3
{
  self->_hasCarBluetoothIncompatible = a3;
}

- (BOOL)hasProtectedAppApprovalRequired
{
  return self->_hasProtectedAppApprovalRequired;
}

- (void)setHasProtectedAppApprovalRequired:(BOOL)a3
{
  self->_hasProtectedAppApprovalRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedAppApprovalRequired, 0);
}

@end
