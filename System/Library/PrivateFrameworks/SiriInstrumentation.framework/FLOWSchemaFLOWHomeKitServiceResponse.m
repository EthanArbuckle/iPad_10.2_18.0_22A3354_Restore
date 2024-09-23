@implementation FLOWSchemaFLOWHomeKitServiceResponse

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHomeKitServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_homeKitServiceType = a3;
}

- (BOOL)hasHomeKitServiceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHomeKitServiceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHomeKitServiceType
{
  -[FLOWSchemaFLOWHomeKitServiceResponse setHomeKitServiceType:](self, "setHomeKitServiceType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumServicesCompleted:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numServicesCompleted = a3;
}

- (BOOL)hasNumServicesCompleted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumServicesCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumServicesCompleted
{
  -[FLOWSchemaFLOWHomeKitServiceResponse setNumServicesCompleted:](self, "setNumServicesCompleted:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumServicesFailed:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numServicesFailed = a3;
}

- (BOOL)hasNumServicesFailed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumServicesFailed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumServicesFailed
{
  -[FLOWSchemaFLOWHomeKitServiceResponse setNumServicesFailed:](self, "setNumServicesFailed:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeKitServiceResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $E4857DD2975059A3F5D21873A2C6023E has;
  unsigned int v6;
  int homeKitServiceType;
  int v8;
  int numServicesCompleted;
  int v10;
  int numServicesFailed;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    homeKitServiceType = self->_homeKitServiceType;
    if (homeKitServiceType != objc_msgSend(v4, "homeKitServiceType"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    numServicesCompleted = self->_numServicesCompleted;
    if (numServicesCompleted == objc_msgSend(v4, "numServicesCompleted"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    numServicesFailed = self->_numServicesFailed;
    if (numServicesFailed != objc_msgSend(v4, "numServicesFailed"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_homeKitServiceType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_numServicesCompleted;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_numServicesFailed;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[FLOWSchemaFLOWHomeKitServiceResponse homeKitServiceType](self, "homeKitServiceType") - 1;
    if (v5 > 0x2A)
      v6 = CFSTR("FLOWHOMEKITSERVICETYPE_UNKNOWN");
    else
      v6 = off_1E562DB48[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeKitServiceType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FLOWSchemaFLOWHomeKitServiceResponse numServicesCompleted](self, "numServicesCompleted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numServicesCompleted"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FLOWSchemaFLOWHomeKitServiceResponse numServicesFailed](self, "numServicesFailed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numServicesFailed"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeKitServiceResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeKitServiceResponse)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeKitServiceResponse *v5;
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
    self = -[FLOWSchemaFLOWHomeKitServiceResponse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeKitServiceResponse)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeKitServiceResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  FLOWSchemaFLOWHomeKitServiceResponse *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWHomeKitServiceResponse;
  v5 = -[FLOWSchemaFLOWHomeKitServiceResponse init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitServiceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeKitServiceResponse setHomeKitServiceType:](v5, "setHomeKitServiceType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numServicesCompleted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeKitServiceResponse setNumServicesCompleted:](v5, "setNumServicesCompleted:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numServicesFailed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeKitServiceResponse setNumServicesFailed:](v5, "setNumServicesFailed:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)homeKitServiceType
{
  return self->_homeKitServiceType;
}

- (int)numServicesCompleted
{
  return self->_numServicesCompleted;
}

- (int)numServicesFailed
{
  return self->_numServicesFailed;
}

@end
