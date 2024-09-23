@implementation PEGASUSSchemaPEGASUSVideoExperienceProperty

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsForegroundAppAvailable:(BOOL)a3
{
  *(&self->_isThirdPartyRequest + 1) |= 1u;
  self->_isForegroundAppAvailable = a3;
}

- (BOOL)hasIsForegroundAppAvailable
{
  return *(&self->_isThirdPartyRequest + 1);
}

- (void)setHasIsForegroundAppAvailable:(BOOL)a3
{
  *(&self->_isThirdPartyRequest + 1) = *(&self->_isThirdPartyRequest + 1) & 0xFE | a3;
}

- (void)deleteIsForegroundAppAvailable
{
  -[PEGASUSSchemaPEGASUSVideoExperienceProperty setIsForegroundAppAvailable:](self, "setIsForegroundAppAvailable:", 0);
  *(&self->_isThirdPartyRequest + 1) &= ~1u;
}

- (void)setIsRecommendationRequest:(BOOL)a3
{
  *(&self->_isThirdPartyRequest + 1) |= 2u;
  self->_isRecommendationRequest = a3;
}

- (BOOL)hasIsRecommendationRequest
{
  return (*((unsigned __int8 *)&self->_isThirdPartyRequest + 1) >> 1) & 1;
}

- (void)setHasIsRecommendationRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isThirdPartyRequest + 1) = *(&self->_isThirdPartyRequest + 1) & 0xFD | v3;
}

- (void)deleteIsRecommendationRequest
{
  -[PEGASUSSchemaPEGASUSVideoExperienceProperty setIsRecommendationRequest:](self, "setIsRecommendationRequest:", 0);
  *(&self->_isThirdPartyRequest + 1) &= ~2u;
}

- (void)setIsThirdPartyRequest:(BOOL)a3
{
  *(&self->_isThirdPartyRequest + 1) |= 4u;
  self->_isThirdPartyRequest = a3;
}

- (BOOL)hasIsThirdPartyRequest
{
  return (*((unsigned __int8 *)&self->_isThirdPartyRequest + 1) >> 2) & 1;
}

- (void)setHasIsThirdPartyRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isThirdPartyRequest + 1) = *(&self->_isThirdPartyRequest + 1) & 0xFB | v3;
}

- (void)deleteIsThirdPartyRequest
{
  -[PEGASUSSchemaPEGASUSVideoExperienceProperty setIsThirdPartyRequest:](self, "setIsThirdPartyRequest:", 0);
  *(&self->_isThirdPartyRequest + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoExperiencePropertyReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isThirdPartyRequest + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isThirdPartyRequest + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(&self->_isThirdPartyRequest + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  v5 = *(&self->_isThirdPartyRequest + 1);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isForegroundAppAvailable;
  int v8;
  int isRecommendationRequest;
  int v10;
  int isThirdPartyRequest;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isThirdPartyRequest + 1);
  v6 = v4[11];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    isForegroundAppAvailable = self->_isForegroundAppAvailable;
    if (isForegroundAppAvailable != objc_msgSend(v4, "isForegroundAppAvailable"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isThirdPartyRequest + 1);
    v6 = v4[11];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isRecommendationRequest = self->_isRecommendationRequest;
    if (isRecommendationRequest == objc_msgSend(v4, "isRecommendationRequest"))
    {
      v5 = *((unsigned __int8 *)&self->_isThirdPartyRequest + 1);
      v6 = v4[11];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    isThirdPartyRequest = self->_isThirdPartyRequest;
    if (isThirdPartyRequest != objc_msgSend(v4, "isThirdPartyRequest"))
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

  if (!*(&self->_isThirdPartyRequest + 1))
  {
    v2 = 0;
    if ((*(&self->_isThirdPartyRequest + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isThirdPartyRequest + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_isForegroundAppAvailable;
  if ((*(&self->_isThirdPartyRequest + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isRecommendationRequest;
  if ((*(&self->_isThirdPartyRequest + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isThirdPartyRequest;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isThirdPartyRequest + 1);
  if ((v4 & 1) == 0)
  {
    if ((*(&self->_isThirdPartyRequest + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSVideoExperienceProperty isRecommendationRequest](self, "isRecommendationRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isRecommendationRequest"));

    if ((*(&self->_isThirdPartyRequest + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSVideoExperienceProperty isForegroundAppAvailable](self, "isForegroundAppAvailable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isForegroundAppAvailable"));

  v4 = *(&self->_isThirdPartyRequest + 1);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSVideoExperienceProperty isThirdPartyRequest](self, "isThirdPartyRequest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isThirdPartyRequest"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSVideoExperienceProperty dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSVideoExperienceProperty)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSVideoExperienceProperty *v5;
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
    self = -[PEGASUSSchemaPEGASUSVideoExperienceProperty initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSVideoExperienceProperty)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSVideoExperienceProperty *v5;
  void *v6;
  void *v7;
  void *v8;
  PEGASUSSchemaPEGASUSVideoExperienceProperty *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEGASUSSchemaPEGASUSVideoExperienceProperty;
  v5 = -[PEGASUSSchemaPEGASUSVideoExperienceProperty init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForegroundAppAvailable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSVideoExperienceProperty setIsForegroundAppAvailable:](v5, "setIsForegroundAppAvailable:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecommendationRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSVideoExperienceProperty setIsRecommendationRequest:](v5, "setIsRecommendationRequest:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isThirdPartyRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSVideoExperienceProperty setIsThirdPartyRequest:](v5, "setIsThirdPartyRequest:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)isForegroundAppAvailable
{
  return self->_isForegroundAppAvailable;
}

- (BOOL)isRecommendationRequest
{
  return self->_isRecommendationRequest;
}

- (BOOL)isThirdPartyRequest
{
  return self->_isThirdPartyRequest;
}

@end
