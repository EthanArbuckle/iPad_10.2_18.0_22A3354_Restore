@implementation PSESchemaPSEMapsUserFollowup

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFollowupType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_followupType = a3;
}

- (BOOL)hasFollowupType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFollowupType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFollowupType
{
  -[PSESchemaPSEMapsUserFollowup setFollowupType:](self, "setFollowupType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMapsAction:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mapsAction = a3;
}

- (BOOL)hasMapsAction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMapsAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMapsAction
{
  -[PSESchemaPSEMapsUserFollowup setMapsAction:](self, "setMapsAction:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasMapsActionType
{
  return self->_mapsActionType != 0;
}

- (void)deleteMapsActionType
{
  -[PSESchemaPSEMapsUserFollowup setMapsActionType:](self, "setMapsActionType:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMapsUserFollowupReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PSESchemaPSEMapsUserFollowup mapsActionType](self, "mapsActionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $E2817F952441EE149CA469B42D9B5233 has;
  unsigned int v6;
  int followupType;
  int v8;
  int mapsAction;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    followupType = self->_followupType;
    if (followupType != objc_msgSend(v4, "followupType"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (mapsAction = self->_mapsAction, mapsAction == objc_msgSend(v4, "mapsAction")))
    {
      -[PSESchemaPSEMapsUserFollowup mapsActionType](self, "mapsActionType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapsActionType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[PSESchemaPSEMapsUserFollowup mapsActionType](self, "mapsActionType");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[PSESchemaPSEMapsUserFollowup mapsActionType](self, "mapsActionType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mapsActionType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_followupType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_mapsActionType, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_mapsAction;
  return v3 ^ v2 ^ -[NSString hash](self->_mapsActionType, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[PSESchemaPSEMapsUserFollowup followupType](self, "followupType");
    v6 = CFSTR("PSEMAPSFOLLOWUP_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("PSEMAPSFOLLOWUP_SIRI_RESULT");
    if (v5 == 2)
      v7 = CFSTR("PSEMAPSFOLLOWUP_USER_INITIATED_NEW_SEARCH");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("followupType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = -[PSESchemaPSEMapsUserFollowup mapsAction](self, "mapsAction") - 1;
    if (v8 > 5)
      v9 = CFSTR("PSEMAPSACTION_UNKNOWN");
    else
      v9 = off_1E563BBC0[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mapsAction"));
  }
  if (self->_mapsActionType)
  {
    -[PSESchemaPSEMapsUserFollowup mapsActionType](self, "mapsActionType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mapsActionType"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEMapsUserFollowup dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEMapsUserFollowup)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEMapsUserFollowup *v5;
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
    self = -[PSESchemaPSEMapsUserFollowup initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEMapsUserFollowup)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEMapsUserFollowup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSESchemaPSEMapsUserFollowup *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSEMapsUserFollowup;
  v5 = -[PSESchemaPSEMapsUserFollowup init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followupType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMapsUserFollowup setFollowupType:](v5, "setFollowupType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMapsUserFollowup setMapsAction:](v5, "setMapsAction:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsActionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PSESchemaPSEMapsUserFollowup setMapsActionType:](v5, "setMapsActionType:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)followupType
{
  return self->_followupType;
}

- (int)mapsAction
{
  return self->_mapsAction;
}

- (NSString)mapsActionType
{
  return self->_mapsActionType;
}

- (void)setMapsActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasMapsActionType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsActionType, 0);
}

@end
