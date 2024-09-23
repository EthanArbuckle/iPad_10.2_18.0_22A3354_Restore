@implementation PSGPBTrigger

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasTreatmentName
{
  return self->_treatmentName != 0;
}

- (void)setHasResponseContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hasResponseContext = a3;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isResponseContextBlacklisted = a3;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isDocumentEmpty = a3;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hasContextBeforeInput = a3;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hasRecipientNames = a3;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHasRecipientNames
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)setMaxTextualResponseItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxTextualResponseItems = a3;
}

- (void)setHasMaxTextualResponseItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxTextualResponseItems
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxStructuredInfoItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_maxStructuredInfoItems = a3;
}

- (void)setHasMaxStructuredInfoItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMaxStructuredInfoItems
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMaxPredictionItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_maxPredictionItems = a3;
}

- (void)setHasMaxPredictionItems:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMaxPredictionItems
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasInitiatingProcess
{
  return self->_initiatingProcess != 0;
}

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_triggerSourceType;
  else
    return 0;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_triggerSourceType = a3;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)triggerSourceTypeAsString:(int)a3
{
  if (a3 < 7)
    return *(&off_24FCB4E20 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTriggerSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_LMTriggerPhrase")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_ResponseKit")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_TaggedTextField")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_MLDeclarative")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_MLInterrogative")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerSourceType_NameMentions")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTriggerCategory
{
  return self->_triggerCategory != 0;
}

- (BOOL)hasTriggerAttributeType
{
  return self->_triggerAttributeType != 0;
}

- (NSString)triggerAttributeSubtype
{
  if (self->_triggerAttributeSubtype)
    return self->_triggerAttributeSubtype;
  else
    return (NSString *)CFSTR("null");
}

- (BOOL)hasTriggerAttributeSubtype
{
  return self->_triggerAttributeSubtype != 0;
}

- (NSString)triggerAttributeField
{
  if (self->_triggerAttributeField)
    return self->_triggerAttributeField;
  else
    return (NSString *)CFSTR("null");
}

- (BOOL)hasTriggerAttributeField
{
  return self->_triggerAttributeField != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PSGPBTrigger;
  -[PSGPBTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGPBTrigger dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentName;
  __int16 has;
  void *v9;
  NSString *textContentType;
  __int16 v11;
  void *v12;
  void *v13;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  __int16 v16;
  void *v17;
  NSString *initiatingProcess;
  uint64_t triggerSourceType;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *triggerCategory;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experiment_id"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v4, "setObject:forKey:", treatmentId, CFSTR("treatment_id"));
  treatmentName = self->_treatmentName;
  if (treatmentName)
    objc_msgSend(v4, "setObject:forKey:", treatmentName, CFSTR("treatment_name"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasResponseContext);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("has_response_context"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResponseContextBlacklisted);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("is_response_context_blacklisted"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDocumentEmpty);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("is_document_empty"));

  }
LABEL_11:
  textContentType = self->_textContentType;
  if (textContentType)
    objc_msgSend(v4, "setObject:forKey:", textContentType, CFSTR("text_content_type"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasContextBeforeInput);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("has_context_before_input"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasRecipientNames);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("has_recipient_names"));

  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", localeIdentifier, CFSTR("locale_identifier"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundle_identifier"));
  v16 = (__int16)self->_has;
  if ((v16 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxTextualResponseItems);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("max_textual_response_items"));

    v16 = (__int16)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 1) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxStructuredInfoItems);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("max_structured_info_items"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxPredictionItems);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("max_prediction_items"));

  }
LABEL_25:
  initiatingProcess = self->_initiatingProcess;
  if (initiatingProcess)
    objc_msgSend(v4, "setObject:forKey:", initiatingProcess, CFSTR("initiating_process"));
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerSourceType);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = *(&off_24FCB4E20 + triggerSourceType);
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("trigger_source_type"));

  }
  triggerCategory = self->_triggerCategory;
  if (triggerCategory)
    objc_msgSend(v4, "setObject:forKey:", triggerCategory, CFSTR("trigger_category"));
  triggerAttributeType = self->_triggerAttributeType;
  if (triggerAttributeType)
    objc_msgSend(v4, "setObject:forKey:", triggerAttributeType, CFSTR("trigger_attribute_type"));
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if (triggerAttributeSubtype)
    objc_msgSend(v4, "setObject:forKey:", triggerAttributeSubtype, CFSTR("trigger_attribute_subtype"));
  triggerAttributeField = self->_triggerAttributeField;
  if (triggerAttributeField)
    objc_msgSend(v4, "setObject:forKey:", triggerAttributeField, CFSTR("trigger_attribute_field"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBTriggerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  id v7;

  v7 = a3;
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_triggerCategory)
    PBDataWriterWriteStringField();
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentName)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_13:
      if ((has & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_textContentType)
    PBDataWriterWriteStringField();
  if (self->_localeIdentifier)
    PBDataWriterWriteStringField();
  if (self->_bundleIdentifier)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_initiatingProcess)
    PBDataWriterWriteStringField();
  if (self->_triggerAttributeType)
    PBDataWriterWriteStringField();
  if (self->_triggerAttributeSubtype)
    PBDataWriterWriteStringField();
  if (self->_triggerAttributeField)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_35;
LABEL_42:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_42;
LABEL_35:
  if ((v6 & 0x20) != 0)
LABEL_36:
    PBDataWriterWriteBOOLField();
LABEL_37:

}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  _DWORD *v7;

  v7 = a3;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v7[28] = self->_triggerSourceType;
    *((_WORD *)v7 + 62) |= 8u;
  }
  if (self->_triggerCategory)
    objc_msgSend(v7, "setTriggerCategory:");
  if (self->_experimentId)
    objc_msgSend(v7, "setExperimentId:");
  if (self->_treatmentId)
    objc_msgSend(v7, "setTreatmentId:");
  if (self->_treatmentName)
    objc_msgSend(v7, "setTreatmentName:");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_BYTE *)v7 + 118) = self->_hasResponseContext;
    *((_WORD *)v7 + 62) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_13:
      if ((has & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_13;
  }
  *((_BYTE *)v7 + 120) = self->_isResponseContextBlacklisted;
  *((_WORD *)v7 + 62) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_14:
    *((_BYTE *)v7 + 119) = self->_isDocumentEmpty;
    *((_WORD *)v7 + 62) |= 0x80u;
  }
LABEL_15:
  if (self->_textContentType)
    objc_msgSend(v7, "setTextContentType:");
  if (self->_localeIdentifier)
    objc_msgSend(v7, "setLocaleIdentifier:");
  if (self->_bundleIdentifier)
    objc_msgSend(v7, "setBundleIdentifier:");
  v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    v7[12] = self->_maxTextualResponseItems;
    *((_WORD *)v7 + 62) |= 4u;
    v5 = (__int16)self->_has;
  }
  if ((v5 & 2) != 0)
  {
    v7[11] = self->_maxStructuredInfoItems;
    *((_WORD *)v7 + 62) |= 2u;
  }
  if (self->_initiatingProcess)
    objc_msgSend(v7, "setInitiatingProcess:");
  if (self->_triggerAttributeType)
    objc_msgSend(v7, "setTriggerAttributeType:");
  if (self->_triggerAttributeSubtype)
    objc_msgSend(v7, "setTriggerAttributeSubtype:");
  if (self->_triggerAttributeField)
    objc_msgSend(v7, "setTriggerAttributeField:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_35;
LABEL_42:
    v7[10] = self->_maxPredictionItems;
    *((_WORD *)v7 + 62) |= 1u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
  *((_BYTE *)v7 + 116) = self->_hasContextBeforeInput;
  *((_WORD *)v7 + 62) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_42;
LABEL_35:
  if ((v6 & 0x20) != 0)
  {
LABEL_36:
    *((_BYTE *)v7 + 117) = self->_hasRecipientNames;
    *((_WORD *)v7 + 62) |= 0x20u;
  }
LABEL_37:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int16 has;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int16 v31;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_triggerSourceType;
    *(_WORD *)(v5 + 124) |= 8u;
  }
  v7 = -[NSString copyWithZone:](self->_triggerCategory, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v7;

  v9 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_treatmentName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v13;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 118) = self->_hasResponseContext;
    *(_WORD *)(v6 + 124) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 120) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v6 + 124) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 119) = self->_isDocumentEmpty;
    *(_WORD *)(v6 + 124) |= 0x80u;
  }
LABEL_7:
  v16 = -[NSString copyWithZone:](self->_textContentType, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v18;

  v20 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v20;

  v22 = (__int16)self->_has;
  if ((v22 & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_maxTextualResponseItems;
    *(_WORD *)(v6 + 124) |= 4u;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 2) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_maxStructuredInfoItems;
    *(_WORD *)(v6 + 124) |= 2u;
  }
  v23 = -[NSString copyWithZone:](self->_initiatingProcess, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v23;

  v25 = -[NSString copyWithZone:](self->_triggerAttributeType, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v25;

  v27 = -[NSString copyWithZone:](self->_triggerAttributeSubtype, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v27;

  v29 = -[NSString copyWithZone:](self->_triggerAttributeField, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v29;

  v31 = (__int16)self->_has;
  if ((v31 & 0x10) == 0)
  {
    if ((v31 & 1) == 0)
      goto LABEL_13;
LABEL_20:
    *(_DWORD *)(v6 + 40) = self->_maxPredictionItems;
    *(_WORD *)(v6 + 124) |= 1u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return (id)v6;
    goto LABEL_14;
  }
  *(_BYTE *)(v6 + 116) = self->_hasContextBeforeInput;
  *(_WORD *)(v6 + 124) |= 0x10u;
  v31 = (__int16)self->_has;
  if ((v31 & 1) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v31 & 0x20) != 0)
  {
LABEL_14:
    *(_BYTE *)(v6 + 117) = self->_hasRecipientNames;
    *(_WORD *)(v6 + 124) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *triggerCategory;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentName;
  __int16 has;
  __int16 v11;
  NSString *textContentType;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  __int16 v15;
  __int16 v16;
  NSString *initiatingProcess;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;
  __int16 v21;
  __int16 v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  v5 = *((_WORD *)v4 + 62);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 28))
      goto LABEL_79;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_79;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_79;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:"))
      goto LABEL_79;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_79;
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:"))
      goto LABEL_79;
  }
  has = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 62);
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0)
      goto LABEL_79;
    if (self->_hasResponseContext)
    {
      if (!*((_BYTE *)v4 + 118))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 118))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0)
      goto LABEL_79;
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_79;
    if (self->_isDocumentEmpty)
    {
      if (!*((_BYTE *)v4 + 119))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 119))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_79;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_79;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_79;
  }
  v15 = (__int16)self->_has;
  v16 = *((_WORD *)v4 + 62);
  if ((v15 & 4) != 0)
  {
    if ((v16 & 4) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 12))
      goto LABEL_79;
  }
  else if ((v16 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((v15 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 11))
      goto LABEL_79;
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_79;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](initiatingProcess, "isEqual:"))
  {
    goto LABEL_79;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:"))
      goto LABEL_79;
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:"))
      goto LABEL_79;
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](triggerAttributeField, "isEqual:"))
      goto LABEL_79;
  }
  v21 = (__int16)self->_has;
  v22 = *((_WORD *)v4 + 62);
  if ((v21 & 0x10) != 0)
  {
    if ((v22 & 0x10) == 0)
      goto LABEL_79;
    if (self->_hasContextBeforeInput)
    {
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_79;
    }
  }
  else if ((v22 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((v21 & 1) != 0)
  {
    if ((v22 & 1) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 10))
      goto LABEL_79;
  }
  else if ((v22 & 1) != 0)
  {
    goto LABEL_79;
  }
  if ((v21 & 0x20) != 0)
  {
    if ((v22 & 0x20) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((_BYTE *)v4 + 117))
          goto LABEL_79;
      }
      else if (*((_BYTE *)v4 + 117))
      {
        goto LABEL_79;
      }
      v23 = 1;
      goto LABEL_80;
    }
LABEL_79:
    v23 = 0;
    goto LABEL_80;
  }
  v23 = (v22 & 0x20) == 0;
LABEL_80:

  return v23;
}

- (unint64_t)hash
{
  __int16 has;
  NSUInteger v4;
  NSUInteger v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;

  if ((*(_WORD *)&self->_has & 8) != 0)
    v26 = 2654435761 * self->_triggerSourceType;
  else
    v26 = 0;
  v25 = -[NSString hash](self->_triggerCategory, "hash");
  v24 = -[NSString hash](self->_experimentId, "hash");
  v23 = -[NSString hash](self->_treatmentId, "hash");
  v22 = -[NSString hash](self->_treatmentName, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    v21 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
LABEL_9:
    v20 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v21 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_9;
LABEL_6:
  v20 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v19 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_11;
  }
LABEL_10:
  v19 = 0;
LABEL_11:
  v18 = -[NSString hash](self->_textContentType, "hash");
  v4 = -[NSString hash](self->_localeIdentifier, "hash");
  v5 = -[NSString hash](self->_bundleIdentifier, "hash");
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    v7 = 2654435761 * self->_maxTextualResponseItems;
    if ((v6 & 2) != 0)
      goto LABEL_13;
  }
  else
  {
    v7 = 0;
    if ((v6 & 2) != 0)
    {
LABEL_13:
      v8 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_16;
    }
  }
  v8 = 0;
LABEL_16:
  v9 = -[NSString hash](self->_initiatingProcess, "hash");
  v10 = -[NSString hash](self->_triggerAttributeType, "hash");
  v11 = -[NSString hash](self->_triggerAttributeSubtype, "hash");
  v12 = -[NSString hash](self->_triggerAttributeField, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
    v14 = 0;
    if ((v13 & 1) != 0)
      goto LABEL_18;
LABEL_21:
    v15 = 0;
    if ((v13 & 0x20) != 0)
      goto LABEL_19;
LABEL_22:
    v16 = 0;
    return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  v14 = 2654435761 * self->_hasContextBeforeInput;
  if ((v13 & 1) == 0)
    goto LABEL_21;
LABEL_18:
  v15 = 2654435761 * self->_maxPredictionItems;
  if ((v13 & 0x20) == 0)
    goto LABEL_22;
LABEL_19:
  v16 = 2654435761 * self->_hasRecipientNames;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  if ((*((_WORD *)v4 + 62) & 8) != 0)
  {
    self->_triggerSourceType = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 8u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 13))
  {
    -[PSGPBTrigger setTriggerCategory:](self, "setTriggerCategory:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PSGPBTrigger setExperimentId:](self, "setExperimentId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[PSGPBTrigger setTreatmentId:](self, "setTreatmentId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PSGPBTrigger setTreatmentName:](self, "setTreatmentName:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x40) != 0)
  {
    self->_hasResponseContext = *((_BYTE *)v4 + 118);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 62);
    if ((v5 & 0x100) == 0)
    {
LABEL_13:
      if ((v5 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_13;
  }
  self->_isResponseContextBlacklisted = *((_BYTE *)v4 + 120);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 62) & 0x80) != 0)
  {
LABEL_14:
    self->_isDocumentEmpty = *((_BYTE *)v4 + 119);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 7))
  {
    -[PSGPBTrigger setTextContentType:](self, "setTextContentType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PSGPBTrigger setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PSGPBTrigger setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 4) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
    v6 = *((_WORD *)v4 + 62);
  }
  if ((v6 & 2) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PSGPBTrigger setInitiatingProcess:](self, "setInitiatingProcess:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PSGPBTrigger setTriggerAttributeType:](self, "setTriggerAttributeType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PSGPBTrigger setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PSGPBTrigger setTriggerAttributeField:](self, "setTriggerAttributeField:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x10) == 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_35;
LABEL_42:
    self->_maxPredictionItems = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 1u;
    if ((*((_WORD *)v4 + 62) & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
  self->_hasContextBeforeInput = *((_BYTE *)v4 + 116);
  *(_WORD *)&self->_has |= 0x10u;
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 1) != 0)
    goto LABEL_42;
LABEL_35:
  if ((v7 & 0x20) != 0)
  {
LABEL_36:
    self->_hasRecipientNames = *((_BYTE *)v4 + 117);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_37:

}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (void)setTreatmentName:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentName, a3);
}

- (BOOL)hasResponseContext
{
  return self->_hasResponseContext;
}

- (BOOL)isResponseContextBlacklisted
{
  return self->_isResponseContextBlacklisted;
}

- (BOOL)isDocumentEmpty
{
  return self->_isDocumentEmpty;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  objc_storeStrong((id *)&self->_textContentType, a3);
}

- (BOOL)hasContextBeforeInput
{
  return self->_hasContextBeforeInput;
}

- (BOOL)hasRecipientNames
{
  return self->_hasRecipientNames;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (unsigned)maxTextualResponseItems
{
  return self->_maxTextualResponseItems;
}

- (unsigned)maxStructuredInfoItems
{
  return self->_maxStructuredInfoItems;
}

- (unsigned)maxPredictionItems
{
  return self->_maxPredictionItems;
}

- (NSString)initiatingProcess
{
  return self->_initiatingProcess;
}

- (void)setInitiatingProcess:(id)a3
{
  objc_storeStrong((id *)&self->_initiatingProcess, a3);
}

- (NSString)triggerCategory
{
  return self->_triggerCategory;
}

- (void)setTriggerCategory:(id)a3
{
  objc_storeStrong((id *)&self->_triggerCategory, a3);
}

- (NSString)triggerAttributeType
{
  return self->_triggerAttributeType;
}

- (void)setTriggerAttributeType:(id)a3
{
  objc_storeStrong((id *)&self->_triggerAttributeType, a3);
}

- (void)setTriggerAttributeSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_triggerAttributeSubtype, a3);
}

- (void)setTriggerAttributeField:(id)a3
{
  objc_storeStrong((id *)&self->_triggerAttributeField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerCategory, 0);
  objc_storeStrong((id *)&self->_triggerAttributeType, 0);
  objc_storeStrong((id *)&self->_triggerAttributeSubtype, 0);
  objc_storeStrong((id *)&self->_triggerAttributeField, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
