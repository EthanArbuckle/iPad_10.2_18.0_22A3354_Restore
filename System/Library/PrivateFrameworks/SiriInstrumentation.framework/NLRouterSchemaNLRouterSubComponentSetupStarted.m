@implementation NLRouterSchemaNLRouterSubComponentSetupStarted

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
  v9.super_class = (Class)NLRouterSchemaNLRouterSubComponentSetupStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NLRouterSchemaNLRouterSubComponentSetupStarted deleteAssetVersion](self, "deleteAssetVersion");
  return v5;
}

- (void)setNlRouterSubComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nlRouterSubComponent = a3;
}

- (BOOL)hasNlRouterSubComponent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNlRouterSubComponent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNlRouterSubComponent
{
  -[NLRouterSchemaNLRouterSubComponentSetupStarted setNlRouterSubComponent:](self, "setNlRouterSubComponent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteAssetVersion
{
  -[NLRouterSchemaNLRouterSubComponentSetupStarted setAssetVersion:](self, "setAssetVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterSubComponentSetupStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int nlRouterSubComponent;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (nlRouterSubComponent = self->_nlRouterSubComponent,
            nlRouterSubComponent == objc_msgSend(v4, "nlRouterSubComponent")))
      {
        -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "assetVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "assetVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_nlRouterSubComponent;
  else
    v2 = 0;
  return -[SISchemaVersion hash](self->_assetVersion, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetVersion)
  {
    -[NLRouterSchemaNLRouterSubComponentSetupStarted assetVersion](self, "assetVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assetVersion"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[NLRouterSchemaNLRouterSubComponentSetupStarted nlRouterSubComponent](self, "nlRouterSubComponent") - 1;
    if (v7 > 5)
      v8 = CFSTR("NLROUTERSUBCOMPONENT_UNKNOWN");
    else
      v8 = off_1E563C840[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nlRouterSubComponent"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLRouterSchemaNLRouterSubComponentSetupStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLRouterSchemaNLRouterSubComponentSetupStarted)initWithJSON:(id)a3
{
  void *v4;
  NLRouterSchemaNLRouterSubComponentSetupStarted *v5;
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
    self = -[NLRouterSchemaNLRouterSubComponentSetupStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLRouterSchemaNLRouterSubComponentSetupStarted)initWithDictionary:(id)a3
{
  id v4;
  NLRouterSchemaNLRouterSubComponentSetupStarted *v5;
  void *v6;
  void *v7;
  SISchemaVersion *v8;
  NLRouterSchemaNLRouterSubComponentSetupStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterSubComponentSetupStarted;
  v5 = -[NLRouterSchemaNLRouterSubComponentSetupStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterSubComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLRouterSchemaNLRouterSubComponentSetupStarted setNlRouterSubComponent:](v5, "setNlRouterSubComponent:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v7);
      -[NLRouterSchemaNLRouterSubComponentSetupStarted setAssetVersion:](v5, "setAssetVersion:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)nlRouterSubComponent
{
  return self->_nlRouterSubComponent;
}

- (SISchemaVersion)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

@end
