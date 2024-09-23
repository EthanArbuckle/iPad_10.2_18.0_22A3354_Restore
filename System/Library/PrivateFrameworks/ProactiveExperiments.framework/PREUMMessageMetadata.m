@implementation PREUMMessageMetadata

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
  *(_BYTE *)&self->_has |= 8u;
  self->_isApricotDevice = a3;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsApricotDevice
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCharCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_charCount = a3;
}

- (void)setHasCharCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCharCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
    return *(&off_1E7D9DF50 + a3);
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
  *(_BYTE *)&self->_has |= 4u;
  self->_hasQuestionMark = a3;
}

- (void)setHasHasQuestionMark:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasQuestionMark
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)PREUMMessageMetadata;
  -[PREUMMessageMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREUMMessageMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  char has;
  void *v9;
  void *v11;
  void *v12;
  uint64_t ageGroup;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  hostProcess = self->_hostProcess;
  if (hostProcess)
    objc_msgSend(v3, "setObject:forKey:", hostProcess, CFSTR("host_process"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v4, "setObject:forKey:", locale, CFSTR("locale"));
  lang = self->_lang;
  if (lang)
    objc_msgSend(v4, "setObject:forKey:", lang, CFSTR("lang"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isApricotDevice);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("is_apricot_device"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      ageGroup = self->_ageGroup;
      if (ageGroup >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ageGroup);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = *(&off_1E7D9DF50 + ageGroup);
      }
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("age_group"));

      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_11;
      return v4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_charCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("char_count"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasQuestionMark);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("has_question_mark"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PREUMMessageMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_hostProcess)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_lang)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteInt32Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_hostProcess)
  {
    objc_msgSend(v4, "setHostProcess:");
    v4 = v6;
  }
  if (self->_locale)
  {
    objc_msgSend(v6, "setLocale:");
    v4 = v6;
  }
  if (self->_lang)
  {
    objc_msgSend(v6, "setLang:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 41) = self->_isApricotDevice;
    *((_BYTE *)v4 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      *((_DWORD *)v4 + 2) = self->_ageGroup;
      *((_BYTE *)v4 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 3) = self->_charCount;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 40) = self->_hasQuestionMark;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_12:

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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_hostProcess, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_lang, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 41) = self->_isApricotDevice;
    *(_BYTE *)(v5 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 8) = self->_ageGroup;
      *(_BYTE *)(v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_charCount;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 40) = self->_hasQuestionMark;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *hostProcess;
  NSString *locale;
  NSString *lang;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:"))
      goto LABEL_28;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_28;
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](lang, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
      goto LABEL_28;
    if (self->_isApricotDevice)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_charCount != *((_DWORD *)v4 + 3))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_28;
  }
  v8 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) != 0)
    {
      if (self->_hasQuestionMark)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_28;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_28;
      }
      v8 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v8 = 0;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_hostProcess, "hash");
  v4 = -[NSString hash](self->_locale, "hash");
  v5 = -[NSString hash](self->_lang, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_isApricotDevice;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_charCount;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761 * self->_ageGroup;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v9 = 2654435761 * self->_hasQuestionMark;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PREUMMessageMetadata setHostProcess:](self, "setHostProcess:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PREUMMessageMetadata setLocale:](self, "setLocale:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PREUMMessageMetadata setLang:](self, "setLang:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_isApricotDevice = *((_BYTE *)v4 + 41);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
LABEL_15:
      self->_ageGroup = *((_DWORD *)v4 + 2);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 44) & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_charCount = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v5 & 4) != 0)
  {
LABEL_11:
    self->_hasQuestionMark = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:

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

- (unsigned)charCount
{
  return self->_charCount;
}

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);
}

@end
