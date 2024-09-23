@implementation IFTSchemaIFTActionRequirement

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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTActionRequirement;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTActionRequirement deleteAppRequirement](self, "deleteAppRequirement");
  -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTActionRequirement deletePermissionRequirement](self, "deletePermissionRequirement");
  -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTActionRequirement deleteSystemRequirement](self, "deleteSystemRequirement");

  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTActionRequirement setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUnsupported:(BOOL)a3
{
  IFTSchemaIFTAppRequirement *appRequirement;
  IFTSchemaIFTPermissionRequirement *permissionRequirement;
  IFTSchemaIFTSystemRequirement *systemRequirement;

  appRequirement = self->_appRequirement;
  self->_appRequirement = 0;

  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = 0;

  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = 0;

  self->_whichOneof_Actionrequirement = 11;
  self->_unsupported = a3;
}

- (BOOL)unsupported
{
  return self->_whichOneof_Actionrequirement == 11 && self->_unsupported;
}

- (void)deleteUnsupported
{
  if (self->_whichOneof_Actionrequirement == 11)
  {
    self->_whichOneof_Actionrequirement = 0;
    self->_unsupported = 0;
  }
}

- (void)setAppRequirement:(id)a3
{
  IFTSchemaIFTAppRequirement *v4;
  IFTSchemaIFTPermissionRequirement *permissionRequirement;
  IFTSchemaIFTSystemRequirement *systemRequirement;
  unint64_t v7;
  IFTSchemaIFTAppRequirement *appRequirement;

  v4 = (IFTSchemaIFTAppRequirement *)a3;
  self->_unsupported = 0;
  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = 0;

  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = 0;

  v7 = 12;
  if (!v4)
    v7 = 0;
  self->_whichOneof_Actionrequirement = v7;
  appRequirement = self->_appRequirement;
  self->_appRequirement = v4;

}

- (IFTSchemaIFTAppRequirement)appRequirement
{
  if (self->_whichOneof_Actionrequirement == 12)
    return self->_appRequirement;
  else
    return (IFTSchemaIFTAppRequirement *)0;
}

- (void)deleteAppRequirement
{
  IFTSchemaIFTAppRequirement *appRequirement;

  if (self->_whichOneof_Actionrequirement == 12)
  {
    self->_whichOneof_Actionrequirement = 0;
    appRequirement = self->_appRequirement;
    self->_appRequirement = 0;

  }
}

- (void)setPermissionRequirement:(id)a3
{
  IFTSchemaIFTPermissionRequirement *v4;
  IFTSchemaIFTAppRequirement *appRequirement;
  IFTSchemaIFTSystemRequirement *systemRequirement;
  unint64_t v7;
  IFTSchemaIFTPermissionRequirement *permissionRequirement;

  v4 = (IFTSchemaIFTPermissionRequirement *)a3;
  self->_unsupported = 0;
  appRequirement = self->_appRequirement;
  self->_appRequirement = 0;

  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = 0;

  v7 = 13;
  if (!v4)
    v7 = 0;
  self->_whichOneof_Actionrequirement = v7;
  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = v4;

}

- (IFTSchemaIFTPermissionRequirement)permissionRequirement
{
  if (self->_whichOneof_Actionrequirement == 13)
    return self->_permissionRequirement;
  else
    return (IFTSchemaIFTPermissionRequirement *)0;
}

- (void)deletePermissionRequirement
{
  IFTSchemaIFTPermissionRequirement *permissionRequirement;

  if (self->_whichOneof_Actionrequirement == 13)
  {
    self->_whichOneof_Actionrequirement = 0;
    permissionRequirement = self->_permissionRequirement;
    self->_permissionRequirement = 0;

  }
}

- (void)setSystemRequirement:(id)a3
{
  IFTSchemaIFTSystemRequirement *v4;
  IFTSchemaIFTAppRequirement *appRequirement;
  IFTSchemaIFTPermissionRequirement *permissionRequirement;
  unint64_t v7;
  IFTSchemaIFTSystemRequirement *systemRequirement;

  v4 = (IFTSchemaIFTSystemRequirement *)a3;
  self->_unsupported = 0;
  appRequirement = self->_appRequirement;
  self->_appRequirement = 0;

  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = 0;

  v7 = 14;
  if (!v4)
    v7 = 0;
  self->_whichOneof_Actionrequirement = v7;
  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = v4;

}

- (IFTSchemaIFTSystemRequirement)systemRequirement
{
  if (self->_whichOneof_Actionrequirement == 14)
    return self->_systemRequirement;
  else
    return (IFTSchemaIFTSystemRequirement *)0;
}

- (void)deleteSystemRequirement
{
  IFTSchemaIFTSystemRequirement *systemRequirement;

  if (self->_whichOneof_Actionrequirement == 14)
  {
    self->_whichOneof_Actionrequirement = 0;
    systemRequirement = self->_systemRequirement;
    self->_systemRequirement = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionRequirementReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_whichOneof_Actionrequirement == 11)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichOneof_Actionrequirement;
  int exists;
  int unsupported;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  whichOneof_Actionrequirement = self->_whichOneof_Actionrequirement;
  if (whichOneof_Actionrequirement != objc_msgSend(v4, "whichOneof_Actionrequirement"))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_22;
  }
  unsupported = self->_unsupported;
  if (unsupported != objc_msgSend(v4, "unsupported"))
    goto LABEL_22;
  -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_21;
  -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appRequirement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_22;
  }
  else
  {

  }
  -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "permissionRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_21;
  -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "permissionRequirement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_22;
  }
  else
  {

  }
  -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) != (v9 != 0))
  {
    -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_25:
      v25 = 1;
      goto LABEL_23;
    }
    v21 = (void *)v20;
    -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemRequirement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v25 = 0;
LABEL_23:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  if (self->_whichOneof_Actionrequirement == 11)
    v4 = 2654435761 * self->_unsupported;
  else
    v4 = 0;
  v5 = v4 ^ v3 ^ -[IFTSchemaIFTAppRequirement hash](self->_appRequirement, "hash");
  v6 = -[IFTSchemaIFTPermissionRequirement hash](self->_permissionRequirement, "hash");
  return v5 ^ v6 ^ -[IFTSchemaIFTSystemRequirement hash](self->_systemRequirement, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appRequirement)
  {
    -[IFTSchemaIFTActionRequirement appRequirement](self, "appRequirement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appRequirement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appRequirement"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionRequirement exists](self, "exists"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("exists"));

  }
  if (self->_permissionRequirement)
  {
    -[IFTSchemaIFTActionRequirement permissionRequirement](self, "permissionRequirement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("permissionRequirement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("permissionRequirement"));

    }
  }
  if (self->_systemRequirement)
  {
    -[IFTSchemaIFTActionRequirement systemRequirement](self, "systemRequirement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("systemRequirement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("systemRequirement"));

    }
  }
  if (self->_whichOneof_Actionrequirement == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTActionRequirement unsupported](self, "unsupported"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("unsupported"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTActionRequirement dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTActionRequirement)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTActionRequirement *v5;
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
    self = -[IFTSchemaIFTActionRequirement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTActionRequirement)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTActionRequirement *v5;
  void *v6;
  void *v7;
  void *v8;
  IFTSchemaIFTAppRequirement *v9;
  void *v10;
  IFTSchemaIFTPermissionRequirement *v11;
  void *v12;
  IFTSchemaIFTSystemRequirement *v13;
  IFTSchemaIFTActionRequirement *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTActionRequirement;
  v5 = -[IFTSchemaIFTActionRequirement init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionRequirement setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unsupported"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTActionRequirement setUnsupported:](v5, "setUnsupported:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appRequirement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTAppRequirement initWithDictionary:]([IFTSchemaIFTAppRequirement alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTActionRequirement setAppRequirement:](v5, "setAppRequirement:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("permissionRequirement"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTPermissionRequirement initWithDictionary:]([IFTSchemaIFTPermissionRequirement alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTActionRequirement setPermissionRequirement:](v5, "setPermissionRequirement:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemRequirement"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaIFTSystemRequirement initWithDictionary:]([IFTSchemaIFTSystemRequirement alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTActionRequirement setSystemRequirement:](v5, "setSystemRequirement:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Actionrequirement
{
  return self->_whichOneof_Actionrequirement;
}

- (BOOL)exists
{
  return self->_exists;
}

- (BOOL)hasUnsupported
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasUnsupported:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasAppRequirement
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasAppRequirement:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasPermissionRequirement
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasPermissionRequirement:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (BOOL)hasSystemRequirement
{
  return self->_hasUnsupported;
}

- (void)setHasSystemRequirement:(BOOL)a3
{
  self->_hasUnsupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemRequirement, 0);
  objc_storeStrong((id *)&self->_permissionRequirement, 0);
  objc_storeStrong((id *)&self->_appRequirement, 0);
}

@end
