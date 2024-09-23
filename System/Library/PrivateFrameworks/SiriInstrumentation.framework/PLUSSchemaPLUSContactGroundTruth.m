@implementation PLUSSchemaPLUSContactGroundTruth

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
  v9.super_class = (Class)PLUSSchemaPLUSContactGroundTruth;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PLUSSchemaPLUSContactGroundTruth deleteGroundTruthId](self, "deleteGroundTruthId");
  return v5;
}

- (BOOL)hasGroundTruthId
{
  return self->_groundTruthId != 0;
}

- (void)deleteGroundTruthId
{
  -[PLUSSchemaPLUSContactGroundTruth setGroundTruthId:](self, "setGroundTruthId:", 0);
}

- (void)setGroundTruthSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_groundTruthSource = a3;
}

- (BOOL)hasGroundTruthSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasGroundTruthSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteGroundTruthSource
{
  -[PLUSSchemaPLUSContactGroundTruth setGroundTruthSource:](self, "setGroundTruthSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHasSiriResolvedContactForEntity:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasSiriResolvedContactForEntity = a3;
}

- (BOOL)hasHasSiriResolvedContactForEntity
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHasSiriResolvedContactForEntity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHasSiriResolvedContactForEntity
{
  -[PLUSSchemaPLUSContactGroundTruth setHasSiriResolvedContactForEntity:](self, "setHasSiriResolvedContactForEntity:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSiriResolvedAndPlusInferredContactComparison:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_siriResolvedAndPlusInferredContactComparison = a3;
}

- (BOOL)hasSiriResolvedAndPlusInferredContactComparison
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSiriResolvedAndPlusInferredContactComparison:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSiriResolvedAndPlusInferredContactComparison
{
  -[PLUSSchemaPLUSContactGroundTruth setSiriResolvedAndPlusInferredContactComparison:](self, "setSiriResolvedAndPlusInferredContactComparison:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setContactSuggestionUsedBySiri:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_contactSuggestionUsedBySiri = a3;
}

- (BOOL)hasContactSuggestionUsedBySiri
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasContactSuggestionUsedBySiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteContactSuggestionUsedBySiri
{
  -[PLUSSchemaPLUSContactGroundTruth setContactSuggestionUsedBySiri:](self, "setContactSuggestionUsedBySiri:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactGroundTruthReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v7 = v8;
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
  $0EF097754544885748D88EB6F6F28D5B has;
  unsigned int v14;
  int groundTruthSource;
  int v16;
  int hasSiriResolvedContactForEntity;
  int v18;
  int siriResolvedAndPlusInferredContactComparison;
  int v20;
  int contactSuggestionUsedBySiri;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groundTruthId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groundTruthId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    groundTruthSource = self->_groundTruthSource;
    if (groundTruthSource != objc_msgSend(v4, "groundTruthSource"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    hasSiriResolvedContactForEntity = self->_hasSiriResolvedContactForEntity;
    if (hasSiriResolvedContactForEntity != objc_msgSend(v4, "hasSiriResolvedContactForEntity"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    siriResolvedAndPlusInferredContactComparison = self->_siriResolvedAndPlusInferredContactComparison;
    if (siriResolvedAndPlusInferredContactComparison == objc_msgSend(v4, "siriResolvedAndPlusInferredContactComparison"))
    {
      has = self->_has;
      v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    contactSuggestionUsedBySiri = self->_contactSuggestionUsedBySiri;
    if (contactSuggestionUsedBySiri != objc_msgSend(v4, "contactSuggestionUsedBySiri"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_groundTruthId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_groundTruthSource;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_hasSiriResolvedContactForEntity;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_siriResolvedAndPlusInferredContactComparison;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_contactSuggestionUsedBySiri;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = -[PLUSSchemaPLUSContactGroundTruth contactSuggestionUsedBySiri](self, "contactSuggestionUsedBySiri") - 1;
    if (v4 > 2)
      v5 = CFSTR("PLUSINFERREDSUGGESTIONSTATE_UNKNOWN");
    else
      v5 = off_1E5632C38[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactSuggestionUsedBySiri"));
  }
  if (self->_groundTruthId)
  {
    -[PLUSSchemaPLUSContactGroundTruth groundTruthId](self, "groundTruthId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("groundTruthId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("groundTruthId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_13;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSContactGroundTruth hasSiriResolvedContactForEntity](self, "hasSiriResolvedContactForEntity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasSiriResolvedContactForEntity"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_24;
    goto LABEL_20;
  }
  v10 = -[PLUSSchemaPLUSContactGroundTruth groundTruthSource](self, "groundTruthSource") - 1;
  if (v10 > 0xD)
    v11 = CFSTR("PLUSCONTACTGROUNDTRUTHSOURCE_UNKNOWN");
  else
    v11 = off_1E5632C50[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("groundTruthSource"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_13:
  if ((has & 4) == 0)
    goto LABEL_24;
LABEL_20:
  v13 = -[PLUSSchemaPLUSContactGroundTruth siriResolvedAndPlusInferredContactComparison](self, "siriResolvedAndPlusInferredContactComparison")- 1;
  if (v13 > 4)
    v14 = CFSTR("PLUSCONTACTREFERENCECOMPARISON_UNKNOWN");
  else
    v14 = off_1E5632CC0[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("siriResolvedAndPlusInferredContactComparison"));
LABEL_24:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactGroundTruth dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactGroundTruth)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactGroundTruth *v5;
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
    self = -[PLUSSchemaPLUSContactGroundTruth initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactGroundTruth)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactGroundTruth *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLUSSchemaPLUSContactGroundTruth *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSContactGroundTruth;
  v5 = -[PLUSSchemaPLUSContactGroundTruth init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSContactGroundTruth setGroundTruthId:](v5, "setGroundTruthId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactGroundTruth setGroundTruthSource:](v5, "setGroundTruthSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSiriResolvedContactForEntity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactGroundTruth setHasSiriResolvedContactForEntity:](v5, "setHasSiriResolvedContactForEntity:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriResolvedAndPlusInferredContactComparison"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactGroundTruth setSiriResolvedAndPlusInferredContactComparison:](v5, "setSiriResolvedAndPlusInferredContactComparison:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionUsedBySiri"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactGroundTruth setContactSuggestionUsedBySiri:](v5, "setContactSuggestionUsedBySiri:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)groundTruthId
{
  return self->_groundTruthId;
}

- (void)setGroundTruthId:(id)a3
{
  objc_storeStrong((id *)&self->_groundTruthId, a3);
}

- (int)groundTruthSource
{
  return self->_groundTruthSource;
}

- (BOOL)hasSiriResolvedContactForEntity
{
  return self->_hasSiriResolvedContactForEntity;
}

- (int)siriResolvedAndPlusInferredContactComparison
{
  return self->_siriResolvedAndPlusInferredContactComparison;
}

- (int)contactSuggestionUsedBySiri
{
  return self->_contactSuggestionUsedBySiri;
}

- (void)setHasGroundTruthId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groundTruthId, 0);
}

@end
