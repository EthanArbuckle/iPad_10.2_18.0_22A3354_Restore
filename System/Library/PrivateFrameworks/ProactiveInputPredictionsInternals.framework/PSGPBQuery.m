@implementation PSGPBQuery

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
  *(_BYTE *)&self->_has |= 0x20u;
  self->_hasResponseContext = a3;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isResponseContextBlacklisted = a3;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isDocumentEmpty = a3;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hasContextBeforeInput = a3;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hasRecipientNames = a3;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHasRecipientNames
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  *(_BYTE *)&self->_has |= 4u;
  self->_maxTextualResponseItems = a3;
}

- (void)setHasMaxTextualResponseItems:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxTextualResponseItems
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMaxStructuredInfoItems:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxStructuredInfoItems = a3;
}

- (void)setHasMaxStructuredInfoItems:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxStructuredInfoItems
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaxPredictionItems:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxPredictionItems = a3;
}

- (void)setHasMaxPredictionItems:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxPredictionItems
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasInitiatingProcess
{
  return self->_initiatingProcess != 0;
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
  v8.super_class = (Class)PSGPBQuery;
  -[PSGPBQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGPBQuery dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v9;
  NSString *textContentType;
  char v11;
  void *v12;
  void *v13;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  char v16;
  void *v17;
  NSString *initiatingProcess;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

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
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasResponseContext);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("has_response_context"));

    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResponseContextBlacklisted);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("is_response_context_blacklisted"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
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
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasContextBeforeInput);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("has_context_before_input"));

    v11 = (char)self->_has;
  }
  if ((v11 & 0x10) != 0)
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
  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxTextualResponseItems);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("max_textual_response_items"));

    v16 = (char)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 1) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxStructuredInfoItems);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("max_structured_info_items"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  char v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_textContentType)
    PBDataWriterWriteStringField();
  if (self->_localeIdentifier)
    PBDataWriterWriteStringField();
  if (self->_bundleIdentifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_initiatingProcess)
    PBDataWriterWriteStringField();
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentName)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_25;
LABEL_32:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  PBDataWriterWriteBOOLField();
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_32;
LABEL_25:
  if ((v6 & 0x10) != 0)
LABEL_26:
    PBDataWriterWriteBOOLField();
LABEL_27:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  char v6;
  char v7;
  _BYTE *v8;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[82] = self->_hasResponseContext;
    v4[88] |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[84] = self->_isResponseContextBlacklisted;
  v4[88] |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v4[83] = self->_isDocumentEmpty;
    v4[88] |= 0x40u;
  }
LABEL_5:
  v8 = v4;
  if (self->_textContentType)
  {
    objc_msgSend(v4, "setTextContentType:");
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
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_maxTextualResponseItems;
    v4[88] |= 4u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_maxStructuredInfoItems;
    v4[88] |= 2u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v8, "setInitiatingProcess:");
    v4 = v8;
  }
  if (self->_experimentId)
  {
    objc_msgSend(v8, "setExperimentId:");
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
  v7 = (char)self->_has;
  if ((v7 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_25;
LABEL_32:
    *((_DWORD *)v4 + 10) = self->_maxPredictionItems;
    v4[88] |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  v4[80] = self->_hasContextBeforeInput;
  v4[88] |= 8u;
  v7 = (char)self->_has;
  if ((v7 & 1) != 0)
    goto LABEL_32;
LABEL_25:
  if ((v7 & 0x10) != 0)
  {
LABEL_26:
    v4[81] = self->_hasRecipientNames;
    v4[88] |= 0x10u;
  }
LABEL_27:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5[82] = self->_hasResponseContext;
    v5[88] |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v5[84] = self->_isResponseContextBlacklisted;
  v5[88] |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v5[83] = self->_isDocumentEmpty;
    v5[88] |= 0x40u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_textContentType, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 7);
  *((_QWORD *)v6 + 7) = v8;

  v10 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v10;

  v12 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v12;

  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_maxTextualResponseItems;
    v6[88] |= 4u;
    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_maxStructuredInfoItems;
    v6[88] |= 2u;
  }
  v15 = -[NSString copyWithZone:](self->_initiatingProcess, "copyWithZone:", a3);
  v16 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v15;

  v17 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v18 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v17;

  v19 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v20 = (void *)*((_QWORD *)v6 + 8);
  *((_QWORD *)v6 + 8) = v19;

  v21 = -[NSString copyWithZone:](self->_treatmentName, "copyWithZone:", a3);
  v22 = (void *)*((_QWORD *)v6 + 9);
  *((_QWORD *)v6 + 9) = v21;

  v23 = (char)self->_has;
  if ((v23 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
LABEL_18:
    *((_DWORD *)v6 + 10) = self->_maxPredictionItems;
    v6[88] |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v6;
    goto LABEL_12;
  }
  v6[80] = self->_hasContextBeforeInput;
  v6[88] |= 8u;
  v23 = (char)self->_has;
  if ((v23 & 1) != 0)
    goto LABEL_18;
LABEL_11:
  if ((v23 & 0x10) != 0)
  {
LABEL_12:
    v6[81] = self->_hasRecipientNames;
    v6[88] |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *textContentType;
  NSString *localeIdentifier;
  NSString *bundleIdentifier;
  NSString *initiatingProcess;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentName;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x20) == 0)
      goto LABEL_66;
    if (self->_hasResponseContext)
    {
      if (!*((_BYTE *)v4 + 82))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 82))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x80) == 0)
      goto LABEL_66;
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 84))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x80) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x40) == 0)
      goto LABEL_66;
    if (self->_isDocumentEmpty)
    {
      if (!*((_BYTE *)v4 + 83))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 83))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x40) != 0)
  {
    goto LABEL_66;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_66;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_66;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 12))
      goto LABEL_66;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 11))
      goto LABEL_66;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_66;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](initiatingProcess, "isEqual:"))
  {
    goto LABEL_66;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:"))
      goto LABEL_66;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_66;
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:"))
      goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0)
      goto LABEL_66;
    if (self->_hasContextBeforeInput)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_66;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 10))
      goto LABEL_66;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((_BYTE *)v4 + 81))
          goto LABEL_66;
      }
      else if (*((_BYTE *)v4 + 81))
      {
        goto LABEL_66;
      }
      v12 = 1;
      goto LABEL_67;
    }
LABEL_66:
    v12 = 0;
    goto LABEL_67;
  }
  v12 = (*((_BYTE *)v4 + 88) & 0x10) == 0;
LABEL_67:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v3 = 2654435761 * self->_hasResponseContext;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isResponseContextBlacklisted;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v21 = v4;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v5 = 2654435761 * self->_isDocumentEmpty;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_textContentType, "hash");
  v19 = -[NSString hash](self->_localeIdentifier, "hash");
  v7 = -[NSString hash](self->_bundleIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_maxTextualResponseItems;
  else
    v8 = 0;
  v20 = v6;
  v9 = v7;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_maxStructuredInfoItems;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_initiatingProcess, "hash");
  v12 = -[NSString hash](self->_experimentId, "hash");
  v13 = -[NSString hash](self->_treatmentId, "hash");
  v14 = -[NSString hash](self->_treatmentName, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v15 = 2654435761 * self->_hasContextBeforeInput;
  else
    v15 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16 = 2654435761 * self->_maxPredictionItems;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_20;
LABEL_22:
    v17 = 0;
    return v21 ^ v3 ^ v5 ^ v20 ^ v19 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
  v16 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_22;
LABEL_20:
  v17 = 2654435761 * self->_hasRecipientNames;
  return v21 ^ v3 ^ v5 ^ v20 ^ v19 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  id v8;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 0x20) != 0)
  {
    self->_hasResponseContext = *((_BYTE *)v4 + 82);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 88);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_isResponseContextBlacklisted = *((_BYTE *)v4 + 84);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)v4 + 88) & 0x40) != 0)
  {
LABEL_4:
    self->_isDocumentEmpty = *((_BYTE *)v4 + 83);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_5:
  v8 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[PSGPBQuery setTextContentType:](self, "setTextContentType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PSGPBQuery setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PSGPBQuery setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v8;
  }
  v6 = *((_BYTE *)v4 + 88);
  if ((v6 & 4) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 88);
  }
  if ((v6 & 2) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PSGPBQuery setInitiatingProcess:](self, "setInitiatingProcess:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PSGPBQuery setExperimentId:](self, "setExperimentId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[PSGPBQuery setTreatmentId:](self, "setTreatmentId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PSGPBQuery setTreatmentName:](self, "setTreatmentName:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0)
      goto LABEL_25;
LABEL_32:
    self->_maxPredictionItems = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  self->_hasContextBeforeInput = *((_BYTE *)v4 + 80);
  *(_BYTE *)&self->_has |= 8u;
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 1) != 0)
    goto LABEL_32;
LABEL_25:
  if ((v7 & 0x10) != 0)
  {
LABEL_26:
    self->_hasRecipientNames = *((_BYTE *)v4 + 81);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_27:

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
