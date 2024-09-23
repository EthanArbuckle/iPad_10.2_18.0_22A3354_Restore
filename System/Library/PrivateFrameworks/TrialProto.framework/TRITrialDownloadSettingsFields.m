@implementation TRITrialDownloadSettingsFields

- (void)setAllowAnyNetworking:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_allowAnyNetworking = a3;
}

- (void)setHasAllowAnyNetworking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowAnyNetworking
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAllowBattery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_allowBattery = a3;
}

- (void)setHasAllowBattery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAllowBattery
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)discretionaryBehavior
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_discretionaryBehavior;
  else
    return 0;
}

- (void)setDiscretionaryBehavior:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_discretionaryBehavior = a3;
}

- (void)setHasDiscretionaryBehavior:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscretionaryBehavior
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)discretionaryBehaviorAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2E9B9C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDiscretionaryBehavior:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_BEHAVIOR")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISCRETIONARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON_DISCRETIONARY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TRITrialDownloadSettingsFields;
  -[TRITrialDownloadSettingsFields description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITrialDownloadSettingsFields dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t discretionaryBehavior;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowBattery);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("allow_battery"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowAnyNetworking);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("allow_any_networking"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) == 0)
    return v3;
LABEL_7:
  discretionaryBehavior = self->_discretionaryBehavior;
  if (discretionaryBehavior >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_discretionaryBehavior);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E2E9B9C0[discretionaryBehavior];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("discretionary_behavior"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialDownloadSettingsFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[13] = self->_allowBattery;
    v4[16] |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[12] = self->_allowAnyNetworking;
  v4[16] |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 2) = self->_discretionaryBehavior;
    v4[16] |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_allowAnyNetworking;
    *((_BYTE *)result + 16) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 13) = self->_allowBattery;
  *((_BYTE *)result + 16) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_discretionaryBehavior;
  *((_BYTE *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
      goto LABEL_22;
    if (self->_allowAnyNetworking)
    {
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) != 0)
    {
      if (self->_allowBattery)
      {
        if (!*((_BYTE *)v4 + 13))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_18;
    }
LABEL_22:
    v5 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 16) & 4) != 0)
    goto LABEL_22;
LABEL_18:
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_discretionaryBehavior != *((_DWORD *)v4 + 2))
      goto LABEL_22;
    v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_allowAnyNetworking;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_allowBattery;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_discretionaryBehavior;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_allowBattery = *((_BYTE *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 16) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_allowAnyNetworking = *((_BYTE *)v4 + 12);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 1) != 0)
  {
LABEL_4:
    self->_discretionaryBehavior = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (BOOL)allowAnyNetworking
{
  return self->_allowAnyNetworking;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

@end
