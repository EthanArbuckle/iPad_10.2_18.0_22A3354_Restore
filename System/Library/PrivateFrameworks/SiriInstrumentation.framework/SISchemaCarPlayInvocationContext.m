@implementation SISchemaCarPlayInvocationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)deleteBundleID
{
  -[SISchemaCarPlayInvocationContext setBundleID:](self, "setBundleID:", 0);
}

- (void)setDirectAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_directAction = a3;
}

- (BOOL)hasDirectAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDirectAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDirectAction
{
  -[SISchemaCarPlayInvocationContext setDirectAction:](self, "setDirectAction:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEnhancedVoiceTriggerMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enhancedVoiceTriggerMode = a3;
}

- (BOOL)hasEnhancedVoiceTriggerMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEnhancedVoiceTriggerMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEnhancedVoiceTriggerMode
{
  -[SISchemaCarPlayInvocationContext setEnhancedVoiceTriggerMode:](self, "setEnhancedVoiceTriggerMode:", 0);
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
  -[SISchemaCarPlayInvocationContext setCarPlayConnection:](self, "setCarPlayConnection:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCarPlayInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaCarPlayInvocationContext bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $AEE03CA14C3DBCAC50C071D8F575FF74 has;
  unsigned int v14;
  int directAction;
  int v16;
  int enhancedVoiceTriggerMode;
  int v18;
  int carPlayConnection;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[SISchemaCarPlayInvocationContext bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[SISchemaCarPlayInvocationContext bundleID](self, "bundleID");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaCarPlayInvocationContext bundleID](self, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    directAction = self->_directAction;
    if (directAction != objc_msgSend(v4, "directAction"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    enhancedVoiceTriggerMode = self->_enhancedVoiceTriggerMode;
    if (enhancedVoiceTriggerMode == objc_msgSend(v4, "enhancedVoiceTriggerMode"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    carPlayConnection = self->_carPlayConnection;
    if (carPlayConnection != objc_msgSend(v4, "carPlayConnection"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_directAction;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_enhancedVoiceTriggerMode;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_carPlayConnection;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleID)
  {
    -[SISchemaCarPlayInvocationContext bundleID](self, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleID"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = -[SISchemaCarPlayInvocationContext carPlayConnection](self, "carPlayConnection") - 1;
    if (v7 > 2)
      v8 = CFSTR("CARPLAYCONNECTION_UNKNOWN");
    else
      v8 = off_1E5634518[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("carPlayConnection"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_19;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v9 = -[SISchemaCarPlayInvocationContext directAction](self, "directAction") - 1;
  if (v9 > 9)
    v10 = CFSTR("SIRIDIRECTACTION_UNKNOWN_DIRECT_ACTION");
  else
    v10 = off_1E5634530[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("directAction"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_15:
    v11 = -[SISchemaCarPlayInvocationContext enhancedVoiceTriggerMode](self, "enhancedVoiceTriggerMode") - 1;
    if (v11 > 3)
      v12 = CFSTR("ENHANCEDVOICETRIGGERMODE_UNKNOWN");
    else
      v12 = off_1E5634580[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("enhancedVoiceTriggerMode"));
  }
LABEL_19:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaCarPlayInvocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaCarPlayInvocationContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaCarPlayInvocationContext *v5;
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
    self = -[SISchemaCarPlayInvocationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaCarPlayInvocationContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaCarPlayInvocationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaCarPlayInvocationContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaCarPlayInvocationContext;
  v5 = -[SISchemaCarPlayInvocationContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaCarPlayInvocationContext setBundleID:](v5, "setBundleID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCarPlayInvocationContext setDirectAction:](v5, "setDirectAction:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enhancedVoiceTriggerMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCarPlayInvocationContext setEnhancedVoiceTriggerMode:](v5, "setEnhancedVoiceTriggerMode:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayConnection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaCarPlayInvocationContext setCarPlayConnection:](v5, "setCarPlayConnection:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)directAction
{
  return self->_directAction;
}

- (int)enhancedVoiceTriggerMode
{
  return self->_enhancedVoiceTriggerMode;
}

- (int)carPlayConnection
{
  return self->_carPlayConnection;
}

- (void)setHasBundleID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
