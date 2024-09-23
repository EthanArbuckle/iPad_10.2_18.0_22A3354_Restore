@implementation PREAMEngagedResponse

- (void)setModelId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_modelId = a3;
}

- (void)setHasModelId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasModelId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResponseClassId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_responseClassId = a3;
}

- (void)setHasResponseClassId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasResponseClassId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setReplyTextId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_replyTextId = a3;
}

- (void)setHasReplyTextId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasReplyTextId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPosition:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPosition
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)inputMethod
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_inputMethod;
  else
    return 0;
}

- (void)setInputMethod:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_inputMethod = a3;
}

- (void)setHasInputMethod:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInputMethod
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)inputMethodAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7D9DE18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInputMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("METHOD_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANNED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCRIBBLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DICTATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMOJI")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HEART")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)generationStatus
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_generationStatus;
  else
    return 0;
}

- (void)setGenerationStatus:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_generationStatus = a3;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)generationStatusAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7D9DE48[a3];
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
  *(_WORD *)&self->_has |= 0x20u;
  self->_numberOfResponsesGenerated = a3;
}

- (void)setHasNumberOfResponsesGenerated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumberOfResponsesGenerated
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumberOfCustomResponses:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numberOfCustomResponses = a3;
}

- (void)setHasNumberOfCustomResponses:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumberOfCustomResponses
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumberOfRobotResponses:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numberOfRobotResponses = a3;
}

- (void)setHasNumberOfRobotResponses:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumberOfRobotResponses
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
  *(_WORD *)&self->_has |= 0x800u;
  self->_isApricotDevice = a3;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsApricotDevice
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)ageGroup
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_ageGroup;
  else
    return 0;
}

- (void)setAgeGroup:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ageGroup = a3;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAgeGroup
{
  return *(_WORD *)&self->_has & 1;
}

- (id)ageGroupAsString:(int)a3
{
  if (a3 < 7)
    return off_1E7D9DE78[a3];
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

- (void)setHasQuestionMark:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasQuestionMark = a3;
}

- (void)setHasHasQuestionMark:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasHasQuestionMark
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsCustomResponse:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isCustomResponse = a3;
}

- (void)setHasIsCustomResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsCustomResponse
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setIsRobotResponse:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isRobotResponse = a3;
}

- (void)setHasIsRobotResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsRobotResponse
{
  return (*(_WORD *)&self->_has >> 13) & 1;
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
  v8.super_class = (Class)PREAMEngagedResponse;
  -[PREAMEngagedResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREAMEngagedResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  __int16 v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t inputMethod;
  __CFString *v20;
  void *v21;
  uint64_t ageGroup;
  __CFString *v23;
  uint64_t generationStatus;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_modelId);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("model_id"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_responseClassId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("response_class_id"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_replyTextId);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("reply_text_id"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_position);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("position"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_34:
  inputMethod = self->_inputMethod;
  if (inputMethod >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_inputMethod);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E7D9DE18[inputMethod];
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("input_method"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_50;
  }
LABEL_41:
  generationStatus = self->_generationStatus;
  if (generationStatus >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_generationStatus);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E7D9DE48[generationStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("generation_status"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfResponsesGenerated);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("number_of_responses_generated"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfCustomResponses);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("number_of_custom_responses"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfRobotResponses);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("number_of_robot_responses"));

  }
LABEL_11:
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
  v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isApricotDevice);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("is_apricot_device"));

    v12 = (__int16)self->_has;
    if ((v12 & 1) == 0)
    {
LABEL_25:
      if ((v12 & 0x400) == 0)
        goto LABEL_26;
      goto LABEL_45;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_25;
  }
  ageGroup = self->_ageGroup;
  if (ageGroup >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ageGroup);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E7D9DE78[ageGroup];
  }
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("age_group"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_26:
    if ((v12 & 0x1000) == 0)
      goto LABEL_27;
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCustomResponse);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("is_custom_response"));

    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      return v3;
    goto LABEL_28;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasQuestionMark);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("has_question_mark"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x1000) != 0)
    goto LABEL_46;
LABEL_27:
  if ((v12 & 0x2000) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRobotResponse);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("is_robot_response"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PREAMEngagedResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  id v6;

  v6 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
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
  v5 = (__int16)self->_has;
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_25:
      if ((v5 & 0x400) == 0)
        goto LABEL_26;
      goto LABEL_41;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x400) == 0)
  {
LABEL_26:
    if ((v5 & 0x1000) == 0)
      goto LABEL_27;
LABEL_42:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x1000) != 0)
    goto LABEL_42;
LABEL_27:
  if ((v5 & 0x2000) != 0)
LABEL_28:
    PBDataWriterWriteBOOLField();
LABEL_29:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  _DWORD *v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[16] = self->_modelId;
    *((_WORD *)v4 + 58) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v4[22] = self->_responseClassId;
  *((_WORD *)v4 + 58) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  v4[21] = self->_replyTextId;
  *((_WORD *)v4 + 58) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  v4[20] = self->_position;
  *((_WORD *)v4 + 58) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  v4[10] = self->_inputMethod;
  *((_WORD *)v4 + 58) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  v4[6] = self->_generationStatus;
  *((_WORD *)v4 + 58) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  v4[18] = self->_numberOfResponsesGenerated;
  *((_WORD *)v4 + 58) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_37:
  v4[17] = self->_numberOfCustomResponses;
  *((_WORD *)v4 + 58) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v4[19] = self->_numberOfRobotResponses;
    *((_WORD *)v4 + 58) |= 0x40u;
  }
LABEL_11:
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
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((_BYTE *)v4 + 113) = self->_isApricotDevice;
    *((_WORD *)v4 + 58) |= 0x800u;
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_25:
      if ((v6 & 0x400) == 0)
        goto LABEL_26;
      goto LABEL_41;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_25;
  }
  v4[2] = self->_ageGroup;
  *((_WORD *)v4 + 58) |= 1u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000) == 0)
      goto LABEL_27;
LABEL_42:
    *((_BYTE *)v4 + 114) = self->_isCustomResponse;
    *((_WORD *)v4 + 58) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_41:
  *((_BYTE *)v4 + 112) = self->_hasQuestionMark;
  *((_WORD *)v4 + 58) |= 0x400u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
    goto LABEL_42;
LABEL_27:
  if ((v6 & 0x2000) != 0)
  {
LABEL_28:
    *((_BYTE *)v4 + 115) = self->_isRobotResponse;
    *((_WORD *)v4 + 58) |= 0x2000u;
  }
LABEL_29:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
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
  __int16 v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_modelId;
    *(_WORD *)(v5 + 116) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 88) = self->_responseClassId;
  *(_WORD *)(v5 + 116) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 84) = self->_replyTextId;
  *(_WORD *)(v5 + 116) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 80) = self->_position;
  *(_WORD *)(v5 + 116) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 40) = self->_inputMethod;
  *(_WORD *)(v5 + 116) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 24) = self->_generationStatus;
  *(_WORD *)(v5 + 116) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 72) = self->_numberOfResponsesGenerated;
  *(_WORD *)(v5 + 116) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_25:
  *(_DWORD *)(v5 + 68) = self->_numberOfCustomResponses;
  *(_WORD *)(v5 + 116) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 76) = self->_numberOfRobotResponses;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
LABEL_11:
  v8 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v10;

  v12 = -[NSString copyWithZone:](self->_treatmentModelName, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v12;

  v14 = -[NSString copyWithZone:](self->_hostProcess, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_lang, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v18;

  v20 = (__int16)self->_has;
  if ((v20 & 0x800) != 0)
  {
    *(_BYTE *)(v6 + 113) = self->_isApricotDevice;
    *(_WORD *)(v6 + 116) |= 0x800u;
    v20 = (__int16)self->_has;
    if ((v20 & 1) == 0)
    {
LABEL_13:
      if ((v20 & 0x400) == 0)
        goto LABEL_14;
      goto LABEL_29;
    }
  }
  else if ((v20 & 1) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 8) = self->_ageGroup;
  *(_WORD *)(v6 + 116) |= 1u;
  v20 = (__int16)self->_has;
  if ((v20 & 0x400) == 0)
  {
LABEL_14:
    if ((v20 & 0x1000) == 0)
      goto LABEL_15;
LABEL_30:
    *(_BYTE *)(v6 + 114) = self->_isCustomResponse;
    *(_WORD *)(v6 + 116) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      return (id)v6;
    goto LABEL_16;
  }
LABEL_29:
  *(_BYTE *)(v6 + 112) = self->_hasQuestionMark;
  *(_WORD *)(v6 + 116) |= 0x400u;
  v20 = (__int16)self->_has;
  if ((v20 & 0x1000) != 0)
    goto LABEL_30;
LABEL_15:
  if ((v20 & 0x2000) != 0)
  {
LABEL_16:
    *(_BYTE *)(v6 + 115) = self->_isRobotResponse;
    *(_WORD *)(v6 + 116) |= 0x2000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  __int16 v13;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_91;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 58);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_modelId != *((_DWORD *)v4 + 16))
      goto LABEL_91;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0 || self->_responseClassId != *((_DWORD *)v4 + 22))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_replyTextId != *((_DWORD *)v4 + 21))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_position != *((_DWORD *)v4 + 20))
      goto LABEL_91;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_inputMethod != *((_DWORD *)v4 + 10))
      goto LABEL_91;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_generationStatus != *((_DWORD *)v4 + 6))
      goto LABEL_91;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numberOfResponsesGenerated != *((_DWORD *)v4 + 18))
      goto LABEL_91;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numberOfCustomResponses != *((_DWORD *)v4 + 17))
      goto LABEL_91;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numberOfRobotResponses != *((_DWORD *)v4 + 19))
      goto LABEL_91;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_91;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_91;
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:"))
      goto LABEL_91;
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:"))
      goto LABEL_91;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_91;
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](lang, "isEqual:"))
      goto LABEL_91;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 58);
  if ((v13 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x800) == 0)
      goto LABEL_91;
    if (self->_isApricotDevice)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x800) != 0)
  {
    goto LABEL_91;
  }
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2))
      goto LABEL_91;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x400) == 0)
      goto LABEL_91;
    if (self->_hasQuestionMark)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x1000) == 0)
      goto LABEL_91;
    if (self->_isCustomResponse)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x2000) != 0)
    {
      if (self->_isRobotResponse)
      {
        if (!*((_BYTE *)v4 + 115))
          goto LABEL_91;
      }
      else if (*((_BYTE *)v4 + 115))
      {
        goto LABEL_91;
      }
      v15 = 1;
      goto LABEL_92;
    }
LABEL_91:
    v15 = 0;
    goto LABEL_92;
  }
  v15 = (v14 & 0x2000) == 0;
LABEL_92:

  return v15;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v25 = 2654435761 * self->_modelId;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_responseClassId;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v25 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v24 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v23 = 2654435761 * self->_replyTextId;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v22 = 2654435761 * self->_position;
    if ((has & 4) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v22 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    v21 = 2654435761 * self->_inputMethod;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v21 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v20 = 2654435761 * self->_generationStatus;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v20 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v19 = 2654435761 * self->_numberOfResponsesGenerated;
    if ((has & 0x10) != 0)
      goto LABEL_9;
LABEL_18:
    v4 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v19 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_18;
LABEL_9:
  v4 = 2654435761 * self->_numberOfCustomResponses;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    v5 = 2654435761 * self->_numberOfRobotResponses;
    goto LABEL_20;
  }
LABEL_19:
  v5 = 0;
LABEL_20:
  v6 = -[NSString hash](self->_experimentId, "hash");
  v7 = -[NSString hash](self->_treatmentId, "hash");
  v8 = -[NSString hash](self->_treatmentModelName, "hash");
  v9 = -[NSString hash](self->_hostProcess, "hash");
  v10 = -[NSString hash](self->_locale, "hash");
  v11 = -[NSString hash](self->_lang, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    v13 = 2654435761 * self->_isApricotDevice;
    if ((v12 & 1) != 0)
    {
LABEL_22:
      v14 = 2654435761 * self->_ageGroup;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_23;
      goto LABEL_28;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 1) != 0)
      goto LABEL_22;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_23:
    v15 = 2654435761 * self->_hasQuestionMark;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_24;
LABEL_29:
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_25;
LABEL_30:
    v17 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_28:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_29;
LABEL_24:
  v16 = 2654435761 * self->_isCustomResponse;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_30;
LABEL_25:
  v17 = 2654435761 * self->_isRobotResponse;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 8) != 0)
  {
    self->_modelId = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_responseClassId = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  self->_replyTextId = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  self->_position = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  self->_inputMethod = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  self->_generationStatus = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  self->_numberOfResponsesGenerated = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_37:
  self->_numberOfCustomResponses = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 58) & 0x40) != 0)
  {
LABEL_10:
    self->_numberOfRobotResponses = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_11:
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PREAMEngagedResponse setExperimentId:](self, "setExperimentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PREAMEngagedResponse setTreatmentId:](self, "setTreatmentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[PREAMEngagedResponse setTreatmentModelName:](self, "setTreatmentModelName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PREAMEngagedResponse setHostProcess:](self, "setHostProcess:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PREAMEngagedResponse setLocale:](self, "setLocale:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PREAMEngagedResponse setLang:](self, "setLang:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x800) != 0)
  {
    self->_isApricotDevice = *((_BYTE *)v4 + 113);
    *(_WORD *)&self->_has |= 0x800u;
    v6 = *((_WORD *)v4 + 58);
    if ((v6 & 1) == 0)
    {
LABEL_25:
      if ((v6 & 0x400) == 0)
        goto LABEL_26;
      goto LABEL_41;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_25;
  }
  self->_ageGroup = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x400) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000) == 0)
      goto LABEL_27;
LABEL_42:
    self->_isCustomResponse = *((_BYTE *)v4 + 114);
    *(_WORD *)&self->_has |= 0x1000u;
    if ((*((_WORD *)v4 + 58) & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_41:
  self->_hasQuestionMark = *((_BYTE *)v4 + 112);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x1000) != 0)
    goto LABEL_42;
LABEL_27:
  if ((v6 & 0x2000) != 0)
  {
LABEL_28:
    self->_isRobotResponse = *((_BYTE *)v4 + 115);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_29:

}

- (unsigned)modelId
{
  return self->_modelId;
}

- (unsigned)responseClassId
{
  return self->_responseClassId;
}

- (unsigned)replyTextId
{
  return self->_replyTextId;
}

- (unsigned)position
{
  return self->_position;
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

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (BOOL)isCustomResponse
{
  return self->_isCustomResponse;
}

- (BOOL)isRobotResponse
{
  return self->_isRobotResponse;
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
