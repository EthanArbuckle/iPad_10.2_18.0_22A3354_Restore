@implementation PREAMResponseItem

- (void)setModelId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modelId = a3;
}

- (void)setHasModelId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModelId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setResponseClassId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_responseClassId = a3;
}

- (void)setHasResponseClassId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResponseClassId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setReplyTextId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_replyTextId = a3;
}

- (void)setHasReplyTextId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReplyTextId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPosition:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPosition
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
    return off_1E7D9E228[a3];
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

- (void)setIsCustomResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isCustomResponse = a3;
}

- (void)setHasIsCustomResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsCustomResponse
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsRobotResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isRobotResponse = a3;
}

- (void)setHasIsRobotResponse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsRobotResponse
{
  return *(_BYTE *)&self->_has >> 7;
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
  v8.super_class = (Class)PREAMResponseItem;
  -[PREAMResponseItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREAMResponseItem dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t ageGroup;
  __CFString *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_modelId);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("model_id"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_responseClassId);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("response_class_id"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_replyTextId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("reply_text_id"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_position);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("position"));

  }
LABEL_6:
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
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("is_apricot_device"));

    v12 = (char)self->_has;
    if ((v12 & 1) == 0)
    {
LABEL_20:
      if ((v12 & 0x40) == 0)
        goto LABEL_21;
LABEL_32:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCustomResponse);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("is_custom_response"));

      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        return v3;
LABEL_33:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRobotResponse);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("is_robot_response"));

      return v3;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  ageGroup = self->_ageGroup;
  if (ageGroup >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ageGroup);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E7D9E228[ageGroup];
  }
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("age_group"));

  v12 = (char)self->_has;
  if ((v12 & 0x40) != 0)
    goto LABEL_32;
LABEL_21:
  if (v12 < 0)
    goto LABEL_33;
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PREAMResponseItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
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
    if ((v5 & 1) == 0)
    {
LABEL_20:
      if ((v5 & 0x40) == 0)
        goto LABEL_21;
LABEL_29:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_22;
LABEL_30:
      PBDataWriterWriteBOOLField();
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteInt32Field();
  v5 = (char)self->_has;
  if ((v5 & 0x40) != 0)
    goto LABEL_29;
LABEL_21:
  if (v5 < 0)
    goto LABEL_30;
LABEL_22:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_modelId;
    *((_BYTE *)v4 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[15] = self->_responseClassId;
  *((_BYTE *)v4 + 84) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  v4[14] = self->_replyTextId;
  *((_BYTE *)v4 + 84) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[13] = self->_position;
    *((_BYTE *)v4 + 84) |= 4u;
  }
LABEL_6:
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
    *((_BYTE *)v4 + 80) = self->_isApricotDevice;
    *((_BYTE *)v4 + 84) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_20:
      if ((v6 & 0x40) == 0)
        goto LABEL_21;
LABEL_29:
      *((_BYTE *)v4 + 81) = self->_isCustomResponse;
      *((_BYTE *)v4 + 84) |= 0x40u;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_22;
LABEL_30:
      *((_BYTE *)v4 + 82) = self->_isRobotResponse;
      *((_BYTE *)v4 + 84) |= 0x80u;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  v4[2] = self->_ageGroup;
  *((_BYTE *)v4 + 84) |= 1u;
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
    goto LABEL_29;
LABEL_21:
  if (v6 < 0)
    goto LABEL_30;
LABEL_22:

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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_modelId;
    *(_BYTE *)(v5 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_responseClassId;
  *(_BYTE *)(v5 + 84) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *(_DWORD *)(v5 + 56) = self->_replyTextId;
  *(_BYTE *)(v5 + 84) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 52) = self->_position;
    *(_BYTE *)(v5 + 84) |= 4u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_treatmentModelName, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_hostProcess, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v14;

  v16 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v16;

  v18 = -[NSString copyWithZone:](self->_lang, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v18;

  v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_isApricotDevice;
    *(_BYTE *)(v6 + 84) |= 0x20u;
    v20 = (char)self->_has;
    if ((v20 & 1) == 0)
    {
LABEL_8:
      if ((v20 & 0x40) == 0)
        goto LABEL_9;
LABEL_17:
      *(_BYTE *)(v6 + 81) = self->_isCustomResponse;
      *(_BYTE *)(v6 + 84) |= 0x40u;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        return (id)v6;
LABEL_18:
      *(_BYTE *)(v6 + 82) = self->_isRobotResponse;
      *(_BYTE *)(v6 + 84) |= 0x80u;
      return (id)v6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 8) = self->_ageGroup;
  *(_BYTE *)(v6 + 84) |= 1u;
  v20 = (char)self->_has;
  if ((v20 & 0x40) != 0)
    goto LABEL_17;
LABEL_9:
  if (v20 < 0)
    goto LABEL_18;
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  BOOL v11;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[84] & 2) == 0 || self->_modelId != *((_DWORD *)v4 + 12))
      goto LABEL_58;
  }
  else if ((v4[84] & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[84] & 0x10) == 0 || self->_responseClassId != *((_DWORD *)v4 + 15))
      goto LABEL_58;
  }
  else if ((v4[84] & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[84] & 8) == 0 || self->_replyTextId != *((_DWORD *)v4 + 14))
      goto LABEL_58;
  }
  else if ((v4[84] & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[84] & 4) == 0 || self->_position != *((_DWORD *)v4 + 13))
      goto LABEL_58;
  }
  else if ((v4[84] & 4) != 0)
  {
    goto LABEL_58;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_58;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_58;
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:"))
      goto LABEL_58;
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:"))
      goto LABEL_58;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_58;
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](lang, "isEqual:"))
      goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[84] & 0x20) == 0)
      goto LABEL_58;
    if (self->_isApricotDevice)
    {
      if (!v4[80])
        goto LABEL_58;
    }
    else if (v4[80])
    {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[84] & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2))
      goto LABEL_58;
  }
  else if ((v4[84] & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[84] & 0x40) == 0)
      goto LABEL_58;
    if (self->_isCustomResponse)
    {
      if (!v4[81])
        goto LABEL_58;
    }
    else if (v4[81])
    {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 0x40) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if (v4[84] < 0)
    {
      if (self->_isRobotResponse)
      {
        if (!v4[82])
          goto LABEL_58;
      }
      else if (v4[82])
      {
        goto LABEL_58;
      }
      v11 = 1;
      goto LABEL_59;
    }
LABEL_58:
    v11 = 0;
    goto LABEL_59;
  }
  v11 = v4[84] >= 0;
LABEL_59:

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
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_modelId;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_responseClassId;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_replyTextId;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v17 = 2654435761 * self->_position;
    goto LABEL_10;
  }
LABEL_9:
  v17 = 0;
LABEL_10:
  v6 = -[NSString hash](self->_experimentId, "hash");
  v7 = -[NSString hash](self->_treatmentId, "hash");
  v8 = -[NSString hash](self->_treatmentModelName, "hash");
  v9 = -[NSString hash](self->_hostProcess, "hash");
  v10 = -[NSString hash](self->_locale, "hash");
  v11 = -[NSString hash](self->_lang, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v12 = 2654435761 * self->_isApricotDevice;
  else
    v12 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_15;
LABEL_18:
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_16;
LABEL_19:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v17 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
  v13 = 2654435761 * self->_ageGroup;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_18;
LABEL_15:
  v14 = 2654435761 * self->_isCustomResponse;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_19;
LABEL_16:
  v15 = 2654435761 * self->_isRobotResponse;
  return v4 ^ v3 ^ v5 ^ v17 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 2) != 0)
  {
    self->_modelId = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 84);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_responseClassId = *((_DWORD *)v4 + 15);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  self->_replyTextId = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
LABEL_5:
    self->_position = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PREAMResponseItem setExperimentId:](self, "setExperimentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[PREAMResponseItem setTreatmentId:](self, "setTreatmentId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PREAMResponseItem setTreatmentModelName:](self, "setTreatmentModelName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PREAMResponseItem setHostProcess:](self, "setHostProcess:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PREAMResponseItem setLocale:](self, "setLocale:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PREAMResponseItem setLang:](self, "setLang:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 84);
  if ((v6 & 0x20) != 0)
  {
    self->_isApricotDevice = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 84);
    if ((v6 & 1) == 0)
    {
LABEL_20:
      if ((v6 & 0x40) == 0)
        goto LABEL_21;
LABEL_29:
      self->_isCustomResponse = *((_BYTE *)v4 + 81);
      *(_BYTE *)&self->_has |= 0x40u;
      if ((*((_BYTE *)v4 + 84) & 0x80) == 0)
        goto LABEL_22;
LABEL_30:
      self->_isRobotResponse = *((_BYTE *)v4 + 82);
      *(_BYTE *)&self->_has |= 0x80u;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 1) == 0)
  {
    goto LABEL_20;
  }
  self->_ageGroup = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 84);
  if ((v6 & 0x40) != 0)
    goto LABEL_29;
LABEL_21:
  if (v6 < 0)
    goto LABEL_30;
LABEL_22:

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
