@implementation PREAMResponseListGenerated

- (void)setIsCached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isCached = a3;
}

- (void)setHasIsCached:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsCached
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)generationStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_generationStatus;
  else
    return 0;
}

- (void)setGenerationStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_generationStatus = a3;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)generationStatusAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7D9DFF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGenerationStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NORMAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CACHED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FALLBACK_TO_RK_NIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FALLBACK_TO_RK_ERROR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONLY_CANNED_QR_EMPTY_ARRAY")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNumberOfResponsesGenerated:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfResponsesGenerated = a3;
}

- (void)setHasNumberOfResponsesGenerated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfResponsesGenerated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumberOfCustomResponses:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfCustomResponses = a3;
}

- (void)setHasNumberOfCustomResponses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfCustomResponses
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumberOfRobotResponses:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfRobotResponses = a3;
}

- (void)setHasNumberOfRobotResponses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfRobotResponses
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasTreatmentModelName
{
  return self->_treatmentModelName != 0;
}

- (BOOL)hasHostProcess
{
  return self->_hostProcess != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasLang
{
  return self->_lang != 0;
}

- (void)setIsApricotDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isApricotDevice = a3;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsApricotDevice
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)ageGroup
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_ageGroup;
  else
    return 0;
}

- (void)setAgeGroup:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ageGroup = a3;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgeGroup
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)ageGroupAsString:(int)a3
{
  if (a3 < 7)
    return off_1E7D9E028[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAgeGroup:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_0TO18")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_19TO30")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_31TO50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_51TO65")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_66TO75")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_76UP")))
  {
    v4 = 6;
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
  v8.super_class = (Class)PREAMResponseListGenerated;
  -[PREAMResponseListGenerated description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREAMResponseListGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  char v12;
  void *v13;
  uint64_t ageGroup;
  __CFString *v15;
  void *v16;
  uint64_t generationStatus;
  __CFString *v18;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCached);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("is_cached"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  generationStatus = self->_generationStatus;
  if (generationStatus >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_generationStatus);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_1E7D9DFF8[generationStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("generation_status"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfResponsesGenerated);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("number_of_responses_generated"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfCustomResponses);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("number_of_custom_responses"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfRobotResponses);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("number_of_robot_responses"));

  }
LABEL_7:
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experiment_id"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v3, "setObject:forKey:", treatmentId, CFSTR("treatment_id"));
  treatmentModelName = self->_treatmentModelName;
  if (treatmentModelName)
    objc_msgSend(v3, "setObject:forKey:", treatmentModelName, CFSTR("treatment_model_name"));
  hostProcess = self->_hostProcess;
  if (hostProcess)
    objc_msgSend(v3, "setObject:forKey:", hostProcess, CFSTR("host_process"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  lang = self->_lang;
  if (lang)
    objc_msgSend(v3, "setObject:forKey:", lang, CFSTR("lang"));
  v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isApricotDevice);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("is_apricot_device"));

    v12 = (char)self->_has;
  }
  if ((v12 & 1) != 0)
  {
    ageGroup = self->_ageGroup;
    if (ageGroup >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ageGroup);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E7D9E028[ageGroup];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("age_group"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PREAMResponseListGeneratedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentModelName)
    PBDataWriterWriteStringField();
  if (self->_hostProcess)
    PBDataWriterWriteStringField();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if (self->_lang)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  char v6;
  _BYTE *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[89] = self->_isCached;
    v4[92] |= 0x40u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_generationStatus;
  v4[92] |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 15) = self->_numberOfResponsesGenerated;
  v4[92] |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_27:
  *((_DWORD *)v4 + 14) = self->_numberOfCustomResponses;
  v4[92] |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 16) = self->_numberOfRobotResponses;
    v4[92] |= 0x10u;
  }
LABEL_7:
  v7 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    v4 = v7;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v7, "setTreatmentId:");
    v4 = v7;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v7, "setTreatmentModelName:");
    v4 = v7;
  }
  if (self->_hostProcess)
  {
    objc_msgSend(v7, "setHostProcess:");
    v4 = v7;
  }
  if (self->_locale)
  {
    objc_msgSend(v7, "setLocale:");
    v4 = v7;
  }
  if (self->_lang)
  {
    objc_msgSend(v7, "setLang:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[88] = self->_isApricotDevice;
    v4[92] |= 0x20u;
    v6 = (char)self->_has;
  }
  if ((v6 & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_ageGroup;
    v4[92] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 89) = self->_isCached;
    *(_BYTE *)(v5 + 92) |= 0x40u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_generationStatus;
  *(_BYTE *)(v5 + 92) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 60) = self->_numberOfResponsesGenerated;
  *(_BYTE *)(v5 + 92) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *(_DWORD *)(v5 + 56) = self->_numberOfCustomResponses;
  *(_BYTE *)(v5 + 92) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 64) = self->_numberOfRobotResponses;
    *(_BYTE *)(v5 + 92) |= 0x10u;
  }
LABEL_7:
  v8 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v10;

  v12 = -[NSString copyWithZone:](self->_treatmentModelName, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v12;

  v14 = -[NSString copyWithZone:](self->_hostProcess, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v16;

  v18 = -[NSString copyWithZone:](self->_lang, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v18;

  v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 88) = self->_isApricotDevice;
    *(_BYTE *)(v6 + 92) |= 0x20u;
    v20 = (char)self->_has;
  }
  if ((v20 & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_ageGroup;
    *(_BYTE *)(v6 + 92) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x40) == 0)
      goto LABEL_54;
    if (self->_isCached)
    {
      if (!*((_BYTE *)v4 + 89))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 89))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_generationStatus != *((_DWORD *)v4 + 6))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0 || self->_numberOfResponsesGenerated != *((_DWORD *)v4 + 15))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_numberOfCustomResponses != *((_DWORD *)v4 + 14))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) == 0 || self->_numberOfRobotResponses != *((_DWORD *)v4 + 16))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_54;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_54;
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:"))
      goto LABEL_54;
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:"))
      goto LABEL_54;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_54;
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](lang, "isEqual:"))
      goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x20) != 0)
    {
      if (self->_isApricotDevice)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_54;
        goto LABEL_50;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_50;
    }
LABEL_54:
    v11 = 0;
    goto LABEL_55;
  }
  if ((*((_BYTE *)v4 + 92) & 0x20) != 0)
    goto LABEL_54;
LABEL_50:
  v11 = (*((_BYTE *)v4 + 92) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2))
      goto LABEL_54;
    v11 = 1;
  }
LABEL_55:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v17 = 2654435761 * self->_isCached;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_generationStatus;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v15 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v3 = 2654435761 * self->_numberOfResponsesGenerated;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v4 = 2654435761 * self->_numberOfCustomResponses;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_numberOfRobotResponses;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
LABEL_12:
  v6 = -[NSString hash](self->_experimentId, "hash", v15);
  v7 = -[NSString hash](self->_treatmentId, "hash");
  v8 = -[NSString hash](self->_treatmentModelName, "hash");
  v9 = -[NSString hash](self->_hostProcess, "hash");
  v10 = -[NSString hash](self->_locale, "hash");
  v11 = -[NSString hash](self->_lang, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v12 = 2654435761 * self->_isApricotDevice;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_14;
LABEL_16:
    v13 = 0;
    return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_14:
  v13 = 2654435761 * self->_ageGroup;
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 92);
  if ((v5 & 0x40) != 0)
  {
    self->_isCached = *((_BYTE *)v4 + 89);
    *(_BYTE *)&self->_has |= 0x40u;
    v5 = *((_BYTE *)v4 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_generationStatus = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 92);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_numberOfResponsesGenerated = *((_DWORD *)v4 + 15);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 92);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_27:
  self->_numberOfCustomResponses = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
LABEL_6:
    self->_numberOfRobotResponses = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PREAMResponseListGenerated setExperimentId:](self, "setExperimentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PREAMResponseListGenerated setTreatmentId:](self, "setTreatmentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PREAMResponseListGenerated setTreatmentModelName:](self, "setTreatmentModelName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PREAMResponseListGenerated setHostProcess:](self, "setHostProcess:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PREAMResponseListGenerated setLocale:](self, "setLocale:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PREAMResponseListGenerated setLang:](self, "setLang:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 92);
  if ((v6 & 0x20) != 0)
  {
    self->_isApricotDevice = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 92);
  }
  if ((v6 & 1) != 0)
  {
    self->_ageGroup = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)isCached
{
  return self->_isCached;
}

- (unsigned)numberOfResponsesGenerated
{
  return self->_numberOfResponsesGenerated;
}

- (unsigned)numberOfCustomResponses
{
  return self->_numberOfCustomResponses;
}

- (unsigned)numberOfRobotResponses
{
  return self->_numberOfRobotResponses;
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

- (NSString)treatmentModelName
{
  return self->_treatmentModelName;
}

- (void)setTreatmentModelName:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentModelName, a3);
}

- (NSString)hostProcess
{
  return self->_hostProcess;
}

- (void)setHostProcess:(id)a3
{
  objc_storeStrong((id *)&self->_hostProcess, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)lang
{
  return self->_lang;
}

- (void)setLang:(id)a3
{
  objc_storeStrong((id *)&self->_lang, a3);
}

- (BOOL)isApricotDevice
{
  return self->_isApricotDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
