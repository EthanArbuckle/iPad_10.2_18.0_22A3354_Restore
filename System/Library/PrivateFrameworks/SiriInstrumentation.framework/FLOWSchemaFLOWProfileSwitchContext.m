@implementation FLOWSchemaFLOWProfileSwitchContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setProfileSwitchMethod:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_profileSwitchMethod = a3;
}

- (BOOL)hasProfileSwitchMethod
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProfileSwitchMethod:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProfileSwitchMethod
{
  -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchMethod:](self, "setProfileSwitchMethod:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setProfileSwitchByNameType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_profileSwitchByNameType = a3;
}

- (BOOL)hasProfileSwitchByNameType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasProfileSwitchByNameType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteProfileSwitchByNameType
{
  -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchByNameType:](self, "setProfileSwitchByNameType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setProfileSwitchOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_profileSwitchOutcome = a3;
}

- (BOOL)hasProfileSwitchOutcome
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProfileSwitchOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProfileSwitchOutcome
{
  -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchOutcome:](self, "setProfileSwitchOutcome:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setProfileSwitchFailureReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_profileSwitchFailureReason = a3;
}

- (BOOL)hasProfileSwitchFailureReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasProfileSwitchFailureReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteProfileSwitchFailureReason
{
  -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchFailureReason:](self, "setProfileSwitchFailureReason:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setProfileSwitchDurationInMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_profileSwitchDurationInMs = a3;
}

- (BOOL)hasProfileSwitchDurationInMs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasProfileSwitchDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteProfileSwitchDurationInMs
{
  -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchDurationInMs:](self, "setProfileSwitchDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWProfileSwitchContextReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $DFC4F393206D581EC1D2F97C42C2F712 has;
  unsigned int v6;
  int profileSwitchMethod;
  int v8;
  int profileSwitchByNameType;
  int v10;
  int profileSwitchOutcome;
  int v12;
  int profileSwitchFailureReason;
  int v14;
  unsigned int profileSwitchDurationInMs;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    profileSwitchMethod = self->_profileSwitchMethod;
    if (profileSwitchMethod != objc_msgSend(v4, "profileSwitchMethod"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    profileSwitchByNameType = self->_profileSwitchByNameType;
    if (profileSwitchByNameType != objc_msgSend(v4, "profileSwitchByNameType"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    profileSwitchOutcome = self->_profileSwitchOutcome;
    if (profileSwitchOutcome != objc_msgSend(v4, "profileSwitchOutcome"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    profileSwitchFailureReason = self->_profileSwitchFailureReason;
    if (profileSwitchFailureReason == objc_msgSend(v4, "profileSwitchFailureReason"))
    {
      has = self->_has;
      v6 = v4[28];
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
    profileSwitchDurationInMs = self->_profileSwitchDurationInMs;
    if (profileSwitchDurationInMs != objc_msgSend(v4, "profileSwitchDurationInMs"))
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
    v2 = 2654435761 * self->_profileSwitchMethod;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_profileSwitchByNameType;
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
    v4 = 2654435761 * self->_profileSwitchOutcome;
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
  v5 = 2654435761 * self->_profileSwitchFailureReason;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_profileSwitchDurationInMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = -[FLOWSchemaFLOWProfileSwitchContext profileSwitchByNameType](self, "profileSwitchByNameType") - 1;
    if (v9 > 7)
      v10 = CFSTR("FLOWPROFILESWITCHBYNAMETYPE_UNKNOWN");
    else
      v10 = off_1E562E7C0[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("profileSwitchByNameType"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWProfileSwitchContext profileSwitchDurationInMs](self, "profileSwitchDurationInMs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("profileSwitchDurationInMs"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_22:
    v14 = -[FLOWSchemaFLOWProfileSwitchContext profileSwitchMethod](self, "profileSwitchMethod") - 1;
    if (v14 > 2)
      v15 = CFSTR("FLOWPROFILESWITCHMETHOD_UNKNOWN");
    else
      v15 = off_1E562E820[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("profileSwitchMethod"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_12;
    goto LABEL_6;
  }
LABEL_18:
  v12 = -[FLOWSchemaFLOWProfileSwitchContext profileSwitchFailureReason](self, "profileSwitchFailureReason") - 1;
  if (v12 > 3)
    v13 = CFSTR("FLOWPROFILESWITCHFAILUREREASON_UNKNOWN");
  else
    v13 = off_1E562E800[v12];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("profileSwitchFailureReason"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_22;
LABEL_5:
  if ((has & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v5 = -[FLOWSchemaFLOWProfileSwitchContext profileSwitchOutcome](self, "profileSwitchOutcome");
  v6 = CFSTR("FLOWPROFILESWITCHOUTCOME_UNKNOWN");
  if (v5 == 1)
    v6 = CFSTR("FLOWPROFILESWITCHOUTCOME_SUCCESS");
  if (v5 == 2)
    v7 = CFSTR("FLOWPROFILESWITCHOUTCOME_FAILURE");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("profileSwitchOutcome"));
LABEL_12:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWProfileSwitchContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWProfileSwitchContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWProfileSwitchContext *v5;
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
    self = -[FLOWSchemaFLOWProfileSwitchContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWProfileSwitchContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWProfileSwitchContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FLOWSchemaFLOWProfileSwitchContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWProfileSwitchContext;
  v5 = -[FLOWSchemaFLOWProfileSwitchContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileSwitchMethod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchMethod:](v5, "setProfileSwitchMethod:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileSwitchByNameType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchByNameType:](v5, "setProfileSwitchByNameType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileSwitchOutcome"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchOutcome:](v5, "setProfileSwitchOutcome:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileSwitchFailureReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchFailureReason:](v5, "setProfileSwitchFailureReason:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileSwitchDurationInMs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWProfileSwitchContext setProfileSwitchDurationInMs:](v5, "setProfileSwitchDurationInMs:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = v5;

  }
  return v5;
}

- (int)profileSwitchMethod
{
  return self->_profileSwitchMethod;
}

- (int)profileSwitchByNameType
{
  return self->_profileSwitchByNameType;
}

- (int)profileSwitchOutcome
{
  return self->_profileSwitchOutcome;
}

- (int)profileSwitchFailureReason
{
  return self->_profileSwitchFailureReason;
}

- (unsigned)profileSwitchDurationInMs
{
  return self->_profileSwitchDurationInMs;
}

@end
