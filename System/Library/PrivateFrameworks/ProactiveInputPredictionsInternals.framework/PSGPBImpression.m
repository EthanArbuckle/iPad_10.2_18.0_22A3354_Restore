@implementation PSGPBImpression

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
  *(_WORD *)&self->_has |= 0x200u;
  self->_hasResponseContext = a3;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isResponseContextBlacklisted = a3;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isDocumentEmpty = a3;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hasContextBeforeInput = a3;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_hasRecipientNames = a3;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHasRecipientNames
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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
    return off_24FCB48D8[a3];
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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_triggerSourceType;
  else
    return 0;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_triggerSourceType = a3;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)triggerSourceTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24FCB4930[a3];
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
  v8.super_class = (Class)PSGPBImpression;
  -[PSGPBImpression description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGPBImpression dictionaryRepresentation](self, "dictionaryRepresentation");
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
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasResponseContext);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("has_response_context"));

    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResponseContextBlacklisted);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("is_response_context_blacklisted"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
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
  if ((v11 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasContextBeforeInput);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("has_context_before_input"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x100) != 0)
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
      if ((v21 & 0x40) == 0)
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
    v28 = off_24FCB48D8[dataSourceType];
  }
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("data_source_type"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
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
      v30 = off_24FCB4930[triggerSourceType];
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
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBImpressionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_treatmentId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_treatmentName)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v9;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v9;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    v4 = v9;
  }
LABEL_11:
  if (self->_textContentType)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v9;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v9;
  }
  if (self->_initiatingProcess)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v9;
  }
  if (self->_textualResponseCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v9;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_triggerCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_triggerAttributeType)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_triggerAttributeSubtype)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_triggerAttributeField)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v9;
    v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_41:
      if ((v8 & 0x100) == 0)
        goto LABEL_42;
LABEL_50:
      PBDataWriterWriteBOOLField();
      v4 = v9;
      if ((*(_WORD *)&self->_has & 1) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
    goto LABEL_50;
LABEL_42:
  if ((v8 & 1) != 0)
  {
LABEL_43:
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
LABEL_44:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
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
  if ((has & 0x200) != 0)
  {
    *((_BYTE *)v4 + 142) = self->_hasResponseContext;
    *((_WORD *)v4 + 74) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 144) = self->_isResponseContextBlacklisted;
  *((_WORD *)v4 + 74) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 143) = self->_isDocumentEmpty;
    *((_WORD *)v4 + 74) |= 0x400u;
  }
LABEL_11:
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
    *((_DWORD *)v4 + 14) = self->_maxTextualResponseItems;
    *((_WORD *)v4 + 74) |= 8u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_maxStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 4u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v9, "setInitiatingProcess:");
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_numTextualResponseItems;
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
    *((_DWORD *)v4 + 15) = self->_numStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 0x10u;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_triggerSourceType;
    *((_WORD *)v4 + 74) |= 0x40u;
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
  if ((v8 & 0x80) != 0)
  {
    *((_BYTE *)v4 + 140) = self->_hasContextBeforeInput;
    *((_WORD *)v4 + 74) |= 0x80u;
    v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_41:
      if ((v8 & 0x100) == 0)
        goto LABEL_42;
LABEL_50:
      *((_BYTE *)v4 + 141) = self->_hasRecipientNames;
      *((_WORD *)v4 + 74) |= 0x100u;
      if ((*(_WORD *)&self->_has & 1) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_41;
  }
  *((_DWORD *)v4 + 12) = self->_maxPredictionItems;
  *((_WORD *)v4 + 74) |= 2u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
    goto LABEL_50;
LABEL_42:
  if ((v8 & 1) != 0)
  {
LABEL_43:
    *((_DWORD *)v4 + 4) = self->_dataSourceType;
    *((_WORD *)v4 + 74) |= 1u;
  }
LABEL_44:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __int16 v33;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  v10 = -[NSString copyWithZone:](self->_treatmentName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 142) = self->_hasResponseContext;
    *(_WORD *)(v5 + 148) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 144) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v5 + 148) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 143) = self->_isDocumentEmpty;
    *(_WORD *)(v5 + 148) |= 0x400u;
  }
LABEL_5:
  v13 = -[NSString copyWithZone:](self->_textContentType, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v17;

  v19 = (__int16)self->_has;
  if ((v19 & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_maxTextualResponseItems;
    *(_WORD *)(v5 + 148) |= 8u;
    v19 = (__int16)self->_has;
  }
  if ((v19 & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_maxStructuredInfoItems;
    *(_WORD *)(v5 + 148) |= 4u;
  }
  v20 = -[NSString copyWithZone:](self->_initiatingProcess, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_numTextualResponseItems;
    *(_WORD *)(v5 + 148) |= 0x20u;
  }
  v22 = -[NSString copyWithZone:](self->_textualResponseCategory, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  v24 = (__int16)self->_has;
  if ((v24 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_numStructuredInfoItems;
    *(_WORD *)(v5 + 148) |= 0x10u;
    v24 = (__int16)self->_has;
  }
  if ((v24 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_triggerSourceType;
    *(_WORD *)(v5 + 148) |= 0x40u;
  }
  v25 = -[NSString copyWithZone:](self->_triggerCategory, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v25;

  v27 = -[NSString copyWithZone:](self->_triggerAttributeType, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v27;

  v29 = -[NSString copyWithZone:](self->_triggerAttributeSubtype, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v29;

  v31 = -[NSString copyWithZone:](self->_triggerAttributeField, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v31;

  v33 = (__int16)self->_has;
  if ((v33 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 140) = self->_hasContextBeforeInput;
    *(_WORD *)(v5 + 148) |= 0x80u;
    v33 = (__int16)self->_has;
    if ((v33 & 2) == 0)
    {
LABEL_17:
      if ((v33 & 0x100) == 0)
        goto LABEL_18;
LABEL_26:
      *(_BYTE *)(v5 + 141) = self->_hasRecipientNames;
      *(_WORD *)(v5 + 148) |= 0x100u;
      if ((*(_WORD *)&self->_has & 1) == 0)
        return (id)v5;
      goto LABEL_19;
    }
  }
  else if ((v33 & 2) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 48) = self->_maxPredictionItems;
  *(_WORD *)(v5 + 148) |= 2u;
  v33 = (__int16)self->_has;
  if ((v33 & 0x100) != 0)
    goto LABEL_26;
LABEL_18:
  if ((v33 & 1) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 16) = self->_dataSourceType;
    *(_WORD *)(v5 + 148) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentName;
  NSString *textContentType;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  __int16 has;
  __int16 v12;
  NSString *initiatingProcess;
  NSString *textualResponseCategory;
  NSString *triggerCategory;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;
  __int16 v19;
  __int16 v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_103;
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:"))
      goto LABEL_103;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_103;
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:"))
      goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x200) == 0)
      goto LABEL_103;
    if (self->_hasResponseContext)
    {
      if (!*((_BYTE *)v4 + 142))
        goto LABEL_103;
    }
    else if (*((_BYTE *)v4 + 142))
    {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x200) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x800) == 0)
      goto LABEL_103;
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_103;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x400) == 0)
      goto LABEL_103;
    if (self->_isDocumentEmpty)
    {
      if (!*((_BYTE *)v4 + 143))
        goto LABEL_103;
    }
    else if (*((_BYTE *)v4 + 143))
    {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
    goto LABEL_103;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_103;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_103;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_103;
  }
  has = (__int16)self->_has;
  v12 = *((_WORD *)v4 + 74);
  if ((has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 14))
      goto LABEL_103;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 13))
      goto LABEL_103;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_103;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](initiatingProcess, "isEqual:"))
      goto LABEL_103;
    has = (__int16)self->_has;
    v12 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_numTextualResponseItems != *((_DWORD *)v4 + 16))
      goto LABEL_103;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_103;
  }
  textualResponseCategory = self->_textualResponseCategory;
  if ((unint64_t)textualResponseCategory | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](textualResponseCategory, "isEqual:"))
      goto LABEL_103;
    has = (__int16)self->_has;
    v12 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_numStructuredInfoItems != *((_DWORD *)v4 + 15))
      goto LABEL_103;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 34))
      goto LABEL_103;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_103;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_103;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:"))
      goto LABEL_103;
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:"))
      goto LABEL_103;
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](triggerAttributeField, "isEqual:"))
      goto LABEL_103;
  }
  v19 = (__int16)self->_has;
  v20 = *((_WORD *)v4 + 74);
  if ((v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0)
      goto LABEL_103;
    if (self->_hasContextBeforeInput)
    {
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_103;
    }
    else if (*((_BYTE *)v4 + 140))
    {
      goto LABEL_103;
    }
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_103;
  }
  if ((v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 12))
      goto LABEL_103;
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x100) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((_BYTE *)v4 + 141))
          goto LABEL_103;
        goto LABEL_98;
      }
      if (!*((_BYTE *)v4 + 141))
        goto LABEL_98;
    }
LABEL_103:
    v21 = 0;
    goto LABEL_104;
  }
  if ((*((_WORD *)v4 + 74) & 0x100) != 0)
    goto LABEL_103;
LABEL_98:
  if ((v19 & 1) != 0)
  {
    if ((v20 & 1) == 0 || self->_dataSourceType != *((_DWORD *)v4 + 4))
      goto LABEL_103;
    v21 = 1;
  }
  else
  {
    v21 = (v20 & 1) == 0;
  }
LABEL_104:

  return v21;
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
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;

  v31 = -[NSString hash](self->_experimentId, "hash");
  v30 = -[NSString hash](self->_treatmentId, "hash");
  v29 = -[NSString hash](self->_treatmentName, "hash");
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    v28 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
LABEL_6:
    v27 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v28 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_6;
LABEL_3:
  v27 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    v26 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_8;
  }
LABEL_7:
  v26 = 0;
LABEL_8:
  v25 = -[NSString hash](self->_textContentType, "hash");
  v24 = -[NSString hash](self->_localeIdentifier, "hash");
  v23 = -[NSString hash](self->_bundleIdentifier, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v22 = 2654435761 * self->_maxTextualResponseItems;
    if ((has & 4) != 0)
      goto LABEL_10;
  }
  else
  {
    v22 = 0;
    if ((has & 4) != 0)
    {
LABEL_10:
      v21 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_13;
    }
  }
  v21 = 0;
LABEL_13:
  v19 = -[NSString hash](self->_initiatingProcess, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v4 = 2654435761 * self->_numTextualResponseItems;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_textualResponseCategory, "hash", v19);
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    v7 = 2654435761 * self->_numStructuredInfoItems;
    if ((v6 & 0x40) != 0)
      goto LABEL_18;
  }
  else
  {
    v7 = 0;
    if ((v6 & 0x40) != 0)
    {
LABEL_18:
      v8 = 2654435761 * self->_triggerSourceType;
      goto LABEL_21;
    }
  }
  v8 = 0;
LABEL_21:
  v9 = -[NSString hash](self->_triggerCategory, "hash");
  v10 = -[NSString hash](self->_triggerAttributeType, "hash");
  v11 = -[NSString hash](self->_triggerAttributeSubtype, "hash");
  v12 = -[NSString hash](self->_triggerAttributeField, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    v14 = 2654435761 * self->_hasContextBeforeInput;
    if ((v13 & 2) != 0)
    {
LABEL_23:
      v15 = 2654435761 * self->_maxPredictionItems;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_24;
LABEL_28:
      v16 = 0;
      if ((v13 & 1) != 0)
        goto LABEL_25;
LABEL_29:
      v17 = 0;
      return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
    }
  }
  else
  {
    v14 = 0;
    if ((v13 & 2) != 0)
      goto LABEL_23;
  }
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_28;
LABEL_24:
  v16 = 2654435761 * self->_hasRecipientNames;
  if ((v13 & 1) == 0)
    goto LABEL_29;
LABEL_25:
  v17 = 2654435761 * self->_dataSourceType;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
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
  v9 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PSGPBImpression setExperimentId:](self, "setExperimentId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PSGPBImpression setTreatmentId:](self, "setTreatmentId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PSGPBImpression setTreatmentName:](self, "setTreatmentName:");
    v4 = v9;
  }
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x200) != 0)
  {
    self->_hasResponseContext = *((_BYTE *)v4 + 142);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)v4 + 74);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 0x400) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x800) == 0)
  {
    goto LABEL_9;
  }
  self->_isResponseContextBlacklisted = *((_BYTE *)v4 + 144);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
LABEL_10:
    self->_isDocumentEmpty = *((_BYTE *)v4 + 143);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 9))
  {
    -[PSGPBImpression setTextContentType:](self, "setTextContentType:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PSGPBImpression setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PSGPBImpression setBundleIdentifier:](self, "setBundleIdentifier:");
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
    -[PSGPBImpression setInitiatingProcess:](self, "setInitiatingProcess:");
    v4 = v9;
  }
  if ((*((_WORD *)v4 + 74) & 0x20) != 0)
  {
    self->_numTextualResponseItems = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PSGPBImpression setTextualResponseCategory:](self, "setTextualResponseCategory:");
    v4 = v9;
  }
  v7 = *((_WORD *)v4 + 74);
  if ((v7 & 0x10) != 0)
  {
    self->_numStructuredInfoItems = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    v7 = *((_WORD *)v4 + 74);
  }
  if ((v7 & 0x40) != 0)
  {
    self->_triggerSourceType = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[PSGPBImpression setTriggerCategory:](self, "setTriggerCategory:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[PSGPBImpression setTriggerAttributeType:](self, "setTriggerAttributeType:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[PSGPBImpression setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[PSGPBImpression setTriggerAttributeField:](self, "setTriggerAttributeField:");
    v4 = v9;
  }
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x80) != 0)
  {
    self->_hasContextBeforeInput = *((_BYTE *)v4 + 140);
    *(_WORD *)&self->_has |= 0x80u;
    v8 = *((_WORD *)v4 + 74);
    if ((v8 & 2) == 0)
    {
LABEL_41:
      if ((v8 & 0x100) == 0)
        goto LABEL_42;
LABEL_50:
      self->_hasRecipientNames = *((_BYTE *)v4 + 141);
      *(_WORD *)&self->_has |= 0x100u;
      if ((*((_WORD *)v4 + 74) & 1) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_41;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x100) != 0)
    goto LABEL_50;
LABEL_42:
  if ((v8 & 1) != 0)
  {
LABEL_43:
    self->_dataSourceType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_44:

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
