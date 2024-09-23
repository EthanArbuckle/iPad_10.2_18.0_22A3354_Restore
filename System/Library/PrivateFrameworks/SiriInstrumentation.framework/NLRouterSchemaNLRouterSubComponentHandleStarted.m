@implementation NLRouterSchemaNLRouterSubComponentHandleStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
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
  -[NLRouterSchemaNLRouterSubComponentHandleStarted setNlRouterSubComponent:](self, "setNlRouterSubComponent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteAssetVersion
{
  -[NLRouterSchemaNLRouterSubComponentHandleStarted setAssetVersion:](self, "setAssetVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterSubComponentHandleStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NLRouterSchemaNLRouterSubComponentHandleStarted assetVersion](self, "assetVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
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
        -[NLRouterSchemaNLRouterSubComponentHandleStarted assetVersion](self, "assetVersion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "assetVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[NLRouterSchemaNLRouterSubComponentHandleStarted assetVersion](self, "assetVersion");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[NLRouterSchemaNLRouterSubComponentHandleStarted assetVersion](self, "assetVersion");
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
  return -[NSString hash](self->_assetVersion, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetVersion)
  {
    -[NLRouterSchemaNLRouterSubComponentHandleStarted assetVersion](self, "assetVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = -[NLRouterSchemaNLRouterSubComponentHandleStarted nlRouterSubComponent](self, "nlRouterSubComponent") - 1;
    if (v6 > 5)
      v7 = CFSTR("NLROUTERSUBCOMPONENT_UNKNOWN");
    else
      v7 = off_1E563C810[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("nlRouterSubComponent"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLRouterSchemaNLRouterSubComponentHandleStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLRouterSchemaNLRouterSubComponentHandleStarted)initWithJSON:(id)a3
{
  void *v4;
  NLRouterSchemaNLRouterSubComponentHandleStarted *v5;
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
    self = -[NLRouterSchemaNLRouterSubComponentHandleStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLRouterSchemaNLRouterSubComponentHandleStarted)initWithDictionary:(id)a3
{
  id v4;
  NLRouterSchemaNLRouterSubComponentHandleStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  NLRouterSchemaNLRouterSubComponentHandleStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterSubComponentHandleStarted;
  v5 = -[NLRouterSchemaNLRouterSubComponentHandleStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterSubComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLRouterSchemaNLRouterSubComponentHandleStarted setNlRouterSubComponent:](v5, "setNlRouterSubComponent:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[NLRouterSchemaNLRouterSubComponentHandleStarted setAssetVersion:](v5, "setAssetVersion:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)nlRouterSubComponent
{
  return self->_nlRouterSubComponent;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
