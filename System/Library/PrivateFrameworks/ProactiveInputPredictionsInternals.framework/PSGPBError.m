@implementation PSGPBError

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
  *(_WORD *)&self->_has |= 0x80u;
  self->_hasResponseContext = a3;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isResponseContextBlacklisted = a3;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isDocumentEmpty = a3;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsDocumentEmpty
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hasContextBeforeInput = a3;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hasRecipientNames = a3;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHasRecipientNames
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_triggerSourceType;
  else
    return 0;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_triggerSourceType = a3;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)triggerSourceTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24FCB4C18[a3];
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

- (int)errorType
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_errorType;
  else
    return 0;
}

- (void)setErrorType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_errorType = a3;
}

- (void)setHasErrorType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasErrorType
{
  return *(_WORD *)&self->_has & 1;
}

- (id)errorTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24FCB4C50[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsErrorType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ErrorType_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ErrorType_TIMEOUT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ErrorType_WORD_BOUNDARY_XPC_TIMEOUT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ErrorType_ZKW_XPC_TIMEOUT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ErrorType_PORTRAIT_XPC_TIMEOUT")))
  {
    v4 = 4;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PSGPBError;
  -[PSGPBError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGPBError dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *triggerCategory;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;
  uint64_t errorType;
  __CFString *v30;

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
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasResponseContext);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("has_response_context"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_9:
      if ((has & 0x100) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResponseContextBlacklisted);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("is_response_context_blacklisted"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
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
  if ((v11 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasContextBeforeInput);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("has_context_before_input"));

    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x40) != 0)
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
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("max_textual_response_items"));

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
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("max_structured_info_items"));

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
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerSourceType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_24FCB4C18[triggerSourceType];
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
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    errorType = self->_errorType;
    if (errorType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_errorType);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_24FCB4C50[errorType];
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("error_type"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_treatmentId)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_treatmentName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_11:
      if ((has & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_13:
  if (self->_textContentType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  if (self->_initiatingProcess)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_27:
      if ((v7 & 0x40) == 0)
        goto LABEL_28;
      goto LABEL_44;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_28:
    if ((v7 & 0x10) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_29:
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
LABEL_30:
  if (self->_triggerCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_triggerAttributeType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_triggerAttributeSubtype)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_triggerAttributeField)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  _DWORD *v8;

  v4 = a3;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v4[4] = self->_errorType;
    *((_WORD *)v4 + 66) |= 1u;
  }
  v8 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    v4 = v8;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v8, "setTreatmentId:");
    v4 = v8;
  }
  if (self->_treatmentName)
  {
    objc_msgSend(v8, "setTreatmentName:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_BYTE *)v4 + 126) = self->_hasResponseContext;
    *((_WORD *)v4 + 66) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_11:
      if ((has & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 128) = self->_isResponseContextBlacklisted;
  *((_WORD *)v4 + 66) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 127) = self->_isDocumentEmpty;
    *((_WORD *)v4 + 66) |= 0x100u;
  }
LABEL_13:
  if (self->_textContentType)
  {
    objc_msgSend(v8, "setTextContentType:");
    v4 = v8;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v8, "setLocaleIdentifier:");
    v4 = v8;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v8, "setBundleIdentifier:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[14] = self->_maxTextualResponseItems;
    *((_WORD *)v4 + 66) |= 8u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[13] = self->_maxStructuredInfoItems;
    *((_WORD *)v4 + 66) |= 4u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v8, "setInitiatingProcess:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    *((_BYTE *)v4 + 124) = self->_hasContextBeforeInput;
    *((_WORD *)v4 + 66) |= 0x20u;
    v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_27:
      if ((v7 & 0x40) == 0)
        goto LABEL_28;
      goto LABEL_44;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_27;
  }
  v4[12] = self->_maxPredictionItems;
  *((_WORD *)v4 + 66) |= 2u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_28:
    if ((v7 & 0x10) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_44:
  *((_BYTE *)v4 + 125) = self->_hasRecipientNames;
  *((_WORD *)v4 + 66) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_29:
    v4[30] = self->_triggerSourceType;
    *((_WORD *)v4 + 66) |= 0x10u;
  }
LABEL_30:
  if (self->_triggerCategory)
  {
    objc_msgSend(v8, "setTriggerCategory:");
    v4 = v8;
  }
  if (self->_triggerAttributeType)
  {
    objc_msgSend(v8, "setTriggerAttributeType:");
    v4 = v8;
  }
  if (self->_triggerAttributeSubtype)
  {
    objc_msgSend(v8, "setTriggerAttributeSubtype:");
    v4 = v8;
  }
  if (self->_triggerAttributeField)
  {
    objc_msgSend(v8, "setTriggerAttributeField:");
    v4 = v8;
  }

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
  __int16 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_errorType;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v9;

  v11 = -[NSString copyWithZone:](self->_treatmentName, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v11;

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 126) = self->_hasResponseContext;
    *(_WORD *)(v6 + 132) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 128) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v6 + 132) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 127) = self->_isDocumentEmpty;
    *(_WORD *)(v6 + 132) |= 0x100u;
  }
LABEL_7:
  v14 = -[NSString copyWithZone:](self->_textContentType, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

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
    *(_WORD *)(v6 + 132) |= 8u;
    v20 = (__int16)self->_has;
  }
  if ((v20 & 4) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_maxStructuredInfoItems;
    *(_WORD *)(v6 + 132) |= 4u;
  }
  v21 = -[NSString copyWithZone:](self->_initiatingProcess, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v21;

  v23 = (__int16)self->_has;
  if ((v23 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 124) = self->_hasContextBeforeInput;
    *(_WORD *)(v6 + 132) |= 0x20u;
    v23 = (__int16)self->_has;
    if ((v23 & 2) == 0)
    {
LABEL_13:
      if ((v23 & 0x40) == 0)
        goto LABEL_14;
LABEL_22:
      *(_BYTE *)(v6 + 125) = self->_hasRecipientNames;
      *(_WORD *)(v6 + 132) |= 0x40u;
      if ((*(_WORD *)&self->_has & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 48) = self->_maxPredictionItems;
  *(_WORD *)(v6 + 132) |= 2u;
  v23 = (__int16)self->_has;
  if ((v23 & 0x40) != 0)
    goto LABEL_22;
LABEL_14:
  if ((v23 & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 120) = self->_triggerSourceType;
    *(_WORD *)(v6 + 132) |= 0x10u;
  }
LABEL_16:
  v24 = -[NSString copyWithZone:](self->_triggerCategory, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v24;

  v26 = -[NSString copyWithZone:](self->_triggerAttributeType, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v26;

  v28 = -[NSString copyWithZone:](self->_triggerAttributeSubtype, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v28;

  v30 = -[NSString copyWithZone:](self->_triggerAttributeField, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v30;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentName;
  __int16 v9;
  NSString *textContentType;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  __int16 has;
  __int16 v14;
  NSString *initiatingProcess;
  NSString *triggerCategory;
  NSString *triggerAttributeType;
  NSString *triggerAttributeSubtype;
  NSString *triggerAttributeField;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_90;
  v5 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_errorType != *((_DWORD *)v4 + 4))
      goto LABEL_90;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_90;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_90;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_90;
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:"))
      goto LABEL_90;
  }
  v9 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0)
      goto LABEL_90;
    if (self->_hasResponseContext)
    {
      if (!*((_BYTE *)v4 + 126))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 126))
    {
      goto LABEL_90;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0)
      goto LABEL_90;
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0)
      goto LABEL_90;
    if (self->_isDocumentEmpty)
    {
      if (!*((_BYTE *)v4 + 127))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 127))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_90;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_90;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_90;
  }
  has = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 66);
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 14))
      goto LABEL_90;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 13))
      goto LABEL_90;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_90;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](initiatingProcess, "isEqual:"))
      goto LABEL_90;
    has = (__int16)self->_has;
    v14 = *((_WORD *)v4 + 66);
  }
  if ((has & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0)
      goto LABEL_90;
    if (self->_hasContextBeforeInput)
    {
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 124))
    {
      goto LABEL_90;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 12))
      goto LABEL_90;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v14 & 0x40) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((_BYTE *)v4 + 125))
          goto LABEL_90;
        goto LABEL_77;
      }
      if (!*((_BYTE *)v4 + 125))
        goto LABEL_77;
    }
LABEL_90:
    v20 = 0;
    goto LABEL_91;
  }
  if ((v14 & 0x40) != 0)
    goto LABEL_90;
LABEL_77:
  if ((has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 30))
      goto LABEL_90;
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_90;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:"))
      goto LABEL_90;
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:"))
      goto LABEL_90;
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((_QWORD *)v4 + 11))
    v20 = -[NSString isEqual:](triggerAttributeField, "isEqual:");
  else
    v20 = 1;
LABEL_91:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  __int16 has;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;

  if ((*(_WORD *)&self->_has & 1) != 0)
    v26 = 2654435761 * self->_errorType;
  else
    v26 = 0;
  v25 = -[NSString hash](self->_experimentId, "hash");
  v24 = -[NSString hash](self->_treatmentId, "hash");
  v23 = -[NSString hash](self->_treatmentName, "hash");
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
    v22 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
LABEL_9:
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v22 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_9;
LABEL_6:
  v3 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
LABEL_11:
  v5 = -[NSString hash](self->_textContentType, "hash");
  v6 = -[NSString hash](self->_localeIdentifier, "hash");
  v7 = -[NSString hash](self->_bundleIdentifier, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v9 = 2654435761 * self->_maxTextualResponseItems;
    if ((has & 4) != 0)
      goto LABEL_13;
  }
  else
  {
    v9 = 0;
    if ((has & 4) != 0)
    {
LABEL_13:
      v10 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_16;
    }
  }
  v10 = 0;
LABEL_16:
  v11 = -[NSString hash](self->_initiatingProcess, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x20) != 0)
  {
    v13 = 2654435761 * self->_hasContextBeforeInput;
    if ((v12 & 2) != 0)
    {
LABEL_18:
      v14 = 2654435761 * self->_maxPredictionItems;
      if ((v12 & 0x40) != 0)
        goto LABEL_19;
LABEL_23:
      v15 = 0;
      if ((v12 & 0x10) != 0)
        goto LABEL_20;
LABEL_24:
      v16 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 2) != 0)
      goto LABEL_18;
  }
  v14 = 0;
  if ((v12 & 0x40) == 0)
    goto LABEL_23;
LABEL_19:
  v15 = 2654435761 * self->_hasRecipientNames;
  if ((v12 & 0x10) == 0)
    goto LABEL_24;
LABEL_20:
  v16 = 2654435761 * self->_triggerSourceType;
LABEL_25:
  v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11;
  v18 = v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_triggerCategory, "hash");
  v19 = v18 ^ -[NSString hash](self->_triggerAttributeType, "hash");
  v20 = v19 ^ -[NSString hash](self->_triggerAttributeSubtype, "hash");
  return v17 ^ v20 ^ -[NSString hash](self->_triggerAttributeField, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  if ((*((_WORD *)v4 + 66) & 1) != 0)
  {
    self->_errorType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PSGPBError setExperimentId:](self, "setExperimentId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PSGPBError setTreatmentId:](self, "setTreatmentId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PSGPBError setTreatmentName:](self, "setTreatmentName:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 66);
  if ((v5 & 0x80) != 0)
  {
    self->_hasResponseContext = *((_BYTE *)v4 + 126);
    *(_WORD *)&self->_has |= 0x80u;
    v5 = *((_WORD *)v4 + 66);
    if ((v5 & 0x200) == 0)
    {
LABEL_11:
      if ((v5 & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) == 0)
  {
    goto LABEL_11;
  }
  self->_isResponseContextBlacklisted = *((_BYTE *)v4 + 128);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
LABEL_12:
    self->_isDocumentEmpty = *((_BYTE *)v4 + 127);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 8))
  {
    -[PSGPBError setTextContentType:](self, "setTextContentType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PSGPBError setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PSGPBError setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 8) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 66);
  }
  if ((v6 & 4) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PSGPBError setInitiatingProcess:](self, "setInitiatingProcess:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 66);
  if ((v7 & 0x20) != 0)
  {
    self->_hasContextBeforeInput = *((_BYTE *)v4 + 124);
    *(_WORD *)&self->_has |= 0x20u;
    v7 = *((_WORD *)v4 + 66);
    if ((v7 & 2) == 0)
    {
LABEL_27:
      if ((v7 & 0x40) == 0)
        goto LABEL_28;
      goto LABEL_44;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_27;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  v7 = *((_WORD *)v4 + 66);
  if ((v7 & 0x40) == 0)
  {
LABEL_28:
    if ((v7 & 0x10) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_44:
  self->_hasRecipientNames = *((_BYTE *)v4 + 125);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 66) & 0x10) != 0)
  {
LABEL_29:
    self->_triggerSourceType = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 14))
  {
    -[PSGPBError setTriggerCategory:](self, "setTriggerCategory:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[PSGPBError setTriggerAttributeType:](self, "setTriggerAttributeType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PSGPBError setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PSGPBError setTriggerAttributeField:](self, "setTriggerAttributeField:");
    v4 = v8;
  }

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
