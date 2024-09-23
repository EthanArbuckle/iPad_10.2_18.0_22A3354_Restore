@implementation PSESchemaPSEAppIntentInteractionEngagement

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasAppIntentName
{
  return self->_appIntentName != 0;
}

- (void)deleteAppIntentName
{
  -[PSESchemaPSEAppIntentInteractionEngagement setAppIntentName:](self, "setAppIntentName:", 0);
}

- (void)setFollowUpActionType:(int)a3
{
  *(&self->_isFirstPartyApp + 1) |= 1u;
  self->_followUpActionType = a3;
}

- (BOOL)hasFollowUpActionType
{
  return *(&self->_isFirstPartyApp + 1);
}

- (void)setHasFollowUpActionType:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xFE | a3;
}

- (void)deleteFollowUpActionType
{
  -[PSESchemaPSEAppIntentInteractionEngagement setFollowUpActionType:](self, "setFollowUpActionType:", 0);
  *(&self->_isFirstPartyApp + 1) &= ~1u;
}

- (void)setFollowUpEntityComparison:(int)a3
{
  *(&self->_isFirstPartyApp + 1) |= 2u;
  self->_followUpEntityComparison = a3;
}

- (BOOL)hasFollowUpEntityComparison
{
  return (*((unsigned __int8 *)&self->_isFirstPartyApp + 1) >> 1) & 1;
}

- (void)setHasFollowUpEntityComparison:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xFD | v3;
}

- (void)deleteFollowUpEntityComparison
{
  -[PSESchemaPSEAppIntentInteractionEngagement setFollowUpEntityComparison:](self, "setFollowUpEntityComparison:", 0);
  *(&self->_isFirstPartyApp + 1) &= ~2u;
}

- (void)setIsSiriResultUseful:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 1) |= 4u;
  self->_isSiriResultUseful = a3;
}

- (BOOL)hasIsSiriResultUseful
{
  return (*((unsigned __int8 *)&self->_isFirstPartyApp + 1) >> 2) & 1;
}

- (void)setHasIsSiriResultUseful:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xFB | v3;
}

- (void)deleteIsSiriResultUseful
{
  -[PSESchemaPSEAppIntentInteractionEngagement setIsSiriResultUseful:](self, "setIsSiriResultUseful:", 0);
  *(&self->_isFirstPartyApp + 1) &= ~4u;
}

- (void)setIsFirstPartyApp:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 1) |= 8u;
  self->_isFirstPartyApp = a3;
}

- (BOOL)hasIsFirstPartyApp
{
  return (*((unsigned __int8 *)&self->_isFirstPartyApp + 1) >> 3) & 1;
}

- (void)setHasIsFirstPartyApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isFirstPartyApp + 1) = *(&self->_isFirstPartyApp + 1) & 0xF7 | v3;
}

- (void)deleteIsFirstPartyApp
{
  -[PSESchemaPSEAppIntentInteractionEngagement setIsFirstPartyApp:](self, "setIsFirstPartyApp:", 0);
  *(&self->_isFirstPartyApp + 1) &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEAppIntentInteractionEngagementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PSESchemaPSEAppIntentInteractionEngagement appIntentName](self, "appIntentName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  v5 = *(&self->_isFirstPartyApp + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = *(&self->_isFirstPartyApp + 1);
  }
  v6 = v7;
  if ((v5 & 2) == 0)
  {
    if ((v5 & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteBOOLField();
    v6 = v7;
    if ((*(&self->_isFirstPartyApp + 1) & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v6 = v7;
  v5 = *(&self->_isFirstPartyApp + 1);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
LABEL_9:

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
  unsigned int v13;
  unsigned int v14;
  int followUpActionType;
  int v16;
  int followUpEntityComparison;
  int v18;
  int isSiriResultUseful;
  int v20;
  int isFirstPartyApp;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[PSESchemaPSEAppIntentInteractionEngagement appIntentName](self, "appIntentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIntentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[PSESchemaPSEAppIntentInteractionEngagement appIntentName](self, "appIntentName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PSESchemaPSEAppIntentInteractionEngagement appIntentName](self, "appIntentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIntentName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
  v14 = v4[26];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((v13 & 1) != 0)
  {
    followUpActionType = self->_followUpActionType;
    if (followUpActionType != objc_msgSend(v4, "followUpActionType"))
      goto LABEL_24;
    v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
    v14 = v4[26];
  }
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    followUpEntityComparison = self->_followUpEntityComparison;
    if (followUpEntityComparison != objc_msgSend(v4, "followUpEntityComparison"))
      goto LABEL_24;
    v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
    v14 = v4[26];
  }
  v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    isSiriResultUseful = self->_isSiriResultUseful;
    if (isSiriResultUseful == objc_msgSend(v4, "isSiriResultUseful"))
    {
      v13 = *((unsigned __int8 *)&self->_isFirstPartyApp + 1);
      v14 = v4[26];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    isFirstPartyApp = self->_isFirstPartyApp;
    if (isFirstPartyApp != objc_msgSend(v4, "isFirstPartyApp"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_appIntentName, "hash");
  if (*(&self->_isFirstPartyApp + 1))
  {
    v4 = 2654435761 * self->_followUpActionType;
    if ((*(&self->_isFirstPartyApp + 1) & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_followUpEntityComparison;
      if ((*(&self->_isFirstPartyApp + 1) & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(&self->_isFirstPartyApp + 1) & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(&self->_isFirstPartyApp + 1) & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(&self->_isFirstPartyApp + 1) & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_isSiriResultUseful;
  if ((*(&self->_isFirstPartyApp + 1) & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_isFirstPartyApp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appIntentName)
  {
    -[PSESchemaPSEAppIntentInteractionEngagement appIntentName](self, "appIntentName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appIntentName"));

  }
  v6 = *(&self->_isFirstPartyApp + 1);
  if ((v6 & 1) != 0)
  {
    v7 = -[PSESchemaPSEAppIntentInteractionEngagement followUpActionType](self, "followUpActionType") - 1;
    if (v7 > 0x21)
      v8 = CFSTR("PSEAPPINTENTFOLLOWUPACTIONTYPE_UNKNOWN");
    else
      v8 = *(&off_1E563E448 + v7);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("followUpActionType"));
    v6 = *(&self->_isFirstPartyApp + 1);
  }
  if ((v6 & 2) != 0)
  {
    v9 = -[PSESchemaPSEAppIntentInteractionEngagement followUpEntityComparison](self, "followUpEntityComparison") - 1;
    if (v9 > 2)
      v10 = CFSTR("PSEAPPINTENTFOLLOWUPENTITYCOMPARISON_UNKNOWN");
    else
      v10 = *(&off_1E563E558 + v9);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("followUpEntityComparison"));
    v6 = *(&self->_isFirstPartyApp + 1);
  }
  if ((v6 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEAppIntentInteractionEngagement isFirstPartyApp](self, "isFirstPartyApp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isFirstPartyApp"));

    v6 = *(&self->_isFirstPartyApp + 1);
  }
  if ((v6 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEAppIntentInteractionEngagement isSiriResultUseful](self, "isSiriResultUseful"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isSiriResultUseful"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEAppIntentInteractionEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEAppIntentInteractionEngagement)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEAppIntentInteractionEngagement *v5;
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
    self = -[PSESchemaPSEAppIntentInteractionEngagement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEAppIntentInteractionEngagement)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEAppIntentInteractionEngagement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSESchemaPSEAppIntentInteractionEngagement *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PSESchemaPSEAppIntentInteractionEngagement;
  v5 = -[PSESchemaPSEAppIntentInteractionEngagement init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIntentName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PSESchemaPSEAppIntentInteractionEngagement setAppIntentName:](v5, "setAppIntentName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpActionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEAppIntentInteractionEngagement setFollowUpActionType:](v5, "setFollowUpActionType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpEntityComparison"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEAppIntentInteractionEngagement setFollowUpEntityComparison:](v5, "setFollowUpEntityComparison:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSiriResultUseful"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEAppIntentInteractionEngagement setIsSiriResultUseful:](v5, "setIsSiriResultUseful:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstPartyApp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEAppIntentInteractionEngagement setIsFirstPartyApp:](v5, "setIsFirstPartyApp:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (NSString)appIntentName
{
  return self->_appIntentName;
}

- (void)setAppIntentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)followUpActionType
{
  return self->_followUpActionType;
}

- (int)followUpEntityComparison
{
  return self->_followUpEntityComparison;
}

- (BOOL)isSiriResultUseful
{
  return self->_isSiriResultUseful;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (void)setHasAppIntentName:(BOOL)a3
{
  *(&self->_isFirstPartyApp + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIntentName, 0);
}

@end
