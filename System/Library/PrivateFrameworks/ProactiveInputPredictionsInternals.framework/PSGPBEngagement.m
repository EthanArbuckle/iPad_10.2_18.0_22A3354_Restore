@implementation PSGPBEngagement

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
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasResponseContext = a3;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isResponseContextBlacklisted = a3;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isDocumentEmpty = a3;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_hasContextBeforeInput = a3;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHasContextBeforeInput
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_hasRecipientNames = a3;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHasRecipientNames
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  *(_WORD *)&self->_has |= 8u;
  self->_maxTextualResponseItems = a3;
}

- (void)setHasMaxTextualResponseItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMaxTextualResponseItems
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMaxStructuredInfoItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxStructuredInfoItems = a3;
}

- (void)setHasMaxStructuredInfoItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxStructuredInfoItems
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxPredictionItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_maxPredictionItems = a3;
}

- (void)setHasMaxPredictionItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMaxPredictionItems
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasInitiatingProcess
{
  return self->_initiatingProcess != 0;
}

- (void)setNumTextualResponseItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numTextualResponseItems = a3;
}

- (void)setHasNumTextualResponseItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumTextualResponseItems
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasTextualResponseCategory
{
  return self->_textualResponseCategory != 0;
}

- (void)setNumStructuredInfoItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numStructuredInfoItems = a3;
}

- (void)setHasNumStructuredInfoItems:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumStructuredInfoItems
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (int)dataSourceType
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_dataSourceType;
  else
    return 0;
}

- (void)setDataSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dataSourceType = a3;
}

- (void)setHasDataSourceType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDataSourceType
{
  return *(_WORD *)&self->_has & 1;
}

- (id)dataSourceTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_24FCB4C78[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDataSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_Contacts")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_FoundInApps")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_Events")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_Navigation")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_AppDonation")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_SchemaOrg")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_Pasteboard")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_Siri")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_PersonalizationPortrait")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PredictionDataSourceType_FaceTime")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_triggerSourceType;
  else
    return 0;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_triggerSourceType = a3;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)triggerSourceTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24FCB4CD0[a3];
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

- (void)setPosition:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPosition
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)PSGPBEngagement;
  -[PSGPBEngagement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGPBEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v19;
  NSString *textualResponseCategory;
  __int16 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t dataSourceType;
  __CFString *v28;
  uint64_t triggerSourceType;
  __CFString *v30;
  NSString *triggerCategory;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;
  void *v35;

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
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasResponseContext);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("has_response_context"));

    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResponseContextBlacklisted);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("is_response_context_blacklisted"));

  if ((*(_WORD *)&self->_has & 0x800) != 0)
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
  if ((v11 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasContextBeforeInput);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("has_context_before_input"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x200) != 0)
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
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxTextualResponseItems);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("max_textual_response_items"));

    v16 = (__int16)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_23:
      if ((v16 & 2) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v16 & 4) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxStructuredInfoItems);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("max_structured_info_items"));

  if ((*(_WORD *)&self->_has & 2) != 0)
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
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numTextualResponseItems);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("num_textual_response_items"));

  }
  textualResponseCategory = self->_textualResponseCategory;
  if (textualResponseCategory)
    objc_msgSend(v4, "setObject:forKey:", textualResponseCategory, CFSTR("textual_response_category"));
  v21 = (__int16)self->_has;
  if ((v21 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numStructuredInfoItems);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("num_structured_info_items"));

    v21 = (__int16)self->_has;
    if ((v21 & 1) == 0)
    {
LABEL_33:
      if ((v21 & 0x80) == 0)
        goto LABEL_50;
      goto LABEL_46;
    }
  }
  else if ((v21 & 1) == 0)
  {
    goto LABEL_33;
  }
  dataSourceType = self->_dataSourceType;
  if (dataSourceType >= 0xB)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dataSourceType);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = off_24FCB4C78[dataSourceType];
  }
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("data_source_type"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_46:
    triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerSourceType);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_24FCB4CD0[triggerSourceType];
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("trigger_source_type"));

  }
LABEL_50:
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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_position);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("position"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v8 = a3;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentName)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_11:
      if ((has & 0x800) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x800) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:
  if (self->_textContentType)
    PBDataWriterWriteStringField();
  if (self->_localeIdentifier)
    PBDataWriterWriteStringField();
  if (self->_bundleIdentifier)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_initiatingProcess)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_textualResponseCategory)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_triggerCategory)
    PBDataWriterWriteStringField();
  if (self->_triggerAttributeType)
    PBDataWriterWriteStringField();
  if (self->_triggerAttributeSubtype)
    PBDataWriterWriteStringField();
  if (self->_triggerAttributeField)
    PBDataWriterWriteStringField();
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_43:
      if ((v7 & 0x200) == 0)
        goto LABEL_44;
LABEL_52:
      PBDataWriterWriteBOOLField();
      if ((*(_WORD *)&self->_has & 1) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteUint32Field();
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
    goto LABEL_52;
LABEL_44:
  if ((v7 & 1) != 0)
LABEL_45:
    PBDataWriterWriteInt32Field();
LABEL_46:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  _DWORD *v9;

  v4 = a3;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v4[17] = self->_position;
    *((_WORD *)v4 + 74) |= 0x40u;
  }
  v9 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    v4 = v9;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v9, "setTreatmentId:");
    v4 = v9;
  }
  if (self->_treatmentName)
  {
    objc_msgSend(v9, "setTreatmentName:");
    v4 = v9;
  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_BYTE *)v4 + 142) = self->_hasResponseContext;
    *((_WORD *)v4 + 74) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_11:
      if ((has & 0x800) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 144) = self->_isResponseContextBlacklisted;
  *((_WORD *)v4 + 74) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 143) = self->_isDocumentEmpty;
    *((_WORD *)v4 + 74) |= 0x800u;
  }
LABEL_13:
  if (self->_textContentType)
  {
    objc_msgSend(v9, "setTextContentType:");
    v4 = v9;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v9, "setLocaleIdentifier:");
    v4 = v9;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v9, "setBundleIdentifier:");
    v4 = v9;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[14] = self->_maxTextualResponseItems;
    *((_WORD *)v4 + 74) |= 8u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[13] = self->_maxStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 4u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v9, "setInitiatingProcess:");
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v4[16] = self->_numTextualResponseItems;
    *((_WORD *)v4 + 74) |= 0x20u;
  }
  if (self->_textualResponseCategory)
  {
    objc_msgSend(v9, "setTextualResponseCategory:");
    v4 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    v4[15] = self->_numStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 0x10u;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x80) != 0)
  {
    v4[34] = self->_triggerSourceType;
    *((_WORD *)v4 + 74) |= 0x80u;
  }
  if (self->_triggerCategory)
  {
    objc_msgSend(v9, "setTriggerCategory:");
    v4 = v9;
  }
  if (self->_triggerAttributeType)
  {
    objc_msgSend(v9, "setTriggerAttributeType:");
    v4 = v9;
  }
  if (self->_triggerAttributeSubtype)
  {
    objc_msgSend(v9, "setTriggerAttributeSubtype:");
    v4 = v9;
  }
  if (self->_triggerAttributeField)
  {
    objc_msgSend(v9, "setTriggerAttributeField:");
    v4 = v9;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
  {
    *((_BYTE *)v4 + 140) = self->_hasContextBeforeInput;
    *((_WORD *)v4 + 74) |= 0x100u;
    v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_43:
      if ((v8 & 0x200) == 0)
        goto LABEL_44;
LABEL_52:
      *((_BYTE *)v4 + 141) = self->_hasRecipientNames;
      *((_WORD *)v4 + 74) |= 0x200u;
      if ((*(_WORD *)&self->_has & 1) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_43;
  }
  v4[12] = self->_maxPredictionItems;
  *((_WORD *)v4 + 74) |= 2u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
    goto LABEL_52;
LABEL_44:
  if ((v8 & 1) != 0)
  {
LABEL_45:
    v4[4] = self->_dataSourceType;
    *((_WORD *)v4 + 74) |= 1u;
  }
LABEL_46:

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
  __int16 has;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int16 v34;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_position;
    *(_WORD *)(v5 + 148) |= 0x40u;
  }
  v7 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  v11 = -[NSString copyWithZone:](self->_treatmentName, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v11;

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 142) = self->_hasResponseContext;
    *(_WORD *)(v6 + 148) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 144) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v6 + 148) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 143) = self->_isDocumentEmpty;
    *(_WORD *)(v6 + 148) |= 0x800u;
  }
LABEL_7:
  v14 = -[NSString copyWithZone:](self->_textContentType, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v16;

  v18 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v18;

  v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_maxTextualResponseItems;
    *(_WORD *)(v6 + 148) |= 8u;
    v20 = (__int16)self->_has;
  }
  if ((v20 & 4) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_maxStructuredInfoItems;
    *(_WORD *)(v6 + 148) |= 4u;
  }
  v21 = -[NSString copyWithZone:](self->_initiatingProcess, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v21;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_numTextualResponseItems;
    *(_WORD *)(v6 + 148) |= 0x20u;
  }
  v23 = -[NSString copyWithZone:](self->_textualResponseCategory, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v23;

  v25 = (__int16)self->_has;
  if ((v25 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_numStructuredInfoItems;
    *(_WORD *)(v6 + 148) |= 0x10u;
    v25 = (__int16)self->_has;
  }
  if ((v25 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_triggerSourceType;
    *(_WORD *)(v6 + 148) |= 0x80u;
  }
  v26 = -[NSString copyWithZone:](self->_triggerCategory, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v26;

  v28 = -[NSString copyWithZone:](self->_triggerAttributeType, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v28;

  v30 = -[NSString copyWithZone:](self->_triggerAttributeSubtype, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v30;

  v32 = -[NSString copyWithZone:](self->_triggerAttributeField, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v32;

  v34 = (__int16)self->_has;
  if ((v34 & 0x100) != 0)
  {
    *(_BYTE *)(v6 + 140) = self->_hasContextBeforeInput;
    *(_WORD *)(v6 + 148) |= 0x100u;
    v34 = (__int16)self->_has;
    if ((v34 & 2) == 0)
    {
LABEL_19:
      if ((v34 & 0x200) == 0)
        goto LABEL_20;
LABEL_28:
      *(_BYTE *)(v6 + 141) = self->_hasRecipientNames;
      *(_WORD *)(v6 + 148) |= 0x200u;
      if ((*(_WORD *)&self->_has & 1) == 0)
        return (id)v6;
      goto LABEL_21;
    }
  }
  else if ((v34 & 2) == 0)
  {
    goto LABEL_19;
  }
  *(_DWORD *)(v6 + 48) = self->_maxPredictionItems;
  *(_WORD *)(v6 + 148) |= 2u;
  v34 = (__int16)self->_has;
  if ((v34 & 0x200) != 0)
    goto LABEL_28;
LABEL_20:
  if ((v34 & 1) != 0)
  {
LABEL_21:
    *(_DWORD *)(v6 + 16) = self->_dataSourceType;
    *(_WORD *)(v6 + 148) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentName;
  NSString *textContentType;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  __int16 has;
  __int16 v13;
  NSString *initiatingProcess;
  NSString *textualResponseCategory;
  NSString *triggerCategory;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;
  __int16 v20;
  __int16 v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_108;
  v5 = *((_WORD *)v4 + 74);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v5 & 0x40) == 0 || self->_position != *((_DWORD *)v4 + 17))
      goto LABEL_108;
  }
  else if ((v5 & 0x40) != 0)
  {
    goto LABEL_108;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_108;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_108;
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:"))
      goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x400) == 0)
      goto LABEL_108;
    if (self->_hasResponseContext)
    {
      if (!*((_BYTE *)v4 + 142))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 142))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x1000) == 0)
      goto LABEL_108;
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x1000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x800) == 0)
      goto LABEL_108;
    if (self->_isDocumentEmpty)
    {
      if (!*((_BYTE *)v4 + 143))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 143))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
    goto LABEL_108;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_108;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_108;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_108;
  }
  has = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 74);
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 14))
      goto LABEL_108;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_108;
  }
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 13))
      goto LABEL_108;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_108;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](initiatingProcess, "isEqual:"))
      goto LABEL_108;
    has = (__int16)self->_has;
    v13 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_numTextualResponseItems != *((_DWORD *)v4 + 16))
      goto LABEL_108;
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_108;
  }
  textualResponseCategory = self->_textualResponseCategory;
  if ((unint64_t)textualResponseCategory | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](textualResponseCategory, "isEqual:"))
      goto LABEL_108;
    has = (__int16)self->_has;
    v13 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_numStructuredInfoItems != *((_DWORD *)v4 + 15))
      goto LABEL_108;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_108;
  }
  if ((has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 34))
      goto LABEL_108;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_108;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_108;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:"))
      goto LABEL_108;
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:"))
      goto LABEL_108;
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](triggerAttributeField, "isEqual:"))
      goto LABEL_108;
  }
  v20 = (__int16)self->_has;
  v21 = *((_WORD *)v4 + 74);
  if ((v20 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x100) == 0)
      goto LABEL_108;
    if (self->_hasContextBeforeInput)
    {
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 140))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x100) != 0)
  {
    goto LABEL_108;
  }
  if ((v20 & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 12))
      goto LABEL_108;
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x200) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((_BYTE *)v4 + 141))
          goto LABEL_108;
        goto LABEL_103;
      }
      if (!*((_BYTE *)v4 + 141))
        goto LABEL_103;
    }
LABEL_108:
    v22 = 0;
    goto LABEL_109;
  }
  if ((*((_WORD *)v4 + 74) & 0x200) != 0)
    goto LABEL_108;
LABEL_103:
  if ((v20 & 1) != 0)
  {
    if ((v21 & 1) == 0 || self->_dataSourceType != *((_DWORD *)v4 + 4))
      goto LABEL_108;
    v22 = 1;
  }
  else
  {
    v22 = (v21 & 1) == 0;
  }
LABEL_109:

  return v22;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
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
  uint64_t v17;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v31;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v31 = 2654435761 * self->_position;
  else
    v31 = 0;
  v30 = -[NSString hash](self->_experimentId, "hash");
  v29 = -[NSString hash](self->_treatmentId, "hash");
  v28 = -[NSString hash](self->_treatmentName, "hash");
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    v27 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_6;
LABEL_9:
    v26 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v27 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_9;
LABEL_6:
  v26 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    v25 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_11;
  }
LABEL_10:
  v25 = 0;
LABEL_11:
  v24 = -[NSString hash](self->_textContentType, "hash");
  v23 = -[NSString hash](self->_localeIdentifier, "hash");
  v22 = -[NSString hash](self->_bundleIdentifier, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v21 = 2654435761 * self->_maxTextualResponseItems;
    if ((has & 4) != 0)
      goto LABEL_13;
  }
  else
  {
    v21 = 0;
    if ((has & 4) != 0)
    {
LABEL_13:
      v20 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_16;
    }
  }
  v20 = 0;
LABEL_16:
  v19 = -[NSString hash](self->_initiatingProcess, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v4 = 2654435761 * self->_numTextualResponseItems;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_textualResponseCategory, "hash");
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    v7 = 2654435761 * self->_numStructuredInfoItems;
    if ((v6 & 0x80) != 0)
      goto LABEL_21;
  }
  else
  {
    v7 = 0;
    if ((v6 & 0x80) != 0)
    {
LABEL_21:
      v8 = 2654435761 * self->_triggerSourceType;
      goto LABEL_24;
    }
  }
  v8 = 0;
LABEL_24:
  v9 = -[NSString hash](self->_triggerCategory, "hash");
  v10 = -[NSString hash](self->_triggerAttributeType, "hash");
  v11 = -[NSString hash](self->_triggerAttributeSubtype, "hash");
  v12 = -[NSString hash](self->_triggerAttributeField, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    v14 = 2654435761 * self->_hasContextBeforeInput;
    if ((v13 & 2) != 0)
    {
LABEL_26:
      v15 = 2654435761 * self->_maxPredictionItems;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_27;
LABEL_31:
      v16 = 0;
      if ((v13 & 1) != 0)
        goto LABEL_28;
LABEL_32:
      v17 = 0;
      return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
    }
  }
  else
  {
    v14 = 0;
    if ((v13 & 2) != 0)
      goto LABEL_26;
  }
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_31;
LABEL_27:
  v16 = 2654435761 * self->_hasRecipientNames;
  if ((v13 & 1) == 0)
    goto LABEL_32;
LABEL_28:
  v17 = 2654435761 * self->_dataSourceType;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  if ((*((_WORD *)v4 + 74) & 0x40) != 0)
  {
    self->_position = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x40u;
  }
  v9 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PSGPBEngagement setExperimentId:](self, "setExperimentId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PSGPBEngagement setTreatmentId:](self, "setTreatmentId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PSGPBEngagement setTreatmentName:](self, "setTreatmentName:");
    v4 = v9;
  }
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x400) != 0)
  {
    self->_hasResponseContext = *((_BYTE *)v4 + 142);
    *(_WORD *)&self->_has |= 0x400u;
    v5 = *((_WORD *)v4 + 74);
    if ((v5 & 0x1000) == 0)
    {
LABEL_11:
      if ((v5 & 0x800) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  self->_isResponseContextBlacklisted = *((_BYTE *)v4 + 144);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
LABEL_12:
    self->_isDocumentEmpty = *((_BYTE *)v4 + 143);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 9))
  {
    -[PSGPBEngagement setTextContentType:](self, "setTextContentType:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PSGPBEngagement setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PSGPBEngagement setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v9;
  }
  v6 = *((_WORD *)v4 + 74);
  if ((v6 & 8) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 74);
  }
  if ((v6 & 4) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PSGPBEngagement setInitiatingProcess:](self, "setInitiatingProcess:");
    v4 = v9;
  }
  if ((*((_WORD *)v4 + 74) & 0x20) != 0)
  {
    self->_numTextualResponseItems = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PSGPBEngagement setTextualResponseCategory:](self, "setTextualResponseCategory:");
    v4 = v9;
  }
  v7 = *((_WORD *)v4 + 74);
  if ((v7 & 0x10) != 0)
  {
    self->_numStructuredInfoItems = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    v7 = *((_WORD *)v4 + 74);
  }
  if ((v7 & 0x80) != 0)
  {
    self->_triggerSourceType = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[PSGPBEngagement setTriggerCategory:](self, "setTriggerCategory:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[PSGPBEngagement setTriggerAttributeType:](self, "setTriggerAttributeType:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[PSGPBEngagement setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[PSGPBEngagement setTriggerAttributeField:](self, "setTriggerAttributeField:");
    v4 = v9;
  }
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x100) != 0)
  {
    self->_hasContextBeforeInput = *((_BYTE *)v4 + 140);
    *(_WORD *)&self->_has |= 0x100u;
    v8 = *((_WORD *)v4 + 74);
    if ((v8 & 2) == 0)
    {
LABEL_43:
      if ((v8 & 0x200) == 0)
        goto LABEL_44;
LABEL_52:
      self->_hasRecipientNames = *((_BYTE *)v4 + 141);
      *(_WORD *)&self->_has |= 0x200u;
      if ((*((_WORD *)v4 + 74) & 1) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_43;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x200) != 0)
    goto LABEL_52;
LABEL_44:
  if ((v8 & 1) != 0)
  {
LABEL_45:
    self->_dataSourceType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_46:

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

- (unsigned)numTextualResponseItems
{
  return self->_numTextualResponseItems;
}

- (NSString)textualResponseCategory
{
  return self->_textualResponseCategory;
}

- (void)setTextualResponseCategory:(id)a3
{
  objc_storeStrong((id *)&self->_textualResponseCategory, a3);
}

- (unsigned)numStructuredInfoItems
{
  return self->_numStructuredInfoItems;
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

- (unsigned)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerCategory, 0);
  objc_storeStrong((id *)&self->_triggerAttributeType, 0);
  objc_storeStrong((id *)&self->_triggerAttributeSubtype, 0);
  objc_storeStrong((id *)&self->_triggerAttributeField, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_textualResponseCategory, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
