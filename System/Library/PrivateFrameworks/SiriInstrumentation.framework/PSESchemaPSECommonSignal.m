@implementation PSESchemaPSECommonSignal

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setEventDonationTimeInSecondsSince2001:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventDonationTimeInSecondsSince2001 = a3;
}

- (BOOL)hasEventDonationTimeInSecondsSince2001
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventDonationTimeInSecondsSince2001:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventDonationTimeInSecondsSince2001
{
  -[PSESchemaPSECommonSignal setEventDonationTimeInSecondsSince2001:](self, "setEventDonationTimeInSecondsSince2001:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)deleteDomain
{
  -[PSESchemaPSECommonSignal setDomain:](self, "setDomain:", 0);
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (void)deleteAction
{
  -[PSESchemaPSECommonSignal setAction:](self, "setAction:", 0);
}

- (void)setIsDonatedBySiri:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isDonatedBySiri = a3;
}

- (BOOL)hasIsDonatedBySiri
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsDonatedBySiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsDonatedBySiri
{
  -[PSESchemaPSECommonSignal setIsDonatedBySiri:](self, "setIsDonatedBySiri:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHasUserInitiatedFollowup:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasUserInitiatedFollowup = a3;
}

- (BOOL)hasHasUserInitiatedFollowup
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHasUserInitiatedFollowup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHasUserInitiatedFollowup
{
  -[PSESchemaPSECommonSignal setHasUserInitiatedFollowup:](self, "setHasUserInitiatedFollowup:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAppFollowup:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appFollowup = a3;
}

- (BOOL)hasAppFollowup
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppFollowup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAppFollowup
{
  -[PSESchemaPSECommonSignal setAppFollowup:](self, "setAppFollowup:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setAppLaunchTimeInSecondsSince2001:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_appLaunchTimeInSecondsSince2001 = a3;
}

- (BOOL)hasAppLaunchTimeInSecondsSince2001
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAppLaunchTimeInSecondsSince2001:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteAppLaunchTimeInSecondsSince2001
{
  -[PSESchemaPSECommonSignal setAppLaunchTimeInSecondsSince2001:](self, "setAppLaunchTimeInSecondsSince2001:", 0.0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setAppLaunchReason:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_appLaunchReason = a3;
}

- (BOOL)hasAppLaunchReason
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAppLaunchReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteAppLaunchReason
{
  -[PSESchemaPSECommonSignal setAppLaunchReason:](self, "setAppLaunchReason:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSECommonSignalReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[PSESchemaPSECommonSignal domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PSESchemaPSECommonSignal action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
LABEL_17:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_17;
LABEL_11:
  if ((has & 0x20) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  double eventDonationTimeInSecondsSince2001;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  $1E7707DC8BB745E69B83A7053F425171 has;
  int v22;
  unsigned int v23;
  int isDonatedBySiri;
  int v25;
  int hasUserInitiatedFollowup;
  int v27;
  int appFollowup;
  int v29;
  double appLaunchTimeInSecondsSince2001;
  double v31;
  int v32;
  int appLaunchReason;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[60] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventDonationTimeInSecondsSince2001 = self->_eventDonationTimeInSecondsSince2001;
    objc_msgSend(v4, "eventDonationTimeInSecondsSince2001");
    if (eventDonationTimeInSecondsSince2001 != v6)
      goto LABEL_15;
  }
  -[PSESchemaPSECommonSignal domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_14;
  -[PSESchemaPSECommonSignal domain](self, "domain");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[PSESchemaPSECommonSignal domain](self, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  -[PSESchemaPSECommonSignal action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[PSESchemaPSECommonSignal action](self, "action");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[PSESchemaPSECommonSignal action](self, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_15;
  }
  else
  {

  }
  has = self->_has;
  v22 = (*(unsigned int *)&has >> 1) & 1;
  v23 = v4[60];
  if (v22 == ((v23 >> 1) & 1))
  {
    if (v22)
    {
      isDonatedBySiri = self->_isDonatedBySiri;
      if (isDonatedBySiri != objc_msgSend(v4, "isDonatedBySiri"))
        goto LABEL_15;
      has = self->_has;
      v23 = v4[60];
    }
    v25 = (*(unsigned int *)&has >> 2) & 1;
    if (v25 == ((v23 >> 2) & 1))
    {
      if (v25)
      {
        hasUserInitiatedFollowup = self->_hasUserInitiatedFollowup;
        if (hasUserInitiatedFollowup != objc_msgSend(v4, "hasUserInitiatedFollowup"))
          goto LABEL_15;
        has = self->_has;
        v23 = v4[60];
      }
      v27 = (*(unsigned int *)&has >> 3) & 1;
      if (v27 == ((v23 >> 3) & 1))
      {
        if (v27)
        {
          appFollowup = self->_appFollowup;
          if (appFollowup != objc_msgSend(v4, "appFollowup"))
            goto LABEL_15;
          has = self->_has;
          v23 = v4[60];
        }
        v29 = (*(unsigned int *)&has >> 4) & 1;
        if (v29 == ((v23 >> 4) & 1))
        {
          if (v29)
          {
            appLaunchTimeInSecondsSince2001 = self->_appLaunchTimeInSecondsSince2001;
            objc_msgSend(v4, "appLaunchTimeInSecondsSince2001");
            if (appLaunchTimeInSecondsSince2001 != v31)
              goto LABEL_15;
            has = self->_has;
            v23 = v4[60];
          }
          v32 = (*(unsigned int *)&has >> 5) & 1;
          if (v32 == ((v23 >> 5) & 1))
          {
            if (!v32
              || (appLaunchReason = self->_appLaunchReason,
                  appLaunchReason == objc_msgSend(v4, "appLaunchReason")))
            {
              v19 = 1;
              goto LABEL_16;
            }
          }
        }
      }
    }
  }
LABEL_15:
  v19 = 0;
LABEL_16:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  double eventDonationTimeInSecondsSince2001;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  char has;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double appLaunchTimeInSecondsSince2001;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventDonationTimeInSecondsSince2001 = self->_eventDonationTimeInSecondsSince2001;
    v5 = -eventDonationTimeInSecondsSince2001;
    if (eventDonationTimeInSecondsSince2001 >= 0.0)
      v5 = self->_eventDonationTimeInSecondsSince2001;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_domain, "hash");
  v9 = -[NSString hash](self->_action, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = 2654435761 * self->_isDonatedBySiri;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_11:
      v12 = 2654435761 * self->_hasUserInitiatedFollowup;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_12;
LABEL_19:
      v13 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_13;
LABEL_20:
      v18 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_19;
LABEL_12:
  v13 = 2654435761 * self->_appFollowup;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_20;
LABEL_13:
  appLaunchTimeInSecondsSince2001 = self->_appLaunchTimeInSecondsSince2001;
  v15 = -appLaunchTimeInSecondsSince2001;
  if (appLaunchTimeInSecondsSince2001 >= 0.0)
    v15 = self->_appLaunchTimeInSecondsSince2001;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_23:
  if ((has & 0x20) != 0)
    v19 = 2654435761 * self->_appLaunchReason;
  else
    v19 = 0;
  return v8 ^ v3 ^ v9 ^ v11 ^ v12 ^ v13 ^ v18 ^ v19;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const __CFString *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_action)
  {
    -[PSESchemaPSECommonSignal action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = -[PSESchemaPSECommonSignal appFollowup](self, "appFollowup") - 1;
    if (v7 > 3)
      v8 = CFSTR("PSEAPPFOLLOWUP_UNKNOWN");
    else
      v8 = off_1E5638E20[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appFollowup"));
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v9 = -[PSESchemaPSECommonSignal appLaunchReason](self, "appLaunchReason") - 1;
    if (v9 > 3)
      v10 = CFSTR("PSEAPPLAUNCHREASON_UNKNOWN");
    else
      v10 = off_1E5638E40[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appLaunchReason"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[PSESchemaPSECommonSignal appLaunchTimeInSecondsSince2001](self, "appLaunchTimeInSecondsSince2001");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appLaunchTimeInSecondsSince2001"));

  }
  if (self->_domain)
  {
    -[PSESchemaPSECommonSignal domain](self, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("domain"));

  }
  v15 = (char)self->_has;
  if ((v15 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_19;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSECommonSignal hasUserInitiatedFollowup](self, "hasUserInitiatedFollowup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasUserInitiatedFollowup"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_27;
    goto LABEL_23;
  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PSESchemaPSECommonSignal eventDonationTimeInSecondsSince2001](self, "eventDonationTimeInSecondsSince2001");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("eventDonationTimeInSecondsSince2001"));

  v15 = (char)self->_has;
  if ((v15 & 4) != 0)
    goto LABEL_22;
LABEL_19:
  if ((v15 & 2) == 0)
    goto LABEL_27;
LABEL_23:
  v19 = -[PSESchemaPSECommonSignal isDonatedBySiri](self, "isDonatedBySiri") - 1;
  if (v19 > 2)
    v20 = CFSTR("PSEDONATIONSOURCE_UNKNOWN");
  else
    v20 = off_1E5638E60[v19];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isDonatedBySiri"));
LABEL_27:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSECommonSignal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSECommonSignal)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSECommonSignal *v5;
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
    self = -[PSESchemaPSECommonSignal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSECommonSignal)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSECommonSignal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PSESchemaPSECommonSignal *v16;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSESchemaPSECommonSignal;
  v5 = -[PSESchemaPSECommonSignal init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventDonationTimeInSecondsSince2001"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[PSESchemaPSECommonSignal setEventDonationTimeInSecondsSince2001:](v5, "setEventDonationTimeInSecondsSince2001:");
    }
    v18 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[PSESchemaPSECommonSignal setDomain:](v5, "setDomain:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PSESchemaPSECommonSignal setAction:](v5, "setAction:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDonatedBySiri"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECommonSignal setIsDonatedBySiri:](v5, "setIsDonatedBySiri:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasUserInitiatedFollowup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECommonSignal setHasUserInitiatedFollowup:](v5, "setHasUserInitiatedFollowup:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFollowup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECommonSignal setAppFollowup:](v5, "setAppFollowup:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLaunchTimeInSecondsSince2001"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[PSESchemaPSECommonSignal setAppLaunchTimeInSecondsSince2001:](v5, "setAppLaunchTimeInSecondsSince2001:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLaunchReason"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSECommonSignal setAppLaunchReason:](v5, "setAppLaunchReason:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (double)eventDonationTimeInSecondsSince2001
{
  return self->_eventDonationTimeInSecondsSince2001;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)isDonatedBySiri
{
  return self->_isDonatedBySiri;
}

- (BOOL)hasUserInitiatedFollowup
{
  return self->_hasUserInitiatedFollowup;
}

- (int)appFollowup
{
  return self->_appFollowup;
}

- (double)appLaunchTimeInSecondsSince2001
{
  return self->_appLaunchTimeInSecondsSince2001;
}

- (int)appLaunchReason
{
  return self->_appLaunchReason;
}

- (void)setHasDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
